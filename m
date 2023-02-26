Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEDE6A2CBA
	for <lists+xen-devel@lfdr.de>; Sun, 26 Feb 2023 01:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501938.773763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW4au-0007WQ-G8; Sun, 26 Feb 2023 00:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501938.773763; Sun, 26 Feb 2023 00:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW4au-0007UG-DP; Sun, 26 Feb 2023 00:08:48 +0000
Received: by outflank-mailman (input) for mailman id 501938;
 Sun, 26 Feb 2023 00:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24Oe=6W=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pW4as-0007UA-E7
 for xen-devel@lists.xenproject.org; Sun, 26 Feb 2023 00:08:46 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baba950a-b569-11ed-a82a-c9ca1d2f71af;
 Sun, 26 Feb 2023 01:08:43 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4C2A532007F9;
 Sat, 25 Feb 2023 19:08:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 25 Feb 2023 19:08:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 19:08:39 -0500 (EST)
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
X-Inumbo-ID: baba950a-b569-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677370120; x=1677456520; bh=LWTRQZlIxQllNCp/p4NuqNsedjPsD/Uso/p
	VE7vaMqQ=; b=UJjo87DVRtIO45jiBoR0AwpnvHHVJdSBecyhZtCWWALbnydgCrZ
	9bTkWP66AgxPnoFmlTcyE4uuriPULiWjO5ZBO+wfsaQlT1RRzt+26Mw67U1r/sBR
	2vl7VEerihyHYxcL0XS+80OMFZJu141SEcMcVznj1uk/kw+Ok/eexcS6Xv+AQr+H
	1yx3YjYGhRGXkKW5/krRPG4rsup6SNRA1HpK4CeNL8ilklzp5/jZah2fLDvwlkx+
	NqJf7jJwrY1/1G/jJ1MX7i8KLVqlB87X/EjsDvDJE8xwLIR0WpdAEWvBSJj4K7HI
	JBlQn7kV+KoKWdBElD6M4F59Kjsauh/Wf2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677370120; x=1677456520; bh=LWTRQZlIxQllN
	Cp/p4NuqNsedjPsD/Uso/pVE7vaMqQ=; b=UCmM6XUihAzzUHEvPzo+594F9kmdK
	WR+kPNkq6EditAlYglAHk75PnOAl+o2bRkP/Xcv024wmgqwdS/cFFsXVP+yX4ap6
	uhhoPfu5hzlyZeD16Zfm9cyENd8Mf/GjhlpboB/OisSSAWSe7N62VgBxxGdycQN2
	jQVIJcfj0p1UeR4fxBPQdfN0+xXbb2pyJ+V+1Y5MB+cMPdxfecV+WjiW5UrxiqjG
	HYQERYm7+hnjhOzXOwq3kwuEqLroIZBcds3wC6UEGRJ8dw6Luc38UYEdp35VorkQ
	rZwoSDeuz8ILGshDWYCwrqMpseYY/lT2gIAbenCfvnxgFQ9LWbS8h8L9g==
X-ME-Sender: <xms:CKP6Y0ATnXFEVkBRJk83V0gQLrMXBHAQmlbEysHdhd6ohcSIli0pGg>
    <xme:CKP6Y2jOIgbi6GV7jPt1CSbex2UGE50KvdgRO4oEy_mrJ_uyL4PcEinKrWS1BzH4u
    ePhVDCwkNNIYA>
X-ME-Received: <xmr:CKP6Y3mqg1Ew9zc2IW5uAGDLAxd88oKiuDGWu7llzPRGCrPlj2KNt-2eUebBdGHZsQvAqVWEsj_B_8FZlgngzZL8W1PM-fdXf6NGycA1Zq4LL7hsA6Cm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:CKP6Y6y3p1ogxlgGKA3QaNEEprOUkToZTDv7BxEsYWmBXjPyr_HEQw>
    <xmx:CKP6Y5SAQf9DnXGIE95Dolkai7H0VdoboqArwhZFKTRKMJb_leij6w>
    <xmx:CKP6Y1ZTv-nSGpb5AmHDXOIv-AJge3PUvPz6mVVbIgPFGWrxnq0lrg>
    <xmx:CKP6Y649pDudEh6a99EsMDSIYU18ioXSIsGj-SJNTO0sSz6o1oxrJg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope contains phantom device
Date: Sun, 26 Feb 2023 01:08:22 +0100
Message-Id: <20230226000822.42384-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the scope for IGD's IOMMU contains additional device that doesn't
actually exist, iommu=no-igfx would not disable that IOMMU. In this
particular case (Thinkpad x230) it included
00:02.1, but there is no such device on this platform.
Consider only existing devices for "gfx only" check.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I have looked at existence check acpi_parse_one_drhd(), but re-using
that one wouldn't work for two reasons:
 - gfx_only logic is very much tied to acpi_parse_dev_scope()
 - pci_device_detect() in acpi_parse_one_drhd() is skipped in case of
   (implicit or explicit) iommu=force
---
 xen/drivers/passthrough/vtd/dmar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 78c8bad1515a..3b5e152901b9 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -396,6 +396,7 @@ static int __init acpi_parse_dev_scope(
                     igd_drhd_address = drhd->address;
 
                 if ( gfx_only &&
+                     pci_device_detect(seg, bus, path->dev, path->fn) &&
                      pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
                                     PCI_CLASS_DEVICE + 1) != 0x03
                                     /* PCI_BASE_CLASS_DISPLAY */ )
-- 
2.39.2


