Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EBB6FEB8E
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533113.829487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzTa-0000OH-KX; Thu, 11 May 2023 06:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533113.829487; Thu, 11 May 2023 06:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzTa-0000LE-Hs; Thu, 11 May 2023 06:08:30 +0000
Received: by outflank-mailman (input) for mailman id 533113;
 Thu, 11 May 2023 06:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwzTZ-0000L8-2R
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:08:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e88bd58-efc2-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 08:08:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7494.eurprd04.prod.outlook.com (2603:10a6:20b:23f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 06:08:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:08:24 +0000
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
X-Inumbo-ID: 3e88bd58-efc2-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QujaTB7cUuUw5xhipdJL0ncT3acgqqVFPRoF2STK+vZzqc0ZIqnrHNUYB9EzT3YXKcF5sWpMSEZkew9YKFaBXRyAiLyaPVbLRVKi3f691He77wvNLvawKNtYZNryqF6ufZ1gRSvsx/I4hizYlVqpSGcdIAZxUyjIEGGb2GKBpixCyIh97HfC5sXkuoAZiae8IamM2sRphkVTrR/U3+u8ER0+1Km2aykeJzDHAVeP6TzmmrP7M8STnTxhidqoHU8N5Ehs6ift4pmNNLBLilcZU0TmjkiZScqePPy9TRCHF44N4IVhLs1xHb6jrn50jECPgq+6DRTcTF4qW/CSi1n3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPeDCyyi69C/QPSdoXyljUJNrvj5LSTzHr/5LDbgjIE=;
 b=iEXbwCC9Otdy9101/TerJRvJnQjYAGSAn34C1PrsmUEXJFBEa7uN0ua7VBufksBD633bBSfoYiH+OLvqhqRylVQHFDoLJt3o4HHLi8WKZMA9Zgzf3/LVISN2pvhm1MGmpxmjAhTZ3eR3NtXgXJNC8eTfDWM62chn4yfVLaK/02tDSkosu3B0goLJG9o8BYDqW+pXhsmZJy0iAW56Z72vRN9diIBShMc+Pr0L7kTQ32VikuXUNilyxYGSLn1Gs7scbFciMitxhBRuci8YQ6CZm3BCk7lFlkDWnW8G1ucut0ckhBSnsyaeJHo9uRxwtnyRzhpJ89hO95pyVsTZzDG7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPeDCyyi69C/QPSdoXyljUJNrvj5LSTzHr/5LDbgjIE=;
 b=XEUmRsxEjGH7PsB8T7qYquJjgI9UXuuUu1ATM0x6svjzZiPYwPud28A10KSoHCC3Ir8E+XLln0qLzyxd2vJB7PkgYiHdqJGqrF8GkMhrfAb0ncrbn8CxDcp9wNngHWBuzl7hMnSxTgrIakH6jgATyxSTd180IvBeXvCtxV/hZVDmXdxyerCXPion0D5flLoLYyyTKuWLqf9VZ3ygMXyVQxY1tIgk46Yl98A6RJpiMju70mDQ+qbAnd+Xb0YSomxG4PBFF+a/hz934EudTeH35IzBKvClMEhInsWPEe130OvlCXYpr3J2Py9PvN9oWm6D+pAQAQ6i6rk511VMKTpSjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c4012a2-a0a7-b6f3-e931-c793659ad5a7@suse.com>
Date: Thu, 11 May 2023 08:08:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN PATCH 2/2] x86/Dom0: Use streaming decompression for ZSTD
 compressed kernels
