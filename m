Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0163A9390B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 17:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959178.1351626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5nD8-0006XD-5l; Fri, 18 Apr 2025 15:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959178.1351626; Fri, 18 Apr 2025 15:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5nD8-0006Uz-2Y; Fri, 18 Apr 2025 15:00:58 +0000
Received: by outflank-mailman (input) for mailman id 959178;
 Fri, 18 Apr 2025 15:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtVq=XE=parrylabs.com=mark.brown@srs-se1.protection.inumbo.net>)
 id 1u5nD6-0006Ur-TZ
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 15:00:57 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on062c.outbound.protection.office365.us
 [2001:489a:2202:d::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf21c5d-1c65-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 17:00:53 +0200 (CEST)
Received: from PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18a::12)
 by BNAP110MB2078.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 18 Apr
 2025 15:00:47 +0000
Received: from PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d6e5:6077:3859:61b6]) by PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d6e5:6077:3859:61b6%4]) with mapi id 15.20.8511.031; Fri, 18 Apr 2025
 15:00:47 +0000
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
X-Inumbo-ID: eaf21c5d-1c65-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=PgCT1upgvwZztehVotSTrSbp/Iif2e0QGCiwL7m2h2NviGy6pGBAbRproslI9tM673ahJPpzUoToc08hO7bhfAjns1V/J5JNPs+YUznoFc1R1VepjtHDN6NId/fsj/IjX3244bwwRkJY8WJzR6JlBywRriS5XrTlqukBWvZ/UI8pWCWXZTdbMlabAQ9PS0NXU+hVGaADTkQre3kLJ/+PZq+1IO2j8HADJjyhtCtp54zu//0vWss7Gz4ic8WRmnkO3xnJCQgMjjFbl1AwCDJiyb5nPROkfRvsaLke2nuazNCqjol/jbeR9MzbLX5ppWQ+2Q+C/YAF56/iSzCFD962Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf8OszXT8A3X57jpuoz3UplmiwEqQfdp89oGyGVeOzU=;
 b=TpUAVgrWVXj0pS5+/iBRm2bPCAJea1Ur8GKf4d+x+6utlzLSfUMyWd1SH6Q2FY0EHeXBCKWjmmxe7v4Odz5hJWZwBuANRJMlNoDRpCyAWsEYfjOKr1s9KV9Iuq5tKIhTGj1B2mA6bN8Qcs7ckukdcvCfR4zVXapoi05n8/pRFekE8ZskXZk7FtXgAFAGcwfbXa9SWkPRNr0uwX9kFb2lt57IZ104AU7LnBo6RGqPWFxkum2O0yb7KvaKMMN0EHoQnDRYM39zfxFWocRliKnGAFszh7rtijm+HkTMGxNmHIH4ljw1Msri+xNpO7yGk5YvdElgT8w6qOZuDzBQUzqh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=parrylabs.com; dmarc=pass action=none
 header.from=parrylabs.com; dkim=pass header.d=parrylabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Parrylabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf8OszXT8A3X57jpuoz3UplmiwEqQfdp89oGyGVeOzU=;
 b=NI10NcuHKVuKKxhsQjvTbSCC+ZWBEuewRk1g/IFYeHNjqveHWmuJiBcyQENBCQRtKbLbOvsN6CR99XsVwq1oTYP+EZoTHXk5LN3a1KmfQkK1Ah6ehZn2LxpSGyXjpNkXjCJ3fFpKm9mhOw+q1Tu6yVJzSIP9O6rqSuzrP1Xn2aEIjspvc+bvlXyqoqSv0U96TpVcgHT6OhG9t75z7YZUulWhOCvqSQKRq1q5amXRusYF/Vf294I4nHUzSB54ZTl1yiHHLOtJNkusH/tYkJT32t9W9c0jVQkUsb4LhmzzsLTjpgvSanqei3JCH/XARnosq4x/NP4XtWsAzm+Ctsb6xw==
From: Mark Brown <mark.brown@parrylabs.com>
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Topic: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Index: AQHbsB4b1gFRsGOJMEuup4UvLrfEMbOpavlA
Date: Fri, 18 Apr 2025 15:00:47 +0000
Message-ID:
 <PH1P110MB14413B4A22675F4C1FD4DC109CBFA@PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
