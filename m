Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B2765306
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571048.893942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzdU-0005ce-Iz; Thu, 27 Jul 2023 11:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571048.893942; Thu, 27 Jul 2023 11:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzdU-0005a0-GO; Thu, 27 Jul 2023 11:58:28 +0000
Received: by outflank-mailman (input) for mailman id 571048;
 Thu, 27 Jul 2023 11:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOzdS-0005Zu-Sr
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:58:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe02::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e412c20f-2c74-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 13:58:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7238.eurprd04.prod.outlook.com (2603:10a6:10:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:58:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:58:22 +0000
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
X-Inumbo-ID: e412c20f-2c74-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3+debvI/F75cR/uxHOwHijk+O6rqspygRytZb+w7t3bdWfsarL6Mz2O0bSi5w+i4IA9bxAauHETo5J1XwS+Em1xe2fIhoAwwGJlTwvEmIDLTfD5+43onlxFD6LUUxN+0yy7R/54tpn1MHUYp3EK8pCCSik9j06dOSr2dgVZ6TrEjYqAz9J0ej3AeSC/Y35IT0xoQpbdDgt45NwvgXqhupKNr9o92ToOeo/BWfGacsimPK7gsyxkVwYDIPG5GY7+4pWfy7TJFN1nVo9l7hcivm8/OklMWSgjPA2uivL0pxPbtuRs7uR6tDfOLtbsPVP3k8XdQ7HJ/A67M3asvhRSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmjArt7j1aO/KD8A+nQ2MfzfLHFly5OvmXbtyxJjLkQ=;
 b=cP5/Q4vYMg9Lvncq5VkvSNebwH/zkGgr1k8gLvddzma+MdXVgwanasGAzgnqxuSaavyp+me8nPzzNn/7y+L1lsa0Gs91h/xBDuqp0IqH0LAlfDPJ14Zko7rLUZqeYG4biitdEL0i175dVFP7bLvjBvdiiQ/ZcwZVyyAiaK4VcCWQ61EZRg225Mpj36kHffXNsYiJX8i/3Ods7aCJInHfZ1atcis+k5ZiYWCUIILrN0QG1RaiKAlDH7OKq9lrCTVLEf7q9QIReZhxISaUmAt8YQP66j2+YJUfg3qlO/GZVhfZ789KVitzzEiPZLcaixEboC/0y4dX04Oput60jJA/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmjArt7j1aO/KD8A+nQ2MfzfLHFly5OvmXbtyxJjLkQ=;
 b=0USdvKkvfs5YxZxz12QaNlMLiRLve6XLPK8H/YJuNDp3kAAht1sMeyD4aw1kJrsdXPum9DN9296cZZgESpEIjjtPBKoW28z7EbjpBEAnCnnGLvGTtzpoLiMeT+xXc22sb54s0S3PhpLiR7GUg7sqEwMcxeMSmGg7oLin1BLYUzJmql+8i8q6C+znYcCi804Hu0NQMO65Me92VkjBn/fPogt8sZwbEsQIC0WUyV7W0dsHY0aGLQwiTcnBXWaojnKYPK09Mn5mhFoGVsMbAsAcj3aoDBnf+VY83UYj968OUZjiXJTAhkVBk7/cvd3LbaIrD9zT0BTudzfycSRrq2ynXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca85fd2e-45a5-32c3-cb4b-1042be6c6915@suse.com>
Date: Thu, 27 Jul 2023 13:58:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
 <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5907880d-c7aa-44de-c64f-08db8e98c665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FKY23H2akY8lc2/3CinbrPUa2jCBCnGbElCL5Gppnmj+xh25Im5l4o1WLzX/rTMOBGyyTQ6w4pT4UIwlHn3eIEz6nx3ILfO78n1ZYeIBfCzPJ+LUFIimSlDGtNIW99vqYObOKDFWbOn/fX81MDtchD6aikk1rNYxkpv0n7lqnmYxYpit5dUNJs1ph+vM1w96V9GhIeSvy7GbXDJtK1VQoES+s+ZPYthg4ZawnNQ0y7cKImt344KGDDHVXehlwYCmaDTiQ92ymHv0sBB3kujVU0JJz6n530hEuTim7euQc2ZEqG+84Xt5MAxG18JO6jxI693fivztL4poBta6EuWjA7d0+rwUJNMAufDGJc6GfHq5+oGsnQ3QbitTLzMftPFNLH7jGMmHVZEP3OlK7iB78AmtxSVvjjAQYUfIYrMomn2OyTpxMFFmheNeTXLE6QjvnvRdc1UMmRXsHkPpfPNsitw9GOr9eObOPqejd74Jw5HyazgOnV/kAIyrEvAZPQTitDM5R3b3mQ60xqW1BC5fGVzVe6up188j+IJuLNY2xKHs5G6nLyw6a9l48NmEc/Pr3JZRNAoqT9+iTVvuggB/qYGMKC+MQgZN/VF0A1qNklStHVHXdobOCuQzyCYWv3KUP5LYzy067SLG0MYiyoOtMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(478600001)(6486002)(54906003)(6512007)(6666004)(26005)(186003)(53546011)(6506007)(2616005)(2906002)(66556008)(66476007)(316002)(4326008)(5660300002)(8936002)(7416002)(66946007)(41300700001)(6916009)(8676002)(38100700002)(31696002)(86362001)(36756003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnFzYXBjM3dMM0NJNUYxZzJKMEVsN01jbmZkMXZXMFgySDArajlvN2hGWjk0?=
 =?utf-8?B?bkZOaXdndGhNVzVqNERpKzRHZ0lOdkwvY0VxZzhSYUZuNXhGVk9aNkpteHc4?=
 =?utf-8?B?M3ZMNSthRktRdXhuR0RLTE9qOW5Wd1FEd2VYTkhCb1M0eU9zL2o2SWU1ajVF?=
 =?utf-8?B?ZnFDYUI1MlRCajY5TUMvcHZNSDUxbVN5bFIxN2g3cmh0WDJZWjUrWGQ5bFBI?=
 =?utf-8?B?dW1pVFF2ZVRHVmRPZnpOdWlaZWNWaFdzNmduR280SDU4bW9XRk1pRDdnM0g1?=
 =?utf-8?B?ZkU3c1JtTnBXRTlCaDE2ZVc0MXBZUER0Q0RJRFplTFlNTHMwNW90QVdLSmNy?=
 =?utf-8?B?ZUExTGdyZkNWaDRxOHA1OFlrMSt6OUtqV01vVmxvZTdTYUc4OUpZVy9lK2Y4?=
 =?utf-8?B?SmQ2ZXA0OHVlSjAwNzJDcDYyc1lKVG1Eb05lUCtMZHU4S2ZIbG1NcVBKdVhD?=
 =?utf-8?B?Wjg1ZDBWd0kzREFMQ0YyM05mWUNEME54ajlLZE5VblRWc3daMGpHRlFyclJW?=
 =?utf-8?B?L0d5NUlqOWZMVFZUYVpGd1gyUXZ3YVFKTWRoVkJkaDhjSGpSenlhbHVNN1Uy?=
 =?utf-8?B?NXdQeFZydkY5UG03MC9HKzQwZ1FsRVQraEtRclJZQWJPNWFSZVpTRll6dHg5?=
 =?utf-8?B?dVBSWWVSS1BQTjRqbUI3cFhOQnJzYmtHa2F0L3FkdnRESFdpc2VkZHpYZTJi?=
 =?utf-8?B?RXNvSFBFL2JUOUdSclNzN0UrN1NYclVCTDliaDFXK2VFdGUvL2h3VWRsUUpY?=
 =?utf-8?B?R1JabkVVOVZGd1hQSEdXbFd2SXdjVmo2bmJrd1FoUXNNb1J1N2x4M0JXd1hI?=
 =?utf-8?B?VjQzUW1yMFhhTWltWDcwbnZWSjlJQjNQUEd3VG8rSGJzVjBqZC8yL0l1UjJ3?=
 =?utf-8?B?N1RHZ2tiejlJbkJub1RUYUk5eUxCZHF6UmM2ZWV5cDF0eGhDM3R4V2tRUDVW?=
 =?utf-8?B?NDM1K0RZRUVpdEprOXNyN0k5djdlTEJzNXdwakRUbDJoKzVkR1hoOTNPcXla?=
 =?utf-8?B?Yi83U1lCaVVveFRWQk5rSVVOaGx6RG50czM5QmFiZkZGQ3JDOU15VUZLMkxX?=
 =?utf-8?B?aVdEMVhmVENBZzN3MFZPMjM5MGFGY2tpdDhCcnhmQnE3Q2tYNGE1R3RZMW5U?=
 =?utf-8?B?dUxwZ2kvTGttU3JqUmN6SEdpWDYzMUJseUpiQ2cvN1JRMGdaTXYrT2x4Z1lT?=
 =?utf-8?B?UlpjVUZMRmhPOWpYUVBmUHgvM3hlS3hGdTJuWFRUQk9WMnllS2FCMU0zZmxW?=
 =?utf-8?B?QTg2MW9vOERIMXlOL3VZcTdUMUpiTkluU0p2cUJtQy9DQ1d2dk9vRGNmWU45?=
 =?utf-8?B?WnVTOFNZcDh0WVNRQTk1S1JDSE80d0dMVzE5UnFsNGI4d28ySEF6b3RjNVVM?=
 =?utf-8?B?WkUweFFxZG9RQlRiSUNJWll2akgvVkdmY1pYVU95QlZoZ0lOL3ZQYWRVdDY1?=
 =?utf-8?B?cDB0UG9jQ0d3S0EvelNxakhETGJNQjBLbGVSVUlScFVFdDh0ODJYY2h1OTVF?=
 =?utf-8?B?NkdVVnJZZWYwMGJHWUh4TVhoQm9KSEV3NWpGUFBURXlNUG44QWszUmpJbG5K?=
 =?utf-8?B?alNpM3ZSSWVyU3NydVJ5eFBValkzY2FTM0FWQWFUZ0ZLb2pocGlLQURVSVBm?=
 =?utf-8?B?VEt3SmlTYnBBaGpXOXU4a1ExTGtaSEt2NG4vSS9zNDhyTW9TL0Vqb0lWVHA1?=
 =?utf-8?B?SzdmN0llQnQ2aEd1V2RtYzVoMDA0SFJYbmRFVmo0bnRaNE9BcU01ZFN0Z0tQ?=
 =?utf-8?B?VFJZN0k5T3ZkcGtVdDBGemU1RVVSRU16aWJJNmp6K3E3T3M5UjlpdlJQK3dH?=
 =?utf-8?B?ckNhMnhyTFFzRzNWOG9QY3V3cnJpSXI0STA5djJXdEdrNGRpYzBPaG00RE96?=
 =?utf-8?B?TE5tRWhGTyt1OFBiQ3VSNDFhdVRyOHpnUnZSZjg1dnhjK1ZWK3Q5Rk0xdHFn?=
 =?utf-8?B?MEQwcE80MnJ3T0Z3ekdQRVVZQUVIcEhMbkhidHYxWlBESHZNQVlaMzhYMGc4?=
 =?utf-8?B?azZhRjg5c2ROVmQycFNQNHN0NCtOcUMwTEZiRVpQS0k1TENnT3lSYnhUdTVs?=
 =?utf-8?B?MVFPbHZoOTBWTjZoMjEyRmtIOTZYM29WNU9GamQ0eFVnMUdhT0NHWW8vblAz?=
 =?utf-8?Q?u3fEfUCWJyXe5nNK1n1dtSKSH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5907880d-c7aa-44de-c64f-08db8e98c665
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:58:22.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjTU61jhYyq8WAluvusrq5yUgYyELuBzzgPZvoAHR+v+FHXfueNbCr3R4JtTCwDZXyDIBQfnq3RFtkwSLIRSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7238

On 27.07.2023 13:46, Daniel P. Smith wrote:
> 
> 
> On 7/21/23 02:14, Jan Beulich wrote:
>> On 21.07.2023 00:12, Christopher Clark wrote:
>>> On Thu, Jul 13, 2023 at 11:51 PM Christopher Clark <
>>> christopher.w.clark@gmail.com> wrote:
>>>
>>>>
>>>>
>>>> On Sat, Jul 8, 2023 at 11:47 AM Stefano Stabellini <sstabellini@kernel.org>
>>>> wrote:
>>>>
>>>>> On Sat, 1 Jul 2023, Christopher Clark wrote:
>>>>>> To convert the x86 boot logic from multiboot to boot module structures,
>>>>>> change the bootstrap map function to accept a boot module parameter.
>>>>>>
>>>>>> To allow incremental change from multiboot to boot modules across all
>>>>>> x86 setup logic, provide a temporary inline wrapper that still accepts a
>>>>>> multiboot module parameter and use it where necessary. The wrapper is
>>>>>> placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
>>>>>> inline function into an existing header that has no such functions
>>>>>> already. This new header will be expanded with additional functions in
>>>>>> subsequent patches in this series.
>>>>>>
>>>>>> No functional change intended.
>>>>>>
>>>>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
>>>>>> index b72ae31a66..eb93cc3439 100644
>>>>>> --- a/xen/include/xen/bootinfo.h
>>>>>> +++ b/xen/include/xen/bootinfo.h
>>>>>> @@ -10,6 +10,9 @@
>>>>>>   #endif
>>>>>>
>>>>>>   struct boot_module {
>>>>>> +    paddr_t start;
>>>>>> +    size_t size;
>>>>>
>>>>> I think size should be paddr_t (instead of size_t) to make sure it is
>>>>> the right size on both 64-bit and 32-bit architectures that support
>>>>> 64-bit addresses.
>>>>>
>>>>
>>>> Thanks, that explanation does make sense - ack.
>>>>
>>>
>>> I've come back to reconsider this as it doesn't seem right to me to store a
>>> non-address value (which this will always be) in a type explicitly defined
>>> to hold an address: addresses may have architectural alignment requirements
>>> whereas a size value is just a number of bytes so will not. The point of a
>>> size_t value is that size_t is defined to be large enough to hold the size
>>> of any valid object in memory, so I think this was right as-is.
>>
>> "Any object in memory" implies virtual addresses (or more generally addresses
>> which can be used for accessing objects). This isn't the case when considering
>> physical addresses - there may be far more memory in a system than can be made
>> accessible all in one go.
> 
> That is not my understanding of it, but I could be wrong. My 
> understanding based on all the debates I have read online around this 
> topic is that the intent in the spec is that size_t has to be able to 
> hold a value that represents the largest object the CPU can manipulate 
> with general purpose operations. From which I understand to mean as 
> large as the largest register a CPU instruction may use for a size 
> argument to a general purpose instruction. On x86_64, that is a 64bit 
> register, as I don't believe the SSE/AVX registers are counted even 
> though the are used by compiler/libc implementations to optimize some 
> memory operations.

I can't see how this relates to my earlier remark.

>  From what I have seen for Xen, this is currently reflected in the x86 
> code base, as size_t is 32bits for the early 32bit code and 64bits for 
> Xen proper.
> 
> That aside, another objection I have to the use of paddr_t is that it is 
> type abuse. Types are meant to convey context to the intended use of the 
> variable and enable the ability to enforce proper usage of the variable, 
> otherwise we might as well just use u64/uint64_t and be done. The 
> field's purpose is to convey a size of an object,

You use "object" here again, when in physical address space (with paging
enabled) this isn't an appropriate term.

> and labeling it a type 
> that is intended for physical address objects violates both intents 
> behind declaring a type, it asserts an invalid context and enables 
> violations of type checking.

It is type abuse to a certain extent, yes, but what do you do? We could
invent psize_t, but that would (afaics) always match paddr_t. uint64_t
otoh may be too larger for 32-bit platforms which only know a 32-bit
wide physical address space.

Jan

