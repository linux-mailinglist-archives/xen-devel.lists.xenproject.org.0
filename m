Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558346CFF26
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516529.800797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pho1D-00037v-CG; Thu, 30 Mar 2023 08:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516529.800797; Thu, 30 Mar 2023 08:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pho1D-00034U-94; Thu, 30 Mar 2023 08:52:27 +0000
Received: by outflank-mailman (input) for mailman id 516529;
 Thu, 30 Mar 2023 08:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pho1B-00034A-Pb
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:52:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30da6322-ced8-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:52:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 08:52:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 08:52:23 +0000
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
X-Inumbo-ID: 30da6322-ced8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INCrI6aDkRRrcLLcNi6lolqi1ywpN+7aLG0/YB8t9LHWy/z5xPmta5hxGY9PhPKyN41dOpops037cG0uN/k7rLJ+24LkPuP+IBcrmZclHIKc2hsk4meGleOisesxbvC9mEpzxrk4OEfkpgDdlSkDDKDNkpTaLUWq2/0lrUtHzA3h88ElGudPeMxb1L4eqUo4qABgTEUMdoKH4MeY4mzd/oNnN+/um09+Gx2Sc2/gXUbUFLkMBbhx/tkVU4QFqOg0ueaJQjWWOZj5KTDUb1q5vuwJWpFrBgEpYgU8ZoWzhFImq3RjyPSHpcno9DUBBlxKmIVu9511jhUhnLObxcRKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6z+q7IDztRnIlwyeJV+peCxcITcYbGX7wU+IOeUJbA=;
 b=KzxLZ3WbuzlMAUhclzN5fvmCjNIgzs00+/yPoo6g2AGnTWe8tUc1iHwDoewGubLqk1B/HzqeV5K+NRQb6mJ0Q50arw8lQb3sIThQ/F8M+mn3pg95r5LTVhmXYPoW4isDS2JokOjDvp4jVGZpGqM2JWiKT0+5bBJs/xAH+E8ws1/LBuzTP1GGgWJfALsPpNBZkP8twJt/ZJMDSsYXECJYaC6kwnyhdwLXRTsY8ZRhxWKkPo7T/bCKNXuyp9lMLB3DC3HzhxoANkAzQszHmwxxXX8gF8EmRYxLAGEQPZ3/r3fA4V4RELB0rx5gjs3HopZXND8BL1o8POvwyYOryOmxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6z+q7IDztRnIlwyeJV+peCxcITcYbGX7wU+IOeUJbA=;
 b=4T4h6lwE19mi/v6WQXtxGqUGsfUn5uiaCCKsbDB2Mx9ySSbLXs18y2XK4S2jUH8B1XptmEuhJzVoO/CTQurkMTlGhd4vhfY0pqkxss6V+Y0O8rYawclaVGg1Y2Fv+eVV5b0FJIvdghzPrcvplh9jsDSGWpLJl6NNETYV5cylxxxs5A7r8zBN8X6ZpbiWs6SeDWUypCTM+G6BAJxZBOmtb0Kr6YRzzrn03QqglklbN306/aMNh/wdY5NJ+vlxxezyuCFzll9H0e5LrJQJw/+ABCFZ2tInu8M8RxiNQn+3851KowX5heaXW627QVlWkMY1VbV66m1mRlhl9KxXbe4GKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02c609d2-096c-79ba-823b-46490dd00c04@suse.com>
