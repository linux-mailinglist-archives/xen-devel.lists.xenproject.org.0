Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12046FDB07
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 11:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532714.828983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgR8-0000y4-4k; Wed, 10 May 2023 09:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532714.828983; Wed, 10 May 2023 09:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwgR8-0000vD-1d; Wed, 10 May 2023 09:48:42 +0000
Received: by outflank-mailman (input) for mailman id 532714;
 Wed, 10 May 2023 09:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwgR7-0000v7-0c
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 09:48:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d607465e-ef17-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 11:48:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6777.eurprd04.prod.outlook.com (2603:10a6:10:11f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 09:48:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:48:34 +0000
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
X-Inumbo-ID: d607465e-ef17-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRIwqDLV3cZyqSxz68AqplkBjGw3krKTdFYWH1cM0Rku96HhlNpES0CGTGbBUmC5DaTUq5fuaDcjgKZATZNWBOUE0OB6AUhp4Pe/kD+p9fq+PvNSWuQmYikkdF4dd9IS/7nJcffrxwG4uY2JowUdFuvzTe0LBKMPFMlw2vZ7IJPIfKS2zJyja77dGYH4sn3V4YfzbovFqtW1qA2F4ZJ9dQrUIGCpZfA9hPYznp9IZ00L7YLSTcAI8qS04V2XyfbgUkIeCrSrGQ2KSUh7xoxnX52HSyTANnSUiNHJe2Dbq15FooNnGTtu5FkSc+8k0ZwqKIrXc7a5VpHkhaVkzn9+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh2cPGVwKioGILcuvUvPbT3bMsbGcosp6FhUyreLLms=;
 b=l8SONBMC64VkKp2/eg/R+RJIn6g++yd//RqdQ/yM9nGlYPx7e9z8XYqUbw+OSbLY8fyKryUtqkwN/R7u5MGBddbEU4Tk3GtSEJZN5l3dx08G+r6i1WOTS2aXgKQySm3WxBCPQFHeNFYd1qG5t6EnVzk9yane/w+LKZ7mZTyBUibp5AAHdFglCHYHSjE7QwtgKcc3Vznv/vj2GWDUxiDOjpaItjuz+Qs8PoSScR1sQxwYAwc1cJw5qNNp9t8p7TAJp9EXeEJ2FSzyVIlRkt66ucIA/sjoLgMKh55JMStWtf1O6A9JJ00Mm8n4U+HggJ8l8poNgXc/AflHy51OGRr2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh2cPGVwKioGILcuvUvPbT3bMsbGcosp6FhUyreLLms=;
 b=m+nuxJBxGBUikAjydSj8kU9kpeI2JeHlwC0I+kbukSaS+qWkTDSyK3qi7pbAi+ScxJM5eSR6t6N8pV1tPWAEdg9oPzLXa/41BjHAEBQrKTgVIGzHLAWH/JgAQQlhCzNF7caFnY5HKsIFK+7KxLf7uWI9P2BDBm8WmUIIB1EbgHCgyp11178JWXnErOLKGr9yigPrXhr6tQ1HoS4Z1KdPyW5fIgELRfzOB61rVBlxxSkA5p5BiHkgcL4IsLcbRWPS4ZftopEWJybBEd44RH7VOgvHqu26TVjL2jEbutQNPG+X3Ktg+WoVbfwVHGAhOsaFcuILjb3CDjt7kdWUPli2ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b8f033d-321c-412d-d0f3-51d29ac8d238@suse.com>
Date: Wed, 10 May 2023 11:48:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN PATCH 2/2] x86/Dom0: Use streaming decompression for ZSTD
 compressed kernels
