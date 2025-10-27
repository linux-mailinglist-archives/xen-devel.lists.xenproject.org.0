Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85782C103C8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 19:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151734.1482273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDSJv-0006Ja-W5; Mon, 27 Oct 2025 18:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151734.1482273; Mon, 27 Oct 2025 18:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDSJv-0006I9-TI; Mon, 27 Oct 2025 18:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1151734;
 Mon, 27 Oct 2025 18:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=de0O=5E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vDSJu-0006I1-40
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 18:51:54 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff960cf5-b365-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 19:51:52 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 PR3PR03MB6650.eurprd03.prod.outlook.com (2603:10a6:102:7d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 18:51:48 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:51:47 +0000
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
X-Inumbo-ID: ff960cf5-b365-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isIxUWHXJUGe0VuRwEDh9ahLeOPb+CuyMLYBPkKUrJIBB3aPdFCjRnq/r64+t3yqI3G/5HvLqpqQc2HylN8ihXMgnUahYyb4ic8YwQ4lPW8JA9oYFw1qlo5TxIPa7VNXBe+5MqI8l0ogIYTyTO8XwX/ww2h66o7epY1JMCT4ok1AARp7NQivABprPILtJ7S8MRGFXoLLjM2pbpkw2a5A3oncTdI2hiAnND959gChwE74Efr3qTeLYj2f58MnuGfQ818TEY6dYhDTRJAw+AQ+R515DH3slSJjGFvxCl/yyPzyw1mXWPp0+BBcAkb5hVijg6xj30cKlXcOeqFUFBleog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Awc8EWaFBCYfnRzVdONL9wuE5SU3NIVJ63vA+l3SDD0=;
 b=bxmZtm9NFsTfOfbc4pqb20w3tQ9guF+qPtyhwhQeBbzyMkXawGAwX0YS94XtdGnzsJdM55zr/ihr68O5lnIXMbMXr0ZtA2JE9NDBV1EcghvERPppVw5MrnN+yXfkNNuvbSmEcvyVHAFBCAYQ/2HEdx/baCAmrYfX4CrH8FI+Rzrsovj0U3HXt7XPDl2OvUNyIAslByInSvazEGomC0bD8DYyf/eXpww4viIEG6HXB8wRqahYqhH+oHa7/0xsQ/nSRXND0nH5t9S8Pz65FlbttkbagD1m4LVNm7kbb7elNPuUWicp7YX/SLK0HbvBkpc1pkgZ+ArsB5TyWV0skhOaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awc8EWaFBCYfnRzVdONL9wuE5SU3NIVJ63vA+l3SDD0=;
 b=nzUz1BHF3DhkRLjtEemhsuvyeMyM13XgeCfe+i8YHufcot7E1RfXgVBJmMnbhuYDDDOtiEJq1V7cL6GGCIfW8naimMT4yPYIxouLNFUXmhBKJmiBqAmril3DhA5Ot0JGJyGmV1Crfat4bcOfT7tpqeeLshoprqhQkkeexG7ji/gKtwOxtfPejigBFaSVd0zxbHaqC7Md12HUcyrn5CCxXI/3s1AOk1m24/Y08+tqh8CIN0mINUwm1h2sryzTYvLyhs0pfIsVaUCXLSZLU51QaF5LlHfHjKoYnjU8NciiRO3yz6JtHRV6HTi5oEM1+OE4lSHbb2El7KGgtWjV8r0RiA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4] misra: consider conversion from UL or (void*) to function
 pointer as safe
Thread-Topic: [PATCH v4] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcR3K/aTBeUCgm+E66rbTSUIb8rQ==
Date: Mon, 27 Oct 2025 18:51:47 +0000
Message-ID:
 <daa126218e11484c72f3de4b39186b6d9afd26c6.1761589314.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|PR3PR03MB6650:EE_
