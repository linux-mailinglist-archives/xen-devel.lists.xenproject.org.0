Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F1D175C3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201207.1516917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa25-00047r-SP; Tue, 13 Jan 2026 08:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201207.1516917; Tue, 13 Jan 2026 08:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa25-00045h-MK; Tue, 13 Jan 2026 08:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1201207;
 Tue, 13 Jan 2026 08:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCXa=7S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vfa24-0003C7-4B
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:45:44 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e547a47-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:45:42 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8709.eurprd03.prod.outlook.com
 (2603:10a6:150:93::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 08:45:36 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:45:36 +0000
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
X-Inumbo-ID: 3e547a47-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/mxvbTpXmvssP/xamsf6nFj8YFrKjM/YGdvy5MuNF6oqO4nyn6CkjPKBECdwusCdcO3AoL202JXaDSyaB7R17cm7h+v++waIrAiiBZyKKTp+LxJiTz2Zfmp0i4+SSoGk6AJJ8GFpPZH9YwIAI9vOJJ5MWaM1JhkwGvPkAQhWqNqGKSUFqxo7alGdVcX/fftIFWKnzGlW+WyyXg+XG+CcbTwP0XaruJBSK1T151mr+erGtCBqjA/CIcFU6KDuwEkZQ6sWHN/+ZvJyMA7JYAYS9sgjjq2W2R+oOrpN6ZpI8Q/WjCfeh4PKxuSuMXUFfZtsD6bo9Lo8c34tvvFXBjL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvckS9ldcLzbpoTF9qv6Ooqf4GkybykL0RagTPbQCLg=;
 b=WaWnDoMZYm+QPNgMNHlXzW7+KE8Q/we/zHlsLAgZYjIRRTIUBHMoLFcHOxMscRlsyLPeojFL3omZZeC6aGdB6NiCO1aLOAHEixkt3g613fFFtA05Xspnyy39Vmd1/W55s64gK7iE1rb/ymzi8TPHvjF6PMDPNokE8dymXCBS/a8RSg2cr9ZVVw9AEh3c+0lwIjOPf3UhESkmL7uM2r3ERxZl9+vDaJS9KQgQBYg5GVBH9kMm8UqJod/fpucRQIoN8N3OqIGwX49aZRMdSM0Ut3QJzaIDCHWi9ss/4x588lMSOmZMgENTZPAO024cSfS90Z3olMhew/6VrtQC2vgB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvckS9ldcLzbpoTF9qv6Ooqf4GkybykL0RagTPbQCLg=;
 b=jdwAqGXriNZPP4m+j+oLz8TYsGij2ay7vKex8xHUbceTDNtR5J+lXwC1Hvtg9e1Fo+MZhAaEqhs3w/OLSo1TLT1kqyW7cJIdw1DMP6KoxeACeClmuRw+Gl8UDqar1CrX9qTrwZ8YHfGunuUQ/xBo08V7+bgclsQzHeBCyDRqDto/lYMURtYoDs3byGaStM8l5dliSRfjQHOusrNXvDO+4GEibRZSav94duPl/iTHd2LcTKACxmYx6qh9QiksmsLcnsyeMM0gbVTgutB9d1bdVVymwqcqAOFnyZVHtZT9cz4xOiWhFYzp8LKowq5Cv5t0MK5AtCdP8ekSiTG0aHbdZg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v5 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHchGj873UPBMyph02N0fqNmGIWEw==
Date: Tue, 13 Jan 2026 08:45:35 +0000
Message-ID:
 <54a015e0e47ea311471bad7f13fbf21e14389ef3.1768293759.git.mykyta_poturai@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8709:EE_
x-ms-office365-filtering-correlation-id: 37387cb5-5ce1-4d97-c16d-08de52801f37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0UZfJUcgAzywTLUphRNrJEDfqBwdpK4V4jx8HWtYdXB5ygAYgBPF/mHn6d?=
 =?iso-8859-1?Q?lnFPDNKXYcAbpPoZRjevHcz+j9mqUask2rVzprZBKrxD0NNdbS72FLcCmu?=
 =?iso-8859-1?Q?BiCtAN5SsGJMbsxiKFBhy8BXmmAe93UbMPZ52NKQEMu9Q3drVnXUi3wn4l?=
 =?iso-8859-1?Q?2PPwMW3OEKeRFokDqtHAsaTKRUGuF1T4ToxaasMqEVmoIzQerHo90zfV5i?=
 =?iso-8859-1?Q?6KTcpOiqYUTJW5+Q8Hy6knbKX28sgoxIEOR8vHcx3q0Hw1XN/Ay4F8uqZn?=
 =?iso-8859-1?Q?Ja3e3NimFYotMhJAPwIV/bYKAcECXohdGbqvOOcDqDfdngXk5nARLa2y5T?=
 =?iso-8859-1?Q?P/xaId2Lf5leMeQYr52OXxRnbAhVuL4tWdinIW5yxmS/8JRrGd6J6RlP/m?=
 =?iso-8859-1?Q?SFT6NZVdpY/Mz5Iz80BD8Mi1eSkqXe7ET429tXbxuE+4peJd74SEFH/g6I?=
 =?iso-8859-1?Q?4zH0WI7KFeYI4u8aRdjQH4Yumx9UD82TBMjAD57c9SYwTkJpUSyWcKiQ+l?=
 =?iso-8859-1?Q?dV0Zh5GNY7Yo3Zw4sXSkCbd79XZdO0nq8wVl6bDfKJgpIZuBVsJ5EIoMSk?=
 =?iso-8859-1?Q?GtMWhsV6g3YuG04QFwDTWiPCG4HLF83oG1NsiqcYiJz0cFP0kJX3daNFUf?=
 =?iso-8859-1?Q?wyAwp4rAEyqGbkBJO+vhJmT+CtPfQAvdBIDbJVuKHIHhv1Ncm/VeSKwM+8?=
 =?iso-8859-1?Q?vs9rCz5UFYp7sPXYPiemIGyEysD5DZLg9m+Vl5k7geSfPXQT3t/p6yr9Ev?=
 =?iso-8859-1?Q?T3B81KDzOXPKAeIY2KobvNxE/rTGWryrrFGpkuw304oS57KX+lLq051wDK?=
 =?iso-8859-1?Q?wECuQ0qHHQyoraH8yaLtgecunqtqJDHtdKA63f5R50pKe9Bud1qMs0+jSI?=
 =?iso-8859-1?Q?lKSqTbN5uQ6P+rxdBKjTOn+41NYOn9a8dsp/CKuyZWSMCfTHu3TiMdQqwm?=
 =?iso-8859-1?Q?TO5dWPzyw+APi/YteR8DgrfcVmSQLosZbtYAYXeYVQdzUVEsT9ze5sIXdA?=
 =?iso-8859-1?Q?XGHD5f8MbRHcFFMOi4zbsdzqYG5pE4GvA18UJ4ViBKnK5DyDXdrYxLqBzn?=
 =?iso-8859-1?Q?W8GHaSPTXccmcXMx7pYvqlHQ8Q1XTPx6PfAMZEP4rP70p4vFh/pNlJckx2?=
 =?iso-8859-1?Q?2BzXfx7OMbi1IENINp+bKIZWnxoFK9zu0KPVBqf59CFhuVWi+WRaM9TNUP?=
 =?iso-8859-1?Q?Mdb7viZRRdTlYn4nts2XDv2U7eI1Ujw7k4C5bJvgeATfl7OPt9Wsi+BR5+?=
 =?iso-8859-1?Q?5x5pZkqKDMkNx7ZqWElGNAp08R3ej17LG8QSzgagkNb5H2QeeS2n2/qUfz?=
 =?iso-8859-1?Q?WCC/nX42QRwQqwqCMYxxJ5vKG/HtMyOJI8i3ao7t9sc4Uw6iUQJ5oy4ZhU?=
 =?iso-8859-1?Q?yXtKcFuIeYeHiwQa6zFdD+oRbwq9xtlXgcC4Qnx1EX8XzvF8tVIio7OFY5?=
 =?iso-8859-1?Q?ee50x4e3LMbj0wGh+73B0TBUslMktLklePqflLOirzMnphomrN+pa4hmkM?=
 =?iso-8859-1?Q?kkQOBFc1umhRiTCtsrGP1DnTMwP9soaVV3U+hgi+nCrBtYTxb+uY3b89Wa?=
 =?iso-8859-1?Q?6e/7kc5XvpA65pcAfggUvj8/qRup?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+hwyT5IKQGVgEONCUUNB5CFiErum5Zk0pTJElJLX4OegAxeVvyJu698RFl?=
 =?iso-8859-1?Q?4AB4AmtwqMotnHC3wLbK36TfUCqFSqfHQuZ38h4F6qQgqFcbUaRMtkLx5M?=
 =?iso-8859-1?Q?nANR0bKmR4IHCW9WnmwlazT6+T8VFxbnmupGH8ibOC8B793vUa7Oh+pRv1?=
 =?iso-8859-1?Q?lUmiTh+OgWSr5NEVXvR00rLzwX89yXHwC9R1tiozPwsOZP2iNhok7CShUN?=
 =?iso-8859-1?Q?qwVx+dwo9RHd+bajKqyxgfkCMUczqK9D29ntdpZggRfHeKdL+jqh1TJ1Og?=
 =?iso-8859-1?Q?Xf8mTHZfAWfdfp07futGIeSWwCJJnIwd5zJBScI2HuMIfxe53IEV9LYf4A?=
 =?iso-8859-1?Q?TTxh2E+dyqpXxhlVKhEqn5SXZyiH67UXI4/LCYHj5dKaXW+D4T73nNPyXl?=
 =?iso-8859-1?Q?w3h2ksUf0q6MEGY7bUVEwL71XFpzpFEqakD7JFzWwTIr/S6k9YKG2Wc4qX?=
 =?iso-8859-1?Q?FKnSte2oGLeHpOlN32zC7h9tm6XpceKLfwibNAhiNP9o38uKivAGEoP3M+?=
 =?iso-8859-1?Q?rcHlKvwP2cOjsnb7QRgpncxDZVGWn194WnKHHXvTsHHuekSgxGc/fsfjtF?=
 =?iso-8859-1?Q?MOeZ4LKZVJzvzdHdD/7y0e22S54t1SFj0rVmkkW3Y2+9KSpWtx+XqeHnkI?=
 =?iso-8859-1?Q?N78hJtRrPsuP9ME6gZlGueLyoxKnGjkBHNIk8qhSJzDQ6+jPPJ48OahiHU?=
 =?iso-8859-1?Q?IOLBCKjS3tAlSBeKzUp5tNsKYk27eMTRtkzbuY8SibD2IhcYbhXHIf0d8z?=
 =?iso-8859-1?Q?qAvBvAHk38YLZqa3MsP/kdQ3QLsxfZCRytqc4CqJSuWH+9tWxQU+WwaySd?=
 =?iso-8859-1?Q?02FuHRtWDqqIlerqSKaLWRGv0ogAZcRJGToSwQLuy0W6ISSC+EuGmj8SfX?=
 =?iso-8859-1?Q?v1/4W4pGMn6kyn774n1vn2o2xQ7JWUHQDAcO913fJDw9i9BrvkNIo2MUFE?=
 =?iso-8859-1?Q?zKNruv5A8Bp5eJwipKfeI/tjlKUQ8v/AeQG3c0iXvSpb1YTB+x1bb4nSXM?=
 =?iso-8859-1?Q?i6OVkdTfDe8dOlFA1ldQoyVsiqmtTtt4AWPF55r9prvV9ZN1NuOD0fo+h2?=
 =?iso-8859-1?Q?iBE4jSoYGYTysOVwIg3HxsSBCTXPLh9aqhQfkLsKwWfwVeELCQaRMSxHdL?=
 =?iso-8859-1?Q?m3Yhhp0rFKemfINrtUArPBv4aet9AVwsXvqUD17m2KcVEwd7Ue6oazfUiB?=
 =?iso-8859-1?Q?g3ABQJt7pqHK+4gnSYnLKdmVCnC47+xjITLkUbNEEGgPmu0c2XYPWKHBkt?=
 =?iso-8859-1?Q?RbauFWRPeSpIRtQQS6dUOHTlecwdjhaVROFwQqXp5MZDfOhKi3rG+2y1mR?=
 =?iso-8859-1?Q?Cgth4Q+OvyGe6HKN/JUioKq7P/sSJTC24nYpvclFMSxvgmQtn/v0G0welN?=
 =?iso-8859-1?Q?vCS+hKN9IBy3Ued0LgnhcfWSPTDKHVUXrN0jY+3dNQPH1X/TJJj5AkXWI0?=
 =?iso-8859-1?Q?/EC+tZbZSIUBqrUMB6eRFpeLy7ytnzBSkWoz2r0Zxzwo4bK1BcM4+t1Bba?=
 =?iso-8859-1?Q?KLWGJXHuM65PjD7GO6sgdDffLHZqcIxIiw3uXO0dQdhMC2HTCmgUaMMmww?=
 =?iso-8859-1?Q?varlCckxSTiVM3U/abPy+7lutytQUcjUCY2dMvUGg0G8xO/n6muJMjixMi?=
 =?iso-8859-1?Q?Zo1pPltM7V+CioyDzGWrBuKmnBGK0pttMiC6BKZxD5t6rYYAVdbzRQQEI/?=
 =?iso-8859-1?Q?VpiMQdbuRNQ0fToUS94M+3h+rYxXWAzB2pp4nuzQHcCbKbn47QunFvzauv?=
 =?iso-8859-1?Q?Mg9Sne7ncIp2Zdx5nBXYrfsDzMTcdohzguJdw3TCweXZLmVaV9N3XDz8sy?=
 =?iso-8859-1?Q?C6P/QApG+jC5lhkKc+pDjvZuZ1VNdx8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37387cb5-5ce1-4d97-c16d-08de52801f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:45:35.4309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XN2qRR6qbPali77jrImMAOdCMj8KPfou41+bWhRqKlJSpC96ofElcJBY35+Q0ogbLOj8A/L17d3kFH3ez2YhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8709

Move XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} handlers to common code to
allow for enabling/disabling CPU cores in runtime on Arm64.

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings.  Also, hotplug is not supported if ITS, FFA, or
TEE is enabled, as they use non-static IRQ actions.

