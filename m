Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEGCEbtgDGpXggUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:08:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD657F4E0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312991.1583144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKAh-0001o0-U6; Tue, 19 May 2026 13:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312991.1583144; Tue, 19 May 2026 13:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKAh-0001lN-Qq; Tue, 19 May 2026 13:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1312991;
 Tue, 19 May 2026 13:07:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wPKAf-0001ix-R7
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:07:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKAf-009WyO-1A
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:07:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a0c6095-bab6-0a2a0a5309dd-0a2a4509b0e4-16
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:07:40 +0200
Received: from [103.168.172.159] (helo=fhigh-a8-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a0c609b-2497-0a2a45090019-67a8ac9f83c9-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:07:40 +0200
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 43E03140005B;
 Tue, 19 May 2026 09:07:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Tue, 19 May 2026 09:07:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 May 2026 09:07:37 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1779196059; x=1779282459; bh=1GCvfVbmC+gEyoOjFaasIPFibJzKYv/q
	S1gecQDz3pk=; b=SRB8rkPJRZ4UXCPRkaLtoaZPfihaib9lpwHK2eo410d4LmxE
	y8jmi+kiwN7fNHOq/2MLe8RUAVKd77irQfHDoKMPysJtnQw4QtDSaMfxsxyWITQJ
	BRY/NCARBvKg/4Zk7iCzLCBiyZWIl2rC7UuLz0yFDg1KOkUvyVO2phdS8STpdIJ+
	iUxN4FAoUeLzN35m2oLPbib2UwtmyZgUVD531dVxfc4ddSKR6Z65dh3Ha7ZZ35IH
	6fNHN1y198LGNDKnMNQykPcNWIJFOTGpAOlg7D+jFSSqDmaU/m3JVtLnRX8KUZx5
	fUbWVyOYhiV4LmxachrFJBWd2/J68GQ2jKktcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1779196059; x=1779282459; bh=1GCvfVbmC+gEyoOjFaasIPFibJzK
	Yv/qS1gecQDz3pk=; b=QJCW1XRSzhFvgYe6fKCIix72Yuokvp4s6BW/FGQZ2gTX
	heOg3NQ2E93HbQyY2G9F8Ot4Wdj6mWcjaVdn+DCdNBCr1me77QviMRx8yGbo1gRe
	YcfFkvfi/u/A5fowpNVA/ChtaeS4/uYQEu5mGaxXprj1J0NkkhkVHjQKvg9T7DPi
	jgH01YWrEDsiVnYFSPfjpoDNhoZCakzkTo9ZF3qZWNU9qG5/vhug/AMD8XTarTTA
	kLCpPNukhMBkQnDKKPxm/TbxTYRl6vCxAWEPEUDe56Vq8sSyG+OraaSrQ0bCUh7O
	lVZmRMaw/ykA2s5xIrQKO8MIyyhIi66eMrw3geB+fw==
X-ME-Sender: <xms:mmAManBeoJbqvVyU1LrWpvwIKrZY3rHja4Q5QcwZHdEdVDEpmYpucQ>
    <xme:mmAMaka8jYG5X4MHNS3Ku5ceCrzfMuBPNhN0uj46amivKM3WCGyYdvwLDblkCMkEi
    btwJp9AmIM1yBQYO9d3dOFAxaAdOpstFiy2qSRmZVpfJH2f-kg>
X-ME-Received: <xmr:mmAMaq6gGmgmOfvz65rm4CLyQWWQooVPBv6oMTb8sUEibWFPrfZA6ZwvOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedukeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefuiiihmhhonhcu
    tegtvggurgnkshhkihcuoegrtggtvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomheqnecuggftrfgrthhtvghrnhepiefffffhgfetheelledtudffleetteehfeek
    geeltdeuhfehleelhfejffdvueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprggttggvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgt
    phhtthhopegrtggtvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprh
    gtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdp
    rhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:mmAMalbou8nXIlsgsdV_nS5fTFdpGEzgCkK_mDt29fdHXZvx2CPGdA>
    <xmx:mmAMapjtHLDFAwjx1FdYV8T9xUkhgDgIyn8N56PjUBoODV7o3mxH9A>
    <xmx:mmAMam8T5NW7GrDw_LvE6Z1IJe_YbFch_UxAS-lUkdXyHAWGlabtqw>
    <xmx:mmAMakpIH361sIi7lBmMnbYs6iZJaVM6GLkUuRtP4kPTRgVa0iNJVQ>
    <xmx:m2AMai30wz-t4pQtJ5Hh8Hbvn4rOA6WLnaeWlmHY-ZfYHWEJFuj6AwN_>
Feedback-ID: i792e4853:Fastmail
From: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22] EFI: Fix boot from a device without a file system
Date: Tue, 19 May 2026 15:06:57 +0200
Message-ID: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779196060-88D76A53-0AE0874E/0/0
X-purgate-type: clean
X-purgate-size: 1737
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:accek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7FBD657F4E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When netbooting a unified Xen kernel image (via GRUB chainloader),
the resulting loaded_image->DeviceHandle does not support
SIMPLE_FILE_SYSTEM_PROTOCOL.

Instead of crashing via noreturn PrintErrMesg(), print a message
via PrintStr() and return NULL from get_parent_handle().

Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
---
Tested on Intel Lunar Lake laptop via PXE-loaded GRUB chainloading
the unified image including Xen built from upstream staging. Without
the patch the boot aborts with:

  Couldn't obtain the File System Protocol Interface: ErrCode: 0x8000000000000003

(EFI_UNSUPPORTED, per UEFI spec Appendix D). With the patch, dom0
reaches login.

 xen/common/efi/boot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9ea2183c0b..a6c3c371c6 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -471,6 +471,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
         /* Get the file system interface. */
         ret = efi_bs->HandleProtocol(loaded_image->DeviceHandle,
                                      &fs_protocol, (void **)&fio);
+        if ( ret == EFI_UNSUPPORTED )
+        {
+            /*
+             * The image could come from a device without a file system,
+             * for example it could be a netbooted unified Xen kernel image.
+             */
+            PrintStr(L"File System Protocol not supported on boot device\r\n");
+            return NULL;
+        }
         if ( EFI_ERROR(ret) )
             PrintErrMesg(L"Couldn't obtain the File System Protocol Interface",
                          ret);
-- 
2.53.0


