Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGnJHfqNiWnP+gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:34:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6710C7BB
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 08:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224978.1531430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLmV-0003PL-8X; Mon, 09 Feb 2026 07:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224978.1531430; Mon, 09 Feb 2026 07:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpLmV-0003Nu-5k; Mon, 09 Feb 2026 07:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1224978;
 Mon, 09 Feb 2026 07:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpLmT-0003No-ND
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 07:34:01 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3301312-0589-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 08:34:00 +0100 (CET)
Received: from DUZPR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::10) by DB5PR08MB10021.eurprd08.prod.outlook.com
 (2603:10a6:10:48e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 07:33:55 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::7a) by DUZPR01CA0001.outlook.office365.com
 (2603:10a6:10:3c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 07:34:01 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 07:33:54 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB7511.eurprd08.prod.outlook.com (2603:10a6:10:302::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 07:32:49 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:32:48 +0000
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
X-Inumbo-ID: b3301312-0589-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=onGOLfhiI+tCH+IXFWPAC9uKvYN6JR3DwM5KV/D/b+AnOKO4W43/PrxmXmcRXnj57v2kkjSuWShC9ZP810r6MWBWNlWO/f1chg0tfb8zbbBH/woFK6OP5Uw4AnMPqjcbSqCKWrRH2VSOZlVzCDJPecKLsckLP/VYaF1iu6z4YvpQvjsOu7YHMXk9lD5ftQQBZH7RZd4/wrkwqfiXKo4QKPRPqPC1IrdaZIMZDsOnnTlVcJpr487NB0/KlEbYfs4/ibRaLdS8OQtkrQP+fqtKa/l6qdaquQrT8hclzTacCnZq9yIDrWrQC+HxIae8LbnDG0OyhQYwfb+nOPl6Hos75w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU6iU7TVAipAA7AwrQax6FW39II4FKbKIOedNurUUCA=;
 b=wj9dgiDByHXAn877qgfQvUQwFcdJ1Sz6qZX3BmWeHk+CU+7bYQuyLfxV6/MY9wnGbZlXx7g4MHC/xxqJ6HrPa5dIDjnU6xsf4/LgSUkjbGlh7GePLtKbvfGJ4n+UYDDT5tzkEJwKy5+u1uNDQ8fZw3xIMXSGls0k4BX53E1zAAuBKnpLE1MqaNoorH1EZmT5NnTx3BrQWKoc2nDVS7Ec2CrVH5/EZJB11XFzC7VHscVjxJPU6jWB3RncP8+UxZMkzI+BKG2N5R4h8xLDyCR7olvEJP2aoTRB8rwKHFk2Fd6YJp4TlJwhV6sy/1wSwDNTo1F1/PX4zstIzAPI+fEsZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6iU7TVAipAA7AwrQax6FW39II4FKbKIOedNurUUCA=;
 b=A+fjqeiOVo/oZZSrZlSprwah9CtNKshLhFEQ279iJfXUGbg598YkB+M9iuY0CPL3QsqMp3YGm4IZl20XHfdqeCQmnaLM10LajLrjJ8X2ZRsTfgKrGOwZXNHI/RseX8Ti606CgjpHit7Y/MK39PbDP9veV9bnibQ/izZj4wA/VdE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxgAPjoe3kTHLu+8QXXBG0AswCrFvIY6jWkMtvTcq6qradS6hSV7//0U52ljt7HjUIe/W1D2SL0E9Jh8MZx88H78Tmk9su3pJ4iWjH5v95bK1iHZ+b/ti2YV5e2ldMA4RgzdB6pKgZVQik4ZPIdlDX0XFepxoiWiegvRjn1nSaTXTSpCczWskqnbEInKJRiyF0r9DWDfjNN8aM4P/Z1w3CGLoNlxqEFiAJQSQJMN1e+kXwtrXMAljWfi9MDkLwwwNgz3cEvHmETtlAtC2PylRuIhIj6nVW4LeXQ2gRnOHL4H3oQTtpk89Z2deni/YQCXlTmr50rfA+4LwG5mCiFUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU6iU7TVAipAA7AwrQax6FW39II4FKbKIOedNurUUCA=;
 b=ptHOpZT6kwATRJAKvTnz5BP3n9uR6qMlGrVlxTxWVL1QvLzamDXfXAkktx0JKpXASX8nYCuwArmkC8l0Ko1AIvUOcXy84qkvOHXzQsNke6FPTfY1wzpYRsvEyQEMAnftGlR3/Ua0H0Gir+EHF7HTyUkkp7RRUW2GmlVFu+bkcvA2NYOhZf9ROvue7FzAshcVnSU5fzqlZPynLGAHYfsO54ni06F0tcTV3YsD7fBNkQmuFiv0WIvhtE9dG8bUKs0f626EDygpsiuml48dAGgNRte82hVgxcfAlGjRuxmG8ye/hKkMSDynw1kQ2KfTz7nP1ooE+HEuMRlBs0S3CJwdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6iU7TVAipAA7AwrQax6FW39II4FKbKIOedNurUUCA=;
 b=A+fjqeiOVo/oZZSrZlSprwah9CtNKshLhFEQ279iJfXUGbg598YkB+M9iuY0CPL3QsqMp3YGm4IZl20XHfdqeCQmnaLM10LajLrjJ8X2ZRsTfgKrGOwZXNHI/RseX8Ti606CgjpHit7Y/MK39PbDP9veV9bnibQ/izZj4wA/VdE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Topic: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Index: AQHclpNk83RtAc43+U+zvyNqPofiH7V4GlYAgAHjLgCAAAC2gIAAAScA
Date: Mon, 9 Feb 2026 07:32:48 +0000
Message-ID: <2816DC31-36BB-4D13-AF96-19FA72940FE6@arm.com>
References:
 <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <13bee33c-43f7-490a-b1be-85e8cc5e0fdd@gmail.com>
 <6285DC05-0CE7-49B7-B394-34D0872FE551@arm.com>
 <44ecfc7b-a8dc-4e5f-a084-a63caabf9e91@gmail.com>
In-Reply-To: <44ecfc7b-a8dc-4e5f-a084-a63caabf9e91@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB7511:EE_|DB1PEPF000509E9:EE_|DB5PR08MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: b95caecd-d533-46b0-3c6c-08de67ad945d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?Y6AcMs0HAVRo2j8uPVUgmAgCtR3J6j5G7pzU7WPabkNJO6bYwjYvxqYP3P?=
 =?iso-8859-1?Q?2y8beDJpE9DvMQtvnjK075TmvdkDEdzR7wSPANNMjJohe9CmB/3XUYEZF8?=
 =?iso-8859-1?Q?2q+YJvSS5mGSo/UUZQ9qMQjze7/Nma9mxRPR2R7tynZP9OpdwopyQA4Ram?=
 =?iso-8859-1?Q?bB+5LjiybDt4VRf8k4534ieI8CG+7F/xy8YV/0ey6mFvBr2nIhEimgkA8q?=
 =?iso-8859-1?Q?APP8iAlvZ6LCKSSnheWVjEJWbiZ3fBBMSIrpL//9nCIr2tiVgmRgYMSesm?=
 =?iso-8859-1?Q?uHwk8VmhnO5viUcvXRlHp/CufiN0lW71N+CiH05irfp+TaYtq774BNjqED?=
 =?iso-8859-1?Q?vlp4ZG28b0+nzk7I+Hbh2a6qotxLJvzKxFJeoTSvfedcXFieEZP2C+Sg46?=
 =?iso-8859-1?Q?IS1vFtupOURwcENYiRc/swcCLKth2y9huMs/CLassdrb8d98SnHQBrQ3eO?=
 =?iso-8859-1?Q?wfqM2x/Mh5YggrSbwh0a13szw0ixGf+Pkyd8jsxo2YPDI3n0EwWjbjzOCI?=
 =?iso-8859-1?Q?DncqyqZXy8y+kNPXCmjdzn3Lh9oWw+P5vtkycGuTO3/vS1LjBtpsDx01V6?=
 =?iso-8859-1?Q?d63T3xVsX6UeM6QmgxDcFcx5CM8kP3UILDxH7lSImm9wHz767VuzkWN1Pl?=
 =?iso-8859-1?Q?usF48SYB7y1LSBOW0YFj7I++SxbIJR2wrVLmcIoayAddMXYxVI+wu/XWRu?=
 =?iso-8859-1?Q?BxMmR3V0Qilx74+Ot3C+bKTQfbPXjDPmA4j2DMnrJ74rLmlDtb6wpBv1QH?=
 =?iso-8859-1?Q?PzYAfXhohsTxkX41eBysxoONM9bpLQqZa5pAmO4Tf+0lCTINQYtBGDa69l?=
 =?iso-8859-1?Q?bqWY/GbjaUL1bp9u3nGCsJcomBdBt+SkDBUIafXjP9fhxhiff+iCpDbeGq?=
 =?iso-8859-1?Q?y3/pYGVVRCksy6NDd5ubyEGjvL4xlDYm0f1OTCu3eEjtYaxFv8XbSryybY?=
 =?iso-8859-1?Q?DnQj9/XsiC9dzbOAgfe8kW4paabpsP0ZDPUD9snB8C2b9uwun9YXoU5auT?=
 =?iso-8859-1?Q?gpdndsST1zC4TlmIppBZuKXMVdWXaW6venlO1Ce8/IHXAJs9xhNMwCbfo9?=
 =?iso-8859-1?Q?o1vUw7CQd7FZ+hY+pZU8VghHQ5lXep1IIVw4iuLKM9kIKl6nq02ImL6hB9?=
 =?iso-8859-1?Q?pzqNa+dlYvb+1gAOMpB3JU7u1nS8K4A6v9QYLSadkdT76g7O13t01Y7fBo?=
 =?iso-8859-1?Q?nVZpaFSPdeSDVNGaGhCODED+7/F/wK2ihDoWlKuCAQA0aNcRJO2NCSw8h6?=
 =?iso-8859-1?Q?Ydg+rtU+Qjaaa8RrZozk5sbjgetPXbhJLHl2+vy26q3ovNi2JTYojA30YG?=
 =?iso-8859-1?Q?OdeB4KwKo7t1IucC52UpafpNc2bcrFMdUPQNDDH2o23nVdSRmTvT1pQJv6?=
 =?iso-8859-1?Q?rjkh+3qwx0cWO7Wvp0tbwsAs5KlZ6IH+LgfxyYlhIMqZSMqg9MyXRGhe4D?=
 =?iso-8859-1?Q?rHxz/7fSFacJFEmCArbqu62gJXpjfrKC8GZg2znB6BHZv/74csVyIknrsv?=
 =?iso-8859-1?Q?tW5BLwTzNEGi6ZALeRJfI0DFKM0YZ9LorSrNiXgomwvO/8618g+ZCzyp0d?=
 =?iso-8859-1?Q?6phYZfy2ONjCQUkpOTCouAiDEq/IzhPqLJIc1CpRX/o+W887LPj3mBjY7H?=
 =?iso-8859-1?Q?b3G1ogfOJZtUKN9b60Fhy2R1xeYkk6QX9eJx6A8SgdBoMCNYyVXgMVblPy?=
 =?iso-8859-1?Q?2mQDPb5feE9501PjrDE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F4A6E712C3E0E5418BB82684A17BEFE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b624b713-6ca8-4230-388d-08de67ad6d09
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|1800799024|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?nP5Slf55dwIP5Doiby8K6xHv4cf6OFbaGgfxB90UEv/gf5fZMdGyjO/+/X?=
 =?iso-8859-1?Q?BArc9m/NZZnXesN+1k0ndc42rvB3sdcXM/5DksCjnrrytBB40uxZNUY2D3?=
 =?iso-8859-1?Q?2ed5WAI4j4i3X0Yji2mfN4NqTdkC4kbGuQVAtwj8d7mdBOrszeSWIBGUV1?=
 =?iso-8859-1?Q?C6twcH2Lvhc2m7U8Kse7fe8LnJdp9XIb3g4C9qqZ5+YveBohHMr8NOWI56?=
 =?iso-8859-1?Q?bx8KJ7xVqqxM3kS0n1dwRKDtWNYUsBMDQGzRxUjZ7p1MHmkSgSRRoB0aO+?=
 =?iso-8859-1?Q?2h0NLRCmdWGcRJVZv7wv+6AmZWWQegSB/Y9RDwZuPriMwPFo60YV1ey2J4?=
 =?iso-8859-1?Q?TF3qgTtXGYkeLHOjD4PVYSxiN2N68S4Kvs3wnWVyWCZ5Ye3dWwMTN2qmsK?=
 =?iso-8859-1?Q?Uz3SyPipvcaRvjjMNOvWeRotHWTxcYTsrKnbKejyXESR8f/okjqYlRtei3?=
 =?iso-8859-1?Q?TkmXmltgMFfMO1okCYI6Pu2oiyjLY+gxaUvTv5OZxG4WejbCxUOriG1E+Z?=
 =?iso-8859-1?Q?Qb/y3pYwXRwuAlxLbAp7hjWCQudl19UHNpTFPQOl+Op5uH+94pm2KZ+45k?=
 =?iso-8859-1?Q?jddbGiGb8YoubrLhkDJer/DifDVp5tTaysrUawUuMZbm3WOwDHnTY0i5xG?=
 =?iso-8859-1?Q?1/ZPsWxyUbSlpVfGIx0kLMVXsG3MkeCyIepSSMSayPeWhU/sDgICiAkuqW?=
 =?iso-8859-1?Q?jjR7yKTuyb1ohHnI4ekRqTlCLfWm3UnJkOTsVQxibv+6W4IMdDu16hytLo?=
 =?iso-8859-1?Q?zSPCKBHKjGs9Q57VjQJMAU+WVTMwM4Q0+boMebzjBczjtmFysf3+sJU3z9?=
 =?iso-8859-1?Q?XBEMxsNf8Bt+H9zuMUU2u6g+y7xCw3xoiq/N0QNir75Rly47mixP43bbkZ?=
 =?iso-8859-1?Q?u3vPK5MIhbTu2paIxtFjnNYcCKlVKcM6LJ4nruIwgCvzgDoRVmX14uj+eF?=
 =?iso-8859-1?Q?z4RtzxGAhuTCGHYAgeplOmGei3Cu6tYyhOWfUPcf+jHmxO423i/Qb6lr/H?=
 =?iso-8859-1?Q?JLGbwc2fO9/OT1uhkhpVvWRvy1p5cAI/Px1NLEtORDhwWo2bOSPqU13Ehc?=
 =?iso-8859-1?Q?PkeBJcyrprLsqrtRwx88lRtw8mrsv+2NHIC22KBHfShx1xC5YYme+Fy820?=
 =?iso-8859-1?Q?vubp8Bi9RXINBrbqyhnyOzeigVDyn/C15ziLXwosOjWUdF42hPocOhCO2M?=
 =?iso-8859-1?Q?xOdEmsfwdCINaw7msBz+eO9hbKrhbcD1yhFebb5bm0NZSSHjyBKOlkmywB?=
 =?iso-8859-1?Q?kGn/y0N077EbrgBsnGXPquzKj/E7LnxNZ9CCCUhFBwq/G0YXAcClxVozLD?=
 =?iso-8859-1?Q?YV4TAnQfOmQ/dE7RK0qWspZB89QWd1YxC3YKvUMWvJ0ZEBI6vunbEycm+W?=
 =?iso-8859-1?Q?3k8wJqF6cgbFGjl129XOnuUO4DfURpV6ZopWg6v9yPT8RBpOD/szl3CuBM?=
 =?iso-8859-1?Q?sO3LLQ6MTkVLyQYG0wvhBFGy15j5zk9Ue2hTszNdC79q2tqANeJMfGQr34?=
 =?iso-8859-1?Q?s5fjAyGgcxkQbUM8ksVJfE+aPV2ftQWWzgE+3q7pUkM9CmKA6+66KZ9F/g?=
 =?iso-8859-1?Q?//v4kK52pwGkunvPco00NclLQlmOYs6m2TGn4O6j8SxddLz7W+kZdAK7ku?=
 =?iso-8859-1?Q?H8A3kBBMh3ClGSPeH7FkVyTMoTj6DVn0lCwOhFiYfPhd6l7lMMzxmJzW/u?=
 =?iso-8859-1?Q?U+TnwIUdj8YJbkUq6q8AxYaryvOZpX0e4Ao68B0AwCuOSgfK+DVlS2errZ?=
 =?iso-8859-1?Q?+3Uw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5fYVaK1UBSz6kKRejT400hFTUJeTNdUcIy/rxRAywPISKfm1wpux9DCzkwmRX2QXr22mIWsx4EDKhN7XyNYBDk4FZU/P0pYDPlr0Qh+wMtPP6ARBKAW9JIzG8YuBjD+10KdCm7tfz5eF2NFcNHeSDIW+JPdVjD/Lhywc+TKjOHtyZ3RIcj51L1C+HPp55NuZKp23mN6yTfB2ei98mPc2jqECGeBaSKK1KSBr7r+Jm6n4bKSJ2e2l8s6YAjzDxJ2d+ZiEhMvzgkK2KKEcw3ObPgl7tXhYLZNR01go3Sn+aXktntxgwV4GMMDStSWfNLEjzHq3Icv6HuBfpwMjF3FFcAo3aGF4AASh4TOfziBDOiSqSLFbdqenNmt60z5o8XucTciCmo/6Va8bEJaP4DI4BRsLioMijo/mWS1P80cTcC961iBCkikWwh/JNiotluDJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:33:54.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b95caecd-d533-46b0-3c6c-08de67ad945d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10021
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darwin.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B6B6710C7BB
X-Rspamd-Action: no action

Hi Demi,

> On 9 Feb 2026, at 08:28, Demi Marie Obenour <demiobenour@gmail.com> wrote=
:
>=20
> On 2/9/26 02:26, Bertrand Marquis wrote:
>> Hi Demi,
>>=20
>>> On 8 Feb 2026, at 03:36, Demi Marie Obenour <demiobenour@gmail.com> wro=
te:
>>>=20
>>> On 2/5/26 06:33, Bertrand Marquis wrote:
>>>> Xen does not currently document how to build the hypervisor on macOS, =
and
>>>> there is no Darwin configuration for selecting a Homebrew-based GNU
>>>> toolchain. Native builds are not supported; the hypervisor must be
>>>> cross-built with a GNU toolchain and GNU make/sed.
>>>>=20
>>>> Add a minimal Darwin.mk which selects the GNU tool definitions used by
>>>> the macOS workflow and point to the build guide for required tools and
>>>> setup. Document the Homebrew cross toolchain and GNU tools needed to
>>>> build the hypervisor on macOS.
>>> What is the use-case?
>>=20
>> My main use case is development and testing on MacOS.
>> I can do a lot of stuff by only recompiling and testing the hypervisor w=
ithout
>> changing the rest of my test environment and being able to do it directl=
y
>> on my mac is making things a lot faster and simpler.
>>=20
>> I have been using this for a long time and someone asked me some weeks
>> ago if that was possible so i figured it would be a good idea to share.
>>=20
>> Cheers
>> Bertrand
>=20
> How are you testing?  QEMU TCG?


FVP that i trigger remotely, qemu locally or remotely, real targets depends=
 on what
i have available.
But while on the go, developing and testing compilation locally without eve=
n testing
on target so that i can later trigger on target is definitely very useful.

Want some tips on how to develop while on Mac OS ?

Cheers
Bertrand

> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>



