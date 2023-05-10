Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A46FE348
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 19:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532979.829331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwndw-00006B-U8; Wed, 10 May 2023 17:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532979.829331; Wed, 10 May 2023 17:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwndw-0008VM-Qa; Wed, 10 May 2023 17:30:24 +0000
Received: by outflank-mailman (input) for mailman id 532979;
 Wed, 10 May 2023 17:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlwF=A7=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1pwndu-0007fU-S5
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 17:30:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05olkn2081c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::81c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5738935c-ef58-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 19:30:22 +0200 (CEST)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 GV1P192MB1954.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Wed, 10 May 2023 17:30:19 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047%6]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 17:30:19 +0000
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
X-Inumbo-ID: 5738935c-ef58-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXzgPl6LO9xMZxlhNXqggjUpehZ4s76ahRpkk1sfAEsHbDmQptLE/+9SI6eVQQgjNYHjOx4iJUIoM8wJgdvitCf1AoZ5FfmfT4+uqZJdRLYMta4p3rs49z20Iv9nhLwl1ILAdE2fR7zhV2J/8lVrvo02dDTX0K7t+6O9qyYW7tZy/EgYSKO9nzbi23tG/rafpgj4cCzHmL+ARZUYVih5Gfeq03eIndfupoHaPKBTTuCyP3j2VoVoh4NFcpxfxbQItstheb1ZM9FUdRYldrWf0H0iM31198c3H2E1tIyDmdxP806df6ftXSAhhRc1h/bgSVl33amHENxsvyvGqxwRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqsYhJNFeJuQBb3WBqeRIoylAd76FXO9pXtwICNnV/M=;
 b=AwJBDXidGudzI6LZKGIOW5dqQRAfnj7Kt1u4jSjUSgtF50g1GjFQDgCS1n0rFPILFkrdckaA9qBEIGUVn6aIm2MUHVf/kTesfgp4lW9NtvemgHp9FySqTZNgjNy7e4gkfeW9519EE3oOgA0rTXHVZkOe3ZvRhI12U47SJzo7UFOKVz2zPn6v1pwAa/HXxEHsMUewbiBRVjaP9KKjfJZlIUphpP7TXnj+t/tyi+08Osh5lAbE/ZvG7JAZQVMKTReg5LOQfKGnGYwpAdxtU6x1JApiQmPswtT12a33eDOh1BvKhfuPeHywDJTDI/IPbww2zhzzn2XPXY4jeUo1Q/1APg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqsYhJNFeJuQBb3WBqeRIoylAd76FXO9pXtwICNnV/M=;
 b=YFYroJFNFRCrNKBfjxNXBxZ+C9ziszMkG+YUc5wx2Lbf+iNxBc7dEkg08mBibxm8Y9lwpLF7t+LT7BiR1rf8733Mpk1k0L1gPF/V37Bh8XC0IZtAJYfooAjHiHIQItOisbWnXqJDXVSA7vxtU2yYfIguZdOZDYo9Zgz+Lx8zGLy8/kX/P1HxNTIwa86CUaaa1+YgiougQa+RaIMM7Wy1BKSg/B2PE51MD00xp1CEM5669AiHRod437KjcZi+nEbEregPBsGm23YwC/KR61nvORFu1d5c7b3sJ1KPbySQUOSJI3syMSFoAlKJg8Y1arMOJZf2PBqyszHA8D8KKYHoew==
Message-ID:
 <DU0P192MB17005DCCA86057EA3DF33171E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Wed, 10 May 2023 19:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN PATCH 2/2] x86/Dom0: Use streaming decompression for ZSTD
 compressed kernels
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1683673597.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700F6DFE45A48D90B5FE679E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <283798a0-0c69-7705-aade-6cd6b2c5f3c4@suse.com>
 <DU0P192MB1700F7BB44DC06D67D7AE345E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <9b8f033d-321c-412d-d0f3-51d29ac8d238@suse.com>
