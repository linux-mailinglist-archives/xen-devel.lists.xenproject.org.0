Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04230AD19EC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 10:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010146.1388284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOY1k-0000rL-Rb; Mon, 09 Jun 2025 08:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010146.1388284; Mon, 09 Jun 2025 08:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOY1k-0000ok-On; Mon, 09 Jun 2025 08:38:44 +0000
Received: by outflank-mailman (input) for mailman id 1010146;
 Mon, 09 Jun 2025 08:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Vc3=YY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uOY1j-0000oe-Oj
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 08:38:44 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 227ac615-450d-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 10:38:36 +0200 (CEST)
Received: from AS4PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::11)
 by DU0PR08MB9749.eurprd08.prod.outlook.com (2603:10a6:10:447::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 08:38:33 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::ad) by AS4PR10CA0030.outlook.office365.com
 (2603:10a6:20b:5d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 08:38:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 08:38:33 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB7437.eurprd08.prod.outlook.com (2603:10a6:10:354::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.21; Mon, 9 Jun 2025 08:37:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:37:57 +0000
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
X-Inumbo-ID: 227ac615-450d-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ypm1DFotUmNI3WNXSqra9LTl4EfQGfwmNkaqK9GXXl5P+Dh9OWgGlVAhZgNYtqWPPiZjLjKsUXOFfNgWoB+QO8kBgAY5ICRKjjwnM7iFa2VlYDpcc2G5uT92h1XjAI40iiSQI/PJ+Vg3P6TiO3AYR8c2Ln6yRsYTWiBwmyOSUo3/BATXkptNnb0oJTpqvT+Wrwyyh1HECrLzJfJ+cBqcI8BecIAurh3UeljODBohWvySFSRRe7r3VwhmYYll+VHrJul+6u3fgfjSeY2k9xqkdgQNt/rOkuUEsqZ0dplAy1k+1NmD7nFuU68tESQM2fBYp8PDCTUfscx9lTPb/rpU8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSv3WluM2C0ZHzKojUv6lJqxvK8XihoWm2roduIx/qA=;
 b=rqKOswlKZNnsoQsWUXJpv/fI8jqStKEkTTiqe8k4VWdyRQ9CehNaIBvDQANRIf41/dBwZdx1Nt2uTq4O44WyMfyJA+6ilcZp57nS0yptZcpjejXbH4pzDSUbpv44A1KIYnSBWtnst738oLL/rdqYrcOxehHDtUiPV6qs/GKMYc0pf+aJJWoyhH7H6aNEMRUg14UQaUNjG+QnfmnYopocAE8KdDGpaUFmo8GDrtdvaVua/Yy7QHuCC5HdgYb5N/3G5Qj2L+IdUAeenD9PtMu5n9q16aZT7u/LNWyN/n5TfmIsVl9InAbtJfugoxajV6Ac8zVOQZvhL+HjVM/z4K7Cnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSv3WluM2C0ZHzKojUv6lJqxvK8XihoWm2roduIx/qA=;
 b=ppbClE5pcbFQcskR1dUGGSjdOWGHurTxjI9vSf3AXQN9css24HuRQJ3pzN+y4ijWumkmin2rxXpcLX540amUrMw/31Gc7V14W140C0AwdI1dIcGQFLXPA2JXeXQ61o0gd5I5RVBqdFxqjsEs37lh0YBZ6qU2MpuxmaSJ/GmppwQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHyZQ+XFAck4MORuj2rzZfOjlcCvf0pya2PWUYI0tVhaVpik7QNZUWlWQ5XX3hfmztqrlyTps6MMQPXaXZUErlQyEB2GVQ79WpX/9qXwC/xahqyglwoBaWP+zI1EPx+ke/+5gh9DMI2grzjN0UbEo6+zAU1AGbf6k4Roy0vDb946HrPUR4v+Wjt77BcaLfSlipjs1mb/0unmecEObEaTE1O4FBVak4UHVIOJdl3gCPZhcG/OigaW1Xn+8N0IroNN7Rt9u0W72AzD23tr47pjBujCo/dzmYixOJn+hIBPtvKb8OTTgnFQoP6JHkrzVaYGNggxnn7dyWJhB9HPqm+uAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSv3WluM2C0ZHzKojUv6lJqxvK8XihoWm2roduIx/qA=;
 b=bS0yRkgbZPspa0ASaEZrXtaS5Xc0HLPrhEjlG9kPq59WRhxvQVmL4Dq2KqE9fqlYRajy3sbEM1MmMLfwJdyKBtXUmG87O5ZmOXc5H655u3jN9s5lw7IRolEaN0DvE3jY7iRm/zJozl0uqP+8rrpnagrNBf0TgR9FRsNOQ+QR5fzlshOAADio9Nh/L6fg92j/Leb8eZKWEOap4WMVILQW5LopXu1n5t7+9+P7ss78SyFGf6aMse/8RhWplbvmtVz24ylXUelEYo2XKKrBDeIXUuEDPHDzGdRtE5YSW5BIl3TsEfBqLA3ektpml3T0VHwHrxjTf1EB0AncW4BAzQD4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSv3WluM2C0ZHzKojUv6lJqxvK8XihoWm2roduIx/qA=;
 b=ppbClE5pcbFQcskR1dUGGSjdOWGHurTxjI9vSf3AXQN9css24HuRQJ3pzN+y4ijWumkmin2rxXpcLX540amUrMw/31Gc7V14W140C0AwdI1dIcGQFLXPA2JXeXQ61o0gd5I5RVBqdFxqjsEs37lh0YBZ6qU2MpuxmaSJ/GmppwQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index: AQHb1wMFgqp5jCI+gEaPA46nKsooErP6hW+A
Date: Mon, 9 Jun 2025 08:37:57 +0000
Message-ID: <CD168290-30D8-4EF1-8F89-95EE597E6C54@arm.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB7437:EE_|AMS0EPF000001B4:EE_|DU0PR08MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e73f13-0c7d-498b-97c1-08dda73104bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3J7bHATidvyvcbRveQNf7GuSEv1zI4mBWFhDUieHSGWNtugWnlE3s7A9EJq0?=
 =?us-ascii?Q?Df3xzaI8nwTgn+2+/AcmisRygtZdEO0bW7urW8FcjMfKaU71Tt6gT8P1pbi+?=
 =?us-ascii?Q?0EMjkmOVzKVPecGD3bH2ggSUfvyvxXAZOyVCQA1XkDwA58++k6eGr9zrnZz7?=
 =?us-ascii?Q?HzKETabb3KoW98ySvRYzDGhwA49rbyTL6jlAUBTw+UsTmt0dECW65D3l7yHY?=
 =?us-ascii?Q?sH/VnKpUpseJQBHyg5OqOaTPkua+66ztht07MLMUiUpPMzasv9HsXAqer6c2?=
 =?us-ascii?Q?hxuxz3XqkwhxyVH+GmtqzXPN1yuYCcwAvmyQFjXgqnRgaAszjj9LZQriT+Jb?=
 =?us-ascii?Q?FrDL97h4mbwja2aGfi1VZfhe1cptP5W53CjdrzJ1fOhNQJlRGuRfpa710JcU?=
 =?us-ascii?Q?79ux7MZjHcOpAGCHg9ZExTbIhcm2Bh0B+AhKOZleN7GEN8jqFjqiVodUb1iH?=
 =?us-ascii?Q?HHU6IRl5ieYaPDwxD1mpAPZixcUmdjXuNG/oq17PU/9yTNoDT7c5e2JyJCTT?=
 =?us-ascii?Q?uV1qkaO1a4kuTXGT8nNsSuGMxeWr37WjYSdG0UHd7eSLZt1rT8zLUirexTLo?=
 =?us-ascii?Q?4l+A5ckU1haaLsS948Id1NjF5WvHKpf1BstyWrSPwuF4GGlokSobsz4HHjS1?=
 =?us-ascii?Q?QVDf8F0hKrPjZnYIUIhpkAUK+EWCN0HhPISv8VI08P6x8V5L0FTGNPMVgNjN?=
 =?us-ascii?Q?/QMN1T1Ujh3Hoy5+t/ofiXs5kc1uirK3FvkPJvjC5ZPYiMJy055hM9xCkNfM?=
 =?us-ascii?Q?zr/GOOBb/1LXEBV2F1eRE5+TTm4f8ixqcXPtK81sbmyMM8YT5CQzM+HkmbPs?=
 =?us-ascii?Q?mmTUeLY0RoxTWE9p8j+uMOVmEq/7qZGMKA4jtB12PRcriZVpc8oZsyicwaLI?=
 =?us-ascii?Q?26gJce8Eojld50DBrRb5fSJ5CWP0fF2f8JI9/d1WBLezEYaXV6n4YzOfGHL4?=
 =?us-ascii?Q?HWctfMhUoYw2AUWTMhiqUfF5jUmcZBqYE+g+FNIIA58rqlbiTUGDvs3c7DeK?=
 =?us-ascii?Q?7ACpTgi529UC0jeC3FO2W/qL4Lc/QZX6Fa8+fEz8deI94bhbqfrL5m1XmKF7?=
 =?us-ascii?Q?0PU6loRSDcZCx37/mxEwkI1frxgQcxXFDEqeIG40X2Al9o8nPMbXh0m2Qbol?=
 =?us-ascii?Q?Um1Hhc5XnKsrB3kdrcCjKB2RS4U6ImybtmsI4ze6ARd9LStxNTN58crmGSo1?=
 =?us-ascii?Q?QAc0/EDPLrZhWNtKw2z1Me0r/T7kMhDQImDfd9jn3XptiCyyKajPQzNcBVyB?=
 =?us-ascii?Q?IHWOsnpcjFHv0hG1jaoq0IyG+EYy8o2a+yUk6DuGMmpAH8t0NrNt4GPL2BIJ?=
 =?us-ascii?Q?PrvsbiJuNRQ9fRIU0E1GdClGMnUzldb/Hreg5iNHAThZI/zJDjO2N5dejUbt?=
 =?us-ascii?Q?Nf7hqJJomS6b/ln8UYpdQDjTCSthfsoLfmyy7b82wgenRo5909xQ4oVAz2+Y?=
 =?us-ascii?Q?D9tJoK66OVnTz29FkyJ5vBTBlzFj1S20EocHJqECv4zqF2Bh/+rAaw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BAF5559DC812C04AA233F7FCA2ED878D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7437
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64f56e70-87dc-4aec-45e7-08dda730efc0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UVLYV8W7/yINuxr2Xw0vuiH1Js/Fv5u7dveyeyr4JV+r14McAh5ihkGybGrV?=
 =?us-ascii?Q?HHd3/mM3ouYvjbsLtz8/m+Asp3hFwoaKhFwpD86r2YBeBR7rPrl/wulN2M5z?=
 =?us-ascii?Q?mEJcnaV0W3knft6DMw8F4ZAFf/lGuiPFecnfKtZeS/2MbPH9VdPxrXTo4XKA?=
 =?us-ascii?Q?nitZxZIr4tMDgYbuS3a+uNqqzs3lrJbkf5pP0EhPaAcGtyYOsooRMF7urDmv?=
 =?us-ascii?Q?fEZ8CrMxciWMvDtw6UXA+KRWFajU+Kl+H56nYYGisCN9gZprdyXtjs2A1FcS?=
 =?us-ascii?Q?2k4ioHNrBPKtCcMCDpq+6w+x/3RWprzYIXkgiko0F+QC8774VGK6n2Uzymx4?=
 =?us-ascii?Q?0niVnFmSFO2KDlPY5JjvAG87ka9RMhCvu+iuIDljN0LDruJGQ+qcfJo0oncT?=
 =?us-ascii?Q?1PEvXmFlRNVeHuolhuhuvbjtjOkP1THoRc3gi0TtftipeqklTeYoz/WnlEP7?=
 =?us-ascii?Q?yk9ZDvUlDrCKJ7HKSRc5rKBmkTbsBxSBc8R7cHZ5ugsa5Mwq376XMeBAzHh3?=
 =?us-ascii?Q?u5Jvq1Z5ZPhBZUEwG3kgzrm6op1f44EegchK061dcZo0ois1AlFWnWeEj5YM?=
 =?us-ascii?Q?LecxgsI0p6zI7/XNHW5MP8RtlOM3bxg+DCZ4tlt7lRXhE2siqfb9L7dOAYit?=
 =?us-ascii?Q?1yc2vniAUDjJL4zekD/1tfb/PjtNApExIdmgEBG4p8Znc8C1VVj41p18OUmm?=
 =?us-ascii?Q?zW2asqQmIHaJopCOVkTapf1xoA8IJw439dq+5mxpXgW86QfBc5XhbLn5KmTq?=
 =?us-ascii?Q?ld/MyIrp+TTdhUD440K4ztYeHR9FOC+yKpga7jnQV171sUsGBac0UZHhot/4?=
 =?us-ascii?Q?q68MHpL/TtDKyc9qqveyXWODYQjVv/T5WKjkvEPv9IElLnH2qObuMvD2saua?=
 =?us-ascii?Q?ozOaUhwQXrV2VZDwddH88/zSf5q/ArZ6Nzbgzq6h3V5tRjZeR1b7xxl9vlyZ?=
 =?us-ascii?Q?HObjdJ8m+xUKTPSl4CVu6maqLoLHmDtveg+YXD1GDwMaVssIXo2eGwK2DhH0?=
 =?us-ascii?Q?27n59Pon5OKO3zcmk1fuPiYlPiYmY9fYD0ItiujzVAgKfllEyTsUV5k3QkTR?=
 =?us-ascii?Q?ObG58zVClaSWoZR2fGnuoYIhk1mT+mtooX/2fLCusRYpYRSwZCFj2GWe7J8Q?=
 =?us-ascii?Q?avG8e0/n4elwArCTr6SLDbLIsO7bwr2EfAzPygJ+mUOqeDd/E3jem/pujly4?=
 =?us-ascii?Q?udoWEuk7/Ez/LmgoDTQ70dSNu4PoHC/rHCJ2ycN5wIvg1CluRMC2uik6N0fD?=
 =?us-ascii?Q?luVaG0U3WhlBGGxXRH38evcWP6cFxJesKCg8zV8STqTQKMtstXA7ZEG+tWV2?=
 =?us-ascii?Q?aJouw9oS4XikehX8LUMk6LWOAI+bsjXloPFjncIMjBnBeQhsznOwmaPfhTbA?=
 =?us-ascii?Q?avwIPM+cJou93JPEp4JqeTJDDEzyhoJ2WFAquxI8CQ7kqZgHMIkpSgjgGdnD?=
 =?us-ascii?Q?q01h32h/+KhS9wWNrMW4HWa+0sy2dGM1tgmivDCfF/CUTBb86H8kUfQVhcPL?=
 =?us-ascii?Q?wgE7NrGseInTsGLI6dKlSRfd87ii9YOfa8Ji?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:38:33.0365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e73f13-0c7d-498b-97c1-08dda73104bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9749

Hi Ayan,

If I understand correctly Armv8-R AArch32 supports up to 255 regions, so I =
would expect ...

> /*
>  * Armv8-R supports direct access and indirect access to the MPU regions =
through
>  * registers:
> @@ -85,6 +87,7 @@ static void __init __maybe_unused build_assertions(void=
)
>  */
> static void prepare_selector(uint8_t *sel)
> {
> +#ifdef CONFIG_ARM_64
>     uint8_t cur_sel =3D *sel;
>=20
>     /*
> @@ -98,7 +101,8 @@ static void prepare_selector(uint8_t *sel)
>         WRITE_SYSREG(cur_sel, PRSELR_EL2);
>         isb();
>     }
> -    *sel &=3D 0xFU;
> +    *sel =3D *sel & 0xFU;
> +#endif

something here to check if the selector is 0-31 or not and:

- set the selector to 0 if set is 0-31
- set the selector to 32-255 if sel > 32

And ...


> }
>=20
> void read_protection_region(pr_t *pr_read, uint8_t sel)
> @@ -123,6 +127,24 @@ void read_protection_region(pr_t *pr_read, uint8_t s=
el)
>         GENERATE_READ_PR_REG_CASE(13, pr_read);
>         GENERATE_READ_PR_REG_CASE(14, pr_read);
>         GENERATE_READ_PR_REG_CASE(15, pr_read);
> +#ifdef CONFIG_ARM_32
> +        GENERATE_READ_PR_REG_CASE(16, pr_read);
> +        GENERATE_READ_PR_REG_CASE(17, pr_read);
> +        GENERATE_READ_PR_REG_CASE(18, pr_read);
> +        GENERATE_READ_PR_REG_CASE(19, pr_read);
> +        GENERATE_READ_PR_REG_CASE(20, pr_read);
> +        GENERATE_READ_PR_REG_CASE(21, pr_read);
> +        GENERATE_READ_PR_REG_CASE(22, pr_read);
> +        GENERATE_READ_PR_REG_CASE(23, pr_read);
> +        GENERATE_READ_PR_REG_CASE(24, pr_read);
> +        GENERATE_READ_PR_REG_CASE(25, pr_read);
> +        GENERATE_READ_PR_REG_CASE(26, pr_read);
> +        GENERATE_READ_PR_REG_CASE(27, pr_read);
> +        GENERATE_READ_PR_REG_CASE(28, pr_read);
> +        GENERATE_READ_PR_REG_CASE(29, pr_read);
> +        GENERATE_READ_PR_REG_CASE(30, pr_read);
> +        GENERATE_READ_PR_REG_CASE(31, pr_read);
> +#endif
>     default:

have something here for Arm32 to access the regions 32-255


>         BUG(); /* Can't happen */
>         break;
> @@ -151,6 +173,24 @@ void write_protection_region(const pr_t *pr_write, u=
int8_t sel)
>         GENERATE_WRITE_PR_REG_CASE(13, pr_write);
>         GENERATE_WRITE_PR_REG_CASE(14, pr_write);
>         GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> +#ifdef CONFIG_ARM_32
> +        GENERATE_WRITE_PR_REG_CASE(16, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(17, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(18, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(19, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(20, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(21, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(22, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(23, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(24, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(25, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(26, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(27, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(28, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(29, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(30, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(31, pr_write);
> +#endif
>     default:

also here have something for Arm32 to access the regions 32-255

>         BUG(); /* Can't happen */
>         break;


Please let me know your thoughts.

Cheers,
Luca



