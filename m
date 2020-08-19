Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF22492A8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 04:01:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8DPQ-0005Mc-AH; Wed, 19 Aug 2020 02:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tsRI=B5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k8DPP-0005MJ-7l
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 02:00:59 +0000
X-Inumbo-ID: 365a36c7-77d1-4611-a346-5c0c309524b6
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 365a36c7-77d1-4611-a346-5c0c309524b6;
 Wed, 19 Aug 2020 02:00:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A518610EB;
 Tue, 18 Aug 2020 22:00:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 Aug 2020 22:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=84aK79
 JPqz1elVkqsVWGGXq2aIi/oJggegRxoBaYicQ=; b=SbuyKku5Ij/2nmplZry8Xn
 i1hv2x3GXZvTFx2syQ25zG4tg/IqN6XhagBtYvWS7I9Nn+RVKXfsyjRxT7mY1TGc
 /iSUsBus9gK4QWfLn8QRR++B1uo6Ohjom0XnHSTF4CEq0PFvIkpmkP7pJk9+pCtx
 ERWGQsO9AaX3ELBHSqwbiFS4kxnUdd+XbnduE4QrfF3L1RuP+n7spGQZvutqclVN
 +gy9Kjg/HsRibG4F2XeRnJ9WCmq28sHZdFeB+z7GEVYOGfEi2uTJFrBVO0EAHlO4
 0RezmqY93s7j7GbYtKBdy6aCq0GiL7zMjai7urbBPwEG8QvW6t0pZOTG4HEduA6Q
 ==
X-ME-Sender: <xms:0Yc8X-Kt2lpfMFc6FDpMqBZTqRCRyKY4RmythwFe6aU8noreXXREow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtjedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
 keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:0Yc8X2Ixo7eL_i52wyMVppmV296CxJS8GRMUYJeJ7CKifyh1z6Uamg>
 <xmx:0Yc8X-tqkkgOTAHou2H-ncQdRh-wLU__KX1iD70ozlwQIgTykhyqbw>
 <xmx:0Yc8XzYU7hGF1VmGs94JooWG0lcnrI9p6Xh17IuKlh1sULn1qGx9dg>
 <xmx:0oc8X2Dai9zgA-_z94mg6FGxldHqv1FR-thj2misJNGToUfeJU3Zfg>
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00900328005A;
 Tue, 18 Aug 2020 22:00:48 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] libxl: workaround gcc 10.2 maybe-uninitialized warning
Date: Wed, 19 Aug 2020 04:00:35 +0200
Message-Id: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It seems xlu_pci_parse_bdf has a state machine that is too complex for
gcc to understand. The build fails with:

    libxlu_pci.c: In function 'xlu_pci_parse_bdf':
    libxlu_pci.c:32:18: error: 'func' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       32 |     pcidev->func = func;
          |     ~~~~~~~~~~~~~^~~~~~
    libxlu_pci.c:51:29: note: 'func' was declared here
       51 |     unsigned dom, bus, dev, func, vslot = 0;
          |                             ^~~~
    libxlu_pci.c:31:17: error: 'dev' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       31 |     pcidev->dev = dev;
          |     ~~~~~~~~~~~~^~~~~
    libxlu_pci.c:51:24: note: 'dev' was declared here
       51 |     unsigned dom, bus, dev, func, vslot = 0;
          |                        ^~~
    libxlu_pci.c:30:17: error: 'bus' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       30 |     pcidev->bus = bus;
          |     ~~~~~~~~~~~~^~~~~
    libxlu_pci.c:51:19: note: 'bus' was declared here
       51 |     unsigned dom, bus, dev, func, vslot = 0;
          |                   ^~~
    libxlu_pci.c:29:20: error: 'dom' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       29 |     pcidev->domain = domain;
          |     ~~~~~~~~~~~~~~~^~~~~~~~
    libxlu_pci.c:51:14: note: 'dom' was declared here
       51 |     unsigned dom, bus, dev, func, vslot = 0;
          |              ^~~
    cc1: all warnings being treated as errors

Workaround it by setting the initial value to invalid value (0xffffffff)
and then assert on each value being set. This way we mute the gcc
warning, while still detecting bugs in the parse code.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libxl/libxlu_pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxlu_pci.c b/tools/libxl/libxlu_pci.c
index 7947687661..e2709c5f89 100644
--- a/tools/libxl/libxlu_pci.c
+++ b/tools/libxl/libxlu_pci.c
@@ -45,10 +45,11 @@ static int pcidev_struct_fill(libxl_device_pci *pcidev, unsigned int domain,
 #define STATE_TYPE      9
 #define STATE_RDM_STRATEGY      10
 #define STATE_RESERVE_POLICY    11
+#define INVALID         0xffffffff
 int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str)
 {
     unsigned state = STATE_DOMAIN;
-    unsigned dom, bus, dev, func, vslot = 0;
+    unsigned dom = INVALID, bus = INVALID, dev = INVALID, func = INVALID, vslot = 0;
     char *buf2, *tok, *ptr, *end, *optkey = NULL;
 
     if ( NULL == (buf2 = ptr = strdup(str)) )
@@ -170,6 +171,8 @@ int xlu_pci_parse_bdf(XLU_Config *cfg, libxl_device_pci *pcidev, const char *str
     if ( tok != ptr || state != STATE_TERMINAL )
         goto parse_error;
 
+    assert(dom != INVALID && bus != INVALID && dev != INVALID && func != INVALID);
+
     /* Just a pretty way to fill in the values */
     pcidev_struct_fill(pcidev, dom, bus, dev, func, vslot << 3);
 
-- 
2.25.4