Content-Language: en-US
To: =?UTF-8?Q?Rafa=c3=abl_Kooi?= <rafael_andreas@hotmail.com>
References: <cover.1683673597.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700F6DFE45A48D90B5FE679E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <283798a0-0c69-7705-aade-6cd6b2c5f3c4@suse.com>
 <DU0P192MB1700F7BB44DC06D67D7AE345E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU0P192MB1700F7BB44DC06D67D7AE345E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 3553c3b8-57e8-4550-4eec-08db513bb889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7aPKgfdOUKqh4MawrdN6u+0bzJxLXOSan5BkUFEeKyoGefK7DP6pXkSoK2b+65KM+Zuf1Si0kDAbPLF/LfgnBySYuuFfSzJdP2ggAzqv6BT7Xj5K2bw9fNiCrkeilWGl+XguTo/bVBnwoJ1uou66i+fUUGJZ+NJ6IoX/M3MQFoCz9yc0349gI44GABT5FAOfRbMbcpdGejhChl6omTq3WP1FoHVL7oVgaUyjpdWxggltMSmqU2gHpbCqq+/TrwgMqMN1d1fC4Q6NzQb5W8R0DLug0WM7+yG80G7cByXktSL2eAiZju6pSS7RtYRTyinQWuOfh/x4x/eRS5kjPrgFzj/2Dd4OCd0Ved55gPBbsTT+0YywneR+QRxCqp4/Ek6sZ75l8JGtTy/LrknWwtWYYBJ0fiQtB2dIW6yNIZPtht2EXrXmLjwccDtIsICxVUv8ntzxKC9RQqO9ZeCnb9yGTAd+nos40tLfkyQjTv3NO9CzygaEu/I8R0nZKKHpcs+UgvnM/4MWhhjNWDEYrJJNrDnPbPlJaabZYBnRh5fHERMtUvXvcRyal3jpsFRnR1Mt8xrhu07ZiN15aB3BPdyFXxZVat9rYaNqJ48V8v2pBm785hD8sCdpbL4z4Ye9fY+n82Vz6njxrHO6EixZ/O3mQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(86362001)(31696002)(31686004)(316002)(6486002)(66556008)(66476007)(6666004)(41300700001)(66946007)(6916009)(4326008)(5660300002)(66899021)(8936002)(8676002)(478600001)(53546011)(38100700002)(26005)(6506007)(2906002)(186003)(6512007)(66574015)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEJtR0Iza2wrMEVIZUhyWVFlRWdVMFcxenVrV3VEL0hpay9ERHZqTU1DdWR0?=
 =?utf-8?B?UlFvWEtjK3c1U2Y3UUtQTVZjU3RUWEFxRmJ5ZnVjdmg2ZGtwbzVRSWxYSWlJ?=
 =?utf-8?B?cGFFUUlvK3RwbExSWGhDbUoxemRuajVIV0ozek9SNGpwVEJueDZEZDV5M3N6?=
 =?utf-8?B?bEpmZzRmOUVZb1JJUGpwOGNqbWVzTTJtYXRFUkp4SzAxbFE4UXRvMTlPUWJP?=
 =?utf-8?B?WUp4RW95V1hiNWNHdGIzMUtjd0FIa0VURzNpemhiWUhXSEFseTREUjFyN25Y?=
 =?utf-8?B?YWNsb3A5RFVFQTVacDZDblRZcnlraG9CSDlTUk1BZ2RjdEJDcFBmMkh5bVdn?=
 =?utf-8?B?OTl5amQ5eW0wd3JzTWFSdDg3NVRTUzhzaEJvTFJkNk0yVC9IMEhWNExiajZm?=
 =?utf-8?B?VmtEeXMwSmxqRFdFcjMwSGZCT09FdWwxcWtIWXg4bjR6MFd3WFhjNkFRd24r?=
 =?utf-8?B?dkNKbXR0T1M3YXF0bGFCVENBelg2aEJZN01nTXpKeVcreGJvN1RIei94ZHdR?=
 =?utf-8?B?V01yeldZSHdWbllMSUZOZmc3ZmtBbjJEZFRGNjNybnBjTHJqWG1CYkYyanNr?=
 =?utf-8?B?RnZUVzg1WVM5V1dmNFo4UXJoZVFSdFZCTld3QU5CeWlrZG1EL1ZKazlGd1Mx?=
 =?utf-8?B?T2RNRkRyTU1qWHZKR1F6Qks0dmZaV2Y3MlFZaEVhUXlNSUFqNW5IRU5RV0gx?=
 =?utf-8?B?Z1FEck1od0NwK3VEVE5NUW5IYUFHNmpKNkJVN09US3VjMUhZWkgyeGI4N2k1?=
 =?utf-8?B?N2R3VGVNdnEyUFk3QUtYK25kRG1EVlpGeU5iZkgyQVI0ZmhwOXRFWWc4ZWJD?=
 =?utf-8?B?S1BDemxkL01aS1N5THRKRW5URG4wZzE4MXVJL091NXFQdEE3cUd6VXcxZHJC?=
 =?utf-8?B?aWZmdzBzNnp6RjBxRTBXeVpIMXBsRUY5MVl0V004MGZLVWgvQyt4R2pMMnZT?=
 =?utf-8?B?VE1ZT1lUZnVPWFFSVnBZdHJuRmZaYnMyalV4ZWpCMG1pcEhRb0w1aHJycXVt?=
 =?utf-8?B?WkxLUFJhNVhvM1ZqUk1xQUxzMkt4ZmNqWWtqbTl5YU01VWdEcXZrYnZuR2t0?=
 =?utf-8?B?TWl4K3VWSEliVHRwUjdQVmFRNDc2cG93ejBpZks4NEZ0T2VWdS93MERmdm9v?=
 =?utf-8?B?bTNmRDNKeVVPaE0wU2pXTDdRSGpxbVRJM0Rqc1dqKy9KcDhVS1R0dkcya3U4?=
 =?utf-8?B?dDROeHo3NFo5WGdickRaVTlUZjZ6RlJHbHZNZXhYTTZJSC9ZdVYrU2ZEcjQ1?=
 =?utf-8?B?Y2cxS0FkeUkxbDhhaGt4dnBqTDVlam9qeFhONkZRVi9CMVNrQWJRNkxYQ2Ux?=
 =?utf-8?B?VTJYcHpMdkxUdU1JQmhEOGs2NDEwcnQxRnBIWm9BOWYxeTEyS3NidVQ4YnNX?=
 =?utf-8?B?bENDMVhjOTBJcGhoNHRSNitwSjNmWDUxTXpqbHZraTFPY1EzMSt0dWJTZkxs?=
 =?utf-8?B?U09UUVVOUHFlK1BJYlpybkt2L1oxbmtUa3dTTEt2aVlBbjRoWjB5Q1g0bURI?=
 =?utf-8?B?SmI2YjZzWFhSR0lvUEhpNDRoeGJDREtOTU40SDdvZURPZGlrL0o3YUFuNmV1?=
 =?utf-8?B?ZWFDMUlJdkx2Y08yWk02YXZKcjY2YnozV050dFdhZkNuRy8xOW5XYW94dVZn?=
 =?utf-8?B?SnFNMmNicmdnRUcyMlBjNCthU3k5Z2FaZmpHbWJPbC93NlpJLzVlZkJNdENw?=
 =?utf-8?B?MmJURzUrQlBCZDBZSXR5NVRRT1RvK2NhV0FjZFoyenZNZDh1cDVDdE9LdlQ5?=
 =?utf-8?B?dDRIc0REMnZtbFpiOHl4WkdMVk5mVjNXeTRiUExzSFNFcUhna2IyMk9nYWVX?=
 =?utf-8?B?MHUwUTM0dEdkSkhqcm9ZVk5hUWs2QUMvcUZ5Qk9WZm9VSzlLU2RmRlFqQzFB?=
 =?utf-8?B?R00zMUp2NTkvcDRQMkZGcHNlRHNHNVdCT1RvNlVDZDFSTjZTWXBWMjhMa29M?=
 =?utf-8?B?Z0JralMwRXpUSlBpdmp1aEJqMzJSL0lVeXZaaS8yek9naG5Qci9ma2ZLWGMz?=
 =?utf-8?B?YnlOT0lmb01tOEM4UktjbWJYMXlkZ05IdUxzVGtaRklWV2c1b2FKVzlleUFw?=
 =?utf-8?B?RGs0MGIwTWR3TlZXN3VyQWEweEpxT25TeU1mYy9Yc09kL3FlazFpazNWWEtI?=
 =?utf-8?Q?82JYdgilzfZLqa4vs4Ttx78qB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3553c3b8-57e8-4550-4eec-08db513bb889
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:48:34.6387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EnOty7aqn1XAsKeDlFbJxc057+9j1AqxZ03Darfq9HYGWLWlA+tbkQkTlJxb2dSi0fdCWqexoZNun409yqgtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6777

