Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA82E666C1B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 09:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475876.737751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsdV-0004Pr-Bl; Thu, 12 Jan 2023 08:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475876.737751; Thu, 12 Jan 2023 08:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsdV-0004NN-90; Thu, 12 Jan 2023 08:08:33 +0000
Received: by outflank-mailman (input) for mailman id 475876;
 Thu, 12 Jan 2023 08:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFsdU-0004NH-Hd
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 08:08:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c29d3aa-9250-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 09:08:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9520.eurprd04.prod.outlook.com (2603:10a6:102:22f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 12 Jan
 2023 08:08:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 08:08:26 +0000
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
X-Inumbo-ID: 4c29d3aa-9250-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mo+q1YZXF8nvt9ZtuWLwUIpEN6FszF+4Y0EKi0xJ0TNg0U6g+l7q/fFH2goqv4lwmlqmENp9CBMOrintBD3sa9Oe6Q8g1S5yPa3RP+0aDIdhOGxuIs4oi7Um/8dcnUr6DHe/jWaGA89vqghm8gilju+O8qsbr3UIvXTf7gWw+XiIDlqiTMZAqdaCFpvyCxaIpmkNRBN2RRs28SycpcMtAaisvuBPF+07cqRQXLqDgw3VgSf2az033STmULBpvY7koiI/unaxXjMXhg/Y3Vl2V05D4FcAUUd5zoMXyGUUlQO/Lu8XnI//qQ7qzcNxevKZ4P7gAvbjVtcIjawi7PWIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXvbY2AMJ6MkxksEorH/5cWem3dkgzZzT9MoggQzB2s=;
 b=HfIsdUzx0ycyYQyFpcVw/f3F11BVVLAyatKF4BsgAwnT85Xf0EQdvkNTuGqhSwh7+QaeHJRR1sy4hZLLkQ/PUnPVSVE693yr96RpkD8OtAQmSTcKXet3zWN5BYlpfmN/dU+jxXacHQMykYhT573uMFQVWNs76dApfh8UgHTj2mr8N2S9xyCmi9TF4O0nxJaNeDkAKt4zizEW+9bS1TajAdMzRI8GPh5yit/j6HoU3bIRUfWi+gUs4drMNAErZ0VN1hRPjMRmQ7pYxSMFodEkcUmTmhyr+g7/cL5SLtO5HanSgNRcE0OF7VdTYwNB9xEzdjuQ6YPki91DvF+FS3fzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXvbY2AMJ6MkxksEorH/5cWem3dkgzZzT9MoggQzB2s=;
 b=KB/g10ycW4Jz6GjVemGYRMGYxchuozQ9zFjvLGC2XsjFq4JvdKMnFwNftZzmGsjJgwCbRhSwkVaBRuBCScC3xYmcsanqTbRzulASHnLI8bEmtWsHyVA6YjLJuBbeS2qswStZaWRwgx9D6/h0jvpQVlt2Yv/3sS6DCM3LK7Q/1sOcQOJglQTtP0n+rRvj65yPShMqIsnCvrxJ7e7n83NEMjeiXIggf79733d+i2AnKZBN2bvJK72UwfJyz2pZ1eSLwMFLfKt7mBQadtql/vXfDxIs3hP0kxHR8mIEPnUFpFz7+mW7Q/pJnM2KnC9l4IQYfOZ95ZM6kWSXlAIdPq89Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a802657-a6e8-9cc3-fefb-09a7e68d1e5e@suse.com>
Date: Thu, 12 Jan 2023 09:08:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-3-wei.chen@arm.com>
 <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
 <PAXPR08MB7420E482CACC741B1BA976569EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420E482CACC741B1BA976569EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 903bf81c-cb6d-45c3-d582-08daf4742e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iy+Tck9oeVEhJm30qJppCxWV5VulCM9mjoP9Q+dSqdZkW5iKYQ6vwAq6PHxxxOEJEM5bbzLtFMmv8EGpPqI/vVDMK/Uw+xSXVgNIS+ZeBhP9quu5da9wFZYDGZi7Tk3A9S60yJLMTjzAowqzeQB+BIet/5glsUN+A8YMEd+hD8MYoGDlaVGhXyHBo4ZpVhHZbSfSl1b3sZ285J7SvuVPZoWpR22qtEQD7GKKzk57c8YmvqhCMh6nMJcpmWt6cXvNWNz6uiEM1WPPs2PCAVG1o+zpYGLE3kyniKjSTuO4S2BiVS5fAHyAUG2r8HFY8zL4uoZ+LigMxP+wfrL3cMCyaGxiyqv4eDcj9sWF2OFsZF+t+wUvZTzqUNKIQp2QjWLQIkNCDlswIc/0+mVqNUdwIduAmU0Xa4v8GD94MiKf0yC7xBGowf/ysCJ2Xm6jY6d+Dl5x2kjA44HndDSloXNOV2SGJoh9ewB5MoYdhq+iuYI17bBowyY8vi89fBJvzTDcn+ELkf6/qFZc0H7nD6+XirEodq8Tb/ek1bWyysrYBqUx4kBfSZRODe1OmLUKF+3skOcw1AMcsRuTz141RnMea0fRtGMA6s/hxFKPs3THOHUamGvBfHUZOlD/9c7urQU6XhTSAHyZ+3zNatbD7BROTt8iwPijUvKZSuU4k+GRf5DF3RUUzUgiQaqvV3N7Pzlx4POEqWgGeUhyblJm0kJ04aXiypntdXfT1zt+fR4MUNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(186003)(6512007)(26005)(6666004)(6506007)(8936002)(53546011)(7416002)(478600001)(31686004)(6486002)(316002)(6916009)(2616005)(66946007)(66556008)(66476007)(4326008)(54906003)(8676002)(41300700001)(36756003)(83380400001)(5660300002)(2906002)(15650500001)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blhRTi9PMlM5eVN2d2NhTUdxNHc3RmR1ZmNBT3VkSEhKa0hJQXZaaGloU0JJ?=
 =?utf-8?B?N1hIQ2pKNWdGWHNPcjRjUGM3SitCc2c1WGlqZisxYUc1ZzdkYXd3ZERVZ0Jl?=
 =?utf-8?B?TnR3YkdVNk5YVEpOajZ3MGRhVTFBMFQ3L25oV1EwdkV1ZkFkbW5zNzlwQzJQ?=
 =?utf-8?B?WndCaWZyK3ViYmZneDhaWHpqUUgyVUF0Slk5MTI1Y21BRmpDeUt3YVdTS0to?=
 =?utf-8?B?VWIzNVRpTzZVMEFsNVVmbFRTdjIwQnBNMVNIc1NWeEtxK0N0N281dlU1eTZY?=
 =?utf-8?B?WUJtOG16UzBjRGpTT3VtRlhnKzBJc01jRFBzYUVTQXM0L1VMdkRhcnJFSDZ0?=
 =?utf-8?B?MTV2YTJwUjlXQlBxM3VjMTAzVlo2cVp5SVJTNDVQTENaTGJhVmpxaTZka216?=
 =?utf-8?B?TndoSVZORkhpK2UxRE9wUEcyY2VZdTBpSEFjUWhiWnFiYkNCU05aVGpYSUF0?=
 =?utf-8?B?YkFQVjR0SWh6UUovd0dXVWtaRDFNS1g3dWhPajdQTXQ1Y2p1NVhTNEhNVUt5?=
 =?utf-8?B?emRsV3g3dHJad2RScWtKY0lwd1ZKVTV4NGFqUnNnTVpUWnFCaWRTdnRST241?=
 =?utf-8?B?UUFrNVNCZldXd2hhT2h3ajBmMTdNSEN2NzVvdmhwaE5BRTQyQ0FRQ1NxV2Ux?=
 =?utf-8?B?UVRWUTlrTm1FMER5bkhHZnRldndXYklnNnIvT0w2aFlpelpXNnBLSFBFVHdW?=
 =?utf-8?B?TVZOWnY5clJzZU5WYS9tbGdPaWNwdnJudHlRaC9yL0RpR0E1VHlGdTQyR0V1?=
 =?utf-8?B?Yk45VW5VWERKZGx6N2M3b3cxdlg5dkdpcTZEb09pT05qSGxWNlZSeVBiWkJj?=
 =?utf-8?B?Yk9UTXB2eEpTblA2M3NwNkVNbC96VGdCZURacm1oNWlnaGFkL1lqcnQvcmRs?=
 =?utf-8?B?T2Y4R3hmUjU0TTNtL0lobEE3YlI2SUlKeVR2VXkvZjRLbEZvREI5TlhMM2lG?=
 =?utf-8?B?akhHTWwvc0U2dXY0NVJERWNqbXQxTkVGeE1BRERMWDdwTTlnT09uN09HK3A2?=
 =?utf-8?B?a3poRHZWeHpEblRlcnVMa3E0ZzA3RXpSWlhKN0Q4Qy9LT2JhclBDVFZVQ2JM?=
 =?utf-8?B?ZldBT1JJRHp2ZzZzbkFDVGp0aVJyWmRkL2RZa1hSUXAzazJ3MW92WGFNM1p0?=
 =?utf-8?B?dlZtYTZhRjhNZkhJSW5WeG85emxrdGNBdncrYURJWHFPMDNlcXhuYmZPMnlN?=
 =?utf-8?B?UGFYZ2ZIUW9YYjRXek5XRDhnZ1FEUHBIWklKbExwMlVHRk8yZ1B0RG9Ea2ZC?=
 =?utf-8?B?VzJkYmFNZlczbmZybjFJeEl1QlVpb0VHc2xUb051SytlMDJSWGkvZWhYcTFV?=
 =?utf-8?B?ZmI3OUEvREpNQXlCUFhmMmhSb0RpWFE3SUJwZTkxeTlJNXNscVRiV2xJSmhY?=
 =?utf-8?B?WmwvaExCc0dEWHplMXF5NzdIb29qUHZJRERCZUpnbDBQNG03TG1PRFlvbVZN?=
 =?utf-8?B?QWZsemNUY0ZrNmpHVGFrWW9wQXl1bUpHWmZwZWwvQUtFSEZCS1V2azk2SURZ?=
 =?utf-8?B?Q0tlSUdTVjZHYXhBVHNTRE5MaVBoRW44SzM2MzVtcStmSUdselZRbXZ5eUJY?=
 =?utf-8?B?cm9xanAyRE40T1BRSjVpL2NoY2I1WW93RTNySHNOQUpoQ2hoM1Jpa0xiZFYr?=
 =?utf-8?B?cUNla2l6ZzNoVjNSNnVJUFU2MnpZOWsxRXhHQ1RTQXZCNXllODJGNWdQVUVE?=
 =?utf-8?B?TFhmaFFPOE4wckJrZUpXbGhHbXAwdnh3dlpTNmVlZjBqZkFKcXRhOTJ2b3o4?=
 =?utf-8?B?T0RHamgzTE9GVnJsVDNXYlJJRnlaQ1JBVkVST2hIMW8yUkpKWTJ5SjFub2x2?=
 =?utf-8?B?cEVUamQ0aG5hWDlkem41Q3R0ZjhBUnR5anBDZEsrNEVPczUyV3VlYkJTdmVY?=
 =?utf-8?B?TVg0TDRBbWtjMTVtM1hXMWhhMmpWUENQcy8vbjZIRjMzOTBOYTRKRTJsZjlz?=
 =?utf-8?B?dVNCeTlKeGRkWUJlemt6czlGVUttMTI4ZGt1VVU3dVlIYUJMNkZEUERhNHJ6?=
 =?utf-8?B?L3I2WDF0a1VnbWQ5bDJ2YkxrRHNZcEkyU0JudkxRMytYVENHR0ZFZGNraWds?=
 =?utf-8?B?Z1UyN3pnQzZSZVRObE5XWUk3WXlTTjM4TGpiWGlDVkVDaFk0N052NVVRMzVH?=
 =?utf-8?Q?Bnwlssyf36crG+LC4iBZaJmwK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903bf81c-cb6d-45c3-d582-08daf4742e5a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:08:26.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kv/BGVqNId27U+hMv0RZUAhX8VCBp/zrwQJejDt4fcdyKpERt35QjJFZPChqWUqGluRibEa1Wgb/w4waKyuk/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9520

On 12.01.2023 07:22, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2023年1月11日 0:38
>>
>> On 10.01.2023 09:49, Wei Chen wrote:
>>> --- a/xen/arch/arm/include/asm/numa.h
>>> +++ b/xen/arch/arm/include/asm/numa.h
>>> @@ -22,6 +22,12 @@ typedef u8 nodeid_t;
>>>   */
>>>  #define NR_NODE_MEMBLKS NR_MEM_BANKS
>>>
>>> +enum dt_numa_status {
>>> +    DT_NUMA_INIT,
>>
>> I don't see any use of this. I also think the name isn't good, as INIT
>> can be taken for "initializer" as well as "initialized". Suggesting an
>> alternative would require knowing what the future plans with this are;
>> right now ...
>>
> 
> static enum dt_numa_status __read_mostly device_tree_numa;

There's no DT_NUMA_INIT here. You _imply_ it having a value of zero.

> We use DT_NUMA_INIT to indicate device_tree_numa is in a default value
> (System's initial value, hasn't done initialization). Maybe rename it
> To DT_NUMA_UNINIT be better?

Perhaps, yes.

>>> --- a/xen/arch/x86/include/asm/numa.h
>>> +++ b/xen/arch/x86/include/asm/numa.h
>>> @@ -12,7 +12,6 @@ extern unsigned int numa_node_to_arch_nid(nodeid_t n);
>>>
>>>  #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
>>>
>>> -extern bool numa_disabled(void);
>>>  extern nodeid_t setup_node(unsigned int pxm);
>>>  extern void srat_detect_node(int cpu);
>>>
>>> --- a/xen/include/xen/numa.h
>>> +++ b/xen/include/xen/numa.h
>>> @@ -55,6 +55,7 @@ extern void numa_init_array(void);
>>>  extern void numa_set_node(unsigned int cpu, nodeid_t node);
>>>  extern void numa_initmem_init(unsigned long start_pfn, unsigned long
>> end_pfn);
>>>  extern void numa_fw_bad(void);
>>> +extern bool numa_disabled(void);
>>>
>>>  extern int arch_numa_setup(const char *opt);
>>>  extern bool arch_numa_unavailable(void);
>>
>> How is this movement of a declaration related to the subject of the patch?
>>
> 
> Can I add some messages in commit log to say something like "As we have
> Implemented numa_disabled for Arm, so we move numa_disabled to common header"?

See your own patch 3, where you have a similar statement (albeit you mean
"declaration" there, not "definition"). However, right now numa_disabled()
is a #define on Arm, so the declaration becoming common isn't really
warranted. In fact it'll get in the way of converting function-like macros
to inline functions for Misra.

Jan

