Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CC6C0EF5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 11:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511828.791117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCqi-0006pZ-Gm; Mon, 20 Mar 2023 10:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511828.791117; Mon, 20 Mar 2023 10:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCqi-0006mS-Bb; Mon, 20 Mar 2023 10:34:44 +0000
Received: by outflank-mailman (input) for mailman id 511828;
 Mon, 20 Mar 2023 10:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peCqh-0006mM-7T
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 10:34:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe12::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d228a81f-c70a-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 11:34:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7717.eurprd04.prod.outlook.com (2603:10a6:20b:292::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:34:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:34:35 +0000
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
X-Inumbo-ID: d228a81f-c70a-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1lgmkZ4rWTg/5xx8HTKfYLFAsOItupFOwHZCYDcRTS0R8dKrBQM+yasNKgg/xlkQIuQpqqkM98j1bjozYLWLlB0KEAuWa6kU7Bw/5ui6kY+jsECi8hBRa4mRyDScg9/UQ+BZQn//VTVu/2e3j1OrZ609hPqjtfQyAIVGGIdP/Xd9KrREyq+Qkf+EvuX+f5Ijen1aBAOPbI84k4WLjiP9geMyDPs7weWsx3DiA9T7/QcRr8oDD8z5rgAmhzjdo5emyjq47u2Zcv5EZTcbPud6U66aVNXmW68Ir5MuJBislog0mDS0AOLUPCNea5//9N7SA70IUcldGJfzeLlVvsMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNzBbkB/3KzNTkAWKVBtvGjPS9XdsvspU5p6u38zjf8=;
 b=DgdPjrfcoB2QPny3O87ek8GizOGNkwAfJdvIXj4vdsC53GGscJHPRxDDeUziu5Lcyqh7cBD3i3IDIBPES/Tt94Z2DfYy5Hu814HFg/bV2aCM9UKoHhcKcXBJeDxlozHYNrmMs8AvXhVc0+Kd77m22yZiEvNUEifMrx3904JyfgLjgHKTANitBh/akaHS9LBakFxF41Yw3buQhPDTE+S/yhpQ6DhAv4kBBxmyrFM+Na2B9PpX0h0wZJJihdoPih0FIGG7jxvGJP2ZQI3lJ4faIZ+kzhS+2U8t92xV4J3YI2Tn3+cUM4ibL3sBAEbFfWvy4yD77kBMDGiw/MZjiAOzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNzBbkB/3KzNTkAWKVBtvGjPS9XdsvspU5p6u38zjf8=;
 b=EiT5Ai0ebqoA83glUq5Obafny66S6q6o8RMrMDwm5zkzoeByzPWc8/Bc1l9EKgcaI1JbbAQiqbJ3TQxXsw6UwTiDpVnlhrf2O19fRhiI0IHbE8Vrxt2LvEdwsOkDVej95QMiaHcwSRVHLvYDvu4jMCqDwHtttHC+emI31gO0nGamKB8KXdmePLKlkKMslXAE9B/KF9oRKuWmeHQrtypRhzaVQl0ZoytkvrCamMnZCe3MBLBonMsERc6R1ylxQj2eZqZBHstg9taYndfjjt9HPzToHfHyFQtJATiWmYDqC86MHlCGnTdXUml1zeXR1wdTPYN6DOaerpHpnRl36R9uYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ab7332d-f0ca-d803-38c0-4e0210df5eb9@suse.com>
Date: Mon, 20 Mar 2023 11:34:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Fix PCI hotplug AML
Content-Language: en-US
To: paul@xen.org
References: <16d19b45842d4f98f130c98628932eb2d62ffe72.camel@infradead.org>
 <2f1c2da9-ad21-cf4d-230e-b3e01658f25f@xen.org>
Cc: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2f1c2da9-ad21-cf4d-230e-b3e01658f25f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bc08c5-82a2-4637-3bed-08db292eb2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x3J343WPg1t2EXdiRnht7JVFAK+qJiljmMeQzObAiD4qesdSoagi8vjbXZQQ2SW94NfGCwfOayrZ5VWBL3baoun9ccDb0Yy3i1qyASNJzjPWhkDPnU/n/EDHLwHHDdM/CnuesyNsQAL1X3Ix2dnlk7e6LPbVrXOSM6qPZph9NEiNm5DRyy13y109JkLJRfcP0ozC7W2Jcpa0tcuvyQbwyzyZXLKMGfWkVpGm5aa0Q9Y3tcTi3aZL97JHsh+wqDtPYS/HZcptiEcXUk7VRamcGGVLI85z3Nip0eApWzLa/1TL6S01bC3wjVOyzzgK9DRsoLWR+nG0a8BPy41PlxRW7uAY5jlXgxbVIFzhqwy0sMib9Uo9N+68ros/Jg2jiXusrvv41mr0VGWiuLlUQYuUVA7q/5FM+o/Jk4OsbK4HshCRrLZkCj2ZhxtF/MaJWyELFiJ8T4BIPUB+YT9BrW0esoQY6yMb2q6jcmlDC8NqzATLBN8Qo0KemDXaVPOVgMau0sRHX9yTFbmQYu4AvTz7Ip5giCTBZJJcRG0PtBnJTCTW430S0YYcpWio9J0DUi8VVEY+71mJ4ZV5XXDdpoFtTL09G8aNDz+a3bRzZ7tLrqQjUVKrJw/3RgpqsUhnz/9UmkkSFyvLmV0Hx3nyoEfNjzXtgzmCtQccTZJFWGblsyF5Sh/9WqSIjSasF9hTpVIustFPK6MaZueqeBWxRuDULX+nSzn78KIs6HdBkVBIcpg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199018)(2616005)(6486002)(31686004)(31696002)(26005)(5660300002)(6506007)(6512007)(86362001)(53546011)(478600001)(316002)(186003)(83380400001)(66946007)(36756003)(6916009)(8676002)(66556008)(66476007)(4326008)(41300700001)(8936002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajVBYWtYUFhPNWllbWE0alcramhCaEtnN2R3UmRCdUVsdnJ1U0FjWXdzVGJE?=
 =?utf-8?B?Sng4aWh6cmxQa08zVlpQNzUzZVBzOWFwSk81NVF3ZjVZRTllUFNjVlI4OHA5?=
 =?utf-8?B?TmNGQ1FXUTMyd3g3OFJ3QWFEb3ZPRWpZZFRtNGxrdXU1bXpWcFBMdDBWbGRy?=
 =?utf-8?B?SFhvVlJLWWNHNUo1UWgrNVk5OWEzMkdTMG5OWTJSTURxbjVMUEcxV0xKTVBP?=
 =?utf-8?B?ellReEpFbUdzTDA1b1Rpb1p1RkNiVWxmT0ZoUGVuV1dvanhQdE81ejdJZkdE?=
 =?utf-8?B?aE83eXFndFgwUzJTUndjWTJJK2RPYTlJRXlndGNzY0xpeGt3N3N0dkxDYS9R?=
 =?utf-8?B?TlB5VGQ0N2l2MDdoaUxBK1ZQR3lXbElmeVAvSTV6ekVDTHl4NnhBd3NFZ2p0?=
 =?utf-8?B?cG9jTWdVVzJGU0d6S1ZmNFdHMER6VEJsblNTaDFtQnB4TWJZZnM2dU54Q3hB?=
 =?utf-8?B?VEJORDBrdDVJdzlZRzBTMXVqRFBNdi9HSHhHMlkvYUNqblVybHRwY3hzYkVD?=
 =?utf-8?B?MU1RQWZsbHk4c21XQzliTzBWdTdtb0ZGb01OVnUxWHFBS2dUR1U4MnA2czNZ?=
 =?utf-8?B?YTVSbG9EV1RZYVFDeHM3T3JKZ1dZaUN5L2ZSS2swSk92amlnTEdneWpQaUlk?=
 =?utf-8?B?MDBnMjJWaEVoa05WbC9QK3lTNjBqbVhpbVh4K1VyN1BzM0dvOWRuUkhiZXov?=
 =?utf-8?B?Y1NYUy9QMjAyNmJEMEJWbVUvamU4MlRCbUlNZmxLcHBpODVTUnhHSjhHazJV?=
 =?utf-8?B?dngwc1NMQWdKUjg2NjFnb05WTm9OMDhCdWhFcVNQTTZISXRJeElORFY4NFRQ?=
 =?utf-8?B?MGcxT2piK0E1WUZZZVlMNWRNYzkvRjFNWVFNLzV4SGEwWWxmZmJPa2h4dmpT?=
 =?utf-8?B?U0ZCVmRid1lPMVRCOEpyaS9QeWxNekp2T2xrcjltZEk2QkhkaWl1aFVacnBj?=
 =?utf-8?B?TnY4ZlpSa1lzK1JzV3F0RnV3UUVkbGdNM2pCYkxJOXhjc2tTNC9zNEg0ZW8w?=
 =?utf-8?B?YWZETDZ0bVkreUZLUTV6SW5KTHBjTFJ0M2YxZ1pybTE3M2R4Y1d2N3I2R0V0?=
 =?utf-8?B?Nlc0VTBUNUp3KzhVSVhpeTZldlpmSXpEOG1YVURpSnZJMFpZdVV3UmRUeC9y?=
 =?utf-8?B?KzEwTDkzTm9WT0Nza3phcmptMk9pbUhMek5iVEN5djQ4UzU1Zm9SZ25NOS84?=
 =?utf-8?B?UHZmKzFTdStXTlFQOXFnWkc3Z2R4TVB4QTdnb0NWVGtMUGhGVFFjQXpMN2VM?=
 =?utf-8?B?Mmp2WHlYdzhPajdYbWhDT0pEbzVZdlYvZXl2WVZCYmtVcVp0TG81UHFEaHFz?=
 =?utf-8?B?dzhNTVBaRU9Fb1RCejhYSUg4UXpOZUUxcGRWUVlTZXlLMngvdVRmVmFOQTZH?=
 =?utf-8?B?UlBjZjN3WXlpNDNwNWFuTDVIVXJoM3RlTCt1QVdlVytwbHB2WVJ1L00rRS9w?=
 =?utf-8?B?aEpJY3BrMkxzUmt5djR3U0tCUjUrZHc3M0tmbEMxYkJZSVJaYkloY21yZlVW?=
 =?utf-8?B?SU5oVzJLOVMxQ1lLekpWN0RGWFRyeGVuQkFZclhFbGRuZmVYa2tiYzlwSzBE?=
 =?utf-8?B?V0pKYzFhU20yTW5iR2ZaMkx2a2FFazVYb1pVVjg3ak0rMGNCNnpvdEFSWFQv?=
 =?utf-8?B?VmNIWmN2K3pxcVRmOXAxSS9rVTZxbnZ2SGpPOWREQkFEbElUUm0vS0dFTnNm?=
 =?utf-8?B?M3RCUkN6V3ZNRHlqQW5Ud2g2bXRiVldjK0ZXTFFQTHp2SDRqOU1XV3ZJRXAw?=
 =?utf-8?B?ZUdieVRReDlqekJ3UHlIb0t1NXhtR3ZUUjNQR3gzNU55YmVwNHVjQWdML0Yw?=
 =?utf-8?B?YU8ySzFrcmRNTTZZQzJwVUZnRmttMTF5aUEzK0xYazkvTEJnRS91NVBnVjhO?=
 =?utf-8?B?SU9zbUY2Y2haOGJIc2Y3eDl1V2o2dG9QOGhVRU1KcmVrc2NVQUtrWi9vakFu?=
 =?utf-8?B?bkp5eW50Vk9MZDNUZnA1Nmp1RkZLazVZWGFleDI4MERxVmZaeVRlRkUxbFhl?=
 =?utf-8?B?Vi9iSjY1THB0NWZFTnp5RjBrcWU4a3ppbE8yWXo5dEMxeDNUbHNHekJOdkVo?=
 =?utf-8?B?eW5DTlBrOUZGam1tN1NTdGVnN1hCc055V2dxUGs0K1lUMDRscDFQbTVCTHJF?=
 =?utf-8?Q?ijIjrduZDRH/3DpZFYxN5GK9u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bc08c5-82a2-4637-3bed-08db292eb2f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:34:35.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keE9NteX78p7wa9yEhYeyT8idrlRaxO0RefNaXjxAp8LbxvkC5CJSUy/U2LbjLwr3tFFQpyf8D0mFHi4MJNJqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7717

On 20.03.2023 10:04, Paul Durrant wrote:
> On 17/03/2023 10:32, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>>
>> The emulated PIIX3 uses a nybble for the status of each PCI function,
>> so the status for e.g. slot 0 functions 0 and 1 respectively can be
>> read as (\_GPE.PH00 & 0x0F), and (\_GPE.PH00 >> 0x04).
>>
>> The AML that Xen gives to a guest gets the operand order for the odd-
>> numbered functions the wrong way round, returning (0x04 >> \_GPE.PH00)
>> instead.
>>
>> As far as I can tell, this was the wrong way round in Xen from the
>> moment that PCI hotplug was first introduced in commit 83d82e6f35a8:
>>
>> +                    ShiftRight (0x4, \_GPE.PH00, Local1)
>> +                    Return (Local1) /* IN status as the _STA */
>>
>> Or maybe there's bizarre AML operand ordering going on there, like
>> Intel's wrong-way-round assembler, and it only broke later when it was
>> changed to being generated?
>>
>> Either way, it's definitely wrong now, and instrumenting a Linux guest
>> shows that it correctly sees _STA being 0x00 in function 0 of an empty
>> slot, but then the loop in acpiphp_glue.c::get_slot_status() goes on to
>> look at function 1 and sees that _STA evaluates to 0x04. Thus reporting
>> an adapter is present in every slot in /sys/bus/pci/slots/*
>>
>> Quite why Linux wants to look for function 1 being physically present
>> when function 0 isn't... I don't want to think about right now.
>>
>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>> Fixes: 83d82e6f35a8 ("hvmloader: pass-through: multi-function PCI hot-plug")
>> ---
>> Utterly untested in Xen. Tested the same change in a different
>> environment which is using precisely the *same* AML for guest
>> compatibility.
>>
> 
> This AML only relates to the hotplug controller for qemu-trad so it's 
> unlikely anyone particularly cares any more. In fact I'm kind of 
> surprised the generation code still exists.

Why would it not exist anymore? Use of qemu-trad is deprecated and
advised against, but it's still possible to use it. Otherwise quite a
bit of cleanup in libxl could also happen, for example.

Jan

