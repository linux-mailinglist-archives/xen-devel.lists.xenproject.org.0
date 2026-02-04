Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB24N51Eg2nqkgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:07:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B9E62D6
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 14:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220511.1529193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncbO-0002NR-Rq; Wed, 04 Feb 2026 13:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220511.1529193; Wed, 04 Feb 2026 13:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncbO-0002KK-OM; Wed, 04 Feb 2026 13:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1220511;
 Wed, 04 Feb 2026 13:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vncbM-0002KE-UE
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 13:07:25 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716ddcf1-01ca-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 14:07:22 +0100 (CET)
Received: from AM0PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:20b:28c::16)
 by AS2PR08MB8575.eurprd08.prod.outlook.com (2603:10a6:20b:55e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 13:07:14 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::7b) by AM0PR02CA0119.outlook.office365.com
 (2603:10a6:20b:28c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 13:07:13 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 13:07:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA6PR08MB10548.eurprd08.prod.outlook.com (2603:10a6:102:3d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 13:06:09 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 13:06:09 +0000
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
X-Inumbo-ID: 716ddcf1-01ca-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vSq2NnEZKi6U56rKxGbRbIA/UNj2qR8nmLTAzi5r84BR6V7gPFaCTDK2hVPLof/93QgENRv/UKeevYs99D9udW9apZdHzIPJTaZRixa6sQ0uj18Pileg6SziowpfsV3m/SI88UE40IH0GzMv6rY94PITAiUn1+GxuxFpfMMteLJ4OwwgNOwl6NMGrJOrl272Akw5aI/cDat61Z9+s1RsXXMWd9oswFgqlTjuht3dLVZL1yyZNbMo5Bj7/z5VgY4Gr8OvnPCH958naDM8aBDbldt+yj5EkE1mQnk2aoDS3/QEWbjIZTn23vhcLvz2MOCIuPkGauVV5w3htmfu9JoP+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yx9EDl3EQbdny2/YxZwDgCujrHswwdDqN94M6sskR3U=;
 b=eC6ITpX/BpPPMQp4FQiXteFdlqGv4GM6PVKienxCuV2LZOV44NoDlh5zCaMtaCLRADPojZq87bfxzt01JpkofNJHI4sIynYaYlEapQG28VS3GfyOLP+H9hs+B7pBNXjvtJINEPV4qccw3eSo5SRqnHHlFppe7AlbrzNiJhUF19mHVkXIgtvkGE/fnB9a/qZ8Sxh3ZSFHcaYBKOtiYxsuqEoRit9ChmSkriCos+qB7su4b0kpk9ss2vRYZZKKFKJLEfJzfW0MiV3HWYUsis5n1fFbFY9zPeI+5B5Gql/xEGQrJa6w2mLC1jlQ7Sv4uCiRnTmgzlrkNV/1kICnj7r8Qg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx9EDl3EQbdny2/YxZwDgCujrHswwdDqN94M6sskR3U=;
 b=mHltmqV7fcTiSFMwsVcpNGKnEnFNgUZDzmsIohw1q8Nf96vHEIcSQ7YSTibERuJnNSzEovwf0pDfZvv/p5ML5v8Fmhqjn9DnXdNqYj1GY31xq/jTBajNw62+oExcOkN85qDMN2k75KR6frmJJmQ2B+/77DMbWG4iKeuMWf6GCrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9quGk0msoQWoMnoRca8g3/n/nQYzmT2yDPn7aX5EiIAxOXQqyV4e+XRmjLjRFSJ+bxXmpMaefQeSdeMOHrlLNjHmM62v+oXM8OLs8jMBnlUZZ4PLwv6m2HKk+49HlE1mK6hSZrySFLThMc81rXpzu/1yvKiGLR1TtHxtZLh+AtQcmCcEvG2vDqxRgZ9IDyCpgOuJQ9L7tx5dqBjgD7XiWIXAs41kpUORhnk8FkHTtK7FEPcVM110NnVcEhnNsPns3Sp18DAm4IxJK5I8NOTbpcFiB8NGq8i900cbAesnTeTW4U7tSuqpn1q1lXQpUSU/f1skVuEGYbotdPlr6fq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yx9EDl3EQbdny2/YxZwDgCujrHswwdDqN94M6sskR3U=;
 b=erBXZvz8QniuuWDUzhFsQPHWzdkFoRM/dudgNz1Mgr+wwSygv783TYysXJ5uHwg5sNam5zOWZPUCGVnZk67rvzdTkDbkWSgwdjhpjd2YzcqgWzLK/XMDlvB9obUQKR15l0QRvTvuwKijJ00ZavHBV5/DdThoPnXZ8s3PyUs9F67GPD4qGB4HMopF+RPjn+vCeQ9aU0hjWN8PXOkttFoJeyYy8EZJvlBHHmWWbdypye2quPkwTBXbkL3oCl+mP8PteDqCWi40jWIGvUIvXtLAOhFUq3MNSVuamENySsz+irB8jeVoc9oN1KmEClBfr++QX7Tta12foz4GuS417xRvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx9EDl3EQbdny2/YxZwDgCujrHswwdDqN94M6sskR3U=;
 b=mHltmqV7fcTiSFMwsVcpNGKnEnFNgUZDzmsIohw1q8Nf96vHEIcSQ7YSTibERuJnNSzEovwf0pDfZvv/p5ML5v8Fmhqjn9DnXdNqYj1GY31xq/jTBajNw62+oExcOkN85qDMN2k75KR6frmJJmQ2B+/77DMbWG4iKeuMWf6GCrA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] static-memory: Fix incorrect tot_size calculation
Thread-Topic: [PATCH] static-memory: Fix incorrect tot_size calculation
Thread-Index: AQHcldPH7zgIlcaC00G2LjzWWwPQfrVygloA
Date: Wed, 4 Feb 2026 13:06:09 +0000
Message-ID: <2B96CE7E-02EC-4FAD-B34F-4013CAFF73A4@arm.com>
References: <20260204124235.134773-1-michal.orzel@amd.com>
In-Reply-To: <20260204124235.134773-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA6PR08MB10548:EE_|AM3PEPF0000A795:EE_|AS2PR08MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d97994-5aee-43c8-ad25-08de63ee502b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?E1VvJfJgPjx+SjvTetXY7/0nUGGMVB791dcx47dm36V6qe+rpAMBb3j1r0U6?=
 =?us-ascii?Q?RqDE64ur0x1UsvyiAs6p57FNBjp/r8E2jABgSQaQkxEoIfo0yGeLEKVeLeUe?=
 =?us-ascii?Q?N5F6PARAszdiFi+iUsVDD4ohZ5GP4HkTA583a9vgggnkWYKXAtKfD5GgLxbo?=
 =?us-ascii?Q?Ic3k87vl/ez1d+0iVDn2jST3ob2SM3yyFfOiDz9TifbOkcM0q3cxu0UAjbT5?=
 =?us-ascii?Q?fls6ALZREM7NibM7+JS84oeL+McfhT/LlUuAbIMIDiV+/dTHr026QFU6bh82?=
 =?us-ascii?Q?VSaI8fCvAVMJAayUQwxV7haGw76wEoQontT4BTLwYbAZ9vq6I8ERdSEOYknE?=
 =?us-ascii?Q?DUnnIsHxK9ab9CCTxaHcf3tu3w7P7U2ZBiraRraX7+LbnON83vZvBaMlHdmh?=
 =?us-ascii?Q?Vt9jQTvHskS7AJlS2SBglXg22ST6H4XvuEAvMqMJWc6ov04X+vwmoVaIbEhD?=
 =?us-ascii?Q?wlOlmvXjl4IaUrwTf8MoBIgcrhGTP2izDAx8WeY+wBzFaOL9yaXOG3qjJ+gc?=
 =?us-ascii?Q?K8fezjd3cMk/lzy/b/SUskpq22KYoxtSEn1hly58uPSgegmorxEwSXFwy9Yz?=
 =?us-ascii?Q?x+JwNgKvVxXM0dzixeQcl+0famU9a70URD/vQE5yb+7I/Dj2vookyv06Xdh1?=
 =?us-ascii?Q?1U5LBoUNW7SOPKAQa+QIVxL0bIFk+62bz1FnpZci+AEG2k+bE30c4M4E2MUH?=
 =?us-ascii?Q?CcEoBizh6I7s7izlGv/RXkfwfQHKjzguS36d6xLDBh5cCo/thVGfJ2hkCLHa?=
 =?us-ascii?Q?uuc8b+2RgukVc0GYapZPVuapENO06Hm2Sm59OMOjMnfnJXzIxsufjyHhdUMG?=
 =?us-ascii?Q?8AO2Cc2EO2K9nHGSU/bVZqqDzGGrFiiCYlEBmq+Q9L5mMhANIquxsZLBq+ID?=
 =?us-ascii?Q?hQvvzJAVhpwEWEyBvi+Unq2jL80NbRhc0EC+vcgai/lWxnVHEMH1iuGdJ0CM?=
 =?us-ascii?Q?Mu+tOVWz16Lzu7DItxxOcpTTEh/o9ZsjkhgH75dj2Rhr1BEwTXmakhV+QF3F?=
 =?us-ascii?Q?tu+7haPy8lE/i6sD3zQRCowE0M7jOxccCHfDfsTvkEPkdWo336BMzzAkW+2D?=
 =?us-ascii?Q?vuY66ufrXshi6yyX0+kE/RUeU2FWuB4JcDF4MAW0OaH+eqUTpPto4HfMjnyZ?=
 =?us-ascii?Q?Uq47k/QHaHyekWixXaBnieSTuHsjIHF13vyE186SWuHx+JiqBb/Qan9TBiLG?=
 =?us-ascii?Q?9UEuvclCEyoNC9sQ4nPCViqVO5IEYzjJ7/7G/VvdHn+IndmfSYm5VWCAX9vQ?=
 =?us-ascii?Q?1GqWarMrHB5y5TiT7RLpZgQlfKmhsiLuOLuIbaL7bo2Hg6BvLZmNykCs4V01?=
 =?us-ascii?Q?GFOPBp4+YsRX7JU7LmA5lBEn/z8E0bADkG9WRJXqOadPgd/vVn+lj97XXs2w?=
 =?us-ascii?Q?kx6ZWxqzDtOtzQk1Ebc2Upognzg2IV65VPz307bvyoYqWoDQFYdxERV3HAPS?=
 =?us-ascii?Q?bkFY+yPObWiLTRiXepcs7IwDCyGbp+9VrIYH9tLw4HCMB5FbRcdU2YWQ0CVs?=
 =?us-ascii?Q?hiRqMV/yzWZ9WQYu0yneFHoXv9JN/+i8xEvDyosbcJZ73qEw7C8zta5oYsBi?=
 =?us-ascii?Q?8IN1TFw2BxV21i+mquWIuvJR2Zp9/odjnth4VPb3uAYRDUcurIrOOW9AWLyH?=
 =?us-ascii?Q?wmMMX4URIVllhntCYG05GZY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C1A38763E75EF4E8C2E25AA8B3E82A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10548
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b526ff42-c4af-45a7-2e94-08de63ee2a0d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q+Wu3Lg2hExRPL+IQi/WoshWFR374U8+HkJm+WRbbHHk+TP5YEAOQDipj7oZ?=
 =?us-ascii?Q?qP38dXW43D5VC6niTrii7mwXi5jTrSJpmpb5yVk5F3uVwzWoewu1f+vFr7AX?=
 =?us-ascii?Q?r2d0DNArJUHJNQyrkxV4RklVWzfkvdsA1jeBaUJu86Bmztek0BXtVZ5zknIz?=
 =?us-ascii?Q?s8Gv6YzWVsGYF4VSeq2gnEGd5TL3LMn+POiU1VuiyN1qAkZiVRuaULalzVyH?=
 =?us-ascii?Q?nL51+H4RJmJBQg7A1u/LAnNVXQBPdIhxkq58Im65jOuwhfZ1p0N2L8MzJAiX?=
 =?us-ascii?Q?44BWXFrnFO1fz2qi7j42BM0FZmRn79oz3XtUN+D9j7OFTHN5NaoISarj+Gni?=
 =?us-ascii?Q?Fprow1/mHbsCXWTgjj+MlI20nhSvxIj7HAhDw0DIZnQt3kENhPQfMVpX5sjV?=
 =?us-ascii?Q?aPdsgJNQXSh+0NN4ZVvEPlhgYM4R36bYGWZHLUxj4Nu0ygOHhyFCniiHRHEv?=
 =?us-ascii?Q?kyylAX2tJZxs4dfZMcHwTV+HiivsMahtAXahg2UaojcOyP5SpLFcI3Bp3IKn?=
 =?us-ascii?Q?A3+Hrd8bWHM7Rv/VO5jR6DBtZtV8Kg4aBOxMtp/CzE52vUNNsgyTIeoVaKQp?=
 =?us-ascii?Q?JHI/Kg3Di3CUnEp812eeRKbigAOEIVTWaglEr3R7bVOtv2eM+r1Iru96D1AC?=
 =?us-ascii?Q?5/V3gk0nIG80PDlc9pFIDh02MTa1bUhN86TWBMILeVUG19VI4/+wRfXMWAOQ?=
 =?us-ascii?Q?qIgvxQ3qEE4LRtHFKuwUPITOnVYmu45CA5qwU7bMGyFbPthQD4NHfm/mkGHH?=
 =?us-ascii?Q?GFQ3HvxBOxtKhRUU4Im4YZjGEEiWCEqbNLL7ixAl7vjfv7MqqF1/agqkqznq?=
 =?us-ascii?Q?2K2xgJWKfQhuyHyWf1hEU0wiyW6btxB+/8UtTmR31XZMv3uL28WYlUqpD48z?=
 =?us-ascii?Q?5/zNNj6HgZd1vEhxrblROKSt+LxGRGyeedlDDHeTYwK8JuGzL7iwG0RxmuTS?=
 =?us-ascii?Q?e/O2FLUNpsTPInWrpqgvyNbPHGqwbjwWydPLtdNOP82eTL1a12Zq/YZmmsyM?=
 =?us-ascii?Q?sDOpbWcwGt5kFOgH3hv40LxzZl/x+hHnCfC+O3uzj/gw5nXSR8VaAbg1NqGP?=
 =?us-ascii?Q?UIZOx4+MJAKTSJg1LPheUcUBDyYEvGQs9qVVFOOIFYtxMfyNVui2X7rr5uoz?=
 =?us-ascii?Q?hk/EDEhYnrr3AIgf5slCyM39QtFcYC43ZmD9sRIekeVrBs10DpJc8vpWyWSu?=
 =?us-ascii?Q?zNO+ZkAREkTPA+XsY9V1ikgamSsc/GIxwgWIq1M7zws4Uj/QNZNwARJyx7Y1?=
 =?us-ascii?Q?WXd29tD+T6CKnE7igfdT/zRJS68q6j3Nykvt8qrcoMl9NHuhrPv0oNgl6vH1?=
 =?us-ascii?Q?m5cyDE8dwzjEhSv/CtUYNvMjPYhjFJIES+jnjP8o8RqpN9o8vR20dIPodQ3o?=
 =?us-ascii?Q?8lZMRFIiBVg21j9Zp+zeb+MdGNPyXl+HPfyFxIscIrlpM00wTM51N3sJ4YXI?=
 =?us-ascii?Q?Znl9/KPHsCh8e9aFyM/M4CB1kDc5q9GnhKyscm9LsFdWqpI07WeJDMAzeKyI?=
 =?us-ascii?Q?Imx5kmUlVPA8sfzweyayHHM+8L8+TLC5Tvq2b0NwY9PCk5OeMIf0djF8a2Ex?=
 =?us-ascii?Q?WlwTB+baNJBI+OXA8YcBq1vflUibP7PHjWpOKjrNXhwWgNFKib/wjbUCrA5I?=
 =?us-ascii?Q?fIXtvM3sTgtFL0JwTESe/klAZGIiUGAD1X8IQhM4jFeuA51aEhz8Ge7IbtHe?=
 =?us-ascii?Q?T6yfew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5U5FMGfdAkaLqB0VuMscvakr/+o+Cryhw9LC8ALSLpninK4gkSKj9s1MTGBmUjTOhRpNu7Gb+nBA9sTRql9OlI2DhIW+et/AYe4bf/Li96UWHoS5QvxTaD7Yqq5hB1Pjo1OIZDl9Qjxr9WlSXRoKnH2Hao1AYmpu9LUrtSk/t6zMIWppmAyLHAO3xNzu11yyO5AfmQBjqfe2Ia6OpDTvQPC+Ltl1KEssmc4eVe3FdjZsnHI/r62mUhIgZdxxIPXocv/oUh7T6Sxdhrto/bDP1J5S+jkqep5VzsqMXpxVrxaWLK9MbhyeY3Ztjkuw/EEoMzFpm46bl2fUKQMIThfFLOwcXIYLiApkdyIOYEQ5l3Ra6ismWpbl9MkHkdxyrUYeD//T6FZbyTvZdkNTXa3RVd5KKnHp9Dq7tIyP0jOLBfYWCdsLg24KOlSEnUDnb1wv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:07:13.0736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d97994-5aee-43c8-ad25-08de63ee502b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8575
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 390B9E62D6
X-Rspamd-Action: no action

Hi Michal,


> On 4 Feb 2026, at 13:42, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When a physical memory bank spans multiple guest RAM banks, the variable
> psize is modified inside the allocation loop, but the modified value
> (instead of the original bank size) is added to tot_size. This causes an
> incorrect total size calculation leading to false panic. Move the
> tot_size calculation right after acquire_static_memory_bank().

Looks good to me.

>=20
> Fixes: 487975df53b5 ("xen/arm: introduce allocate_static_memory")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/common/device-tree/static-memory.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/common/device-tree/static-memory.c b/xen/common/device-t=
ree/static-memory.c
> index 0774d0680604..ffbc12aa24df 100644
> --- a/xen/common/device-tree/static-memory.c
> +++ b/xen/common/device-tree/static-memory.c
> @@ -118,6 +118,8 @@ void __init allocate_static_memory(struct domain *d, =
struct kernel_info *kinfo,
>         if ( mfn_eq(smfn, INVALID_MFN) )
>             goto fail;
>=20
> +        tot_size +=3D psize;
> +
>         printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr=
"\n",
>                d, bank, pbase, pbase + psize);
>=20
> @@ -158,8 +160,6 @@ void __init allocate_static_memory(struct domain *d, =
struct kernel_info *kinfo,
>                 mem->bank[gbank].start =3D rambase[gbank];
>             }
>         }
> -
> -        tot_size +=3D psize;
>     }
>=20
>     mem->nr_banks =3D ++gbank;
> --=20
> 2.43.0
>=20