First of all - please don't drop Cc-s when replying. I'm restoring
xen-devel@ here at least.

On 10.05.2023 10:51, Rafaël Kooi wrote:
> On 10/05/2023 10:03, Jan Beulich wrote:> On 10.05.2023 02:18, Rafaël Kooi wrote:
>>> On Arch Linux kernel decompression will fail when Xen has been unified
>>> with the kernel and initramfs as a single binary. This change works for
>>> both streaming and non-streaming ZSTD content.
>>
>> This could do with better explaining what "unified" means, and how
>> streaming decompression actually makes a difference.
>>
> 
> I don't mind explaining it further, but with the efi documentation for
> it existing on xenbits, should I just refer to that?

You may of course refer to existing documentation. Iirc that doesn't
cover any compression aspects, though.

>>> --- a/xen/common/decompress.c
>>> +++ b/xen/common/decompress.c
>>> @@ -3,11 +3,26 @@
>>>   #include <xen/string.h>
>>>   #include <xen/decompress.h>
>>>   
>>> +typedef struct _ZSTD_state
>>> +{
>>> +    void *write_buf;
>>> +    unsigned int write_pos;
>>> +} ZSTD_state;
>>> +
>>>   static void __init cf_check error(const char *msg)
>>>   {
>>>       printk("%s\n", msg);
>>>   }
>>>   
>>> +static int __init cf_check ZSTD_flush(void *buf, unsigned int pos,
>>> +                                      void *userptr)
>>> +{
>>> +    ZSTD_state *state = (ZSTD_state*)userptr;
>>> +    memcpy(state->write_buf + state->write_pos, buf, pos);
>>> +    state->write_pos += pos;
>>> +    return pos;
>>> +}
>>
>> This doesn't really belong here, but will (I expect) go away anyway once
>> you drop the earlier patch.
>>
> 
> The ZSTD_flush will have to stay, as that is how the decompressor will
> start streaming decompression. The difference will be that the book
> keeping will be "global" (to the translation unit).

