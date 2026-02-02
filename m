Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGKLFJbGgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:45:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF7CE667
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:45:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218714.1527559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmw6p-00006J-Q9; Mon, 02 Feb 2026 15:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218714.1527559; Mon, 02 Feb 2026 15:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmw6p-0008WQ-Mv; Mon, 02 Feb 2026 15:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1218714;
 Mon, 02 Feb 2026 15:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zt3l=AG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vmw6n-0008WK-Q7
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:45:02 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213bd6e0-004e-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 16:44:59 +0100 (CET)
Received: from AS8PR04CA0207.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::32)
 by DBBPR08MB10724.eurprd08.prod.outlook.com (2603:10a6:10:53d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Mon, 2 Feb
 2026 15:44:53 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::36) by AS8PR04CA0207.outlook.office365.com
 (2603:10a6:20b:2f3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 15:44:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 15:44:49 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB9149.eurprd08.prod.outlook.com (2603:10a6:20b:57b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:43:45 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:43:44 +0000
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
X-Inumbo-ID: 213bd6e0-004e-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bf/ROddWq9/4vwV3qy/jn0M42MjJYnZmZYJuescRanRn2leht2f/chWSwol3Lj3ITvUbUYKSGUEYNp4kZd3/+cDs2guku92lD/BE6Mu6f5nD1FQ0rvmr+he0m87Brtr0kBmyltR9Fj/dlwosz1ZQc/I/O+37dhyrX/Akm6d4XyKUGyl6i9+Ld0Outs2q/e2WFgxQycdzuKSIqJFD1ghgGShhijtJLKrbG8JJJjt8GNdy9bzmEx8Pc1gUCw0OzAEt4CqNCQF+s1VIm9XmUoJQELK1dCiD+2O1jwLzYLQHn0qrIc019wK9sy7T0BzKcV6W09/s4o+Cpn3XMJfCoix28A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpvcIkpvyGXzfz13UfvRzLS17Z0/02OvORajSRDjXn8=;
 b=xKFaBbrMfE2mRK2rtR3H/2AU99xLc9u9EZRS44D4TKUjhsnebScBnVwUKFqUEZvTLesXrE2UbJTTXQY5cJJmYMC/a4py5bxO6AHYL72npUAd/kLzaN0sgibD+HG0+uhwYfZPaxXOzZVWxURLy7Yu+RhNGyFuVUq9a76gt3KCi+xPOKTkaQ40IdVcJbb/dg/hgYH3sQzD/yHascOmFvopdyGu91rM5VUdgzyVu8Ygwx7fgGrRibAhSjTF98edhTV2AZ7MvrbD91+S1pLnCtA8F06onl7wuZY4qtvpHib/YdF/zzpwutPDFOB3Ic8eclcvR43CiDY4e9zjPfO+uy9WwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpvcIkpvyGXzfz13UfvRzLS17Z0/02OvORajSRDjXn8=;
 b=DukJHWRRz9iAfT2dv4PuD5uVVHPhaWkuK/LAAbZqhuZr+DS0DT3VDoV0Zu6THhgRG9sN/gQ9pYI+OFbl8b4LkUvQSv6p0NrSMpwZBC9tMWBFIXIxe75pOLJRwjhZkFczrBxQn9copwHzj70zgmAPhql0q54USby6PGBvVXD/jhw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzBa3tyhDY9JJzKINGzs3aqKzCHjdqOoNE47oDdx2+VT3yaFrvSyxMUJaVWlUtbw6XyMUeIulx7CGUyR456HrHJaoD0EHoBqJYjtHMIEiCWR5x/mclY65UhlxPsCS3mOhag1RaRLbmTwy56ucu+ajBYwhK16vRm78hhvP8PLcMYr0t3v62g1M4cp2M00DA2XD/iXwlPwhopSYRCMzII2WQoo+gNncYLRSJWmbVJTQp4DxUI00xS6fvHr0Wn0bqN/Lv7eVxORoOK1BgrGXWC1eiSmtPyhSJWBqkv2rs6j+Gz43vUhLc/H/TIk5hdfcpR7Aj8vQpKZ9v+VQudn2Rczxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpvcIkpvyGXzfz13UfvRzLS17Z0/02OvORajSRDjXn8=;
 b=bpeb/9ccHSE7NjNKy9MYSLC9sANmCZcRu4VN99JdYq3oii9g8vZtZL2l8kWMxzPRV8PhGl+txi6f/gr0JCHRncMV4UV/ewDOp362bdam5tJZB7o19tEF+vM19x6MzUrgS2HTpfSUJyaO7L5npGe042BpwSqiPogEOLylkX4nszcHwwU6P7AZmqqIciGzUITQm7AZGiwRYlw9+jO2ad3psRMNJzUhjhYGNaXkaDJyuhRaOUBTJ1YKZZ2Mrc7YcbXxkSEjsD8zeCWRJbRZ2hOqU9gOiPkjm9zoVusssy18rLCpO7TBryYXWgXzpHPZC1jy+nWBJqcJdAlikNKkQqrCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpvcIkpvyGXzfz13UfvRzLS17Z0/02OvORajSRDjXn8=;
 b=DukJHWRRz9iAfT2dv4PuD5uVVHPhaWkuK/LAAbZqhuZr+DS0DT3VDoV0Zu6THhgRG9sN/gQ9pYI+OFbl8b4LkUvQSv6p0NrSMpwZBC9tMWBFIXIxe75pOLJRwjhZkFczrBxQn9copwHzj70zgmAPhql0q54USby6PGBvVXD/jhw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Michal Orzel
	<michal.orzel@amd.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] non-x86/symbols: check table sizes don't change between
 linking passes 2 and 3
Thread-Topic: [PATCH] non-x86/symbols: check table sizes don't change between
 linking passes 2 and 3
Thread-Index: AQHclFKZFLmIJ4wDWEaNoDc/7xfy07VvjLsA
Date: Mon, 2 Feb 2026 15:43:44 +0000
Message-ID: <06A76039-1EE2-4D48-A418-9C6192A57968@arm.com>
References: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
In-Reply-To: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB9149:EE_|AM2PEPF0001C710:EE_|DBBPR08MB10724:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb3cc29-c944-4e1e-36a7-08de6271ffc5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Arq6zwcv00+F1sBszq2EBYP5OhAlvmfCHp3Kq+b5WTcDYZc2zs61+Ey1IQu2?=
 =?us-ascii?Q?Ke9ztLZffjXkSrdITGRqFVsgyFRGFPZjz59n6fSbBkXQY5hYMsNl6kXnlufZ?=
 =?us-ascii?Q?PIQw3yR/VVpTyHtYbr2UqJWKjpf2K6MYorW0IZU4ihJC8xqqr0oRrL2cIAmV?=
 =?us-ascii?Q?Dx3pX7hc5sABwvjIPOCqPgg5mZhkiYTBwfJ54dY9W2oj80LQ7Stgvqv9TC9d?=
 =?us-ascii?Q?pfwaNgipx9Jqi0YDbls4Ypq++LwolmBN96n/XR6JOTW10ZRaaO4O6DaV3dh8?=
 =?us-ascii?Q?0b72kpTxp4BwY4bY4rZLgyewBmGh/jbujrhBgJ5j2f7thwIGPUSeI6xDJUqs?=
 =?us-ascii?Q?peob2T04zUs2FMfQEs4RWQG03hZWauLbazT2q4bmhp8JwKpfHCiCYY4OFCo1?=
 =?us-ascii?Q?CYnsM8zJFNxyfnTn3OUVR0oqPN2HoQ3gscmL1ENZgGjREEaE/Auy4w87RWRC?=
 =?us-ascii?Q?PdTaxH+aOOrid9tCmIM+BDY5RRLiw3TTSR55nPsvZsV+4M+XS6Uc5DMj6pm1?=
 =?us-ascii?Q?w4POZX/rqI1YmDGQMA5qPCwi8SFf6ACtPS5xf4+341NrnAYSKvSc8elBQOYE?=
 =?us-ascii?Q?ulRGce2ebPwLw5iPUCKViKe0eCLrGJYCCgHjaWX1Mn+qkkyjHKxKgUHe3Ps/?=
 =?us-ascii?Q?CKospR6ty01HSrBF8kaiB5IYZ0H+dUGeqVyzK8xHMABJDjbrQ3jndx3JPYGz?=
 =?us-ascii?Q?UDkvMsazsGZI68vNSKUYSRdr2Cm9597E04wW1LMZQiNWbfj85brYwHFO/ig4?=
 =?us-ascii?Q?M4BrBQDF2fHuZ0IgNhxaVqaXCHf0PbS9ksabxlNeN3JRgJJFfs1MZyABJ16B?=
 =?us-ascii?Q?+4KHvDs4MUTySEspty/EUfozGBl7KKPPCbmpgH7x4cZPv8KGHA6tNQ6kOjSJ?=
 =?us-ascii?Q?Kz3H2YZDNYSNMJfufue6eXHeaCV/idpDBNQJT8/kbY3ZT2EF2nJN3S2LjW7A?=
 =?us-ascii?Q?AiJ3DZTKb5PNyswkOqQJzQdE1JsoqJ0qfT6wrkDrIbT4s4IJ93+S0N8p5nSR?=
 =?us-ascii?Q?1ayAys/Ht/yOKYO2ETPb4lq0yf2DPnvTIT2nhjj7Coz3UPP7BM5xnOz48v2D?=
 =?us-ascii?Q?JD+SaHNau/XBvB6yWOFHvkJQvZBJ9LsvlGTBONijWRMTYSgrj3qFeHOqZNe0?=
 =?us-ascii?Q?ngkX/eg5igH8aDyHtmz40xsK5AO3Hg7Px2W0E1edkZcortlKPAfjCinQvTV4?=
 =?us-ascii?Q?HPdD44rvnPgK2GtoNptz4tVJcbRa/AnL2ZBhJHARKoqwzHQx+NA+EJcqkUIM?=
 =?us-ascii?Q?CnBEor353+0xEWL5QTFFKnXKVLyiAFHfbs+hIAJM/GEC/z0ufgeCb+IRNIE7?=
 =?us-ascii?Q?joZpznjc7EOgo0dXF3oMfXW9Ge6k80+tM/4ug7Nm5xsz0VdF5f/SxtfudWHa?=
 =?us-ascii?Q?eoR+LfKsJBejjVRb73mdMT5wiA9se5vTX51EopA6K0UzmaUSFREEkQqOzNKl?=
 =?us-ascii?Q?c2HKg5hjZ3YtpHK/ePVT+2lboD135tRvBFJs2L/1Ni3fZRticKo15kKOmWyP?=
 =?us-ascii?Q?qm3wkh2/cEfM9lM11t7uTM4OH6ABJu1gPa6reN4XNVx6eMEn6mawa13v8+lZ?=
 =?us-ascii?Q?2tnmMKcc1mGU1z5s0MEpRGH7d86ZvPniYbyqTfsEHd6IY4f9wr9IukkOH3Pe?=
 =?us-ascii?Q?zpgx2xFHAGgxgB7EdZ3gTNE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <10B0045AAB6171489208B99594E145BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9149
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6a2c270-87ae-4c2a-5fee-08de6271d932
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|35042699022|7416014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hk1/yc1DQA5ngbI2eUt5LD1TMqGy0wJJyctOSMNelKeiwTsfVDluMfPGRJMJ?=
 =?us-ascii?Q?6SoBMeS6YGo+TZApuLTxsuzzU/gRvvM3wYXR9MxPmosNEy+glr5wphjnqeFP?=
 =?us-ascii?Q?N2Ut9JR1zs+72efs/unbwbJ6ySBfx7F8tOix6t5yU/7C0xtB7fIl8U/zZTsN?=
 =?us-ascii?Q?bHnrECjeGqoYChnf/0fYYfPT194nBCvlL6K57Ro/crEruAxojnAOlMhWUCLZ?=
 =?us-ascii?Q?Z33621xeAkYWDoXY1VR0iQXR+SLeWEw7CDJpnypKvdpWZN5g6/jKC5YMgF+v?=
 =?us-ascii?Q?SrMAG3Ab6e/vvfka3eq3kHgWbkioIvWGNsV2eZ3j27iHhUweKtnHA7eDh+ec?=
 =?us-ascii?Q?vBX4AuNJhaQUUrK6Cf1oAGHn1p8soEJambxsNHmcPJazf88Z4KcYgPtdC89e?=
 =?us-ascii?Q?h2I2luWGN/xpNeFeyXWElc+/QyP/JUhZHIyrCXT2mUXwoPsFkVIesfiiCasB?=
 =?us-ascii?Q?ml39PBygRVsyGrYXArXSdTKqQV2IH6PR3NnZRHaL2onOGsPhEDnOmg/vq/Mg?=
 =?us-ascii?Q?HMzKxKYmoDNmcGUI1HYfFcq9ARaa8beZoyQPCWAJBenJNUOJcwvh0mRZAqMT?=
 =?us-ascii?Q?lrMFtivDeJp30DxhtVeGm4eIaKmMDqYwwErty6JqTa/dyagO0Iq6j6JCRS9t?=
 =?us-ascii?Q?MPIMUMG/Y7M0+1T1cF1mJBy4AWze/y4/q4zA0U2p6bFwWjTfuEnAZM8yT2pA?=
 =?us-ascii?Q?EPb5la63rWm5erN/RjkAalk06mAVsNvZj7Jd9Y+qNU86UG16GSWeIW4J3mXu?=
 =?us-ascii?Q?SjWKpKLvQTcISlnjnyogTie7ej5c2xeJg9aU9e++kmiAcXg+K6lcsLJ1rluV?=
 =?us-ascii?Q?WYrt181dRpq0o+2p/XgmYIT5i32+cteoFiPLPX4brnUP965QHkDTgi1QxWPz?=
 =?us-ascii?Q?LtRvGMEQ1NgETin/b+B6xczu0qtt0edmn0VhF/awZeRFor9lerawqOuOF+kL?=
 =?us-ascii?Q?p6yF+/jmo9u89aE2gWot7xkfNMXORwTwLJMOSf2yzUcwNBQcWWwik2klIj2L?=
 =?us-ascii?Q?hFg23qFPfZ+3LPHmyUmjlr4tHkb3Xzv8Q7v401mF2hR0KnnDTI7XxpI/SvQ0?=
 =?us-ascii?Q?fqwWF5/JmhNTgcO5pMg/qPADQGp43mof7KtQVS1NYrcR8/0kt4ymPdJ7Lm+M?=
 =?us-ascii?Q?xYgpnDQJSIilmXlVvGbFSeAVZPR0f8USNHsZ07uLCxN+N7E/jfd1tgFUTwh0?=
 =?us-ascii?Q?4N9znj0TOOdV9hiuu6xGTE2JS9qvLTmPePsDY4+/wK/rBnN6tQxYZXWZUWtA?=
 =?us-ascii?Q?4Ko6jLeJUp+q+kV6Afttbtm1UAahYkb3MqPbnZHhE1iUbiHo9VLJzHjVQtE9?=
 =?us-ascii?Q?/LOPHSQboUUwBfy/bfK+8TTlZsw17YPpR3A2W+UuXxxS+bsTeB6WADaLe8bx?=
 =?us-ascii?Q?DN3r7Q0t97R3JmWml/U+1ve7tkPcJY/zqJnRwzsctzKsDsDHatmPjW71GQ/6?=
 =?us-ascii?Q?6ics4bf+vtofHqxKiRbaArOM9zYZ85KTcurGX5pQTlok/IEbC3BIkchdKfae?=
 =?us-ascii?Q?aOWfNu803nkmhO+yQNCDcKvy+is7UNBrasmyqN5khLqRvPpdVMPEZcppJRC7?=
 =?us-ascii?Q?X37APPhEJtbwO5+O9ojCH+LfV3A3ze1PsFvUabJS6PBJ+8N5qp4x/EuBi1tw?=
 =?us-ascii?Q?fqjuNC+skZhEvSV35EvIqcNfGk1kI46J+kYOQ4SbNBJ0OGDx4HhA7fiRWKnO?=
 =?us-ascii?Q?Y3nOPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ES+ieoLD5uUoVz6BKe774jv+TQNngUc/F3XNxshb/bGwCsXU6vRdjKbcUTu6ejA9pFoCEnc1Bca6UTCqgiJBWnBv74HWNfJeWneoyS8EvOL+N15O6zcBDqmrajNFaYE2dIQW9unjdQRooeSVD+9jiIKUu6Zzpq8aq6LHzH9ZKtM83o69lCcGCWTQS+CltVX6tfkuEKJsaYKu4AUoQZTGNdS6WkVJ9wgwS5i76nA4ZdrYatOVemBzVn8VoFxgsyuOz4wTlBmDd0TLf1DVyKY4haW4MXGnVUPnFmiNY97tN0wf0Lgi5P7mSZXfoAaj2vEKOkEJfu6Du7b9C9RtOSDTVv1SqJgNNLY6tVigx86LUaAXp2BX0BUYJeQi38Z6xFptFU79U0fOlPWPT1XSgLFJ3Qw8ZDWCPH9nia0J5SWzcYoDaY2QR6oAB6Vv1aS32fzo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:44:49.4276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb3cc29-c944-4e1e-36a7-08de6271ffc5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10724
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,xen.org,kernel.org,epam.com,amd.com,raptorengineering.com,wdc.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:michal.orzel@amd.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 75BF7CE667
X-Rspamd-Action: no action

Hi Jan,

I checked that xen on arm is still compiling properly with that so

> On 2 Feb 2026, at 15:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Extend commit 1df11ccceb1a ("symbols: check table sizes don't change
> between linking passes 2 and 3") to other ports as well.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For Arm:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -99,6 +99,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
> | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> > $(dot-target).2.S
> $(MAKE) $(build)=3D$(@D) $(dot-target).2.o
> + $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>    $(dot-target).2.o -o $@
> $(NM) -pa --format=3Dsysv $@ \
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -26,6 +26,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
> | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> > $(dot-target).2.S
> $(MAKE) $(build)=3D$(@D) $(dot-target).2.o
> + $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>    $(dot-target).2.o -o $@
> $(NM) -pa --format=3Dsysv $@ \
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -40,6 +40,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
> | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> > $(dot-target).2.S
> $(MAKE) $(build)=3D$(@D) $(dot-target).2.o
> + $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
> $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>    $(dot-target).2.o -o $@
> $(NM) -pa --format=3Dsysv $@ \


