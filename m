Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924D736EAB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 16:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551901.861665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcLy-0006vn-0C; Tue, 20 Jun 2023 14:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551901.861665; Tue, 20 Jun 2023 14:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcLx-0006tA-Tg; Tue, 20 Jun 2023 14:29:05 +0000
Received: by outflank-mailman (input) for mailman id 551901;
 Tue, 20 Jun 2023 14:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBcLw-0006t4-Th
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 14:29:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd2654fc-0f76-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 16:29:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9047.eurprd04.prod.outlook.com (2603:10a6:20b:442::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 14:28:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 14:28:59 +0000
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
X-Inumbo-ID: cd2654fc-0f76-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI3Jyr3+/U49njRPEYOWpkIRZh5nbMpOOnenJ488UnsCxHzoH1cgNbWIICATHnrcvx73cPDnCiyEJh+xp6cJyECU1CpsfOe7OJ70Uxv8lDd5UzNH3Zte/qWH0GIiBJ6R1vsGYaHEqno4XexjZzSPz2vlbsVWyZSIJryUaCAnLFK943+oOjxX5aiFRjQIjLVe9nm9vMNvdIxaBwoW2tj5lDHSwnyaiXEcZTSYXnxtWHl8tpU5ZI1n6WZfw69uoFsAHuuWD6v81Hx/UFbDvo9tl1IHr52BICcyDZF+APcSKnvvE1sF+rbW9jgkiML4Zwrt8kl51BtMbK93AT6ZPy5Mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nY56vCJtK6HYMPRlBFCMKcdJnc89l1zcE3IbZpM7mvY=;
 b=PXvLpVGpEeUXBa5uni8OrQB1ldz45lVtZ3pviDDm0EIDnhjohi/avcu9h2u4aIvP8tfiLKVmOt5SbNchTfyWXKUe3I4BOththxteA9TK0sNnT2KFtNJefGdJb6HyZ1Wlr7ntG0QbWyZoMptgXwp6oBdDs0npyGMOT+KdyfEPqvxZbuA+xKaFvMc4C6vVCc5x5uFdh1t+Qp87dPav4I0tXeRfRWn0GmtVcMP26lD5tx0v1jVrjxkAEY6IBLWXRrvo2uTw8hNjtAz3V56ZiXoAVUpzPTIeuI9rt+07sxzMDAkZA6wjHxI3XtkLk9+N2UuUK8IBiQWl36EqYqH4SESXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nY56vCJtK6HYMPRlBFCMKcdJnc89l1zcE3IbZpM7mvY=;
 b=SfwzvzQIzG5Cgl8j1fywOMaHTlxlj5esM3bk2WWW0p1myDUDn/wUKVSnIksQYSV6PHIupOr4I7ecMntdIyN4m+d4a044gdwhjo5B2/9wVxHJ39SITwCu0U0hJkXgaQp+hLi1HLgn3R2ndbvG4Gm7vB6LEoX60ErhvBcBl+00Z4aVVx2BKjlowDaSFwFxE0rXNqCMLSIIbKyabn7xLKPhUicejk0MK/bPipSvzgBcyACWU0SlXLgnIIt5ztGKBJWJHSZqkf52AemeLlTGT/hvpK+o+5rzSw4uQXw8CoJ9BfvPWWc2a1z54dTi+793RzabJSpX5ewzzsytyMtE/hhz6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9c9a3b9-a099-2bea-7d1f-168b24132ec2@suse.com>
Date: Tue, 20 Jun 2023 16:28:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/13] libx86: introduce helper to fetch msr entry
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230616131019.11476-1-roger.pau@citrix.com>
 <20230616131019.11476-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616131019.11476-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cfa0db8-8cf3-44b6-9dc4-08db719aaf8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLnU1aGTlhe/bD6nRSuJFn+RI7WAsDSdBmuV0XJ2RJjM6BogUvblN2+fie3/tq0L+vqAuY/X3+F/Vu3gzOaWA2JumHeQ3pdCbSmootaGx4nqWFXs2bwPVTUDDSxO2rQBflZB/fLxOTJdoK/Tm2jBkfUhM868YPq/MXvTExt7UYDt5P4AQmfqLFIWDeNbov4MhRokqfxKFxm+Kt/n1EZWhQldUM0jYZn/sZbzDQrHXMGmL+L8F20tnbu0MUS7wR6an6niLgMtr3yZenUWIwLwW4rb0LLnIL+kH9muQ5JXXFs3Gi6HMx8IiEkZD5tJs42qbLmfyyO5h0Mj61yfcCkd0nEIyvKvkVS1dIu5+TDM4Im+cfCPCdEndcEX40wN6VoHWAzDbQbAwka6ibJgfMLG5MLdkEOEMTALD7cwDCHs4DyEi4bmBe2eOQeA5yvzGyib3O1BCuJj31xC6h/M2TLkYuliCdH1gts3EgfOhMdUAYfJmi1tVOaT9l0K8WfDFLzQtQMYw3ihI1oSuhAHgx8wKebtJiFFquyo+84I4wSSB9uK67fVugLqtHlsZVEwKHrZPbUTm6UMUTdblXgEIRDS99541Mol9X2GDdZexuodQSQBXdUFchMNiEfqucG6rkXEL2YtSqEw9BRDWmji5+VDeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(6512007)(53546011)(6506007)(38100700002)(6486002)(26005)(83380400001)(2616005)(36756003)(186003)(31696002)(86362001)(54906003)(5660300002)(2906002)(4744005)(8936002)(316002)(8676002)(41300700001)(31686004)(4326008)(66556008)(6916009)(66476007)(66946007)(478600001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXMvYUtuaDMveXhMUmJjOFFBSE9QbE0xd3dvYWRWbHVDTWE2RHMrcnNkSzNt?=
 =?utf-8?B?QVZnRURjWjRJOVl5Z2tPUFd6bzlJYUova1RHTkhJTkVCcjNaM1AvaXR2Ni9J?=
 =?utf-8?B?YUlLdHkrVlc3N1pDZGpVcFFTdWt0NnFGQTZGbmo5ZHMyeS80RlM1em9OOHJX?=
 =?utf-8?B?QjRXZ2pwd1pwM1VTZDNyUzkrYzhmVElxT2d4UzZpTGJmSExvK2xrRTVib25a?=
 =?utf-8?B?TGFZdEcxYlVmMDcvSFgwK2ROK3JIc0FrUmtMUmprMzJUbi9LRmgxSUROVXdT?=
 =?utf-8?B?WWY1dGZYZnZFQmpzYUNsK1VPQUJIMEprSmdlSlM5enhTNmRMZlRHbzgrYU1N?=
 =?utf-8?B?TTRCZzFLeWlYTDhldnZ0Vk8xOWlXS3BXMjVqNUl0Q1NidmgvMFpVdjVZeVo4?=
 =?utf-8?B?amZWMDFoNlR4YzZHVU1PWDIwSWs0UnpuOWJxYmxEWVlTUEVBNHRyQkk2THo5?=
 =?utf-8?B?OWhocENBeE1VYTV6eHB1anRITFZ5aHFmVUhIcEtoeUorTmpOV05OM3JYVXpB?=
 =?utf-8?B?R0tOQVdUaTZwYTJoeXVEdjhuTkYyeldJREVDSEJhczhxRGU3MkNEQ1VaQTBE?=
 =?utf-8?B?YUhjTCthbVZBZ3Aybzk0dHR2bDI4dWV0dTczNEFpWXA5T0Y4UVlSZHhSNVJM?=
 =?utf-8?B?THFNYm9pYXduUlFhZmV1elpicG5nV2dGdFIxTEVrVFQ4YTNXTDlDOTlXZG5z?=
 =?utf-8?B?SktaUzloejVzUVdHSk5odUlxSnRCZ0hrbmJzK1VNYktEMkliN3Y3VEtlQmh4?=
 =?utf-8?B?U1h6QnlXZmQ0Q09WakRxc1FvTHpRS2JjemM3L0hJSDg5aG1RNlVzaUlqYlFG?=
 =?utf-8?B?eXQrVVNXVlBEU0pZZy92UGN2M2dwTGRvQ1dRK2JuMVRtY0gxQnBId0xnNXdz?=
 =?utf-8?B?Mlo3WGV4ZEhRRThRUWVHT21PbndqYlJabWFwbkhtL1ZoVzk2d0ZBUEd4QWxl?=
 =?utf-8?B?VThHV2ZNTktsY3VzdWUrUUhvd2NDTjdHRk9ld0ZLUVdlOWlUMk5Eeklva3c1?=
 =?utf-8?B?ZjlzNlBzY3h0NERnK3UxWG0vNUppWkFrSEJiWk1TVlZ1b2NURVBKUU9DOXNF?=
 =?utf-8?B?OEZOTmo5aERmRldLZFM3Si95RG1kbFFqcFRuN1h0a05pNnRTTk1hU1FJTk9D?=
 =?utf-8?B?dExpQWw2Um02MWdjUHJCVURpUW9QbjB3bXc2ZVhVWDh0RW9XOE91WUJoZVlZ?=
 =?utf-8?B?YjByczNNYVVnaVNreXEvc2hjWEVncElSbUNsdm9ZdGxqaXdMOXdOU3dnTXdo?=
 =?utf-8?B?R1JWaXYrWm5CZ1Zjdm9RdEg1dWg2dHRWYnpvM2xDVmFHS3VyNVVUdXcxNXY1?=
 =?utf-8?B?c3d1enQvVTBTMmtVMFU4M0kyaDRsTHhXOGVZa2YxSHhXaU02cDBFeFIwWTRP?=
 =?utf-8?B?ZDJIVXJ2cmtPbGtjWU5tb1IwR1ZsaU5NcitnbEhwQzgwaVFWeFpzZTFkYjd6?=
 =?utf-8?B?NXNCQUp0c3Y0SVZ0M3luS0cvZm8zdXhuYTRBbVNIRWNibXRkT1pwYjlaQnZm?=
 =?utf-8?B?YmxYY01BbWhSRnVFdzN6Z2VQZy8ybjBBL3gweU4ybFpvUXppbGVDckltditE?=
 =?utf-8?B?QzdEeDFVb09GajVrWk9UbjRQQ0o3ckNWakpXZHo3Q1RjZ3k5ZWtLK2RFRFpt?=
 =?utf-8?B?dERMR1VkMUtmNUJnRlpZMkxNVmZZTW55Tmx2eGlrTVZ5ZjBzZjEySlUzRTN0?=
 =?utf-8?B?S3l3WWd3WDhxeWRXemNGQ0hSdEZtNy9LYjhkbk85c29vVko2eDJwQ2w5ZVRx?=
 =?utf-8?B?SWV6eGgzM1pRcGY2Zmpvd1NPUkxkSXJ4ZkI5ZEFPNUJpUUhLeWxYMDcyclpU?=
 =?utf-8?B?ZUdHclZVZWhOakdnRlhEL3hqRUEzTW14ankzbFp6RXYzUGZJOTZIRGZhSU9V?=
 =?utf-8?B?L3JFTEpzTVk0RU45UmlDUmJ6ZDVJN0pxSldLU0Q5Q0dsbm5zOVkvcGRtTE02?=
 =?utf-8?B?N3E0R2M2UWYrRGpxeWZGM2JKOTlzWXBwOGE3enJuQkRtZEFDWFhFUFBRVXFP?=
 =?utf-8?B?R2tFcTBOR1dHMVd5UU85eHhodUJrS09nQWNmVW5CTTJ2eDRvSWdET3B3Wll5?=
 =?utf-8?B?akhrdWxRemtjOUM4bDNjRFB0REhwQ1A5S3I5ODdkVExvVk9GbG10R29yRVpF?=
 =?utf-8?Q?jZcDX54rUw5fFRfDqyi93xUFj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfa0db8-8cf3-44b6-9dc4-08db719aaf8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:28:58.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5H56NDYlwFIu27Z4gUI3hdlp+sijiHSF/F2BYweKDywk5y/WiswsQkkLjfc1zEKan09JgvSXjiAWgq3zcZvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9047

On 16.06.2023 15:10, Roger Pau Monne wrote:
> @@ -119,6 +103,21 @@ int x86_msr_copy_from_buffer(struct cpu_policy *p,
>      return rc;
>  }
>  
> +const uint64_t *x86_msr_get_entry_const(const struct cpu_policy *p,
> +                                        uint32_t idx)

I don't think idx needs to be of a fixed width type; unsigned int
ought to be quite fine.

> +{
> +    switch ( idx )
> +    {
> +    case MSR_INTEL_PLATFORM_INFO:
> +        return &p->platform_info.raw;
> +
> +    case MSR_ARCH_CAPABILITIES:
> +        return &p->arch_caps.raw;

Earlier on (also for the CPUID counterpart) a risky aspect of this
didn't occur to me: The validity of the returned pointer is tied
to the scope of the object the address of which was passed in. I'm
afraid this is an aspect which is easy to miss, and hence wants
calling out in the comments in cpu-policy.h (provided we're okay
to accept this risk in the first place).

Jan

