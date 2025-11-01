Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE7C27D37
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 12:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154891.1484532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEC-0002Cp-NP; Sat, 01 Nov 2025 11:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154891.1484532; Sat, 01 Nov 2025 11:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEC-0002B2-HL; Sat, 01 Nov 2025 11:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1154891;
 Sat, 01 Nov 2025 11:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLmn=5J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vFAEA-0002Ar-Qi
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 11:57:03 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df81880c-b719-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 12:57:00 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DBBPR03MB7130.eurprd03.prod.outlook.com (2603:10a6:10:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sat, 1 Nov
 2025 11:56:57 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:56:57 +0000
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
X-Inumbo-ID: df81880c-b719-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/DfiffdbKObjs4etChOzVJKvrCIeyB0WwYaBI9w1ZG2xQZhsudFDPWR27U2CVC8GO+y02EHA2KNg7XctyLl8qB1DPTE9cgiReyE0HL/0zMyC2g0SQ+gidmHNXCHpWUxzIWjU5Oaquk6dMgyuYKlkEfNdNwenvnGjAyp7m3BNjpuwfBAdgum/SvXLlukUMEbWViKkslPy1aK1YnyneBqx4UGJfD9dnq2cykYZh8amK1dUDZzHsNLgOnxDcQR7v36+SUui0jYb0kzhNZmSXNaokATqb2vVhPU9Ujqmb6UgcRzxPpe1eO8VXYEUud9CDNxJe629kqz+lJbhAPUtJ6LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT/yEXmI45eBiggl8I8upOczw/AqEfdB0lot1gsx/GM=;
 b=C9YU1UFeFyW6Pm9bRw1tATjNWqvmB4IqlJtjfy1FwLIW+ESuCBesI3ZI/Ba/phKqyoDx/3jb/mgHMybQGfBNivecgydy2ElQ/o737iKcG+nBCrIScy4hfU1L6nN7nYA3eNkGGWB7AFFYXtuN9TNMSSp3UnFj336656M51F8SIRpLsMy5auxIA5bWnrztCxCJra03gC1gZ9w2tDv2o0a+Cnh8rA0qXqb4DomL80BI5a4E+sGVGmlzgDhygkZ+XaPJsPFduUmVf7xBoMtawyWL2RA/ecRMTjEHEqaKpy7asgPDrwfqc9+lrLVZyr7JoZIsEukt2tut0iKmqthWxetegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT/yEXmI45eBiggl8I8upOczw/AqEfdB0lot1gsx/GM=;
 b=ekTXNkd7WjEEVhHfCcc0zaOXl+4Le3/lm4N04ACxF0gjBeRjV7jpR8fenRRuyfeemGpvm3RysvekUlCR7MYYKewKR3IbPUTgoBXTHrsQT6ZW1sNxvqKgcPsdkFMcl7L6izgejOKEVo+csP7weDse09aZsh+CchJg+Se3+J1dQtUHl1hQ+wWZvjrgkqU4Z5IT/W554psb6My49BNV+/lKFt4tkQRfzpK+UKONqT0RSf9X6t2YHU9PDL4aXpZrGvx5W73rgL5LKc7hohBkVZgyqaBdkCUXH0NGejnYJN3Cd4wuQHaF5UZdOe/jrOIFnxQ058EiqzDjuxixf8Dy9JbDsg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v6 3/5] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v6 3/5] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHcSyafwNcBoMRdYEm2n7tK7o4JtQ==
Date: Sat, 1 Nov 2025 11:56:57 +0000
Message-ID:
 <33372689f3097b0dde1d47b81a1bb8176b35d20c.1761998077.git.oleksii_moisieiev@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1761998077.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DBBPR03MB7130:EE_
