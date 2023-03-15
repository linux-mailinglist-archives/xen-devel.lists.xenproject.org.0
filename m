Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBF6BB4CC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 14:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510072.787096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcRII-0005x9-CH; Wed, 15 Mar 2023 13:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510072.787096; Wed, 15 Mar 2023 13:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcRII-0005ti-8Y; Wed, 15 Mar 2023 13:35:54 +0000
Received: by outflank-mailman (input) for mailman id 510072;
 Wed, 15 Mar 2023 13:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcRIG-0005rO-2L
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 13:35:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cb42702-c336-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 14:35:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 13:35:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 13:35:48 +0000
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
X-Inumbo-ID: 4cb42702-c336-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqyIhql0jYSVIAOKCcRoYAgpqk49KA4FfcJLJnJEjQYlqiOtEXmVdlI2BMYPYbycF9ln5pdujd1DugM45sthmJM4sq+A027tYGJiPL7yd37W9UZO+z/qKmQUXuqW0lcwYqhwjKQr5bmwAnX7k222YdADxe1x+tNdhGDy8GtY0hnYjO7VUW5KXWFmpwTnfqo0gsg8G5DgvgyeajiF5ejRaUFw37pj/SFesCxgzJJqhPpv+1fCCLt26+VLSDA4TOjmmnMJpo9dZKzwFvc8vUO5XAdeA1FOpmgQfqiThQEGSd/5H/VwAIhN6s7WrakJDnAdKlF3hWqD0e8M2768sAm7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge57tYwOKuVOWCSoR7DRduaQM4y2MKQzAlzX9MKjVC0=;
 b=H6UJxjdmfv0JQUtNX9o9g6b1u//pPTqdniXmgX2gGwObfzRm7EGYaUSgHaeuXpFL4DR0z3iMw9oCT0pDkUxqDldsSzsYJdb0eHoUeU1FnXpPxSBrJE/HRmsJ3Qn8c0Sz3t7u1oWqWkSNeJBG6qTvGHb4Dx3TELGIPTbltn6PqzMvcbphSaDdEr9sQi7OdnKGgFcdByObw/MVc8uyOClKxm64IcqWbhKXxOoRVaPpTVu1/wg0Hpa8KqtExxPU0OTFdTsEY6oglYt60gWGOATEKmAvCBSruoy2wMpLD2UzI3F2NUAuZHulqKRQezoV3vtJmqKSTrHk9yxcH8bTNeC/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge57tYwOKuVOWCSoR7DRduaQM4y2MKQzAlzX9MKjVC0=;
 b=KfVU4uN1wgeUWv7ABIsp8Ts7EE4UxXjUg5IpFROMf85x1uaGy1+F7o2Xg2K3XtsehxDE+qAUuGSdrt8VCUeGaBNoy11Hs9FGn6Zq1Q9H3bzeyOKWCkas+QxttOFCepBs+K02jAR/Pho7dvuTyP1K3Ew52+JY+82wTe589+idWUq/VMY3z+qf4mndL7/6q6VWEB2rumHrR2CCx58iYtsCc5CyQr3BOQ+I8xlyUC22LlRmHhZw47WChcHrP6CsTjJQXSzQMUEyClsZWWwJcuhfjBB3P6nfFnp6JQLx0LU7qZORvkN81lXyO57B6GltOuz8BVREqQ1vKRXq2rAljzSwCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c2c50cf-427f-6f13-514c-62135ce04dd0@suse.com>