From: =?UTF-8?Q?Rafa=c3=abl_Kooi?= <rafael_andreas@hotmail.com>
In-Reply-To: <9b8f033d-321c-412d-d0f3-51d29ac8d238@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [ytUm3PzdyLVYb7OoH6gPSw35AlI9BmAEzohSjSD4e0iJCPqkdkGMCBB8O9iBN3PV]
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <1b81fcf2-ed4e-ea55-41c6-aed537498e0a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|GV1P192MB1954:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cb3e87-b6dc-4d72-a104-08db517c39b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D7OUgSOHce6lUHkKEA5LP2Fm90/2Rb6mzjN0dtWXt5Rd9JfZSyrRYMGPRqovpNiYYHtg4bxVmuKsji4lL12HigztWMYWlwBlsWQ7Jl1m+6qv36tAsF8W5B+usqvdJS++21bAbdkJPYp1Av9WeA2jhMUyNrWczDxCzrOahqVg3Y93/yFIB1kIkmqatSZPFPRTdy8sACbOaaZYkxav2wZ2xbYpC8WL18kDIE9CR/JmX26dVvoHKUtPB++UwOUnUydg7MAe8l0ln6eSDW7qngofyBFGn5FJVtToSnVkI6c+JXYCdJ9K7Io4I4G6+vvwMV2kQ1U8ooLLFqi36xUIgFaKtiZ58fvtmzfRGAJo9Ub3pz+JifnDP8Edv7FzkOgS4yfLUzWBVJ+TQ2QqI6A7Q61MPlaCTC9gU5737WY1BwFq35Y3NyOoI2IQ7bAbguxXBgJG/+ntfMyiK6LXwAlBULFalN1n8eecfqfiYGbXR3RlbDmZGf+xgjSkuR72JEPKZU0aSq/TBzq1X15WkjXY2d3CrLx6Onl2rYuog151vG2XPXelXbTOmj2yLQj0GuPAb4xRHs0Obvdf03eRpEaAOYaRatx1oMgYFAJPSBCOo88Dge6OUf6Wyw3VFfUOvHfFZN57
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODFobU9KdzBlOWc1ZnlNVUtFc0lRbjVCU1R5dnJTemIrTkU0NU0zbkxoeTVj?=
 =?utf-8?B?V0VWMlViQ0NxM25qTC9XbTVjam9JdjdGQ1FkZ0EwaHR2eU1tTmpwelBaRDJm?=
 =?utf-8?B?c1BhbWw4S1RSL1F1OVk5dEk4R2w2UTNhSnRXdnlkdDRJdlBlV0xNU01qbTgy?=
 =?utf-8?B?WVRWcVJnTmgxQXVicll3QTBXWDNqU3lYa3FLdFZUNTErdnU3VlRqL1NLM1R1?=
 =?utf-8?B?UDVFMVdoWnhUWGN1YzlyZ0F5bGQwcW5ScUd6OW04UUFOSTc5blhydDNhdzVV?=
 =?utf-8?B?Vmd3RzhlK0FKTDVGSGtUS2FtNU55THRFSi9EWjYvK0htc3NDdGRJWUUwN081?=
 =?utf-8?B?UHI1MkVBQjZaOVZodFZ5SExxenhGbnB5c1NwZmRTY0RRaEdVaFJjQmpjQzYz?=
 =?utf-8?B?OGZEdDJ6a09Xd0RyVTdHV1NDUTFyU1JNUWdGV1hQcENKRksxbXJHSUdBWHk2?=
 =?utf-8?B?cnZ0VmlBOGM4V2p4RlNwSEkzSkpsNENIWE81WnhMUTJpM1Yrc1RxTmtXcGlx?=
 =?utf-8?B?dDlRdzNjbFE0dW9xazdzbUZjb1dab2Fmb2hPOFFOcW1LS3NpYTM4VXJUaVRG?=
 =?utf-8?B?V1hqVkFHaDBuUGJJeWVhZ2psaGpqRWhXVUtLMW5WeHZLbngvZkVtUE5SY0xM?=
 =?utf-8?B?WmlmVzFqdVp1ZC9UMWVOcnBHOTBCa3VxVnVmV2d3eVJ3QWpwZU1aWUZGWTVz?=
 =?utf-8?B?d05NWjBCdERhSVhTeDFCUjBmMGQ3NU1jaXJ1aE9sNit2czJPejZkU0dicTJM?=
 =?utf-8?B?SVFTbng3a3Q2akxYR3Z5RWlVdnRyaldrSHcvaGVkSVJaSVZNK0Z5KzZNa0I1?=
 =?utf-8?B?WVk2RFJNQXo3eDBHUHNzS1ZRSlNhTHNYem50M2pYK090RC9EcHRuUWZMSHVT?=
 =?utf-8?B?dTFuMHBBVm1wWTA1UzAwSThYY29IaEo5ZGRZOE1TYzc1Tm10NFdiNi9rKzBz?=
 =?utf-8?B?dHNEYlJTeGFnYU5nT1JFRXpyYXZXMytKY2h3VU1YUkROMU45aUNYVUhVNUh5?=
 =?utf-8?B?SzN5WHlyOVlEOG5YM1V4Q3dHK3k1MGE1NytMNTk3cUkyOFVSSlhFVnBvRW5w?=
 =?utf-8?B?QmxpTGYzMjRuZVlOS2YxeUREdUxYNVRMT2dGWVlKSFFtWGMvRGRVb2ZvblJE?=
 =?utf-8?B?M0g4MFRuUFNXVE80MXZxMXhrOWI2cUNqMlhFMzNwYks1TTVmWmsyRXZ0aHV1?=
 =?utf-8?B?UUxhald2YkVpVVArQkJTdHJiazY4KzVyd1FxOWpEZ3VtZzJoMzUrWFE1SUFK?=
 =?utf-8?B?Mnlmb3ZKSVR0OU5OUWprMEh3dE4yZUZnMWpNSWdGTkNvajRPbkdCK3BZZEpK?=
 =?utf-8?B?ejF0dnhScHdKc3kzekltMTR6YjJNclBSb28vdTB0eU9Jc050TUNZNy9nVnRt?=
 =?utf-8?B?cGFhWGZUZDBtTjlWRXpTbVFBMVdya2NzUkNiNnEvUThPMkl0OW1MVVhUU1c3?=
 =?utf-8?B?WGtrYWFDMjVIVHdoYWVmVW5rM2RuWmtOU24xSDh4ZCs5cnFtUlVNNWcrVE1X?=
 =?utf-8?B?VmFSN056aWJjNXhTaitYWmdKZEl2YzFFcGtqWWF6RDJyeHJ0eEpyMXFITTN3?=
 =?utf-8?B?WnNRbG5oSWhkdmJENndDK2d1TjZkbjJYQ0xpRXlCY09qSWphbWl3Zmt6d2Q4?=
 =?utf-8?B?R0ZkZjlDUHoyRUs2dFB2L0xEOGI1cWNLTW1qa1BjcHFhOWZ1dTExZHdrd2xn?=
 =?utf-8?B?eFFQc3U5dDEzamhCUWNWUDdZTEtpckV5K0E3VWVGYXJHeHUrRGpBSWZaUXB3?=
 =?utf-8?Q?IoxnGkFSq6ZL3chqOE=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb3e87-b6dc-4d72-a104-08db517c39b5
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 17:30:19.4320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1954