x-ms-office365-filtering-correlation-id: fafdac47-cdc8-4cdd-084d-08de193dc220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ycyjRMQses7+NDsdmDGv0AxCz0UuFMlbivqEL73pyo5D0K3581wE2qF65s?=
 =?iso-8859-1?Q?7vUbiM0RS9XPaytNYfTQhhk4g9hdnzEGxYzaVhhoNgQRpaTEYC0rHo3OBX?=
 =?iso-8859-1?Q?lCYXHN7yFZBjc7QUTNTkwPohttUs1sPsXV7EOQ4mKrZEeufpJwuid4nnls?=
 =?iso-8859-1?Q?MphyK27WDJWq6Z+a8QN1LwyQ1IrhG1trxpEkM5lsIQ4pA74pFrzztWRjxz?=
 =?iso-8859-1?Q?keNvzKNjvXbeSMMANK1dnmpRmitG0qb5VOKCjZDeWha2YpJDZ0MH3iHNNO?=
 =?iso-8859-1?Q?2yDFesFqxIM3xBlF99flEGrSlZo0o/CXXM6Dm3gs4SAzjMVBAkeRPpaIwx?=
 =?iso-8859-1?Q?MeKiBe9gW12fXpFMqyRbtvY+wD7Xu5gOzuNvAph8j8dnXUyRw2c8L+18r8?=
 =?iso-8859-1?Q?yRXUBDWNYlWf/FgSPbTwa8XZm96L/PvwPolZLKAgMNPls86SaweWJODNVe?=
 =?iso-8859-1?Q?of27kNGwxIAtKw3KfX+bAsyb+Dc/gYZvmgTOfZZfYW0gLjrh0SoTpSxprJ?=
 =?iso-8859-1?Q?XWj7Rlq4DREk2rON3qk4jFiYNA0z+NQoZ1orI+WIvqcLGnBYMCdI+pjYT7?=
 =?iso-8859-1?Q?MVc8uH9SCbY7LzsSvPXrekbnRDXCmaob491e9Xjo4KAmMJaG0grzf9sVL9?=
 =?iso-8859-1?Q?ON5MXCCw8ZqnI8UBH6ltykE9l8CBVB2BYtEaOi/ARxWITE71S2nou0UZx+?=
 =?iso-8859-1?Q?E/E8nLo9wZ7HpOej7+cKm++f0G1zRHld7uOnCo7s74Z1+Uhv0+nTIxtDpk?=
 =?iso-8859-1?Q?ykVlKyiogf7278xls0JUMxhUmH/T1cvhP1peyGHMUb/m+XhYHE6Tp4kAm9?=
 =?iso-8859-1?Q?bl37LjJuXtoXlzF+5MTzPuJrSyY9XHSwMWFXvHJjEb6wY56QepTfo367fi?=
 =?iso-8859-1?Q?1jPot9tWBUVqbShSH6GTlHrkfHAQC6dl0H1282Hb5izzBpiNlBfAVAcqu4?=
 =?iso-8859-1?Q?TqaDw3Lonlf3jbcGW7JHAmaGPdcgOO3t6GL4uarA1azn9NdD3Kkb3FwGdO?=
 =?iso-8859-1?Q?/JmAxqJiHVLowjQJxLBl70Zl1Kd768D4/DlQaDaUnfNMWAndLbksUF104w?=
 =?iso-8859-1?Q?xPPjV1mAL+gNVjmR4uCmITg8WBFxdHdBhpCRgwga7lFE11CE7Jdj8b6V2W?=
 =?iso-8859-1?Q?RSUV5sTwEi0EhsiRYqz3YnUCDujilctzScRAfhJblbiLXV/7ewrRchvfe4?=
 =?iso-8859-1?Q?b32Etll5x/wtN9zHlwhjI0ns2C/pH+HusUSdk0uNGVWnZKOw37QVuAEpx/?=
 =?iso-8859-1?Q?klNKMHYtktbj80i+I3VrIHzVG0feDpFeE/6S6ArgZefczowpO9QEyHAVGi?=
 =?iso-8859-1?Q?UolzfxJgLh5aLngi3TUQJanjlbgKXhOmGtP7LzfxXIg3Sbr9zYR535A0T1?=
 =?iso-8859-1?Q?x/Z1Xh7w5rqIrA+VtITB9F/LFekA+bWnHJVZ1jgdsYEqYHCRpfXMMXLB08?=
 =?iso-8859-1?Q?Ey/nhNtFrtc80UZXnTslZiY6fKFtFnQZ4wmmmOmJjLM8xK1jTCrnp/0V6F?=
 =?iso-8859-1?Q?6lEnUjzKMzWJmOOl6WgypfDfeYkr3oezkAUAmBpuE+lU2QZlTUJTBlVDUP?=
 =?iso-8859-1?Q?9XYz21JE0iwZQpE5YT7+Ltk5bCpt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MWSHB+Gy3u+21RQ8N6BPGKmQtjTL8VKzsT6S2WCPCZwxJELO1wFUyM5bwh?=
 =?iso-8859-1?Q?yh8dXqn8+rpkPwNuCCpepJWRQccXUw6aRX2RhN6dRlf06lAfyUr/hhoLpE?=
 =?iso-8859-1?Q?GqI0pdAGOmNd5W+WF8lGyPkKcWFBhfubwvjfeig0Z21kdGnyaLsdTdt8bK?=
 =?iso-8859-1?Q?mTotHMjywf7Xcf0bpO29sh67Zy+1oxJONODzEXZMnZyJa3Gf2dD/VkXWKF?=
 =?iso-8859-1?Q?xT+rYiuDS793NtPDM7Ot7SumvsJrz463vBaoO2Gl5Uo+Cd+uQrKkBIfleI?=
 =?iso-8859-1?Q?bU3MyqDiGOk40gthuaKc1YxwKle91F821O++EWTt8yRl0hQcDDPQaygwJ9?=
 =?iso-8859-1?Q?BXtaIKsqeI7jc0DKTqXVmr1f9WGjChcQQ6ahA5EmDfCl4TT75H6t/MEpUr?=
 =?iso-8859-1?Q?v43gL2nSGaHtmjhjYRYB9MLzsM1iqqWJ88V0bWCDqgW5jJAg/T8DhJb0yg?=
 =?iso-8859-1?Q?m0+fOpWKVO4Y8E0bv98aOTiNcYEnQVQQt0lTS2UfXj5qLOU8UiVo7Ota+C?=
 =?iso-8859-1?Q?Y6DpJAQfY1etOU+jdVkYp33Oh8nu0NKyvf9b9B7R/UfTauGIyjlj0ezjYa?=
 =?iso-8859-1?Q?/vkS1WhZ1Fmi6xCJHqtopP3pd2OLdLmdXyG7S7Uxf72NeqFFI+OnifRr/5?=
 =?iso-8859-1?Q?xFH2wd4tokf/jZijbx+G5vynJPpeewFB/BqDos1k6hLj27PnQArVR7yv/P?=
 =?iso-8859-1?Q?67EP8X3lmI8oQAAOu8NkkRcbwtTdYnSazDX0FMzxu1CMHonOLCZ+NAP/m9?=
 =?iso-8859-1?Q?HQ5w8sFGPCBFyjjbgp2QJ4+VDhErzv1P/f8ISDBu9n+6PgAiXp+kMG9CrK?=
 =?iso-8859-1?Q?7o+e+OkB55k/k0RIKlfsAD6N2CXNAjvzLjXp6XJYZfEkQy2DbxO5QCSaxK?=
 =?iso-8859-1?Q?HfuJdpuNC7/QxyYrf8Upza09/qIv6Oc16riaNmfbQ2itdzlwDb3s6nlrKx?=
 =?iso-8859-1?Q?4tiRljQ7MkA/FkTZWDknkBEaD3JOLWrV8dtQQmvXzwm0p9qwUbajpO9Syr?=
 =?iso-8859-1?Q?iki4ELkEvCuCpfxKvyb89c/MXHZ01jhdwB89MGEXK1Hie+9g3O4rSGTwrx?=
 =?iso-8859-1?Q?sImjxHYPKcbIjwSjj6GF+zLX4WudLi2EtgJ9jSs3eh013XYUv0IhMZQ83c?=
 =?iso-8859-1?Q?a5pqB3IBpAXfIhybz0yBoR2sFqb0D0RxbvPmsm+W+EPYufgHIdbxk976ra?=
 =?iso-8859-1?Q?cKuOz7cg6hTx5UzcoBr15KsfJPnQHbvvMWMRkKTTzAhmO2P21E0Wlt2lIf?=
 =?iso-8859-1?Q?wiQOt7ZY2BdSUqzk5dsNFVhrLyrzyD2eBI1r7TjMH6mD4NBokK/iEUvsVz?=
 =?iso-8859-1?Q?eVI5nj9gXGW4Bz24tDyujmTu+TfuARkCTAwPLLYSzRtLE8jY848xLgT8yW?=
 =?iso-8859-1?Q?J/OGqQmdrZAf1kIbTel61P7SXyDYzXVlzfUBiQ1bStHqn87JEz8LUMHQJu?=
 =?iso-8859-1?Q?qRd/go2D2SiqB3tkFrD1pCDJg1b8BH3QAqg4q6JaneVkL50PsPzK/QM0uO?=
 =?iso-8859-1?Q?kX+pSdo2oM0ro6h8YqgoWts7n1sp21A6jKyr+7YuD8iwSU3JjhIHSwEFKf?=
 =?iso-8859-1?Q?qq3XejOjAysfiWPjXb5KSwBzQjDyV5AkG7paRvw8x32bX6r7awaZC5lDcb?=
 =?iso-8859-1?Q?EiPpBjf9ysFpgElR1arUjmJlaat28lChNTUuCXMC9MZqJWZigusZsatw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafdac47-cdc8-4cdd-084d-08de193dc220
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 11:56:57.3554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MrNyCxpbZbT2jGEB6X+8psSJ7X4yox0a8+/MGA3ZUYdkcSSXNZpDXDk2HXLkaddCxRzi+6LUGaTlbYIVISvB4TiyOwP5sD9z2jaYwlChLtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7130

