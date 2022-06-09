Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F570544A4D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345106.570748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGPD-0007I5-F5; Thu, 09 Jun 2022 11:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345106.570748; Thu, 09 Jun 2022 11:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGPD-0007Ft-AY; Thu, 09 Jun 2022 11:32:51 +0000
Received: by outflank-mailman (input) for mailman id 345106;
 Thu, 09 Jun 2022 11:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzGPB-0007Fi-GL
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:32:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3881867-e7e7-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 13:32:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 11:32:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 11:32:47 +0000
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
X-Inumbo-ID: e3881867-e7e7-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhf/eqtqo3fRT8+RIuH8Kb1Jdu1mHSicfmsb8hGqQOQhYpTLSLpZEFyzno45L+JIvwbTdjQb/vXWnD3nWGqWXWE5QiZbNCX78ldbHJq1GzUdCXdBKk5dcXKFkleoddWcVi6lAStFPbCf2LtP9eEk9j/xrPxU/T3xzr/ll2JJx31eJN+Ycs/twTYy76f8/V2/zh/Ta8K2jA8Q2GaiSqnDxmKk5qXcOtPLM4FWLNR/5eND9TMUbI8I3oLGC1qjRGjoj9AhxwL74qP5iBBXs2sMyJ29/b0BySJVzWesHzAgrnmwi1TIKJ5PsuqDALUy/R0Xrd8vT5HOkHhtFTVdI/4mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baF2ghcrgKF1M0W+kGbc6OboNpQy41SERRxrEystets=;
 b=lRoyT5US5GbUB73fjylrj1F9W6tJ2ZdsSTCU97gdqCOMmjLASxo6lPU+8RdC16+eiM+qAacjzPIqWMK71saM88tw4K4xNW5mloaMvinjSHcSHl4gXAVaVnfdR6fpMLAFMcWWtnNjxkO3j8VEIt/nDjQBCHEsc//zdrcETPDmAkhRK77/xHRcY/OZ4Iu35FiM8MEhv1RbQ0RerAaNbXShwv+l2zxjpm0hCmmZt2dWoOb+oSPldTi3KGSfOwcj3fge10Gt8CJUEZmRz2iGQ4AkG/2/6XVr6pBXaryk298uJxt9QNEZR42W4VXD2dzVGbm+NIzVPRu4JvSYavldKKEEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baF2ghcrgKF1M0W+kGbc6OboNpQy41SERRxrEystets=;
 b=ymr1muUjs/HfMUznk+YKUM7LP/+oB/Xqlw6D+lQYQT4W/UfrYoLXUJB8Zc6b0pIrN9wSYwI4anG7LEFfEMwbrsKaQ0W8q2l4ryBpaHhs5B5sJoqeGWcm99XEaACBWbQmiNOWmCXZzsclCHrWqcdlidn2P+6U9QeDmCyrd9UlusQK9Yhalw1ngm9eMyVoffyCIcrFcWwKGRzvb+6+xPyK2ZuyIOca/NGFEtuy9mhTSFq6u33wFB7Yi4FTfRnyzo8CAkDpHYmqBNohlSmP3aOLbSR2yd/jtJGSl1VidldUlI8S4IGBbAAnv0UCe2uXKitFr0DD/J++CF8J1I3B6Tkjrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9675dd3-5ad2-9caf-ab76-30bcba72019f@suse.com>
Date: Thu, 9 Jun 2022 13:32:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: MISRA C meeting tomorrow, was: MOVING COMMUNITY CALL Call for
 agenda items for 9 June Community Call @ 1500 UTC
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com,
 julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206081806020.21215@ubuntu-linux-20-04-desktop>
 <880f3273-f92b-2b60-8de0-e69fefbada21@suse.com>
 <26829bf4-bbcc-a610-ba3b-fa60aa296cf9@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <26829bf4-bbcc-a610-ba3b-fa60aa296cf9@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a125966-d777-41b3-fbfe-08da4a0bc6e4
