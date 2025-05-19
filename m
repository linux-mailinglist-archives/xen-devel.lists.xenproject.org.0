Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622BABC31D
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989963.1373947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2le-0005kJ-VV; Mon, 19 May 2025 15:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989963.1373947; Mon, 19 May 2025 15:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2le-0005h9-NH; Mon, 19 May 2025 15:51:06 +0000
Received: by outflank-mailman (input) for mailman id 989963;
 Mon, 19 May 2025 15:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2ld-00055d-Ok
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11ca88c7-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:04 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:57 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:57 +0000
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
X-Inumbo-ID: 11ca88c7-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGg/9olLSQyFXp3WI5g+gqj1MIB07JU+yLK3Ts6j2cLNgHgEuiuW20D48yapSVv1MSFPqpPOA9ClHWtTCzniTKI5ZQw/AgqQozUqAiJkHgSmoAM9gIy3V3IO0fnqUXOUJkBa7lYNbIDrWfoVdWb8rE1dJap5cwCNtx5vZrw857b39AjEoWQR1WpVJ18qvcc/mFI9zaV9lMB0s6CPF2AORz6hZz2VzypjQuNC5VGjiWSrfSryzqAdilR/4qyjK4PXhyRYR360gIz0miuJ23j1REACtZOv3ZlR5cTmXSYsUeFbIVxPVt3D0Z7UAH4RnEs4hbHjpzgAh2Rt+VKfuhAVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz/ZMdrRc7mCeJ8Rd8uhD1laT/igu+PIiYNbzkSXnXw=;
 b=awZAs3EoEJ12YoBTjpzM/OQX5ydkFI3y2OXtaW3q3dULc/T6LU+FaA8cV3pCGahU2sac65TZiuf2JYAUN4baNLWXnGnoGL3snLTkGCBmrPH++IDwyV1OMiTXQNlAAlOIFM7HFUw8GVOf1nh8QDlj4s7a6mj6hz1eXS69No8+W5a1GU5sQRfIOP9aYmpGl4ygG9Y6fdPZ+o2rFGKsRaZHwezNKGY+1aR3FzD9fP0D7PdpFPYEbOugX8WQ3tyrfEtmPyIAoUFuIyoVvneISHhFfsfediy5b8Zop15re/ytHVLU9tsuEkGMcd/LGfBXgAGKP346odYcnI252bWzK9xWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz/ZMdrRc7mCeJ8Rd8uhD1laT/igu+PIiYNbzkSXnXw=;
 b=tFyoNb38GDdxQWh9E0i6XSWddce2ipDDfWHSFNbOt8/8nq6iE5F0qVITv5LBuLqCDJtzJouVTPmN6hKW0cL3BEOxEFc08nkF4dWI70pZlGEJAy+ZHwzmA0TN/QALXWzQl5LKKjYE8s5Lwl6v//fuq5kvRZN+LqMc4Q+UKh4rSqQa2UOO/8lye8fbc+IV3kBb7nIbe6q/XLWI/lIsIfDs8B01+WdNVMmX/PyqPy7CBo6bkpmSoXm3reIYKchopiPchv8oUczK/L7ZWF07MYCh9fiD0/cU3DLdUklQSFQWdev2uM4X0Gw31misgoGpzikri6ri0p/VhSLrz9WwdEOr1g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v4 4/8] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Topic: [RFC PATCH v4 4/8] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Index: AQHbyNXP0pQacOnhI0GW40rDQn7cHA==
