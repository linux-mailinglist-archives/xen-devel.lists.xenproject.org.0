Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80647650CF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570987.893711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOy5p-000883-Ds; Thu, 27 Jul 2023 10:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570987.893711; Thu, 27 Jul 2023 10:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOy5p-00085A-BG; Thu, 27 Jul 2023 10:19:37 +0000
Received: by outflank-mailman (input) for mailman id 570987;
 Thu, 27 Jul 2023 10:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOy5n-000854-Ua
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:19:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15530bd6-2c67-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:19:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7760.eurprd04.prod.outlook.com (2603:10a6:102:c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 10:19:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 10:19:32 +0000
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
X-Inumbo-ID: 15530bd6-2c67-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB4sx1npFz4VLL9e/o8E0s7iLoK94ZnJ0LCX8as2kkQidczQ76I1JsKE4Ey0Z8TxkeSOOnLShVUoHpg76nCJCizkczDbnsJ0df0xrJ820FEh83hXveojIhvM3g3XbqtW37o+ypCB4/WWnA6u7vQL9/N5s4hsFTnKxFvBFnAiGQX21YBqLcsHwXyRD8KID1F+kViflHGJpP4SLQAGXxQuYCIZ4owQ6YB5L/A98DKbQG11QzcEmFEVDVjW5Ln69eK7F9CtU+zXt2knJJNdYxhBCNBLLCfSgKeoRADTZesWZIhOtTgyVqp0znp4TUCrsSdUiEp+6oKzYg1RBgMTINSChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFIYahveLcQkZuh/2TJ4AvaZjoejtF05bPahnmjIU4w=;
 b=MTGfC81KU+IxNiRF/yZriqWIvqpJsOKoZU3pg6OA9ipypZM5UkRFKvi+NDGU9Y7uhSlDHugvLGo1QWc/cM7Lprwl7CgHq2bV7CjfCNlH/r3g5zwUKjMVUcqNDBlBIbMetUpe6zCuOlZaJhPo1b284uzU6a33UMbLpCnlA1Dx7np2Nn4Nwgs3G43VD4EpUz1ON4fCQGGJmtJ/sF0A28rPEJ1GdKlNFH2iEEz1msESzmAdYSwVE5c/R48w26pxLLMet61zIXwEwetpp2EugKVBdi9QPG0+hnf8bopTveb1uafaXMdD2+60vY/AQNGm4xIbJu2DFYrfPFijLT4V5O84gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFIYahveLcQkZuh/2TJ4AvaZjoejtF05bPahnmjIU4w=;
 b=w0l1n8Reeb6GZ/1emfg2ShhD3IvF43tpjl4sYS/nRdApY7bII0vkXD42ENvWpbQ9gcNc7vmDWdnTbZ53594iQTodalXlu8d1Ys3Ydy5qtYaRlH/gH3qSPKnvXstkSacPOPplJ/a2Sd9uurVuZGSl97i+UcKRyoUCU5h47zXvB23H0gbEF8u8mzSDyrCIFg+J2cSkFRpoKelNxfKbDTay6Yu8+a8Uzx+Ppd1qCeRocf+yg9wIZvDh3OgL82aURMvkTUeVBmfEo2gNEEGn5srE0cIxtKe5V/G4rjRNqDLZKJrrg3q3zaDlUmPnA0VnWrFlpvZ8Qc05Fo+nmxSEOFJ3dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a87e6df6-9236-f90b-1fbc-3c348023b307@suse.com>
Date: Thu, 27 Jul 2023 12:19:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Julien Grall <julien@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
 <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
 <64be6c1c.7b0a0220.49ba9.0e38@mx.google.com>
 <79ecab0a-cb91-cc95-fd31-c76ec287fa9b@xen.org>
 <0d28d9cd-8cb3-6d03-94d3-e07a4dab9e95@suse.com>
 <dc76516e-2334-798a-216e-5ad983fea2f9@xen.org>
 <58b1901c-f5ee-8617-a5f8-0666c4ef51e6@suse.com>
 <64c2436e.170a0220.2aacd.218c@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64c2436e.170a0220.2aacd.218c@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6aa5ed-603e-42a8-a2f2-08db8e8af812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Crh/nRJCQboAz3zRbVjLtiARKs+Jftlm4zvCMqPDzCkjC9s8RtcR53w4Xw/683DJmaHwfW2pK6t7+jZyb7tFUnGbbWFCtDUPNgK2iLZT8JGlD4VUALaDDGIhknQVOASSrNUFey6tcgyM6RaFaVJBo47E1/9Hraj1Y7fbkSSuHx4inKCKVhz+o6RFi6CVHUhhaQQPw9xg+vx2nvf5Ceeg4Oiw2e9+nkriJJNxdShdKCp9Gu91S97Gts3Z0pRxQZFVWYZT0w0gkJMSaHnIK0zVBDa9C/m8zAFs8ClQWttFtvUjEB64wgZShZLHjDtPuB2TNKItBWgAbsXYI/i47ejA5PNulHdi0gwy+FAaFEL7AwDOiK/eBiQ1UQNwqd5q5ZRNEPfr5ZHQ3hb9JAnBbHAHEEWSb02sI6RHCLQpFEpbq9p0MPdGULoMNPvjZsKs5fkNhb+C0muE9JnIGHl25JUkOubVzVZ8RdzNzONnBBFMx/z1jbQNODYXGlzxJbeF3gw6jL6ykWrpTEeso83PN7O5UjMFhqE6rQnT5xxWvToLvkDrM/C1czNWcI4N405ORPPEntnHJ8vb5dxpfpV7Twj2AzwfQOeZ/F0bjiL+y965zMyJuK85QmcAOoh1VafvKRd55EZSPFJlDa/acL09Y2SOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(2906002)(41300700001)(316002)(5660300002)(8936002)(8676002)(36756003)(86362001)(31696002)(6512007)(26005)(6506007)(53546011)(478600001)(6666004)(6486002)(83380400001)(186003)(31686004)(2616005)(6916009)(4326008)(38100700002)(66476007)(66556008)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0RlajlveTZVamp0TlRKTng0Q1ovWDl6N0s3YmVyVURPYUp3eHRFYUhUZnBZ?=
 =?utf-8?B?T1ZjN3JjME1HTUZoV2RXRXovV0p4SUFpVmZ5NnNJMXVwdjIwWUNESGFPSFpk?=
 =?utf-8?B?QmVVRG9rYzMyTENLa1VTS0xiUDd0eXNnY05PcFZZT0xsTVhMN3FKbktia1k2?=
 =?utf-8?B?L1pXOFlRVW5FaUR6dkFpU3dCRkdLRGhIRzRaZkJMWjFnOFFRdUV3RUVUNFVQ?=
 =?utf-8?B?YTVZd1hlL0lSWnR2WWdzT0g5a21kUHZZSWRiS2ZDMlhXR3FPSTNsNHNuUzkr?=
 =?utf-8?B?VDhKeUlITitySGRwaUt5UW5iY1lzMWl4cEJnamZFUmMrTGgzdDNoeVJtUVUy?=
 =?utf-8?B?N2NnKy8rd05Sd0Z0eStkOGpMTVZkK0FJY09rK1hTY1o4RWNGWXVxM3ZYNE5F?=
 =?utf-8?B?QnBTWkZhMEdVN2o4YjJtRUxsRUdrNmZOZVFaREVrVHgwRVd4MWlTZWc1RHBk?=
 =?utf-8?B?ME9aWTZIN21OMWVJUlpqdTBza3BVbGMvSTAxQUdtWjNUQmJyU1NiT2tYMWsz?=
 =?utf-8?B?STZsMys2L1JkcjJsRkkreDVtWjZQRWgwamhzSEh0clJBS3Y5Q29kMlh5R2tS?=
 =?utf-8?B?c1kvL1pvLzhqUlpvMWNqK1dGTWkwVzdqaTBhNzBwK0ptYjRNVkVxbkhJNVNV?=
 =?utf-8?B?YjNiVnArUEJ6YVYzc21QWmMvcHI0eCttTE1HNkNkMU91dHNTdkxJbFFSZFli?=
 =?utf-8?B?TllGQXZ2ejBxU0tuVlczZ3hlcHF0N0tRaE05RXZBalJ5MW8vbWRHeG9lRVMy?=
 =?utf-8?B?VVVnSG9QNktuUlVDN1Z2cEdRYkFQWTVLR1dCdkZVeTBRdFgvLzBCcHA0bmo1?=
 =?utf-8?B?dWluMFdZcEI0N2ErYWpNUldna0VVZkZFQjZ5c2VlSXFsQ0h0bjlPR09lWTQy?=
 =?utf-8?B?dC9BZlI5YzdRQWo5UzIyZGcyT1RJeEhhUE5pTmRVNlBYRTI3cVNyQW0xQTFB?=
 =?utf-8?B?Z1Z1YllNalVVZHlNRm1tYjMxWnhRRmk5TnFJN2xHWkJBMzkxZWkweDk1Z2NM?=
 =?utf-8?B?MDM2eGdhMjkxeFczdWVMYUhtaGRQNTNOU09TSmhrcjNsOE5lNFUweXU0aE5u?=
 =?utf-8?B?VnYyNHpEei9kbWZkZVZhcnExVG9CVDI5TlhjWHNzOGMyM0puaDZsbHoyVko1?=
 =?utf-8?B?VlF4czk4MG5YamlEYzliTjVaOGVhMUFYWGxuMHJrUG5pMkJjbisxQkh1ZGZY?=
 =?utf-8?B?TTVJSFRJTUJDNUtEd3NidmxrSkVBakVUbWpJY2lTWFN6K05pZjZ2cHY2ZWZH?=
 =?utf-8?B?eWdscXNMbFkxems4aGVwQ3BnUy9Hc01BL3czeWJQMlJFQWRneHM1MDdTQ2Yx?=
 =?utf-8?B?cFBJNHcrLy9QTThBejc1THAvQmtmUWNhWmI5a3RnUEJYenZNZ0NuZjBVK25n?=
 =?utf-8?B?UjdtK3lmQzZoOWZLOTZuK1F3a0hHbzdUc1pSUll6cmdlWExIaURwWEFZQjVq?=
 =?utf-8?B?RjdhWEh2d0xDc1d3RzNHa0N0Q2ZpenpyVDEzUXQrSU1Ndy8zYUFmQUs5OXdI?=
 =?utf-8?B?clV5Uzc3ZzRKblBzVzN2VGduSUdkY0RqVkc4MkJJYVFkVEVjMG5YVERCNWZZ?=
 =?utf-8?B?Sm9FMjdFNllyUmhiTCtDMVZxdDVQR1hxdW00dnN5VXFPOWVlSnpqTXZQQlFW?=
 =?utf-8?B?RThOakZXV3lQbWV1NnlOMkVPTElKZm5iczg5TFFzTzBLTnE3MFZnaTRaLzE1?=
 =?utf-8?B?SDFkWEo4ekx6Z08weUpRTzArTlc4cTZmaDdWVVRkaHFhdVN6bWZIQU9JNDZ2?=
 =?utf-8?B?b1R4QzlXWWpJZzgyd00xQkF1SHA2c2FjSERCKytWQzlHNmhuejVlczhVc2I3?=
 =?utf-8?B?Nm45SUNYT2Y2VFQ1b25zb2NQU1g1aEpWb1JHajF4VjJGbmRuV0IrV2t1cmU2?=
 =?utf-8?B?TDZHRExPeXJRUWFJdlk4MUt6RTE3aVg1TFJLaTA0SEQ0TUx4TWd1OGdFemcx?=
 =?utf-8?B?SmFGVHM0cFp0ZytuNDVjWERuYXUrS0FBcUNrbTFCbUVHeEIyZTZtNko0T3NY?=
 =?utf-8?B?NXUveWY4M1RlWEpTblhPODU4MEVLbUhSdkhDbG5JL29yZytZcmJ0Q09zNFA0?=
 =?utf-8?B?S2hFODJpaUZIQWJkcERVL1hVVEpkV0xHS0srWXdUZTRXZklPTEFlS2ZnYWpn?=
 =?utf-8?Q?HRm2dLUi3yuF9GlXZzL2HWOUI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6aa5ed-603e-42a8-a2f2-08db8e8af812
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 10:19:32.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKCaEFDI0NCQESfeDE6Py7W8HyhBSIudo6+Yr+YU3rN7cZo8rXHABM0Uixytyno29JBfkXdaG61UHBH0q/kTJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760

On 27.07.2023 12:14, Alejandro Vallejo wrote:
> On Tue, Jul 25, 2023 at 04:34:42PM +0200, Jan Beulich wrote:
>> On 25.07.2023 16:27, Julien Grall wrote:
>>> Hi,
>>>
>>> On 25/07/2023 07:51, Jan Beulich wrote:
>>>> On 24.07.2023 20:20, Julien Grall wrote:
>>>>> On 24/07/2023 13:18, Alejandro Vallejo wrote:
>>>>>> On Fri, Jul 21, 2023 at 06:05:51PM +0100, Julien Grall wrote:
>>>>>>> Hi Alejandro,
>>>>>>>
>>>>>>> On 17/07/2023 17:03, Alejandro Vallejo wrote:
>>>>>>>> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
>>>>>>>
>>>>>>> For newer interface, I would rather prefer if we use start + size. It is
>>>>>>> easier to reason (you don't have to wonder whether 'emfn' is inclusive or
>>>>>>> not) and avoid issue in the case you are trying to handle a region right at
>>>>>>> the end of the address space as emfn would be 0 in the non-inclusive case
>>>>>>> (not much a concern for MFNs as the last one should be invalid, but it makes
>>>>>>> harder to reason).
>>>>>> I could agree on this, but every single caller is based on (smfn, emfn),
>>>>>> so it needlessly forces every caller to perform conversions where the
>>>>>> callee can do it just once.
>>>>>
>>>>> That's indeed one way to see it. The problem is that...
>>>>>
>>>>>> That said, I think your point makes sense and
>>>>>> it ought to be done. Probably as as part of a bigger refactor where
>>>>>> (smfn, emfn)-based functions are turned into (base, len) variants.
>>>>>
>>>>> ... clean-up tends to be put in the back-burner and we just continue to
>>>>> add new use. This makes the task to remove every use a lot more
>>>>> difficult. So there is a point when one has to say no more.
>>>>>
>>>>> Therefore, I would strongly prefer if each callers are doing the
>>>>> computation. The rest can be removed leisurely.
>>>>>
>>>>> Let see what the opinion of the other maintainers.
>>>>
>>>> I think [a,b] ranges are fine to pass, and may even be preferable over
>>>> passing a size. I'm specifically using that term that you also used:
>>>> "size" (or "length") is ambiguous when talking about page granular
>>>> items - is it in bytes or number of pages?
>>>
>>> I was referring to the number of pages. I don't think it make sense to 
>>> have it in bytes given the start is a frame.
>>>
>>>> Especially in the former
>>>> case calculations at the call sites would be quite a bit more cumbersome.
>>>> I could agree with (mfn,nr) tuples
>>>
>>> Ok. So your objection of my proposal is just about the name, right? If 
>>> so, I didn't put too much thought behind the naming when I sent my 
>>> original e-mail. I am open to any.
>>
>> Something like "nr" would be fine with me, for example.
>>
>>> , but as said I think inclusive
>>>> ranges are also fine to use (and would be less of a problem at the call
>>>> sites here, afaics).
>>>
>>> The problem with range is that it can lead to confusion on whether the 
>>> end is inclusive or exclusive. We had one bug recently in the Arm PCI 
>>> code because of that.
>>
>> It's a matter of properly writing it down, I would say.
>>
>>> So I would like to get rid of any use of range in new functions.
>>
>> Hmm, seems to need further input from other maintainers / committers
>> then.
>>
>> Jan
> 
> From the look of things, I think I'm leaning on the side of Julien. The
> ranges are always ambiguous in the absence of a strong code convention, but
> it appears to be absent in the codebase. i.e: Are they meant to be
> inclusive or exclusive? Traditionally I've seen and used the later more
> often for ease of arithmetic, while from your last message you seem to be
> mentioning the latter.
> 
> If the point is to disambiguate without resorting to conventions then
> there's only realistic one option I see. Would refactoring it to
> "paddr_t base, size_t npages" satisfy you both?

If we are to refactor, then yes except it shouldn't be size_t. I can be
unsigned int (when we know more than 4 billion pages aren't possible)
or unsigned long.

Jan

> If this is something to be
> taken into account for future code we probably want a gitlab ticket to
> refactor everything else to (base,[npages|noctets]) too. e.g:
> XENPF_mem_hotadd uses the [spfn, epfn) convention, and so do a bunch of
> other pieces in x86 and common code.
> 
> Thanks,
> Alejandro
> 


