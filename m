Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEj5EwuYjmnXDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 04:18:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD41329E6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 04:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230148.1535725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjh8-0005Gt-Tj; Fri, 13 Feb 2026 03:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230148.1535725; Fri, 13 Feb 2026 03:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjh8-0005FS-Pn; Fri, 13 Feb 2026 03:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1230148;
 Fri, 13 Feb 2026 03:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqjh7-0005FM-2l
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 03:18:13 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f7ec94a-088a-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 04:18:10 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 9AC6514000F5;
 Thu, 12 Feb 2026 22:18:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 12 Feb 2026 22:18:09 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 22:18:08 -0500 (EST)
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
X-Inumbo-ID: 9f7ec94a-088a-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1770952689; x=1771039089; bh=MQdfMQaHPBHgZeyVIkCI+JydNTfIFqtr
	LGdsuLTCQVs=; b=uHPhzV9W8GJz07iqGuVUWzWCMZKNXPz/DWxtf+WzZYAZ9uyy
	aTREoSgWeM1kYIGOUPVuXR3bfvQqywACqReeFy00M4jIk+dNREujIuU7HczmTLLx
	7fwLhxjdRvdJjic+mJrxyuoQRp/6D/Zxg009jqW4PxaODp2z7r0+2zvuq/tSr/b0
	UohqKP59ZkZDlqosAhoR4Pb9SjabL7+kNECbC1h0IRviIGoc48r4JAZahy2jxyeI
	I66sPHeTFjLLzyjGKgrpdGIWAPeOnSzmBm/FC9BpLrsHMtDrXAeMe2+MuFor7avK
	Te2EnuR8WZ14qPS2EIuxNihYzIq5B2bwnxnoHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770952689; x=1771039089; bh=MQdfMQaHPBHgZeyVIkCI+JydNTfI
	FqtrLGdsuLTCQVs=; b=GjX5cgAs5W2WlkuDre6lOoCK7ByaLIBvSwKYw/oCm+kM
	0Fm+t5E47McseC2zfqjZWA9KIBm9T+jv4dBIceQLNgxpq6KzXaCMcFypj/C/s3Ue
	83zxPo2N+JgVD+ZqaMKsTmvjx+QUMEb5OkxGvOwqesJ95YhGn7r62YkPGOBgu3b5
	QMRPG/agtxyNnT//kC4mmm+L4y/mp+S4/WXwI2z/+ZRuoPA57rOCRxixGMNTYlYM
	kij5dPtDcVcwwMFUTFK5GP1IPTWvEDcjKdXn/NGB7dn6j9Oy53SMJhPHMbToONbV
	mA4iGXtRVGO9QmYYcj7Yk71hruw+J/L/NUQ5eEN04w==
X-ME-Sender: <xms:8ZeOabalF8s0fOvDUs32aZmC4nk_G8zetwFNKLkggfcQJRAXXs2vrw>
    <xme:8ZeOaRT552ozg86AcswdUydy-mgdgYm7k_k1o3cFv0OHLo_0wO5ayH4IOWYC5igtD
    MDa2bRrHaTqrqFYgIB0B61B1JTATPnvSHey_CvUvdIXFPYJAA>
X-ME-Received: <xmr:8ZeOaWSYD4hxr_95ywf_h5xRJGIa0MMfA7DztOzrfjypuZ0orSHdSS7wmbQv495qYuMbWrsQ968EYP_HFOVdZZVJFV48NoKhGyX__gFKreI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdejudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefhudel
    teelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehs
    uhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrih
    igrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:8ZeOadTkXqt5iqAZGWnPM0DU9Addc0nmNkeBTyd8qqyJzS0hsLvLOw>
    <xmx:8ZeOaT6jgzlcDlekQhssjmFR4damPhmmCBQtE00cLc7zoPf3r3nVvw>
    <xmx:8ZeOaR2P2gYxyg5plNlpvcqK-dV9mo9VuDAlP3mfQ4g-aHZ8TnvwLw>
    <xmx:8ZeOaWBFmLLZ-INnmwGmwu4OmzFsoxqMBJK3eeq33UlSmW5nY1vqYQ>
    <xmx:8ZeOaZVdq6YLMpRjEINjJ-PWSdFcIg9AEGgnklomuUsaMxl5yJmZ6KuI>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] VT-d: fix off-by-one when handling extra RMRR ranges
Date: Fri, 13 Feb 2026 04:17:48 +0100
Message-ID: <20260213031801.1744145-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:mid,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DABD41329E6
X-Rspamd-Action: no action

add_one_user_rmrr() operates on inclusive [start,end] range, which means
the end page needs to be calculated as (start + page_count - 1).
This off-by-one error resulted in one extra pages being mapped in IOMMU
context, but not marked as reserved in the memory map. This in turns
confused PVH dom0 code, resulting in the following crash:

    (XEN) [    3.934848] d0: GFN 0x5475c (0x5475c,5,3) -> (0x46a0f4,0,7) not permitted (0x20)
    (XEN) [    3.969657] domain_crash called from arch/x86/mm/p2m.c:695
    (XEN) [    3.972568] Domain 0 reported crashed by domain 32767 on cpu#0:
    (XEN) [    3.975527] Hardware Dom0 crashed: rebooting machine in 5 seconds.
    (XEN) [    8.986353] Resetting with ACPI MEMORY or I/O RESET_REG.

I checked other parts of this API and it was the only error like this.
Other places:
 - iommu_get_extra_reserved_device_memory() -> reserve_e820_ram() - this
   function expects exclusive range, so the code is correct
 - add_one_extra_ivmd() - this operates on start address and memory
   length

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/passthrough/vtd/dmar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 91c22b833043..3da0854e6d91 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -1065,7 +1065,7 @@ static int __init add_user_rmrr(void)
 static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     u32 sbdf_array[] = { id };
-    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
+    return add_one_user_rmrr(start, start + nr - 1, 1, sbdf_array);
 }
 
 static int __init add_extra_rmrr(void)
-- 
2.51.0