Date: Mon, 19 May 2025 15:50:57 +0000
Message-ID:
 <66d4472e46d94e4b64027986f004b98f610c4f1e.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 33e991e4-a9a5-4dc6-930f-08dd96ecf219
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?z2dnIVCiRsGu9p73VfXaMrx2qE9yzZOPkZ5CMVe1S2cvzAXDLGA6IeHSk6?=
 =?iso-8859-1?Q?WpGsuCQPHKXNWF/KuqNmliXjrc2r8XC7mOD6r5Y3mzVLvzWSkCOwgk5LMo?=
 =?iso-8859-1?Q?McnVpcGBvJoiOw2fEGBzU3GaZoQEHPbjb+XZB8IxFQiXRimR9Q1O1oJFZu?=
 =?iso-8859-1?Q?b99/P6wdpYiEjzGInbTI9ASlGMaZnOuwIeOR0ZFRClMGC9RCg0qdd/9k9n?=
 =?iso-8859-1?Q?EhNuDKh5kjZ+Vd0Xmy4quIJnWnq+tgsxuMqzhmk6pXne7tyHskDjwCHndp?=
 =?iso-8859-1?Q?jd3Zqszo2cuw9CCMb5BjmEW2wTcQfTx9pllPLF82vuR6uqwXOysx8Lskfi?=
 =?iso-8859-1?Q?olveXbWkAsL8mAEHZsbLMXIaMNcdscpS/GbCnoAPwakXjTT/teVSLw1AkJ?=
 =?iso-8859-1?Q?nSt/CTDkNaJ9JIUKcqT8WCYyuUu2DURcpVOpR+1fDzIB35hGOWQjhi0AT1?=
 =?iso-8859-1?Q?yL7YT2JnDk3DCX1FbFGkHsVWR04gGkbCFlpEyVzbVOLz621ScKBrwggoJr?=
 =?iso-8859-1?Q?4hGTbfSOHNurBOnE/IxMqD7C88Bs1x05qhZOAa9e2ehNdUU+AJvON/8Cb3?=
 =?iso-8859-1?Q?AcU5Vr+1zddkYCuMpMuUOpTqO8ECF1D+L73cuUu5Avf3g/HEWLP5nW/HEt?=
 =?iso-8859-1?Q?08ZK3bifhgnh2znumhOA7C+GKfjXvumHvUc9sa0tVgOr8x1k7dvbi7S38t?=
 =?iso-8859-1?Q?37M2KM5ie29iz8OiODjsk7RKfYMQgd3TD/KXfyN1r/nioEs+AXxN+xUXxu?=
 =?iso-8859-1?Q?J9Co67luaBv/YDlJVfL292H2yvcIDIDXtWxlSQ0PxyF3lwCqRu2doRkPSs?=
 =?iso-8859-1?Q?QTp+Vyxf3X+4w4Fk+KRw4ruxCbin1XUd8VM7pIsRg86CpFPN9b7lWpIDAN?=
 =?iso-8859-1?Q?/0T7QBpuBSe2DFi3GSLWdlenLf+CwYa+MfMRUjhKD5Vh8Ptw85vp9TRtel?=
 =?iso-8859-1?Q?a8u3HEVlkVmC4OP+R3YfVoE7PZ9tRsqzPxRyNSMKBSzKqKW9mSaK1n1Pxh?=
 =?iso-8859-1?Q?kaRZ9X96AZ8l/WtT2c3yzbYirJM8ayU7+XT3fraOASImswZQzTk+N4cBij?=
 =?iso-8859-1?Q?aU8aurIWBHBnx6BO9fdU07slTGTM9HAjXURGZy6VoICZ4MTINDXpN3rB+N?=
 =?iso-8859-1?Q?/CldQEx6blYDGlmooon7DUkAO1fPRPKNKCtgIpr/lZLgGa42RBAa0LFCZ0?=
 =?iso-8859-1?Q?gY3FrzlXAuMSr4PJik/g37rzeVyKEYJx/T24XlqMHOAIbef+tmk/IxYrXT?=
 =?iso-8859-1?Q?qfjqheQYFSyhwOSrzysnLeNvxnTbdSJGkHWIAh3+nd92ArpJ6T0lPYPPRk?=
 =?iso-8859-1?Q?uXbny86U1HbsBY5ibxiHPzBGp+TalwABiiAdmbpGJl/Q1ktIYTt9yvo8T1?=
 =?iso-8859-1?Q?Ys9DlrKjzVe1Vwvb/P79zYA+gFNWiStgEkdfHvKEY6zqmVoaUwqqgXSApj?=
 =?iso-8859-1?Q?92GIixOAhty/AFLLQhXu8C9IHu06n/HVZ7fwMfU0al7Kn3xRhJCRd+07Jp?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xZ128+rPSw8K2EvKIw5a8uaYM9e4GdKOYll0AJ87uVsGaPZ/cDxp4BeABC?=
 =?iso-8859-1?Q?EWkiXojaIhQBXjal1j3InLMjB8mflmqhrAJB79W0HcdRriXHKiJf3LzVup?=
 =?iso-8859-1?Q?ktDXZ6v9EqnLLqGmGcT76wb+f2zGLNGC+sC2nbt909geNoCtvlKEbd9W/L?=
 =?iso-8859-1?Q?NdSzDBAfMVrGrLGqLMxUZ/2Jgz0XdfBzIVmXk2lQyCmPGeCDr9svQNrRWw?=
 =?iso-8859-1?Q?XR7Gu9lxLHyaIC2+SztnvG6YHAqyW+yRWRVxCgvA2eT9Fv3Ki6PjJzwXDR?=
 =?iso-8859-1?Q?RhGPGuZWUtW7Rh1nGsn+OD0i9SnmhyDPuL24a4LH0XcXq0Lesb0SOqlD8U?=
 =?iso-8859-1?Q?Cti3Q76bA7n4LT/dlCi6eGD2+6rPOjU/Ez6Gepek6EdR4cX9BlI2tsxiuw?=
 =?iso-8859-1?Q?7kkQSQS3U1TEAa+iYd2KeRJx5vSo3pDSpGR9r6xBYUt5Gm3EyvQ9K2l4qF?=
 =?iso-8859-1?Q?TcNdsFowMYV6Moov+jUHW1i2r6K4lHVvrEUH6ohxuWp4Y+n+e5VH+x54kJ?=
 =?iso-8859-1?Q?r+zXEnhY45fkqPR5WP8ouBdLCX7D1LN8PN1moDTVEjiH/LnOwwBy2aeRUI?=
 =?iso-8859-1?Q?+csWC2l5ng7SK4TIWOEp9djwndN7ech3e5Qqhth/Gl81q+t3mxlvd2yBZg?=
 =?iso-8859-1?Q?beBKFEw9/zH/wePvfo3uankCnkBVSzdnzafbcicFCzmVmgjjJR1DIfxUlS?=
 =?iso-8859-1?Q?+Kdt4q16g30IDRPUviiCy8kmhPd4XLX6+BvHJ5o3TM39h0RBP9NtLvxteu?=
 =?iso-8859-1?Q?8OqqKywuMda68+TAu25RV/l4kOxPGzNinpz8eQ7QFDjXI29S3B9RREkbOK?=
 =?iso-8859-1?Q?7XlXstgUAz+r2bvMU+a8YFIw3/Hbziehw/JLYV9Gl7xEu04hlsdzG8aT5l?=
 =?iso-8859-1?Q?d8Ifs1hfe7Q2SZQBhTKnVGfzr5l+BkJkb2KhWbWeocooBbgfeuBSbYJGRN?=
 =?iso-8859-1?Q?Mx1yD6DX4z6fuiKm3a5KJ6p4Jjz+MVm+RKuio+rrna8A7HKFG4RsYNoWxb?=
 =?iso-8859-1?Q?OombYBZxcREvtl6D7pCUY6/FeiOSdImotHBFom1W0YosKMnV8hyxJhyVad?=
 =?iso-8859-1?Q?GzYTCD8/Jv9F7t2Z5POx5ykheuvO6yFkjfIeks2J+IkIBOMKWMAasDgIiH?=
 =?iso-8859-1?Q?pk/EBMXm5ETjj+FNVLGorJcziOME8VJdd/uDMYeohksQQcvbptRtad/9lv?=
 =?iso-8859-1?Q?TCzwVWrAoqFMtOmjxDfZWHyDlu6linrmU9rtC5OP4HGiQXoqPb7VL8/A/o?=
 =?iso-8859-1?Q?r6/ZxMddqtiqxDLWtqUFYAAMAjcX75kR+m4eH3rlawtJc5jFzCFtU/abPZ?=
 =?iso-8859-1?Q?18oiJv0xQar0SjZK3e+99wPpZUVgtNS5dZlpmRZe8/aKvNRe9wMRtPX/l2?=
 =?iso-8859-1?Q?Qd4hhBcThZGFbGtatdea4wGhbdyNuoJ8yELEHKv3WZOaVU5j5IXdMatMHf?=
 =?iso-8859-1?Q?M6lMyQKLZOvOAjqz2pJZMhnp2iwzl8R0flc/3EofSpGYwjD2jDvZLeDuyT?=
 =?iso-8859-1?Q?y0VlfKSmEXBiWb2Twkurr1BDjvhBrcSpp/LXeHXxKXKJhFNZXTApCaeZHo?=
 =?iso-8859-1?Q?SCgyio3fvw1hp9y+zcPp5+gp7QIGCNK4sef8SlfkV2yHh6iizrgG708mfk?=
 =?iso-8859-1?Q?sixfYtq/iKuxi9gY9DO27S8mAcjA7woVwp8qtTfd2x45rTb49Aovyrjg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e991e4-a9a5-4dc6-930f-08dd96ecf219
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:57.0715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AR9ArqN9KAA43NJygCAs3IXpDgiZpyigFnGBsRgaX0dWWnz9pdY+3YRyFO5P9jJHwmaMdv7Frw+WNXP3AUH5azjxCT3uOXH/yetLS1b1MV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add documentation section for Simple Arm SCMI over SMC/HVC calls forwarding
driver (EL3).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 .../arm/firmware/arm-scmi.rst                 | 177 ++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 3 files changed, 187 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
new file mode 100644
index 0000000000..bf6a458a6a
--- /dev/null
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -0,0 +1,177 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM System Control and Management Interface (SCMI)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The System Control and Management Interface (SCMI) [1], which is a set of =
operating
+system-independent software interfaces that are used in system management.=
 SCMI currently
