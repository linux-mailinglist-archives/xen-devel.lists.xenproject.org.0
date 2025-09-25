Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B67B9DF73
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130159.1469765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gxT-0005qD-AA; Thu, 25 Sep 2025 08:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130159.1469765; Thu, 25 Sep 2025 08:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gxT-0005nY-7W; Thu, 25 Sep 2025 08:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1130159;
 Thu, 25 Sep 2025 08:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6d5F=4E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v1gxR-0005nS-US
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:04:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34273c4e-99e6-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 10:04:04 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM4PR03MB11150.eurprd03.prod.outlook.com (2603:10a6:20b:6cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 08:04:02 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 08:04:01 +0000
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
X-Inumbo-ID: 34273c4e-99e6-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwTewvEEZ/X1q11z8iXDr/ETVotq2QsUNbPmMh83/BoUfQwudtIe1pjLLV0HuRzzhaReboBIf3WCSLoU1fM8kyhcjryXhnd9O7OWRt0isBZmOFVBUnxxO3P8izCSMohzEbOrPEKf48Fwqv+xYdEZwECVN3r4pzbqW+9cpXItJJIwJVa5On1aovLlCRycPugjT+5KStId93vDPJ/n3T9s96DHSlwaxua8Uw8Ozzc5VQQN50FOPnadETzJnlyTONm86HTIBUdSohH92r0swwBwCyrJUptzfcZCmHCMBjCQqc7Xcm8wGI8x3O6cfbffTwNddsuR0ANX23p0WjdAmfdyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8V2jw3fijVSbwQ06T/ajwKaq0sDOYQhSJ9TEUxgnxU=;
 b=lFB+ZT3upn2jmcxFCgW/93gX/Yojxc1SJCMfjqOt7TrvoME3Q4whtoFRJZ5fjONZArZPbFNnKbwXr/+d2Dtu6QGQ7Qvbk3prY0rFT5QIi8gq3+YivhquUf01e3YuoNsTET0nxXU1v6mD1hAvJBbjTIvcmZya3c6OrqMya3C95kfinws/KQbyhHIF2B8P5p9i9zNOqxw2SK/zFmGKptSbZDgiNwVZ6lhR0YAeLcAjh07OuGDFgRTKkP25Iuw3EOttwi4ImyetuEdPmeB1rv7LPSsYKzKCeHN75UcpDt7ehHmnGx/rz9TuC4WgMNLTSnqIxsTUBkZb24DuwrUfGeHfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8V2jw3fijVSbwQ06T/ajwKaq0sDOYQhSJ9TEUxgnxU=;
 b=nGeE21kQuUa2rmzlQBT6Q/jrvRkg//ZFA7uhzToBWUchwKHF5U7dMExPQvYh1zpGbTdhKBn8dyUtC/x6fumYeUGgERXOq9PaLT13I5k7gWg+N1uO5+2vagkF/QmzlGDEMyT/8xLFoL/1PSSY67GiGz4Z37OAJCMnEW0Bq4ugmoJEevG8reF6+Cfnwxl7HRQqiV0b3hsUHH71t21m+4TIAafasECiGdn5NyTRbd5jkszxdFivjVFOuGDz+5k6yoRuGPopCgWaAVtX39nbxfVovfogw81YiaXyx9mXMBRqMSZlRSGak7Vhxbw4EGMxOzrCS1ku/Ic6qpK+wNOvXAAA3w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] misra: consider conversion from UL or (void*) to function
 pointer as safe
Thread-Topic: [PATCH v2] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcLfLzOeq7/eyxK0Kcj9l07Fl9Xw==
Date: Thu, 25 Sep 2025 08:04:01 +0000
Message-ID:
 <b0f269822312a442e87ab02c8deff028b6b040a9.1758787340.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM4PR03MB11150:EE_
x-ms-office365-filtering-correlation-id: 1abf08cd-f089-4e9b-47e8-08ddfc0a1656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?y+DdM+fkXr0hiiiSTum27aAicNTDe10hzJwSbhgmnc7+qnkQrGVtgFA7NA?=
 =?iso-8859-1?Q?m+bqNCUeRElrenyyP6SCFTXJN9ECwI8AHSApF9driAn9bje1by7knFXexk?=
 =?iso-8859-1?Q?yFfr2KRmCc7TTG33k/XG1dspVkmFAwfgn7SvW/BJsvr1BvE6Z6YpmLiblT?=
 =?iso-8859-1?Q?1Eibvc6NwapmSOgOAjglh3xdtQASmGl2ukDLIOKesOc2UxP7vnobYw2WZ9?=
 =?iso-8859-1?Q?WG4I4WjIp/hQ5uP1HyiFQY99pEF636XFZb8ZzlWHdfwwWh7euXGvVtSrWm?=
 =?iso-8859-1?Q?X2EuDRCSXFnv1SoEm/+cViS4XJwI0BSqDvSkwJ/8qWmeXGo2k4o/PgoAYv?=
 =?iso-8859-1?Q?mcEHwvhqKvNZVdBlkBkFFioNHrcsLDdXSiaxOWU++l+CyiyqF7cyxLWROU?=
 =?iso-8859-1?Q?Z1R0GRCbyEXxOa71fqUMTCPJP6O+it9PwhAa2omf19rhWWyGxl8X0hqa8a?=
 =?iso-8859-1?Q?WapN3+xyjnK0hFzYd7lmgd51O/h4mAgov1zn6H9Pap11OhkUoudcDQiTeJ?=
 =?iso-8859-1?Q?RpDNj4elvSTClYGgd3WSKPD3cW99/HiaFpq/sgW4ywFwhw/VG09ukjbJN9?=
 =?iso-8859-1?Q?ef8SIUGKwDOhEqQza05QWb1VRFGe9Mltvpz8jRTwLvtN55od70484LQ50y?=
 =?iso-8859-1?Q?dcC3hNeS56HxHwY68YRASWXbW6vIun1rTmkhGfH0WYdpe5yegSFfbEoZRn?=
 =?iso-8859-1?Q?vl4EzENCOwT0GVlDWfv6zvuj8q+D8BqP7o3rYlOMiHl8GEeVz5cJ4EhOde?=
 =?iso-8859-1?Q?vijlOlc0Nlxk/5072gj++Xslr94tvQauQdhLMetUFvtRPyeJgnlXvamhm2?=
 =?iso-8859-1?Q?4Jhe1nFFX5wZKnnR9OsmOffuizlm6QGKoQkuKgG++FxRy2q5KScSWlIwn/?=
 =?iso-8859-1?Q?h5wqYI1rq5vlgx+iTvuyRi6JtWdSHPC+gHaXISw1MUDehrERglI/R1Uzk3?=
 =?iso-8859-1?Q?RFhC/MIy+BQF5qsioNv7nbIUMe8emMy0KYeFrWY9FRGvwWZNApAIDwvzTN?=
 =?iso-8859-1?Q?xGWp29XpGLdgYW/E1tdnCV4y5w/QGP5Q6QUUCEF+bqkIDjyoKyFAx4wRD4?=
 =?iso-8859-1?Q?DxCXff3VmeTGYhFcy7lPgkNvkPN33kzH/CHGUVafFzEvwidD0A4q7IbBzb?=
 =?iso-8859-1?Q?ca7orjqftBPBualAZZlOaeh/bu6Vlc02yEbSRFkDptXk1tY9283i5hBzSt?=
 =?iso-8859-1?Q?IruVK/srMvPImT8Bjh8rwIr9VepjvdkEC9gP+xhA8n17b77hVSo8mNEna3?=
 =?iso-8859-1?Q?+7A6HxOP+52CrQG9ra1opMtCy+jsB1KJgA7ynG2lkhgfu4RiO7EGYj4Sis?=
 =?iso-8859-1?Q?lv4hLio71NDsxUx0ptzIh36fYljGyQ6zZfrqM1nxHyH+Qj+MfzCCw0gHMq?=
 =?iso-8859-1?Q?a8UKAmPc0AC8jvWUpd8M/i34nREeq+Rg+Jj7FmPcdHgW+QKW4uYhRJl56I?=
 =?iso-8859-1?Q?yXtffzKaKG8bMpiEPM2gcdWVnKL819y+apRwgD0KOB4ooLZmXb7G24UNWx?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XXpqWeU4VXvI8oUVMe3kuEXlaym2XYKHPdsWSutGOrLNlIAg3cRUXjwF4L?=
 =?iso-8859-1?Q?OKzRbIzR38A0JqdkwDgiAuRLFGw5Tt/N2m8y+hkFaNOAEqTYudm5H/jo3L?=
 =?iso-8859-1?Q?cLyht0JYuCI/AzsUnWoomRl96SP/Ncm76yWxQl2ONrPOQCnVPkFfDwyE3+?=
 =?iso-8859-1?Q?MD8afI2NaXSqJdnDDcY/1IYZXFy+8zREqkr+bhIa5lS8griVjNgx4A4z5z?=
 =?iso-8859-1?Q?wyfx2jaZO2UDsjxlX9hKLFMsfVdrUQVQ7d0G6MooBJztiubSFA2uutqAfH?=
 =?iso-8859-1?Q?2I324hF8Wz9AOIleSIzf38VKUNdSA95VZ+0xBoiOQESzgidsOvN5NS0CvH?=
 =?iso-8859-1?Q?iwXCMTuG4JxWvAgMkSV3AlFe+7/wDMaXpD0SjaBfzuz/UhBddpql19l5rG?=
 =?iso-8859-1?Q?+J5hXf+5TS8eyTytbdmTHs3sPmEK8Fq8t4OTpFrTbXAtjqd8HRlmYV9Rou?=
 =?iso-8859-1?Q?lNqrFyBq0gLbtyIrlmK4mupjXCBcO9eikpKzydX0xlAdOGkPIddus4HeEH?=
 =?iso-8859-1?Q?ifJ9em/y+Jl0mM4iXhaVQyni0Lm9mtoPiPU/axI1chUC05DFSNOmEqbFFM?=
 =?iso-8859-1?Q?cJUmr/cEIY4wUmQQVgtEgA3xUOFfUt+jS6XVJGVXU+CIMByR+Y4i0qn3Fn?=
 =?iso-8859-1?Q?jra18o9qVtVs9t3L3oekLVdzor/w+iQvnZEOpUNHzmN8mX3ddt2noThT6u?=
 =?iso-8859-1?Q?0t/zpXyQan/hFyti9f9jPuwxXLtBQzc058TyBkYjdc+Ng/taXp4APMLbAd?=
 =?iso-8859-1?Q?uaNK7s5N2+4kJmLSmvDbcWR7mQGiD3VKaedGNjz+1f7UXOQiUEB4WuKwza?=
 =?iso-8859-1?Q?FwdXzXBFHAPtGVpqHNQxCywxJ5eCsO5zeQmpGB1vJIJoylnWTW6fQq6xTd?=
 =?iso-8859-1?Q?WvDCUZ8maH47E+6gGVybaRMxA9aN+BOyNZPLMZjnWqP5sdDyVYd55v0mVh?=
 =?iso-8859-1?Q?iMXpPxjN5qcbM5auvgnYrixpBfgcJxEDbWj9/WxBjgHtTXm82zEKO7rZA2?=
 =?iso-8859-1?Q?rTZitOVQttdVTsyTqYV4OBYnjSBmyZOnhDHLGRWVGxyTeOZjMNTUr+P9qN?=
 =?iso-8859-1?Q?1T6oTqr19CT482Q/gk1YAH/0vxaSL7N+qaLF5+Y08//2ASof8/jwMCLpav?=
 =?iso-8859-1?Q?c8U8dOPtUU/RnGn9nW3go5w972L9TgkRcr3b0ILA8oSV7zNSlKnWuSerXk?=
 =?iso-8859-1?Q?X+uSKh9OZyOpSYDtEubecYB59RcSYQ89vKUzKJ/1rcM4Zw+WYFIjz3IMaP?=
 =?iso-8859-1?Q?9RWV51C22IhGwTW9BwEW5sFL8wViSSl0cFWgxWuiwqqB7puqTAe66+OpnD?=
 =?iso-8859-1?Q?9JD3LLwfuZbHS+hlHMtTiaD2UwK5zv0ofp2G7rt/Q/57uUi+4dq60cClht?=
 =?iso-8859-1?Q?D94bUmPJ9sWxofj8pgAL3j7gpaKbH+kYgKpRbic5njL3XuNyyombQ+nETr?=
 =?iso-8859-1?Q?qdgCND50nvF56/2omPwTqmkRbqqKtqOrj4v0TnE787D1nQFhg9aVZz8wxx?=
 =?iso-8859-1?Q?XQ+yPIf7vhupQqqaASjC4e6nUuEzKbDC0B07VEdOY10JyqnOWfIRAob7Dr?=
 =?iso-8859-1?Q?loOVnT75SCaRkjNWe8J6hKjkAQHpBzxHxBkwQviOmqsx6NtAWpnJ0k34qy?=
 =?iso-8859-1?Q?A+iM1yhPYqmh6++YROY7fDDeTmGEtpzzOZS8xKjgBk10IVA3+Fv2vteA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abf08cd-f089-4e9b-47e8-08ddfc0a1656
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 08:04:01.0904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPJbV8KnhRsupnrMZoGkXgUjtljGYh+aEvXc4wfwyfUomKAOBA0uX+nsNt3bufSnQP2JzKZQSXt+W2/bATpXi4D1a8e2TbKxDOzFoBEnYoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR03MB11150

Rule 11.1 states as following: "Conversions shall not be performed
between a pointer to a function and any other type."

This deviation from Rule 11.1 relies on both ABI definitions and compiler
implementations supported by Xen. The System V x86_64 ABI and the AArch64
ELF ABI define consistent and compatible representations (i.e., having
the same size and memory layout) for (void *), unsigned long, and function
pointers, enabling safe conversions between these types without data loss
or corruption. Additionally, GCC and Clang, faithfully implement the ABI
specifications, ensuring that the generated machine code conforms to these
guarantees. Developers must note that this behavior is not universal and
depends on platform-specific ABIs and compiler implementations.

Configure Eclair to avoid reporting violations for conversions from
unsigned long or (void *) to a function pointer.

Add a compile-time assertion into the file 'xen/common/version.c' to
confirm this conversion compatibility across all target platforms
(assuming this file is common for all platforms).

References:
- System V x86_64 ABI: https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/arti=
facts/master/raw/x86-64-ABI/abi.pdf?job=3Dbuild
- AArch64 ELF ABI: https://github.com/ARM-software/abi-aa/releases
- GCC: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
- Clang: https://clang.llvm.org/docs/CrossCompilation.html

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- updated commit message and deviation wording
- added Nicola's tag
- replaced "(void \*)" by a quoted form in one place

Link to v1:
https://patchew.org/Xen/9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++++++
 docs/misra/deviations.rst                        | 13 ++++++++++++-
 docs/misra/rules.rst                             |  7 ++++++-
 xen/common/version.c                             | 11 +++++++++++
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..432a68ae5a 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -375,6 +375,16 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"The conversion from unsigned long or (void *) to a function =
pointer is safe because it relies on both ABI definitions and compiler impl=
ementations supported by Xen
+which define consistent and compatible representations (i.e., having the s=
ame size and memory layout) for (void *), unsigned long, and function point=
ers, enabling safe
+conversions between these types without data loss or corruption."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
+   &&to(type(canonical(__function_pointer_types)))
+   &&relation(definitely_preserves_value)"
+}
+-doc_end
+
 -doc_begin=3D"The conversion from a function pointer to a boolean has a we=
