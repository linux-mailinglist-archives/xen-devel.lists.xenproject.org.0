Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D835FC9F1DF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176761.1501235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmqg-0002xw-Ko; Wed, 03 Dec 2025 13:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176761.1501235; Wed, 03 Dec 2025 13:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmqg-0002ww-Gz; Wed, 03 Dec 2025 13:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1176761;
 Wed, 03 Dec 2025 13:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcFb=6J=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vQmqe-0002wq-6O
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:24:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fc2fcb5-d04b-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 14:24:46 +0100 (CET)
Received: from DU2PR04CA0254.eurprd04.prod.outlook.com (2603:10a6:10:28e::19)
 by GV1PR08MB7779.eurprd08.prod.outlook.com (2603:10a6:150:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:24:41 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::2) by DU2PR04CA0254.outlook.office365.com
 (2603:10a6:10:28e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 13:24:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 3 Dec 2025 13:24:41 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV1PR08MB10423.eurprd08.prod.outlook.com (2603:10a6:150:165::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:23:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:23:35 +0000
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
X-Inumbo-ID: 6fc2fcb5-d04b-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BjL+BJSe2MoEqLPACzjnD6NnLkpEtBZExCMDnxdY3qPygWR8wCjQUNLlOLsnq0zxP4BoowGtrrsHGVxSPWEUETdx6YucV6e7j4ytZdUfHHvOmefKteHk0Ops6AbGmLpuh6xMzg0NI+pHzLUWglH+67cB1mBi6sUVevolQ2SvEm33KBcsd34yJSQDCsdBQ48uqKTf+0jDvIeEtHdfG5yxH9G//7ZxH1YKMPIiKcB71OErj0SQSjuD5jswCbTv8bbcrdnyHbD32Idge7JWBMV+Y8JpjHF/wpeVN06P7pcd6YLocOSA0PtrFfCtOk7jrL7DYotnujaRKxFzA0nzw1w54A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvKnCVACC5fM57FYIbW30xlokoXBQ2PBkXaPTtBkJzc=;
 b=lwJUY2MepgM0XlbdivxBQqSpHPp0uZxwLC7cAGsvqEfAaMPexsMBKBTm3I2kZxmA9F5fGRWfnMwVzOLjisRvDVtezg/zku3SlAtMBOf8qV1yn1E64StEGTb32Z5Y833lvfAsHyn6/WK9VSTNPwlsAhsmIk9JZRTy2Z6DR/PcKg3mAtjUGSDMfdr8UCMcN4Z4076Coj+dBUDzYxsVW3cPsFcir4K9I2aF6SLqAzrpvCJUh4N95+ytvPLdNzHMMRCByK/wnjrDzjmftzNiMO3rDE1Z6375tY1BC1/CjnXpwIWRjyXEoBDAw0Z65knztC5zu7YZv51taHplDmEFmXU2/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvKnCVACC5fM57FYIbW30xlokoXBQ2PBkXaPTtBkJzc=;
 b=MeDtkjxiOLKdrrjWhmCvPibhplUTJ7QnswvlGKppra6pwZ+UuEsd71ZNSBCwiCZZ8vv7WgcV4KGoiRklwINqWfjySQASYVNXggA2SXkCREFm1QVPMZ8w2vszC1CY/Y91v2WmvJxBOXDVPPLd89bg9vygGWpDK3SNS3AwpDuw8FU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWmM3ZUrgCPZzdqGanDowpX+Damk6ec6u97RBMPjetJhnlc3/PHMClWh+bEW6JmbSoTYKfa0wnApqV3+EAwRPtY5qcznObE1te/CJ8IlwptFY/2d96pYn1mxVsQfAFn2EL12QXtO1BSX7EDvqfS987mhruA9uyjVZeNaS/nfzeFNpgiGAe+2z7UYzAzAm033Fy6lZ4RqfvqRLjoETHp6zJw4+7n8YGNCcFrKeBhE3fZvU/KUoQtaAM7edx4krUbl+Hj05kZI7he+MtdT0RVJzXSBsDVo4vq32kO5Sy6upSxjE+rlXUcUhk6rOTmW9xJg5PSEZgedaav0IIpKcGJaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvKnCVACC5fM57FYIbW30xlokoXBQ2PBkXaPTtBkJzc=;
 b=lIHu/aMg0P+rxbfJLv+RThhsX7oql/sNDxSXxjkzGvHLCbrACi5E+HVfqAY5HFmSGzoaz6s8W/HL/NyOGtH7K7iYnOXfSTGo516NnWCSy/ncq1Vl6MJoVBfNEcbaGImt7V+nh4RBs7EVIKSKQOYBaFXRUcpKUf2VRLAeITtbsvnuh20PUExfMZQNNHtvYTC+ztP/K27YTPalYZB91OU7oJ2QqwAwYUjYZxGnjFA+oxec44+xOXlbD2AVs1idB+eqNFJvIL37Tgn19afjLXoyocDqcbqB2Xz6O37CyLQC9A6pU+vAOLZnr3jg4GQorfKuhQlTXNNBLDx7XbPUw+z8iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvKnCVACC5fM57FYIbW30xlokoXBQ2PBkXaPTtBkJzc=;
 b=MeDtkjxiOLKdrrjWhmCvPibhplUTJ7QnswvlGKppra6pwZ+UuEsd71ZNSBCwiCZZ8vv7WgcV4KGoiRklwINqWfjySQASYVNXggA2SXkCREFm1QVPMZ8w2vszC1CY/Y91v2WmvJxBOXDVPPLd89bg9vygGWpDK3SNS3AwpDuw8FU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 06/10] xen/arm: ffa: add UUID helpers for partition info
Thread-Topic: [PATCH 06/10] xen/arm: ffa: add UUID helpers for partition info
Thread-Index: AQHcX7X1cV8Oy9wIyU2XZxYHvoEoGbUP5x4AgAAJd4A=
Date: Wed, 3 Dec 2025 13:23:35 +0000
Message-ID: <2431CB0A-4AD2-454C-BFA5-7B26FC219BE1@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <c8fe1053ae135387da8f75f96054f3a6eae3b00b.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44E=+yX5uW_7mkZk_n13GDwP42HGoba2AZesuFEjU8BFkg@mail.gmail.com>
In-Reply-To:
 <CAHUa44E=+yX5uW_7mkZk_n13GDwP42HGoba2AZesuFEjU8BFkg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV1PR08MB10423:EE_|DB5PEPF00014B8C:EE_|GV1PR08MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 14951bbc-089b-4f97-86eb-08de326f50ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dGRrdDFreEtZdHVVWlo4emdvWE4ycFhKTFE5TWlBMHdyTWVCRFlNNWx6UnQ0?=
 =?utf-8?B?WmZURGlKSnBiK254eDN5ZFNETUZJQzh1dnBteWRsRmM3WHNiTFc2VjE5N0dk?=
 =?utf-8?B?MlFlRTZiall6RjhZc0NSL3BmZkZCRWdWZVZPZWRBbnNSZ1lwbDN5ZldwQlJG?=
 =?utf-8?B?ZGl1V3luZXNVZ1crelhUY1g5VG4yU1hXZjdkbmVJVlJnSkxDVjdGZDRPVldY?=
 =?utf-8?B?WnNJMW5sSkFmcGhTL2pjRFBCcjQ5MllodUorbElJczhabFlwZ1ZrQ2YwNVRC?=
 =?utf-8?B?OUovQUVGQ1BGTFhxVktBNHBKcXdZY0NVSVNHRWk4SWhuUzRBTDRua1Rjbk9B?=
 =?utf-8?B?Y2M0MDBMZDIwbndsdWgzcXhLMGxuUXdycWNTbWlnRDVGOUI2VlNXZnQyVVpK?=
 =?utf-8?B?dnRKdFErZVZyR0lKcWlxRm43dDJQVmEvM2R5RGxmU0lSdE9aL05IMnJRVFFJ?=
 =?utf-8?B?QTdtYWVOQ1RobW03UnYzU2tZUHh6WS9SZzJNSUpNQk9RQlc1amdSR3l5b09E?=
 =?utf-8?B?U0F2UUtvWThaZnVFdm83ZC8xUTQ1cWtqRDNQeERYMUY1aCtjL0pvU0Y1bzFr?=
 =?utf-8?B?amdHVTNRejFBbXY3L1pNWnNISjJsMlFjYWN2TVNxUTZwdERXNVFDbGt2cU53?=
 =?utf-8?B?TTRwMElqUmVsc2tzdU1JWnZZbGNZemV2WW5xMllkTFVLY1p6eEhPbVA0d0Fs?=
 =?utf-8?B?d2tUY2VxUFZVQWVUU01adHp2TDJqcmVZbU00MmpLMVorNXlVQVJNVUQ0R2xa?=
 =?utf-8?B?cU04Vm1tbStPTVhEMTlIaU1aQ3ZWOUVudCtJUkplWlI4ZVVsN0IyUjZxYXlS?=
 =?utf-8?B?U0t3ZXlUTVdLYnBOUWk4Q2dzZVBiTVBCZ0pIaFZ4ZGtaVWkvVlZHNkJEcHNH?=
 =?utf-8?B?TTlMZnNoZUxuSzFmVnlFeEJTS2VxdG9udFNiUWc1eDhXNGJIS1l0WmhkeUxD?=
 =?utf-8?B?a2xNczZIV1NVTXJBUUlCTzQ4U0g1YngrNHRvZTl6RXc1S3dmYmJIUTZnZCsr?=
 =?utf-8?B?MlQ4cks2QTllU1hnY2NVbzFBa3BUb3Jwa2tJRjJmWEI0M3pCWnh6Ris2SXBT?=
 =?utf-8?B?ZGhWdko1M2JEY2FzVWVWQlRHb2JXc0ZLaUFpVkpxNm5UREh2eElvaGNkcnZa?=
 =?utf-8?B?NE0yU2o3WEI3di9meE9oZmpoWmZmV2RYY3l1a0I5R3l6ZVpuem4xYWtyY1lY?=
 =?utf-8?B?T09uSDduMUljNWtMc24xM3M2UjBCUVZIcmpEaFI4em85WkZZcFoyeXJNU2Yv?=
 =?utf-8?B?d0IvdnB3aVdRckJtK3FNR2g3ZGJmemtsKytaR0VLcElDcnF1NXF4VnFnUXkx?=
 =?utf-8?B?ZHBHVmhHNDR3clNLWEI0VStWT0tMdERIdGxoT2p4N0Q3Vm5JclhkMEdMTmZr?=
 =?utf-8?B?aHBOdUNWWlRYNzcyWE9wUmUwNVZmM1NqWHR0SEJWLzdGUWUwTnoyNjBsVkRx?=
 =?utf-8?B?YXBKelFwamNUN1haTmxVNHlLTG9oQmkrWENuSHhOR3pzNVYxUERxcTZGWjd1?=
 =?utf-8?B?Sy9TWlZacWt6WHdiVFN4eEcyc2RvZERDczNlamlzVzVUd1VUYTNrN3VPRlN4?=
 =?utf-8?B?d1FlZ3BrSk5wdXlCRFN2ZHdZQmRIUURYTnlxT2NsRzc5T0tKZDNuZ29DY3Fy?=
 =?utf-8?B?QnhkZUswdnJQeks1SkhTZTl5bVYvQnhxbURNUXNkMS9Yc1d5V1NzZ3ZRVSs1?=
 =?utf-8?B?QVVnWkNRNEtQMEUrSFI3VVdQTVN5VzFWbUtaQ2tWRVkxZEtzcjNra0pPeDk1?=
 =?utf-8?B?YXNqTGZ4ekJ6c2g1V0ZseVdPSzA0akpkdVFYczE2YUJSeHdvZWZYelMyTjJl?=
 =?utf-8?B?eGdObHpKOGV6Sm5CUGdhTlRTUENncGJSdmNESWwwOURTemNLbkQrak9SOVl6?=
 =?utf-8?B?ZFJuYnJvMnBRVUd1QTRQVEZwbUUvOVhvbGZibFJTMWhkTlNXTUN2RlB0Rklu?=
 =?utf-8?B?ck9oVlUwY1F0c1d0SHdOVG1Qbys2bkRkcTJlNG93WHd3VG95a0IyUXdGZmRY?=
 =?utf-8?B?dTExajArVkM4ck85MG9BMDRkMm1na25xejJ4Mk9nL2RwMEZoNk5HZ0hwZ3Jj?=
 =?utf-8?Q?62gDn0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B7F1D90807B5C43A59B11BB4053C55C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10423
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bcc43f02-21cf-47aa-f768-08de326f29cf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|376014|82310400026|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWJLbk5Ea1N5QjFkcDIxaDkrZXZvbjk2d1BYVTBIekpscG54dDhoM3I2VTVC?=
 =?utf-8?B?YUNBeGpTOUZkWjMvNFdzdG9vNWo5cjJlV1RVTi8zWTRmeDlNKy9LeVgrMTV2?=
 =?utf-8?B?ZUhkT3Y4bEhNcGMwdXgzR282VDMwa2ZUV3dlUXliTkJndHBTbXpNZENJWXNZ?=
 =?utf-8?B?YnJhTSt0RitEK3k5OVVUZ05NaVR1NG13SWx4WXRWOU1FNWtTaDU3VEU3Q2Yz?=
 =?utf-8?B?VUVXUk5XdWhNd0w4emp0K2c2UzJVZ3Bub2hzS0xJMVdPbjR1S01BSFQ1MUh6?=
 =?utf-8?B?NlU3U1FDY1E0ZUQ1eUxCMHlpR0s3bFAzUGRwbjEwcG1lTW9PcURKckFEVEdP?=
 =?utf-8?B?YWhmZGk4bWJrdVdFK0E2dDZlVVFUNWRGdlEweG9ubXVwNnEzcW5vZ1lwK3pR?=
 =?utf-8?B?clBZT1JRRFBvaGVOZ251MitlSUhIMm1PTGd5cUxaMGZnWGczS01HTk1VL2hW?=
 =?utf-8?B?NmMrYjlGMG1XYndrd1pldktVUEtLVDdWYjFtSFp2RGZzdFNkeDE5U2Y3ODRu?=
 =?utf-8?B?SHBZRDh1T3prL3lNV0EySExORW85Ny9lcmlTbThmcUxRMmdkcCs3MEtCZ2hp?=
 =?utf-8?B?Z3d3TWRCbmx6ZEkrVFZEaW9DVFduQmZEalVYdjFabCsxSTQyVTh5MGtrclY4?=
 =?utf-8?B?bmdTYUx2VzdyOUx6Ujl1V1g4UHNubmZmcXhoVWEvVVorZWl0aGhIRFlia1dG?=
 =?utf-8?B?a0lIaC9HakRkb3FhL1p1VUc2c3pURU5oZGdHbkJQTEFsemJhT0dlOEtXT1BK?=
 =?utf-8?B?WE10MzVTVVBhcXhFak0vcEdDdWpxZFREZHg3YzJ2U3dFV0F1TkxwcmI5OEhF?=
 =?utf-8?B?SldQczUwcEo2dUhTaDU0RTZFVWVySm1DRGl5STlnZ3pZUmxWc1lnc2sxNStQ?=
 =?utf-8?B?bEFKOVFRSWtiU3hZYjNTUklQazZRQ2NkMmpsemhkK3B1Qk5DcGNBTngydHFQ?=
 =?utf-8?B?U2RGdldZNXFLZTNTMUh5Q055MUZaWnNPbzV2R2JtMkVON0taRFJicXJUdGhX?=
 =?utf-8?B?aUJJenB6ZDZDTEdMaEllaW9nRStLNzRob29RTGVSbnhhUG5pdWxkYzlmVkhG?=
 =?utf-8?B?N2E3MlFQM1JMUzJmbUxPVjJDcDIrbnYwbTU1S1RoREx5R3d0R1FGLzI4c2Vk?=
 =?utf-8?B?OWZRYUEwcGRmR2tPaUp1MytWaWJPd0Q3bllsYzY2azFzM2dWTnZwdkZ2b0V4?=
 =?utf-8?B?WnBzTmVwanZRdXo3dnZ0dSs1aW11RDZKNSs4NUx5NHc0K3hPU0xrWlJocWtK?=
 =?utf-8?B?MncxL0xzaldTaS9HbWMrakZ6NWZNdWt3TVQzZVFjcVVXSlI4TnlHMFhHY1pF?=
 =?utf-8?B?aDlFZDZqQ24xZ1lGU2FjOTlsNzFISHFtZ0xhT3dHQ3JrL0pCcTlzVStxV05x?=
 =?utf-8?B?WWp1OVVVaFBaZXNvYUhPSkIwMWx1YzA5TUwzMFlhNkFpeDNCWE1DY2ppMWNs?=
 =?utf-8?B?Q3BmbGVBVmlGMHN4akxleUJnSndCdGdIVjV1WnUzNlBVRUhtS2lqQ0VCbzBF?=
 =?utf-8?B?dzZSWWo0b0NuMUozRENyZ01COVJMQk5JTWcwUG1RZi80U29vKzlGL3hxckg5?=
 =?utf-8?B?aUs5dVNSeEY3dnV2RGJEcDRGZnMvTGJ3QllOcG1HZmdYMVJkbml5cHFEYnpt?=
 =?utf-8?B?Sit3MHIxN0hRRkJ6ckFWSzNVOE1rV1NWZmM2S0g1b1FFN3Axa2RPeDdOcUNT?=
 =?utf-8?B?VkxNMktqa05HTzBTN3cyYTNHcDdLZXRzVGI4UnFZbmVGNkVjOXJuQ2wrTnl1?=
 =?utf-8?B?QUNKWjNQQ3daVndqUktObnBRWTVmc1FHd0QzYVczclJhWEtNSG1TNmkxRUEz?=
 =?utf-8?B?K2krNTBCc2pYNkR0K2RxaUxQaTZWRjhHRG1taDRBejVEWkFZME9FbThmTjlp?=
 =?utf-8?B?YUFRVlVKZ1VxQ1lNNVVZekdWcEMyUDRQU1V4QVlqNmJaWXJEZEhsWnlVcHNy?=
 =?utf-8?B?alB6NkVJMTRSem5iZTV2YTVWb2lGYWlFRm85Zk9jblVBTno2VTFGdDhDbjd0?=
 =?utf-8?B?OUlWQ1RWcW0xNHUwRVJBRnBWTWNJcWhSa1h1NmlZWFJsRHo3WG85UlRIa1dy?=
 =?utf-8?B?WDE4dTdja1BweGhyUDJzU2hMSzNGOFFZdHVSWG54a0NJbU5YZmJGSEh6QzYy?=
 =?utf-8?Q?UD68=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(82310400026)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:24:41.2308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14951bbc-089b-4f97-86eb-08de326f50ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7779

SGkgSmVucywNCg0KPiBPbiAzIERlYyAyMDI1LCBhdCAxMzo0OSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCA0OjUy4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gSW50cm9kdWNlIHN0cnVj
dCBmZmFfdXVpZCB0b2dldGhlciB3aXRoIG5pbC9lcXVhbGl0eS9zZXQgaGVscGVycywgYW5kDQo+
PiB1c2UgaXQgZW5kLXRvLWVuZCBpbiB0aGUgcGFydGl0aW9uLWluZm8gcGx1bWJpbmcuDQo+PiAN
Cj4+IFRoZSBTUCBhbmQgVk0gZW51bWVyYXRpb24gcGF0aHMgbm93IGJ1aWxkIFVVSURzIGZyb20g
dGhlIGd1ZXN0DQo+PiByZWdpc3RlcnMsIGNhbGwgYSBuZXcgZmZhX2NvcHlfaW5mbygpIGhlbHBl
ciBhbmQgZW5zdXJlIG5vbi1uaWwgVVVJRA0KPj4gcXVlcmllcyBvbmx5IHJldHVybiBtYXRjaGlu
ZyBTUCBlbnRyaWVzLCByZWx5aW5nIG9uIGZpcm13YXJlIFVVSUQNCj4+IGZpbHRlcmluZy4gVk0g
ZW50cmllcyBhcmUgc2tpcHBlZCBiZWNhdXNlIHdlIGRvIG5vdCB0cmFjayBwZXItVk0gVVVJRHMu
DQo+PiANCj4+IENvdW50IHJlcXVlc3RzIGFuZCBzdWJzY3JpYmVyIGluaXRpYWxpc2F0aW9uIGFy
ZSB1cGRhdGVkIGFjY29yZGluZ2x5IHNvDQo+PiBmaXJtd2FyZSBpcyBhbHdheXMgY2FsbGVkIHdp
dGggYW4gZXhwbGljaXQgVVVJRC4gVGhpcyBrZWVwcyBjb3VudCBhbmQNCj4+IGxpc3RpbmcgcmVx
dWVzdHMgYWxpZ25lZCB3aXRoIHRoZSBGRi1BIHYxLjEgcnVsZXMgd2hpbGUgcHJlc2VydmluZyB0
aGUNCj4+IExpbnV4IGNvbXBhdGliaWxpdHkgd29ya2Fyb3VuZCBmb3IgdjEuMiByZXF1ZXN0ZXJz
Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJx
dWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMg
fCAyMDYgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4+IHhlbi9hcmNoL2FybS90
ZWUvZmZhX3ByaXZhdGUuaCAgfCAgMjEgKysrKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAxNTIgaW5z
ZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9wYXJ0aW5mby5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8u
Yw0KPj4gaW5kZXggM2Y0YTc3OWY0MTQ2Li40YWRiZTI3MzZjOTQgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wYXJ0aW5mby5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVl
L2ZmYV9wYXJ0aW5mby5jDQo+PiBAQCAtMzMsNyArMzMsNyBAQCBzdGF0aWMgdWludDE2X3Qgc3Vi
c2NyX3ZtX2NyZWF0ZWRfY291bnQgX19yZWFkX21vc3RseTsNCj4+IHN0YXRpYyB1aW50MTZfdCAq
c3Vic2NyX3ZtX2Rlc3Ryb3llZCBfX3JlYWRfbW9zdGx5Ow0KPj4gc3RhdGljIHVpbnQxNl90IHN1
YnNjcl92bV9kZXN0cm95ZWRfY291bnQgX19yZWFkX21vc3RseTsNCj4+IA0KPj4gLXN0YXRpYyBp
bnQzMl90IGZmYV9wYXJ0aXRpb25faW5mb19nZXQodWludDMyX3QgKnV1aWQsIHVpbnQzMl90IGZs
YWdzLA0KPj4gK3N0YXRpYyBpbnQzMl90IGZmYV9wYXJ0aXRpb25faW5mb19nZXQoc3RydWN0IGZm
YV91dWlkIHV1aWQsIHVpbnQzMl90IGZsYWdzLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCAqY291bnQsIHVpbnQzMl90ICpmcGlfc2l6ZSkNCj4+IHsN
Cj4+ICAgICBzdHJ1Y3QgYXJtX3NtY2NjXzFfMl9yZWdzIGFyZyA9IHsNCj4+IEBAIC00MSwxNSAr
NDEsMTIgQEAgc3RhdGljIGludDMyX3QgZmZhX3BhcnRpdGlvbl9pbmZvX2dldCh1aW50MzJfdCAq
dXVpZCwgdWludDMyX3QgZmxhZ3MsDQo+PiAgICAgICAgIC5hNSA9IGZsYWdzLA0KPj4gICAgIH07
DQo+PiAgICAgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncyByZXNwOw0KPj4gLSAgICB1aW50MzJf
dCByZXQ7DQo+PiArICAgIGludDMyX3QgcmV0Ow0KPj4gDQo+PiAtICAgIGlmICggdXVpZCApDQo+
PiAtICAgIHsNCj4+IC0gICAgICAgIGFyZy5hMSA9IHV1aWRbMF07DQo+PiAtICAgICAgICBhcmcu
YTIgPSB1dWlkWzFdOw0KPj4gLSAgICAgICAgYXJnLmEzID0gdXVpZFsyXTsNCj4+IC0gICAgICAg
IGFyZy5hNCA9IHV1aWRbM107DQo+PiAtICAgIH0NCj4+ICsgICAgYXJnLmExID0gdXVpZC52YWxb
MF0gJiAweEZGRkZGRkZGVTsNCj4+ICsgICAgYXJnLmEyID0gKHV1aWQudmFsWzBdID4+IDMyKSAm
IDB4RkZGRkZGRkZVOw0KPj4gKyAgICBhcmcuYTMgPSB1dWlkLnZhbFsxXSAmIDB4RkZGRkZGRkZV
Ow0KPj4gKyAgICBhcmcuYTQgPSAodXVpZC52YWxbMV0gPj4gMzIpICYgMHhGRkZGRkZGRlU7DQo+
IA0KPiBZb3Ugd2VyZSBzd2l0Y2hpbmcgdG8gR0VOTUFTSyBpbiB0aGUgcHJldmlvdXMgcGF0Y2hl
cywgc28gd2Ugc2hvdWxkDQo+IHByb2JhYmx5IHVzZSB0aGF0IGhlcmUgdG9vLg0KDQpBZ3JlZSwg
SSB3aWxsIGZpeCB0aGF0Lg0KDQo+IA0KPiBXaXRoIHRoYXQgZml4ZWQ6DQo+IFJldmlld2VkLWJ5
OiBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4NCg0KVGhhbmtzDQoN
CkNoZWVycw0KQmVydHJhbmQNCg0K

