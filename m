Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B591B32584
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090674.1447809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upbhJ-0000p4-Rg; Sat, 23 Aug 2025 00:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090674.1447809; Sat, 23 Aug 2025 00:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upbhJ-0000nW-Os; Sat, 23 Aug 2025 00:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1090674;
 Sat, 23 Aug 2025 00:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upbhH-0000nQ-VH
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:01:28 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cbdeaee-7fb4-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:01:20 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB10082.eurprd03.prod.outlook.com
 (2603:10a6:20b:63f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Sat, 23 Aug
 2025 00:01:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 00:01:16 +0000
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
X-Inumbo-ID: 4cbdeaee-7fb4-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AA9p6ZIEaJkWD0mTt7hqkTYODAzcWMYjNt9zxOPMrkuWlcysnyiatU5ufS/nre6siw1jLXw+gVe37Q8xCV+xP02qeV//Nx7rJZwRKjXA5QfgNl0mEdMw71bB78LnS26XANtntjmYDLCMxbe34nBtY+zje+1HofbfL4yPahQuXwPR1i2zZGjog33SyFkrglgCp6VuIeAUTsQYQSKgUYev+CZgZo1umoiXu7OiJSwc+sRPZOxZdvH4hzLcCzlJusJhoRjpm7QXRuuy3n58KtaAPVwzVRwqqiNwka8VZRqt6jZncD8Pe/OjtebFmJD+085PrgC2NOl+TN+KI96ceL9+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn1Ki+Q2cZqYku2XlKAVffWg8+hN/QUuWGn4EDap33s=;
 b=XAnv8s4ecVnIwpM9LrsF5Hn/iaae/XwCxw0L4EcKUA343/6UR0alfR3Y4ZPwzjBl1m46UJxghHJkvEBOxHAxspgI388IxdFPe2RgGaDJPgtBRIY9iYB3zvytL+yY683AnkITcawPiYBC8Xy4czW3/LEVMbpkKO0kNblTmWOEwr75gLAOwYuc3TXDXt6uj+ysZG/FMRF2wDDAAGZoMEkKqRxiik3P33rw9KXTrcFVGyQk0n9+plt3Mvy+dGxdE3kb7qWYgjTGTHYFmcNqlbYVrUIjh3IqMHugz4Dt6T+TCrLqGvoQ3LAVA1MRnvWZ3bfrNedHJtIiM743E8UwzDBVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn1Ki+Q2cZqYku2XlKAVffWg8+hN/QUuWGn4EDap33s=;
 b=ZfMzXMIN7MFqslwsgAuJT6S2dDh5fIyfaPOdNbeh8FNaSJTLXoxp6k1ocfSfVp9VeaEbvmj7jujg1hXS+ixS03oqWIGuL38v13FWMi7hYTWO9BGwHr2ZK24cRv0kz4yRb0XDbuhftSQW/VBrn8oT3Xwg7/z/ljroPe+khFRBdRmmNShNYLQa29ZDjTHR04TJjYa0PTgPKSddbHJ63cKf3+uYE/POMdirMldPAIfZLUv89ManQE/LQbk/4whFm+6eK9L9M4aWDjeaKAVT1wpgxKD/qyOkQY3GWMxxbaQHL7njm7j2lubED5KSvwzQQ4dAIfG4ykcBagR7kW29cWJUmw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v5 02/12] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v5 02/12] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHcCwFbbjjfZY2kcU62fZWRWGuXGg==
Date: Sat, 23 Aug 2025 00:01:16 +0000
Message-ID: <878qjac3ec.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<db677462d1b5b698db417182c05c3a6c3a17c0d0.1754943874.git.mykola_kvach@epam.com>
In-Reply-To:
 <db677462d1b5b698db417182c05c3a6c3a17c0d0.1754943874.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:47:58 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB10082:EE_