Date: Wed, 15 Mar 2023 14:35:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/10] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-8-luca.fancellu@arm.com>
 <29cf7623-688a-4b88-c684-cf195d0626dd@suse.com>
 <0796E8D4-A5A2-4319-942B-C25B54D054C6@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0796E8D4-A5A2-4319-942B-C25B54D054C6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: bc82d2f7-8686-4aa7-8c73-08db255a2ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XDBg+rBl3fbSRXSxEXwUTqx8vgSEaO5i8LXeZUYypLksWJighN8F1jVmUmk4iRAWGXtag/Wid2xuceMSYJZzXi39iVy55GL96ern1RKTlbg8GmKb4ZoCssPl0TO4IbamuBaLrFSe+K1VQo0sKjPDGY8GfqcpJ3wcw8j9g7L0emJFtfgTJxQwZuPkvN7YK42Y3NXbYRQY1mBd4DhzkHqjaBbJiSoNMidz6u8/ZD2yA2iTDwmG1DaYFiV03xVdD6C792yYC7dNdTH4Ao8B6g+pIaoqEnu9ffMNNcwO2U3zaXIXz4iNviP+AKIRwUnalw3kgw98B61xcOW+D002uiOtPeNsehigYw2LFzacbsMVr5T78/0Ayd9KYu3KLo7LFQXSJap83K/RnrnDjkjj75jzZbPBIWXhaKz0j5GDI//Es+P7ygkV8FWqsTux/0eOG9ijzUgZ6qJu8gC3XIvpXlUqtqPtqoikWBQt7oyz+LlsPxD67U1xOW/IRuf3CfMZ5fzG6fC+O6/ErvE8gayeRPA56QmyKOuxURIMeq9Bk+1p9NwNmIp26J0HhTGqtDTdsKJQstSQNqnq0yo7Exuh/M9XJm7Faz0POWa68M7/x2m7JjGJQIbQNUk+MJGyiTvL7OmbLVv6MNjrfYxvo8gJ6U9FPvPaA8y/HcnEe/jZjpXc4IMK6nfmCyvbqrXwnbrqI9uMOJpXYmONdXwybjhsembctVocozYxHuXy98haSjP9wlkaSxG+ui0+m3uAtwqZeBDVXB9W4p64HppuJ+E+EzVWi995hx3Ggr48QWQiCJ+Nf2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199018)(2906002)(31686004)(41300700001)(83380400001)(186003)(36756003)(5660300002)(7416002)(66476007)(8936002)(66946007)(6916009)(86362001)(31696002)(316002)(38100700002)(4326008)(54906003)(478600001)(26005)(8676002)(66556008)(6512007)(53546011)(2616005)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZVdWVBSGVLN1BERU5IbE9mWEZNbktyNnMvd0ZxM0RCdlpJQ2hENnIwYmR6?=
 =?utf-8?B?ZmZqVlFMYzIvSE56TElQSWFGcEhuQVYzOWlXbVlsVEVmVEJMcERXQ2grQjdL?=
 =?utf-8?B?NzdCQ1l6Qk9LQThYNlhVemVFM1BoVXpVVEVsODNubVREUFdoOWtrdjJLd3Jj?=
 =?utf-8?B?anpESk9sUEk5NEg1aXVNZ2F6a1dCYzFCWklHdG0xMVZVbHJ2Z0VoZFA4YjJK?=
 =?utf-8?B?ZXR5cForRms1QUZUVWFlY2lIY3FuR2ZYdVNWcmdsMlRxdm1MYi9wRzkxQ2w5?=
 =?utf-8?B?ZEhjTU9rblhMOFErR3R1WUJueW5lQXJWKytLRHFuQ2xPWjJzL05UN0hYYmdT?=
 =?utf-8?B?UDhTQWhqdm9FU0g4YnIzM1N1T2FpOXpIcmtjeERZenV1bE1VUGVmVnpIcFdp?=
 =?utf-8?B?eUdZdjN1SHlLVlIwYzZqWFh6VmdvdW04d3F0T0RncjNBVStkRlk5WE5vNG5U?=
 =?utf-8?B?ejNHWVpsMk1DNmQvMWtRblpLdDFMbE9YR1YrZ2dUaVN4Y0hORUZWRWgzOWhr?=
 =?utf-8?B?dmE3LzdwY0E3SGpQZlF1OXRwcWhKd0ZpdXV3V01PTE9nSzZvbVExWmJnL0RJ?=
 =?utf-8?B?dmhWa0x2SmZ1RFNaT09BVUhuVTdqZnhHMTc3MndreElqbDJYb0xLUUVZeE10?=
 =?utf-8?B?ZHBRL01EK2tQWERBN2s3cUgrM3F2c1Vod0l0K3FCWUpLSUphU1haeUJZOGxY?=
 =?utf-8?B?Nnl5eG13SHdCWEdEdTFjOHNZa05Ob1c0T05WMThKU1N3NlVJU0E5WmVqZEFw?=
 =?utf-8?B?ZWRPR3pmVUlxbU10U2JYMVVBUXc2Y3RkOGJuK3E1TWpMZWV3R1hwZ3N4bWsx?=
 =?utf-8?B?R2JHblFyUS9tR0ptd2g1OU9WUG9NaUJzTDBmZEtLS21ycHhrUlhmR3JnWUFI?=
 =?utf-8?B?VHIxV3FYSStaZU9ScTlOWUdtMkJiVUFlMm54aTBIZnAyb3NiVjZETWZFSjA0?=
 =?utf-8?B?WGhjVVZiMzBvVEtpajJvOVNQbVN6YUcvelV5MmljRXNyRVZiTGtpbDJGa2pl?=
 =?utf-8?B?NWdFcSs5ajllMjFJTmI3ZittTUc2Y1dGVkxRak1yc2JMc0VBUnRmQ2hPRXlN?=
 =?utf-8?B?VnhUSDNhNWZlT2NTdHVqQ3A5aUZJTG9Zd1dKYUVTdnpFMjlCaHZhUURxTHdV?=
 =?utf-8?B?b21nL29FcUp1Y3FyeFE0VjVZZ2tmUmY2RkdoSVdnNkNham1GSEFNckNqUVZa?=
 =?utf-8?B?dkhrcnFBKzYvMUdCNUlRMk0yVnBhU0dKcUY5L2o1eS8vcXlHY0hhbjQwUitw?=
 =?utf-8?B?Qm1FemNBdlczL3dmY1lWRDdHdEZ3ZTZwZHJVTGpuYkg3T1dycHkwcjR2bTVS?=
 =?utf-8?B?blU0SzhzR1haYXdLQmJNK2dWbDBCTWpqaEtjcmtMWDdKSkNWRmZqZTR5M3JR?=
 =?utf-8?B?WDlnMmRXeVFSWEVTUDYrM0RrVi96ZEF1MFdERSswQ29qb05WY2tzRjViTTdE?=
 =?utf-8?B?dzFKaEJWUTFtSFZvbFpZWTBrbUsxeTNjRU1vTHVUZDJrRVQ1bGpsMWRobWlR?=
 =?utf-8?B?cGI0V25QU0JOdTEyYVhnL1NmRFVuR1oyRzFBUlllQVZhdTA1dTZWR0lRbGEz?=
 =?utf-8?B?aE1zSThuaDdZMVMvejJqMXRNaWIzcjBDeUNybHdIVjFCWHdLcS85RHJ5SEpJ?=
 =?utf-8?B?bEVpZkNxSWJtSVdpbWorM3dJSWRka0MxMkdSajJMOWhXR0VOc2ErUkpnM3ZT?=
 =?utf-8?B?N0NaTGpkMDF3VEVJRzdFYjU5aW5hVmJKcnNyTSttY1Q5SWFFdm5vVzhrVjRX?=
 =?utf-8?B?UEhZSXJYd1lNZ1hKeGVDRllueFc5eHZaazZ0ZXEzemlZL0NJZWFVWFd1R1dZ?=
 =?utf-8?B?UGt3T2l4SlU3Slp5UlBhQno1aGtuZGk0STliMXNSaGYxdXlGZGRBTStiNXlR?=
 =?utf-8?B?N0dsam9aT1FlMkwzU2JiTDYveHhETjlqVXZ1U21JUWhpR2txek1CcXhGOVBq?=
 =?utf-8?B?djJEL0NXUTNmeklLRXgzUlpUcVNGcFVIR0MyVGIvQVRFRDd2VFYxSFcya2lj?=
 =?utf-8?B?Z3JlNWhLci9sNWlFb3I4MFNybC9jV3B6RXRMYWI5alBkaFNoQmN3VVpnMXhr?=
 =?utf-8?B?T3Y0ZTRNa0RmTGV2aVlHV2xJOVpETlJCVXVZQU54UTNjS0o4RkNUa2JUKzBS?=
 =?utf-8?Q?XVXbDwX4BuxCkTMsRnk28Hfml?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc82d2f7-8686-4aa7-8c73-08db255a2ffc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 13:35:48.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85jNwtLVlQxWadbNaT3YfvoIBa5ar7tzWhmPXDvErlzk03eOV/aoxzYGWD2276LjEkVHzxQxXI/rzr/jo9YjIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

On 15.03.2023 11:39, Luca Fancellu wrote:
>> On 15 Mar 2023, at 09:41, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2023 10:05, Luca Fancellu wrote:
>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -94,6 +94,9 @@ struct xen_sysctl_tbuf_op {
>>> /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
>>> #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
>>>
>>> +#define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
>>> +#define XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT  (0)
>>
>> The second of these can be inferred from the first, so I'd like to ask
>> that redundant definitions be omitted from the public headers. For the
>> code using the constant we specifically have MASK_INSR().
>>
>> Just like there already are x86-specific sections in this file, I think
>> the remaining single #define also wants enclosing in "#ifdef __aarch64__"
>> here.
> 
> Thank you, I wasn’t aware of that useful macro, I will use it in the next version and I’ll
> enclose the mask using ifdef.
> Are you ok for the position of the mask define or should I declare it somewhere else?

The placement looks reasonable to me.

Jan