x-ms-office365-filtering-correlation-id: b16d4d93-b6ad-4bab-b984-08de1589e1cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9G1bqlMPtSwZGkonbLcSnXXhj9tocTBNioSEGZdeZYSDqN58Md/kRonKCp?=
 =?iso-8859-1?Q?eLeZN5lVlhhCR61vS3nj3mEsOhvqv94rIDVD4zKauN1GpuhFY1A8/pL14R?=
 =?iso-8859-1?Q?rSBZzK24bpE5vE7FZso5g6yR9cH0nhnqz9PtB/oZGYP9FQaEHJiTiKQnHQ?=
 =?iso-8859-1?Q?nRBh5HfbxwZYuEbfTh4GDlnpdgtFJIVoDokuIPHCqFDRLaAIzNGrE2aZkb?=
 =?iso-8859-1?Q?TnQV6eyKdjGJJz9OOHsU+m0W3vfCz+2kUv37o2UrM7sPc5NsTLTAfhJjLK?=
 =?iso-8859-1?Q?tEpu+tSUqdmDcLCXC/c+PY0emImwFlURkmPlCQ2GVJ00n6s2dZekjC6pBn?=
 =?iso-8859-1?Q?Q0PIBqZ82HerC2pxrloSL7fLrBNx5F2NaOuNstTdhnt5Xgy1i68/TeGtVa?=
 =?iso-8859-1?Q?kCAXXMM9At57Nt9dVX/t0YLzvfzOSeGDQftdPkPPkspJTtHRNgh5gZgbYV?=
 =?iso-8859-1?Q?RqE4+yH760jpOXdP9x3uCj3GAP95hgBH8Y4DzmQF5n74AVHPLkziBtV1tx?=
 =?iso-8859-1?Q?vU1Wkq7wKTV6X1AqmSmEAcc/QlJ4uJ1H6pHOFxwIO9ZJmVmfXHbphtMqk9?=
 =?iso-8859-1?Q?kLlRNZb12w42UFfmsOI+dE4bbfY6ZmNHYTCWFJvQUSROes/dQSsW32LdU9?=
 =?iso-8859-1?Q?46DCMwWC8KCPSnlZ5M2scK4vWvNytauRTeaS4otPBVsD9v6t+RcnTReVhx?=
 =?iso-8859-1?Q?9SFqnq0MPw2PxOZJj9E6u9r4tOsRrvKLVeA1jjrCiJpCidAPz68VB3g7c2?=
 =?iso-8859-1?Q?ORJQ58kIQ/bbzuBvhzx+cMO9gHH42JUleIikiZ9i7rvJVAi6Zg5/H+NQvT?=
 =?iso-8859-1?Q?XAMrqOzlfkj2DAxZZqCSNzdyN6Q1Gm4B9r39H6onM1ifKsCJeP2TkGRhx2?=
 =?iso-8859-1?Q?yPkVL0KUTIl1xRIWu1M4zE5St/QHp+ZoH2kyFvNALIZqvi8YjrOaHcVGTO?=
 =?iso-8859-1?Q?C3Ghy+ktM+7qYXYkWB2vJC6VP4DPAL5VGaUbeyH8WtX5dfEV8uh/+qEOj6?=
 =?iso-8859-1?Q?8G1Yns8DUyVorxYYXw8SnAS/SQsuUd4IphpZV6pi+wz62S5DIEBIDHq3PI?=
 =?iso-8859-1?Q?YLaPuEPjkxvalasH/N7IGWi69JLdNx/uChbGZLtmk9+92ljP30CP+tQqUP?=
 =?iso-8859-1?Q?7fyeEDLwnc0n0YbAof53WPDIh02yFXB2wr6M6MIs6E6GZi+wm/lpPNpzCB?=
 =?iso-8859-1?Q?WUyIReL3UIpSHBchAN8R03+HGdssfQRWUsJMT71OOLL/g2yOKz1mi2D5+d?=
 =?iso-8859-1?Q?lC2dsNG1fxPF3BsIaTW0E91vE4HS8ABtkMWKZ2/CFgd8qELurMpFvV/n7p?=
 =?iso-8859-1?Q?wB7PGNCbwvWL5FCkkNHZF9gIZj0tDXto3Htdm+J6ih69WILzlBpH3yHgat?=
 =?iso-8859-1?Q?HJS1yv7UVRetT0A7Q+z1dMAFofWxq1wBO6IfkwPXrIQPNlpGqvspj59rE6?=
 =?iso-8859-1?Q?ZEv7vbM5qvSPcPodPmdJkbTa99RR3vGYNxh9TXF9wSqUukfcbPZP5dcpCO?=
 =?iso-8859-1?Q?NE/Okk+pr4IfK8j+OTnkz5sd5Y+Haf97PMFNBq8KIiBw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Rmzx6VvZH9XPSBcLZoa/cDBOBSgUV0s/Qd8hBk6Vbjg23UTFJ7PuAhckeg?=
 =?iso-8859-1?Q?eHICLoAXalXRECrF+WA/F8hLKgiROeF/QyDjmBsgB0wL79u7750S3J2t8G?=
 =?iso-8859-1?Q?+7puqAxpyrNpBmRyP9SXFbwtdIs5orNYxktuZBhNq2iNzQtkBsQZSArrU0?=
 =?iso-8859-1?Q?tt8AY86ub3q8LAC3DGAg3StLmy7xjM22iMCkCnC+WDrv70SIfGnxCLlu89?=
 =?iso-8859-1?Q?DucxE11A8RhIiqgNxmN+ljpROaCQg8Bdl0dG6h+pTED7FMSyrYM9Tr6QhS?=
 =?iso-8859-1?Q?eBOtldfatKWek7liPxN8OaeaW09SzO4HGZQTsynNPe4cHJNW2iYgxyZNQc?=
 =?iso-8859-1?Q?x4V9oKJf26AqCeEwSmSoBqzxw0H4N4D1Ftc72KgjCdF/cAvLtjKhZ1C0Bf?=
 =?iso-8859-1?Q?t6vjoHQ2evB1bqJrEobvSVoBWu5tjB9xU4xCPC5NLZFzHpoHJYbokuZfTo?=
 =?iso-8859-1?Q?GjPGd97nV1Yq+HLos+hU2SpELxDNMayR0zBla73XUNnSxgeQdzaXMIyv7f?=
 =?iso-8859-1?Q?I+F4J49OT1wPr5W8fWYyojfRMHdR6rkIseKaYm7Y+M0OfDIdy6ARQTofGk?=
 =?iso-8859-1?Q?ivEB+1RYNmyx4wxf9ZtR69QvqX+HZqbtqEmU77+o0cPJOdYblUQ0DWZQMO?=
 =?iso-8859-1?Q?pgvbm82RwupyFie9PhQcBhdtMkI7PdyQmJ5se40Jgs9N7qhh9eZ/ZG/Ytd?=
 =?iso-8859-1?Q?YLrRNgP95wTjUQR/ZmwCV65dwlCUrQkBxjGB9m8uMtllxr8GCJ5DEr50ir?=
 =?iso-8859-1?Q?Pio89PsYvzxw8hWDsp15JzpX72ADWPI+7t16iZcKIBSjFYW8chZFvK2xn1?=
 =?iso-8859-1?Q?uyfIrXnqyoNXGdS91b6S5ije6IFDUThBOyvUl54IxFvdHJhAMkjT2E3v8e?=
 =?iso-8859-1?Q?Hn9sK/FKra21mzOSI+dPJfS7v60XQab78KaJ4MhiItq+G64OpHlN6/PuUy?=
 =?iso-8859-1?Q?USgCQUTMw5pr4yy8PY9OL3MizY2jH1ZF1mb2tUvdO/Dwil3MYCCaF/2CCD?=
 =?iso-8859-1?Q?H1KqEd5WRHKkTukHPhCySNO2yCyfoWssM4q+5G2RAd5yvROWievpbVBRsw?=
 =?iso-8859-1?Q?J7u2mvEwrbZ6n3VG3tEt8jyHrx4WQn1HuS81z2NlLYL2pbrYwTBIrg4sxU?=
 =?iso-8859-1?Q?F2/xK5g76hEiP0GnxUe5DzLHwKkSBFGL3RPKuWkICLvubdAvOvSdXv/Ahl?=
 =?iso-8859-1?Q?woTqJ6m0qilYGH3U5OaEnV6Unyy2X26nQ1/T+3xWQxFk+jgf4q+Z3tY+t2?=
 =?iso-8859-1?Q?9QiUfE0mQYzqdVlJuVk+62aWc5nFu/ma+Dapy2qKZMIkrdmXief2ohloFg?=
 =?iso-8859-1?Q?WOCcAQWqgTWA3JLZokwu8Els5q10jw8zFTESPpbbfA2TJSl3ltabGiy5rB?=
 =?iso-8859-1?Q?/hFxVo1t4sUYD50oZoqqG+g9zFN6CXHWNOTIVDDs4RUBjH3au6SDow0BmR?=
 =?iso-8859-1?Q?1R+RKDvsHIKgDsu/c8sQGsbXPRZdfMtKIi/HzrHWDGbr/MpK6wLDgSbIe3?=
 =?iso-8859-1?Q?p7uBak257nt09N6eB7c7pXA0HRtv12z0ZqL7vYC2CmjzYnXJCHKAIl57DE?=
 =?iso-8859-1?Q?3LgYXoNTuiDdjLAQthgMInK/BzYZaAKGi4b/ksIXd9RIkknxHnbR8Q1rL7?=
 =?iso-8859-1?Q?UVIG4uoVEsbobHHTR2GJmLOPKPxlOFIABOb/deNtqcC0lZpQCW3m5zQg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16d4d93-b6ad-4bab-b984-08de1589e1cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 18:51:47.5704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgGiaRGLFg/IRwvKsJcu/d0WxnWZZdR5AJvic/LBjW3Z62/4AJt02SXWaEh6AYfPKP6cFjqbrry0HvkR+mp82qwYbe8KYdnAuBbf70cgq2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6650

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
confirm this conversion compatibility across X86 and ARM platforms
(assuming this file is common for them).