In-Reply-To: <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=parrylabs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1441:EE_|BNAP110MB2078:EE_
x-ms-office365-filtering-correlation-id: d433cae7-6d0a-46e0-ecad-08dd7e89ccf2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?N1XF4cJNVcnkr99fXxNUjeLjHYBDm+QH987fy9u0YzgRDrcPXBTVEKtp16x/?=
 =?us-ascii?Q?qAfjXMrkJNhw5SHv1MG2/V0JX0rfxr6Qw1EFF2uNYjhbJALTFcO/Pqie3MpQ?=
 =?us-ascii?Q?7BtX70gs0HLh15K0FxomhXiBYquho3Rjw8FW2gZcoZWfH7qz3XENSGRQQTcB?=
 =?us-ascii?Q?4Py71lsLmr7T+yUvy5bQRDck0O3KA6tivTjc409nU/z6khPsPsqZJCxMZhP5?=
 =?us-ascii?Q?mRTjI3kTvVNXFX3KfPCMTZxGlt3EhEsCJytwKd3K0KRlnDpmNKZV/9RXqEE5?=
 =?us-ascii?Q?C7O68+jltEiRwGxvzoLnPoUWVmmSU1FsVhLx9OmH442auc4bIeZBNwN4Szdu?=
 =?us-ascii?Q?0ikfisv+Z46OuPtSp7WwJ2cnf5vlv8koddff5+fRD0VFop7X65KSDh3T8Tk7?=
 =?us-ascii?Q?gWLrW3NTk9ea0vz85vaPCnc8aOGZYoScfiZB6ggUM/kA9itpvXqFjEEF3JFj?=
 =?us-ascii?Q?1ZfZpBlvoz6deS/uyJTVSOhoPSmOV5X2OkSyOg/tJSWhujp52vBMA6IRvC69?=
 =?us-ascii?Q?Hshh7YjY+LdKXxczdXl/ubgU0JhWRjodlyiUszFcOEPku6uUm5lryxxpDljn?=
 =?us-ascii?Q?mM5JxuAOzwjkf5V+G1L9UrBQ0zrHeMyCX4p08O3TLdtfUFaDfag2njbAivVd?=
 =?us-ascii?Q?H+kVHKl8Ud6f3mVhHJtE/r4D5zOAs+h0WvUfc2iE5yHgXkYteB/8sv0KhpAY?=
 =?us-ascii?Q?Qp4YgsXDMr/Lxr/fzpJBDxQVDNobSXZGdaBzhr/HEsXe36ZbT5+5MPguG9CL?=
 =?us-ascii?Q?4q57gg1X0zSrwqQRPRBk0Ndz4pIS50XD2dCUqgege3trpPbnY0kLLZwpb5nr?=
 =?us-ascii?Q?L+sUy6p/+RzB+OGLH7jcV3X1rQqX6E+CSpJbIX5RDUqsjrgnpKNr0Qj3k67H?=
 =?us-ascii?Q?ElZqEqUIGbzlw0bMdJcpj3Q349qlchfT40X3wALoOaNNUiw3opPJ4c92Hrku?=
 =?us-ascii?Q?9s2Y65xp3bVk1FZx0+yFPV/LW7hwS6X5IjjFepxkozF/SZy+B5MO8wGtJtRV?=
 =?us-ascii?Q?Au3yffuonYCShxKJYAAzKsfhdJTmbvHBLF6t3VnmBTE5Dm6eExOMzctChJrj?=
 =?us-ascii?Q?BTcLDLc4ZKYh208I0RRyxAVM3LrXU6D5gFZh48Sg3UDoWBO5oIuKXXi3DbvK?=
 =?us-ascii?Q?yz4MmAKjYwTtfOKukQ6kik9W9TIRSzmrhcsJi0mhO+XBH07qzH1eEGRSCy0w?=
 =?us-ascii?Q?fb43H9bV2IntwDsPv0S/odRWjboHFitA7q9iuCw/QuJIeUDzaB81cuHuG2RB?=
 =?us-ascii?Q?vp8YrCjIZlsobTMbA/cokXXqMXSTGM17O4MU1wsB1qggWYRSOjTzT6ecKZ5B?=
 =?us-ascii?Q?uHvAIo2swOdICw3KU92r6ASfVG0GqXawJjNhEzGcf2rIkqReX5da6GdcWEBi?=
 =?us-ascii?Q?3Y+ZPMF0tbwmQEpZunchyPbll4+IDk1hO5U6et9wvlJ1jUXRky7uMWanNY29?=
 =?us-ascii?Q?NhRRyBQzitL9adjOaGHEIxQtFrs+5qEw4DlguXfcv2U9nEUItIvzVg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OUXl06TzO4k5UjwP7ocL6CELRR+EdUX8uFiFE6tVsWH8vs+avgktOf+bUCbF?=
 =?us-ascii?Q?5XseV8GjdwyrXbNsWN7zq19S/yaF1O23gu/4aXHgnoSfabAXponimaKHUN38?=
 =?us-ascii?Q?tBxQCw9tOlIIbUefmEixakg2Nq/KPHVkCaTu45sgDGVAm4Yb78EivRnOYZrs?=
 =?us-ascii?Q?uvv2/0bYuTebDRNC2F+gD4/VTZw2bHSTgTYpzzOHFbbKDJ6BZAnpYlfUSLKb?=
 =?us-ascii?Q?S8jyXJ/35tF5LUUxix+BPn1IA4rDBpvAv8HWf81+fSKvNlrhsJ/oZ3HK5qFG?=
 =?us-ascii?Q?KrCr0YTtrzJSou7cZVW5a72Zv2sHeWdprczp+O8zmTJRyyBrd+ECI6fBzsa8?=
 =?us-ascii?Q?yXwmUcIGd9pkMK1INA8VZRS10hkqcBOs5b6DDC2xgD6NMiJJt/Lrz+WMmVp0?=
 =?us-ascii?Q?N+zIYyBnUgQMHQRsAhGjUfT0DZA08M4VCrV0+jL94ufX5W4HQPOq33IMB0Ef?=
 =?us-ascii?Q?16Q/QJyUNYSiuyIoivWJiLSl6WBwmYeFH8h0bVKXcXanxIKFLnNG2J/gIl6M?=
 =?us-ascii?Q?6JcvIyEFuwPdt6fQV7UayViRaCRiIrPTyYcN7Sbj0EdYD//A5IkOnDNI+N3y?=
 =?us-ascii?Q?hBVPGVjf/V/uIYthTQx807mqWFKwF9/VFpfhbnKXj0W/g+ow/WYqYYI1n64Q?=
 =?us-ascii?Q?WNYTJfoHlkZmrjA0bjSvk2QCfS7Qr9TY/TPiX/y8QmK1ryAst6M5CYVYuxjP?=
 =?us-ascii?Q?lBUquksc4LVe0g+euLQ+b71K1SL2Krlsgh11hadUXuIFk31LumlgrmcxuvsD?=
 =?us-ascii?Q?wJyumACz2d5TNwzpjxTQBd8ln6dBLVJ8oscsrNLqfTs4c7idXJIN662XDDh5?=
 =?us-ascii?Q?dBh9kn2L1NwUkgUak/VaIBVIJtMryfAxcuJ0Bmixg6S/+RtXz/ApVjM8gWFI?=
 =?us-ascii?Q?uP/uaHCAKo7dfs+dQkXZLiYDcMgZNHSXpNVMVeA6gWm0D4aue1hVqg3Yk5Ch?=
 =?us-ascii?Q?DdDIcx2DaderUyEOpzJH/kgVrJJ4XE0NJ3J8epOK9iaUVzJP32jRsEjz8S32?=
 =?us-ascii?Q?qRHIDo64d6YFJ4pDDpo3mLZQInc0QoOjiAT0bC8TvESAhtQdRFMoA5e48Hbh?=
 =?us-ascii?Q?3It3+ORZNXUOJcCipqayPnsLbH6y/2Bz1cdC7+7GiVCN2Y1xHLA1c1FJ7nEB?=
 =?us-ascii?Q?5V4eWwgv6b9dGorLYYmCIsGAKxSQPu57812ppl+r/k4Gs6XGisxSXaETnL/O?=
 =?us-ascii?Q?PGAzvgpNGNTjcl3hugNaX0ZuiZt/VuTmcRiXt74pwlpm5POHA+kmh/8XbCI9?=
 =?us-ascii?Q?g/lt1f8Vz0HLxrAosikKLqIq2OEJvbXwgl9nz9ju4JijeHAlzqxZRWtHuCz/?=
 =?us-ascii?Q?b0r6j8EgT4a9sTirbEm8k05EWTvcdvFPcFJ2FLBDVNjKP0jcu2tnPgOeWfLi?=
 =?us-ascii?Q?gqOmnGxcOkBQJjk//wqPdilLxwhnto99dWcjd3OkPQZm0GncwPuo2ZC9Xx9G?=
 =?us-ascii?Q?4RXlGAaxB7j1qc06M1N8niHmjANuM9D87sHXPmkmCu2qARjWvZdZ1mhwHxnO?=
 =?us-ascii?Q?GIcZUIh4lUcQqr+kTvxMtDNMczTtsMr97vo0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Parrylabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1441.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d433cae7-6d0a-46e0-ecad-08dd7e89ccf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 15:00:47.0157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57f16235-57e2-4345-a033-c212a7e9d993
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2078