X-MS-TrafficTypeDiagnostic: AM7PR04MB6949:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB69492E5DC9261E059F3941CCB3A79@AM7PR04MB6949.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ul04Etl9tYvSBALAirkD+pDQkPN1vX5DPijmvrZ54du2WgnOrwE5ZUloQs0KugYuO3Haia5/dTDVfXogSoX9XAvqtOpjR1RMs947uUPWLbmVqFpgV8B1cMV90yehkhOCb7h12BvN9O0DXf4AtXVugL9EdN4OTIOKqd9l1TtxO+pgPrss8iaJks9RMG+s/vM9bmsRXHb8Q1NlOZsM4rC87X3NvUmW+Wc4/kUbLIRMxMqR/w3yfU+tlTue/zf2ionnpxJZIaUrJVWxOjr23m9y4NHkqLjdMS6Y7lS33DZNeJ2tz1Kcgfsqlspo1t6sjklz0gxP/1gOldytOZky/nIytv/MWw80k/Ovnzd8gj4ovx9i8LHbFZV8sT918nyJ53xBZHF/0/CpWziatiUNSKq3HW2enq8k1Qyp8+Q0PPsS3oMSu5zDu8A7wsTJL2Y5Lj0l4CdBJCLgM6YDdnmmGrYzeZY2MqpmUHeVYmHpUFYW3R5SAfZBUViNXgvex7NWwP1+nkx9G+UNetT65VW+A6eblOd1bZyDY0fHz3JZMPWHgqj0cQ1ShhN7il7PhBuQlt9a9pQzr6dvql7xMTOzsCbs064eDl9sWamqSoSTNw7fCIA1tyek9r5eQDtPUnzVDUoIt6E/9zFiq+3kx92k7MZMIm67noLRLzYFzOOilyIkbSxOHijK2GI2M3tEv32xad3LOKyEaX4xivTR1ONNNq4zOBHEqG7X4lHoLf/tJus11i9GhWi3MVFgHYq7DTLWOR0C1ykmj4UwGU8cnr44YEdH+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(31696002)(6666004)(6506007)(86362001)(6486002)(53546011)(2906002)(508600001)(83380400001)(8936002)(2616005)(186003)(38100700002)(36756003)(5660300002)(8676002)(316002)(31686004)(4326008)(54906003)(6916009)(66476007)(66946007)(7416002)(66556008)(221023002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2l5UFRYSFFpRFB3TzlZdGdMWmZXMThXdE96amoxZE5tbXg3MjI2bXhjUE40?=
 =?utf-8?B?OVNhWTcrR1U4UTRDWHFZVytvdkFtQ0lCd3RkdlVVVWU2N0FvemNJcHNIV1BC?=
 =?utf-8?B?ZGZaME9LRHBrMjNqZ09oaHRBRFBiRGlCckh3c1UvQi9td1o2UEZWMTNBVE8y?=
 =?utf-8?B?WDhoTkVHMitGRGZFd0ZEdGJKc2kzU1hZT08xZkRCVjdFdkM1cUMyS3lFeEVF?=
 =?utf-8?B?eDJNSFJJdmppL3UvM2ZWT1JUYk9oWlVQNHV6QVNvWUp2ZlNiNGc3a2J5TUJh?=
 =?utf-8?B?cys3U0dEWHpLeU9RREloZFJsQnlNVzJzSnRPcXNyL0VGUTBIZndMMi9TR1Y0?=
 =?utf-8?B?VXFBdDhHd3orak0zQ0pINHVTLzBoaElpbllWQTcxaGdTZ3FxdGFMbGlMQU80?=
 =?utf-8?B?aTBoR0k3d2EvOVhNQ1RrSXpObjB1VHlZNXVkMXBtWG5LNURGOFNmWWJDaEZj?=
 =?utf-8?B?UmZ3bnFoTWhTaitiL1RtaEFLYzdBcVUxQmZ6VE11K3FpbjZyK1QzRW1nSXlS?=
 =?utf-8?B?amVaWmorb01hVjJJcHZMTlMvMUZySTdEZW02bS96cGN4RE5aZWloM2RWdmxQ?=
 =?utf-8?B?TnVPd3Fhb1h6RUNSUmtML2xTU2NyT0dzcHloMXpEN3dzb3dLa056OVpaVndH?=
 =?utf-8?B?YnkvSHkvdERSVEFOTjRGVXpaemlrbWVtSHVwaWhKSnFSdXZOY1NRaEpqWGE4?=
 =?utf-8?B?Z0doWHg3TWdCTFRLaXRsUXZVZTg5YkYxbzZYRHFNV0FEK0xZdXZSZWhITng0?=
 =?utf-8?B?aGRsd2xDRXpZQ29aM0lwVEg4aWxUQTl1Z3hsaDNOTkYwV3NXSGc3NmJJalFy?=
 =?utf-8?B?amw1eUNLUFVmbVQzdTU1a0JZa3FFQXBSMjlOWFNkUXB4OWRtZ3FXL0pwbDh0?=
 =?utf-8?B?dnVuSDdIcDI4K1RtNGlPVlNiQy82eE95bEV1bFNFTFowQzZhWW5IL3lVVzFR?=
 =?utf-8?B?OVJ3SXNrRnZQVlhOaDFvV1dyRGRTZm1KWEI0akluMzdRM1M2M3AzbWJRS25q?=
 =?utf-8?B?RGNiU1hUcUl5bFhYTDA3cEVkaXlKMDhYUHZqcEprZTYwOGxCeVRzQm9oYTl0?=
 =?utf-8?B?NGJJbTF6ZTZDYnJKZVJyWkQxMVNkWXQ2bjBQK1k0VlRkNkRlZkcydHNycUE2?=
 =?utf-8?B?Wmp4bGdzN3dtOGdYcGZpU2dxQmM5YnlmYWpuM053UHZFOHA1RWw5M2NOcUs4?=
 =?utf-8?B?aWFFQ2Q1N1BodDJ6eU56WXBQV2JpWGJVSGpFVEVGd1ozSVZhVG93eWVZZWk0?=
 =?utf-8?B?Slo0dHRCMzNGYjQvK1oxSTNhUDY3OEs4R05tWVd5ZmtGbEF5NlcwR25KczRn?=
 =?utf-8?B?WHRVY3VIZGJ3dzRJVXJ2dmg2RXFiTGFNOWF0bzJNWC9NVWtCaVN3N2dmKy9U?=
 =?utf-8?B?SHhoZ2xUem1YRXBKT2NTN3B3RGxTeHoybmczbEJzWmNZNGw2SDFtWXk4NlpW?=
 =?utf-8?B?c2lRaVZrMS9EVU9laXUyUUFMemliMkNSYTQ1M1FLRkpjdEJ4WUx1bHhyek5o?=
 =?utf-8?B?RXBhb3lDenpvQ0VOZzFWYUpmakUyMW9jeVJsYmFadUVlbm1Ib1RCNFBDOE9t?=
 =?utf-8?B?ZHBCczAraXllQzlWY3BrZ3I1NmhVM3FsckNmM01xbHdwRk1KLzA3R1lZcEZs?=
 =?utf-8?B?MmJ2aWRtRkxxNHp0UDZwaGt3QUxjWnFhODRHRUo3cExMZVlmSWxMYnFYbjJV?=
 =?utf-8?B?am9EMEIrVFIySEFqQklKYUhSdzUwUGFQOUJWUHBQdEpMZUVMOTQvaDhPMUwy?=
 =?utf-8?B?N0dxaldZQ0JTRE5acjhBdzJiaHRXRS9Fb0d5VWMwRVhQeWFQeVJmUms0bSs4?=
 =?utf-8?B?bFpoRnc1KzVoeGxSTFlDblNqaFllNTl1Vy81bzRqMUg4WndMUVZUbEhkSDJL?=
 =?utf-8?B?Y3JabzFsM3F3WC9RQk1xNjFXVUM2dGoxcXZSRjdOYVpxc055Zm9nYUtLYmRF?=
 =?utf-8?B?eG5GdVhheWlpSm9QT01kOVJuVWludEYyS3JRdDdlUjNqSG5mNGxkamk2T2ts?=
 =?utf-8?B?UTJLeTFiZExhTWNyaHZDS2E2djhMeU1GRmhyd3hzYTllUzl5N1VjejdYQjR4?=
 =?utf-8?B?dzM1RkozRG1QZGpkRy9XRDVCd2R4QVVFMlJ3Z3dHSW1TNHIzQldnSDhHZk5Q?=
 =?utf-8?B?cVRSS2I3N0JaQ2VwMXU4YlpEMHc1UUFYd2JXZ1dSVURLcHZ6Z0Nib2pHNlk3?=
 =?utf-8?B?RDhXK3VKYXozNVpHdE80QzdXWVJWMk01dm94aWFxVk9DdnFnTFIxTk9xN3B5?=
 =?utf-8?B?V3lMK1pCUG1qbUF0NFlHUTZlWTN0Uk0wVUx3SXh0djA2RDFldGV3czhTN0V0?=
 =?utf-8?B?dmNVVmFOK0RzeHZRdFR6bnZGNTBvSjZaZDJHU1hqbktrSS9MYU54Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a125966-d777-41b3-fbfe-08da4a0bc6e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 11:32:46.9743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zb8VU5v91jKtp6YnHNAWCr73gCuFfH2EpZ1jN4MbxtT6hv6v+xyIKCJpE6kw6w7wvrQOd691JuunE0BHR9PJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 09.06.2022 13:17, Roberto Bagnara wrote:
> On 09/06/22 09:04, Jan Beulich wrote:
>> On 09.06.2022 03:20, Stefano Stabellini wrote:
>>> Finally, for Rule 13.2, I updated the link to ECLAIR's results. There
>>> are a lot more violations than just 4, but I don't know if they are
>>> valid or false positives.
>>
>> I've picked just the one case in xen/common/efi/ebmalloc.c to check,
>> and it says "possibly". That's because evaluation of function call
>> arguments involves the calling of (in this case two) further
>> functions. If those functions had side effects (which apparently the
>> tool can't figure), there would indeed be a problem.
>>
>> The (Arm based) count of almost 10k violations is clearly a concern.
>> I don't consider it even remotely reasonable to add 10k comments, no
>> matter how brief, to cover all the false positives.
> 
> Again, the MISRA approach is a preventive one.
> If you have reasons you want to write
> 
>     f(g(), h());
> 
> then declare g() and h() as pure (or const, if they are const).
> E.g.:
> 
> #if COMPILER_SUPPORTS_PURE
> #define PURE __attribute__((pure))
> #else
> #define PURE
> #endif
> 
> int g(void) PURE;
> int h(void) PURE;
> 
> It's good documentation, it improves compiler diagnostics,
> and it satisfies Rule 13.2.

But such attributes first of all should be correct. They wouldn't be
in the case I've looked at (involving two __virt_to_maddr() invocations),
as the underlying va_to_par() isn't pure. Still in the normal case the
sequence of calls made is irrelevant to the overall result.

As to improving compiler diagnostics: It has been my experience that
pure and const are largely ignored when used on inline functions. The
compiler rather looks at the inline-expanded code to judge. (But it has
been a couple of years back that I last checked, so things may have
changed since then.)

Jan