References:
- System V x86_64 ABI: https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/arti=
facts/master/raw/x86-64-ABI/abi.pdf?job=3Dbuild
- AArch64 ELF ABI: https://github.com/ARM-software/abi-aa/releases
- GCC: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
- Clang: https://clang.llvm.org/docs/CrossCompilation.html

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v4:
- the build assertions for the X86 and ARM are enabled by default (uncondit=
ionally)
- re-wrote description for the build_assertions() function
- excluded PowerPC architecture (not in scope of certification) from the ch=
eck and wrote apropriate explanation

Link to v3:
https://patchew.org/Xen/0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |  8 ++++++
 docs/misra/deviations.rst                     |  8 +++++-
 docs/misra/rules.rst                          |  7 +++++-
 xen/common/version.c                          | 25 +++++++++++++++++++
 4 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..219ba6993b 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -375,6 +375,14 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"Conversion from unsigned long or (void *) to a function poin=
ter can restore full information, provided that the source type has enough =
bits to restore it."
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
index 3271317206..b3431ef24e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -366,11 +366,17 @@ Deviations related to MISRA C:2012 Rules:
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
+     - Conversion from unsigned long or '(void *)' to a function pointer c=
an
+       restore full information, provided that the source type has enough =
bits
+       to restore it.
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
index 553b97ba9b..674bd72b31 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -217,6 +217,31 @@ void __init xen_build_init(void)
 #endif /* CONFIG_X86 */
 }
 #endif /* BUILD_ID */
+
+/*
+ * This assertion checks compatibility between 'unsigned long', 'void *',
+ * and function pointers. This is true for most supported architectures,
+ * including X86 (x86_64) and ARM (arm, aarch64).
+ *
+ * For more context on architecture-specific preprocessor guards, see
+ * docs/misc/C-language-toolchain.rst.
+ *
+ * If porting Xen to a new architecture where this compatibility does not =
hold,
+ * exclude that architecture from these checks and provide suitable commen=
tary
+ * and/or alternative checks as appropriate.
+ */
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * Exclude architectures where function pointers are larger than data =
pointers:
+     * - PowerPC: uses function descriptors (code address + TOC pointer).
+     */
+#if !defined(__powerpc__)
+    BUILD_BUG_ON(sizeof(unsigned long) !=3D sizeof(void (*)(void)));
+    BUILD_BUG_ON(sizeof(void *) !=3D sizeof(void (*)(void)));
+#endif
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.43.0

