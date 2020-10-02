Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28328109B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1850.5594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIL1-00051E-QY; Fri, 02 Oct 2020 10:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1850.5594; Fri, 02 Oct 2020 10:30:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIL1-00050p-N3; Fri, 02 Oct 2020 10:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1850;
 Fri, 02 Oct 2020 10:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOIL0-00050W-07
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:30:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82d7ffb1-86d2-4717-a892-1a75c77587a9;
 Fri, 02 Oct 2020 10:30:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 942A6ACC6;
 Fri,  2 Oct 2020 10:30:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOIL0-00050W-07
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:30:54 +0000
X-Inumbo-ID: 82d7ffb1-86d2-4717-a892-1a75c77587a9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 82d7ffb1-86d2-4717-a892-1a75c77587a9;
	Fri, 02 Oct 2020 10:30:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601634652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3FZQmkdRu06gqB9XG31ZEpaiauw4LLfVKhdXDB89Ic=;
	b=uB1yAzRizYdzH/fcPcbtQBgHgliFUxIXcAG4QOlz8lf8yO0yFD47YAieG8TRv9xYSCdFtX
	VyQtBixaM2/5VgeHu/EMUONoXk0hSAcMjGPkZrufkPAhD7zYqLD8cfyr6vPW05UQkci3qu
	T1w3wKsuNj5tEJmUxRK1FMXkgWuYdWM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 942A6ACC6;
	Fri,  2 Oct 2020 10:30:52 +0000 (UTC)
Subject: [PATCH 2/3] x86: fix resource leaks on arch_vcpu_create() error path
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Message-ID: <77106fd6-96c5-4a62-5eee-8a37660db550@suse.com>
Date: Fri, 2 Oct 2020 12:30:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

{hvm,pv}_vcpu_initialise() have always been meant to be the final
possible source of errors in arch_vcpu_create(), hence not requiring
any unrolling of what they've done on the error path. (Of course this
may change once the various involved paths all have become idempotent.)

But even beyond this aspect I think it is more logical to do policy
initialization ahead of the calling of these two functions, as they may
in principle want to access it.

Fixes: 4187f79dc718 ("x86/msr: introduce struct msr_vcpu_policy")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -569,6 +569,9 @@ int arch_vcpu_create(struct vcpu *v)
         vmce_init_vcpu(v);
 
         arch_vcpu_regs_init(v);
+
+        if ( (rc = init_vcpu_msr_policy(v)) )
+            goto fail;
     }
     else if ( (rc = xstate_alloc_save_area(v)) != 0 )
         return rc;
@@ -594,9 +597,6 @@ int arch_vcpu_create(struct vcpu *v)
     {
         vpmu_initialise(v);
 
-        if ( (rc = init_vcpu_msr_policy(v)) )
-            goto fail;
-
         cpuid_policy_updated(v);
     }
 