Hello all,
This is my first post to xen-devel. Since I'm new, let me give a brief intr=
o about "Why?"

1. I am interested in easing the ongoing burden of repeatedly obtaining saf=
ety
certification for Xen for eventual use in high assurance operational *syste=
ms*.
Call this an evergreen certification effort.

2. When I read the ISO26262 and avionics cert standards, I note that there =
is a system
architecture (it has its own "System V" lifecycle) that encompasses a set-o=
f-n
hardware items (e.g. fabricated SoC analysis and also FPGA soft IP developm=
ent) and
also a set-of-m software items (e.g., bootloader, hypervisor, guest OSes, a=
pps, containers,
etc.). For high assurance, we must evaluate the entire system and not just =
some of its items.

3. Also from the standards the govern the lifecycle and processes for devel=
oping
high assurance systems, hardware, and software, maintaining (automated) bid=
irectional
requirements identifier traceability from safety requirements "down" (i.e.,=
 through
levels of requirements decomposition, into *-architecture level designs, in=
to software
unit designs, into software unit code, and into software verification tests=
 at the unit,
library, module / architecture, and system level. From my perspective, ther=
e's a lot
riding on these requirements IDs. I would guess that many in this community
would feel concerned about dumping many (hundreds?) of requirements IDs
directly into the Xen code base, even if these were located within comments=
.

4. Because of 1, 2, and 3 (above), when I look to understand Xen requiremen=
ts sources,
my first pass is to remember that Xen is just one software item, and it wil=
l need to accept
integration requirements flowing in from the system (i.e., via KConfig sett=
ings and Device
Tree / SDT language) and also from the core types that it relies upon (i.e.=
, scoped down
to the operationally-deployed core types including Arm Cortex-R52 during bo=
ot,
but extending to co-processors it uses and then to IO devices that are used=
, etc.)
Finally, sometimes other software items flow requirements into Xen, e.g., w=
hen
Linux  paravirtualization or virtio implementations are scoped-in.

In summary, finding an agreeable way to embed requirements IDs into the Xen
source code seems essential to me, so that we can achieve evergreen high
assurance certifications for Xen.

Proposal 1: Rather than start by adding many requirements IDs into comments=
,
we might instead start out by using a less-impactful approach.
I propose that we could hand-pick some C data types (CDTs) that were known =
to be
critically important to Xen's high assurance, and simply (re)name these CDT=
s,
for example, structs and unions.

This proposal is to adopt a naming convention for handpicked safety-relevan=
t
CDTs, starting with the first two identified below.

For example in this patch, e.g. in xen/arch/arm/include/asm/arm32/mpu.h,
two CDT structs convey the bitfield requirements from the new MPU co-proces=
sors.
Specifically, in the typedefs "prbar_t" and "prlar_t" no struct tag (name) =
is used
for either of the bitfield struct. I propose adding struct tag names to bot=
h, and
then leveraging these struct tag names as requirements IDs.

Suggested Naming Convention:
 (a) E.g., For prbar_t, tag its bitfield struct with the name "PRBAR_BF"
 (b) E.g., For prlar_t, tag its bitfied struct with the name "PRLAR_BF"
 (c) Proposed bitfield struct naming convention: <register>_BF
 (d) Going forward, for bitfield structs that flow-in safety-relevant
  requirements from the core's Technical Reference Manual (TRM)
  and registers, to use the suffix "_BF" to identify these structs. And
  to faithfully reuse the TRM's name for the register.  (application to str=
ucts)
(e) Going forward, for unions that wrap "_BF" structs, to name any
  union member name corresponding to the "_BF" as "bf" and any
  union member name corresponding to the whole as "whole".
  (application to unions that immediately wrap "_BF" structs)

