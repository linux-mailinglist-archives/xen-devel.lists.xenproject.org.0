Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39CEB9C1A7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 22:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129704.1469535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1WDM-0007sb-8Z; Wed, 24 Sep 2025 20:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129704.1469535; Wed, 24 Sep 2025 20:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1WDM-0007pw-5h; Wed, 24 Sep 2025 20:35:48 +0000
Received: by outflank-mailman (input) for mailman id 1129704;
 Wed, 24 Sep 2025 20:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjKe=4D=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v1WDK-0007pm-Br
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 20:35:46 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aee235d-9986-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 22:35:43 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS4PR03MB8205.eurprd03.prod.outlook.com (2603:10a6:20b:4f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 20:35:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 20:35:40 +0000
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
X-Inumbo-ID: 0aee235d-9986-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpgIu36CfE41baqJK7QWmOs9J5+os3jDk+Bwm83O2f2WVQdHBUihMyn/7Ne/bM6+mPcWnB8w6yc/1jUz/RC1ahOrK11p9ARrPDMc9QlJOvrq6D4vG1JxGgjNbnCOshTdzFbU5wsYWjPpvCrze/oZkBiy/vHfzeq9RG0YF19PqNmU6p6sqTuhuDCer/+m1xRG5ckeKCXsERRtxY3ST1s6nlErxkezhW/67gy6NpfG5Ag7bM4/Dq+V2M9314Wz/t7omb7ezQ2nLgXzwhvB0AsNK3d6Iln9NcfiQdB3f6lnZ3yOKN7tiHdYAxj4DGboNFAWEAUBzhT61VlPVgZmbVWesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB0+C1pxh8R+Ds/c0r1Xd+nU31NJsXRp6/WwQyk7idg=;
 b=Aus6GIuejqWCT1gEhNkSPCsbia1/Jhh29dfnqGzKLYkBZuJ/5+MLuP2BTZM7V+rIUWBW+ulwdxT/3gNA3Ar2oLBl75FZdLAXyVblzkkPIGH+57ZHcmnpeY5XlqteGpkn0K0l74a5iUSTQGE2BvA32+uHDEGniIvB43Ts50iWjzkLMvSIEp5dFsxzomyTBQ3GIRyl8wazmroL3QW2dnRbNrzOvG/EJNd++K7uOqGwO/PfPDsLagoOgX8JRYukym2Awq1fXngbfo/ATCxaCo02jmISYc5yjU0q05L2Vln+ScPxkM6aV9gLtODAteXPSfiA5PmgNnOz7uIk/YY2o4BMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB0+C1pxh8R+Ds/c0r1Xd+nU31NJsXRp6/WwQyk7idg=;
 b=c84SM+dRJio53FnMSbqAw3T7PZnYr+SwZ4Kv5tQA+iIty7mfRAsX5ZAPi9jPrOuOQ9yGd4HHjlC3vrIzDFqXV2DVfiy/uoUleAToofdV520nwSZgJIU5jini97c2e5WQa82XEVks61yAcVi5DLRKBQd80B+WYTuxSocuwJ23IXW0HkPtxMXg8OQUMLZOzZYO9jy1K2hlI6ZbwpFjr+kF/XUb6e7w1igTxArtxZ9oMHMAZCzHT+uDLbEVFkmvLObxtIOQlpDBCOZY4Y0ndJ5E9yv8D5itnYTz0U8GOgAS17ofcUgchK8ksOeBa3X2ulWEAYr/+ZwT4vy0bL+N+JQ3zw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] arm: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH v3] arm: address violations of MISRA C Rule 2.1
Thread-Index: AQHcLZLK+ABBtomrNE+mTHydZzSxzQ==
Date: Wed, 24 Sep 2025 20:35:40 +0000
Message-ID:
 <620eb8fe22204e204cb471e93d2ea789f879d854.1758744144.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS4PR03MB8205:EE_
