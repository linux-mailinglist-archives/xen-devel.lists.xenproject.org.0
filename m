Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7E35832B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107266.205065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTet-00050G-O6; Thu, 08 Apr 2021 12:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107266.205065; Thu, 08 Apr 2021 12:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTet-0004zr-KW; Thu, 08 Apr 2021 12:21:15 +0000
Received: by outflank-mailman (input) for mailman id 107266;
 Thu, 08 Apr 2021 12:21:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTes-0004zj-Vc
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:21:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76f69303-e529-4e9f-be2a-5819f072873d;
 Thu, 08 Apr 2021 12:21:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 783CCB005;
 Thu,  8 Apr 2021 12:21:13 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 76f69303-e529-4e9f-be2a-5819f072873d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95K+5XUUtlkYqbXmQ6a5fXeN2FQDprpFs5vXWIcZVZg=;
	b=S9waDlL3HqvdRuOGtWJksVXo0t/AWmRdrboRuIw4xSAqDnTOnG4ob4TDErr4RliklvWgG6
	Yh8WAQ13IqaSkqp3oq9jBS/nvNHXRAkAnud4v2DXIrkCfaZibMILpLSFjF/k/Xbyk8q+wF
	o03tS4X5ymR8WENgliRv5EGkTKWLmho=
Subject: [PATCH 08/11] hypfs: avoid effectively open-coding xzalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <eecf9929-30ee-424d-a371-1462c04cd382@suse.com>
Date: Thu, 8 Apr 2021 14:21:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

To avoid the need to add a cast, do away with the only forward-declared
struct hypfs_dyndata.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -72,7 +72,7 @@ enum hypfs_lock_state {
     hypfs_write_locked
 };
 static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
-static DEFINE_PER_CPU(struct hypfs_dyndata *, hypfs_dyndata);
+static DEFINE_PER_CPU(void *, hypfs_dyndata);
 
 static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_entered);
 
@@ -160,19 +160,19 @@ static void node_exit_all(void)
 void *hypfs_alloc_dyndata(unsigned long size)
 {
     unsigned int cpu = smp_processor_id();
-    struct hypfs_dyndata **dyndata = &per_cpu(hypfs_dyndata, cpu);
+    void **dyndata = &per_cpu(hypfs_dyndata, cpu);
 
     ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
     ASSERT(*dyndata == NULL);
 
-    *dyndata = xzalloc_bytes(size);
+    *dyndata = xzalloc_array(unsigned char, size);
 
     return *dyndata;
 }
 
 void *hypfs_get_dyndata(void)
 {
-    struct hypfs_dyndata *dyndata = this_cpu(hypfs_dyndata);
+    void *dyndata = this_cpu(hypfs_dyndata);
 
     ASSERT(dyndata);
 
@@ -181,7 +181,7 @@ void *hypfs_get_dyndata(void)
 
 void hypfs_free_dyndata(void)
 {
-    struct hypfs_dyndata **dyndata = &this_cpu(hypfs_dyndata);
+    void **dyndata = &this_cpu(hypfs_dyndata);
 
     XFREE(*dyndata);
 }