This commit introduces two helper functions, `__memcpy_fromio` and
`__memcpy_toio`, to provide a robust mechanism for copying data between
standard memory and memory-mapped I/O (MMIO) space for the ARM
architecture.

These functions are designed to handle memory transfers safely,
accounting for potential address alignment issues to ensure correctness
and improve performance where possible. The implementation is specific
to ARM and uses relaxed I/O accessors.

__memcpy_fromio:
Copies a block of data from an I/O memory source to a destination in
standard ("real") memory. The implementation first handles any unaligned
bytes at the beginning of the source buffer individually using byte-wise
reads. It then copies the bulk of the data using 32-bit reads for
efficiency, and finally processes any remaining bytes at the end of the
buffer.

__memcpy_toio:
Copies a block of data from standard memory to a destination in I/O
memory space. It follows a similar strategy, handling any initial
unaligned portion of the destination buffer byte-by-byte before using
more efficient 32-bit writes for the main, aligned part of the transfer.
Any trailing bytes are also handled individually.

The double underscore (__) prefix follows the Linux kernel convention for
low-level or "raw" implementation functions that:

1. Indicate internal/low-level implementation: The __ prefix signals that t=
hese
   are the actual implementation functions, not wrapper macros or inline he=
lpers.
   On x86, memcpy_fromio/memcpy_toio are simply #defined as memcpy (see
   xen/arch/x86/dmi_scan.c), but on ARM they require special handling.

