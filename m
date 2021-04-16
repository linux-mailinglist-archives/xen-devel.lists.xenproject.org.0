Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB57361B38
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 10:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111609.213478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXJep-0003cO-DN; Fri, 16 Apr 2021 08:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111609.213478; Fri, 16 Apr 2021 08:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXJep-0003bz-9o; Fri, 16 Apr 2021 08:16:55 +0000
Received: by outflank-mailman (input) for mailman id 111609;
 Fri, 16 Apr 2021 08:16:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXJeo-0003bu-1I
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 08:16:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8abe918f-21f7-473b-ad69-12215b15f60b;
 Fri, 16 Apr 2021 08:16:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 581E7ABB1;
 Fri, 16 Apr 2021 08:16:52 +0000 (UTC)
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
X-Inumbo-ID: 8abe918f-21f7-473b-ad69-12215b15f60b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618561012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x0U9FHyUNigBHzYhsFpXIYxIwplEkdHqqAxiB5sYbdg=;
	b=gyaU5M517b4NPxx3APwSZ9bBQnplN2nRF7qGZMmIvF/4JhsqoeYLfx28okRR9wh7F39tgf
	T61du70Yh5Pui0hqN+8awa1FsR2VbL0SctULr/7Ya09PST2aO3EkSYhb2CaTvp3XVs6WMf
	pCIGhXVw+fa6sqLMmrKz/eaZKqcooh8=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/oprof: fix !HVM && !PV32 build
Message-ID: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
Date: Fri, 16 Apr 2021 10:16:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

clang, at the very least, doesn't like unused inline functions, unless
their definitions live in a header.

Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/oprofile/backtrace.c
+++ b/xen/arch/x86/oprofile/backtrace.c
@@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
     return head->ebp;
 }
 
+#ifdef CONFIG_COMPAT
 static inline int is_32bit_vcpu(struct vcpu *vcpu)
 {
     if (is_hvm_vcpu(vcpu))
@@ -50,6 +51,7 @@ static inline int is_32bit_vcpu(struct v
     else
         return is_pv_32bit_vcpu(vcpu);
 }
+#endif
 
 static struct frame_head *
 dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,

