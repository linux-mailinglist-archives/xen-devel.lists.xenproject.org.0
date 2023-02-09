Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9A690AE4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 14:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492470.762008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7Lw-0002AG-DY; Thu, 09 Feb 2023 13:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492470.762008; Thu, 09 Feb 2023 13:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7Lw-000289-Aw; Thu, 09 Feb 2023 13:52:44 +0000
Received: by outflank-mailman (input) for mailman id 492470;
 Thu, 09 Feb 2023 13:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ7Lv-00027S-28
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 13:52:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0513ab4e-a881-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 14:52:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8277.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 13:52:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 13:52:38 +0000
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
X-Inumbo-ID: 0513ab4e-a881-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbNLCj1HwAAUHx5eTazFh52OrBXLOV9i4GQxEryfubVYLSKQaLPKfcPkKl2++HyB34ejqTFBlEQV8r2GWSNkiXrYQyiq2xG4i2BFwY01QPPnWIE95IrySDCukNU7p0Wzzd+l6lq9NrFiJPbu0pSyU04pii7b68haoexdH9kLZmLrsneh4Ktolh1R+oM0bKBwuLXW1BxPD4kbd168Fp0TuTbzrjrSttWHYeFKggJm7y/Ks+JXwLg9AfP07Q/txumFVt/9LH+rBei/LVW99j6+1/9L8o4QPr2geKloLoUTa92e/wNW9pBftvjFVjkFiqQ/Ix6zD9UzkYXGvuIim9+cCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIh58v5MdV3BdPr4+i6BcZ+zdr62X2V6VkBVxHDVuX4=;
 b=S4OGt/Ae3BMsSB3kTClKp2px5803DtjdKbSLN9ImiBwtfkQ5UbDvGYCsv+TmsEk3QO2IIs2reKH61u72uYwydE4wQ13Peb96v0RWXGSBZ5Ybb/cNcgaUwDvo0z1vzm0M8i9gWHa/qDwLBiSlTT1lvowALZtO1wmmlraiJoo+YJfrYnUqTex+j1FAVdYwWlDAwlx4+piCOyEuD9G/cLD1FahuU6gC8vNgpkxbqBzOHiVSU+gTzHxcC/SeH0t6xqe9NcVoVWSgiNh49M8tRT5oJ8R6LoTu8qLWv08KSd4gO1IGSuofYWOI4/nwU0wKXHjPDblWP0zDkx1NqVl+cBKmCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIh58v5MdV3BdPr4+i6BcZ+zdr62X2V6VkBVxHDVuX4=;
 b=nv4nlA4D3hJgVJuLF13j1gFVBaz7cAKJmIU32aSZZCwpze3Wky7thrHr1eQb1Z25FPGrcGqZXSVHnrKTn0MR7PQC5rXMjEAVOk1++QFrtQQr5ST/iibdcDQxPJnUX2ILl8qJQraj9ViZoI6VzQOMeFa74kIo8W0+4olRUKULsu84D4a/CNQs8zL9sjxK9KKy7zfNJ9kMjjaC9Vsd0UIXuwGs1F6ocHNieoS5CYF3Aac9kiyva+ggA7CgM/fKjVk33zS9HC3aQrd7TQt9VrGbPCga+jM+cvuL8Cx8uK5MJiCtn65pzXshGH3Ecs6iXzr5gs+23bEsaGM5gbMQQbQacA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f439ef1-ee1f-e1f8-4432-0ead84e43fde@suse.com>
