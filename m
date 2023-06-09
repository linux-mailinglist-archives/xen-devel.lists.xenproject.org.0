Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5907293E8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 10:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545690.852198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7XtR-0004nm-A6; Fri, 09 Jun 2023 08:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545690.852198; Fri, 09 Jun 2023 08:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7XtR-0004lX-6x; Fri, 09 Jun 2023 08:54:49 +0000
Received: by outflank-mailman (input) for mailman id 545690;
 Fri, 09 Jun 2023 08:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7XtP-0004lR-4S
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 08:54:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4777f48c-06a3-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 10:54:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9270.eurprd04.prod.outlook.com (2603:10a6:102:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 08:54:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 08:54:41 +0000
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
X-Inumbo-ID: 4777f48c-06a3-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYGav2Syd7eBIxdqT7kpVXKUD8iJWZU3zbz0lYWq2XtH2RsSDEtuGz668ySB+xDXGXsZrUXC70pxC2fACdya8XzXyPcjP3Hi1DWqIad4JDsIeXlg134yTmyAZZM1R9RMIivHUj63GWRkLSMjcd9Oc3hqm7c8UqREzfcGCu3lsQm4AcZjP8KQFwOMWbF+jAwJZRcZKSp3EU66BA5+szSIU/fvY3xg8TjJkfXkuXOuzjJwgLx8i9enJPSsNHGxi7RoLB5IS6OR3A5WPIjQmES96KSSboIKyuI9cNRPq1I1Z21LVzxZGJ4TMiCswoPtkKkNJ9kEKREr8Ro6uhFyDmG/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE1oF5I5wbN4sICMzWI5ENwPeCVLgxBi+LEDXnKy5Vw=;
 b=nuBVhTSmQaJRe31MSjxwivDa8x5Zz4cAYUEtBHcb8hdhoZ74iwuWERYHT0/WnDnuleriKlLrGAyNri4AmrsGXWA2P6byC+4pGOU1ahu4JsJxmP5d5/hCct9ahlLfcvgs7EuicDk3RpKwSwJZ3zGoAyXjZtjrxcQy59DqzfECxTaGMsBUK2A8LlpPIc0dN7dLFKK6v0mClp/zhsVf+Dcp46AZdpwSD9XuPeCEJH2aoXUxvdffUmKnwvqzFS8g2VLwZj7WG55uculxDinTBh8uPObxG5/Of1IvrgyIqQExHBHzc1EuKgmVyhZdwb8j8QTK0dGk+8kjOhxp171YoaMl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE1oF5I5wbN4sICMzWI5ENwPeCVLgxBi+LEDXnKy5Vw=;
 b=K26MYiHOX3l391Plz79ItDh4ruEOm39Ksa85u149CzPaGjQEON5As1VwIf+p3RO+wQB0Ad7fZmi0o7ISXtSe37madVpE3r0ToPIAUnS743Yprf1LSBaIl6Z/h3etRdhwzlqABMeJqFGLhME785ibC3GxTbhpy2AxXdjeZn3xGqSW9U2tRZJ6ZNTMN21QKQsP0kj/+Whz9vmTTMxS68rVICSt4p9deZcy0Ej0Yd2bGEjP6ZwJix9tIJwc0WKdlQnpJFP1CGVPEI0vgDn7KVvl2wGTKY0dQACKKWEiadpw1TB2zryqw7LlLGF/4RLC2RgJ1px5XNxbWEw/KU5G2Nj5Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
Date: Fri, 9 Jun 2023 10:54:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Roberto Bagnara <bagnara@cs.unipr.it>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cfef7d-476b-40ec-c765-08db68c729a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qLMS0h/Mf/OVK5Mcw5+2ZoFs0vpPpjtsIf+mXx2GBMF2yzY8P8LLHbt1WLjGyNwiANJajPvugm4Si1m74mIdF2fpMl9Wfae7P/g/wMl2+yqv0McZnT6I8bMJuAqMCUdHFjpoLHLCNhERY788ASSPnqktGqwtMMETIQw9qIKB8SnEPtAWP4bwdpJ69tYvBdx2cWmJD2PVZmlz/9nHsdXPgA0mx9Px+LM4B4fhzyd2JyURfi5fk43lGYMcSf6ZSEV7HGazy4PJNv19djvAkLBAhcxkD09uPaZGzgxMPCIzN6Layt/yMNiTd0CAesozrNBkqaP359MkHWTi5hmkrFg/LRIvbBubXQCWOncIpf83By19IeYsxxF2dc9FUE7G5sjEFzZSQlS23A5ELHVcQ24pt4v54CWglqgvjm5C/J8hauh+DUcSZeysAxw6ZASLjyoLBMLC9Z+C6eyuNU7UbvgZjLbkLowYCG04kP/MkLLFBMgQY9FeDtxkEfraBRFN5EhtUaWjrABhLPfK+ENhtMhPx6LMtb/S9B/u/pZT4H+hDJiyjUmB9IBv6LJ35YqY+OCbEdtxYZG6ZihRzOSypSZDXHC1p0MNiG1jkPWmhu7wNngZ+F2csLDOjqHvwoFMc2VUkvIs8i/9S94vZjRXBCxbYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(36756003)(86362001)(31696002)(478600001)(4326008)(54906003)(6916009)(316002)(66946007)(66476007)(66556008)(6486002)(8936002)(8676002)(41300700001)(2906002)(5660300002)(38100700002)(2616005)(6512007)(26005)(6506007)(186003)(53546011)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUxTTEFMMmxyWi9tVTNOLzZNL3VTeUh0aHVjOHRMQmpqM0Z0SFJJVnQvbVpF?=
 =?utf-8?B?SndoQitPNlVsdGFqMFowSG82MzlmNm5lZGZaODhieWh2cHUrejg5S2dQSXJI?=
 =?utf-8?B?OEt0TGg0U040bWlIbjh5TWFWM2JQVGZYTnJ5U1ErZ1RGSTJaUEd5eFlNc0tZ?=
 =?utf-8?B?RWZzQVdjVlArYjNiQWFwYlZINERHMTYzbnhBdFJqb3U5QjNBR0IwZ28yd2FC?=
 =?utf-8?B?azk5Y0hpUDdNS09SMGUyWFZ4b0RLemdNQnRrcGErd0NuR2NhcTIyQmxKdjJj?=
 =?utf-8?B?eW5PZytIT3VXVGEwdjBXWDFxRGwzTG5XeW5LOWs0UjZYUm9sTjBIMHMxMTFq?=
 =?utf-8?B?UVpaUGN6NlRwV0NUZU1GajVTNlVZa1ZWSDJDdkZMVSt5SWpUWGpFMW1ZcHNj?=
 =?utf-8?B?S2tpaEI0ZnBBZWdRUXdUbk4wbUtDNzBqWFRDT0p1bFFQYkgwQk1NelpPcjhj?=
 =?utf-8?B?NlJrcUl0SHdUTk9hZkM5ejhnV1BxdlI0Zzk0eFZpdGoyUUw1cmw3YXAvUW40?=
 =?utf-8?B?aXhEdThhUXhweDM1aW9CWXdHTVJ6MTJZalN6YXNSRjNjNis0ZmUxNWZrRys5?=
 =?utf-8?B?MElHQ1dZR2g1WWZ2cVFKMkNxNEZ5dS9QdXVPeVlFcFNrYzNSMHpxazVsYUMv?=
 =?utf-8?B?S29Xd1hNNFU2QzFQMjZvWVU0Y1RoSkNqK1I1M2tlNEdmdkFtSFR1TjFJSHpt?=
 =?utf-8?B?b1dZZ3phMVkzRXRuLy80ZVFvS09ISTRVUjlzc2MrbXRsQkNLRkR6b05oUVBq?=
 =?utf-8?B?bkYrd1dHSXZIWjdWdEQ4T3drcEkzYm9WcCs3NUhNTk4zQ1lETjdmUWIzTkl2?=
 =?utf-8?B?MkhMRXBzRW11MU5kZFJpbElaT2RtVFpYL3A3cmNCVWRuYjZSTDhyRldsd29H?=
 =?utf-8?B?Q3gyZHkxZk04RmxyTjZBcnZobHhYYmlKNTg3VmROc3IxYTRLalRnU2VFbnZE?=
 =?utf-8?B?amdUNVNDOGFSSlBTcWMzdk1BYjQ0ZDhtRWxiTnFqcmlyL2xHTE5HOG16TGVx?=
 =?utf-8?B?TmlFQzVmOVJpTUpvOTE1OU9ON2pSb1N1SElnb2FBWWNxRExXQ1o0bnVvTlFs?=
 =?utf-8?B?bys5b05XNnpYbGJabkVQQktkb0ZXa0dxeDBBczFnZEcxWHROVFVpOEFIYmdj?=
 =?utf-8?B?Vi8yYmdYdkw3M3l4NDd4YytPM1UvOXlERkpaWHhRaDltQkMzVmQ0ZnJ4K2hD?=
 =?utf-8?B?OEZhb1RYRkI0aUFqbTU3ZWQzek1jaVBOQUYyUVVuUjBXZktYSzRheG1BR21i?=
 =?utf-8?B?Z3UvRG81b1J5ZDdrbkFVNUdEYlFYdlQ4VEFMNWJEWTFyMUk1Ym1UcEhjNFVQ?=
 =?utf-8?B?RGg5ellDUXlEUEhVbjdXSnRmS1hBU2FJalVqa0VZQjdVdFEwTnFPUWVUWmlU?=
 =?utf-8?B?SjhxNGIwQ0Z2L0x2YzVHYjFsV1RSRTBqdkZWK2o5MGlKSGdsSUhKNW95aTZl?=
 =?utf-8?B?eDR2VEFzMW5IR3NwVjdEblczZzVFRDNTY1NwbzlORnpyamJCZk5udzVJQ0tI?=
 =?utf-8?B?OU90RXBCdVp0TEhuK2FzNmg2OGEyWExRdFc2NktRWlQ2b2t5SW9rZHh4WnIz?=
 =?utf-8?B?Z1MrSEZLZDRJdlEzQjc3WlM0bUI0dm1WRWI1K3NUQXFNU2ZJMzdzMm0vamlU?=
 =?utf-8?B?QU9sRUpNR2JtVGRMS2dDeTZHcG9NVGRMa2t2YW9HMURZdTJBRlRZRXdzOWpV?=
 =?utf-8?B?YStFZi9ETTlpRVh2VDVQQkhXMkVyQVFXbnQyVnUxbHFoWFNCM2w2TDlaeW13?=
 =?utf-8?B?YWM2K0E3RXIxY3V1ZkszSTBmbEhwSExOSndZdjBUWjRRRWhaSFByZm5tbjFG?=
 =?utf-8?B?VGJud1czUjMxZWw0LzFGajZPZUVFaXBQeWo1ODREWExmSXdFT2F6dDZuZGE1?=
 =?utf-8?B?YVoyaFR6M0xhSkI1STJxcUlLaU96VWhjUXU4UitEa1gyeE1pdWNPU1RTL2dQ?=
 =?utf-8?B?U2RvSXFFOVd1YXNzbVdEQTRDd21NTHV3UGo3VkRkVzVsNzZXV3hnbUt1Wldh?=
 =?utf-8?B?aHBPVXVHZHU3djE5MVhiZ2cyUWt6NnpmQWNmNlV4RTU1MVdqcW9EbDhIaXFN?=
 =?utf-8?B?R3E2a1ROVnZaVHBsY1BQTFpRZVhqeG5STUZqcVBQZW15MTAvbG5EN1FheG43?=
 =?utf-8?Q?TDV0WwUW0s6bCmYxg2QGI1a7Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cfef7d-476b-40ec-c765-08db68c729a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 08:54:41.0663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qny+jqD4z7O5fKIuK1iESa1mlfnXlKOkR6pLDm0uBikTFuwLLAPxAE5HEen4vE6Ekz3aCCZfIU8pdqBdoWaCYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9270

On 08.06.2023 14:18, Roberto Bagnara wrote:
> On 07/06/23 09:39, Jan Beulich wrote:
>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>> You are right: here are a few examples for U2:
>>>
>>> xen/arch/arm/cpuerrata.c:92.12-92.35:
>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>> xen/include/xen/spinlock.h:31.21-31.23: expanded from macro `_LOCK_DEBUG'
>>> xen/include/xen/spinlock.h:143.57-143.67: expanded from macro `SPIN_LOCK_UNLOCKED'
>>> xen/include/xen/spinlock.h:144.43-144.60: expanded from macro `DEFINE_SPINLOCK'
>>
>> I'm afraid this is a bad example, as it goes hand-in-hand with using
>> another extension. I don't think using a non-empty initialization list
>> is going to work with
>>
>> union lock_debug { };
> 
> Yes, this is C99 undefined behavior 58:
> "A structure or union is defined as containing no named members (6.7.2.1)."
> 
> Here is another example:
> 
> lpae_t pte = {};
> 
> whereas we have
> 
> typedef union {
>      uint64_t bits;
>      lpae_pt_t pt;
>      lpae_p2m_t p2m;
>      lpae_walk_t walk;
> } lpae_t;
> 
> 
>>> xen/arch/arm/cpuerrata.c:678.5-678.6:
>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> xen/arch/arm/cpufeature.c:33.5-33.6:
>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>
>> Both of these are a common idiom we use: The "sentinel" of an array
>> of compound type initializer.
> 
> Wouldn't it be possible writing such sentinels in a standard-compliant
> way, like {0} or similar, instead of {}?

I would be possible, sure, but the question is whether we want that. Iirc
in review comments we've been asking to preferably use {}, for being
shorter / less clutter without resulting in any ambiguity.

>>>>> U6) Empty declarations.
>>>
>>> Examples:
>>>
>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>
>> Looks like these could be taken care of by finally purging our
>> EXPORT_SYMBOL() stub.
>>
>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>
>> I'm having trouble spotting anything suspicious there.
> 
> The macro expands to definitions of inline functions
> and after the macro invocation there is a ";".
> 
> The preprocessed code is then:
> 
> static inline void foo() { ... }
> ;
> 
> where the final ";" is an empty declaration not allowed by
> the C99 language standard.

Oh, I see.

> Removing the ";" after the macro invocation is a possible solution,
> but other possibilities exist if this is strongly unwanted.

We have other macros to instantiate functions, and there no stray
semicolons are used. I think this wants doing the same way here, but it
being Arm code the ultimate say is with the Arm maintainers.

Jan

