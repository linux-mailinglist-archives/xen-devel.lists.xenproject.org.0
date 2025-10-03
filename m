Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6FBB7A6C
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 19:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136779.1473254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4jG5-0005By-Hg; Fri, 03 Oct 2025 17:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136779.1473254; Fri, 03 Oct 2025 17:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4jG5-00059g-Cw; Fri, 03 Oct 2025 17:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1136779;
 Fri, 03 Oct 2025 17:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIY+=4M=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1v4jG4-00056b-9g
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 17:07:52 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c4682fc-a07b-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 19:07:47 +0200 (CEST)
Received: from VI0PR03MB10448.eurprd03.prod.outlook.com (2603:10a6:800:204::5)
 by PAWPR03MB9213.eurprd03.prod.outlook.com (2603:10a6:102:330::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 17:07:44 +0000
Received: from VI0PR03MB10448.eurprd03.prod.outlook.com
 ([fe80::eea6:fd66:3cd8:babe]) by VI0PR03MB10448.eurprd03.prod.outlook.com
 ([fe80::eea6:fd66:3cd8:babe%6]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 17:07:44 +0000
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
X-Inumbo-ID: 7c4682fc-a07b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCR/2cosDxE2MGlhjkYgw1+/r+SopvPYswICWPyt94mDOcgFE+/t3T+4wkwJ+KGdQ/weQ7yLhIP7al/N8TiXNw5cJgbX+NGh7wRuF7yKAxIXNPcgYm4WrbCPM487jzRnqOXb98EJpEQSlKGT/0pCidJMP8bLJUSaQsoIvsOrDPbfh/No1cJzANNHSCfw37s/6RNsgo5fdFouVJRb4t0B8S+Sm3sLbPzJV0PEeKh6R7i8UFpqpLncZlpM/0ZRIa3WOrmVe4eVG9JM3OGAe5jKpLz10JYlTom9CEv/waCUeL0x+57RAQ6YlR3GBWuTphpX+hRUoarHCpC4PFp5ObvvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFDYpRCrPwwFVonBc5SfI3g+repFAeW/sMO/8d8Okhs=;
 b=Y7n2mPsWij/wZb5vJHjZnoVQbFOsmjXpYxC3ztdePm9yXF8YItKIk0OeQvIfqhyzClJ2h6wCxbwo1l2zyL8wcHe5igFDAdl17jDv/UI9APAncfKEYzE58Ov1mDm9I22xgNvpa/VrU0zE8tfMeqqK2zCzxO3TBXwX4C5SnLSMlw8juQlRydYymg2x+wwFh2zv3aq25mx8hoJ6hjeBFK2H/452M5avI8BHxxgz5lbPpBBIWsu1aj4ZoETklMWNjaPx8eFKoIQda41ycZAzCQpdOCk3y5CeX1YEF/0E2H92XtRCuvt+0mpa66wBXKktQpQg2A1HJWhSUz34pPR4V2CSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFDYpRCrPwwFVonBc5SfI3g+repFAeW/sMO/8d8Okhs=;
 b=X04m708WrY4bTgm76nNoCW6cuAQgdDdNsNolKR+aumgRHKfy1ug5GWjyHWXS/KdstgFtG+4Sv5I/Na8ucXHc9jLWb7U1Yfw0NZa9CmrSRfb2GKMqneNUW7mIXCUPA40POmnn2MMFDYgnMy2K3D4MxRMiURytVlkeG/UI4w++bTwko/zjPKtZgEKCZ57pKzfZ8aZ1bBdbalK60sln/4sB3Byk+V1xHSqw6eVOeffxhKT8MFvB7UyoZSyzm8HzH0aF8w2Wbmps6Wtg/XZmzdoRWhq7d+wPf6Y+NKVq1UWS82YVofhOW801uVeuzmzqIepbOu3MQ+3nGDTNopFIg/UVBg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/4] xen/arm64: allow to make aarch32 el1 support
 optional
Thread-Topic: [PATCH v3 0/4] xen/arm64: allow to make aarch32 el1 support
 optional
Thread-Index: AQHcIvTyx9z2i0DJTUamNSgeNa0v/g==
Date: Fri, 3 Oct 2025 17:07:44 +0000
Message-ID: <87y0prncbk.fsf@epam.com>
References: <20250911082034.1326377-1-grygorii_strashko@epam.com>
In-Reply-To: <20250911082034.1326377-1-grygorii_strashko@epam.com> (Grygorii
	Strashko's message of "Thu, 11 Sep 2025 08:20:35 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB10448:EE_|PAWPR03MB9213:EE_
x-ms-office365-filtering-correlation-id: 04d495f9-8095-4e45-f9b0-08de029f5ed8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yF9BGF7TP4S/LSfIBu3pBBg8gGVAnwfZf72QaIJUjAwHG2bLKsYiSQZtW9?=
 =?iso-8859-1?Q?TYOR1wjsdQQ/r07YiHMkbngUPe/PZU23dw+qzjbqQKtq2WnTzly5YKJX4P?=
 =?iso-8859-1?Q?CdbeM9A7OObsFL8uADMGBwWcWGdVuPq/FtPAugvhJ3NmtaNq9bcRgcwqKL?=
 =?iso-8859-1?Q?r7ePA6okYhtxy/Hwd8jv7N3xGjk+do49jwmnpncrI8Gz+Lq7YqWhBr5Msc?=
 =?iso-8859-1?Q?roM6sgP0vky5GLR5lcfXA/hXbNQgRKpfMQ8k4k1OGY/V1WqLN+8lf7m9N9?=
 =?iso-8859-1?Q?UOXLa0oiDk2Wxuuw4IpZMpoWObo5wspbwCesuACTsXnIrmhGgtQvSi+2Hn?=
 =?iso-8859-1?Q?cfMwYyx2sGW6SDrMPkxKqJzVgfyhQ6ejSgpSNFoy5yqcC9sd2r5XXCFjJu?=
 =?iso-8859-1?Q?zhZnZfbKY9eQ4CstXHz1A5vfCnuwesRU52TbaKsRi2wJdeSpto4poa6+PC?=
 =?iso-8859-1?Q?tuKq0wHOz6q1SiSzCs9DmG5mE1Mx8vnn8XgyrpiRfEqaIuqLa9f8EYmcao?=
 =?iso-8859-1?Q?cYoXvzhrsWcWJ5wzAgos5P2H0ERaW4Eef+3JoNnvdqUBsW6qjCUMsPCfNw?=
 =?iso-8859-1?Q?EjdHnl7qXuq2B8Gi1iC/oVasiKCbyv79vATd9s4sZxOXwHFtfbCWTFITLk?=
 =?iso-8859-1?Q?/812rd0XbtTBcMJ7AG6hJaN8IS8kpsxhV1Wi3qqsEcL90rOCMcGYRRB+Qf?=
 =?iso-8859-1?Q?FN5DQSkHPU7xDD43BpDHW04o0p+xg2h3f7DG6+sBAShll83CncmeDaDbi3?=
 =?iso-8859-1?Q?TnMkOoyWBT7mTvqNA9PxihmP+TVMkGod+vhA1iHJywQt/w1iz9hKlLR5tT?=
 =?iso-8859-1?Q?RKgGgYx1KC4/HTAf7hRx2QFHoXaR9AsjuGLvp9PDAS5W+E32Q/sy5ZbtD7?=
 =?iso-8859-1?Q?ff0pT3OYqqJhnnqZdKwrwv/Wm+WIMcnOTETMDPp6HdVk1VEnvXy+oeB5XN?=
 =?iso-8859-1?Q?DFTEJpsIN7utNMxB63JENxzglwxUiXv0OrLhVIRmvbESwrHheddTnblxhU?=
 =?iso-8859-1?Q?oU+QZLtykOCnWf0I2XjCyb/cTlvPCHHjVo8lTzNIpRZ85IQNKboBLYMqbh?=
 =?iso-8859-1?Q?5O0oYYQ1q0zrqXjyUJwAqO3Iu7NdpXtyptnb3tWjBE5H47O6OntU1TXZ3i?=
 =?iso-8859-1?Q?FtyuPviPH1wO7o7HCgx9LhUAZ4HSQrHrKU0UxQz+FQqkvBp41NWgzh4+9i?=
 =?iso-8859-1?Q?lS1d9Pk2z5RdPHBTENvnJvX63G54yvNXKbwCqM6CcME7d+LnXpm1NQm2in?=
 =?iso-8859-1?Q?ue/lRLsxczbz6R11fmCC7Z01v8d+xnwo+jb8hmfF/qGicOIwCf812W5P/K?=
 =?iso-8859-1?Q?hLQ0+Y6uz60/dIdnj6I4JmeluxL05rR3o2SiM5lMpwvfsnUHdRoSmsK/ER?=
 =?iso-8859-1?Q?59JxL5gXvEMZk/Ae558mJ50tYzpzKo3vQ2XkQ00tqCrWwzbE65TpgG9l/9?=
 =?iso-8859-1?Q?8oaDeC4aj3S1IBMUSc4Tm+vspAAfB8oXixN+Iwr/rMxt24/OadUgbArjvH?=
 =?iso-8859-1?Q?0SSfcPanUOuJosrUJ7VtnZaXNOH/KahYnlCRyOnBzaRQ+rjETA8OrYemFS?=
 =?iso-8859-1?Q?PBKRdYBDg7icJ/hxUPL96qE/nO+p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10448.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YRRCElPTtMhMcrr1Xl4Sz+cYsrUD/Z3vNiwtywMl6CEjGgC2JnCN3742ua?=
 =?iso-8859-1?Q?0/vQiYBeckRSSLsNR1s1GZZAh97G5UdyYFxEoGxZpNhU2z/JqjQIRDN+uS?=
 =?iso-8859-1?Q?9oJV1hv8YzALDvG000UcGHwSkL4O8+YEsKfNb9T85ResuZQaDNdOe6V/ut?=
 =?iso-8859-1?Q?/asIi9V/U0RrQBmntM2TlP4Yr2wNtLb+pT6xG8OG5xOLHmJ8XtMW24G8e4?=
 =?iso-8859-1?Q?MhnYk6NyT44PKNFx0paiz++K9vdj/tfeI8eCS8sxFa+Epji4BILnWxN6ni?=
 =?iso-8859-1?Q?Hjn28n9+MPVRNrov65I0lSKRvDYXnj+QuM8S8paKk8DxRDkEaI4R/1xuoo?=
 =?iso-8859-1?Q?B7G+F9PbQ117f0SQNK8E3i3L8hKKPeI2plP7X9M4xJWPwVAS2lidjrN1lS?=
 =?iso-8859-1?Q?0480i6gXLVv6XWC2IK13sRsCxGj62+Mj7A1UERshpBq+eUHvL4I343P7Ui?=
 =?iso-8859-1?Q?g72MDYlEQ9DIUGUsHffPUGS9XKijXB5rSpsDc2VGC7u5edVx6MU6+L87Qf?=
 =?iso-8859-1?Q?/GXP6KTratqQizQ0XVlmpQBSecs/jPa3uCHNMaTT/UcbsxX7EGJAvMSKG5?=
 =?iso-8859-1?Q?QPp3kAtwyVD25SvzfCmQaQF9ifke9Jgd7tf4Z76j0ADrifYHYo2zRQisGF?=
 =?iso-8859-1?Q?Su2AzJs+saYWFOLCXTO6qp7/VrlWtoKwLpYQExpt2qYZy/jDmgWbkfHHqW?=
 =?iso-8859-1?Q?R8Lk8fNKnj0bdgHtEykU7vP9dp6btkCWIDJHk6pQPBfr8ruiZpVufj5Pfq?=
 =?iso-8859-1?Q?vDRBVDc4NgUNIEs1upFomaL+iEQupMjtLAUFXhO6VDRyfJlL7ZlYwtmmVX?=
 =?iso-8859-1?Q?HFfHQsx/J1owa53CKu/ixtmz8vUmM/l0sE4qnrHvYU+GdcAy8kumhqC3Ka?=
 =?iso-8859-1?Q?9Qay0jYjdUFEKvrS0cueLz31PK96cXJyELLlq5LdUYcsF6svLjHiIoqsMe?=
 =?iso-8859-1?Q?kkYT0R+sgONw/W8ZN00B/cMlcjvguf3JXIofke3dwubOq2k2vPGLLNc/gQ?=
 =?iso-8859-1?Q?39y3MUpYw2fmdbhsbXuhZ9zwAxef+E7McSH47sX5ZZ4qiPfTs6rCgas9kX?=
 =?iso-8859-1?Q?9dvF+D5dcRoUo4WsouqACTSSPfo8BE5ycGzh+u+V6F+vF0uvhiqG2TFeEP?=
 =?iso-8859-1?Q?ucX2Idp3p+styIhECfMIH8GjtELKCyqXcBrdzWs87wxKrWJPPLDAsx6eqS?=
 =?iso-8859-1?Q?/5fdXoNUM+eBq12FCrz22f4MXBxKHlFoS4r10T0iRs9oY+2jNLuxoQBSH0?=
 =?iso-8859-1?Q?N/aUYdfI/U882pyyF7RX4Rgr3Mgu6IofYEmNbazyZyjz/4+M65iLukxuDA?=
 =?iso-8859-1?Q?p9UZIyKeOK89VKToHKTRd5zPXmwDULjnBXvLbSSfV7wLgkeY5aLm0Qsd8z?=
 =?iso-8859-1?Q?5m/uMLL2LYSiSAljOfGYbp2Gg8wSddMGc+oDZZvVPLsazaJukOLa7zV+6/?=
 =?iso-8859-1?Q?YyAeUNIvWpdhs4zezERQh61rY6GEx83lksjKsFTdHxd0YI8FpEYCn9W0T/?=
 =?iso-8859-1?Q?Ag50wmRYD0O1hRMJGNgZFv3T/Dd3dY59fViI5kEWpxztckV/2nTmlFbVhE?=
 =?iso-8859-1?Q?ytphqRhPnLYFyeLUP2SvwVrIvkFCRj2BfuuoFn2l58k226glquI/5mpT4l?=
 =?iso-8859-1?Q?J9VnoL1MtGqd2vzuBCeuNZw8ovYB56ggTDEzCaDm6fy4lL6mwIh3dNIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10448.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d495f9-8095-4e45-f9b0-08de029f5ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 17:07:44.7099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FxKfcNLVsleAXNvEZOl/et6PKw5/ca0Zyb+bH3vFVoxLttaFpLvpfi9FrSZ0JTN2wLf5vDnKN/TT8qQafW/s8ZvXB/wVLSW4W8BeetSih/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9213


Hi Grygorii,

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Hi,
>
> During review of v1 [1] of this series Julien Grall raised concern that=20
> "If the desire is to make 32-bit domain optional on Arm64.=20
> Then I think it would be better to pass the domain type when the domain i=
s
> created (IOW add an extra flags to XEN_DOMCTL_createdomain)." for which
> I've sent patches attempting to start solving the problem [2] and try to
> probe guest kernels before creating domains. While proposed changes [2] i=
s
> under review and hence there are definitely more work is required I'd
> appreciated if current series can be considered as it's Arm specific only
> and working (and tested) with current Xen in its current state.

I am not sure that this is a great idea. Domain creation process is
convoluted enough and your patch 3 makes it more convoluted and hard to
follow. Probably it is better to wait while [2] series will be merged
and then revisit this series.

[...]

--=20
WBR, Volodymyr=