+provides interfaces for:
+
+- Discovery and self-description of the interfaces it supports
+- Power domain management
+- Clock management
+- Reset domain management
+- Voltage domain management
+- Sensor management
+- Performance management
+- Power capping and monitoring
+- Pin control protocol.
+
+The SCMI compliant firmware could run:
+
+- as part of EL3 secure world software (like Trusted Firmware-A) with
+  ARM SMC/HVC shared-memory transport;
+- on dedicated System Control Processor (SCP) with HW mailbox shared-memor=
y transport
+
+The major purpose of enabling SCMI support in Xen is to enable guest domai=
ns access to the SCMI
+interfaces for performing management actions on passed-through devices (su=
ch as clocks/resets etc)
+without accessing directly to the System control HW (like clock controller=
s) which in most cases
+can't shared/split between domains. Or, at minimum, allow SCMI access for =
dom0/hwdom (or guest
+domain serving as Driver domain).
+
+The below sections describe SCMI support options available for Xen.
+
+[1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`_
+
+Simple SCMI over SMC/HVC calls forwarding driver (EL3)
+------------------------------------------------------
+
+The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pret=
ty generic case for
+the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI=
 firmware supports only
+single SCMI OSPM transport (agent) with Shared memory based transport and =
SMC/HVC calls as doorbell.
+
+The SCMI over SMC/HVC calls forwarding driver solves major problem for thi=
s case by allowing
+SMC/HVC calls to be forwarded form guest to the EL3 SCMI firmware.
+
+By default, the SCMI over SMC/HVC calls forwarding is enabled for Dom0/hwd=
om.
+
+::
+
+    +--------------------------+
+    |                          |
+    | EL3 SCMI FW (TF-A)       |
+    ++-------+--^--------------+
+     |shmem  |  | smc-id
+     +----^--+  |
+          |     |
+     +----|-+---+---+----------+
+     |    | |  FWD  |      Xen |
+     |    | +---^---+          |
+     +----|-----|--------------+
+          |     | smc-id
+     +----v-----+--+ +---------+
+     |             | |         |
+     | Dom0/hwdom  | | DomU    |
+     |             | |         |
+     |             | |         |
+     +-------------+ +---------+
+
+
+The SCMI messages are passed directly through SCMI shared-memory (zero-cop=
y) and driver only
+forwards SMC/HVC calls.
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI over SMC/HVC calls forwarding enabled support, enab=
le Kconfig option
+
+::
+
+    CONFIG_SCMI_SMC
+
+The ``CONFIG_SCMI_SMC`` is enabled by default.
+
+Pass-through SCMI SMC to domain which serves as Driver domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This section describes how to configure the SCMI over SMC/HVC calls forwar=
ding driver to handle use
+case "thin Dom0 with guest domain, which serves as Driver domain". In this=
 case HW need to be
+enabled in Driver domain and dom0 is performing only control functions (wi=
thout accessing FW) and so,
+the SCMI need to be enabled in Driver domain.
+
+::
+
+     +--------------------------+
+     |EL3 SCMI FW (TF-A)        |
+     |                          |
+     +-------------^--+-------+-+
+             smc-id|  |shmem0 |
+                   |  +----^--+
+    +-------------++------+|----+
+    |Xen          |  FWD  ||    |
+    |             +--^----+|    |
+    +----------------|-----|----+
+              smc-id |     |
+    +-----------+ +--+-----v-----+
+    |           | |              |
+    | Dom0      | |    Driver    |
+    | Control   | |    domain    |
+    |           | |              |
+    +-----------+ +--------------+
+
+The SCMI can be enabled for one and only one guest domain.
+
+First. configure Dom0 to enable SCMI pass-through using Xen Command Line
+**"dom0_scmi_smc_passthrough"** option. This will disable SCMI for Dom0/hw=
dom and SCMI nodes will
+be removed from Dom0/hwdom device tree.
+
+**Configure SCMI pass-through for guest domain with toolstack**
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
+
+::
+
+    iomem =3D [
+        "47ff0,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+In general, the configuration is similar to any other HW pass-through, exc=
ept explicitly
+enabling SCMI with "arm_sci" xl.cfg option.
+
+**Configure SCMI pass-through for predefined domain (dom0less)**
+
+* add "xen,sci_type" property for required DomU ("xen,domain") node
+
+::
+
+       xen,sci_type=3D"scmi_smc"
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above and enable access
+  to the "arm,scmi-shmem" according to  dom0less documentation. For exampl=
e:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/ar=
m/index.rst
new file mode 100644
index 0000000000..7aae4a0a03
--- /dev/null
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM
+=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 2
+
+   firmware/arm-scmi
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.=
rst
index e4393b0697..520fe01554 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,4 @@ Hypervisor documentation
    code-coverage
=20
    x86/index
+   arm/index
\ No newline at end of file
--=20
2.34.1