The benefits of systematically following these naming conventions will be:
1) Even simple tools like grep -R can find all "_BF" requirements IDs that =
flow from
    hardware registers that have been handpicked due to their safety-releva=
nce.
2) Any CDT-parsing tool such as Doxygen, etc., can automatically find and t=
race
   all usages of "_BF" structs at several levels
   (a) Dependent structs such as "pr_t" can be automatically traced "up" to
   their "_BF" ancestor CDTs.
   (b) C function argument CDTs can be automatically traced up to any
   ancestor "_BF" CDTs, with the implication that the function may be safet=
y-relevant
   because it accesses one or more "_BF" CDTs.
   (c) Simple pointer-to-CDT usages should not obscure any facts that
   either the ".bf.*" (accessing a safety-relevant bitfield by name) or the
  ".whole" (accessing the entire register contents by value) were accessed.
3) This convention will naturally allow the new "_BF" requirements IDs
to flow into all future use / access of these safety-relevant registers, in=
cluding
future verification tests.
4) Also, it will naturally allow the new "<register>_BF" requirements IDs
to be traced "up" into the TRM and automatically de-reference the semantics
and usage and safety-relevant notes about the bitfield, the register, and t=
he
larger context of use for that register (e.g., at which instruction will th=
e PMU's
enforcement of "HPRBAR10" / "p15,4,c6,c13,0" be activated?)
5) The xen-devel community may find that using this naming convention
provides an easier on-ramp to "start seeing safety and high assurance."
This is because engineers who read any future C source code,
or review any future patch series will see that specific lines in that C so=
urce code
are indelibly tattooed when they refer to a safety-relevant register. Wheth=
er any
line of code access the "_BF" register in part or in whole, that will becom=
e explicitly visible.
The goal is to raise community awareness by flagging access / use.