Content-Language: en-US
To: =?UTF-8?Q?Rafa=c3=abl_Kooi?= <rafael_andreas@hotmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1683673597.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700F6DFE45A48D90B5FE679E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <283798a0-0c69-7705-aade-6cd6b2c5f3c4@suse.com>
 <DU0P192MB1700F7BB44DC06D67D7AE345E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <9b8f033d-321c-412d-d0f3-51d29ac8d238@suse.com>
 <DU0P192MB17005DCCA86057EA3DF33171E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU0P192MB17005DCCA86057EA3DF33171E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: b7726a5d-220f-46db-2e29-08db51e620dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yBNotofXybMzNmYp+obSafpIMjqQPLFXMokVZ0IHcqAPTevQkLsvBbuLg1SJlIbHCCiskMVVSXzXQxhG4ruPlp31dqTDlcpbcW1+8kO2b/hJkiZ2RCeIkYr5CPe4SBEsafPfiZ9feLpF5ZXxu/CBa+CLSjqlULpt4vytb4MZIlP6umzC62l6MCiHAh+T1E5JuhvR/VSMPsVSFFjrhNbtcAH3QMfWvt2KQ9KUO1Ux8OiGOgbVbi2gQcmvChxAvmQcF68hFUxZaAVcDqxie7LufvhMWQgi5Amzb/JC9XDa9nkxHZBv3kXfa6fpYfDYD16E/u10Yl/K3hDEVo9nVHpB8g/uZbC1CQszEi2n1ziXqcRz9bTd7KF0i1mU3SFekp19TQ1gCjpX9jL19RsvQ1ss5SOnB1SVAn7vsRnleeVNS0FiwHjXar8ioduSGB86dpltbwN7gBd7yWIT9s5HdqGxGiauBsgftSYDYd2sS1Alc5FqMpO1ko7TtUQ8nFyCrkNTWgl85sOry/AMlSEr4aVZgQd9Pmy/Jc6TBGSQzZg1xvF5mftqsezm4nJ620xZoFTZcWhvt6NQQFn7Mot2TnSkkSSBU3VQokxnUrreWhg3LzfHRJbFx4QwrRLV4kW8aRkGlZqjkumdiCLDJo6kAFYSjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(2906002)(86362001)(31696002)(36756003)(6486002)(6506007)(53546011)(6512007)(26005)(186003)(478600001)(5660300002)(6666004)(66574015)(38100700002)(4326008)(66476007)(66946007)(6916009)(66556008)(2616005)(41300700001)(316002)(8676002)(31686004)(8936002)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZaUmo4dWk1MW4wZUppbWZsMXh2emtObzNCRlREd2s4NndGSW5XRTdUd2cr?=
 =?utf-8?B?MU5CeWZFQ0F6byt2VlQ3eXpVbkhHekhhZmxyMDAvUHlSRjVFZ1JqeitKSFlW?=
 =?utf-8?B?ZGJqcVJHdWt3VFdEZEQvUEFBUlJ6eFFsMWl4MDcvRmNueS9YWXJFSTRTMmt1?=
 =?utf-8?B?S3E2SnY3cEJaaGFCdmdQTHR1QThjVlZKK3VJTk9iRWRqeStEZEV6UFJFUEIw?=
 =?utf-8?B?cjRuMXdINlVqdTc2aDNRQzNtTmlZU0ZsWGtZTnJkKzJLT2d5WUdZME1BS1E2?=
 =?utf-8?B?dUY5bGo3Uy9EemhvblF2Z21FNzZVTDFCbEt6RlNOZ0RuQnV0WTFuSTF5cXcr?=
 =?utf-8?B?eFdkNzJBYi9zc2FmTVlOZUltTk9qMzNZNjJpeTZmRzcydHRIbS9DTlRsYlpp?=
 =?utf-8?B?U2xlWU9mYStVVnJ1Skw2T1FGbUM0NG1DYW5KTG84TFZsVlF5c3NMQzRIK3k2?=
 =?utf-8?B?S1NlYjkwdlZNMDdUT2VyTWZYaGorMFdVV1diQXRvMkVIcEtKdUd5R25jdk4y?=
 =?utf-8?B?YVRyQnlkVUZBMjdEUkVWdmpZZ25LYm0rb09mR0pGNGlObkx3NDMrRUt2TFZS?=
 =?utf-8?B?RjZ6OFR1LzNiamJHdFVWWWkzempVa3pWK2hxYkFWRXVwRHFUTFlhaXNVMElJ?=
 =?utf-8?B?QWpqOE1IWG00NmlQYkE3MHlyTEFqN3BOZlZyT3VWano3TVNjY2orbDB4Uk4x?=
 =?utf-8?B?WlBXSlNUd1RkUlhOUVc1RkN1RW5Oc3N0TVNEY3VFaDlkNlFVdjlyOHo0ZWMy?=
 =?utf-8?B?N2RJVWpJUVpTNU8veGFlN0x3bWQyRzNNYWdId3ZzSXVZT3ZvVzNxTGVWM0Ji?=
 =?utf-8?B?dFRwM0NnZ040biswWlUxbVp3clQ3MkpyRk52emhWZ0VubUVIZmc3ZVpXVEdD?=
 =?utf-8?B?Z3pHZXVzQUYwUlVQUEVKeUZYWTNsNFMxNWhXWWVaRGNBY2ZhdUc3Q0Rpb1E5?=
 =?utf-8?B?Wi95bmx5MTJqUzROZkc4bkI5ZXhOL0pLLzMvMnExRmJvRXRQSUtrTzVrNjI0?=
 =?utf-8?B?QnNuYUxYYUlwMTFPbUMyZTlURTI5Z1pUdjRXZ3luZVlzc056VjQwdEZPMEZr?=
 =?utf-8?B?ZTRMaGRQcGRIcVl2YmVWOTF2UUh2dzVlOThRS1dnYUdIYmdheE5UakZHdGxo?=
 =?utf-8?B?bFpaTEFTTGF0ekZjNVdLQTB0NEpkUHVyNitSbHQ1eE5LM2dwdHllK2VKRGJV?=
 =?utf-8?B?MUl5dFpNT2RheGlhZjlEN2FFaFRqOXQ2UUlrRXoybzcyRWtDYStldkpWZExR?=
 =?utf-8?B?cEQvQ2E5aWFCNmxhWnhiOXZBN2JFb1VsL3RkNU5hVWJQZC9JZFlja2F4QkM1?=
 =?utf-8?B?Z1dNRU8zdVV1eG5PdEZ3NDN6VVpCTGE2dGVzMGlrRVlOSmxJU1V4dS9HTkgy?=
 =?utf-8?B?dGVsR3BVWHVqQWxiNTA2NTA3WEc3WGVsWkE1YXZjR0NvWWpEUjlnWVBKM0xB?=
 =?utf-8?B?SHhiYlhVRmwwWWF3YmhWV0pBMUd1TTBWS2ZLMU83eEZVdmpMUFpiWStOVVFJ?=
 =?utf-8?B?R3RNbWh2NlRlbldnaDJZaUt2MnJmWDJLRTZsUXRqMVhhdmdkdDVHWjJNaXEw?=
 =?utf-8?B?NlNHMFo1bE5SZmlBUkM3eVZrYVZzc2k0N1hvZENOQVJGd2EzSGNoYzRId2E3?=
 =?utf-8?B?Rm14UmVveVhBSE16cEVBQUFtQVgrODU0RG5WV01tN3VXZWlmdGMzS1JWYThN?=
 =?utf-8?B?QmY2M0ljN0YwdnBQSzVuRVpSWG56NXAza0NvUzIxcmsxVHd6dTVnVytnaExS?=
 =?utf-8?B?dndiYzlIMXdNc051dmZmWTQxaXpYY2xsUGt5ZnFaTmw0WFdCbGwzSmpoNGVV?=
 =?utf-8?B?TW5iVlFzSk1haWQwK2Jyd2lqWHU2azVLblZRbmdQeEdQV3BJMlJRMEFTci9S?=
 =?utf-8?B?UzVaSlVucmE5ZDdzc0plNTBYYmc3SHhYUHh3WForZk4vMGNWUXhrYVJaZ3ZE?=
 =?utf-8?B?eDMvOCt6V3R6TXNzdlRnWElmMm0vTDZqUFkrd0c2V21LeDdYOG9tTldkbUxP?=
 =?utf-8?B?YUhkSkVqSWpVOFU1SWk0MWswbElMSWNBRVFkdEFzUSt2b0Z3b3M0VE1GUHVU?=
 =?utf-8?B?ekNSOXZVbnArdFJiK25BRWFhZG4xYmRlcFJpbUFmVjZ4bzZ4RVBsaFhOckh0?=
 =?utf-8?Q?qCGSVkLbjKCbmkYM4Ca7w2Fa0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7726a5d-220f-46db-2e29-08db51e620dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:08:24.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNnBYUKsuRCC2AbKy3DlvBH7kV/tRZuzpkw6uEYhGOUXspAvPL8rM0kbDj2b5CIcJe1lWbrE5YnazwPxUpg6Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7494