ll-known semantics that do not lead to unexpected behaviour."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
   "from(type(canonical(__function_pointer_types)))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 3271317206..565e65a6a3 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -366,11 +366,22 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `safe` for ECLAIR.
=20
    * - R11.1
-     - The conversion from a function pointer to unsigned long or (void \*=
) does
+     - The conversion from a function pointer to unsigned long or '(void *=
)' does
        not lose any information, provided that the target type has enough =
bits
        to store it.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - The conversion from unsigned long or '(void *)' to a function point=
er is
+       safe because it relies on both ABI definitions and compiler impleme=
ntations
+       supported by Xen which define consistent and compatible representat=
ions
+       (i.e., having the same size and memory layout) for '(void *)', unsi=
gned
+       long, and function pointers, enabling safe conversions between thes=
e types
+       without data loss or corruption. The compile-time assertions (BUILD=
_BUG_ON
+       macro) is integrated into 'xen/common/version.c' to confirm convers=
ions
+       compatibility across all target platforms.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.1
      - The conversion from a function pointer to a boolean has a well-know=
n
        semantics that do not lead to unexpected behaviour.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4388010ec9..4e94251887 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -431,7 +431,12 @@ maintainers if you want to suggest a change.
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
        and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted.
+       to 'void (*)(...)' are permitted. Conversions from unsigned long or
+       '(void *)' to a function pointer are permitted.
+       Example::
+
+           unsigned long func_addr =3D (unsigned long)&some_function;
+           void (*restored_func)(void) =3D (void (*)(void))func_addr;
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
diff --git a/xen/common/version.c b/xen/common/version.c
index 553b97ba9b..7091a6d440 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -217,6 +217,17 @@ void __init xen_build_init(void)
 #endif /* CONFIG_X86 */
 }
 #endif /* BUILD_ID */
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * To confirm conversion compatibility between unsigned long, (void *)
+     * and function pointers for all supported architectures.
+     */
+    BUILD_BUG_ON(sizeof(unsigned long) !=3D sizeof(void (*)(void)));
+    BUILD_BUG_ON(sizeof(void *) !=3D sizeof(void (*)(void)));
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.43.0