Date: Thu, 30 Mar 2023 10:52:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
 <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
 <ZCRnU03XDCpqZQ5u@Air-de-Roger>
 <8fb2f771-3354-3f52-f923-e7fe7861cfbf@suse.com>
 <ZCVERoX9+LdQ/GIL@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCVERoX9+LdQ/GIL@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 443b3249-8c7e-4759-c956-08db30fc1422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JgzWmf5Cs/snruE9uFx7SV9esEsF8GKeNoIMdl1VddC+uZ4A1Zx/XqDd8sjyGlTadxClaGxUCQU/vqfbFZaUUhiRiVg5OmjDuche3/+dHgmqkYEVgiY+/viq7fuXXev8V4lVEOooo8mttfPfAnWD+5oQxY5JI8H0IpfCXWiSeGwBnnegBJQxxSxAbnpE4aPO7tIix9fSzg1lEknyEpMgfxVoziqynSudfU9Xm9M/V8+XibnCo2OBtLxmKo6ss8isDgIG4RiTWB5+v2JvUK6WNL04JyyeEyRcKOe3vUaGw9exBC7073VBMzJ6KiQ0WTo8dIT2mINN1IQ9TikwF8y8DrsPFLPtbBJdwaSdbk3WWOBqU/h2oa6mrRf0NOkfcF7o2d6cqpc7u33tRTS+1IcYR+qQ1a3XiO/0+C+HHf73z0nmdMTE5AOPFZvIJ0Y0WbBT2xPV8a4hisDS0kFeV08QnuBpx04IFaFsQNR1JD5RL2Dl/fxYIX+jSfzR+O99fL7ocupHW0/0pe+P5eh3S7qda0DJJpswAjJmE6g+023qw54DaMIY7kIjy2kP4Oz2x5dPPywbVL5iDIFOM6XpLzkM7/7EZzOFEE+Aftbj/X87c6Hl+BHsOTbF8vGIRnKZPWUA45788bsmL293SyXrF2ucHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(66476007)(6916009)(5660300002)(4326008)(8676002)(66946007)(66556008)(38100700002)(41300700001)(8936002)(31696002)(36756003)(86362001)(2906002)(6486002)(478600001)(2616005)(31686004)(53546011)(6512007)(6506007)(26005)(316002)(54906003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW5BYVk1MWVWMmpmMUhScVJtK0RiQnh0MGUwSWYydThncmFHVEQvRENmOEoz?=
 =?utf-8?B?VzI2UVFWT29Yd3Z2SmNsandlRFgzMTNzbVpVNHJMWnRQQi9SU296V1NFd1gv?=
 =?utf-8?B?b0FJRm0xam5iQU9INXEwa0NwbkhFc2FCMGcxeFNDek91U2hiZzZXVGROeXl2?=
 =?utf-8?B?Zk95THFTQ3dkMTQwMnpPS2dsY0NEQ1FSaE81bE5Id1IzMUdBcmtKSXdWcXFY?=
 =?utf-8?B?cFAxY0YrT0JwbXJqNVV0NXpWRTE0VmJGb2lYNVh5SldXRjlPMjNEelhjQUcv?=
 =?utf-8?B?a1dvMjR4SjczUWtITHBiYjRmczNzWVk1N2tMaFpEQVBNWUJha01GeWNMOXgw?=
 =?utf-8?B?S2laaHJ4eEgyc1BJUnAzRzE3L0ZBUkxlYTl3VzBCWHZQR0IvRUtzTTFaa0sz?=
 =?utf-8?B?emJ3M2cwbE5KalZvUVNEblZxTC9POFFCV0RGWWtZQ282cjZDb3ZDeU9xZFBu?=
 =?utf-8?B?S3pEeWFvb21zcEpzSVdCeTZuM3gzbGZSWUE3SVFlMGM2Qy9EZ1Nxd3BvenVw?=
 =?utf-8?B?MVpibVVtN0drMlVYYndDd3JBM0MwNUxzYW5nb2JxUmZweGx0V2NGNDR2MTB0?=
 =?utf-8?B?ME1yTFpIbGJWWmJ2cXBGQ29PanBWTUhVZk81TnAyUDhXbWRzNlNXSXJjSmpB?=
 =?utf-8?B?RWNac3FWc0Q1VEkveHZjbU5rSml3dE5oWmlwZkUreG5LQ3ZKQ2VGdUZKRlBT?=
 =?utf-8?B?UVBpM01sU3crNDUzc3dWUVZkYVVSWkJrY3R3WnlWYkRHM0lJWWRPdnBTenlZ?=
 =?utf-8?B?OGc0cVBiZDU2bVVzbFZQQjlMQ1dLYm9HNTBnQ3pETHdPcE5VSnh2Y0NEaFMv?=
 =?utf-8?B?WHIzQ3lNNTBHYWVBOTNWVzZ2WS9XbzF0RHp5OGVaRFZQWWlsYngxaGEzUmcy?=
 =?utf-8?B?V2l5VzVub20vTG9wRnJIbm1EdmtTVzF3bDJNZ2dBMHdzL3RvekVHdUoxR2Y1?=
 =?utf-8?B?UVN0K3k0cW9ieTdEeU9qbDFpOWFYSTZmYmozVVAvMHBKMHdJZWtLRG5HZXR3?=
 =?utf-8?B?RmZuWlozVVN1KzJ0N1lCNi81ZGF2dmwydElNSXRDVnJnYUtZZ09JQk5lODlx?=
 =?utf-8?B?RmpwRHpoNzZvSFp3N2hZRTNHNDdQZkdxSVVEZnlwczB3Sm02SGR5T3JSZXR4?=
 =?utf-8?B?N05zVkNyWksxbU5Pb2NCQTZCczE0NWJ2WS9rNElVbm5WTkplZjVWcjlTS3Ax?=
 =?utf-8?B?Y201bzVvNGxBUTdvMDJZUVF6Nzdtcm5leUFqWk5rbHpmY0Ztb1NkS3ZmTXpw?=
 =?utf-8?B?NElEVHpPU2JZTUk4amMwRzZoYWRUY1R6U0pvZHpwMUdibit0a0tUR2tqRitJ?=
 =?utf-8?B?UWVzTjBXTnlRSzZGZjliYUVLTVJHWW9SeHpmcTZacnk5ME1iOFJHTkowcGtR?=
 =?utf-8?B?b1NhN1RZMGdwYktXc2oxcFNTYWcvUFNTQXM3TjUrOXNvQXRyMWluRVhDdkk1?=
 =?utf-8?B?YnZNYTVtdmgxSWlIUVlDVWUyU21OcExWcC92WHZDUUxteGJjOUdQUXo3QklX?=
 =?utf-8?B?RVQzZ2twUTFMZFYzSGdubGRSLzdybkZzSS83NVVzWEtCQzhhTElKd29UU3B6?=
 =?utf-8?B?MXd3cHIxRmc0OXJGSTUyWC92TFZzdmFVYVNQdHd5Vjh0b2xIWlpIdnhHdERC?=
 =?utf-8?B?aGwrQzY5b1NUSVk3M3pSbUtML2l1K3R1b1FjZlYvUDBFcmpDWi9ISFExNjdu?=
 =?utf-8?B?WHJsME5NMjloMVhYQS82ZUNGWHZXVm84aDVFa0RWOHV4bFhFUCtWNW41SEM1?=
 =?utf-8?B?MHNOUE9NTkVtdFNBY25XSHVubnU2L2pqR3NLQTVJMVdyZTEvdWJNNDRtTkZE?=
 =?utf-8?B?dUZOaXdMVTVZQStuTytNWm1QNTRVdVViaFBNTWRoQm1sUEV1Y0Q2cFNyeVBV?=
 =?utf-8?B?Wk44aW1BN1NJS1p5Q0E5cE1aN2NHdllsSUh0ZU4yaGc2Vi9aZTRXN2cyV3hY?=
 =?utf-8?B?WW00Uit2bFVxdHdZb1hDcUdVQ2ZkKy82SU1OcFhPbHI2eWQwTmpCejBqQU9X?=
 =?utf-8?B?aFRMT3BIU2ZwL2JyYThMb3VTWm9rUFNhM0dQYS9IOW11aW9iSUUvRDBnSStZ?=
 =?utf-8?B?VlJBR1hYYzA3Y21jbEJNY1BJalhzYTVabzJFT0ZENkk2N2RFOS9ZejlxRm8x?=
 =?utf-8?Q?VBAUuhJdJIBRvmFpzAodgneH/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443b3249-8c7e-4759-c956-08db30fc1422
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 08:52:23.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7U2lLbQlpGsAZKiQLdO8hH/hMU2AP6zO5fsqcRVC4+qOY2kWhr+sh2Miy54Ta6abTsKGcwpGrvOkDA2Eftr4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192

On 30.03.2023 10:11, Roger Pau Monné wrote:
> On Thu, Mar 30, 2023 at 08:24:20AM +0200, Jan Beulich wrote:
>> On 29.03.2023 18:29, Roger Pau Monné wrote:
>>> On Mon, Dec 05, 2022 at 04:10:28PM +0100, Jan Beulich wrote:
>>>> On 23.11.2022 16:45, Roger Pau Monne wrote:
>>>>> @@ -265,6 +266,15 @@ __efi64_mb2_start:
>>>>>          cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
>>>>>          je      .Lrun_bs
>>>>>  
>>>>> +        /*
>>>>> +         * Get command line from Multiboot2 information.
>>>>> +         * Must be last parsed tag.
>>>>
>>>> Why? And how do you guarantee this?
>>>
>>> I think the comment is misleading, must be the last checked for tag in
>>> the loop that does this in assembly, because it's not using cmove.
>>> I've adjusted to:
>>>
>>>         /* Get command line from Multiboot2 information. */
>>>         cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
>>>         jne     .Lno_cmdline
>>>         lea     MB2_tag_string(%rcx),%rdx
>>>         jmp     .Lefi_mb2_next_tag
>>> .Lno_cmdline:
>>>
>>> Maybe there's some instruction I'm missing similar to a conditional
>>> lea?
>>
>> There isn't. If you want to get away without conditional branch, then
>> you'll need to LEA to a scratch register (unconditional) and then
>> CMOVcc from that scratch register.
> 
> Likely not worth it, unless you dislike the extra conditional branch.

Entirely up to you - I'm fine either way.

Jan

