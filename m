Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1859854D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389576.626591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgAE-0001o9-Ib; Thu, 18 Aug 2022 14:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389576.626591; Thu, 18 Aug 2022 14:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgAE-0001ln-Fx; Thu, 18 Aug 2022 14:06:26 +0000
Received: by outflank-mailman (input) for mailman id 389576;
 Thu, 18 Aug 2022 14:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOgAD-0001lc-Fk
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:06:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60074.outbound.protection.outlook.com [40.107.6.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff4ba3a-1efe-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 16:06:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5604.eurprd04.prod.outlook.com (2603:10a6:208:134::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 14:06:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:06:22 +0000
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
X-Inumbo-ID: eff4ba3a-1efe-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2p1AK7EF62m8OJjrKodptIBCsWiU411uRWnpl/PTpbOJbc1OosTgr4aDUH5s/a/Lf7095k2wusu9Z3ww1OK4PzKrMn2mWmJBQItyGPV3shhQVKmwAZOMaRS9SKwmB5xN8tTfYMVxIJtRoj1trE35qaS6OgbBoDZdzIrtzx2hbezVRzgSPdjhNvfMVGnjhjo09tdeBAHFRY7S5rFaaBGsGayHrna3D3K55Sw/aOCF3nR7d6akCZDedktp94pKWtZYZdKIi36HT/S1Mysp2Kw+Q2Csq4MSh5s6WHb9ebbT2Rbhu3RqHvkDULJPmyXwL5tPlStbETAnyUNyCJzQ6z5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnR5qRwNw6zZzjgoQj3V3iV07Z5cVrIBB47eHQXTWkU=;
 b=VTtEtFfHQBc5dqoXlhMemFEzz0Iy88kt6qAZoAPiO+BGMvABRKUG8YAfOVjknYlQUT+qZwxv1bTfcBHpWUscyjYc9thBIlkZ/WzX8ArjdCo7s2iWb0PaUXNguFX53WMTGBMfbAHyj1VcZ5iYVrG/ruvaYpcqXOzjtjT1CQw2UTfc+6qENYfj7pAfQaR+I+/9YPbBXYkj4xZXeLjmj3STNKY31TdBnj0KQoZgnyvFOmhnnVQ7K6c5aNlA/ByvFBdp7iKWots4y9r7VQugzdx61t6q1LDg49OgNilQrIcyQ/c1GKmdtS9+EFMT4QgG7kZ+5ZpcO6CfFhiSdq6bTYuthw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnR5qRwNw6zZzjgoQj3V3iV07Z5cVrIBB47eHQXTWkU=;
 b=v2rzIDZr4RkND+gkZC+p2G241WSDDWQBQWZgO0V9W2Ox7tdg6Wt/S2BBMJiU7gjqWRn7tuaNuDzvsfnOaKjP3bdxJLur8PLVjO7w4SOlc4L2kC2ZhMSeE/0qQL3Bs5zHaNd7c0TqYfLqAEY0lMGkK+ytQ+a4Qlr4VMi6qUDdnez9HECfhXwXwj1k3DMAo9f3Y3c24x5B0sWanfG1Lt749D/zCSQhXRyCLDkLhZF30xWritiI1y9lmL9OSyBPAT3aKlUURgAKtp3f5sr/zTMY32g9D7KjQbftUY+CnQZRrwtbFrSoVogc7U0QVdf3jHk5kHrk2UPMgeYRYHfXuGQc6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <990f432f-1f40-04e4-dfb9-97c8db679f36@suse.com>
Date: Thu, 18 Aug 2022 16:06:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH 2/3] console/client: properly use time_t in get_pty_fd()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
In-Reply-To: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a469f71f-93d2-46d8-39b9-08da8122d485
X-MS-TrafficTypeDiagnostic: AM0PR04MB5604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m9QSYUQqqNRmtH2JT/1cHGM45G7Vc3qyzEZdiHkJLBSJbah9HRrwllFAY9iOXpPFCAUsfNBU05LMWWabzsXteTnL0r5o2ikYrjhnjFGDoh8WZqzRYXG5/K6/UlKc+DKkxOUDf6NgUV7c28y4xlmOSLmomeZsVjRfZMLl6rzL4O/0yuX3Q6Lc3LORssIrTaatzFSHbDYnk2cJS8GernNviRJBvYSAW8IQwF2mSsi1nJm8UV+E3/ps41qiRXaNwokKBrg9ZVzn4uwswyAxpcsCV5dTCVfjRpkbtudUF3zApV8gUCMFBM3WZ0sYvCqLKpU988GimiSHQOTOPUcU+OZmK5ck4kRF9JGeITPaSUgnHxv4NNL5MUgQo2cT2G1Xxnzd6fB2LJp4UldUTz5eWrICRJ6YVWUh8rQWH2UyQJ0K/pnLBRF8AqN9qNL4NoWVyYwkO/PNcMe9+Jd3HWBmOx3+npekAEYK4852nFcPvlGKHIPkYhHs16TQsKTmGp6N8CQWtlVW5Gxh3CIML69OrURdMEYdR7mdDpP4qU85x7XcRwD+YpB8Z6g79oZV7VNNLWPk9fE+Il44Njq6LAYiuPB45W7crNz58hx04FRGw4deT6Raht4ATtK843a33czBg9lAj6rSlA3xltbMqeL2eDWHbOVOua90Eh7HyqZqTbUngL1AKjFUoE5YPjgp4gZ4Z6wPXNmxN435wZiWYFceo12preE5A65LqeJ555bn6UwO2LGDWWWAwq0xvRcJYE6tbYpFW2TMdofIsEWnhs6PBDFXixCVdawRLZpvnWXNmMC8r84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(39860400002)(396003)(376002)(6512007)(4744005)(186003)(6506007)(2616005)(26005)(31686004)(2906002)(5660300002)(8936002)(36756003)(38100700002)(478600001)(66556008)(316002)(4326008)(8676002)(41300700001)(31696002)(86362001)(6916009)(54906003)(66946007)(6486002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0hvYkRtR1Rtdm94Q3dIMHlmQUk2WGJmTzdvZjRYSWVibTVJWWROUXZRbGl5?=
 =?utf-8?B?aFVaNW9HSHNLb0JKTHpHbU0xK0lvTU92eFV4NEdmcjVQSjdka1BlTk9wbFJp?=
 =?utf-8?B?WGRGYTI0dzIxTlhGcnRRYUhydnJiaXE5dmpHOUZpSTQ5WkhxZGhVSjY2di9h?=
 =?utf-8?B?cEhDY1c2N2NFOFBiRnFGUG9DS3lTL3lGNXR0VWg2YkRCYmpWVVBzbklDb0hF?=
 =?utf-8?B?R3ZCWVkvb04yTDNtbUhXZ25WY1dKdnFmSmxkK1FWZVErTTk3YW1wM2NzUjFC?=
 =?utf-8?B?YS81aVg2SGVyVkdHN01YbkZkUDA5YXVwVlA0eU95eUY4T3M5OXFXU3M5MDZF?=
 =?utf-8?B?ZzRjOUdtUFhKT1lGb09OdC8xY25wSExoYjBoOHJpTU5HZHdNU3FqTVJkclVa?=
 =?utf-8?B?MUtOV3VucjhlT1NtcS8vd2Y2V1NhbGdQalFmQmN3MHpxZ2RoV0s0OGh0ZWUy?=
 =?utf-8?B?eFRIL0RtQ1NmekRwZW55NklZeW15VmdXWnpaSWxCRjRsV1R3dWdOSzZOOXdO?=
 =?utf-8?B?Mk5VQ1JwdHh3MURjRFNUY2U1VFdodVZvcVhXTzMwZS9YeVR0QUN6emhpSC9j?=
 =?utf-8?B?UHB1RHJtODdZVnY1YXJwZ2w4bnRNSFlyQmJCTXVJL3J2eUdYKzNjU0VGT3Rz?=
 =?utf-8?B?T0VuSmgraXFqRzZxUHhVbDJKRXg1RE1TYVZXMnl0bFNkbTd1UzBra3VRRTRC?=
 =?utf-8?B?U1RDalU4emsxSVZ2eUVwVXFndk1Hd2N6S1EvNU5pSDFyUnorTTBFOFNlMDlh?=
 =?utf-8?B?ZXNzWUtFenZFaUd1WDA2eXZScTF5NkpkcWp6NElObTZ5UVpReVhCNjhqUEhz?=
 =?utf-8?B?ajhYWUJMb29ORXlkVWFaMTNlZVZMRHNHY3FTWFBTYUhmUU16aEtqbUk5YlUw?=
 =?utf-8?B?eFI2Rzg2Vi9Ba1E5OXlQd2V4b3p0WVVoeDhqMXRtTC9qWCtOcHZuOVhRakNV?=
 =?utf-8?B?QnFuK29QZVJWcVJYQWMwT1BUb0R2NVZZNE1HMUdPZGNUTDF0UzVIZW9kb0Zr?=
 =?utf-8?B?ZlF2Q0ZiQm5KWlhOcGxCWGxZRlFnN3RvN0JsdHFTbitzbzYvemlNZWx5ZkxD?=
 =?utf-8?B?WW9QSmU1RHNXaFJURmw5QTg1azIrZGR3bGliam0reC9WdTNLa3FMS0s4UTFE?=
 =?utf-8?B?M0g1VXEvVVllNWExVFljODhCU0s4bG5sVlFOTG9XLytpSTQxMGtXejdJMXh1?=
 =?utf-8?B?b1hEU1RPN2tIaUZXN1c4dWd1WHlKWDBGYU5nMXNTV21adXg1eDg1V1ROc1hQ?=
 =?utf-8?B?T0RjVGJxTDBTbjRRTVVYNDdlQTIrOFBWb1dHcHAza2JtR0hsMStkNFpJN3ZD?=
 =?utf-8?B?Kzl5ZWtheG1ObE53TXdWR3RFZklFWi8wODJSdStyRHViM0s4dXFqNE4zSG9z?=
 =?utf-8?B?Nm9Gc0x1d3RvUktzcDhhSXhWcENrMGhNbXZLWHpmV0VCMjJWeDBWV0VyaFdq?=
 =?utf-8?B?SVgycHU3cGxiemZDQW8yc1krd1pwMEZBU3Q5ZlJaTC9FdGUwdUpDRWVPb0N0?=
 =?utf-8?B?NDRPMEowVE1xdDYzK1VHaFkrMFRsOWE5eVA3SENUbHNCTE9WWmFKMElUUXVy?=
 =?utf-8?B?Qkl5blViMkN2ZkRSc1B2Q0tlWEhDU0IycmlRQXAzSGRrRWpmT054YUtRYWdv?=
 =?utf-8?B?ajlrWWJ0YzNTeWFaQVdWeHJGaGprejFJWUh2M0ZWWTJpakFjbmp2dHZjbFlO?=
 =?utf-8?B?RXVZWlRTemhIWDJ0V0JmMW9reTNtMDNHQzJ6bkNpRHgxZloreC92NnlTbnFI?=
 =?utf-8?B?aCt4OVZ3cVpJelMxT2xWZXQvYTN0WFBQY244UXNCakhmKzc0VnhQQkExd0M0?=
 =?utf-8?B?M0RDRFd1SkNKOVltTmhSQWFLVTI1MTdUUFpxQ1hRTmp2R2RQMWN6THordVdP?=
 =?utf-8?B?K2hJanZhUzMrZDNsbkduS2d2S2JxdzB3N0pTUmgwUWllSU5Cc0RmVFYycll4?=
 =?utf-8?B?LzRobHBzcG14L0piVFRaejF0QkhaWHgyNlJTZGtaZDlPR2pqMmVoRmFjUVdt?=
 =?utf-8?B?b1JWMmwrWFVBb2JBWXFKT2RtcWVhQTV6NitrNWFHNlJiZkN3bjZNajBZUFBS?=
 =?utf-8?B?cHUwR05nRUZYZmFXenl6U1FsNTRRWjRCNk5nUmQxUVlzclFwUHhDTzVYQmw1?=
 =?utf-8?Q?/+kPZUlafCm8IH0LmZmwBrA2b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a469f71f-93d2-46d8-39b9-08da8122d485
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:06:22.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lu3Djgy/iOsxgcPAfaCQ0Ohm9QBFJlEbeGmCz05x24uexNV5VJhkni7eAtcIKLAPCMXZ2Yj0uv57YILaI1OwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5604

"int" is not a suitable type to hold time()'s return value.

Coverity ID: 1509376
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was on the edge of switching to using difftime() at this occasion as
well. This would then also allow switching "seconds" to unsigned int (or
any other suitable unsigned type).

--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -102,7 +102,7 @@ static int get_pty_fd(struct xs_handle *
 	struct timeval tv;
 	fd_set watch_fdset;
 	int xs_fd = xs_fileno(xs), pty_fd = -1;
-	int start, now;
+	time_t start, now;
 	unsigned int len = 0;
 	char *pty_path, **watch_paths;
 


