Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D394C5D75B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 15:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162682.1490237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJuMg-0006II-0e; Fri, 14 Nov 2025 14:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162682.1490237; Fri, 14 Nov 2025 14:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJuMf-0006Gp-Tw; Fri, 14 Nov 2025 14:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1162682;
 Fri, 14 Nov 2025 14:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTzj=5W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJuMe-0006Gj-2x
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 14:01:24 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6675d137-c162-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 15:01:22 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7173.eurprd03.prod.outlook.com (2603:10a6:20b:2e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 14:01:19 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:01:19 +0000
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
X-Inumbo-ID: 6675d137-c162-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owCOe+zET0W9Y3vSGszkIVupdPms2fAK8kWp8XxrsMiQC3PFrwRA8/7ws5qj9q7GENvPo4h78Y1OB2+sekwb2JOYB45vAVLpf1esvWNMoBvXxK9vK5Ps5eQU/mGtTC6e3cxTKwkpB1DT+o38cYfl3gncYnYOhuaA22RVUEM9YpIikXuHGt8S0WE7CiqhG8hqgeAWGCwLUdFFQ28NSw9xU9lxAtDEqSKUOrEgSN1BMGMQdEmxythzKz6nkc/BlIjVg7fPX98cvNsmSl3758ucKH4vXcfOKCO6f6t+Y4vRt9uLcmp6XQYafq6I7jtWMfbqofKj35xFPTKTeVssDGxOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5BvTn8RP7T1gGrq+r+B32FCLNbKbAQxECCv+rZ7kBQ=;
 b=xBHpl3+Ey94RKMoeDprfz+IgutJPiV3Ii1BoOuIEQPX9IBBDN2mll72pVheI6VNG9pi/lBJIyZMewaAHTiXdb+FOSwhTppK7tdjrqj6TMBQL1MRVr/rGbgTvWhxZbWYCEAknTEWRhdMim1ZyGCXoAAjPS8pfCI7bNEcSrdpO/DO4hMCUyRPcGM9XviKbDgpAJ/XoocJj/l1E2EvZLbktyyGUThvhncN5NpabnwKnITiW2KHVXjJs0+ok/J38w5jCKhEl4H5tun/fzQFrYXP5wpGJmvZie9xbpZaYvJxA5r2okEOeEZSX+GR+cdZ9gTZtouAvPvQfTQwRXAFMoeStJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5BvTn8RP7T1gGrq+r+B32FCLNbKbAQxECCv+rZ7kBQ=;
 b=C0p/0nLGDjfs6D9ZC9Y/XfTiVO+qrPTomAeRThvY+Zz7vauv4Dek3IwX3b30urx6fcPp+D/dXQbE94+JdYsRtVjQN6//0k1uxg8CfgbZcDuHMuDsXoIodilqkdafcgVQGAUDot+CI05ITAxxr4nECtCzMKzt4X3f3s2Op6De12zNtK+QrQW5RsFrMV5Gr/UxPplDhQo1q6IsfJGkO7a+dIRuxv7HS1zAPQqguO/JTjcKHxTa5i1z9Q/tgOVlTnsncJsaKXYXumU6qiQqF9hEz74b1cxkk9PQUGaAU/XaDprWCCsRg+IDMQxqkmTKOvSLIYEcuWU5Yspn1wuY5usdqQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>, Alejandro
 Vallejo <alejandro.garciavallejo@amd.com>
Subject: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
Thread-Topic: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest()
 for PV and HVM combinations
Thread-Index: AQHcVW8mVQ2jSEgYfEK6o/9vmk6AaA==
Date: Fri, 14 Nov 2025 14:01:19 +0000
Message-ID: <20251114140117.270461-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB7173:EE_
x-ms-office365-filtering-correlation-id: fb9cfb65-a145-4594-68c7-08de23864979
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?T/v57I+jl3d61PqGwwm+ag0Ex0bBmqAMj+GqQQ2H6uNrzfescmzGbE+voQ?=
 =?iso-8859-1?Q?LU0XJLO96kPARuwTMBHqyX0+3FKy2BwLGwsdL3BK/Lh6H6TAAn6CtX8D2f?=
 =?iso-8859-1?Q?mO0VoRrqQsKGpVZIODPqT6oYNmEUs9qXi22T55OWGuIDSMQRhfv/dm/IMC?=
 =?iso-8859-1?Q?hVBpMrfmxfXwf02kztS7fgK5tvzZN1Q61NHh6vO8Xv7Oo79AjF7bNQlssU?=
 =?iso-8859-1?Q?niVEGsZp1mxuZ/Lb1/s4tKdPVYqLbLm331+0MF7HmeMlUXi0Xya2sZEGr3?=
 =?iso-8859-1?Q?GRsW88kaS9GNK0I5nrKhRlBNa9pVyOJyRd3/+nebvhpX/HeBxrxUdcDfU8?=
 =?iso-8859-1?Q?KBNmJmiUtzI85eUODx3F+DcQW1WmTxOeT+pjP/0US5bqGsocqPPi2KZffG?=
 =?iso-8859-1?Q?UylhmPSpQQH0gXGQWdvDm4XtXgZnJY9LbYbLYwXeiXP80Q9TWNYtZ4jUB0?=
 =?iso-8859-1?Q?BwTXdRXaxwpggmzxfODmPqWyD+SWIQHzc/0EOvLgDAam20sDxprB79zRZp?=
 =?iso-8859-1?Q?m4czO7h4LAOwHw7PObdXB1okz2CMsQQpGXTaA2zVINrAFhpeWq4L4DXNAy?=
 =?iso-8859-1?Q?wLh7XiojVC2cA4/QLZTgFv2ybdMsoPg2rfiIftY+acsoiU5qg9wXE7dWAi?=
 =?iso-8859-1?Q?Lx9wNH0LhM9B5qRrHhRppKPqLH5RH9BNoZdmJ3b3vjWljunx2E+WWtcBIJ?=
 =?iso-8859-1?Q?+B21k7k0LWtqqBfASGGipFWCudRsppox3mL4fyWG47MGQtFiqwEeC3Xsct?=
 =?iso-8859-1?Q?hbBKx6SYmVuSSDPgah/JC4Fx6ZpYaNUufNql8h7sXx8Jw2cu+pO4jE22cx?=
 =?iso-8859-1?Q?Z0SZ0QnTxf4+J2kwLAGZUWVqVIPwqmp7QDnN8uRkWWVpG+WjqD5XM+WhFN?=
 =?iso-8859-1?Q?9KBg4MZPcH/hbqCjUGBTAqKkS/qH23d9IQiQYqCmXw2IZZcq+tq/4+Yy9r?=
 =?iso-8859-1?Q?HsJrRX0eRy4RhNGLh+yH88duuMOyBcB2m+jsHwOsTJYAFsxujJ/E2ei0FC?=
 =?iso-8859-1?Q?JNg2mYpB7UTxGKHgP3Jip6RdINJondotYSlCC2LmFhiiwYbD4sUcuNwVPZ?=
 =?iso-8859-1?Q?J2knkmx/+uKI8Ej3GbR18R2up/IzanwTbF3vpDgEZht4dOYleB6ksyyx8c?=
 =?iso-8859-1?Q?nUCis07koEBZay17zRh6bWO4ZeqWiPQGKMcNXgAPYuJZoYbxkVBF2Hcas/?=
 =?iso-8859-1?Q?4+gR6ukxtIqplmb4pwwN3skFcpYDp9xh2hNZLGyzgJQ4H04JJbbORvupdr?=
 =?iso-8859-1?Q?91thLQH1vQdzdtme9enuTOSgyqNRQ/ug9vS4uCnJPI0iU4bddryFRApHxi?=
 =?iso-8859-1?Q?KhjgWQEShD4FFauZlqT4Z+o29yALR9n09ldnppXNgJBN4xGtKrw17d7m8l?=
 =?iso-8859-1?Q?1vXuzhts12zqCQebl094kTdTCNterhxweXW2rPQmPychIVjG5e/JoKAjlv?=
 =?iso-8859-1?Q?REwWF4VjYwq3su9kqkyD379iaw9sXbLJ28Cv22bbDZGQE1zAZgMDryttbK?=
 =?iso-8859-1?Q?bGvtXBeBan1QHgUkSOqOI9G/yYofYNc8wQ71xCy4PqJQkrDjEkFd06uCeA?=
 =?iso-8859-1?Q?8+hX1MUpbfKb/DGBi5EroFoyD3CZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SIpA54Y3S3jaPN3RbB4/KMj0xOmlboxIlX4YH6zT7+og2/Vd2pFk0fqs61?=
 =?iso-8859-1?Q?KHOfPaStiaMg5IqJsRL1O/6ZPbGLDQyjWWF1zXf3C3gE7tOWddwBD2Ozrp?=
 =?iso-8859-1?Q?dPsphe5agk2+4wsmNm9K/fZL/Ltw+uFxEbLkgVofrRu9neVh4AcfzSKu7b?=
 =?iso-8859-1?Q?GN67OSBTkXiy5nevRfGAG3oFmTxw7eRL3Md7F93Y4zn28jQZ4CiGcJcE5P?=
 =?iso-8859-1?Q?yJz2RTyHYuQpgNOv3z2XNtKHKt+0AE9pnbK3KbM8KnjuYN9o3sa0+UeXAa?=
 =?iso-8859-1?Q?9erJRelYv2iGu0QPimGHeh+XHdZWXv1Nxrj8qSZ9akmYqqoFVap7QZYL9o?=
 =?iso-8859-1?Q?VUVH93BCpJhMVQTNVM+BQDy2KW8hkHPGe4D2rGEKIfLRhyIaG26xDvBxka?=
 =?iso-8859-1?Q?eOf26o8oHMLoLOC2uJ0iH920Tqk9KGBLHjbXZr0K4SfBeNUHIwDsNVC9ux?=
 =?iso-8859-1?Q?G0laoO/0pYfYm+Ev/P3CG3rWNsRYjfvt/3bwz9kinb6Od/K7ZarLCAn/Nk?=
 =?iso-8859-1?Q?Us2Me1zTrBkZjPil312Ve9LYtr3M4jJj9Yeow1Rc7y+L9vYKvJaP9xjY28?=
 =?iso-8859-1?Q?tJ72dNtpvl8ePhxCc6K095YV7ANu0N87jjDLhOiAbRS6dyUUB374A8nzd9?=
 =?iso-8859-1?Q?bmoZSolK9zH+sxEu5dnvHh0qVB6X+xyd7Sb+AXji0N0RKujmjdiqlj2hd7?=
 =?iso-8859-1?Q?fovG/7TTwLU58cC4jQXWrtnd2PiDRM9lmQEp2bM+xbSth/ERWkRy578q3/?=
 =?iso-8859-1?Q?2+P6clTmKTPo9IyQByyAI36ZjyZMHF1VcT6+/Iyzq+0/JZNQskTpr7xl7z?=
 =?iso-8859-1?Q?zwJNcqxkDIu1yzQtfO8Hu58ztq/xZ+4DX/eqTvfK6gT78LNMWU+JvltnPE?=
 =?iso-8859-1?Q?AgZfl5tkQKjvWLuMg9seddA42fVGxeJFLPBham6ulkLYQz9FrQrxxgOWnt?=
 =?iso-8859-1?Q?XWivW5PhN5o3pOicFH3XLpNKjnWCQ1slxfizBR/L9UTf8Q7ZORr5zlvJ1L?=
 =?iso-8859-1?Q?DFENiW4xP4lbN2F6kRjkbTALza4ZVU5BpRr0lP+yxSr0ugxdWzqZWHp/Kq?=
 =?iso-8859-1?Q?WL8D6y+p7zqzw85u0ub72KaEwOQjoL5Qrmpn5MfxX4bj2/H1Sc33tM2lOS?=
 =?iso-8859-1?Q?nin0JbjVwgOdNIPNwVRMHw/2y6vJ+F1fTWbc+xnQIShT3RHEPPHZo0VlYq?=
 =?iso-8859-1?Q?/aE/4EPkA56R6CQZrnI/5Cx9i0zEI90Acqbb6VqRuoJju1YsC6kjKhxnWZ?=
 =?iso-8859-1?Q?c5Pzca/y3V92egJMkBzVuPRxNK9qpnqnZJ2YrT8ziHl5uGlpHuViYULodW?=
 =?iso-8859-1?Q?fnZsPbbFpKgcpIr3Qn5DLGEjPBVubAEfSS95WPyg0UkB+/IutwH88i/ZTM?=
 =?iso-8859-1?Q?kWMknh2hdHoX2v21dZx9ljKsfxSRAvQkIkeG8XDE3QTlzoxLM0z2ClQO0v?=
 =?iso-8859-1?Q?1xVK7Y/ohAL92uH8RTdgCKMSay9j8bp3LUQ9HrZshtUxAhYt2Ytwj5kk3j?=
 =?iso-8859-1?Q?y/ECqJY6BI8BLSBo4hqABt+oVjyUtB6OpY/ZPprm3POyc62QqTWlLrdnOT?=
 =?iso-8859-1?Q?7vy5bKw5fpS6DJg8/InTYNBZbojnLHSu2ryDthnsPfBHwAetBYjEYmDxei?=
 =?iso-8859-1?Q?I5xQ+msTHu3ASAvFvsCChFkPf7JUj7DpIbG5DwTn7TwjQ/6hYVXzbrEQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9cfb65-a145-4594-68c7-08de23864979
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 14:01:19.8007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzRtjHG7V03Hufd8hr1vfuWtc7ntol9wOvAQYsdfP0uEEPCYfsri/UBqufyPnPBXOEJBluKJqohfdW8K2cEGVDRIq4L+2lQPazgz9eXzqlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7173

From: Grygorii Strashko <grygorii_strashko@epam.com>

Xen uses below pattern for raw_x_guest() functions:

define raw_copy_to_guest(dst, src, len)        \
    (is_hvm_vcpu(current) ?                     \
     copy_to_user_hvm((dst), (src), (len)) :    \
     copy_to_guest_pv(dst, src, len))

This pattern works depending on CONFIG_PV/CONFIG_HVM as:
- PV=3Dy and HVM=3Dy
  Proper guest access function is selected depending on domain type.
- PV=3Dy and HVM=3Dn
  Only PV domains are possible. is_hvm_domain/vcpu() will constify to "fals=
e"
  and compiler will optimize code and skip HVM specific part.
- PV=3Dn and HVM=3Dy
  Only HVM domains are possible. is_hvm_domain/vcpu() will not be constifie=
d.
  No PV specific code will be optimized by compiler.
- PV=3Dn and HVM=3Dn
  No guests should possible. The code will still follow PV path.

Rework raw_x_guest() code to use static inline functions which account for
above PV/HVM possible configurations with main intention to optimize code
for (PV=3Dn and HVM=3Dy) case.

For the case (PV=3Dn and HVM=3Dn) return "len" value indicating a failure (=
no
guests should be possible in this case, which means no access to guest
memory should ever happen).

Finally move arch/x86/usercopy.c into arch/x86/pv/usercopy.c to use it only
with PV=3Dy.

The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is:
  add/remove: 3/8 grow/shrink: 3/89 up/down: 1018/-12087 (-11069)
  Total: Before=3D1937280, After=3D1926211, chg -0.57%

[teddy.astie@vates.tech: Suggested to use static inline functions vs
macro combinations]
Suggested-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
changes in v4:
- move usercopy.c into arch/x86/pv/
- rework to always dynamically check for HVM vcpu(domain) by using is_hvm_v=
cpu()
  as requested by Jan Beulich

changes in v3:
- add raw_use_hvm_access() wrapper

changes in v2:
- use static inline functions instead of macro combinations

 xen/arch/x86/Makefile                   |  4 --
 xen/arch/x86/include/asm/guest_access.h | 78 ++++++++++++++++++-------
 xen/arch/x86/pv/Makefile                |  4 ++
 xen/arch/x86/{ =3D> pv}/usercopy.c        |  0
 4 files changed, 62 insertions(+), 24 deletions(-)
 rename xen/arch/x86/{ =3D> pv}/usercopy.c (100%)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510e1..6e2b17471719 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -71,7 +71,6 @@ obj-y +=3D time.o
 obj-y +=3D traps-setup.o
 obj-y +=3D traps.o
 obj-$(CONFIG_INTEL) +=3D tsx.o
-obj-y +=3D usercopy.o
 obj-y +=3D x86_emulate.o
 obj-$(CONFIG_TBOOT) +=3D tboot.o
 obj-y +=3D hpet.o
@@ -92,9 +91,6 @@ hostprogs-y +=3D efi/mkreloc
=20
 $(obj)/efi/mkreloc: HOSTCFLAGS +=3D -I$(srctree)/include
=20
-# Allows usercopy.c to include itself
-$(obj)/usercopy.o: CFLAGS-y +=3D -iquote .
-
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y +=3D -Wno-unused-label
 endif
diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include=
/asm/guest_access.h
index 69716c8b41bb..f0e56b112e14 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -13,26 +13,64 @@
 #include <asm/hvm/guest_access.h>
=20
 /* Raw access functions: no type checking. */
-#define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     copy_to_guest_pv(dst, src, len))
-#define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     copy_from_guest_pv(dst, src, len))
-#define raw_clear_guest(dst,  len)              \
-    (is_hvm_vcpu(current) ?                     \
-     clear_user_hvm((dst), (len)) :             \
-     clear_guest_pv(dst, len))
-#define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     __copy_to_guest_pv(dst, src, len))
-#define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     __copy_from_guest_pv(dst, src, len))
+static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
+                                             unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_to_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return copy_to_guest_pv(dst, src, len);
+}
+
+static inline unsigned int raw_copy_from_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_from_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return copy_from_guest_pv(dst, src, len);
+}
+
+static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return clear_user_hvm(dst, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return clear_guest_pv(dst, len);
+}
+
+static inline unsigned int __raw_copy_to_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_to_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return __copy_to_guest_pv(dst, src, len);
+}
+
+static inline unsigned int __raw_copy_from_guest(void *dst, const void *sr=
c,
+                                                 unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_from_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return __copy_from_guest_pv(dst, src, len);
+}
=20
 /*
  * Pre-validate a guest handle.
diff --git a/xen/arch/x86/pv/Makefile b/xen/arch/x86/pv/Makefile
index 6cda354cc41f..59489cd75af6 100644
--- a/xen/arch/x86/pv/Makefile
+++ b/xen/arch/x86/pv/Makefile
@@ -14,6 +14,10 @@ obj-y +=3D ro-page-fault.o
 obj-$(CONFIG_PV_SHIM) +=3D shim.o
 obj-$(CONFIG_TRACEBUFFER) +=3D trace.o
 obj-y +=3D traps.o
+obj-$(CONFIG_PV) +=3D usercopy.o
=20
 obj-bin-y +=3D dom0_build.init.o
 obj-bin-y +=3D gpr_switch.o
+
+# Allows usercopy.c to include itself
+$(obj)/usercopy.o: CFLAGS-y +=3D -iquote .
diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/pv/usercopy.c
similarity index 100%
rename from xen/arch/x86/usercopy.c
rename to xen/arch/x86/pv/usercopy.c
--=20
2.34.1

