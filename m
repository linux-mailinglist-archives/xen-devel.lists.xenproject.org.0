Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A6AA40DF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 04:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973286.1361443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9x0i-0006rp-8D; Wed, 30 Apr 2025 02:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973286.1361443; Wed, 30 Apr 2025 02:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9x0i-0006ol-3l; Wed, 30 Apr 2025 02:17:20 +0000
Received: by outflank-mailman (input) for mailman id 973286;
 Wed, 30 Apr 2025 02:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYFu=XQ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u9x0g-0006of-Jz
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 02:17:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f403:2613::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c568720-2569-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 04:17:16 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB7290.eurprd03.prod.outlook.com
 (2603:10a6:10:222::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 02:17:14 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 02:17:13 +0000
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
X-Inumbo-ID: 3c568720-2569-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qL+CrOB6mqXP1vydzuu2QJznC0YQYguisndu57db/ZmAftcAPwz2tXzujHOYBzRTFwlUFE/P6balGGfffE9DNgfOcg6AThUwAQtSRDJJ3FD7tNlkNZhSuX58UQ9M+XBxknH2SqTvm5UjEm+KL65OgT53rd69HHDcZK4+L9zyrg8GGXU8oT5SBfacgRi3ESVvqw1uLGdY4F7SHB3RLw1MamlqqPLo+Fo9CSCGWt3RA+fM3sS28piicUCMzXePVIWgt5SFRiyq/MGNLN6XuWW92YkrpCrdCKIu5ovfO6GD4W3CApRMOUnPf388Glb4xjMwQhfsMrF9FQexYSrlAg5D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlWiEDl3v0ISJea4AfslNIvfr6IR2IR3TkfekhZFVsQ=;
 b=IK1nUCksUdamNwSJHySeIdjFwcsXIJ+owXEjR5WLnLynPpGsGSNWplnMk3b2GHujxJR3Xhl1If4QllfpVFUmX/CL6uf+5Hd0irmHtAqYlG6RCaR9DwrDWrfwIxEzyTEw8/5sx52Nr3g2BJt2yBuxWbUPYi0UXOoiLo5e0nJJper9OuSNpVI7/LixdQ6ZktOGWNlD7dG0Pi3vUHx4ffZViEFd14pBuMJGSBWcoDRbxypzMQeezHaVsR+LOJArypO/lc52XqYWzPrZFAMrKt9ll+iY/ianTEKVptQezGHPkZtJPoB1eFRjIu6/6LY9rXnEPTQi8ZVvRDyxKHrDUvoMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlWiEDl3v0ISJea4AfslNIvfr6IR2IR3TkfekhZFVsQ=;
 b=dNOifEFuaHcAB1RYjUzp7tI+OAdWgeLDHvzVDtmQfjgCnvGQshKs4Z5/oFsFVSunMRxH3AEQor6tnn+2d9eOvmbma0D3jGKOhdzmAvAsl2ENxjFs00qu8epZ0kXTRXZMbiDT8o0bDV3oPYJ2dHjLLKOlNGNUnY9K/XiRZx3KQBdHNV77g4zKIfStix67LrK8FtqHZa1AyMmn66fTV7jqPQbOs/gXonXs37D04sHWQUI6/JtS547XtCQKgKXeo0qPj6skWif8PxylFsTu3omaeVupMvdKNF+Wz+yNP784Xc22RKwtZZZtaNtAXrv1IoFhkBdaLNYfqNlbCzUDXymUaQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Thread-Index: AQHblUI7lWJ91U/YVk+TK2sT0KKY9g==
Date: Wed, 30 Apr 2025 02:17:13 +0000
Message-ID: <87cycue6l3.fsf@epam.com>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
	<5d519ffd-8747-4367-b92f-01c20a483e72@xen.org>
In-Reply-To: <5d519ffd-8747-4367-b92f-01c20a483e72@xen.org> (Julien Grall's
	message of "Fri, 21 Mar 2025 23:31:24 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB7290:EE_
x-ms-office365-filtering-correlation-id: e76e3a7b-5627-4964-e6e8-08dd878d1f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?u22AOjNNWQ2+xNWuMweXGqU5yFomvqLQ/5YZ8KjYB9Pd+m8ZkS9cqH43mR?=
 =?iso-8859-1?Q?HbuumFU/uPdPQ+iUXthZ8t+hOAcF4LN+ehwtXvOKOpvWESCY6TdyA9SpMU?=
 =?iso-8859-1?Q?CADoa951ElsTDKJBchSU8TFQmZRSiUqNXTs6UUYxQAh0SSSCUrzwQVr7Ka?=
 =?iso-8859-1?Q?jjaZRJC/sDnDimOoITiLYU53iQewPOLU8A3mvbp96V0kHhJE31tjD3qch7?=
 =?iso-8859-1?Q?HnEtTm+M1KqhWgOp2GeL1hK4ODtQ9uoOMM8tVf89DZDnPMfyymVZQ+0TCl?=
 =?iso-8859-1?Q?zsU6lpq7RN8TU2MD6qz9bPjAlc3zB0HSKUUI1n1WvqskPfJD1jSY13ipBp?=
 =?iso-8859-1?Q?YAaBvAWFIjIGVSYmDDlvUJrttm/cjcAO+jv4Zxy59BmB1gf0HcvLc/jlJG?=
 =?iso-8859-1?Q?uykpN+F8VT1bFcWHh9DyzOZUA+oe5RqK7ioo0aduUO9z2k0558d3NtRFyB?=
 =?iso-8859-1?Q?uIDSJE7emATKe+FV/SRs4phWthxHemkDY/TEehrV9NBVfh3CUDr2vOZNRe?=
 =?iso-8859-1?Q?GDQvhhaSo+Fc2pyMaVv6epok4j9gLAR+emkPrPUbLBZnQl+qvu4R6/ScEq?=
 =?iso-8859-1?Q?n/XugHHlg7DWm5KH2yz2ZpYAjMNQdXjIBqKNMZ+7tzUiMf02FDuvtE3Xdd?=
 =?iso-8859-1?Q?EOebHCwXgcIYPbfIvvjkkhGhyA4tLeMWHoKeRKuWzaO4j/yA2f/S6Sz2Dz?=
 =?iso-8859-1?Q?3aYSJBV/DLtiAtop1q1hKYf/Jzga5VIKaICM2hiuDxGRlkEXCKRNlWhSsG?=
 =?iso-8859-1?Q?/2ZlHKxDe4CFkQWBX86CZAGHALcuF/tG0mwnhBwf8UXTkkaOUG89GiXzxy?=
 =?iso-8859-1?Q?bCLnLHA04hhYfQfmvyT5YzJuJzTMbS5mXNDGHNx/QVd0LkB/y6JBjjzcrU?=
 =?iso-8859-1?Q?fnuAlO/RA+ometorsZq78MpVqswywdMdPDNr8CSgZQpz9uE53mo6+a0Zn5?=
 =?iso-8859-1?Q?Y9OSwgPkw7jT4i7DbkNM2bUIyq7AtvaURfmjmQueYdQkB1O1xpWFk43RPm?=
 =?iso-8859-1?Q?10eXLtY9QIbkkgjiQcuFKhHSc+OQJaxnnFPm+jq5FQpkUI+KbMOnQZg7aS?=
 =?iso-8859-1?Q?SyZkN8wLDCrzxvQpmGWrY8JZP7E6n8/bz751OUKEtj2jN+CpNAZq8PQEj4?=
 =?iso-8859-1?Q?+YTTxAN81P7/XQMnlUTp5+dgmm0lG7k8BaadN3b2b7+YkhM8XoFki41Ama?=
 =?iso-8859-1?Q?bF343vYoJJ1uIQiTnx+8JS5rVyreC8IUxYetLrjDOIUCFitAKzg+NKR6wD?=
 =?iso-8859-1?Q?9CTsClCVC16ztYy4KFi44ay5IZOd75qrRovG1dEwDodfMmEGfUyD1cfB8N?=
 =?iso-8859-1?Q?aQsh7G9BEbvCQL25vSLdBZ4+GPPFiNTecdji1673OfcNScedBe3cqGjbJF?=
 =?iso-8859-1?Q?sjBaP9C7LFAZSPQKNG29r9YlNbaXYUe/kyoB4fOwabXyv9zxH6MJKcItkw?=
 =?iso-8859-1?Q?T98JiJ4w+lCtoVpthNNj1rfsJ3lpKlCWf2ZAfias9gYlyQP1KB63n+msv9?=
 =?iso-8859-1?Q?VK/+PpXQlAY+aNNgToQJqnzYbYF5XV+tL88zMvD5tyKruaYCDXpAv7x/dH?=
 =?iso-8859-1?Q?SJZFMBo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BzwxegM//GbWTUhUwLUSFI9vniUtKGFFItP3SlYgFFus59pe3P3n9U3Lc8?=
 =?iso-8859-1?Q?DAmT0xYrWah7zB/VEJDXgD55WpkAMKh1GCkMiTQdRhE0vUWrc+zWN2tqsN?=
 =?iso-8859-1?Q?IraCelUejModtoVSYVeVUYo53Mcvs1+qrNjMWHA8MfXhvGSQrL+Y1Te7/U?=
 =?iso-8859-1?Q?PvlF5N/M+svgTV/lH/khFqhVUN64Pf8w85hRcIX6ZkA9kdw3L2kvuhx7CI?=
 =?iso-8859-1?Q?rlNubDuiPYT7lkTAEyCmpy6Vxo0x4wAUEQ2iN9BqrKCd2Swl4MK/tqJHK6?=
 =?iso-8859-1?Q?dH3yiyrmleyoU7SA/kt4BzJBAryPbpnu6Xa9PrUitF0gxXuL3/6LGMp6+1?=
 =?iso-8859-1?Q?+tW92KBTG6MAEJjx2yqULVay9IdsXtTJroIC9XA76NU6YE00rVob6ylEK4?=
 =?iso-8859-1?Q?jTRUhjIqIfgRJ3Tzl3giQibyybIraBTNbMShluyOxaAD9dr4BJh4O1DYPx?=
 =?iso-8859-1?Q?ZnfzSzoMmsiT10HAgc2ekFwicZL2coqs7KZJkGRmqw0+JSSeEdqPMNjhRa?=
 =?iso-8859-1?Q?sugBxNbljJgU3tmBlV1KrqYSbuwSrzi/zC5mdHrMDTM5muwKd10R/d4ECK?=
 =?iso-8859-1?Q?EzDf3aoD5eBdCIoQ1C0KcH+5jzeKKqKhqvZP8XcWrIHR/ju0vMSvAV2Dv7?=
 =?iso-8859-1?Q?iGtcJaiGsy4/k2b/DMLsCpukX9uHyB6e+7HvP+LjtEDE6Er/dz7kse7sKV?=
 =?iso-8859-1?Q?uZcHpcBQ9mfSdi9QZpTCLhk6Igpz33UlBoPXo3iZi3l4iOhtwEfvU4WpkL?=
 =?iso-8859-1?Q?VkDe1Pp8n9vJYhjTLjCq+SUGUwObzXy3+F9NpgIKc/12O2eoxB4Ex9OAYA?=
 =?iso-8859-1?Q?KRFBymjkbFIXU66Z3v1yThjWeDKihlVJZrZUG93VfqVQ8TxCEBxEcWXNIG?=
 =?iso-8859-1?Q?imdXApCySCKKfrBLLWLbyr0DgY+5XlaiKS/SpyNTqB+MwFuwBeLESyWIvZ?=
 =?iso-8859-1?Q?DJrdwE6DWKjIOOSun91M1vrdn37nSswOSdI826pYffyQQpKgQZ/7h4IuqL?=
 =?iso-8859-1?Q?NxR41Xdb/e8JG9d4z3YxtanuVIhu0CGaAEtL0BHu3vsgO67yVpvj5PfDGl?=
 =?iso-8859-1?Q?aJ+epVjMZpucaqny7DFQ+bSsKAMa9qiGKAqoMnslrIKkZyJA41BDMp+TeM?=
 =?iso-8859-1?Q?tBgJ8Kjn7Dgsh6fOyMpiihU9p2QNq8cFsMgJh8bTRWVM69yYrEhFu/QlLX?=
 =?iso-8859-1?Q?p5xC3EiDolFPrGhz1DPtfoNQYu/sW7v/+KZ9wTJwm1lWxLV8DowkBM6U8g?=
 =?iso-8859-1?Q?IIuVFgmcNbDZXJRyLl0TBSoGqaY6SHM5MJr0SywxTu1xymo8FTZRUZTvIS?=
 =?iso-8859-1?Q?jRY8u4lvOpR7PDcVP/hj4QEfbLC4mDeoIWVqBlHcry/s3OhWNC59K/rQ82?=
 =?iso-8859-1?Q?KQbg7iVMofdqftn+5V0pPZhOhaB4YGp7hGyu0OJDC5JFuJ4kpMG65MyFuL?=
 =?iso-8859-1?Q?Qg+Q0ntCRHFQAnQLbIUCkg6FIg8XTz/OgYfhC8oY/xmNtlZLwZC5HLObkJ?=
 =?iso-8859-1?Q?ZkMn98OcimG20utyYpV/qGivDpLgrGdZSuFjqQgwyBLh0CXCCT5JhV/m2K?=
 =?iso-8859-1?Q?FM0Yh17Sq9b8rD7HKnfZWgCaJjGwYl1M2aysSQJOmXuIgs2X7X02Q42bbI?=
 =?iso-8859-1?Q?qCm+2afBdMDn81R2T9TvvPO5fYU2JWhDBSRXZNdZcryHy8xiRSYhsyAg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76e3a7b-5627-4964-e6e8-08dd878d1f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 02:17:13.7371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woOxFXPjkJeSoBXFDbc7LIhLf2xAXqpiAbz7LXzpMsLm2fWOFzD0XlYjzTAWgxuyUj5Ml+PYb4Sqxzx5sDEGc6MedrV2b1JTCsVu5XrHs88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7290


Hi Julien,

Julien Grall <julien@xen.org> writes:

[...]

>> diff --git a/xen/arch/arm/include/asm/libafl_qemu.h b/xen/arch/arm/inclu=
de/asm/libafl_qemu.h
>> new file mode 100644
>> index 0000000000..b90cf48b9a
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/libafl_qemu.h
>> @@ -0,0 +1,54 @@
>> +#ifndef LIBAFL_QEMU_H
>> +#define LIBAFL_QEMU_H
>> +
>> +#include <xen/stdint.h>
>> +#include "libafl_qemu_defs.h"
>> +#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
>
> Is this defined by libafl or an internal decision?

It is defined by libafl

>
> [...]
>
>> diff --git a/xen/arch/arm/include/asm/libafl_qemu_defs.h b/xen/arch/arm/=
include/asm/libafl_qemu_defs.h
>> new file mode 100644
>> index 0000000000..2866cadaac
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
>> @@ -0,0 +1,37 @@
>
> Missing license. Also, is this file taken from somewhere?
>

I add MIT license, as libafl is dual licensed under Apache-2 and
MIT. This file is based on libafl_qemu [1]

>> +#ifndef LIBAFL_QEMU_DEFS
>> +#define LIBAFL_QEMU_DEFS
>> +
>> +#define LIBAFL_STRINGIFY(s) #s
>> +#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
>> +
>> +#if __STDC_VERSION__ >=3D 201112L
>> +  #define STATIC_CHECKS                                   \
>> +    _Static_assert(sizeof(void *) <=3D sizeof(libafl_word), \
>> +                   "pointer type should not be larger and libafl_word")=
;
>> +#else
>> +  #define STATIC_CHECKS
>> +#endif
>
> No-one seems to use STATIC_CHECKS? Is this intended?

I used this file as is... But I'll rework this part.

>> +
>> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
>> +#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f
>
> Are the opcode valid for arm32? If not, they should be protected with
> #ifdef CONFIG_ARM_64.
>

It is valid even for x86_64. They use the same opcode for x86_64, arm,
aarch64 and riscv.

[...]

>> +
>> +#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)				\
>> +	libafl_word _libafl_##name##_call0(	\
>> +		libafl_word action) {					\
>> +		libafl_word ret;					\
>> +		__asm__ volatile (					\
>> +			"mov x0, %1\n"					\
>> +			".word " XSTRINGIFY(opcode) "\n"		\
>> +			"mov %0, x0\n"					\
>> +			: "=3Dr"(ret)					\
>> +			: "r"(action)					\
>> +			: "x0"						\
>
> Can we store the action directly in x0 (same for the other argunments
> below)? This would avoid to clobber two registers (See smccc.h as an
> example).

Yes, this part bothers me also. I'll try to rework it to be more
efficient.


[...]

>> +
>> +libafl_word libafl_qemu_start_virt(void       *buf_vaddr,
>> +                                            libafl_word max_len) {
>
> What coding style is this file meant to use?

Well, LibAFL people is very lax in their coding style. I copied this
file as is, but probably it should be tidied up and minimized.


[...]

>> +void lqprintf(const char *fmt, ...) {
>
> I am not sure I understand the value of lqprinf(). Why can't we use
> the console? When is this meant to be used?

This is alternative way to output something. It skips all the
abstractions around console and outputs straight to stdout. At least,
this is a nice way to check that communication with the fuzzer is
working.

>> +  va_list args;
>> +  int res;
>> +  va_start(args, fmt);
>> +  res =3D vsnprintf(_lqprintf_buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt,=
 args);
>> +  va_end(args);
>
> What if lqprintf() is called concurrently?
>

I'll add a spinlock.

[...]

>>     void call_psci_cpu_off(void)
>>   {
>> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
>
> I am a bit confused with this call. For a first, this cannot be
> reached from a VM (or even dom0). Then, even if it is reached,
> shouldn't we allow the test continue while other pCPUs are running?

Yes, looks like this particular call is not accessible by a dom0. I'll
remove it.

> That said, the call to QEMU is not PSCI related. So shouldn't this be
> called from the callers (same applies to all the changes in PSCI)?

Purpose of fuzzing to cover as much code paths as possible. So it is
natural to put this as late as possible. I also reworked changes to
sched/core.c in accordance to this. I.e. moved fuzzer_on_block() calls
as late as possible.

>
>> +
>>       if ( psci_ver > PSCI_VERSION(0, 1) )
>>       {
>>           struct arm_smccc_res res;
>> @@ -62,12 +67,20 @@ void call_psci_cpu_off(void)
>>     void call_psci_system_off(void)
>>   {
>> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
>> +
>>       if ( psci_ver > PSCI_VERSION(0, 1) )
>>           arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
>>   }
>>     void call_psci_system_reset(void)
>>   {
>> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
>> +
>>       if ( psci_ver > PSCI_VERSION(0, 1) )
>>           arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
>>   }
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 9043414290..55eb132568 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -47,6 +47,10 @@
>>   #define pv_shim false
>>   #endif
>>   +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
>
> This Kconfig is only defined on Arm but you are using in common
> code. Even if this can't be supported right now, shouldn't this be
> defined in common code?

Yes, I am going to move it to the common code, but will it be fine to
have "depends on ARM_64" in the global ./Kconfig.debug for a time being?

>
>> +#include <asm/libafl_qemu.h>
>> +#endif
>> +
>>   /* opt_sched: scheduler - default to configured value */
>>   static char __initdata opt_sched[10] =3D CONFIG_SCHED_DEFAULT;
>>   string_param("sched", opt_sched);
>> @@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sche=
d_poll)
>>       if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
>>           return -EFAULT;
>>   +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
>
> I think this and all the changes in sched/core need a comment
> explaning why we want to stop the fuzzing.

I introduced fuzzer_on_block() function and put the following comment
for it:

/*
 * Conditional success
 *
 * Sometimes a fuzzer might make Xen to do something that prevents
 * from returning to the caller: reboot or turn off the machine, block
 * calling vCPU, crash a domain, etc. Depending on fuzzing goal this
 * may be a valid behavior, but as control is not returned to the
 * fuzzing harness, it can't tell the fuzzer about success, so we need
 * to do this ourselves.
 */

Will it be enough? Or do you want to have a comment before each call to fuz=
zer_on_block()?


[1] https://github.com/AFLplusplus/LibAFL/blob/main/libafl_qemu/runtime/lib=
afl_qemu_defs.h

--=20
WBR, Volodymyr=