On 10/05/2023 11:48, Jan Beulich wrote:> First of all - please don't drop Cc-s when replying. I'm restoring
> xen-devel@ here at least.
> 

Apologies, I didn't notice that replying dropped the Cc-s. Should I send
the emails again with the proper Cc-s?

> On 10.05.2023 10:51, Rafaël Kooi wrote:
>> On 10/05/2023 10:03, Jan Beulich wrote:> On 10.05.2023 02:18, Rafaël Kooi wrote:
>>>> On Arch Linux kernel decompression will fail when Xen has been unified
>>>> with the kernel and initramfs as a single binary. This change works for
>>>> both streaming and non-streaming ZSTD content.
>>>
>>> This could do with better explaining what "unified" means, and how
>>> streaming decompression actually makes a difference.
>>>
>>
>> I don't mind explaining it further, but with the efi documentation for
>> it existing on xenbits, should I just refer to that?
> 
> You may of course refer to existing documentation. Iirc that doesn't
> cover any compression aspects, though.
> 

Right, I'll think about what ends up being the clearest explanation.

>>>> --- a/xen/common/decompress.c
>>>> +++ b/xen/common/decompress.c
>>>> @@ -3,11 +3,26 @@
>>>>    #include <xen/string.h>
>>>>    #include <xen/decompress.h>
>>>>    
>>>> +typedef struct _ZSTD_state
>>>> +{
>>>> +    void *write_buf;
>>>> +    unsigned int write_pos;
>>>> +} ZSTD_state;
>>>> +
>>>>    static void __init cf_check error(const char *msg)
>>>>    {
>>>>        printk("%s\n", msg);
>>>>    }
>>>>    
>>>> +static int __init cf_check ZSTD_flush(void *buf, unsigned int pos,
>>>> +                                      void *userptr)
>>>> +{
>>>> +    ZSTD_state *state = (ZSTD_state*)userptr;
>>>> +    memcpy(state->write_buf + state->write_pos, buf, pos);
>>>> +    state->write_pos += pos;
>>>> +    return pos;
>>>> +}
>>>
>>> This doesn't really belong here, but will (I expect) go away anyway once
>>> you drop the earlier patch.
>>>
>>
>> The ZSTD_flush will have to stay, as that is how the decompressor will
>> start streaming decompression. The difference will be that the book
>> keeping will be "global" (to the translation unit).
> 
> But this bookkeeping should be entirely in zstd code (i.e. presumably
> unzstd.c).
> 

