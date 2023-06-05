Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F3772200E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 09:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543517.848570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64yv-000389-S0; Mon, 05 Jun 2023 07:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543517.848570; Mon, 05 Jun 2023 07:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64yv-00035o-Op; Mon, 05 Jun 2023 07:50:25 +0000
Received: by outflank-mailman (input) for mailman id 543517;
 Mon, 05 Jun 2023 07:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q64yt-00035g-Jw
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 07:50:23 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ef3dcb0-0375-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 09:50:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8391.eurprd04.prod.outlook.com (2603:10a6:102:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 07:50:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 07:50:18 +0000
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
X-Inumbo-ID: 9ef3dcb0-0375-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw/J3hnZoqqbNfqZ1d9TiOgciEIXuhpjgxim0KUTJsfnY8XzHcEL2Q2I8SDrz7Om4Cnpn6PS4EOb3GsC68BIB5HXenj2aMbUNrwOEGLy/EVBz74CFrK+j1p7nd68+9WlJBmzaOy2azB5S8hv5QNVqYHPbdok6Q1aB51mYyoHzaW/qIFJgIi10EpccPBDMZwJOENk9lNeZxkFHwUxVnC2GggxW6323+xpbBQMN+rxkPOa7Kc7OBExRE2lFB+oxUvF8CUk4/nvQMiwQRQuXOUOfYoZCvuD5TXXO3m86NqeB0TMMNOq7kpViWP0qHwxG/XXfgt6Ma8PnwL2yS1uk02t5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AENw7PUmk6A3KzztP2LH3hDEikp79t6QK+nwyPUrax0=;
 b=Tjq/i8Az+dTcLjqHEflZihkg5KT1tFQ/Hfro1wKuY3gITP7Rsu2cGv8FYXya/QWFgSHnq+YUkly9qlWQQsYjF1CF2GFoN5XOFd7h7qSnNbXh1+Sp4SNhOKG8dBsqTq8oKjouwOLU7/DUOg9E2u7/GVln87qHxuqKe17K45wf9pwbuy43PI7RtxsA1neWPxRG20+04Cpds40NqufSlGudWdBbwTE8/YY6wvY35nJZv2x5HboVhsbeYe0WvIVQtLXwpkO2e/tkAA4VNDmt/vCEWQmpJxrV2XAJsf19ryZZP4zvjUhwrj/rLwaN+Ea033PJwEfMFl6F75m8zioRvl2SWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AENw7PUmk6A3KzztP2LH3hDEikp79t6QK+nwyPUrax0=;
 b=A0lp0GSHDIHCIcMR8p1U1L5jeN4T60hpAUmhbxzgN5FlpIahQ4U2a8OOLmTi0wS5zBpzBGdRbx+dC8f2E1grvURyamQJmXVanqLVs8FcsXfdnPFmM6YDxbe1tap8BcHOM+NnmtvjWRHk16PX2FuA+MJ7IrQaDTFYy0tF6myA3R2t24LfvTEGN9gKnZxH/DoaBG2YQSIeInFBEuzhedKgh9bLjdttCCURpoUVNDCpgaIz/1pTrzxdncuM3tCtsdoOHNPlq5W2vodU/x/o2JoVjIRfh+4XjUjfQu4a5mXd1RWSrQxyHXDeYXjOrknf2G90IDCoJVaaFKMCoTYn3KR/iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <150d8499-6aed-c81a-1204-d48a4a32b8aa@suse.com>
Date: Mon, 5 Jun 2023 09:50:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-3-andrew.cooper3@citrix.com>
 <36b016e2-b378-f97c-42da-86a330471bf0@suse.com>
 <b7f848ed-5336-b3f4-3011-da10bc335d5b@citrix.com>
 <9783e91e-9d13-6b20-d985-0beb535c7fba@suse.com>
In-Reply-To: <9783e91e-9d13-6b20-d985-0beb535c7fba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8cf10c-8dc0-4739-3f5f-08db659981cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CaIq/Aaxyt6SzIvHCbuuSxjRCFN2E8JAFV1CPqIbPU4Cn8liBAN1ppyBjVsw7jcauRAMMBOx0scogWKGnSs4tF+DZ4a9xuqSbSSVvZhZVBiZXCzXCGJWIW5DKqFSiBQIacKt153EzTV5+ZP8ubogX9MP+PMTdzSRx/jog096VV4hhn3ycwYBecQl07qsThHdqvrO79BbaX0k3D3O3UCqHhRp3klfa/d3+xZoDwU6mBF00oiBrkEwlbwdpqs5Cyt/l137VKdbjreHI/u9lHXMFBLkiYOul79d7f3NIJahSgNeicj7h4c0yKdvB+d+rEjZ/Zhw/wzB0BRpEVNTdkUUChOtwNJ8fdu4m0N6vzGmGbr/GfSKUpvhC5I/JTIPtrNjxpw6ktDh2fWF5nxsby6TxSYxuq5hXgVk9UgTBqRk2BrBgV6qDPAhzawDztaqozspfXm3RcnFCsOZhtQEPlFgwr70spU2IjNkxDFHQ97B6rd7TLlXfmRL6HD49zFQZzLwQMa5Wyg6JLbKQTRlaYKiDFXCfayZybA21zAKC5gTblkGRULDhOv60+i25m2t9vGlb4AOJN1tNv/vaTSoqnrb4QCu91iCC9bbZW6mjfuqMVZ97UWnJTyVBhZo1hFU0zu/zc8l0YsLLMYvz7obyHWsqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(54906003)(4326008)(6916009)(38100700002)(66556008)(66946007)(66476007)(6486002)(478600001)(186003)(2906002)(36756003)(2616005)(8936002)(8676002)(41300700001)(316002)(5660300002)(31696002)(86362001)(31686004)(53546011)(26005)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmMzOVo0d003K1ZjM1RNUU5CSmhvV0tKZDN5bk12c0dDazZPKzhYOXdFRVg2?=
 =?utf-8?B?ejRyZmtBcWhNTUxTWVFzblU5dkpndndoelFRRlIrSWFBSTVsREk2M243WE9P?=
 =?utf-8?B?NVFTbFlMbG45aDBzRWdJWkRqalJmQUl5V3hHTkNBbUdOcWprYnc2Nm5iVXRP?=
 =?utf-8?B?VG9PelREMGZNWFpCZ2xQdTBSUzBQYkdoSnBxSi9nUnhFSXI2YW40UVh6L0p6?=
 =?utf-8?B?RC9NRVJ2ZGFlcDY5cTlKSVBPRllZeVFKTUpnZTJDOU0vbzNQenc1SkVwRGxi?=
 =?utf-8?B?cFkzbDVIUlhKblF0OHBhQkNtOUlESURKUnNWdW1oM2x5dTBQNVl3REpyMys2?=
 =?utf-8?B?SDVBYnZxb29pQm85Nzd1amRPdm93bFJBK2FGS1AzOVQ4NSszc1g0c1BQZTkw?=
 =?utf-8?B?a3V1N2NDSkFjRE9WdkF5QmtuVUtBWGU1VmJCY2VlTHBucjhYU0dJTDJzcmFS?=
 =?utf-8?B?TXJYNUFjTjhwRm05cVpiYWVkd2Z2NnFzUTNPQVNkV0ViRytSMGgrTTVXZTYy?=
 =?utf-8?B?RVJWQzIySEsyZ1RnTWZxYTc4NGwzY05sditzMWFHZ2RvbzAyd2IveHJ3THZW?=
 =?utf-8?B?cnZYZVc2ZGJhMEFOUzIzd2FGWXhYejNoTDI0R0s5alYvUEI5T2FmMzJsY1hh?=
 =?utf-8?B?azFSNTd2QzNCeUNERTkxNzBqVVYvOXViOG5Xdndya1NQQ3dVMlY5d3B1T20z?=
 =?utf-8?B?MC8rM0dqWC9LcUplb3cwYzQ3Ly9EL1pQYlczU01VWk13ajRQTExxWmFRQUlT?=
 =?utf-8?B?bnJzSU9aaERmZHJuMzduVzlkR2dyNlVhU0gvVnpJRE9WdlBoZ1pvcHA0RWdh?=
 =?utf-8?B?ekpZd3FKUGJxS1pKVUh6THEvQ3lBQ1FTUmlWOE5FTzZNbkNiS0FYeHFEVDcv?=
 =?utf-8?B?ZWRRbU95bmZuc0lrLzZWQjhlcXdGcHNDNlI3c0dkcDI5dXYzTXBXSW1TVm5V?=
 =?utf-8?B?WGJwTFpTb3J5OEhSSGs1L2lON04xODBrNkJsWGp1MHBOM3JqODJadEFiVlNQ?=
 =?utf-8?B?QWVVbW5aOWhmRTRMbWp6S3F2NVFwUDRSa3JHUzQyRi9aSGVhT1I3MlRBclpG?=
 =?utf-8?B?czhwWUtHUS96L24yNVlzMzlrQlBXemxadGJ5M2U5SEloSkU4Slc0MHBGMXdX?=
 =?utf-8?B?SlJvSUlqejRSeHJIZ0wxYURtNzM2MkVqVDlzSi9VTEVnZ1lmVWNZMGNORTdE?=
 =?utf-8?B?UkUyN3Vkd3Bnc2U1ejBlWVJEb0tRam52aTkwNURUNDVBV25aNFBPdUpneTVj?=
 =?utf-8?B?RE5CY1hWbDJBeEVVcHJISTZUcVRiVnBkbThwYkVwSFVqMnhTK3RYcDUxOThi?=
 =?utf-8?B?akR0RGxCbWJ5Tk9zMGJBOStoMjlSMWlSTnF4dHBjUW5KQVF4dG51VFllRnNp?=
 =?utf-8?B?c1dQNk40R0NuM29KNThaMW5MaFQ1MDJxckpxWXZ2ay9uK1g2RUpVKzJSZGhR?=
 =?utf-8?B?VXBzTDFNSXU5NmF5QjZNTDk0cVBrOTNNaU1DTVRNQk9kN1V6L09Delk3dmxG?=
 =?utf-8?B?SFk4S3F5N28yeEFsdnpRMWRVKzhra1JGZWNIN01scVVISXpkYlJURjNrTTBt?=
 =?utf-8?B?WldDeVVnTU8xcjdHYkhuVWRkS0NOc3JnSTNiYm9JRUlTdHZvVE5za1YraEYx?=
 =?utf-8?B?MElMZlRPMGZ5WFpyQ3IvS2cwdzJ6eCtRZ1NwTmcvSHNVaFhGSit5REdCVS9H?=
 =?utf-8?B?eWpwSUdGUzJ6VGFid2NBSEFxbldZTmJsMjdXRk12REJmZXRmR3prVlZzcDJt?=
 =?utf-8?B?TTNWcjYyK3J1akhBcVJtMkZ4blhYNmF4Q3o2YllKMGx6K3duUEh2S2hFM2hH?=
 =?utf-8?B?Q21sNVQ5LzFBYks0ei8yRzB0M2xaZ0NGU29UajlwZFVRWUNjUzRrdGN1NHB6?=
 =?utf-8?B?WVhmTXdpTjg2MHBOMXZaY3FuNFR5YitSYjFXYXJTREQzcXZUbTl3MEJuay9F?=
 =?utf-8?B?L3ByM2xIanZQZnpYVXZ0UGhveUNmdHJBQXNBWk9RcUNYQ0JqVzczZThKc2oz?=
 =?utf-8?B?YUUyMzBFWlVNMHVWb25wSC9NUktjNFlqekU2NlpSeThkSHd5Z3ViMW45UE5w?=
 =?utf-8?B?dlRjKzFxYzh6UmpaUVYrU245V1BNd21PU1MyLzhxcklRQmRKeEYzVy9XZ3Qx?=
 =?utf-8?Q?sHqoV7+9RBkAaoq5SrdF1Xxc3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8cf10c-8dc0-4739-3f5f-08db659981cd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 07:50:18.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJJnfJoftEhsTLXxPEAWk6jlU7Z36WtCKJ57RcJG/RTakuP+bJRBcDJcNXNgIQw93112EtAsTmLLPJ4SSWNAFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8391

On 05.06.2023 09:48, Jan Beulich wrote:
> On 02.06.2023 15:57, Andrew Cooper wrote:
>> On 02/06/2023 10:56 am, Jan Beulich wrote:
>>> On 01.06.2023 16:48, Andrew Cooper wrote:
>>>> @@ -593,15 +596,85 @@ static bool __init retpoline_calculations(void)
>>>>          return false;
>>>>  
>>>>      /*
>>>> -     * RSBA may be set by a hypervisor to indicate that we may move to a
>>>> -     * processor which isn't retpoline-safe.
>>>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>>>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>>>> +     *
>>>> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
>>>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>>>> +     *   this property.  Broadwell too, when running microcode versions prior
>>>> +     *   to Jan 2018.
>>>> +     *
>>>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>>>> +     *   tagging of predictions with the mode in which they were learned.  So
>>>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>>>> +     *
>>>> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
>>>> +     *
>>>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>>>> +     * behaviour directly.  Other parts have differing enumeration with
>>>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>>>> +     * to guests, and so toolstacks can level a VM safety for migration.
>>>> +     *
>>>> +     * The following states exist:
>>>> +     *
>>>> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
>>>> +     * |---+------+-------+-------+--------------------+---------------|
>>>> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
>>>> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
>>>> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
>>>> +     * | 4 |    0 |     1 |     1 | OK                 |               |
>>>> +     * | 5 |    1 |     0 |     0 | OK                 |               |
>>>> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
>>>> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
>>>> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
>>>>       *
>>>> +     * However, we doesn't need perfect adherence to the spec.  Identify the
>>>> +     * broken cases (so we stand a chance of spotting violated assumptions),
>>>> +     * and fix up Rows 1 and 3 so Xen can use RSBA || RRSBA to identify
>>>> +     * "alternative predictors potentially in use".
>>> Considering that it's rows 2, 6, 7, and 8 which are broken, I find this
>>> comment a little misleading. To me it doesn't become clear whether them
>>> subsequently being left alone (and merely a log message issued) is
>>> intentional.
>>
>> It is intentional.
>>
>> I don't know if these combinations exist in practice anywhere or not. 
>> Intel think they oughtn't to, and it's quite possible that the printk()
>> is unreachable, but given the complexity and shifting meanings over time
>> here, I think it would be unwise to simply assume this to be true.
> 
> I agree.

Thinking of it - would we perhaps want to go a step further an taint the
system in such a case? I would then view this as kind of "Xen not
(security) supported on this hardware." Until we manage to fix (or work
around) the issue.

Jan