On 10.05.2023 19:30, Rafaël Kooi wrote:
> On 10/05/2023 11:48, Jan Beulich wrote:
>> On 10.05.2023 10:51, Rafaël Kooi wrote:
>>> On 10/05/2023 10:03, Jan Beulich wrote:> On 10.05.2023 02:18, Rafaël Kooi wrote:
>>>>> --- a/xen/common/decompress.c
>>>>> +++ b/xen/common/decompress.c
>>>>> @@ -3,11 +3,26 @@
>>>>>    #include <xen/string.h>
>>>>>    #include <xen/decompress.h>
>>>>>    
>>>>> +typedef struct _ZSTD_state
>>>>> +{
>>>>> +    void *write_buf;
>>>>> +    unsigned int write_pos;
>>>>> +} ZSTD_state;
>>>>> +
>>>>>    static void __init cf_check error(const char *msg)
>>>>>    {
>>>>>        printk("%s\n", msg);
>>>>>    }
>>>>>    
>>>>> +static int __init cf_check ZSTD_flush(void *buf, unsigned int pos,
>>>>> +                                      void *userptr)
>>>>> +{
>>>>> +    ZSTD_state *state = (ZSTD_state*)userptr;
>>>>> +    memcpy(state->write_buf + state->write_pos, buf, pos);
>>>>> +    state->write_pos += pos;
>>>>> +    return pos;
>>>>> +}
>>>>
>>>> This doesn't really belong here, but will (I expect) go away anyway once
>>>> you drop the earlier patch.
>>>>
>>>
>>> The ZSTD_flush will have to stay, as that is how the decompressor will
>>> start streaming decompression. The difference will be that the book
>>> keeping will be "global" (to the translation unit).
>>
>> But this bookkeeping should be entirely in zstd code (i.e. presumably
>> unzstd.c).
>>
> 
> The implementation of the decompression functions seem to indicate
> otherwise. Referring to unzstd.c:`unzstd`, the function will take the
> streaming decompression path if either `fill` or `flush` have been
> supplied. I cross checked with unlzma.c and unxz.c, and that seems to
> have similar behavior in regards to flushing the output data. The
> `flush` function is passed a buffer to a chunk of decompressed data with
> `pos` being the size of the chunk. For the sake of consistency I don't
> think it's a good idea to deviate from this behavior in just unzstd.c.