Date: Thu, 9 Feb 2023 14:52:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
 <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
 <bee6af5c-6000-461b-7642-2864d412e351@suse.com>
 <e69eb6695310ed63eb68291f76ba1ec96626d68b.camel@gmail.com>
 <1331e8eb-652a-3bdd-2c98-ee695b03d12a@suse.com>
 <25bd709316631ceac04876b40898d3c970e4ba50.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25bd709316631ceac04876b40898d3c970e4ba50.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f319c3-eb26-403e-8ad3-08db0aa4e7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a6kevZhTj3LS2hsbP38gx8gszaxUVd2Ww15AOy0PrDDZZNt5LnBritYKiSDYS3tK3V5JoDHATHUockfyZnrgP7lGKrnVEh91fQaqlDOD+F4WG09fY1D0q/5oEhFk8CDdyL3WJgM8+gXoYEndSxHMghxLdbh9XcBcRgNNJzWKVdBEaL9BMDoN6sfvxKPMZ+b+WKoZlJSvFO97L4kFQNzN03lfK8sqcVfqAe3oapAKC2IlsrpF47+GMgA/4rHhoy4Iqaa08NS43p2nNmQIGGUHinLEu6Pq6EeTdu9Odvfr09lZJ4BMuqmbQ1QiwdWxIvuK2tg5tuJoWXSZz3QubmVhZt6cdlhfgA5R8QVBWdTXjtb6w9Kn9/qNK8zRq/ZXg9Gkx61ytjxSvw3iHT5jyz+w3ivgUaQrXw2RmljiTZpRKzMe4IAbqPHVA8p/pcuWv6VyUgmlJvGV2fuCIEI8vEXEI7khOkojE++RNpIFVSZesA5DV92oWF/Bol9gTju6QfJL33Uzc1Fa9zF+kM+QqEUU6Z0ZjhuKcB4aAa0RGEmUUlFm/bYuXArEQ6efxWUgzFrWaCClldM0TqsVMJzL6u9p2QFYWYcaTz2yhPuVt260eDH7IL+DdX9spReDVFPXPOzYc6WEuRzIMKwlEZoOj4bplvhJmjxNlhYf4n1FAlkKtkLQ8555UoAPdLsVTqI7iQ6d3gYnI9m7k2buIe235VMMsy1YpALM2O/t6i2YXMc9HNlYTTlMV2OmY87tnUqZ6D1NySvSPfRHgny0DNCTUy41tAxgWFgXEmQ7bh1XWxqBA5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199018)(38100700002)(26005)(6512007)(41300700001)(6666004)(186003)(2906002)(8936002)(316002)(6486002)(966005)(2616005)(478600001)(4326008)(66946007)(6916009)(31686004)(86362001)(66556008)(66476007)(8676002)(36756003)(6506007)(54906003)(5660300002)(53546011)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEZPRGJoS1l5TUZXSEFmNmNheXBxWjFjUkgxdjBWaTJLd1V3NVMzdUZFZ0hJ?=
 =?utf-8?B?TEZyUElQTU1ob21oaDBTNVBKWFVIeUZsRnZ5SFN2a2k4MDR6aXpRSkl4K1R5?=
 =?utf-8?B?by9LMDVjYkpYcUhQZFVvWWYzcWxEbzhpK0RzVHRONENlV1R1bkVLRnNwY3pn?=
 =?utf-8?B?TklZUmdvZDBNMXFvUEExZGFKZ0VmOUJJUjdhVjh6SHJROHFVMEFWenpUcnlC?=
 =?utf-8?B?elZVcDIyRG9wMnBZNjc2cllDRmltVE13b0IxdDc4Vm42N3FaVllCQTVIM3RD?=
 =?utf-8?B?MHZsRDhsaGNsUlR4d2tRbWJZVUN2L2VodWhMZWF3c0hBK1JmajdERVE2R3B3?=
 =?utf-8?B?N2VMaFN3RFo0YjZ3MzM2anVVTzQwU2poWG8vcDRzeWpYSEtIQ1ZDVXJUeFVV?=
 =?utf-8?B?MmJsVGdSbEhWNFZwMitDUWpOZVp6YkNTREF5NFZZdWF1NzNpTEl6Wm5OUFFQ?=
 =?utf-8?B?TEoyWXFKL1prT3RlZHlFWW9vNGwvUjE1dlprMGZWTUNGRFhneXJjbFkyZE1q?=
 =?utf-8?B?cHlKazJFZXlZMlI5U1lxTFRpakZneUVYdDFmZG9MNEh2ZDVtR2xlQjdxY1Bi?=
 =?utf-8?B?ZUNrUHNJMHp4SE9hZ0xzNktHWmR4UE9FSThHM3I5TWhBRUd0NHBPdmlmQUN5?=
 =?utf-8?B?NUxaSVFGSm9sZG1SdVZHSGZERUFla1B6UUx2QUVOWkJWanMzQ0xPUDF2SlMv?=
 =?utf-8?B?SDRZQUxmam1PRCtDN2NsZjNZNE5VT1RMa1M2WGpxcS8wN3NjNWJzMncrS0pm?=
 =?utf-8?B?SUlhd2pSU0h5ZExpTWFEcVpuVUdzMHlXOUlTenFqRU5oRFVCT2pEaXo2UW1E?=
 =?utf-8?B?TWNYbUNzQVhDMHNKMjBwaWpNMkZBelV1bmpOVVZzbGtEZWhRU3l1L0F4MVlr?=
 =?utf-8?B?U25pVHF4KzJESmJJTVRpQ1ZHZXJwclN3U0JKLy9FckIvZmR1bzBXbmIxNFBY?=
 =?utf-8?B?ZmZheFBDT1Nua3R6R3FrcXNOc2dVejdRb1htdW5DQ2VFTTZMbVdYNXpMY1Nm?=
 =?utf-8?B?aTljbitVQURaazNGaHdaTlpvWnV3cGZOMUhPNjlBYnBrMldHdG9YZWFYQkd6?=
 =?utf-8?B?MnhsK3FLYldSeW9ieE9zRnVERUNxQ1MyeDRFamg1SFBQaWxYWGRodkl4bjZj?=
 =?utf-8?B?d3lwS3NSRFc2V0FORUNDRlRsTjZsVis2bkZXRVJmVCtHUk43bUFrQkZ2UnFB?=
 =?utf-8?B?bnZmR0ZSYWIrSzlabk5oZlhJMkoxOW95N04rc0Z4UHkvc1NLLzhmK01uWTRw?=
 =?utf-8?B?T0wySXA0OG01SHlnYVJGQUZrcElwTk1XaDQ4RU1GaER4bFBlQm95ZlAzSnla?=
 =?utf-8?B?S3NqQ293cHNmbkphQmFHZmUxSWo1blRqL3lhZmYxV09nRlBEU1ZZZnB0OXg1?=
 =?utf-8?B?d29vUDFLL3pmZ0tTOXBHSXB3Nk5BUjNoUE9heEJZa0ordVk0RDBjbithMkNv?=
 =?utf-8?B?c1ZpS1c4Z2lybW45ZnE1akpybWZuZ1ozRzJ5dlFTUDh2UnFoVExHZ2VQTkJa?=
 =?utf-8?B?aWlUMjJkd1NaeHg3UXFROGRDbG5mdEhzYzNoS2cwS3hFc28zR2Y1dGJBdHFK?=
 =?utf-8?B?L01hSE1qdW15RHBDNzRHTDdBbUd2ZmgyNXJFK0ZpNXRzVGdaNzJjajZWa2dX?=
 =?utf-8?B?MkhPNW90SEZSVjg4R2F6enh4aWFIMTNWK1RiUzlRV1hiNWNwUHkwK3F3a0pj?=
 =?utf-8?B?RUc1Mnp5bDR1MnZ6R3lyOWMwWXBIZEJMTjRoTGduSkY3aXZlUUhOclVKUW84?=
 =?utf-8?B?bVlCK215WTRDMkdpcXIraCswMG5mMGEvZExOdiswT1YyUVdJMFlsSVNPQ3RX?=
 =?utf-8?B?U0hRRmppZ3YzVkIxVkkvT2pSK1R3bW5tRGU4Z1FMMC8rYlo0RTIyTFpMa2Ev?=
 =?utf-8?B?TnNLSGlWRkxFOTBzVi9LaVJoMDZNWmJIMmRuV0NmK1R4YzJLeENjaUc3cDIy?=
 =?utf-8?B?Um9Cdno4RUZkSGZuejEwejZuNytEenYwZ25KLzVNK1ZVR2krNnpLanlTZ1hH?=
 =?utf-8?B?QzVFNEhGZXl1OHNYMWUrcWYrWjl0WWFRMnNDT2tnU29YTTVxclRiYWc3WnZN?=
 =?utf-8?B?bFpNNW00L3lPOEYwQ2VQdDgzdkRIR3hTWVpaWU9ySUFUclRQYUI2bGhmOU1K?=
 =?utf-8?Q?kK/zuHPiZZajr+teJQT34ssVZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f319c3-eb26-403e-8ad3-08db0aa4e7d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:52:38.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9CxJA5F6EFceFO1UFsoOsEOE3v9lEb/Sp08ETY7qV8fWtXKMtDw4hteJV04DdLreFPFGefGiZF0Zgl4khvgvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8277

