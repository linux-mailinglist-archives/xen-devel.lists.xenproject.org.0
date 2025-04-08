Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB961A80C06
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942081.1341372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28vz-00042r-Kd; Tue, 08 Apr 2025 13:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942081.1341372; Tue, 08 Apr 2025 13:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28vz-00040X-Hy; Tue, 08 Apr 2025 13:24:11 +0000
Received: by outflank-mailman (input) for mailman id 942081;
 Tue, 08 Apr 2025 13:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83+A=W2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u28vy-00040R-Du
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:24:10 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c01c9e35-147c-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 15:24:09 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 45DD32540205;
 Tue,  8 Apr 2025 09:24:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 08 Apr 2025 09:24:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Apr 2025 09:24:05 -0400 (EDT)
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
X-Inumbo-ID: c01c9e35-147c-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1744118647; x=1744205047; bh=1Gm1V5+ESJ8LChIdnWyjzdypv8I33gJq
	x0kUCrT9giA=; b=OdLUESplPALffqra/cFX7fWUVqwdXajHYIdD4sfJEw+hpnwC
	orqgpztatHvdXnqMyGJADYhECJpg5htH9TKBEMn1L34xGylKoj7naKWaQuwHr424
	B/U7snuScG79jU2fd0XQUvnSsV+Gtq2/+wsdkqAooTHpY1FUbUsnaHyznb1iPMJ3
	5K3p9ISm25wCEyM5q0o/OhqB8GJs7MPhe36mvdYP4XV+9Xa1j3WlYI9QPV8PHLpp
	oNT3vAtjEG63r0y+g3u/KF7SGiYw/Fd0CYl4g/UZto2IU0IKKWTfe45Vd9L3gn+A
	1K93jJM/jiAJTz2xAVpuddY124rxfLIOle7ndQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1744118647; x=1744205047; bh=1Gm1V5+ESJ8LChIdnWyjzdypv8I3
	3gJqx0kUCrT9giA=; b=gyskmmqAbhiRCLw46y1SGf9M56VQcfQEP87UnXQF1Ged
	FoetK10FaEwOX8Cc+v9L+i0/GDUp6FXyPsFGsGruF8D/DfxLjy6ZsCJNxK41RxHQ
	UHjv3oWnrSyET7zV9Ro8NdwM0Vxa6imMptTPIWdouew1B6ueJ/9z9OY57nHP1mhl
	g+1tSG2WOCp+KeWpL/3jEj1bK4FuYVKjnkdgpYk8DhhHLfBW6u9DM3Cq9p1hyKKb
	j7YeMMv7f0cW2zZy/yoFbL8r7DevOgCf+27195iQbJh/78rp6SKhErGnuRCDbt3x
	VOR5sMsCUIDMjQRLrr77VAvsFMDXniUd+kXzTNrOww==
X-ME-Sender: <xms:diP1ZzM7Mf--uW3zZjGAtZUpjK9ve6IKIASs9S_lsipy14wDxHpuCA>
    <xme:diP1Z98iIPjmiSgBLTIrsIUsa2wAWKOtqOxS5EmvCE6NncO2Okf7JHuVo8vsgfo6T
    irOmxJFJ5nl8w>
X-ME-Received: <xmr:diP1ZySL9wM7TmxkBlf9nFCWA22OA3FiV7tZYPya-L1cFaxh9nMYZjuwPWWLN0Q192s8rh0jYjrjPSFiaxriLJqFL_zCrkt1XhAs72XmbpXFwX9iUk4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekle
    eghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghp
    thhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfi
    drtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgr
    uhestghithhrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhguse
    hvrghtvghsrdhtvggthhdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhm
X-ME-Proxy: <xmx:diP1Z3sCfNnFIuC2hAF0R7rmYQrbKG3fCHIFW2xLssImvhfQlPXPyw>
    <xmx:diP1Z7dUrzM9C0EwQpQSOQLrCbxTMnDSFpK3qL4XtZCGIgqkUjuQ-g>
    <xmx:diP1Zz0YXtMf5alJePJRbKZSsxgoRbq1AbRTYqzSV-bM5jycTfzQcg>
    <xmx:diP1Z3-xsDlOcDdfJWAiUvyrc0m5ldOOpQtUTxs3Z3fJIUc0XWk8jw>
    <xmx:dyP1Z5hzWIZ-1d-1C3b_naiPi8yYTwtTf_FLTRoF8CqHsV3pIU60reSh>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl+hvmloader: extend IGD check part 2
Date: Tue,  8 Apr 2025 15:23:13 +0200
Message-ID: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consider also "Display controller" an IGD, not only "VGA compatible
controller" in few more places.

Fixes: 4191619e0893 ("libxl: extend IGD check")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Do you prefer this to be split into two patches (libxl, hvmloader)?

 tools/firmware/hvmloader/pci.c | 1 +
 tools/libs/light/libxl_pci.c   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index c3c61ca060a6..1ee97a5b4b20 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -173,6 +173,7 @@ void pci_setup(void)
         switch ( class )
         {
         case 0x0300:
+        case 0x0380:
             /* If emulated VGA is found, preserve it as primary VGA. */
             if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
             {
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1647fd6f4756..db1299832cce 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2575,7 +2575,8 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
 
         if (sysfs_dev_get_class(gc, pci, &pci_device_class))
             continue;
-        if (pci_device_class != 0x030000) /* VGA class */
+        if (pci_device_class != 0x030000 && /* VGA class */
+                pci_device_class != 0x038000) /* Display class */
             continue;
 
         stubdom_domid = libxl_get_stubdom_id(CTX, domid);
-- 
2.48.1


