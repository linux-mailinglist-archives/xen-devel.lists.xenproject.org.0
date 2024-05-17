Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A788C85C9
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 13:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724087.1129265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7w0D-0008FQ-2b; Fri, 17 May 2024 11:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724087.1129265; Fri, 17 May 2024 11:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7w0D-0008Du-08; Fri, 17 May 2024 11:43:57 +0000
Received: by outflank-mailman (input) for mailman id 724087;
 Fri, 17 May 2024 11:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30RX=MU=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1s7w0B-0008Do-Td
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 11:43:55 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc66d791-1442-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 13:43:53 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 May
 2024 13:43:52 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.039; Fri, 17 May 2024 13:43:52 +0200
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
X-Inumbo-ID: bc66d791-1442-11ef-b4bb-af5377834399
From: John Ernberg <john.ernberg@actia.se>
To: Juergen Gross <jgross@suse.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Ernberg
	<john.ernberg@actia.se>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] USB: xen-hcd: Traverse host/ when CONFIG_USB_XEN_HCD is
 selected
Thread-Topic: [PATCH] USB: xen-hcd: Traverse host/ when CONFIG_USB_XEN_HCD is
 selected
Thread-Index: AQHaqE99M70NH7RzN0K31Fykj7Mi3Q==
Date: Fri, 17 May 2024 11:43:52 +0000
Message-ID: <20240517114345.1190755-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.45.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A29059A2F57607765
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

If no other USB HCDs are selected when compiling a small pure virutal
machine, the Xen HCD driver cannot be built.

Fix it by traversing down host/ if CONFIG_USB_XEN_HCD is selected.

Fixes: 494ed3997d75 ("usb: Introduce Xen pvUSB frontend (xen hcd)")
Cc: stable@vger.kernel.org # v5.17+
Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
 drivers/usb/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 3a9a0dd4be70..949eca0adebe 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_USB_R8A66597_HCD)	+=3D host/
 obj-$(CONFIG_USB_FSL_USB2)	+=3D host/
 obj-$(CONFIG_USB_FOTG210_HCD)	+=3D host/
 obj-$(CONFIG_USB_MAX3421_HCD)	+=3D host/
+obj-$(CONFIG_USB_XEN_HCD)	+=3D host/
=20
 obj-$(CONFIG_USB_C67X00_HCD)	+=3D c67x00/
=20
--=20
2.45.0

