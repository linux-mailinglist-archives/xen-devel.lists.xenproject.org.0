Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B87BA1457
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 21:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130795.1470181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1s4g-00043X-NZ; Thu, 25 Sep 2025 19:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130795.1470181; Thu, 25 Sep 2025 19:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1s4g-00041b-Jz; Thu, 25 Sep 2025 19:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1130795;
 Thu, 25 Sep 2025 19:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jamk=4E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1s4e-00041Q-TM
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 19:56:17 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa7d99bf-9a49-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 21:56:03 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB4PR03MB8516.eurprd03.prod.outlook.com (2603:10a6:10:38f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 19:56:00 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 19:56:00 +0000
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
X-Inumbo-ID: aa7d99bf-9a49-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLqJir9+aUROOt4NrSsSK0UjM83lSMKXQzvMU5NTqvnambZIc5ZZSAH4I8Aev6AgBSCxmEE5/pL7JaVJrPSPyUrwnTxON5p3kKiYSqTiAYoUS5bDkygdu2mzeqmNon1W+ss+47PnXEE3yVuKp4VQ7kjEikol6W8VPYYK/9eUl/ZJNbz0TStrSkJ6gFiBMgLyTydYWJ45yWaqzq95mwcj4yTBD+d4SlKeM7uO75UXUxVHtN7bxOnw9sVL1e3Od2qp87pSsQPmVd8CLULM8u2cY8/3NVzsipd7Yjy3qjaU7DUI2tYguR7vhthrhR6kSuOsCreQxktrTbmnDjD5HNyMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzPredjRp3u8PrwWB70yDOQkOKdPO3jfQAYUIuRpkf4=;
 b=XEKHW6BYZdc48buQNlsBqmMQ7uFmU7yNeDC1ISE7m1nEym9r9Xl1j53D7jWYKw9SCEumAPi2OC4taMZJ9ykVxeWmF4asE/L0hopTIEXPdMk2hsdmddcyZXpACZfH2Y7C1eSLVeAOK1ORXxWMh7Rt+jo48A9q4lKTgBrhAx2T2lhcP6eeJN8tAyJy+FlhJuLPMg6SAplSUpohaF5GM517R6VlfUOhcFl2/qXX51jH8NFDSMman+o3LzalqkL/W0M6REkE4EFy+Y41pkxn4ub/QE9gVya2IqeNBKu3xPliEgL2Vaq2eY0GXBCAHrHkbK+9ebnGEBYdJ2FKFa3d+bsTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzPredjRp3u8PrwWB70yDOQkOKdPO3jfQAYUIuRpkf4=;
 b=Upo37Jqu54sQYFHDiMGmrmYHFRSU3KIThjDlZM2DmDwTi6uhCV1FgKvITAP6Em9TjAQoFCWPRIURmj+Hx8e7gjgY7MflrbanKQWZZdwinstm5LdUIeb25bMMPLpAsZpBuq1Q5mTUxw6d1oaLLfyQzkFsRUMgYdrJR7w8zL1N/XK4ZJ1u6KUYWvchmWh1vwYPKlOQ8gjX0u1PxOkAzevI+YWbmBOCYVdkpO0Z4vxl66Xj19rxgS+1raJttymW9epOdtzOdHdBpi/PlNT1R8TL8tY0VaKsjouLoSG8Mk9TFJ1ZDmOTgw2Bvev3pNLWb1xBOcTncjJcHVQz8FAFC6EZyQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
Thread-Topic: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
Thread-Index: AQHcLlZqbf0MGzslLEaqcqespx3CAw==
Date: Thu, 25 Sep 2025 19:55:59 +0000
Message-ID: <20250925195558.519568-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DB4PR03MB8516:EE_
x-ms-office365-filtering-correlation-id: b7e70640-fd23-474a-fe86-08ddfc6d8cde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DY3x2yoNzGXJTQtbsX9AvJr0k0OE/dnhmOPqNupD4szRKAGmfv5haTX8wk?=
 =?iso-8859-1?Q?40KLQZ7gvNla4K6kEwSCCB7MiNFlGiJ9RK257Rer4SdvNTJIFNiIUNb0T3?=
 =?iso-8859-1?Q?pBVS0bWABzD5M8opQcJA3bNiKr8Ry8W+6ftItddDDx5pxR1CDQT1HXy30O?=
 =?iso-8859-1?Q?nEQni1JxTFZk0kUfRGK5IB7qq5Xzri4lWqbwPyO0QvFPK2RM+Tde+jzjrO?=
 =?iso-8859-1?Q?p7WXQ48T8z6FT8mVLJZFKzNzhcx6qSv5Ae7CxKQxnqLIRAr37pCs4REooE?=
 =?iso-8859-1?Q?+CDVIImfDXla6Gcx2WMG12cOzeIfIGjmqPSe2ggrM+p1FcM9slxAUXhbK6?=
 =?iso-8859-1?Q?7VHO0AaLBoxC0XmOJDUN73FXlFajrr5k7vrMhVoxUBhctF9tBeBuhENdWW?=
 =?iso-8859-1?Q?3i/3ODhLb71FQ0ZqiM4PHbZj6TKrDydWunuIw1t0o75uoO+YOXuet1bxLF?=
 =?iso-8859-1?Q?HzgUOdpBLNlaRxOgLlLxlBZKdm4QmnMAHe3dUpA38u3AcwCd/gGpxxC5f2?=
 =?iso-8859-1?Q?LKT4xHC08E3n/NqvWSYGDN+KwYp6cYThVwaxaMnC7Asl5cqMdadQrtkC8D?=
 =?iso-8859-1?Q?FDWMbPO7tmnSX5PUeQZzmXsqkrbJsyMXnEnNnUVpT4ZgiqRM644pkJD/+c?=
 =?iso-8859-1?Q?LZQvLCU3sWLSNkk2wSROlFzNiXi3O43ibRMNFlQ8XfgXIUf4lXRWEbNcih?=
 =?iso-8859-1?Q?7cvN9H11j4dXnwo+4wZtOA47WbECMBMZWFi1bFTaDxq44SxUpk5kQFXtgl?=
 =?iso-8859-1?Q?CiTr1/IsPiFPwSx+Dh3o8v7COuNQNjX2U2YcGzRQj6MKffgFU1W3ZXPM4i?=
 =?iso-8859-1?Q?MwiwU6LQzSvixPHDcibm5XS4rWMxWOa5tif3SEICxej4wkUdgN5zejEP00?=
 =?iso-8859-1?Q?aF0kGlqU3b795v4Lg7GSS1ZuUYPiIr+QFZ+SbkvnGxyB8bWiTAWYG4diD/?=
 =?iso-8859-1?Q?1zg1zio7CXz33svALyVo6Ii/mjD13ka8/uqzjSGndZgYRhDrg/+ilvD0T8?=
 =?iso-8859-1?Q?SlZLuDG6i9MLqGcyezPERD5WMSNgHOx31jNgz8Es+BUgb1JADn2njUUuED?=
 =?iso-8859-1?Q?o6qDULgRrCm9UthS+NQ4Yw4PNnJEcFkWaUGFPXGukdrf6abFjXjaBFFpQn?=
 =?iso-8859-1?Q?6gdksLWXXXY/A66ghcJL2VIc2bcqywmUn1R4nGimDmdzN+EOtwg3GUnTE4?=
 =?iso-8859-1?Q?E99iy6H1VgFLWlIBNtz1r7XPq4RKEbXcQ5bGv2Cd7urUIWjg7Xbowz3SsN?=
 =?iso-8859-1?Q?tTlOrlT3NKUWKHNbU86weYa7vIzyuJmiOB3DVFA2pdRLjp0NQ2Yd2JVJxA?=
 =?iso-8859-1?Q?rEOMl4rlozDX4Iqch2HTuuPaOYMrLXhDb5oJA7MXvVqeIW1qSGsxtblbKn?=
 =?iso-8859-1?Q?1E0IBatwF4SWKEg44vglfCqtM+pwdCQ5lrFML/TjLL0NzpIMD1UDPsip1e?=
 =?iso-8859-1?Q?wfqrD0Udx0QyIFP6YRpCC8tjp82pLCBMbkckrcjxcjXsxPL99/obkLIwrm?=
 =?iso-8859-1?Q?2QFA3/rad87hKe3/RBPVRjNhic4Fx7T4yNG5yIouM+Nc7YyA2Os1kdIr/Y?=
 =?iso-8859-1?Q?frMq6k3NLWbhpEt7Ia46w/EjlRFt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iznMBIf4bSEWiVkuq3SxrY3CCHcFCjveDXOh1nxIAe3mGiI3G4GW0Nxi/j?=
 =?iso-8859-1?Q?G6xG4hga4VIxVq5Ol4SKQyzb0SjW9QowgKn3h/I8YNW7HOtcDJosKhGO5F?=
 =?iso-8859-1?Q?B3JVBH9nJJhIcE0yZjr+4CNPGisTaK+GIY+3ZeogIWvO7EHCOL5KYzpDSy?=
 =?iso-8859-1?Q?/o6p4RYlX032fsGYp1y2XxgCmNU3f+QR2qi9VZtFaUwMAzP5f3yFcqSXP7?=
 =?iso-8859-1?Q?j9XH4dg1lg/wfOAfakMRkftsIJRl8pDVunqCrjF65kVvQizPcZ6WWnStPK?=
 =?iso-8859-1?Q?rCmTfIMZmpbqVRd1q2pY6cVLNZa4mnDg8fsexYYejRjwE5LCTzsCJSq6zK?=
 =?iso-8859-1?Q?z1bi/2WUt0LGuTBG7iQJnaPqF45pmFZpNdbNiKPyEjwKHaqJK9/haETB/c?=
 =?iso-8859-1?Q?UXn5+csJ1+Z3FcVfs6H34hBUlnUtRQmHO/Pnxbv1k9QCXJa16enXzW8Zxv?=
 =?iso-8859-1?Q?4UAYPV9wRIzNAdOjKHkolNSHtWEhfBWs+bmEBa840zKWHV9da4xzwHi467?=
 =?iso-8859-1?Q?fCP2AfbXoDdNaTAmAZc1McBMxf4dXVB6Ss7ZErho2DzLsNQCZmCOCqbrd9?=
 =?iso-8859-1?Q?9zm9o2k/8pHKs6NNEfqwpA55XOKabmhVUuPzQr7IVHYt40FGST3SWTZwyq?=
 =?iso-8859-1?Q?okyAfnFqzwUgVjEDApUWtf/U4byMRKG3Bg2yaTBRVwb9jJUozpvo7lSW8j?=
 =?iso-8859-1?Q?k73OvhIzgbdf2oclMAHVNucCaVaio9/JhmMHKE1uodCmcW8v4JABzPbm7o?=
 =?iso-8859-1?Q?WFclE4R457vWb4c0Xe3NOQqiJBi4uIsBRxe9ghxU8CqeeR/DKg9k8iy9+/?=
 =?iso-8859-1?Q?b6neQxfshA6aShP5b2IjVY+zlPoQUQae5WLFoq3yIWzo8tHVDHXnWd4l8V?=
 =?iso-8859-1?Q?5z8m8NNXkexJw/QMFvw83R5asiaLh7YX1h58zI9uDPvRbH8//vifh4lFl3?=
 =?iso-8859-1?Q?jDmbJ8zSWaoHS9tR0rdVA/+xvWJAGX08Dr8ShkcMvYl/4ajrfvNiiRdiXl?=
 =?iso-8859-1?Q?RQ5Croma1/EpVp6lap6rEXzbv/+vrihMT7RHuGAqGm9iBeqm7wQGlNit1c?=
 =?iso-8859-1?Q?pRU7udXXjQ4oqZrl4WpBWmpGxYt24MQgzMlBFD7ZbKi1C+mLZQKbStt1kN?=
 =?iso-8859-1?Q?gSw30aavMRN/U1zgVjZ7Fv2bvfUC+n2my4BqF0jiC/THTkgPxIIRh9d3mN?=
 =?iso-8859-1?Q?/ClqhEvs05j9F9SZ1C0YJA4irpibW95/8MxkaPr/qXtCG9SIVHWbAPxVzA?=
 =?iso-8859-1?Q?85C7ti7x8lDdqtHZ7KdpmW9/LINRtiiCQZv1Kv4SmfJalH32vHhaPFXKFS?=
 =?iso-8859-1?Q?ywT15GQxoaZo+CRvUkIz7YfkfyMJSZf952RqIGBnhs2fC/pQ3p6FX/BlsP?=
 =?iso-8859-1?Q?keoRCSu4sfOgpKerOZEpKrnABzAroHrB/rcs15eDBlQyTAAIAWexHIuDb2?=
 =?iso-8859-1?Q?R04fx9gHBh7zTFXg5vznx/LShTivJRstOuo8TDtF9dFJMSCKvAHp5mWoGk?=
 =?iso-8859-1?Q?827A+qHC3hDeOxTE5cGSybp/cmwSJz17t6UvexOE3vd+9GI/R3v6lKVPhk?=
 =?iso-8859-1?Q?kP7NUq3jzh0wRCSDuN0kczRqDMGaCTgn6g4Jvk1Sw6jIFDAlbqO4M+4eiL?=
 =?iso-8859-1?Q?thOe5Ac9bkBR/58aZ9qcQ/d8bdUF1uL/ffKZfhuf9tKbSR6UukyxLN4A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e70640-fd23-474a-fe86-08ddfc6d8cde
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 19:56:00.0943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FqjkteIo+ZecS0MlvK4e4S2R/dPAeIEeYtRH8KY/V0E6xA5/LhgwzkmYChSEhO2Fvxi2N0chKCQRWMBOIimD3F6ORkywNLBxDNd6oXxvspI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8516

From: Grygorii Strashko <grygorii_strashko@epam.com>

The LAPIC LVTx registers have two RO bits:
- all: Delivery Status (DS) bit 12
- LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
  This bit is reserved for other LVTx regs with RAZ/WI access type (MMIO), =
while
  WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bits
  (MBZ access type).
and the current vLAPIC implementations allows guest to write to these RO bi=
ts.

The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus, =
and
the IRQ is:
- or accepted at destination and appears as pending
  (vLAPIC Interrupt Request Register (IRR))
- or get rejected immediately.

The Remote IRR Flag (RIR) behavior emulation is not implemented for LINT0/L=
INT1
in Xen for now.

Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
fix it by unconditionally cleaning up those bits in vlapic_reg_write().

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/vlapic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba90..78162afe7711 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -880,6 +880,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg,=
 uint32_t val)
         if ( vlapic_sw_disabled(vlapic) )
             val |=3D APIC_LVT_MASKED;
         val &=3D array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >>=
 4);
+        val &=3D ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING);
         vlapic_set_reg(vlapic, reg, val);
         if ( reg =3D=3D APIC_LVT0 )
         {
--=20
2.34.1