x-ms-office365-filtering-correlation-id: 77500320-1a9c-4d72-6e4d-08ddfba9ed1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bkL2t7gx/GmcDeVKIjNhExMenKNlEGoE+mXqxNXcQZ33kzxWB2XI9+NRGL?=
 =?iso-8859-1?Q?6YyEFSwQ0HzbqCwpg/j3CqdTXG8rUrWzqqYz/hxiFPY1Aalq7M/5+Upj55?=
 =?iso-8859-1?Q?bkHRdzTsoNjCsrGw4IVQiQnx/TVkYming5OdszGSdUneeMhr+7oT78soPU?=
 =?iso-8859-1?Q?9eJ5V+MdixFABeSuTRxBU6hJUk6m0oPVDl7TDX6Ip1p/xWyWmVNfJqPS3B?=
 =?iso-8859-1?Q?5v1DGb/J86SiMSdH0XMpLjLw8zogtQ26mMiWYJCELQezcWTN+lKJvHjtgd?=
 =?iso-8859-1?Q?wb5Q669j/Z7+iiyNX3rna9kapPMQ3gz43trhbPy1Np7Eq/V7EMEXifFlhg?=
 =?iso-8859-1?Q?z+KokJqwE8hgGTDCUMLr0/dJa7Mu0T2akafXaij10QQbcT/Ih2ymF1xBsO?=
 =?iso-8859-1?Q?9XVBzrwa0tnfgTZd2RlS1QA9OdVHhxqIA2JnrYSKtRBotJ9UQfSbwRafGc?=
 =?iso-8859-1?Q?6LSJ2Ztvpwc/aRHuhFx/ym3dcnOcSs+/BMZEIAAzUStyMLbTysQnILw/u4?=
 =?iso-8859-1?Q?4DNPfp0vj1eCiC9bPhTqUdCBYOvycvVKEEVlnXJn5FSZGWOCb7E9uGWfHL?=
 =?iso-8859-1?Q?ftr8L5jXSi47qj64q12qlfZQAPWOTHrwG5wXDcmaqxX9g+E6DCI75/wmr3?=
 =?iso-8859-1?Q?sAEcLpUpMHjvnpVR7NWOiCchRjgnfUpAUjgEBklKFXn7R/v6IJxHlkuRo9?=
 =?iso-8859-1?Q?FA9B2Jey+hYds48t79yAlPTQUliCh6sFbHLyiGNW2CouGoMdqXkvUMetdJ?=
 =?iso-8859-1?Q?8v1XgAlp8B8k4IKysicvOxpKhNRnwMCTAmIZuUxBuHEm+cQwUitL13wQD5?=
 =?iso-8859-1?Q?CDQPjjAOa0Hj3022orGgbnc3M6YhnniCQzhFCnclEWeZYztygEwHeJgexP?=
 =?iso-8859-1?Q?zE9bBUDArrhAgf14JI9q794zGy3tN6t6cvE94iYSfYWaApv2x7UEiJ4FDY?=
 =?iso-8859-1?Q?GZ89ib4YeWqrkmS3FH5ZuFzXBJDBY1L9INaKVmFqbGSdEl54qDzzWAVgXe?=
 =?iso-8859-1?Q?ZIfZJ/p+QPUzk/ejR+c5+EtKW1WPuLTRFnGBZnQsEKpUQvSXGmT9riivSX?=
 =?iso-8859-1?Q?5oBT+Rndg2tkMzbvwrlh4sedBHagR/pfjFbDOKR818XcqxLS4+irSAh2sB?=
 =?iso-8859-1?Q?Cp5PaaYUF80UkvAG6QxAKFQg2T5622LUh3XpmW08rfAz24TH6ha6N38ZH9?=
 =?iso-8859-1?Q?JBmmOJxCUH1sjGLfkl+iGn0TuaHAFA2XSGkpfHp3YVjFZx2rz2tyJcEXjI?=
 =?iso-8859-1?Q?TclZxFLbXOtcMMDpqF1UtZa80i3dZsPDHsy+ZYl/47imPAnRlfQC5T4VXu?=
 =?iso-8859-1?Q?BRGtagEIXe7I5EVh4S2a3RgOIeqARZGvGHDMqJv2na80rCzJtmBuIYke/T?=
 =?iso-8859-1?Q?LWSqY0H9rOAsZizvoU1kE8x8STwQql4IeBqVRAwosiovfRX7pESezhHpoo?=
 =?iso-8859-1?Q?KHcnKwVNpAb4vMRNm2svpHbAsBN0O92AXoZruINOVBp3IKx6bRw6AoBemp?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eygDxR09523dJHRCHvLQkYrx25gAL7dSUub+frvpBONvgIkuF/DIRVfg87?=
 =?iso-8859-1?Q?Sh483XI7g0JgTgQ+dfbTOQ5DdrevQJY8beoXqeOPf3O5fGYuW4FAcMyjOV?=
 =?iso-8859-1?Q?owgNlZVV9xvC6cWYyzLZhkKGQGH1Uc+26KMZfMMqksrFK7wHn7OcZvC5iQ?=
 =?iso-8859-1?Q?e0v2nlr9Dh/bPg79tXMVBXWdEJXuScIwe7u23sUFHimHhyMOxtvlhKMGUU?=
 =?iso-8859-1?Q?pI/4YVWEDpe6YSWE20EQ0Ma/lG5Ft0DPWBfvXQY1AfKxbDGdsERbzVm7bB?=
 =?iso-8859-1?Q?C/qxeRwB6rwFCOwbB6J/lTwQpB3Q+pkz2Xh2JSZ17lM03bs/SPDTtOcsd2?=
 =?iso-8859-1?Q?rmgLZrWRhWJHKF2w39zqpj2az89VJeC/z4AfWfevjVzed/wN+SPoq7XFzJ?=
 =?iso-8859-1?Q?np+YvzgGhrBKw+XFMEmntuOrF70K/SEaixd9aUgBevZt7CzAKZ0w3xjRxR?=
 =?iso-8859-1?Q?oASo3zezbkOycnK1GbdVyefY6ObsHzZ1RuR9hMalmUT6EtdSJe8T0bGdOA?=
 =?iso-8859-1?Q?quZlJd+wE807GYOsKapfQQCQboXSTZIEG28RNTWkvLRxzeoc6zwr9oiFId?=
 =?iso-8859-1?Q?ByIBu92lfqx+WH+MVUG4Cw/4I766drssNzUwBv86LLirJcx3/xr2uwdYQl?=
 =?iso-8859-1?Q?Oo2cs5hqDkXe34vf5EfsAkfEiC0Do8gctmsbBwWiWQetI7kTsldzYQCJFK?=
 =?iso-8859-1?Q?Zeub6wfdPQJEUlZqEQmAe9UooConOPsN15x4SrWLczyHTPn8ImY5tT9sy1?=
 =?iso-8859-1?Q?7VGRAPWX3+tIIpxiGZ6xjcjgdqKZqZCxMkl/1pmisJakO8hPmZDZEWxxI6?=
 =?iso-8859-1?Q?s2FJUBAu5xej8uWlllVQ0Ok5R1qUQ0pyzAIbjAJFCq6NI167Bq7UMp4zSa?=
 =?iso-8859-1?Q?WTk81zPTIJydANe3LfFMet+Yn57SB38bIPWbhbw54F6rVwsIkRrG9kPE52?=
 =?iso-8859-1?Q?765Dmd8WdwnUNwTWMuxsO5GquH5mmoF0MCmwM+/0Elsgwl/HRljnjWqAJ6?=
 =?iso-8859-1?Q?KG3VwLEcjQSyNM7fPq7voMtLhKiWHWZNZN93yZ+HIECC97zmMh3cEbgFap?=
 =?iso-8859-1?Q?pm6cSxNw6f0knIxB2gCH+7voB99RNrqNw575AhuKPN/Jn6GL8q4iOZZxxv?=
 =?iso-8859-1?Q?99GiBY4IZduEboyHukzk5KVn+OmUNIgTs8NARgauZbhEwUats9+Vcz1uKu?=
 =?iso-8859-1?Q?Z5Y+cccYsjg3j2xzO7bEO9LriiH6e5YYNqWrebdGm0Pn2AUrsCiDTjKS8b?=
 =?iso-8859-1?Q?tCaJxfwuPHe+m0fAnFs/WhDEUguNp6ebyz9sqAL0OxZmiOIdhtBk/3HPhb?=
 =?iso-8859-1?Q?IImnAT+X6wDTEFocs973Yfny0y7bHAqXoubvdIKOBeowOe1Tyw+QJmQpMw?=
 =?iso-8859-1?Q?qJ0UlAeIDw3hhunvalqDzDOb6gQIkXBxvdLXCcXw5EWbvvxecNm0oFRo1f?=
 =?iso-8859-1?Q?mrSlqp2MWTzcm/Oqn5ZbBQyb1vz+q+Nt73GEHvjxDG64mAceRhb3pdoybz?=
 =?iso-8859-1?Q?w8K3ctG9Sm/adjVE2JVYcEVRHQB2iPmo44klO7cf418trW55ovaKU4+VKP?=
 =?iso-8859-1?Q?8g1cw3FJvIHmUgtRegcIMzc11PCPw3qpGwAscdpcn0XivHEJnfn/DLrGN4?=
 =?iso-8859-1?Q?JtSSousc6VN+srPm7+SxZZ1ju/khjJV9BUVadewbgz1lnrl3nXmsTYdg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77500320-1a9c-4d72-6e4d-08ddfba9ed1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 20:35:40.2466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Td12YReJS+9zHrzQaLb934Tz7pqI1kMqMfc537v3MGHOoZ0H15brs9bYhVtvQgQ4yK3kKE/FWQKglGusrKn4lPfuDh8zWaspMxhQqBXxhaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8205

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
In certain  build configurations the following functions 'prepare_acpi()'
and 'gicv3_its_setup_collection()' are defined as inline functions and
contain the macro 'BUG()'. This resulted in violations due to these
functions became non-returning.