Well, so far we don't use any flush functions, do we? The question
could therefore also be put differently: In how far is the flush
function you introduce zstd-specific? If it isn't be other than the
fact that it is only passed to unzstd(), perhaps it shouldn't be
named as if zstd-specific?

>>>>>        if ( len >= 4 && !memcmp(inbuf, "\x28\xb5\x2f\xfd", 4) )
>>>>> -	return unzstd(inbuf, len, NULL, NULL, outbuf, NULL, error);
>>>>> +    {
>>>>> +        // NOTE (Rafaël): On Arch Linux the kernel is compressed in a way
>>>>> +        // that requires streaming ZSTD decompression. Otherwise decompression
>>>>> +        // will fail when using a unified EFI binary. Somehow decompression
>>>>> +        // works when not using a unified EFI binary, I suspect this is the
>>>>> +        // kernel self decompressing. Or there is a code path that I am not
>>>>> +        // aware of that takes care of the use case properly.
>>>>
>>>> Along the lines of what I've said for the description, this wants to avoid
>>>> terms like "somehow" if at all possible.
>>>
>>> I've used the term "somehow" because I don't know why decompression
>>> works when Xen loads the kernel from the EFI file system. I assume the
>>> kernel still gets unpacked by Xen, right? Or does the kernel unpack
>>> itself?
>>
>> The handling of Dom0 kernel decompression ought to be entirely independent
>> of EFI vs legacy. Unless I'm wrong with that (mis-remembering), you
>> mentioning EFI is potentially misleading. And yes, at least on x86 the
>> kernel is decompressed by Xen (by peeking into the supplied bzImage). The
>> difference between a plain bzImage and a "unified EFI binary" is what you
>> will want to outline in the description (and at least mention in the
>> comment). What I'm wondering is whether there simply is an issue with size
>> determination when the kernel is taken from the .kernel section.
>>
> 
> Assuming you are talking about size determination of the compressed
> bzImage, I notice a discrepancy in the size of the ZSTD stream and the
> reported size by the vmlinuz-* header upon further investigation. When
> using the streaming decompression code I made it output how many bytes
> it reads from the extracted-but-still-compressed bzImage. The code
> reads 12,327,560 bytes, but the size of the compressed bzImage in the
> header is 12,327,564 bytes. In xen/arch/x86/bzImage.c `decompress` is
> called with `orig_image_len`, when the function `output_length`
> calculates the end address and removes 4 bytes from that address. If I
> remove the last 4 bytes from the compressed bzImage then `unzstd` will
> unpack it with `unzstd bzImage.zst -o bzImage`, otherwise it will
> complain with `zstd: /*stdin*\: unknown header`. With this new
> information I think the correct solution is to try calling `decompress`
> a second time with with `orig_image_len - 4` if it fails.

That's not very likely to be an appropriate solution. If the sizes
diverge by 4, that difference needs explaining. Once understood, it'll
hopefully become clear under what conditions (if any) to adjust the
length right away, without any need to retry.

Jan

