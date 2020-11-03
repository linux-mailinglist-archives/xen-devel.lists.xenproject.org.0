Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FFA2A4395
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18250.43238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZu15-0005Zs-LC; Tue, 03 Nov 2020 10:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18250.43238; Tue, 03 Nov 2020 10:58:19 +0000
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
	id 1kZu15-0005ZR-Hm; Tue, 03 Nov 2020 10:58:19 +0000
Received: by outflank-mailman (input) for mailman id 18250;
 Tue, 03 Nov 2020 10:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZu13-0005ZA-TZ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:58:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4007d05e-76e6-4600-9784-edba02b9c6d9;
 Tue, 03 Nov 2020 10:58:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4BF9AC8C;
 Tue,  3 Nov 2020 10:58:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZu13-0005ZA-TZ
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:58:17 +0000
X-Inumbo-ID: 4007d05e-76e6-4600-9784-edba02b9c6d9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 4007d05e-76e6-4600-9784-edba02b9c6d9;
	Tue, 03 Nov 2020 10:58:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604401096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9sluiyHVwCFug4AwAJlFQ8aR4Cf8H0Ya34y3kuy2Mo=;
	b=C3ynvVrco/gurFNHp6ftuYtcaLcHxm7KFkeJBHVfSJ3BX8jQJIEEudeofRgArYkYtCrn2D
	WFBXmg94LarjaLN5OvxcmKXU6tj6ROgmYdGEqB8wZYr/GfPNt68i6HWJpzwrIMnjng1Uhf
	00Ef5QNorpMHb3neyyEyplbXyj6bNOc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D4BF9AC8C;
	Tue,  3 Nov 2020 10:58:16 +0000 (UTC)
Subject: [PATCH 5/5] x86/PV32: avoid TLB flushing after mod_l3_entry()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <181be414-49b4-3bd3-bb55-cef443191e60@suse.com>
Date: Tue, 3 Nov 2020 11:58:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

32-bit guests may not depend upon the side effect of using ordinary
4-level paging when running on a 64-bit hypervisor. For L3 entry updates
to take effect, they have to use a CR3 reload. Therefore there's no need
to issue a paging structure invalidating TLB flush in this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4066,7 +4066,8 @@ long do_mmu_update(
                                       cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
                     if ( !rc &&
                          (page->u.inuse.type_info & PGT_count_mask) >
-                         1 + !!(page->u.inuse.type_info & PGT_pinned) )
+                         1 + !!(page->u.inuse.type_info & PGT_pinned) &&
+                         !is_pv_32bit_domain(pt_owner) )
                         flush_linear_pt = true;
                     break;
 