The implementation of the decompression functions seem to indicate
otherwise. Referring to unzstd.c:`unzstd`, the function will take the
streaming decompression path if either `fill` or `flush` have been
supplied. I cross checked with unlzma.c and unxz.c, and that seems to
have similar behavior in regards to flushing the output data. The
`flush` function is passed a buffer to a chunk of decompressed data with
`pos` being the size of the chunk. For the sake of consistency I don't
think it's a good idea to deviate from this behavior in just unzstd.c.

I could wrap the decompression code in another file and function, but
in my opinion it should stay here and be renamed to something generic
like `stream_flush` or `chunk_flush`.

>>>>        if ( len >= 4 && !memcmp(inbuf, "\x28\xb5\x2f\xfd", 4) )
>>>> -	return unzstd(inbuf, len, NULL, NULL, outbuf, NULL, error);
>>>> +    {
>>>> +        // NOTE (Rafaël): On Arch Linux the kernel is compressed in a way
>>>> +        // that requires streaming ZSTD decompression. Otherwise decompression
>>>> +        // will fail when using a unified EFI binary. Somehow decompression
>>>> +        // works when not using a unified EFI binary, I suspect this is the
>>>> +        // kernel self decompressing. Or there is a code path that I am not
>>>> +        // aware of that takes care of the use case properly.
>>>
>>> Along the lines of what I've said for the description, this wants to avoid
>>> terms like "somehow" if at all possible.
>>
>> I've used the term "somehow" because I don't know why decompression
>> works when Xen loads the kernel from the EFI file system. I assume the
>> kernel still gets unpacked by Xen, right? Or does the kernel unpack
>> itself?
> 
> The handling of Dom0 kernel decompression ought to be entirely independent
> of EFI vs legacy. Unless I'm wrong with that (mis-remembering), you
> mentioning EFI is potentially misleading. And yes, at least on x86 the
> kernel is decompressed by Xen (by peeking into the supplied bzImage). The
> difference between a plain bzImage and a "unified EFI binary" is what you
> will want to outline in the description (and at least mention in the
> comment). What I'm wondering is whether there simply is an issue with size
> determination when the kernel is taken from the .kernel section.
> 

Assuming you are talking about size determination of the compressed
bzImage, I notice a discrepancy in the size of the ZSTD stream and the
reported size by the vmlinuz-* header upon further investigation. When
using the streaming decompression code I made it output how many bytes
it reads from the extracted-but-still-compressed bzImage. The code
reads 12,327,560 bytes, but the size of the compressed bzImage in the
header is 12,327,564 bytes. In xen/arch/x86/bzImage.c `decompress` is
called with `orig_image_len`, when the function `output_length`
calculates the end address and removes 4 bytes from that address. If I
remove the last 4 bytes from the compressed bzImage then `unzstd` will
unpack it with `unzstd bzImage.zst -o bzImage`, otherwise it will
complain with `zstd: /*stdin*\: unknown header`. With this new
information I think the correct solution is to try calling `decompress`
a second time with with `orig_image_len - 4` if it fails.

>> When I present the v2 of this patch, do I add you as a reviewer? Or will
>> that be done by the merger?
> 
> I'm afraid I don't understand the question. You will continue to Cc
> respective maintainers, which will include me. In case you refer to a
> Reviewed-by: tag - you can only add such tags once they were offered to
> you by the respective person. For this specific one it doesn't mean "an
> earlier version of this was looked at by <person>" but "this is deemed
> okay by <person>".
> 
> Jan

I meant the "Reviewed-by:" tag indeed. Thanks again.

Rafaël

