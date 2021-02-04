Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898C30EFC6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 10:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81192.149548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7b3b-00079Y-0d; Thu, 04 Feb 2021 09:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81192.149548; Thu, 04 Feb 2021 09:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7b3a-000799-Tg; Thu, 04 Feb 2021 09:36:10 +0000
Received: by outflank-mailman (input) for mailman id 81192;
 Thu, 04 Feb 2021 09:36:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7b3Z-000794-3j
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:36:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 559ac284-2077-457e-8b54-c2069740b797;
 Thu, 04 Feb 2021 09:36:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF5E4AC97;
 Thu,  4 Feb 2021 09:36:06 +0000 (UTC)
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
X-Inumbo-ID: 559ac284-2077-457e-8b54-c2069740b797
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612431366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W8SxtxQ4Ttrtlh6kMq9Cjh6bi20t2gWEjxJPBHgcr/U=;
	b=WWXyqVm72x1U+TLG9qEN+4FPUIhDAbpXuU9AIqpWltcoNPIe06Pcyw/0iN3iGTx8uOY4Ea
	bJg/aMj54jFKsRegtWaDzU7HATvvlD1wTKcbMsSULdCd5n5u13KI/+B3U1tNs6AgxJztDp
	JlKXCiVy0fQBSXB81p1+2BqzYlfNdSI=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 James Dingwall <james-xen@dingwall.me.uk>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
Message-ID: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
Date: Thu, 4 Feb 2021 10:36:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

X86_VENDOR_* aren't bit masks in the older trees.

Reported-by: James Dingwall <james@dingwall.me.uk>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -226,7 +226,8 @@ int guest_rdmsr(const struct vcpu *v, ui
          */
     case MSR_IA32_PERF_STATUS:
     case MSR_IA32_PERF_CTL:
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+        if ( cp->x86_vendor != X86_VENDOR_INTEL &&
+             cp->x86_vendor != X86_VENDOR_CENTAUR )
             goto gp_fault;
 
         *val = 0;

