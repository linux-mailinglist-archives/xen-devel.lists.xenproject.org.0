Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEACB3A659
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099633.1453412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfYE-0002RL-5c; Thu, 28 Aug 2025 16:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099633.1453412; Thu, 28 Aug 2025 16:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfYE-0002Op-2X; Thu, 28 Aug 2025 16:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1099633;
 Thu, 28 Aug 2025 16:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2KSb=3I=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urfYD-0002Oj-53
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:32:37 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a0f507d-842c-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:32:35 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9177.eurprd03.prod.outlook.com
 (2603:10a6:102:341::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 16:32:32 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 16:32:31 +0000
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
X-Inumbo-ID: 9a0f507d-842c-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZWDuakA5+IeVD/yRImqhDO1TtblBH/i1IKaHTYVh8LXej9ongjrkNDn+VMtgsQnSx8VNFPAo15SF1cpgEvLwmnEWguXFh3h7xRzL8v+gBijofz5z57BRAYrcgRx2i/ze6UKV/otor97fM6XtieI0fubF8cL3sj3X1c/WEUws4nteD8NRLJV0vUug8IeCvYtFMd3uHxNMINnyu4sdTzlE/BQUUNAEjjg+U+XRVUPrt/OKbEn/+TVH915HbVhq4uTYV3447IMj+Lq0tApkQxs+F8qf8WogtDv4LOPMJHqgEbtPkqvTMD8+wq+Xyji4mpnapb5FY9PfVNI7D0ezxcd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuRibqKI/WwGVS2n73wRuEgoZ7kKdNaKMerVbvi/lKw=;
 b=W8p0D7Yno6v/jBlsnO1okJOnLS4rdO6waKVD5EHVf7r5sie4hqunPHZvogimWTEakJ0Tz7sF8IjhmWwlTeh0CNO3i84R9YCsfwW0Z/C+4Qvy2wnj9CEUNg5ro234AIOtW7a72PpHMCny9MgCSiPUfK/CT1S0ZnYDch302KwMQeIFul0VSaGJsEXA7WdvGodNog/pFl4ePgsOD4fFced7pxseE09UTO8nxYB4qgf02RYDUc4/cJuXB+J31oKjxSC+2KZQ3QXRqhwghMbreYbdAJZgAoA+ojjzEj2VpncohE0dA1TtSTHVXhircXEyLkM8k/6BPeCuB4piqrAml84ZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuRibqKI/WwGVS2n73wRuEgoZ7kKdNaKMerVbvi/lKw=;
 b=UURN8aHhZJYGwTtVsH05MM3U+vpjLG44fLO8GsQB85p4918LJTiNhdl5KvTtO+V4Y3rmHOXT/wlh7x9+2L3Dnc6c+hBbFAgeL/t+HFRrPmYLINztVsGUFCqofYe0Ku/dFHWEhhWai5O3c53L4KHBqerXxsp/D1nUu+RDw9JO3FSq4c7+Z50OzL+AjpPayVA1e/cKSxTWaD/44JoYXcrTqshvwDKEl7VqxQ1mSUx8zoaJFHE8gjBg0qu35moAUFTZHEUi41UYT+XtUtbDL2j38YgqysoL7PJU49CzcNrno3POrBz1a1mJIpfFU7AfcRqcs/Rdzd5vwk0Clvmru/T6kA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Topic: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Index: AQHcGCumBGr3lAlNMUmhrYm2OcIjvw==
Date: Thu, 28 Aug 2025 16:32:31 +0000
Message-ID: <87ecsvz9sx.fsf@epam.com>
References: <cover.1756392094.git.mykola_kvach@epam.com>
	<bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola_kvach@epam.com>
In-Reply-To:
 <bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 28 Aug 2025 17:54:04 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9177:EE_
x-ms-office365-filtering-correlation-id: 0191666b-e8a4-4dbc-4640-08dde6507c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QLWqea+cmOnoUxLsxv3IPvXqCw44B0s6/HSAorWfO0mOKpbX1UqnT/9CVk?=
 =?iso-8859-1?Q?VJago477+gG4WvtI/D/kao4Q1ebu5/GQ4zTniGqrGMNElTKLujsqeREidH?=
 =?iso-8859-1?Q?mE+sMXq0xJF2wrnvM4FwtXYg3AqfbDJE4JDG6DtXf05RKC9/4Cy11uUmaz?=
 =?iso-8859-1?Q?8r8ubxFyA6sdCF74RXoErj1ehn1NX3dehqqPXnyfPQ5euMGpOsNCQi8G7x?=
 =?iso-8859-1?Q?mtYsmsfsXjGBGTCzZAdtmjsGydKyUB/fr3SP7elLCJRug/KUqFmNqA5m8f?=
 =?iso-8859-1?Q?pe5fJiCeH5KtuvERR+ttO2oMZWdLqpM2zJjDF/hgdLcjMd4mjIcJmB5p4m?=
 =?iso-8859-1?Q?/L9Ao6MNVRrRAlU5PGOqRXeqgHeuwKLhdK7HQgTqFNn1zU/s+GVt8RX0Wf?=
 =?iso-8859-1?Q?ulqkgkjaboZzxHXYxvupLDOB4+GzYiLSbljFP4vwCzikaCcLdEmAbmpzdc?=
 =?iso-8859-1?Q?WmZwevIGTPOpe+6tN+YZHeGt+oKcL5XTaMSrfIzr/6sH4bAsRdi63JE1U/?=
 =?iso-8859-1?Q?WqE6RX7tPoiLgAXGx88qnRn5Cg4ygGVPHPgdNdjb6H5iHddHkl6vfJvTwp?=
 =?iso-8859-1?Q?WV+Q8W8ZRY2KT3AANNZNwMidNTfxJRhT7qJqygs6M1LVebHH5HlaVCXS8F?=
 =?iso-8859-1?Q?Hm2Lxs/A+eZSsU4eI08r3K1/4tGtZvnyOHRJ2upwbTp3NEpZDS1U7i4s0m?=
 =?iso-8859-1?Q?rGsRQRF62aQ4Wrl+LichCVr92Cj2eDOVLBDxgyx6NKP9vRD7zGnRCbgILG?=
 =?iso-8859-1?Q?JGyWUQnhTD5G2BjPTbDXDhaL0vpSBwf7wyOL3bdZYHJs9lAj/ZJDSF6tAU?=
 =?iso-8859-1?Q?efE78/7QNpBVs1mErVVj7NZefXlxu4S5c3MTL8DgduXRKwJEpiGUZw6aGG?=
 =?iso-8859-1?Q?gv7NfF9yWeU7sGz0L6aJom8IGyoRS59E7FyE/LXxhsnvUnE9G+PGhtFypS?=
 =?iso-8859-1?Q?N7dbXlAo9XVZBGzPd6PhdxgxJaSiRb5B+l6iUB3UN3TW9RA5FBrm0qmh1a?=
 =?iso-8859-1?Q?9ncGgRvJ9O1WI+5Ml2a0PL1bkfTys+DvpAlX8Xt4+SiEYH7ibe5KN8iKWa?=
 =?iso-8859-1?Q?olqWrHBwILa533uPgsKUloR0zJL92V0A12VuCsvUo0OC2HYlIibivSPnrf?=
 =?iso-8859-1?Q?RA9WgUh0lACX3kuk4u0KegBhKd6g0U2RvLXUDg/ZLTxP/7kVVln65Ja8gR?=
 =?iso-8859-1?Q?JOwjoLexaY4Mf/6Izyx+jS1AOHJPJGIxJ+tf3lJ78S4CV+++U0lKREDe6Y?=
 =?iso-8859-1?Q?QaZ+QgmEFsWVWK5VC4qOXGRDK71dM/LdY7c4RKw1DzaDHIY3zuhp1/I5v4?=
 =?iso-8859-1?Q?NpX25WWfcechmj2EjfSpOp9pKVtK9cSO7cnXQbR1H80f1QvgTSAjg/oI4S?=
 =?iso-8859-1?Q?FwwrIMDe+wsuGe4pEF9E/XarCpRWVfiy0M+wOaLGya57OzKncg9HEo9bTK?=
 =?iso-8859-1?Q?LVx+8On+UWugg4D7oMN3RcNw1lNdxFBMRbOvbU7w9uYKjE08VGRyG6RJ4f?=
 =?iso-8859-1?Q?CfbEC/GK6JyIv1LXwNIIsPiFgqxHf3P+v2hur+IlWH3w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?y8V9i0xypEz3UIkv15/tq7MKnCARvgwrhcq3nYVA9mWFZrNcBVkU6ABCsM?=
 =?iso-8859-1?Q?oU4SQUbs2hlFpLsp/37c2cNJ3upYnlHwQbKLpPkZhaVVrzIvFU6i+arz4b?=
 =?iso-8859-1?Q?s/VVYh9NDIhSxwazvQ+oLf7YK2q0v1JcrdvgzWWcNa9jebByy3qHHZ6/xE?=
 =?iso-8859-1?Q?jzjH8DpHzY077QUE2dyIS2IM4QqxAFMpOx3S6Pwy4MRUVmr2xIfX2VKIlj?=
 =?iso-8859-1?Q?xGXxA2VqJqATc89sBRcbPMYuDyJhVQdtkHc5qObY4YtXWGMEiBvuX6Vlj6?=
 =?iso-8859-1?Q?oHI76jVRo/17xWeD+a8a4ont+UqN3ylynuk2YSeqt6HULos60/FRT9Nwqr?=
 =?iso-8859-1?Q?z6XoTJsT+zs9yKiRp9DDQXLrw37zhnIQlsXn7PVsdNDDi1q7M+Nb4xxDfH?=
 =?iso-8859-1?Q?EPH+5KhoXrjQAcakAL/oA6WDuXvbXJEcL+UIRQSBbb6sDUWftu2HRPPy7D?=
 =?iso-8859-1?Q?TTT7uEzw5l1vQ/xadDMVjfXvS/tPekFJAG6oQylsBLmiCJlC/DCsdBDeY6?=
 =?iso-8859-1?Q?YV/W8jzXjYjvIiYBNRdhf4l8+QqjEkrOpm6v88Vaj4vu6y1hEIAasiCddl?=
 =?iso-8859-1?Q?0VGS3a2eFntl7GXjTKog0/9dxW3FiAhpBkvV+q/negNvdDQiz5fBghnwef?=
 =?iso-8859-1?Q?ppC9e+PHn6XPzbIaI8c1OqceBf/z2bLYKv4pNlypv2nmZ94S3J5M2UhCdg?=
 =?iso-8859-1?Q?elc4Jd+a64gbsXb0HzLq5/cU1wsnyUCj+Jz4PAQzxk489eP8b1Xkd9vNpE?=
 =?iso-8859-1?Q?IbOQ5peI0rpm1ET+eGMVPfSBfoWIQzDCpVrACef8BTlEartpmqmxcka5CW?=
 =?iso-8859-1?Q?IY2Yfx5GjZR32QdcGwwixKj1qfBioqSHVIEy3cP0piQanDRf3E0cz8qeu1?=
 =?iso-8859-1?Q?gmMs/FCyf+Qc2hUmr/fJCY6sKBoW1sRPR7HpcmeUoPCLZIVIjr0zQGp1Gg?=
 =?iso-8859-1?Q?JhEvZ/UyE7F2mZ33OrOGy0bDmZ6+UmgE8mOBFRTIjkAVKVoGkJqKGG6V7D?=
 =?iso-8859-1?Q?ymip5CjT7MA3/2+xxWOqXMEXYEqQmWQwUJJSelKzTp9/j/e1o/DMWZbOYG?=
 =?iso-8859-1?Q?1e6a9BfnL4akJlSyt1v2JBto9MkFQvjUlPNH7oAYlJ6QN8Ux3zH3Uc3E+h?=
 =?iso-8859-1?Q?i206u11j3kfRmokAzlMowSyQHKSenuVKTrSvp9ijH4qKf42HDrNClE4q5F?=
 =?iso-8859-1?Q?q9EJBsLbfgkUzC29xSZDK4KoM6qyP2yiPFLWAiUw72QkPVQWThSFSfmpK9?=
 =?iso-8859-1?Q?ESXA4MinSwBNYkQLFPUhSO3BrtYZ0nn6fhPge3885wjldfY+6hpKMc4huK?=
 =?iso-8859-1?Q?bmCHKFxk9bjA8Hm9zTLYw3jF9SDzHtJehMiIQkrXtOPn5WSNXFsCB8N1FQ?=
 =?iso-8859-1?Q?jIjVOKrBj46RLdp1q9PU0N2Nw74ObnZiyJzCiLJW3Qw8dhjK6sIL3+scgw?=
 =?iso-8859-1?Q?hl+OFod5bk9g+fqd/wJTlHGIO11NomBApVin12+jsPgN34DC58TcWNvY5o?=
 =?iso-8859-1?Q?qejkq3t1hYZVPU/l06yF5bXoDDUSSfuuGDBwfAgaXiXtyWXavh7ncDOASM?=
 =?iso-8859-1?Q?wOdMTwV7wjGKCGx+nyIQo+n0fpYUPGHnHw40MAbWU1jln8wUAekCDmq47T?=
 =?iso-8859-1?Q?mJMIriKPXmp6u3bR7x1xD8NO5uOrjO1B8UAWc8e/6BMzf5Jtmn2rVeJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191666b-e8a4-4dbc-4640-08dde6507c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:32:31.6832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZyCRL1orAWOaomhgAWq3lv9nLpnwzsuSH6Y6KWhHsa3W89DCw6o4r6EbEkPJCRoXPJjSSOi0OaxBWC1ON48Hq8UNxyNcYN5toqNOGMyqxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9177


Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0 SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
>
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
>
> The arch_domain_resume() function is an architecture-specific hook that i=
s
> invoked during domain resume to perform any necessary setup or restoratio=
n
> steps required by the platform.
>
> The new vpsci_vcpu_up_prepare() helper is called on the resume path to se=
t up
> the vCPU context (such as entry point, some system regs and context ID) b=
efore
> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of co=
mmon
> code and avoids intrusive changes to the generic resume flow.
>
> Usage:
>
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
>
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

But check a small comment below

> ---
> Changes in V11:
> - introduce arch_domain_resume() and vpsci_vcpu_up_prepare(), which are n=
ow
> called on the resume path to avoid extra modifications to common code.
> The vCPU context is now updated during domain resume.
>
> Changes in V10:
> - small changes to the commit message reflect updates introduced in this
>   version of the patch.
> - Comments are improved, clarified, and expanded, especially regarding PS=
CI
>   requirements and context handling.
> - An ARM-specific helper (domain_resume_nopause_helper)
> - gprintk() and PRIregister are used for logging in vPSCI code.
> - An isb() is added before p2m_save_state
> - The is_64bit_domain check is dropped when masking the upper part of ent=
ry
>   point and cid for SMC32 SYSTEM_SUSPEND PSCI calls
>
> Changes in V9:
> - no functional changes
> - cosmetic chnages after review
> - enhance commit message and add extra comment to the code after review
>
> Changes in V8:
> - GIC and virtual timer context must be saved when the domain suspends
> - rework locking
> - minor changes after code review
>
> Changes in V7:
> - add proper locking
> - minor changes after code review
>
> Changes in V6:
> - skip execution of ctxt_switch_from for vcpu that is in paused domain
> - add implementation of domain_resume without domain_pause
> - add helper function to determine if vcpu is suspended or not
> - ignore upper 32 bits of argument values when the domain is 64-bit
>   and calls the SMC32 SYSTEM_SUSPEND function
> - cosmetic changes after review
>
> Changes in V5:
> - don't use standby mode, restore execution in a provided by guest point
> - move checking that all CPUs, except current one, are offline to after
>   pausing the vCPUs
> - provide ret status from arch_domain_shutdown and handle it in
>   domain_shutdown
> - adjust VPSCI_NR_FUNCS to reflect the number of newly added PSCI functio=
ns
>
> Changes in V4:
> Dropped all changes related to watchdog, domain is marked as shutting
> down in domain_shutdown and watchdog timeout handler won't trigger
> because of it.
>
> Previous versions included code to manage Xen watchdog timers during susp=
end,
> but this was removed. When a guest OS starts the Xen watchdog (either via=
 the
> kernel driver or xenwatchdogd), it is responsible for managing that state
> across suspend/resume. On Linux, the Xen kernel driver properly stops the
> watchdog during suspend. However, when xenwatchdogd is used instead, susp=
end
> handling is incomplete, potentially leading to watchdog-triggered resets =
on
> resume. Xen leaves watchdog handling to the guest OS and its services.
>
> Dropped all changes related to VCPU context, because instead domain_shutd=
own
> is used, so we don't need any extra changes for suspending domain.
>
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions=
 like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume,=
 i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
> ---
>  xen/arch/arm/domain.c                 |  22 +++++
>  xen/arch/arm/include/asm/domain.h     |   6 ++
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++-----
>  xen/arch/ppc/stubs.c                  |   5 ++
>  xen/arch/riscv/stubs.c                |   5 ++
>  xen/arch/x86/domain.c                 |   5 ++
>  xen/common/domain.c                   |   9 ++
>  xen/include/xen/domain.h              |   2 +
>  11 files changed, 156 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 863ae18157..6fd73eedde 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,8 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
> =20
> +#include <public/sched.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> @@ -27,6 +29,7 @@
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/vpsci.h>
>  #include <asm/vtimer.h>
> =20
>  #include "vpci.h"
> @@ -880,6 +883,25 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    typeof(d->arch.resume_ctx) *ctx =3D &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspend =
)
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=
=3D%d, shutdown_code=3D%d\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }

This check probably can go into common domain_resume() function, as
there is nothing arch-specific in here. Probably this can be done during
commit, to save us from v12? If commiters are okay with this.

> +
> +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> +    memset(ctx, 0, sizeof(*ctx));
> +
> +    return rc;
> +}
> +
>  static int is_guest_pv32_psr(uint32_t psr)
>  {
>      switch (psr & PSR_MODE_MASK)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index a3487ca713..68185fc4d6 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -121,6 +121,12 @@ struct arch_domain
>      void *tee;
>  #endif
> =20
> +    struct resume_info {
> +        register_t ep;
> +        register_t cid;
> +        struct vcpu *wake_cpu;
> +    } resume_ctx;
> +
>  }  __cacheline_aligned;
> =20
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include=
/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> =20
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> =20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> =20
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> =20
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/=
vpsci.h
> index 0cca5e6830..d790ab3715 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,12 +23,15 @@
>  #include <asm/psci.h>
> =20
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
> =20
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
> =20
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id);
> +
>  #endif /* __ASM_VPSCI_H__ */
> =20
>  /*
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..50cf5fd96c 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,30 +10,16 @@
> =20
>  #include <public/sched.h>
> =20
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> -                            register_t context_id)
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                   register_t context_id)
>  {
> -    struct vcpu *v;
> -    struct domain *d =3D current->domain;
> -    struct vcpu_guest_context *ctxt;
>      int rc;
> +    struct domain *d =3D current->domain;
>      bool is_thumb =3D entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> -        return PSCI_INVALID_PARAMETERS;
> -
> -    /* THUMB set is not allowed with 64-bit domain */
> -    if ( is_64bit_domain(d) && is_thumb )
> -        return PSCI_INVALID_ADDRESS;
> -
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> +    struct vcpu_guest_context *ctxt;
> =20
>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> -        return PSCI_DENIED;
> +        return -ENOMEM;
> =20
>      vgic_clear_pending_irqs(v);
> =20
> @@ -76,8 +62,37 @@ static int do_common_cpu_on(register_t target_cpu, reg=
ister_t entry_point,
>      free_vcpu_guest_context(ctxt);
> =20
>      if ( rc < 0 )
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> +                            register_t context_id)
> +{
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    int rc;
> +    bool is_thumb =3D entry_point & 1;
> +    register_t vcpuid;
> +
> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> +    if ( rc )
>          return PSCI_DENIED;
> =20
> +    vgic_clear_pending_irqs(v);
>      vcpu_wake(v);
> =20
>      return PSCI_SUCCESS;
> @@ -197,6 +212,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
> =20
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    bool is_thumb =3D epoint & 1;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    d->arch.resume_ctx.ep =3D epoint;
> +    d->arch.resume_ctx.cid =3D cid;
> +    d->arch.resume_ctx.wake_cpu =3D current;
> +
> +    gprintk(XENLOG_DEBUG,
> +            "SYSTEM_SUSPEND requested, epoint=3D0x%"PRIregister", cid=3D=
0x%"PRIregister,
> +            epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +403,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
> =20
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs, 1);
> +        register_t cid =3D PSCI_ARG(regs, 2);
> +
> +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &=3D GENMASK(31, 0);
> +            cid &=3D GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index bdaf474c5c..0db0627b5c 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *d)
>      BUG_ON("unimplemented");
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 1a8c86cd8d..52532ae14d 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *d)
>      BUG_ON("unimplemented");
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88..94a06bc697 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain *=
d)
>          hvm_domain_creation_finished(d);
>  }
> =20
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  #ifdef CONFIG_COMPAT
>  #define xen_vcpu_guest_context vcpu_guest_context
>  #define fpu_ctxt fpu_ctxt.x
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 104e917f07..d73a88ced5 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1352,6 +1352,7 @@ int domain_shutdown(struct domain *d, u8 reason)
>  void domain_resume(struct domain *d)
>  {
>      struct vcpu *v;
> +    int rc;
> =20
>      /*
>       * Some code paths assume that shutdown status does not get reset un=
der
> @@ -1359,6 +1360,14 @@ void domain_resume(struct domain *d)
>       */
>      domain_pause(d);
> =20
> +    rc =3D arch_domain_resume(d);
> +    if ( rc )
> +    {
> +        domain_unpause(d);
> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> +        return;
> +    }
> +
>      spin_lock(&d->shutdown_lock);
> =20
>      d->is_shutting_down =3D d->is_shut_down =3D 0;
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index e10baf2615..5f77ffadf1 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
> =20
>  void arch_domain_creation_finished(struct domain *d);
> =20
> +int arch_domain_resume(struct domain *d);
> +
>  void arch_p2m_set_access_required(struct domain *d, bool access_required=
);
> =20
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);

--=20
WBR, Volodymyr=

