Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776F582112
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 09:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375928.608417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGbRb-0000d5-Q2; Wed, 27 Jul 2022 07:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375928.608417; Wed, 27 Jul 2022 07:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGbRb-0000aK-N3; Wed, 27 Jul 2022 07:26:59 +0000
Received: by outflank-mailman (input) for mailman id 375928;
 Wed, 27 Jul 2022 07:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGbRa-0000aE-Az
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 07:26:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eba871d-0d7d-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 09:26:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 07:26:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 07:26:54 +0000
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
X-Inumbo-ID: 7eba871d-0d7d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl9fWKGMtiwNMZiqYGix0ln5LC38NpxI1VoWQFWoxsKEL//K7EPcfuHmDdE7fQebdzd7PI39ZfWOn8o0JjErrvK0WSJmtjVG2jkKvjqEq4uVDYh3ueQ0uQhv7sHjR2ZczLQKeeiTs+nZol6lMUHMpfEwAMzZnWoFQ5O0Sg87mYngNAjFeDDf3RwHoCdpjKeA0KLoJUY6GJ8OgWmL9kwH3rJ2uh+eoOXBUTPW5gwexqHZvqZx3nUa7ZtKmPNLDq5t8gQQrghrZj0l76tC/ZH4flbd+3TF+PzUeJUDIvRKHlAwEgVbbZzDM34mOYSH+rcN0YA3kiayH2Vhk4GQuet+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3f0nXNe/ZXkFu9A3Q65gE1NYfpQBS1d/vi0bHTAZ1M=;
 b=ayePkV5f+yG9ugDdA0s4vc8q2au5gWfyp1t0TQlCBMOzr9RzLoS0J53QTANUXQU0jzu7qnmcMpRa6YXybeRne2PFyB28kjklSqmY7fDca88dZrDNBQAEJE3g46v3zBA7oRy+7j2qKorKzJtbl1B1uSubyZADhIhUFyZxCTlSGtBv7KImHwnsE75j8G299nYYGZ3CfpoR/0vC6xsFM8QVRbCJyHoL7L1gfZWkxvy8gNDieenr/ZayPhvO6SsvNh567oqeS1iNb6WqLX4fc4RInH8jZQHm6LyPsPFKpiM2JaVkNuDurP7ccgw8QeAfqDEyunEFJtE9mMULhPUu4jjw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3f0nXNe/ZXkFu9A3Q65gE1NYfpQBS1d/vi0bHTAZ1M=;
 b=px8PU4fqqbapdmAm3gcOyzddMfb1uiTKavp7JTBsGyYrTFc1cjqPaCoiWfmEOR46d14XCneyNxzgzMwJ2Cu2SvZ65pQMBkM88yYVBrLeQB1XqrmEiG/KLufhZTBNG5wrfMH7eKNX+zMjPu1YCRvmtQ4InDoWbmv+7TAn0eCMmteS7JPpZW3K0d5srVn0eqQ43NS3pDH8RBUJqLjL44JA7y7Df38q6PWcxnRDcxmiUvdLmbWbHTmMTqk5rYftW54S3L1aUY3PyGd/fmj6U/fixAR8pfk7glef9T4IGCFU0Xbb/axxdOwbiLB1zQAjQjEarzfXiuxxDpYcg53S7x+FGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5622e17f-c424-87a4-d7c4-bbe1dee4743c@suse.com>