x-ms-office365-filtering-correlation-id: ed1a012d-0400-4064-d076-08dde1d82e4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/Hv3tjvk3RdQIbtsAQP7Bo9FKuA/cGhaPi9UNJ6Zu4LL3J+fM75tDKRgYk?=
 =?iso-8859-1?Q?maDAQZTjINxbNpls9TTfcy4Sxs9E6ygTvTRzA3M6gIP+o4PkBfKkvIAusT?=
 =?iso-8859-1?Q?LBXbUZV12IVvD56WaiYHO2t6DC3f6WuTgTTskM5H/AppmYbg+erZzr7qGy?=
 =?iso-8859-1?Q?5xQFWiaX4IamHo21qNIk024IOqWjqyDx99R3AjtFv8YsaNeiYIDfUfojHS?=
 =?iso-8859-1?Q?EqTI4g4Z2F7qXKNCwz2zgoaFexkGXd6Bk2izSpm/g2GO6clFPDAGvA3zNX?=
 =?iso-8859-1?Q?PLZPiyOF8sitYkAVkje/ic9T+2MmyfMtF71xUzBS3QX/ZpRa+yzP1W7SBz?=
 =?iso-8859-1?Q?VgZ5I/+CsMh7W5FWiPp95JGBwE4XbVaOZlvjE0mIwsdhaXY0bgJFD+qd94?=
 =?iso-8859-1?Q?jrkvozm9MAghsY1PGlfL56i2nzs82pSmWUHx29UoJjfkrYMzP8N2dzIltJ?=
 =?iso-8859-1?Q?OkV9zqdKEuxITrFV5dlBXqMQnoCU7MU1Xj1KAcQ9CD6NPepJsfSItG5znm?=
 =?iso-8859-1?Q?2KOT0FPlrsDoiH6kx0mdnXKy25IQrcrZ7NYm5Zaou+m/yL0U9RUACES3QY?=
 =?iso-8859-1?Q?DV1E3tcMiUgOFG4g0caiHIVlKcsR/GATDO+iHV13Yhjugve5C96gxKUg0W?=
 =?iso-8859-1?Q?z80b5Nl5pAlIKGO/OCNFF5OlRJ5FW5/amK1sscwemEl/cj9zrud1MM5GZ5?=
 =?iso-8859-1?Q?kRfqjwsImkIzVW12hfqM6u26jGViEvy+eUI2DGBtgwrnzcR2y5FjFxjr4h?=
 =?iso-8859-1?Q?jjTdjGn6xRnTFdPXK1IqLSNo/60qGh5YFC6rX+uwPWHAFijPzMfUfFdNsa?=
 =?iso-8859-1?Q?BtVy36A5Nd/5xUVF1VjhPLAFTb1F+F+tAmd74fqbKr110XrI0sospmujer?=
 =?iso-8859-1?Q?PxMzs+NVekSlIwFgoBJjUJ3IOmjrBzPRUqgxhczAzhJvMR+ez0TzrUTCq6?=
 =?iso-8859-1?Q?1ncRjjCYtrDGRfZ7g+vZ3JaJaAIhxXLqoR8g1+w+jKB65o5RCcohsW4d0y?=
 =?iso-8859-1?Q?yfyxCL1jwbmH1saBVqM8p4S2mHthArxsKPUcqG4HtIm/oO5BMJ+Qnmn8ZT?=
 =?iso-8859-1?Q?bbwodUxg1aq41HqoJY3YY7gY4AITIwbS/kTVURiaBHIO0kJe75NQJKJlD7?=
 =?iso-8859-1?Q?tmS6tkXZ0oJFhsiK4LXl9YJeJtZ5NrpwGjXOL8tnuJO7cIpNEedeAYuzd9?=
 =?iso-8859-1?Q?bRoJ2ZVWkcM9GGjtjjJ0dSAx9X4GdogpVIdBoVdW6grZJdZ4a0eM3EoeSU?=
 =?iso-8859-1?Q?uwnXlseLZSPF53pQPanSRlLkCy6Ryb/J7Qxz8ukn9tix5Nc9KngaO8fCW/?=
 =?iso-8859-1?Q?4L2gNDpsyB2V7GUqo4oQgK+VAxKlrBnoSuCKsrUAgEdK3iknXkkX5inUbs?=
 =?iso-8859-1?Q?KZhFcQbWeA+gfyGEzj0QMo2/4eaFT+wx9/+sdvxb7nIdDT3iVYefzazPd1?=
 =?iso-8859-1?Q?Y2cDvfpFPCES0NroQilmYIjFI1IletuuC2VvwQOTIIySTMcWsC7wntTfuT?=
 =?iso-8859-1?Q?A+doOQWuoxKsfufz3Ea6ExD25PsncWllREz6MZSbQ0YA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d/nDdbFxDV1P5gSm2O2Nv/ka3VgoDNBCjWOzyIeIVS8z0mOXIGWLM666du?=
 =?iso-8859-1?Q?vdfYwD3Htj7qVyRNbZ+j9NRpok9eBaqXvzQdukK6FONp9pac1ECXx7oCc3?=
 =?iso-8859-1?Q?rFS2F0zYSyVloizrlYzBMNJecaubDYGL/Yja6hDNRlSTnQO1EXZZ6AgpIC?=
 =?iso-8859-1?Q?eiN1+ovfHvpWmwirHg4yKm9kpp21XPAc81ly8i+pbpFkv8Dqp84EggTm15?=
 =?iso-8859-1?Q?kF9vJf0z2fwOXytpnv+clyMP1e7zWjHsPFerWGobYJQ2WpILtksRSPuusK?=
 =?iso-8859-1?Q?v+1Vr6Cr0z7xPFNH2CIZITNzKvL0GEXUxRFy7p3/cOpv8/ASKFUjHrRvoq?=
 =?iso-8859-1?Q?+NGEqs9EfaZ2tEyskeMrL1lPIkX15TCUw7ZwdFWcRQ/HV8tECfEmOwQtuV?=
 =?iso-8859-1?Q?Dhu3N/LKc1D2b2n5wONGVfrMBS3lDN3nluWmzQEotTqps5Z84jCBH21kIt?=
 =?iso-8859-1?Q?jTZwYXJVTrFQj6k2YZyXpprtHcnh7byiPNwBRQ+bLa4fBiER99zOB/1G1/?=
 =?iso-8859-1?Q?RdRUgy1iFJ9JtY1r1eTMB/F/myFsW/cxVOVY6NIQyPMk4JkANktxmYYh6N?=
 =?iso-8859-1?Q?xo4PE+PDc41MEfl1ECWmElayqMG2L7MK3jMq5yj7rHp1tJf33Cz+qk7xt1?=
 =?iso-8859-1?Q?P8fDfrO16hFy0PKV2XRGtGdqwCoMIVB7BgIgwuQYlKhhigZVV3PrbOopjJ?=
 =?iso-8859-1?Q?6zIaELbUzoPmsviHj+m28lqLuygzX96CKpTpTsMKc7ak/XsV4x5TJ+xfPb?=
 =?iso-8859-1?Q?VmVBM0Q8L5bgp30sRaDVPVu5sO2C+vpQ7DFG7yXUeBHeXSpdeSviZwDYg/?=
 =?iso-8859-1?Q?6UKGTkk6VILLuojjTUxdBRXbShP11LcY9uzE9UeqcPRuCYxJAC5ovnKJ8/?=
 =?iso-8859-1?Q?E/ynTngdwfmxh5Tzcj0yE0eGRxor14TVcVD4LeD1yQq8ICshMrvVYXBd5U?=
 =?iso-8859-1?Q?LoDXItzJhEoRid6RHEYRnZkaN2O/vkhM0ELL1LzuDnxOh6jp/pesUb1rb8?=
 =?iso-8859-1?Q?2iuVafCLtJT8mqOE6JbRJeY3jQ+hmcpA3GKDd2aWwGEPDqYsT0fTVa/GeZ?=
 =?iso-8859-1?Q?8PEhsXNPAy/1SGVKtE1Ffc6/OHn1/ux2hPLVTBetzBqe0i2YgqQKPfKgfS?=
 =?iso-8859-1?Q?N+AdEXYzqt29sfxqcwvNNlqy7qEkATZOpE6moc+WcmjKrqP/3tYt70Vt5F?=
 =?iso-8859-1?Q?0QxsQEDl/PUBXUBPkb5q9E3OCJlJwWcskEzFDdpCdvT6y5Sngj9Sy5xTte?=
 =?iso-8859-1?Q?iFfTw8tacuG5wdSkEABiIRoeJq+MEU1+4zc25DVapeB1uXLS91Ip96E985?=
 =?iso-8859-1?Q?dCA9usmzg6xBiP3nnWt8cjV81G4rzxn/N73JXiP51ayUIg+qqKIGUfE7Yq?=
 =?iso-8859-1?Q?qwa5Ey2717oEVEY7gs3svATqhMEZe+a+J9l3S8RmzJYnypzWHKCS9qPV51?=
 =?iso-8859-1?Q?duOu4YIte6Wh69Hp2hSUWvthM1OJUBKH3ucK2VLTrsvi0A9UGLzh5Th/3J?=
 =?iso-8859-1?Q?0rBHzEmMH8P6qLVYJ2DujexqoTOJ4A9AHLQNQ2fLKPa8aOn7heP5fLCjqG?=
 =?iso-8859-1?Q?1c7CEwSMRDaezIYdibP4xUL+/M+PPjJ+AiDId0cbsdiponBpkt8o+TXQk9?=
 =?iso-8859-1?Q?cG/OPqJy6ONGXyYeXMrohv/MLEFXDatyTA6d19sMys8vZunol7u4w2bQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1a012d-0400-4064-d076-08dde1d82e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 00:01:16.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: egpSz6WCuEvaeCWLAnkuagJMWMW+406qYf9z37TxDdZIZnNM20Zvp7R2dMNDXSFVQ9Y65Mn2MmEK35jVrnTGktx+sMsRvfVJ1yK0gi6ks8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10082

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>
> Tested on Xilinx Ultrascale+ MPSoC with (and without) powering down
> the GIC.

