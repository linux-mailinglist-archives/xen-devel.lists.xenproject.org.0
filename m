Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18E5B3902E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097205.1451639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQgm-00032z-Hp; Thu, 28 Aug 2025 00:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097205.1451639; Thu, 28 Aug 2025 00:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQgm-00030f-F7; Thu, 28 Aug 2025 00:40:28 +0000
Received: by outflank-mailman (input) for mailman id 1097205;
 Thu, 28 Aug 2025 00:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urQgk-00030Z-Rb
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:40:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95bd4c14-83a7-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 02:40:25 +0200 (CEST)
Received: from MN0PR04CA0020.namprd04.prod.outlook.com (2603:10b6:208:52d::19)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.23; Thu, 28 Aug
 2025 00:40:20 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::4c) by MN0PR04CA0020.outlook.office365.com
 (2603:10b6:208:52d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 00:40:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 00:40:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:40:19 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 19:40:19 -0500
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
X-Inumbo-ID: 95bd4c14-83a7-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGTOm1DaAAGqmqGbF+8krHmyGwQyE7BORi1DTQn7EAn/N+j62NJHx0FX74ywMNRfndrVbRVT1ztgZETYDZ7vL8lbu8lA/VTpxeZPfMouW8fIZ2cSkeW49gHNqYLRW5IRsQThQesJEQw3etpMLqNs7qSt4WLyTgucwtMn9OkkZJvnzu9ZI6NPNiyLBkIjtq4RsD7F0Rv2S9xZz2Xfti+rPKBjS+o6ymFBUpjRPp8bjTKvWCx43C4aDwjr3cCGdi3LQZ8dhew4jjCx7cfNugAzQbHpPbD/89NYN7gbWw4tymy46dLf0MktYi5DrxuLVTGBeaISbjO46/0Ey5onWScwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6LHKjkYLwvIWBYcjiJXOjw7f+H2DQIgoZneHB/DzFQ=;
 b=eQ5NEKD3eLKVWDAC4+c27vMZFEPYk4Rq7Zfje82tWnBOmzS/JuP0GpFupCy/ClVadYLc4nnnCz7jjn4cWP+fjap8+YwAQCkZtD0kI9jo1yKX6/5y/G43t/IkH8NZem1iTaaVcxzLXIGiRUVagT9lfxWVQwo7BUb3IACahLqcrO4DrIulJhuGhJAF0T5BQKQ6p3J+5ebVIFvdmDgQBiN9QdyWxRXIV5l8rR+VYuzThMwMsyPpDhX5f6CS9nlu1Apj2q153bL4OGusmnykUDyGhGMRhtswLb7032seWVdeq3LEIEXdBwLmdHWT/MJhUKGAtI323oxN5aubRaDqOZBWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6LHKjkYLwvIWBYcjiJXOjw7f+H2DQIgoZneHB/DzFQ=;
 b=vW1QWB1hWgGzzlSZMhguufHWZlGnkmhYaMMWBNjxrmvjIcOIiFiEXIniw8AG0TKxvdvZuakq/uYca/dNYv1iXn4r8sTVkCI1zZUx/yAHkbK5QJQklSTGrD+eC9gDovFg1my6KF9A2AlhKWa8gakAycHEKQS6GNetkgg63JikMcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <983361ff-2f92-4c36-96ed-8718cd33b6f6@amd.com>
Date: Wed, 27 Aug 2025 18:20:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] symbols: add minimal self-test
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <879646dd-b55e-4b42-b637-d3b14570b880@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <879646dd-b55e-4b42-b637-d3b14570b880@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 2781f326-c3d9-4972-f424-08dde5cb7796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG8vRldMdVNyRGt1TElHSU9LN0lNcWFKbWpPQzVqNUtoZ3QzNDZTM3NvTHAr?=
 =?utf-8?B?NVhVaXRUZWMvYVNxV3loZ040V0lYemprOVNnMWx5c25Fd3RSOWJOV3JudkNH?=
 =?utf-8?B?elczZUxHT0xTRVV0TlJGZTRVSkxpVTYxWi83WmgzWEVnYWtlaUJzMlBkWlA3?=
 =?utf-8?B?dTE4bGpHTjJSbm04UGFQYW96NENjZVBIcnZ5YlFPajBrZ3h4YVl0K0s5QmNn?=
 =?utf-8?B?WHhuSDlOMWFiWWpBajBJeElKTWRBSzhpOWlUREREdnplQkR1ZXYwQi9IbU91?=
 =?utf-8?B?VmRwaEtjZGhlM0svM1I5RktFQjZmNHN0cE5OeGRGam1MNXpFQTdwR3dBSjVU?=
 =?utf-8?B?SVd6Q3czYjMzSEFrNkdLQUFFc2E4eHlDNEFFU0RPalRzL3BkUWVpclFZbGRv?=
 =?utf-8?B?Rm1hcU0zdHlIdk0zdWwyMUxWeFpZd2RDbVVOdjRaeGp5akhiL3RnNDFOOUZ6?=
 =?utf-8?B?WCs5VEpHaGY3VWRvNGQ3ZlIvU1REb3hQUEFybEdJMkdaVkhQaU55U29hOFB2?=
 =?utf-8?B?MXFSd1NHZGRwVzRIRHVOQXdCSFVJRmdxSFhndjVMVTBwdENPQk1yektPdFpY?=
 =?utf-8?B?RWNSNy91YmdZYzd3WlFQdUJEVlFrTVRZZUYvV0NGVlQ1WFJOTkMwWmJRZEtj?=
 =?utf-8?B?MGMyY25hVklIb0VndjZxTEwxS2tKc0h4NEFTRG1kek5BVnVjbHZObHlUNXZM?=
 =?utf-8?B?T280QkNEVFEya0svUElBUXlmNlRwM2J2VHdaaWNTZmNvbm16QTJ1c1pTWDdi?=
 =?utf-8?B?Y2d4T3BkTUhvcGhFL3UrTU5hTVZkUFhFaWxGdEo2VitWbnV5YkdHb0h3VXFN?=
 =?utf-8?B?NXBUNXhiN0JiZ1BWN1hqZkczQzdBTUIwV2psYkJsTjlWOVE2MzI5bWQ2azVD?=
 =?utf-8?B?SXlGeE1nOUhRQUtIY0pFQmVtRksxUkxhVkJMa3pkdkxFS1BGYU9JdnFXRXRD?=
 =?utf-8?B?YlhkcmNkZ3ZVbzN3aVlJT2YxN2JHZHg2dWZvU0FnQ0hMKzlQZTNpWHFXcU1C?=
 =?utf-8?B?Q0dBMmlqM3dTcUxRZ3FMcVlubFVRVG9OMDNvMUhCNnoyejJFK29xaEprOGg3?=
 =?utf-8?B?czVqRmp5UWNXcHJpYU9OVGFVMG1UYWpZRlB4c2xrQUx0dThTd3c5MkpzSVZQ?=
 =?utf-8?B?bENCTHF6R3NGT1JZTXI5QnAxdWtvRytVVWFPdy9qd1Q3Q2hmbHkwbG9sZ3J2?=
 =?utf-8?B?T2t2V281YXd4NVpkVDZrakRQVHZ0TG5FcmpZR3QvOTFOSkpZNEM0TGg5QkNG?=
 =?utf-8?B?RTRqSnlYdS80RlVtbEtaRnAvUkV1RS9yQ05wS25IUG1pOTZScHpqdkVHTXFq?=
 =?utf-8?B?dlZEOTlEd2NXZTB2U1FORnZjYU9XSFY0aG1TVzRGRkFWQ1lzcmlXNW9UejZ1?=
 =?utf-8?B?WWFWY2ptbEcrNStWSXRRMHlzRHpINU1mMTdKVTdzZlMrbSsvQ2twSDc3dGhs?=
 =?utf-8?B?TllLWm0wWUk2bnFmY1M5dkdlVStTV0t6Zk1YejF4UEVzSGVybUhFV2tNMkx6?=
 =?utf-8?B?U0pnTFNYd09ROTBONzljUlc5QzJkZ0lZcHpvRDNPT2pTcWY5L3Z4c0hBY0NR?=
 =?utf-8?B?WXRvaklJZVhOUlltbzh5WWttMy8wMk5mbVZCa09qc0tQQnA4NjVQODFLQ0l0?=
 =?utf-8?B?SFBBQzhiaUIrUkZWdjg2RDczQ2RpRWFCSDVDZ2xjbnh2L21Ub3RmY0l2TFpq?=
 =?utf-8?B?bTFqamVabWJMd0dETGc0VGRBbTBpZUdvdTRjS29tM1NKaWtvay83dDlFMnZF?=
 =?utf-8?B?Ums5YzdqMldiTDRsanFIWk1EZ3F5bDRhK1BZVjA0SUdqTFF2bjQrZEs4Zlh5?=
 =?utf-8?B?Wm41dks1clA1UStqdDJIeVhzYkljbkRwUGdzYUlqMk9ucTJ5a0VNNUJpdlQz?=
 =?utf-8?B?S3ptVnFFR2p0c29INmt5UXVMZXFuSmdZMlNLNkFFSXVKc3pBY0xuVWZlN0J4?=
 =?utf-8?B?STBpOFp1K1RrL3JvYm1jUU9mY1laWHE5Nk9EcGZnblo5cDAzWVphL1lQZTZn?=
 =?utf-8?B?U2k3alVkOEd3VjlWR2F3VXpYcnJqWnRseWFpUXQ0Z2U4YzcrNmxTUlVmclIv?=
 =?utf-8?Q?bWLd6a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:40:20.3546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2781f326-c3d9-4972-f424-08dde5cb7796
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918

On 2025-04-02 09:57, Jan Beulich wrote:
> ... before making changes to the involved logic.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