2. Architecture-specific behavior: Unlike x86 where IO memory can be access=
ed
   like regular memory, ARM requires specific IO accessor functions (readl_=
relaxed,
   writel_relaxed, etc.) to ensure proper memory barriers and hardware sema=
ntics.

3. Prevent accidental misuse: The __ prefix warns developers that these fun=
ctions:
   - Have specific alignment and ordering requirements
   - Must not be confused with regular memcpy()
   - Are meant for IO memory regions only (marked with __iomem)

4. Consistent with Linux kernel style: This naming convention is inherited =
from
   the Linux kernel's ARM implementation (see linux/arch/arm/include/asm/io=
.h),
   maintaining compatibility and familiarity for developers working across =
both
   codebases.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/include/xen/lib/io.h |  83 +++++++++++++++++++++++++++++++
 xen/lib/Makefile         |   1 +
 xen/lib/arm/Makefile     |   1 +
 xen/lib/arm/io.c         | 102 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 xen/include/xen/lib/io.h
 create mode 100644 xen/lib/arm/Makefile
 create mode 100644 xen/lib/arm/io.c

diff --git a/xen/include/xen/lib/io.h b/xen/include/xen/lib/io.h
new file mode 100644
index 0000000000..16758691b8
--- /dev/null
+++ b/xen/include/xen/lib/io.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic I/O memory copy function prototypes.
+ *
+ * These functions provide low-level implementation for copying data betwe=
en
+ * regular memory and I/O memory regions. Each architecture must provide i=
ts
+ * own implementation based on the specific requirements of the architectu=
re's
+ * memory model and I/O access patterns.
+ *
+ * Architecture-specific implementations:
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * Each architecture should implement these functions in xen/lib/<arch>/io=
.c
+ * based on their hardware requirements:
+ *
+ * - ARM/ARM64: Requires special I/O accessors (readl_relaxed, writel_rela=
xed)
+ *              with proper memory barriers and alignment handling.
+ *              See xen/lib/arm/io.c for implementation.
+ *
+ * - x86/x86_64: I/O memory is directly accessible, so typically uses:
+ *               #define memcpy_fromio memcpy
+ *               #define memcpy_toio   memcpy
+ *               See xen/arch/x86/dmi_scan.c for example usage.
+ *
+ * - Other architectures (RISC-V, PowerPC, MIPS, etc.): Should provide the=
ir
+ *   own implementations following the function signatures defined below.
+ *
+ * Naming Convention:
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ * The double underscore (__) prefix indicates these are low-level "raw"
+ * implementation functions, following the Linux kernel convention for
+ * architecture-specific primitives. This warns developers that these
+ * functions have specific requirements and should not be confused with
+ * regular memcpy().
+ */
+
+#ifndef _XEN_LIB_IO_H
+#define _XEN_LIB_IO_H
+
+#include <xen/types.h>
+
+/*
+ * __memcpy_fromio - Copy data from I/O memory space to regular memory
+ * @to: Destination buffer in regular memory
+ * @from: Source address in I/O memory space (must be marked __iomem)
+ * @count: Number of bytes to copy
+ *
+ * This function handles copying from memory-mapped I/O regions using
+ * architecture-appropriate I/O accessor functions. It ensures proper:
+ * - Memory ordering and barriers
+ * - Alignment requirements
+ * - Hardware-specific access semantics
+ *
+ * Each architecture provides its own implementation that may:
+ * - Use special I/O accessor functions (ARM: readl_relaxed, readb_relaxed=
)
+ * - Implement alignment handling for devices requiring specific access si=
zes
+ * - Add memory barriers to ensure ordering with other I/O operations
+ * - Or simply map to memcpy() if the architecture allows direct I/O acces=
s
+ */
+extern void __memcpy_fromio(void *to, const volatile void __iomem *from,
+                            size_t count);
+
+/*
+ * __memcpy_toio - Copy data from regular memory to I/O memory space
+ * @to: Destination address in I/O memory space (must be marked __iomem)
+ * @from: Source buffer in regular memory
+ * @count: Number of bytes to copy
+ *
+ * This function handles copying to memory-mapped I/O regions using
+ * architecture-appropriate I/O accessor functions. It ensures proper:
+ * - Memory ordering and barriers
+ * - Alignment requirements
+ * - Hardware-specific access semantics
+ *
+ * Each architecture provides its own implementation that may:
+ * - Use special I/O accessor functions (ARM: writel_relaxed, writeb_relax=
ed)
+ * - Implement alignment handling for devices requiring specific access si=
zes
+ * - Add memory barriers to ensure ordering with other I/O operations
+ * - Or simply map to memcpy() if the architecture allows direct I/O acces=
s
+ */
+extern void __memcpy_toio(volatile void __iomem *to, const void *from,
+                          size_t count);
+
+#endif /* _XEN_LIB_IO_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241..6bb0491d89 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ARM) +=3D arm/
 obj-$(CONFIG_X86) +=3D x86/
