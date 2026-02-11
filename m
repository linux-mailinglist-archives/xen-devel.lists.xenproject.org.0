Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL1yItfKi2m4bAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 01:18:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5ED120437
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 01:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226922.1533292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpxuu-0001mI-Sy; Wed, 11 Feb 2026 00:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226922.1533292; Wed, 11 Feb 2026 00:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpxuu-0001jE-MI; Wed, 11 Feb 2026 00:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1226922;
 Wed, 11 Feb 2026 00:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vpxus-0001j8-LD
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 00:17:14 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01eae877-06df-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 01:17:11 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 52A561D00071;
 Tue, 10 Feb 2026 19:17:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 10 Feb 2026 19:17:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Feb 2026 19:17:08 -0500 (EST)
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
X-Inumbo-ID: 01eae877-06df-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1770769030; x=1770855430; bh=NNGrw/Lk4csgCTkIVJRy7t1JGaelexmk
	gu1xTW5pALU=; b=kC0fPw2zcuuW6GjFA9BTjDeV4+zb/RdtiPJycalqpc71q/h7
	+qOTHJ1LizwfMhayspYbG+YiwgJ8NCysYVgfiAsUE42ZpaEFy7HM5OAZvsW9kLHm
	DZpvan3r3dumnIAaGEUd94bEAQcTZIJFzvLHu/W2Sppwd0famOEQ9stx8aeYmyfW
	PS6TLXuRYhIC2QMv02ac7dx1H5LAIGf+i6JCBFcy+MhFrDemHAT6y1yO/6s8juzF
	6y8mQf+xGcy5rPmsA6NON0QZJ3G5XekWwMD5FYDXYYpfZDU0mURTafnBBJdJcCYC
	QfJQO4JmYgJn3fh0lo4td2KU5wnv9KnWZHivWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770769030; x=1770855430; bh=NNGrw/Lk4csgCTkIVJRy7t1JGael
	exmkgu1xTW5pALU=; b=uFKApVA+tBIic7c8LfYu2QHJVj/DSgmkLlscSStU7dYV
	m3nJHZRNwpYWhNlZY6/0kKo31qxerX6ME8jmhSclumV1+D84ekDTiFumSdadICAF
	UAUiOnaK0W1W/DFZdqXSJZGMX0gKZJMG041nuYqIfsqevCAFUBbRUTKeCLCz3wLb
	hC2JICm7CI+nboOW4PV90Rra4HWVvaydRRuKrsyXTGwq+d18cubq8PG3vOwKqbPh
	BA79FGTRtHX9UsFxdZnmqEYREhoJqJ3aQxlSjG2jd1EZl3JzM/z2fEeI7KXLPpXL
	GfIgoiNZ9OQOPHHDeNgkSgzkGGLgOTVMyeggzQ2D+g==
X-ME-Sender: <xms:hcqLac60cjPJ58wOEsni326N-TVHosqRgTIArj03wVrT-g1xMdCYUg>
    <xme:hcqLaU7QXquu_fiyWvPpIyq8dxSsz0DZiwBMZvMGEPlU7B2vSYejT5QHQc9KLYWhA
    KAuVjSvEFQfnGJKILLnVCfKIJdPyX0LIgQGP9tVv3mCpgb7lB0>
X-ME-Received: <xmr:hcqLaQfTVkBwYzdPqVq5NQuVmr-KrkoNNrj4ul6hFdFepAhj6_jitRX346UtYThWnrwdfEQ8NL3s7MZhVA_rBYO4gKd6JpraxR0q1K-tEoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddutdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefhudel
    teelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghp
    vghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhse
    hsuhhsvgdrtghomh
X-ME-Proxy: <xmx:hcqLaQAyJNwZ4UVfdgGf7HyrT_7fUmCNRI8tQGJciQX7d7lRPhkiqA>
    <xmx:hcqLab9_lgVG9gUDLMaBn_eq8f5_1aLsNMlPwL7l-HgZAccDkleyWQ>
    <xmx:hcqLaTJMhEw6_HdNzLgp3xnvezl8hDcMNVKGsM3CpUVK8uAL4DwiiA>
    <xmx:hcqLachwzJIdTmohgy4JyMuWV7GQQ3uZtzXzloSsSdbzQKW-coAjtw>
    <xmx:hsqLaRZGDLuJ3hrL7ht_Z0TNP2c-12PLvQ2mjUHBniYmyu0i5pAaQgzb>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: Fix relocating ESRT for dom0
Date: Wed, 11 Feb 2026 01:16:42 +0100
Message-ID: <20260211001650.1592239-1-marmarek@invisiblethingslab.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: ED5ED120437
X-Rspamd-Action: no action

Fix calculating the table size - it consists of a header + entries, not
just entries.
This bug caused the last entry to have garbage in its final fields,
including LowestSupportedFwVersion and CapsuleFlags, which (usually)
made fwupd to detect firmware update availability, but refuse actually
installing it.

Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5b84dbf26e5e..45015a0dd583 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -675,7 +675,8 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
     if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->Entries[0]) )
         return 0;
 
-    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
+    return offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) +
+        esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
 }
 
 static EFI_GUID __initdata esrt_guid = EFI_SYSTEM_RESOURCE_TABLE_GUID;
-- 
2.51.0