But this bookkeeping should be entirely in zstd code (i.e. presumably
unzstd.c).

>>>       if ( len >= 4 && !memcmp(inbuf, "\x28\xb5\x2f\xfd", 4) )
>>> -	return unzstd(inbuf, len, NULL, NULL, outbuf, NULL, error);
>>> +    {
>>> +        // NOTE (Rafaël): On Arch Linux the kernel is compressed in a way
>>> +        // that requires streaming ZSTD decompression. Otherwise decompression
>>> +        // will fail when using a unified EFI binary. Somehow decompression
>>> +        // works when not using a unified EFI binary, I suspect this is the
>>> +        // kernel self decompressing. Or there is a code path that I am not
>>> +        // aware of that takes care of the use case properly.
>>
>> Along the lines of what I've said for the description, this wants to avoid
>> terms like "somehow" if at all possible.
> 
> I've used the term "somehow" because I don't know why decompression
> works when Xen loads the kernel from the EFI file system. I assume the
> kernel still gets unpacked by Xen, right? Or does the kernel unpack
> itself?

The handling of Dom0 kernel decompression ought to be entirely independent
of EFI vs legacy. Unless I'm wrong with that (mis-remembering), you
mentioning EFI is potentially misleading. And yes, at least on x86 the
kernel is decompressed by Xen (by peeking into the supplied bzImage). The
difference between a plain bzImage and a "unified EFI binary" is what you
will want to outline in the description (and at least mention in the
comment). What I'm wondering is whether there simply is an issue with size
determination when the kernel is taken from the .kernel section.

> When I present the v2 of this patch, do I add you as a reviewer? Or will
> that be done by the merger?

I'm afraid I don't understand the question. You will continue to Cc
respective maintainers, which will include me. In case you refer to a
Reviewed-by: tag - you can only add such tags once they were offered to
you by the respective person. For this specific one it doesn't mean "an
earlier version of this was looked at by <person>" but "this is deemed
okay by <person>".

Jan