Create a Kconfig option CPU_HOTPLUG that reflects this
constraints. On X86 the option is enabled unconditionally.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

---
v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/Kconfig           |  1 +
 xen/arch/arm/smp.c             |  9 +++++++
 xen/arch/ppc/stubs.c           |  4 +++
 xen/arch/riscv/stubs.c         |  5 ++++
 xen/arch/x86/Kconfig           |  1 +
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 33 +++----------------------
 xen/arch/x86/sysctl.c          | 12 +++------
 xen/common/Kconfig             |  3 +++
 xen/common/smp.c               | 34 +++++++++++++++++++++++++
 xen/common/sysctl.c            | 45 ++++++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  4 +++
 12 files changed, 112 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299..5144e9c8d5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -7,6 +7,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select CPU_HOTPLUG if !TEE && !FFA && !HAS_ITS
 	select HAS_FAST_MULTIPLY
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
=20
diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..075da9aeb3 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+bool arch_smt_cpu_disable(unsigned int cpu)
+{
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index f7f6e7ed97..ed75d06dd9 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,10 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_smt_cpu_disable(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 29bdb65afb..8a9503ec94 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -75,6 +75,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_smt_cpu_disable(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index c808c989fc..826aa2512d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -12,6 +12,7 @@ config X86
 	select ARCH_PAGING_MEMPOOL
 	select ARCH_SUPPORTS_INT128
 	imply CORE_PARKING
+	select CPU_HOTPLUG
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 3f16e62696..cb3e0fed19 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5f..d64b533cc0 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,35 +418,8 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
-long cf_check cpu_up_helper(void *data)
+bool arch_smt_cpu_disable(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return !opt_smt && cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &=
&
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1;
 }
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..87a4b7ac63 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -115,7 +115,6 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         bool plug;
         long (*fn)(void *data);
@@ -124,15 +123,10 @@ long arch_do_sysctl(
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            plug =3D true;
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
-            break;
-
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            plug =3D false;
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 38320b248a..1a28c2dafe 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -176,6 +176,9 @@ config LIBFDT
 config MEM_ACCESS_ALWAYS_ON
 	bool
=20
+config CPU_HOTPLUG
+    bool
+
 config VM_EVENT
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..8ff81197cb 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,39 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && arch_smt_cpu_disable(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_HOTPLUG */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..2acf47723d 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -483,6 +483,51 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+#ifdef CONFIG_CPU_HOTPLUG
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        unsigned int cpu =3D op->u.cpu_hotplug.cpu;
+        unsigned int hp_op =3D op->u.cpu_hotplug.op;
+        bool plug;
+        long (*fn)(void *data);
+        void *hcpu;
+
+        switch ( hp_op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            plug =3D true;
+            fn =3D cpu_up_helper;
+            hcpu =3D _p(cpu);
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            plug =3D false;
+            fn =3D cpu_down_helper;
+            hcpu =3D _p(cpu);
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
+        case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:
+            /* Use arch specific handlers as SMT is very arch-dependent */
+            ret =3D arch_do_sysctl(op, u_sysctl);
+            copyback =3D 0;
+            goto out;
+
+        default:
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
+        if ( !ret )
+            ret =3D plug ? xsm_resource_plug_core(XSM_HOOK)
+                       : xsm_resource_unplug_core(XSM_HOOK);
+
+        if ( !ret )
+            ret =3D continue_hypercall_on_cpu(0, fn, hcpu);
+        break;
+    }
+#endif
+
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..c734033bfb 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_smt_cpu_disable(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
--=20
2.51.2

