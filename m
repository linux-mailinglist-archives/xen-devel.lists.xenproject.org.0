Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B733793563
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 08:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596230.930036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdm5a-0005zE-3V; Wed, 06 Sep 2023 06:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596230.930036; Wed, 06 Sep 2023 06:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdm5a-0005wX-0m; Wed, 06 Sep 2023 06:32:34 +0000
Received: by outflank-mailman (input) for mailman id 596230;
 Wed, 06 Sep 2023 06:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdm5Y-0005wP-N7
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 06:32:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 275cb8b8-4c7f-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 08:32:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9711.eurprd04.prod.outlook.com (2603:10a6:102:267::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 06:32:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 06:32:28 +0000
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
X-Inumbo-ID: 275cb8b8-4c7f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWjwORNcMoMqdStdALC1AjRJ39xrlI5aJXuA97CqAYe1mj+JB8oYwTRZ9HJA83KylNLlH4ERaoiZJRIjyYc7lTzLzP5E7EJcBynMn2WFOopM3ZNm5PuGxOkQUmZvfvcknHB7ilAxrTYk21YLBqezNRKrqXgKtaS6/gdh2DMGR0+25718u+rwVl8VWHfc3hjRKz6DGPpUbV/YsSbzdLvNPon3or1peScCjlHPXND56pgJaLzuvo+KdhFXD0Xb2WI6FAcmtOF25dc1SDWlyqP4Qt8/FARVKGlF/52nS3jF7HGkCYkVKUM55Md3lcL+NI3PKlNDomsUKD1/UqC6sdluug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUWmwin3pKqy2LcyeZ6RR9krFaO+29MQUinPN/EI4Ao=;
 b=UzPM9jCLfFvv47jPnNeoDTbQOPZhsWcfa+x+iLk7WXtBWfRgOe7QQpkU7F5BJ8tXYbgxdfAbh0beqyhwiLVQEExfQ2Xp9cPeuhkyZVKayBfKujvh8bWc1ivUiTPWFdoDbnuTsnFPpTFR+ZORgSRoF02WRGRWmXbfxHfVSOEigpOvlVpNm8v5SoSvjyM1WX8HpeJ0PwMeZ8/kJQ3viSfgwCln56zuIlYsA9vPLeYMfm7ylrRSeuPkpXqadl8HIPr0j+PcOZXOnAjo8Ft6ipxcMAI/p+YBNXA/vz8cHwMsXcfU/U6CEo5Nl45HP1XSspoG1WRMYFQcFp2j8mLkANXwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUWmwin3pKqy2LcyeZ6RR9krFaO+29MQUinPN/EI4Ao=;
 b=VChuqZOhkStRZB5Rog21u9HqELntOnSBvMt4g9XOaBrhLoJLdSKJ7c9q4CDrLOSTVMvfxYtMSPU3FvEJtiD2YdzZEB0FsGKLhmyfn0mRiAYJRLxkA17A6bFLRnbuGeWcXyKHxTgm2B0M3ww/OND9Ooq6rv+u2S6Ma4de23QBhm+t/8BVjjXSgKVWfVZNqvus3oI5z+/g6+lmKEcXJwF/90fSF2bcc81igNe84PWrues4j7Enm2PBtGkcHiFAzxg5/MlPVowKBBFhCgorLvxR9Ai3hORmbj9Mz21t5QtfnSchXlpoVQOc3xcbiL+ABsZ+Csz0+ue6NLFJHHYSG+SCCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <096eec08-04e4-638f-d250-3a4785a3309d@suse.com>
Date: Wed, 6 Sep 2023 08:32:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop>
 <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
 <alpine.DEB.2.22.394.2309051519270.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309051519270.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: 1205e20a-1a54-41c0-3387-08dbaea30a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/Wao83NGr5uid/euj1BZGi+zSerzzwf1ipgMzLn+yjxGzEZxEaZ9muTleqgPMh/E1yN951Xu36XbZj00Ych8ZQX0oeqC7Xjrq8dS6ysUCjzR68pxxwENfiUBLREooa29pMb+yd2dymDN+iHCuA/Nh+EvHTdZ8B9dRr1cGWlYk+GvT7Waowfe7v42XzxkUevHv92LP5sENwn3aHFXMi76pVM3tghZjboM8zWuKCp0mRIEPhmeeI8xR6H3IYuc2qrU6uVLtfvixBOKkF64PAKaNl0qeT07EXC6xVsT45pDRLYraFxut2fKUukiBl53a1vj5nXNoX8JtEnmtqAGkIPrjYVPaZv43CLB2oWc4BxEtEajmV0rq9zkYZXjAMOHSJPcaHC9tjL7wV6iPLaDt7iEGrVdPS6rU8uQ++cfabIPYF7aPFBakt1xBCNJ38M+hSf29SolJEoMIwtgoXEsdsDDC/Ic84zrrCQNnujnMPB00d715y0rJvaFtnLsG+nUdFQnhGvJR+baa97oUuO4c50gDXtrv5whiF/dEpeT6FbeZzpImiR0DPwnZ+XOb5HBuNBX8yxcyOFqnwnbPvO2aHyVE1kiBj0HzHnYA2FJ7SYsyQ34VoDT/BZYdActROAP9NQYZUWm8PGIiaxJreS66gL2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(186009)(451199024)(1800799009)(41300700001)(38100700002)(86362001)(6666004)(83380400001)(478600001)(2616005)(31696002)(26005)(6512007)(53546011)(6486002)(6506007)(66946007)(66476007)(36756003)(2906002)(66556008)(316002)(54906003)(110136005)(31686004)(8936002)(5660300002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGdmdmpUbjlIMW9xcHFsNVk3MmhSNlFjekRqVWErVXdqMWs3SjNKYVhtSmNQ?=
 =?utf-8?B?YVN2K2pUbk9GZVhNOEF0TGtpU1VXOE5ZVzMxQjlRU1FNck9lTS9KWHRXM0lm?=
 =?utf-8?B?bHErMW94bWVnNW43dFBTSEJ5aG8rdjZKMUlOYm5MemJtMnpBYkhjKy9YQ003?=
 =?utf-8?B?aFI5TnhSWnpoYWN3Y1NzbVB6UXFrTjVqNURCOG15ajZMQmtvR2pVa0RZbHAx?=
 =?utf-8?B?ejl2OTJOS3hkcVY4SmV5Z0xYS0orOWFubzZWdWgxQ2lsVlZvbmZNMnUyYzNP?=
 =?utf-8?B?aHRDMnI1eUV6KzZzdmloYWFkdEdDYXhMK3ZrdnVKRCtRRlBmM1IxYW9Gb2tG?=
 =?utf-8?B?ZUZ6Z1NpMFlCajR2THNJOEJyN3pOd0orY1pLT3hsRUpwNEl6TjNqME5ZZXFI?=
 =?utf-8?B?OG1BWUUzdzcyejNOT0M0cUpoRU9DWWpkb1Vxd0FPQjgzZWRhV1psUnlMdlpy?=
 =?utf-8?B?d2VFRS96Wkx4aDQybjhDMDVyNXdCV0JwYWdSbno2Z1ZZQlFnZHpSU1lmYXBp?=
 =?utf-8?B?SU5nREt3MUV0d3BPNXYwRnE5S2phcHhrYjNlNy9kaERZSnZ3RUZUNGo0elh0?=
 =?utf-8?B?VlpNM0lhb3JuZVU4SlhRWlcwcGgrYjlqU1BPd1pZejZWWk5YUzZRN0c3b2x3?=
 =?utf-8?B?b0JSVE9iTFRXcDhCOENFWjQrNnczSU9HWlBZaXUycnhUcEtYWThkWWFiVjgv?=
 =?utf-8?B?TFloUzVPWVpzTHJlVnU5TEpIMmlEL2NHbDdLcEdBeUQrSFNvZUlCanVMVXZ5?=
 =?utf-8?B?ZWtUTmFiTENaeHBvaFdvQ2xzd3B4SElkdzlHcGFwT3pHMTZCa0F2NW8wQXcv?=
 =?utf-8?B?OW1aWkpLMU1UMEMzOXFRUWI4QnZlbDA0Q0NnSVlQbUIrN1hVZGlaNzROMEd1?=
 =?utf-8?B?K0hUNXZVVEVpdzdVay9kc1NIKzl3M29peXU3WkVpcmMrdGIwbm44QjVPZXYz?=
 =?utf-8?B?OTd1S1VReFc2aElTQ0Y5b2ZxOUwzVkFvMDNZbkN2bC92dHlpaldZSUorWTNX?=
 =?utf-8?B?cWFocGg1dllaVUVQZTEwT3ZPV3lDZENiTktkRWdFNmtTTzh3bCtDVkZyOFN1?=
 =?utf-8?B?YUhjbWF6RmNpQmJrL3R3M1ZIdUFwNmw3c0FmQTJYSitlRk9id0hyaVpBZ3JJ?=
 =?utf-8?B?ZFNnQXpvMGZBQUxLMDRZWm1pYkw4eG8reStNalZpNHo1N2pPVHNyLzBIbVg3?=
 =?utf-8?B?aURuVGtIcXdhN2lPL1VQNklnd0UrbjZabHhnbFJhQXlVbGVZNzV6d01wbTRw?=
 =?utf-8?B?c2g2WEQrS2NzeEMzWnFpc2pmMFA1S1dTUWo1OXIyTjlOQWU1R1FvODJVZ0RO?=
 =?utf-8?B?cDVVTzlrSFpCZ1Z0aTAzYkdTbmdYUC9MK0R4VWhRQjJiM1pSd3FOUmdKNjl4?=
 =?utf-8?B?eW5XZTdVMFREV3ZKUzJCMUozWXlCOE1SUEVmeGlQUzlkMS9rUGk2eGxGb2ZI?=
 =?utf-8?B?UEhUZm4vSU5BblN1QU1rekt6bWl5SFRFdUJHQUs2Wloybnpsd1dNVHoxNy9D?=
 =?utf-8?B?WkFVVWgrMTZUT2lNYmM2aTRpQjBVMU4zUlhnUnF0NXp2VFp6WXY1NXkyUERW?=
 =?utf-8?B?dmM2NDVXcXlWZ3N0SjhJMGNvY2hNNTM1eFhleHRnMm1yZHZCOFpoZkpqdm9G?=
 =?utf-8?B?VUQybk5hOGx3VXVXaW1SOW1RRlhUWWhqWVVOZGtxZml5T0xyQWVFTy9EczEv?=
 =?utf-8?B?Rm9WeTQweE9CNXNJeGFiNGFRc2VjRnI1SGRBa0dkL1JJcmZzMTNoYlEzVkRZ?=
 =?utf-8?B?UzNaazlBd0xCbHlaMDRxTEorZHlrVkpMMEVyblFLNTJGWjFZRDVGR3hvTmZw?=
 =?utf-8?B?T0RJODhNbUQyR3dkVU1jdE9qYlBwbXV5MklUQ0t1dFJWTmRlUXc5bVN2NVlS?=
 =?utf-8?B?U0Q1NGJYbDFTNnRzenhjN002VUNmS2xhV1U1UDBUb0lrTTU2aXI4dE9XM3hz?=
 =?utf-8?B?SEI3V3FOZ21wRVkwUTd1NFZ6Y2lIVlpSVzlNTDd3a203aDB1UksrR1lTVy9h?=
 =?utf-8?B?NXRUL0EweDlNUWZwdHRhTEVWOVRKdlNaeExXRHlsbjIvbFRJK3h0K1I1alpW?=
 =?utf-8?B?ejNGc0tqeDBVQTh4Njdtd05UcVVXWWx3N2kzYkJ1Q1ZtbHZvSENuVFRVSnly?=
 =?utf-8?Q?9kyfxXAQdN78RX+6GatZZS2x+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1205e20a-1a54-41c0-3387-08dbaea30a87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 06:32:28.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91R5GkMdpay+0bhV6kUah6NEqJVPoaISsKYVX1zdgoHRDsJi6puY/y7WfFUxhd0MfgLKIloEJMOiXC0BGdfhfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9711

On 06.09.2023 00:27, Stefano Stabellini wrote:
> On Thu, 31 Aug 2023, Simone Ballarin wrote:
>> On 29/08/23 00:51, Stefano Stabellini wrote:
>>> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>>>> Move or amended inclusion guards to address violations of
>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>>> to prevent the contents of a header file being included more than
>>>> once").
>>>>
>>>> Inclusion guards must appear at the beginning of the headers
>>>> (comments are permitted anywhere) and the #if directive cannot
>>>> be used for other checks.
>>>>
>>>> Mechanical change.
>>>>
>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>> ---
>>>>   xen/include/xen/err.h       | 4 +++-
>>>>   xen/include/xen/pci_ids.h   | 5 +++++
>>>>   xen/include/xen/softirq.h   | 4 +++-
>>>>   xen/include/xen/unaligned.h | 7 ++++---
>>>>   xen/include/xen/vmap.h      | 4 +++-
>>>>   5 files changed, 18 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
>>>> index 2f29b57d28..a6323d82d7 100644
>>>> --- a/xen/include/xen/err.h
>>>> +++ b/xen/include/xen/err.h
>>>> @@ -1,5 +1,6 @@
>>>> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
>>>> +#if !defined(__XEN_ERR_H__)
>>>>   #define __XEN_ERR_H__
>>>> +#if !defined(__ASSEMBLY__)
>>>
>>> The original pattern was also guarding the header file sufficiently,
>>> protecting it from double-inclusion. In fact, it is posing stricter
>>> restrictions than usual (not laxer). This change is unnecessary?
>>
>> The MISRA directive asks to use one of the two following forms:
>>
>> <start-of-file>
>> #if !defined ( identifier )
>> #define identifier
>> /* Contents of file */
>> #endif
>> <end-of-file>
>>
>> <start-of-file>
>> #ifndef identifier
>> #define identifier
>> /* Contents of file */
>> #endif
>> <end-of-file>
>>
>> I do not see any reason for deviating, but if you ask that, I can do it.
> 
> Let's follow MISRA's form.

This is what I strongly dislike: They could be less restrictive on the
exact patterns permitted without impacting the goal intended to be
reached. But it's all as simple as possible, not as flexible as possible.

In any event, if a transformation like what can still be seen in context
is to be made, then please #ifdef / #ifndef instead of defined(...)
whenever possible.

Jan

