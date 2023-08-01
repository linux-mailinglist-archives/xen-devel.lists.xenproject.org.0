Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE10F76AA2B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573738.898725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQk2f-0001IE-IT; Tue, 01 Aug 2023 07:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573738.898725; Tue, 01 Aug 2023 07:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQk2f-0001Ga-Ee; Tue, 01 Aug 2023 07:43:41 +0000
Received: by outflank-mailman (input) for mailman id 573738;
 Tue, 01 Aug 2023 07:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQk2e-0001GU-2h
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:43:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e07f5d-303f-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:43:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7594.eurprd04.prod.outlook.com (2603:10a6:10:203::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 07:43:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 07:43:37 +0000
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
X-Inumbo-ID: 20e07f5d-303f-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJWTNW63zU+us13h/Zdk0Sbv1GFuLpZSEfHB3mVNBC1b7g3be2VAF9S8LCKcsp+O5V82OFQBgXSQ4Nov2Tilb1QlunMj5sPvvSQAO4eavBddEXqZr8O/4B4RW4RRXEhoW5jzM1L7KPkNAyjZgf1flSbByHfoJ1kySU0tbL6ylROsF2+IJAhJY4H7HGysAYVI4BNCVieVVurmGgH/Yu/R+5xgYbk1GzRNgjCHhFs3HwbgBVCQvaz+voycqkFIIQg2P4pEDG/pK+7onW5V+4RMjpHFwTs24a4vDdIDQ6toh8CxSpVEWWX3fB1m6hn5ma/IMvxnwCf94peje35aiyaMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXhRtAR1xA3P8CYtgrQJq850f6rswlouKxJcR4uEtb8=;
 b=fcdnm3/MjD2VWW0cswMbz2TAnjYga/NhwF/5DW4E3axo1d32E5FE1xd/OhFXXj1r36i+LthvmAG32QnuXLnAf1NiIm81hAkloZZvT4dYvzEPxRp65F+dwWGUYxdqLPXR458KpvmAk7AZxHk8CXHvuvw3DUAsk/TLtxO8NQKKdBsdQOgOIVNKn7C2p95kaUCTihit6qgc6/DmcWj7KaafK+dn3AW8/k8ZsLZrVMA2YrIM29HoQXcEqsWWbcy2H+2X/iHn0PP9As9MHH/Y/XE/W5yFtUQ/75MXOPFYbzMS+4fwbyPBMWdZeT1MR6LSYIbeDfCQIEP46Vvc/j7YUqC78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXhRtAR1xA3P8CYtgrQJq850f6rswlouKxJcR4uEtb8=;
 b=X0LyQ+z5UIswZN/9Z3kCwJroACxPwxbJFbL0Mzangt/Kq8EazS/akq0yjs8Sy6oRwUTZz+5N2zyLsYAY3OxZNYxVamJeAL6L4kwkykhz6o56KPQuuUW/GPemaVRFawPul1QAr5/goYNEkZ3n8LnoaBgIPBMFkN4fDRcI+7K/GbprMd3H0AKGKE+afUnLSxJJa8qgYGA2k+pAgG5YKbN4s54KysENMALkdRDXsc7jZXpphpoWZ97XA6yrbSDn4glA4WrY9VLEzotdp+/DmJtpe8JsU/RtAbZYnJd+cJRI0ZZxhL6rQME0rcRPH8CyeKyaW4y46sa7iusrLqJONPdnTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c8f904c-d7f1-343e-2208-6cf963e1e25c@suse.com>
Date: Tue, 1 Aug 2023 09:43:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-14-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801034419.2047541-14-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ef1de1-fa11-4fef-cad8-08db926303cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VwM+kfzJ09gTRK3IlMxkWh0JB9jajoRKknPCOcb57K+kMmuQFebTB5Jtv3WvSN0iuBMRaPEPkPS3O82egWtfqDN8Rg+UeiYZOzSNhotXM7+hqHTmUh8iEEf7sAYTVWg5Cp7ZHcMqnM5RCiVYLaDO00l/5nAWQPUG9pskzQQGeVbdpRvPIp2iGPav2nzDRIh/ivhnc7qIyqluQ9ZWfmVZ3Q2Hk7gjUsCrsuknhN33HA9AiXBZhT1DJem7FFGZ/vNao+HD3lslDnrSQn07hzQSLCFfNyJE4eZYHCgMbxJDt5bFvw1/FB8pctp79EtetNtJ2b7mJFpw3jJpMsBtK4k8SQXQU7smV39/1AQrQYzE0MbjTsSwOvG8PtdtQtiztqZAq3UiVXPWD4lMq+YOfx43pnZeMR5VIi8yzOYst/83VKv+aimOFIyVDYcR2ePzP9WgmUNNl28mOe42FNvoU9F64OrXI+3usyVhpH3fK+exKcb5pVcnCVuPHZKEL1PwJo8agQ/iA5t5QttE5lpIwbghgmjjZUgu5goyoXTCikeGPDLFl9TO8jxJr6XJha4hcHbMp5gZ41qbEJHWp6doFeeS3WXZfEABBFQy21bu/b8IpjiykEvNW/ihvlCjgysle3MoFBoY8+mz3LtpWlbOq/H8Jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(38100700002)(6506007)(5660300002)(53546011)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(6512007)(478600001)(2906002)(4744005)(2616005)(8936002)(8676002)(6486002)(41300700001)(36756003)(31686004)(31696002)(186003)(316002)(86362001)(6666004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUorOGVvZmNmQ0IreExUSTlJalF3QWpxTnBuU2xJa09lcmh2QjdZR2ZRZXI4?=
 =?utf-8?B?OHNlVHFXTWtBd2xSNlpSNkVGZ09RV05kQVpXdk82KzBnZk5LSjJrejN6eUlW?=
 =?utf-8?B?MDFuRy91ME9ybU1xM0oySHN4NmJObkdxeUJTeFRmY1ZQc3VRNW01NkpVMzNC?=
 =?utf-8?B?bjVvNHo5RjhhOVFsd0JXTE92WDV0NVpFMlo0UXlQQzNNTEtSemJIM2RjL3gv?=
 =?utf-8?B?bzZyN3lUNGswVXoxeG5la3BMaW51dWM3V0FWbUlZTjZWOGloSEl4TUhYZmw3?=
 =?utf-8?B?VFZmYlZZRVpsVmxDNW9Fd1p2bTNld01GU1JwSUpGK0RsMFNkZ2J3K2VpQldO?=
 =?utf-8?B?MmxURW9kblMvQ1hITlZaNDUxaHk2UWpwNS9XUko2OHhkVmFTayswcDI4ZmJx?=
 =?utf-8?B?TWp0eFd4UkwxbEZrcW1UbjFlNk9sY3lkTlZrVjBSNFBBbWFFaGwwR0hpY01Q?=
 =?utf-8?B?eE05bllHMXQ1SExyVzVFWFV0YWhscEpZNnVyUG1JcER0OThscFh1bUJhaE95?=
 =?utf-8?B?UWE3VXYyb3FsN1NJa1dQWjRlaHNMNUc5QitVdzNSZ21NdlM0d1NYSCt2eVRP?=
 =?utf-8?B?M3NYNTFldlV0d3hQOUtudGNkQ1k4Q1VMZVBrVkhkRnRUYXJZUklBVkE5bHE3?=
 =?utf-8?B?NTlkcWZzSDVZallSUUlxcXdvbmRrRS9BRDhaMTlVbHhmTW5uOVpLZFU5aFpa?=
 =?utf-8?B?a0JpdG9qZld1T1VScThtcEVJZmtWd3VqS3o3WlNLUkg3UDYvd3BnNHV4eS94?=
 =?utf-8?B?U2NlWWtRQ05adDM3a3RrRWFVbjl6V092aENVZmZlUzhXbmJyQVpucm1GZVV4?=
 =?utf-8?B?d08vY2x5RFhwSHpHOGRRU2F4d3BxV09wY0lCUTFleG1mZFRtTStEMkRuVUtq?=
 =?utf-8?B?UUNjTzhVZk9TQUF3VVRURjRBTVlyclE0OXVibmtZby9PeTlNeXdEM1lWUkZk?=
 =?utf-8?B?MUhaZjV0bmF1OW56akRIMEFRd1FCWlA2Snc2R3V3eWU2UWhscWNvZ1hRTXVw?=
 =?utf-8?B?NlBzRHNBUHBOY2EzNnJTb3c0Y3FJRGEzRkN1aTk2cTZYWW5KS3YvVUN6UjhE?=
 =?utf-8?B?YkgyeTZvQ0NqRm9xQytUQnR2L29Rb3RyaGxuWlh3cHFZWEw4TVFHSmphTTZW?=
 =?utf-8?B?c1FkYXdTNCs4VXBMMitRYmM4NEhvcVNMYjBqeHdwckI4dlJXZVZ5NzMyVjFy?=
 =?utf-8?B?SUo4MHE2R3hEWXZBWjQ0TGV3clZXeDl3NkVHSm9pQ2ZFeUxYbVFWbVgwajYw?=
 =?utf-8?B?MGMwWkM1aEF2ZTB1eGF0ZElmc3U4RGpmRjZzWmZsQzBBWW9aSVZDSkpNZzFz?=
 =?utf-8?B?QzBrRFZJVUxyeEpjak5MdzJxWlJ0cithMTdZdTcxQS9mOFl0UFk5Wm1rcmZJ?=
 =?utf-8?B?UUg2a1JhdEF5dm1rT3JHaW1uUEdqbTBOb3I3OEtVVWlJQmhUOHY4ZUpON05O?=
 =?utf-8?B?QVlvNFRuWXloVEw2NkhBVlhacFc3UTlUYnhHRm1INWRPNGxLa0JrS1I1MGJo?=
 =?utf-8?B?QXdkVTVXWTdJWVhOS2gzMFNJRnN0ajFabDB5RlRVcHBYQ01kSmZBd1RIdGI5?=
 =?utf-8?B?U3hFRXNVY0JaeEI2RnlSWCtpcm1JZHNIZ0VrcUdxeUhlUkgweGNiMHJ0YWo5?=
 =?utf-8?B?Z3M5TFdjc2xqRnozcml2MnczdFJiVndRRzBhQnc4NFZPM3lKUERGT25seU1o?=
 =?utf-8?B?RjNRUThIT2pwSWFpNjU0RXRpOGtoTmpNeFpSNUtDRDUzMlRqNUpoMDhOZ0wv?=
 =?utf-8?B?bVAweGtlVFVRRkg0Z1ZXMnBxWmlkQ2VYS3V4eTVGaTBJSmJ6TVdkbEZ1cDNO?=
 =?utf-8?B?NFIvcE8rZ25yb3ZkTHcxR0EyWFk1NVFFNWJ4aG9ZZHMraTRjaGVmdE93U3Np?=
 =?utf-8?B?alhNbThQaUErZTZpUmUrc0V3aXR1NkhQV2xMUEh5dUdKYmpOK29SWnBFWlpR?=
 =?utf-8?B?amVBZU1MaTBRRmtNT1BadHdPbWc4Vy9WM05BSlJzMENibGxBc2x2M0FVT1F5?=
 =?utf-8?B?a1FqeUxmUnZJRXNmRXdOWFN6T2lCQWZKSUJCUFhJeGhqbUZ5YTVrWDZaMjU2?=
 =?utf-8?B?aTVUNXYwRm1TTU8wT29FUGJxY1JDQ3VvRTNTckxiOFlzTEJ5ZjM3Rm55dVVy?=
 =?utf-8?Q?3CyUoU6RDgL+QoMk6BiliGIa/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ef1de1-fa11-4fef-cad8-08db926303cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:43:36.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uo5SBSxHU4K2bkOuWcpnBfacVPqbVoBJ2LmHL2GzY/FCffYF1fF8BO2NUxmnDU5Zfp8AinM6oS6LtdPx+3jfbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7594

On 01.08.2023 05:44, Henry Wang wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> SMMU subsystem is only supported in MMU system, so we make it dependent
> on CONFIG_HAS_MMU.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

While entirely Arm-specific, this looks to require a non-Arm ack:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