=20
 lib-y +=3D bsearch.o
diff --git a/xen/lib/arm/Makefile b/xen/lib/arm/Makefile
new file mode 100644
index 0000000000..8a7b6cfd59
--- /dev/null
+++ b/xen/lib/arm/Makefile
@@ -0,0 +1 @@
+obj-y +=3D io.o
diff --git a/xen/lib/arm/io.c b/xen/lib/arm/io.c
new file mode 100644
index 0000000000..fbce204775
--- /dev/null
+++ b/xen/lib/arm/io.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/io.h>
+#include <xen/lib/io.h>
+
+/*
+ * These functions use 32-bit (uint32_t) IO operations rather than 64-bit =
for
+ * the following reasons:
+ *
+ * 1. ARM32/ARM64 compatibility: On ARM32, there is no atomic 64-bit IO ac=
cessor
+ *    (readq_relaxed). Only readq_relaxed_non_atomic() exists, which inter=
nally
+ *    performs two separate 32-bit reads. Using it would not provide any
+ *    performance benefit and could introduce ordering issues.
+ *
+ * 2. Hardware compatibility: Many IO devices only support 32-bit aligned =
accesses.
+ *    64-bit accesses might not be supported or could cause bus errors on =
some
+ *    hardware.
+ *
+ * 3. Simplicity: Using 32-bit operations keeps the code simple, maintaina=
ble,
+ *    and consistent across both ARM32 and ARM64 architectures without
+ *    architecture-specific conditionals.
+ *
+ * The performance difference between 32-bit and 64-bit operations in this
+ * context is negligible compared to the IO access latency itself.
+ */
+
+/*
+ * memcpy_fromio - Copy data from IO memory space to "real" memory space.
+ * @to: Where to copy to
+ * @from: Where to copy from
+ * @count: The size of the area.
+ */
+void __memcpy_fromio(void *to, const volatile void __iomem *from,
+                     size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(uint8_t *)to =3D readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(uint32_t *)to =3D readl_relaxed(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * memcpy_toio - Copy data from "real" memory space to IO memory space.
+ * @to: Where to copy to
+ * @from: Where to copy from
+ * @count: The size of the area.
+ */
+void __memcpy_toio(volatile void __iomem *to, const void *from,
+                   size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb_relaxed(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel_relaxed(*(const uint32_t *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb_relaxed(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
--=20
2.34.1