Thank you!

Sincerely,
--mark

-----Original Message-----
From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Julie=
n Grall
Sent: Thursday, April 17, 2025 11:55 PM
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>; xen-devel@lists.xenproje=
ct.org
Cc: Stefano Stabellini <sstabellini@kernel.org>; Bertrand Marquis <bertrand=
.marquis@arm.com>; Michal Orzel <michal.orzel@amd.com>; Volodymyr Babchuk <=
Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions

[You don't often get email from julien@xen.org. Learn why this is important=
 at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


Hi Ayan,

On 18/04/2025 00:55, Ayan Kumar Halder wrote:
> Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
> The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3
> HPRBAR<n>,
> E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.
>
> Introduce pr_t typedef which is a structure having the prbar and prlar
> members, each being structured as the registers of the AArch32-V8R archit=
ecture.
> This is the arm32 equivalent of
> "arm/mpu: Introduce MPU memory region map structure".
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> This patch should be applied after
> "[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to
> enable compilation for AArch32.
>
>   xen/arch/arm/include/asm/arm32/mpu.h  |  59 +++++++++++
>   xen/arch/arm/include/asm/mpu.h        |   4 +
>   xen/arch/arm/include/asm/mpu/cpregs.h | 135 ++++++++++++++++++++++++++
>   3 files changed, 198 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
>
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h
> b/xen/arch/arm/include/asm/arm32/mpu.h
> new file mode 100644
> index 0000000000..4aabd93479
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
> + */
> +
> +#ifndef __ARM_ARM32_MPU_H
> +#define __ARM_ARM32_MPU_H
> +
> +#define XN_EL2_ENABLED  0x1

I understand the define is introduced in Luca's patch, but this a bit non-d=
escriptive... Can we find a better name? Maybe by adding the name of the re=
gister and some documentation?

> +
> +#ifndef __ASSEMBLY__
> +
> +/* Hypervisor Protection Region Base Address Register */ typedef
> +union {
> +    struct {
> +        unsigned int xn:1;       /* Execute-Never */
> +        unsigned int ap:2;       /* Acess Permission */
> +        unsigned int sh:2;       /* Sharebility */
> +        unsigned int res0:1;     /* Reserved as 0 */
> +        unsigned int base:26;    /* Base Address */
> +    } reg;
> +    uint32_t bits;
> +} prbar_t;
> +
> +/* Hypervisor Protection Region Limit Address Register */ typedef
> +union {
> +    struct {
> +        unsigned int en:1;     /* Region enable */
> +        unsigned int ai:3;     /* Memory Attribute Index */
> +        /*
> +         * There is no actual ns bit in hardware. It is used here for
> +         * compatibility with Armr64 code. Thus, we are reusing a res0 b=
it for ns.

typo: Arm64.

> +         */

Hmmmm, this would mean someone may mistakenly set the bit to 0 by mistake. =
If the field is always meant to be 0 on arm64, then I would consider to nam=
e is res0 on arm64 with an explanation.

This would make clear the bit is not supposed to have a value other than 0.

> +        unsigned int ns:1;     /* Reserved 0 by hardware */
> +        unsigned int res0:1;   /* Reserved 0 by hardware */
> +        unsigned int limit:26;  /* Limit Address */

NIT: Can we align the comments?

> +    } reg;
> +    uint32_t bits;
> +} prlar_t;
> +
> +/* Protection Region */
> +typedef struct {
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    uint64_t p2m_type;          /* Used to store p2m types. */
> +} pr_t;

This looks to be common with arm64. If so, I would prefer if the structure =
is in a common header.

> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ARM_ARM32_MPU_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mpu.h
> b/xen/arch/arm/include/asm/mpu.h index 77d0566f97..67127149c0 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -8,8 +8,12 @@
>
>   #if defined(CONFIG_ARM_64)
>   # include <asm/arm64/mpu.h>
> +#elif defined(CONFIG_ARM_32)
> +# include <asm/arm32/mpu.h>
>   #endif
>
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>   #define MPU_REGION_SHIFT  6
>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>   #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h
> b/xen/arch/arm/include/asm/mpu/cpregs.h
> index d5cd0e04d5..7cf52aa09a 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,18 +6,153 @@
>   /* CP15 CR0: MPU Type Register */
>   #define HMPUIR          p15,4,c0,c0,4
>
> +/* CP15 CR6: Protection Region Enable Register */
> +#define HPRENR          p15,4,c6,c1,1
> +
>   /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register *=
/
>   #define HPRSELR         p15,4,c6,c2,1
>   #define HPRBAR          p15,4,c6,c3,0
>   #define HPRLAR          p15,4,c6,c8,1
>
> +/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
> +#define HPRBAR0         p15,4,c6,c8,0
> +#define HPRLAR0         p15,4,c6,c8,1
> +#define HPRBAR1         p15,4,c6,c8,4
> +#define HPRLAR1         p15,4,c6,c8,5
> +#define HPRBAR2         p15,4,c6,c9,0
> +#define HPRLAR2         p15,4,c6,c9,1
> +#define HPRBAR3         p15,4,c6,c9,4
> +#define HPRLAR3         p15,4,c6,c9,5
> +#define HPRBAR4         p15,4,c6,c10,0
> +#define HPRLAR4         p15,4,c6,c10,1
> +#define HPRBAR5         p15,4,c6,c10,4
> +#define HPRLAR5         p15,4,c6,c10,5
> +#define HPRBAR6         p15,4,c6,c11,0
> +#define HPRLAR6         p15,4,c6,c11,1
> +#define HPRBAR7         p15,4,c6,c11,4
> +#define HPRLAR7         p15,4,c6,c11,5
> +#define HPRBAR8         p15,4,c6,c12,0
> +#define HPRLAR8         p15,4,c6,c12,1
> +#define HPRBAR9         p15,4,c6,c12,4
> +#define HPRLAR9         p15,4,c6,c12,5
> +#define HPRBAR10        p15,4,c6,c13,0
> +#define HPRLAR10        p15,4,c6,c13,1
> +#define HPRBAR11        p15,4,c6,c13,4
> +#define HPRLAR11        p15,4,c6,c13,5
> +#define HPRBAR12        p15,4,c6,c14,0
> +#define HPRLAR12        p15,4,c6,c14,1
> +#define HPRBAR13        p15,4,c6,c14,4
> +#define HPRLAR13        p15,4,c6,c14,5
> +#define HPRBAR14        p15,4,c6,c15,0
> +#define HPRLAR14        p15,4,c6,c15,1
> +#define HPRBAR15        p15,4,c6,c15,4
> +#define HPRLAR15        p15,4,c6,c15,5
> +#define HPRBAR16        p15,5,c6,c8,0
> +#define HPRLAR16        p15,5,c6,c8,1
> +#define HPRBAR17        p15,5,c6,c8,4
> +#define HPRLAR17        p15,5,c6,c8,5
> +#define HPRBAR18        p15,5,c6,c9,0
> +#define HPRLAR18        p15,5,c6,c9,1
> +#define HPRBAR19        p15,5,c6,c9,4
> +#define HPRLAR19        p15,5,c6,c9,5
> +#define HPRBAR20        p15,5,c6,c10,0
> +#define HPRLAR20        p15,5,c6,c10,1
> +#define HPRBAR21        p15,5,c6,c10,4
> +#define HPRLAR21        p15,5,c6,c10,5
> +#define HPRBAR22        p15,5,c6,c11,0
> +#define HPRLAR22        p15,5,c6,c11,1
> +#define HPRBAR23        p15,5,c6,c11,4
> +#define HPRLAR23        p15,5,c6,c11,5
> +#define HPRBAR24        p15,5,c6,c12,0
> +#define HPRLAR24        p15,5,c6,c12,1
> +#define HPRBAR25        p15,5,c6,c12,4
> +#define HPRLAR25        p15,5,c6,c12,5
> +#define HPRBAR26        p15,5,c6,c13,0
> +#define HPRLAR26        p15,5,c6,c13,1
> +#define HPRBAR27        p15,5,c6,c13,4
> +#define HPRLAR27        p15,5,c6,c13,5
> +#define HPRBAR28        p15,5,c6,c14,0
> +#define HPRLAR28        p15,5,c6,c14,1
> +#define HPRBAR29        p15,5,c6,c14,4
> +#define HPRLAR29        p15,5,c6,c14,5
> +#define HPRBAR30        p15,5,c6,c15,0
> +#define HPRLAR30        p15,5,c6,c15,1
> +#define HPRBAR31        p15,5,c6,c15,4
> +#define HPRLAR31        p15,5,c6,c15,5

NIT: Is there any way we could generate the values using macros?

> +
>   /* Aliases of AArch64 names for use in common code */
>   #ifdef CONFIG_ARM_32
>   /* Alphabetically... */
>   #define MPUIR_EL2       HMPUIR
>   #define PRBAR_EL2       HPRBAR
> +#define PRBAR0_EL2      HPRBAR0

AFAIU, the alias will be mainly used in the macro generate the switch. Rath=
er than open-coding all the PR*AR_EL2, can we provide two macros PR{B, L}AR=
_N that will be implemented as HPR{B,L}AR##n for arm32 and PR{B,L}AR##n for=
 arm64?

>   #define PRSELR_EL2      HPRSELR
> +
>   #endif /* CONFIG_ARM_32 */
>
>   #endif /* __ARM_MPU_CPREGS_H */

Cheers,

--
Julien Grall


________________________________
The information contained in this e-mail and any attachments from Parry Lab=
s may contain confidential and/or proprietary information, and is intended =
only for the named recipient to whom it was originally addressed. If you ar=
e not the intended recipient, any disclosure, distribution, or copying of t=
his e-mail or its attachments is strictly prohibited.   If you have receive=
d this e-mail in error, please notify the sender immediately by return e-ma=
il and permanently delete the e-mail and any attachments.

