Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6937158FC
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540857.842922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v1U-0007xq-Tq; Tue, 30 May 2023 08:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540857.842922; Tue, 30 May 2023 08:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v1U-0007uZ-QI; Tue, 30 May 2023 08:48:08 +0000
Received: by outflank-mailman (input) for mailman id 540857;
 Tue, 30 May 2023 08:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3v1T-0007uT-Dg
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:48:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe13::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0ae076c-fec6-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:48:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9275.eurprd04.prod.outlook.com (2603:10a6:10:356::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 08:48:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:48:02 +0000
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
X-Inumbo-ID: b0ae076c-fec6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX5PfQYFXAH5khAZDP5pnVUg/sTMTBLRy7bccOa5q8pvVygLI3fYCU3DJ+yocfeUSpABHQpBm6gR0SFg55ToYsVO6x8L/5urPcbkGxZEzdTBU6nqATHUnVErvc9RW77k8d4cu5Tnw4QWNLALyfsNn1sM2yTlvB+eHALuGO0zUeKqbcbsa82lK+EYjg/8Ip7pSiYVUZjMPNFMKKFEYefNIFRaon5PWYR6ba9mrQVpjKLZ3O3CxWJej3vyGIhEAQPO09x+8ISY9t0PQv5NdQiXhOVavIW6z08UzDHBCLxoyqXVj4dKPEwvugDuKt4Qkr2JjAss4Ky4qeOpIabBDl59Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyntQ9/Hwrs8GyNAUspHduLZgouzXOk3CPacRdLAasM=;
 b=lvKsL/xeYvoB9WC2Ij4fLuuQkijtVwoJY0NK58eQ2OcOMv8jwjh9Vlnj7tbOgNF9zc9qpgF6Tz7ofwgAATlRuHcttv6pGUQIm/Q9OEnkwluEFIT1dsVG5LJwUAzhbpEHk4GJodzD8kbiNY3yx+KHIx+gorAb/fSfS/THOGxcPVRaELrIc9So8o5FXR8oRxg5FZ0mO5KBDgQHHs6dtIay9c94UKevwiZZKJLmapQPaHjRKPATbkdwvup4P25R6+G90jbDpPnt8RcHZ9lNxHiAV659CVbMMCG6a4vtUV6CLiMBnyU5T2TNrZ9EAfCF+3C1zAuTMSZ5WjqUG5xVAZAknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyntQ9/Hwrs8GyNAUspHduLZgouzXOk3CPacRdLAasM=;
 b=GnGHuN8LlHdr0/Z7uxnYYBuAq+nnCaeRd9g7mWG1Uk3egkLeOC/TVLu8nskSStP0OVfIA1HILVY6Xd3Fns7ZavG6b7X42FDOrJY5cgzrFUWVBh7hP9EZs5GS/P63feqGDlLnXpIAoM+d78Aid6WTsPyBaFHrwJ/hlJBTWgYFAATRd1qCX9ag4sfa03mXxZ9KjjqBIJl0Ww3Coykm2R/RkVR4CynSYgyLnSJO0hiwV3gQDsQ8CPTbQXY2aIsTKoRO92U5pCPn/X/3gxTi0lGb+RCM/3kNXP3uCc9GWy73tjOgD7oGC0CvI15u+XsQJjjY2/dSvo6C2txh/0VHLAI+1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f04bdd7-2337-812b-cf9d-985fe34d0f5d@suse.com>
Date: Tue, 30 May 2023 10:48:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86/vPIC: register only one ELCR handler instance
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5567b45d-d8ee-7f43-526f-7f601c6ddd46@suse.com>
 <ZHRkstB6UKWAadVZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHRkstB6UKWAadVZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 68643f1c-c424-4851-a63b-08db60ea93e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	upI7ZTYOVu+JAkiTyTzKyj/ipt8+WyXkH2iUT3ko+x6q6QndWvKuaaxtVp4bfx354ZeQ25TT33xewcx1cCBMeibwdGZAhuP2F0wXyi6FRhVXzScWYeVp58rBtIKSlB4zjxgu9T39GZeDHoRiMnj7dIqpje08XLhQoOeVyGAwbknJLpXd9Uj98+NiSb/2S3DQExEWw/5by8MI350+OxdR9bRN9lp2uwVbLd6MSORL+og2q6gO9cgsQjmLi1U/3TtSoZFoTiu23+DDuXcyalrE7UGxexZG23POnE8Chdx0wtqWPoIc6rzO6IbpwYT60lxStGtiDeltjIkuoHd7kac2QswtwXlkhRSJvztJ5qCf17RIH4lBQBEOpymCFF97B+8QZMbaRmM4SFWad4tP/CnqFAFUVUnvdfxqpaXW/yn/Eix2dQwKaSLpD6SW/U1XrfXINKJ5jwTDGUQkzP8AGTtjF1KWCq/k0kOaqBhMVxklpkarUwNoJvPaqf/YHZgf82BJwc/HOiIKBr9onnZvBIyXMWS2oeMb+poQ0JZrOwYlbvn8+SlGpoTESir/43YZWVbxLDOgtVystf72x0lA8Vxfv0bABAjiOxrwymzgvgVOWoXZq1bTE/3HSZ6I7HnwzdEa0FudtGrJJLphM2oa/63MIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(31686004)(38100700002)(41300700001)(316002)(6512007)(31696002)(6916009)(4326008)(86362001)(2906002)(8936002)(8676002)(6486002)(2616005)(66946007)(53546011)(66476007)(36756003)(66556008)(54906003)(6506007)(26005)(83380400001)(478600001)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDFwMnJYazJtTzFRYjlCZHRRSVI5T01RakJJVDVkcmxOaWhqUkVKSENNcmdh?=
 =?utf-8?B?MktJSDNlQWNYa3REb2duM0JKSGRsQmU3YUFWcElIb3FVWkQrRUtSclNqRmFI?=
 =?utf-8?B?cklKTEthdGY1Znp2ZkZaa3BXNkcwOGRaaGdqK3l1UEREcVlmUFgvVU9aenVO?=
 =?utf-8?B?Y1cwK3ZKZ3dPcG9oOTFxQm9VcVpzN09nRUpQU3phWTU1TDlDS1VZeThRRDRy?=
 =?utf-8?B?WEE1UTBGblBjWTg5LzZ1K0ZHZW1xMnlieXpZLytCWnBiR3UwV2JqRGlwdmtE?=
 =?utf-8?B?VzZLclpUNmtrelVOQUdsVXVWNlY2cDQ0R3ZORDZEVUJoV1ErcGZJSnJVWVNu?=
 =?utf-8?B?am5lbThDU1draytONTJ5aHlSZVVkK1FRQVVJdWYrQ0dXRzR4TUJDMVRNWXA0?=
 =?utf-8?B?RGdJTTE3SzAvNUVkbm1qaDRVald2eXUrZlNZb3VuQTlnK2FYUHBTNi9tK1dj?=
 =?utf-8?B?R0dzYTQzK3llODA1eEJmZnNmcFdRUUJnVUtCRGlkRU11VXBlTitIOFBrR29M?=
 =?utf-8?B?SktsOUd4OTZveWlnMXE2YjMyNlZrVnVkS1JVRTBEU1B5TFpWUTN2M1dYN2hQ?=
 =?utf-8?B?RnZVUjk2QXZycDV5am5EaXlydEVsdDI4SC9Eb3VWVUpsVDJYYWM5dnQzeXdk?=
 =?utf-8?B?YWJDWDBQSk4xdERSTFBYdy83TWFudStENkhOaURoQmJ3VDVwV0JlMUhQdTFI?=
 =?utf-8?B?NW1pRXNNNnRoNE5kZjNnNGFKMW01OFFWaUIwbVgrOWdPSklUcTlUZ1pLaWtq?=
 =?utf-8?B?WW9VeGo0cmUxM01KOTJLamZ4dng4OXNBWEdDeEdQbHc1SU9xK0doR3hBTmox?=
 =?utf-8?B?VkErelVrY3FCUmlkQ0JoL05aNzZPNHJpekRSMEZGY0doRXFsZDg0M0F1M21D?=
 =?utf-8?B?R0ptWlFVTDVMbzgzRk5WNHdHb0FITzU5YjZJNmMrZjR5MElOanFjNjhjYnZn?=
 =?utf-8?B?TzA0Y213UlAybjFvQmVhOExLRytkbkZKcFY0UGppZjVRNnEvR05BeVNheTdt?=
 =?utf-8?B?cmJNVVhzanB0dEx0VFFzNGFEVXhKOHFXVHZUM044WFk2YXZ3OGp6eDJCL21a?=
 =?utf-8?B?eExrc09aU1lGUFRyR0JuWUhRbE1NMFdsTllWYVI1OFZBR1lSZU9Zem9FYjVP?=
 =?utf-8?B?dTk1TyszMzE1U3FFM2Q2WDJ4dFdsdDVzZUo1N1Q5Y2kzYmJoenpuQ0R1WDNU?=
 =?utf-8?B?WDR0UUxkM0NpMnVhY3lSU29scWZvOUNqQ2w1NUY5RUI0ZWR5VnZ1ZkNiMkRz?=
 =?utf-8?B?NDB1TTl0V3AzU0RBU1B5ajBrV2VRa3dRdUdBais5UEYwL2JLa01vN3Awakll?=
 =?utf-8?B?WHVINTNucGJITTRWRUdpQ2R2c0VrcFlMUVNNdlViTHFubDB0Z0tsWFlPRUlL?=
 =?utf-8?B?QVdHOXRZYmxGZ2JyQXUzL2pJcXZKU3Y5aFhjaFU4cnBxamxBaXRNam90a1Zt?=
 =?utf-8?B?M3Q4djhpR3JPNk9QS3BhdGJMeTFBZitoTmVTdGRCZTEyVUVyQXFQV3NSYkRS?=
 =?utf-8?B?MlFqTEEvL1ZINXJxaGJ1ckVWNWp6QXFjWVRDakpLaXIvdXNkN250MExlcjhR?=
 =?utf-8?B?c25ORG5RNW5Pa3FXT0wreHJXNHFaVFdFQk9YYkhMQ0gxSE1ibXByc3o2RCta?=
 =?utf-8?B?aEw1U09TaTVTV2EycVViNmU0UjZIMDR2VzI1Nk42Qjc3RzBTU0NzWEQ2U2o0?=
 =?utf-8?B?VGxUQzRsaVNuN0J6Sm9HcWoveFhRdklxSllteHQydHpick52M1hSVjZGZ2dt?=
 =?utf-8?B?OHMzOE40VjU1ZGxSYklwc0l2bHluSGUvcDB3d1F2b01mZlRDLzlOTTgwd3Zq?=
 =?utf-8?B?bUZCR29rMmVjRWFYUjRlZlJRRU4rcmlNbW1jNnc1YUsxNXNYa0xoS0tHdUVF?=
 =?utf-8?B?RWhLQTBkMDB1TUFxWElyODk1eXJvTmNndVpuNTBtMG9nZmllTlkwRjlkanNh?=
 =?utf-8?B?Zm1tdWVUTjdkR3lRT0tOL0lXcXduTnF4bFhoRGswc1p1TlpBdzVLWlltMndj?=
 =?utf-8?B?QThtMzAvaStocVRHbWdOWk1yS0FkZHhBZU9OWURZNFpSR0Erb2NyU0VBYmhH?=
 =?utf-8?B?U3VwLzdtcTdSSkpKTXd1bTB4UEx5TlN2RnYranM4ZWlQck1oNTNiQWxFUHJN?=
 =?utf-8?Q?Ly30Mdv7psssNNmRBe0RJ0DIk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68643f1c-c424-4851-a63b-08db60ea93e5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 08:48:02.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXBFjqEHQAIeShsZvgsLCzU0z9xG+g0pbjEhyEdK6qnD1hgf5kfvi/I/GfItPBqkQtxro9A8um609lHyYWkf7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9275

On 29.05.2023 10:39, Roger Pau Monné wrote:
> On Fri, May 26, 2023 at 09:35:04AM +0200, Jan Beulich wrote:
>> There's no point consuming two port-I/O slots. Even less so considering
>> that some real hardware permits both ports to be accessed in one go,
>> emulating of which requires there to be only a single instance.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/vpic.c
>> +++ b/xen/arch/x86/hvm/vpic.c
>> @@ -377,25 +377,34 @@ static int cf_check vpic_intercept_elcr_
>>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>>  {
>>      struct hvm_hw_vpic *vpic;
>> -    uint32_t data;
>> +    unsigned int data, shift = 0;
>>  
>> -    BUG_ON(bytes != 1);
>> +    BUG_ON(bytes > 2 - (port & 1));
>>  
>>      vpic = &current->domain->arch.hvm.vpic[port & 1];
>>  
>> -    if ( dir == IOREQ_WRITE )
>> -    {
>> -        /* Some IRs are always edge trig. Slave IR is always level trig. */
>> -        data = *val & vpic_elcr_mask(vpic);
>> -        if ( vpic->is_master )
>> -            data |= 1 << 2;
>> -        vpic->elcr = data;
>> -    }
>> -    else
>> -    {
>> -        /* Reader should not see hardcoded level-triggered slave IR. */
>> -        *val = vpic->elcr & vpic_elcr_mask(vpic);
>> -    }
>> +    do {
>> +        if ( dir == IOREQ_WRITE )
>> +        {
>> +            /* Some IRs are always edge trig. Slave IR is always level trig. */
>> +            data = (*val >> shift) & vpic_elcr_mask(vpic);
>> +            if ( vpic->is_master )
>> +                data |= 1 << 2;
> 
> Not that you added this, but I'm confused.  The spec I'm reading
> explicitly states that bits 0:2 are reserved and must be 0.
> 
> Is this some quirk of the specific chipset we aim to emulate?

I don't think so. Note that upon reads the bit is masked out again.
Adding back further context, there's even a comment to this effect:

+        else
+        {
+            /* Reader should not see hardcoded level-triggered slave IR. */
+            data = vpic->elcr & vpic_elcr_mask(vpic);

The setting of the bit is solely for internal handling purposes,
aiui.

Jan