To ensure compliance with MISRA C Rule 2.1 remove inline function
implementations and their 'BUG()'-based unreachable code. Provide
unconditional function declarations for 'gicv3_its_setup_collection()'
and 'prepare_acpi()'. Rely on the compiler's DCE to remove unused function
calls in builds where these configs 'CONFIG_ACPI' or 'CONFIG_HAS_ITS' are
not enabled.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Link to v2:
https://patchew.org/Xen/0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454=
.git.dmytro._5Fprokopchuk1@epam.com/

Changes in v3:
- updated commit subject and message
- removed inline functions with unreachable code
- provided unconditional function declarations

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2060806048
---
 xen/arch/arm/include/asm/domain_build.h |  9 ---------
 xen/arch/arm/include/asm/gic_v3_its.h   | 11 ++---------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include=
/asm/domain_build.h
index c6fec3168c..6674dac5e2 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -15,16 +15,7 @@ void evtchn_allocate(struct domain *d);
 void set_interrupt(gic_interrupt_t interrupt, unsigned int irq,
                    unsigned int cpumask, unsigned int level);
=20
-#ifndef CONFIG_ACPI
-static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo=
)
-{
-    /* Only booting with ACPI will hit here */
-    BUG();
-    return -EINVAL;
-}
-#else
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
-#endif
=20
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
=20
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 0737e67aa6..fc5a84892c 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -131,6 +131,8 @@ struct host_its {
     unsigned int flags;
 };
=20
+/* Map a collection for this host CPU to each host ITS. */
+int gicv3_its_setup_collection(unsigned int cpu);
=20
 #ifdef CONFIG_HAS_ITS
=20
@@ -160,9 +162,6 @@ int gicv3_its_init(void);
 void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
 uint64_t gicv3_get_redist_address(unsigned int cpu, bool use_pta);
=20
-/* Map a collection for this host CPU to each host ITS. */
-int gicv3_its_setup_collection(unsigned int cpu);
-
 /* Initialize and destroy the per-domain parts of the virtual ITS support.=
 */
 int vgic_v3_its_init_domain(struct domain *d);
 void vgic_v3_its_free_domain(struct domain *d);
@@ -256,12 +255,6 @@ static inline void gicv3_set_redist_address(paddr_t ad=
dress,
 {
 }
=20
-static inline int gicv3_its_setup_collection(unsigned int cpu)
-{
-    /* We should never get here without an ITS. */
-    BUG();
-}
-
 static inline int vgic_v3_its_init_domain(struct domain *d)
 {
     return 0;
--=20
2.43.0

