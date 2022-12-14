Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210A64D313
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462661.720832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avV-0000YX-MB; Wed, 14 Dec 2022 23:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462661.720832; Wed, 14 Dec 2022 23:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avV-0000WX-Iw; Wed, 14 Dec 2022 23:12:37 +0000
Received: by outflank-mailman (input) for mailman id 462661;
 Wed, 14 Dec 2022 23:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avU-0000Gw-F4
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:36 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cae697d8-7c04-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 00:12:35 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 448503200495;
 Wed, 14 Dec 2022 18:12:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 14 Dec 2022 18:12:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:31 -0500 (EST)
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
X-Inumbo-ID: cae697d8-7c04-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059552; x=1671145952; bh=e6bEQ7cyuv0fw5IP1zcDCnUrggycZ9qD2rR
	Jl6yeW5Y=; b=MWJa8k8uwjFe7AmLq/7HforeY9j6EuoB6uq2xIKaA1vTv//NQ+j
	WwuzEpRUn5yeV7Eq5K+ueyyQCwJeltc5fXtb1UZC/lXb53uI6TpY5hThYyDFoo3q
	ouSa6O7e9lCqPAD8jFU7BTcDgYs+OCV8ayOuIW4Ox/eHMMNLNmJjmgewcA00VhHg
	MBFy6eEHevwwFXdwnLeC1pm6sg6PMauDsVKLCEilc7d2ZgPCgMTdkLGgR6MFyWQ/
	dWDar3FDXacJyjxZNqUH0FbKtYu2ZX29U1WgYom+CggwP4H/SeLsCfVnsfpRyzbJ
	FptjCbvOjsjJb6entBtYrlIVLb2EB3LkaCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059552; x=1671145952; bh=e6bEQ7cyuv0fw
	5IP1zcDCnUrggycZ9qD2rRJl6yeW5Y=; b=cweWERN0Yq6xIQzjBlj62qz+4GH96
	T7CGEm620X//ZkozuEn7dRweEqyDYzDudLz4Rs3tqRIvk3PLsBVdBadCS7s8ZvYA
	9N2BrTsVoPPjsqOdscPWkoqJjuNesiMiAo4BFmReDa2HuBY0VzX2DoP9EI1PfYi6
	owQbjF5jnlct83o/etUPe0hyhZvpymU90ABCryGheXmkWTjl9Oi4gijE5mpNB1qt
	tLEyTait9haHncrijfw9/1dfO/gRvltWDZMqlrJLE787ECSbJiyvyO35o6jy4591
	ybKkionLTjCThXku2Rz5+dyivh/e/TVEhW1gL+IWSsLDrgaNW2OI03Q2g==
X-ME-Sender: <xms:YFiaY1FsMyu_xuIRYBoCjmYjh4GGFXttF9nq9ckWSUEvs2RB4B489w>
    <xme:YFiaY6UA2PiJwJMKH7xCq424aQe612lCLLVHXVVPM9l2M4I_PsVsafue-tL7cD3mw
    NG4BWYihdrrCYE>
X-ME-Received: <xmr:YFiaY3LcCKqK2XcchcqC8gRSOLFm4xr_Z7yl6hNnJKCNezB22L9AbJ6HhaUV8cRzV4Zk6j4xikpY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:YFiaY7G0z7UhldXfTuk0gr62YqxJRqzgoVVwvLsXhyna3EuqVim8ig>
    <xmx:YFiaY7W5NlPlBe7jQ5VsZtifUVvlSxlyoiKDD09YLEmuDhTzm5ccAA>
    <xmx:YFiaY2NM6ELiQWPSJ9Trwdfw6U-f7LmfnVmlB7zI_HyvnkRgyl_udg>
    <xmx:YFiaY3rFTxmtEic_73qL4104nZ45RJCB-bbTCGAeps2QagRf-xYH3A>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v3 01/12] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Date: Wed, 14 Dec 2022 18:11:51 -0500
Message-Id: <6a0d969d0aade0258e108009ef33ad5d2663e969.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
the face of future PAT changes.  Use the proper _PAGE_* constants
instead.  Also, treat the two unused cases as if they are cacheable, as
future changes may make them cacheable.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..b73cb29327ba49703673886d09d79f2f8928a6c0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -959,14 +959,19 @@ get_page_from_l1e(
             flip = _PAGE_RW;
         }
 
+        /* Force cacheable memtypes to UC */
         switch ( l1f & PAGE_CACHE_ATTRS )
         {
-        case 0: /* WB */
-            flip |= _PAGE_PWT | _PAGE_PCD;
+        case _PAGE_UC:
+        case _PAGE_UCM:
+        case _PAGE_WC:
+            /* not cached */
             break;
-        case _PAGE_PWT: /* WT */
-        case _PAGE_PWT | _PAGE_PAT: /* WP */
-            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
+        case _PAGE_WB:
+        case _PAGE_WT:
+        case _PAGE_WP:
+        default:
+            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
             break;
         }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