On 09.02.2023 13:35, Oleksii wrote:
> On Wed, 2023-02-08 at 15:01 +0100, Jan Beulich wrote:
>> On 08.02.2023 13:00, Oleksii wrote:
>>> On Tue, 2023-02-07 at 16:07 +0100, Jan Beulich wrote:
>>>> On 07.02.2023 15:46, Oleksii Kurochko wrote:
>>>>> +    switch ( id )
>>>>> +    {
>>>>> +    case BUGFRAME_warn:
>>>>> +        /*
>>>>> +         * TODO: change early_printk's function to
>>>>> early_printk
>>>>> with format
>>>>> +         *       when s(n)printf() will be added.
>>>>> +         */
>>>>> +        early_printk("Xen WARN at ");
>>>>> +        early_printk(filename);
>>>>> +        early_printk(":");
>>>>> +        // early_printk_hnum(lineno);
>>>>
>>>> What's this? At the very least the comment is malformed.
>>> It's an old code that should be removed.
>>
>> Removed? I.e. the line number will never be logged?
> It will, but:
> 1. I decided not to provide early_printk_hnum() and focus on getting
> printk() working.
> 2. I introduced generic do_bug_frame() [1] (at least, for ARM and RISC-
> V) so the current implementation will be switched to generic one when
> panic, printk and find_text_region() (virtual memory) will be
> ready/merged. It is what I am going to do next.

If that's to tell me that the code above to going to be replaced soon,
then a well-formed commented-out piece of code is probably best for now.

Jan

> [2] - is a link to patch series with introduction of generic
> implementation of macros from bug.h. Probably you can look at it too
> when you will have free time. Thank you so much for your attention and
> participation.
> 
> [1]
> https://lore.kernel.org/xen-devel/8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com/
> [2]
> https://lore.kernel.org/xen-devel/?q=%22introduce+generic+implementation+of+macros+from+bug.h%22
>>
>> Jan
> 
> ~ Oleksii
> 