Date: Wed, 27 Jul 2022 09:26:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.16.2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a331da78-9b8d-4288-5f37-08da6fa1614f
X-MS-TrafficTypeDiagnostic: DBBPR04MB7803:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RxJatjBCicAvkz7XKGWWzK740ktYCs4Y8mKw18o4k5O/fjtBGVMESiqDJII8ZH1Mu8IhnQ8tSRb2jXP+wCuqylDsB8H7oehy6dpg/CheKc9BJFA2kt0TmN6wDVCUDHS+RxcLBI03+MrR7S8YBWAPRkUx70JzIRKEKDqueuxsJE6tlQmKgHRFLf/Qe6NAQmqeql/wmu8pWhzWBxLZB3WDm98pi/qV6rCR+sB4RfPxp+fKQfRRv+bBCbIj7H7edwVIJ9l6T8dL7WNczYbTAv6RjER7ienuVUlcx6tzcULNAJV4a6TMnO4l744BvSA5VYR+pQh4t3Zhw3vI5JF5Gp0YIxUrFGR64rz8Q2t+dMmxzGh6g7ZYERWH2812p4lcHfGMeghOnlIt6ONHHV/da2F40MA9cCCpqog8ydh+C51rI8oDXQkRCrYtgUIbZ6Lb4WFy99PIIn5mxgmpfRSSJ0/6nYpaAn4vj93NWdRARUjAS8dM193dq78tMwvfjQacDmppa1SkRy50248sV116SSjkTvGITYGTLbnmiUwzb/4VDc9b7b8umYETnxS4J3kRSlMHi4Pzkc/AeUswnKSWYYHYfBpg1w8q68joCPJohcezenWk3Cwk3XJ+ADwaFcc13IgW66jZfhoSZEcNcyyV+krmbYw4NDgGzFPbGbLUBdF+0D1ttwIc82DCgoxqiU6V7DzvnbKmdQ3KE2TktBlkj+ZwvT4IOyfGkEBQ8ocul9KAuu2nZdevNlEoqBRRODy+/Zx2umuNWQMJc7UWp3rbfqwy5nbBMVdONOE+2Zg2fr8JS86T99jzMQZwXkiqw0sDdq1DZS14Xq+YHOGUqAtNONPekA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(376002)(346002)(136003)(186003)(6486002)(38100700002)(66556008)(8676002)(66946007)(4326008)(66476007)(7116003)(31696002)(478600001)(86362001)(54906003)(6916009)(558084003)(316002)(6506007)(2616005)(26005)(6512007)(8936002)(31686004)(36756003)(5660300002)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndhVUMyc3BUdWJYS2hEZmtBcjN5T2JEV2gwK3hRNFNobTNWUk43YkgvODd5?=
 =?utf-8?B?ditSbXlTeHpjRXFvSDBVb3pUVC9QZk80NER6eVpRQVlFejgzdDRBU3pETWJO?=
 =?utf-8?B?WUc2dHU3S0d3bkZoV3lReElnbVNOdkdkUmRLS3pEeUNkUlpKa1FyVC9xc0cr?=
 =?utf-8?B?S1pVUkZWSFZyK1JoZFQ2eVRsTmI3S0h6RndGaWRzRWdwaWhjcUI2Tk45SlQ2?=
 =?utf-8?B?TktoM0pZbHBQbklmMzNleGsyeGRDanRPUkQ3QjlObmNYMmprSlYxNk9oREF3?=
 =?utf-8?B?SUZOUU9FeGIxbnFYMDlGQWZaR1JZWmQzcFpwRXUvbi9RcnNOK0Z1VzJraWxO?=
 =?utf-8?B?cUhhQVNRMU5kSWc4d1p4MFFQbEx2bDRPZzZnZGRHcHRnOXNieWdHY29kYXhi?=
 =?utf-8?B?d1NFYWdoNmF1Q01nalUvTzJmNDMydWk2STBGQWhhaU5JaGR4cjNDdVJTWWI4?=
 =?utf-8?B?QkV1NnJ3Z3BJenRwSHZYVW11am16WE9EY3Aza3gwM3FJdWM5UEZQMHJiTkM5?=
 =?utf-8?B?RVRNaTllWXU2d1FROVVTMHB4aEpWQmF3TXJsU1lhNng0MllncUhmbjlmUVFD?=
 =?utf-8?B?QWVXRGJzcHIvMHY0U2hocXhGbmtQVFF6dHIyYTRPMVZsMGRaUXM5dy93c2xr?=
 =?utf-8?B?bHlRSGZucHNIdXdKVThSeHRtOWxaajFvNTdNa3Qza3dSM1Q4K3IzZVA1YmJu?=
 =?utf-8?B?YjN2UTltWXBjSERza2dJajVZUEgveElXS0Fjcmx3VFZ3N3R2V25zVTNwVjMr?=
 =?utf-8?B?TUkzRzdJQVRVbGdWb3JGQWRxTVYyZmZoZ1dOT255Ym4wM3BKYzVIeXl5U0w0?=
 =?utf-8?B?aEVSZEhQMEk0YURTN2R4VVdDLzlQT0xCQ0VLRWN6a1k3ekFHQXFQQmQ3ODVX?=
 =?utf-8?B?OWF2MXZDREd3aStMc1dTTzNFZFpuUldZL1MyZFArMmFzSkFqOWFvNWlHOWpp?=
 =?utf-8?B?a24xb1dzeUl3M3IzNlhKUGE2L3E1dE5DRHczSXNCRlpZRGY3amFsek5WZS9I?=
 =?utf-8?B?bEVzYW55NFN2NkE3TllpYU9QMkRublJJVWFMZmhQL3pucVBGTXVDZXUzNEJW?=
 =?utf-8?B?Z2JUZm5DalpWaVpsa3labHdWWkVOaGhNU2xtbHhEVjljRkYya2JSTG5uQ0xT?=
 =?utf-8?B?V3A5b2lIaHNNc2ZPck5LQ0lsMk9IdEd6cUM5R0pObEJhM0wyUUNQUkFxNFNm?=
 =?utf-8?B?QUh5SCtQTjh2bUpQdVk4KzFMeTFPbjNkUjIyeGhhMjA2dnkzZTNoU1ZxQlRl?=
 =?utf-8?B?VER6bFJ3T2szY1d1alZPRzlCUGI5Uk1aaVQzcVo2N1FjUHozTEFrdmJEa2c5?=
 =?utf-8?B?STRyM1F4YmoyY1NVMHgvdjdRTFY0REpFRVVsNjdpVmE1djk5TUR0OG9nZHRt?=
 =?utf-8?B?KzFZb0FtMHFYWGtmVEtsSmp2aEowMGZDWi8vNWk1dlhFZGlibUU0V1YvTFFK?=
 =?utf-8?B?c016UlU0TjMyRE55Y3B6UUpKMG56WUdkU1pYb0F6SFdDT1lNb1E0UzJzbGZt?=
 =?utf-8?B?dlU3dGJsU1NkMitpRFkxcExWMEdybTVyS3oxZy9QRHowWWhOdWVhT0hrYzVQ?=
 =?utf-8?B?V2xIVytNWmRvS0lGcCtUT0JETjg3dzU4WnhHNVFYR0lMWXlmS2tmQUxWR0xW?=
 =?utf-8?B?ZVRxYldYWGpjTEwvbjhDaWRjTysxUmRMV3lsZzFydVZ0MUE4bklRc1Q1MHZv?=
 =?utf-8?B?SnZROGRpTnBnV0pkL2tOeG9hN2lhQVJYUXFEODRqT3pYeUF0bDlDMGplZVlX?=
 =?utf-8?B?N25CVmdGVC8zQUlodFdIM242dUF2dTlrdThIbnFCRkF1Y0wzOFNEVlRvMUVp?=
 =?utf-8?B?QVRHT092Qmc1QnBYVit2c2lEbnlGMUNCMENVVEd6cG51K1Q0blVtYS9kdElV?=
 =?utf-8?B?QU5UYTdwN2RUVVBVc2ZuQ1I0Szlrd0lpR25rbUN6cjM2QmFlVkRWN3BmVDIy?=
 =?utf-8?B?Um1MUzhVdWhLcW9ocXBJUThHSTltcmdnOHRLeThYTlovQ2lqdi8xZWFqQkpN?=
 =?utf-8?B?UzF6YUZBMUxIQmt0SlJiRUpPajQ3Q1pDbUNDMVBDQjZoR2NsMm1XTVpRbzBn?=
 =?utf-8?B?V1RZcVhCVGJCOFp1VlFmN09mVHJ4Mjk5QlZSRnFDMEVyY3QyaEpldWFUM3Vj?=
 =?utf-8?Q?PuQ1JiKUIUhWb1GYKOwFdi/Oq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a331da78-9b8d-4288-5f37-08da6fa1614f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 07:26:54.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqKwF/AUug2gn9UombTyzs9ZJofBqS5bvW1VMEyorvt6pnSKRdt04D5tIhNaiO27Jrjyb2taTYucmtoii1v/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803

All,

the release is due in about two weeks time.

Please point out backports you find missing from the respective staging
branch, but which you consider relevant. I'm surprised in particular
that no Arm backports have appeared on the branch at all since 4.16.1
had gone out.

Jan