I think you can drop this sentence, as I am pretty sure this patch
wasn't tested on Ultrascale+ for last five(?) years..

>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v4:
>   - Add error logging for allocation failures
>
> Changes in v3:
>   - Drop asserts and return error codes instead.
>   - Wrap code with CONFIG_SYSTEM_SUSPEND.
>
> Changes in v2:
>   - Minor fixes after review.
> ---
>  xen/arch/arm/gic-v2.c          | 154 +++++++++++++++++++++++++++++++++
>  xen/arch/arm/gic.c             |  29 +++++++
>  xen/arch/arm/include/asm/gic.h |  12 +++
>  3 files changed, 195 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..dce8f5e924 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1098,6 +1098,151 @@ static int gicv2_iomem_deny_access(struct domain =
*d)
>      return iomem_deny_access(d, mfn, mfn + nr);
>  }
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* GICv2 registers to be saved/restored on system suspend/resume */
> +struct gicv2_context {
> +    /* GICC context */
> +    uint32_t gicc_ctlr;
> +    uint32_t gicc_pmr;
> +    uint32_t gicc_bpr;
> +    /* GICD context */
> +    uint32_t gicd_ctlr;
> +    uint32_t *gicd_isenabler;
> +    uint32_t *gicd_isactiver;
> +    uint32_t *gicd_ipriorityr;
> +    uint32_t *gicd_itargetsr;
> +    uint32_t *gicd_icfgr;
> +};
> +
> +static struct gicv2_context gicv2_context;
> +
> +static int gicv2_suspend(void)
> +{
> +    unsigned int i;
> +
> +    if ( !gicv2_context.gicd_isenabler )
> +    {
> +        dprintk(XENLOG_WARNING, "%s:%d: GICv2 suspend context not alloca=
ted!\n",
> +            __func__, __LINE__);

Should this be ASSERT(gicv2_context.gicd_isenabler) ? Or do we expect
that this can happen during normal runtime?

Also, you don't need to print __func__ and __LINE__ as dprintk does this
for you already:

#define dprintk(lvl, fmt, args...) \
    printk(lvl "%s:%d: " fmt, __FILE__, __LINE__, ## args)



> +        return -ENOMEM;
> +    }
> +
> +    /* Save GICC configuration */
> +    gicv2_context.gicc_ctlr =3D readl_gicc(GICC_CTLR);
> +    gicv2_context.gicc_pmr =3D readl_gicc(GICC_PMR);
> +    gicv2_context.gicc_bpr =3D readl_gicc(GICC_BPR);
> +
> +    /* Save GICD configuration */
> +    gicv2_context.gicd_ctlr =3D readl_gicd(GICD_CTLR);
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +        gicv2_context.gicd_isenabler[i] =3D readl_gicd(GICD_ISENABLER + =
i * 4);
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +        gicv2_context.gicd_isactiver[i] =3D readl_gicd(GICD_ISACTIVER + =
i * 4);
> +

I think you can merge this two loops

> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        gicv2_context.gicd_ipriorityr[i] =3D readl_gicd(GICD_IPRIORITYR =
+ i * 4);
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        gicv2_context.gicd_itargetsr[i] =3D readl_gicd(GICD_ITARGETSR + =
i * 4);
> +

And this two as well

> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        gicv2_context.gicd_icfgr[i] =3D readl_gicd(GICD_ICFGR + i * 4);
> +
> +    return 0;
> +}
> +
> +static void gicv2_resume(void)
> +{
> +    unsigned int i;
> +
> +    if ( !gicv2_context.gicd_isenabler )
> +    {
> +        dprintk(XENLOG_WARNING, "%s:%d: GICv2 suspend context not alloca=
ted!\n",
> +            __func__, __LINE__);

the same comment as for gicv2_suspend(). Actually, we should not reach
here in any case.

> +        return;
> +    }
> +
> +    gicv2_cpu_disable();
> +    /* Disable distributor */
> +    writel_gicd(0, GICD_CTLR);
> +
> +    /* Restore GICD configuration */
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
> +        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i =
* 4);
> +    }
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
> +        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i =
* 4);
> +    }
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + =
i * 4);
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i =
* 4);
> +
> +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
> +
> +    /* Make sure all registers are restored and enable distributor */
> +    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
> +
> +    /* Restore GIC CPU interface configuration */
> +    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
> +    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
> +
> +    /* Enable GIC CPU interface */
> +    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_EOI=
,
> +                GICC_CTLR);
> +}
> +
> +static void gicv2_alloc_context(struct gicv2_context *gc)
> +{
> +    uint32_t n =3D gicv2_info.nr_lines;
> +
> +    gc->gicd_isenabler =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
> +    if ( !gc->gicd_isenabler )
> +        goto err_free;
> +
> +    gc->gicd_isactiver =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
> +    if ( !gc->gicd_isactiver )
> +        goto err_free;
> +
> +    gc->gicd_itargetsr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
> +    if ( !gc->gicd_itargetsr )
> +        goto err_free;
> +
> +    gc->gicd_ipriorityr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
> +    if ( !gc->gicd_ipriorityr )
> +        goto err_free;
> +
> +    gc->gicd_icfgr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 16));
> +    if ( !gc->gicd_icfgr )
> +        goto err_free;
> +
> +    return;
> +
> + err_free:
> +    dprintk(XENLOG_ERR,
> +            "%s:%d: failed to allocate memory for GICv2 suspend context\=
n",
> +            __func__, __LINE__);

Okay, this partially answers to my previous question about memory
allocation. So it is possible to have active system without space for
GIC context... But this basically renders system un-suspendable. I think
this warrants non-debug print to warn user that suspend will be not
available.=20

[...]

--=20
WBR, Volodymyr=

