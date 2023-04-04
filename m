Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF56D6532
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517891.803854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhaB-0003Gs-Er; Tue, 04 Apr 2023 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517891.803854; Tue, 04 Apr 2023 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhaB-0003DV-C3; Tue, 04 Apr 2023 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 517891;
 Tue, 04 Apr 2023 14:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjhaA-0003DN-85
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:24:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6345e347-d2f4-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:24:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8482.eurprd04.prod.outlook.com (2603:10a6:20b:34a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 14:24:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:24:18 +0000
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
X-Inumbo-ID: 6345e347-d2f4-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7tWl/BQS4a33kq+YilzewF/6rtfg/zxjStKj20pmYDYguIOaZ1iddPmlPKiCoBwNrpC57FxPoSmZttNxk1V4kHVK5yFZ9bDs22G6MofM7n5CoH7E+FdJmUwWDPBzIhUigDwwgspBtt63vpq4jA0OwDvLcEN54tRGp47SZYnj9TTa5jzYn9B+1j3vf2iBwEcSzvUrewMurfWf37QXNQ2ljnvT+HEtPLATDNEllPozf5QtqWlF84PfzgwLjFNt6to+8b9yBQoldsqaJqV3Mbo0zILgRr1aQQUUA50zqqgYItwgxOlEtJftJ3yjoQyHTQb5CJDZZ27i2P7FZU0ymU+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdmOg5mQoRO5Np3j2AZRvRHevCll0fy8DK/TFMocFsA=;
 b=E+SCMfCT6aC5Q0b+CVSO9gwqnWf2zSL+kNfUO6rAAn+mqt0L/N0tHbOkhcIS2Ys2x9o/bzhxNdF3Yevem2HkD/IVd5EDuUNZk43L8RneFUIIWjFNxoqtAec7vBcl4j9oWkWrXHE4ccrD+zcs8OK1s88hJbu2c0n4ySyZV3z0scqGPVI94h4WUtcUpz8Yl0FazESftpmewUnGWpT6mRZT6nETpTkApnKNqLCFE6SkHXUjCA47yVRK+VfvjXLu5svwVck6x1XB0V+0EPmOtPuYbBq3j2m41AREy8tEgUZ2Fzg0UuEkY0zrtF0o+dW4+c/Gd3gwlXwZ5g2L1Ck7I42MbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdmOg5mQoRO5Np3j2AZRvRHevCll0fy8DK/TFMocFsA=;
 b=FSlfvdF28BcFoIiJoaJRYGp010tN+40H1I6Q5RNPIGR/HEh1cSrycrF7dr9QmY+tR4NITt8W8256cE+WzVMpIkcCSOzLwaEzqN0IuZy/cI9R6vQgJD5snJWmwTrAQ2L9MkoAm3S4YDpaunEb9fcRIv4J2jcgTkT/0lN3Y4Zd5DxQVDPRNBFoXbltRSvktw75x1+LNjmyJhtwn9YOQGmABGAfIxxBdN39IYMkKAyunuppapuNmM1x6zxbmsiFGkOWAOMu/vKiLMf1XJ9ArGjIt7fgOJXQMlIOmXZ6IFuKgWV1Xox4C5+l17Zn2WkyUFnFrRO287Mxj++R5IqT5CgO6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
Date: Tue, 4 Apr 2023 16:24:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <ZCv3+cpzJ52Y679G@Air-de-Roger>
 <3752672b-f4a0-5ffb-9759-dd315ce31079@suse.com>
 <ZCwM1SfCAfh2koBD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCwM1SfCAfh2koBD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2eb8a3-7588-4689-7181-08db3518467c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3JNjU+TEotU1brJS6qg8FO4NWs1oegpL7iYGZnxaWSF3ty9pij9BgnGBCNsg63dOpF8DWjhGz1HSdGk7FIDNMFlb8i2MtSCms3rEOV8dtXWuyy7wTxGNeXrBFS2qxyxD1D+7M7DIENiHJFy8+nq3p12q6hfcOI3EqSFqHsDDeAh+k+I5x7062tlX0Z5HEQd//iodivAXVG+UMBXO7IfIAnGYWVtbmlsP97IwkAg3pY5CeAogVCpMslfAeKLWV091jMUgpnXEWdaIQB38s9IlxN0S+d55uT5kUHJQUP773RM3CX9MNrTnRrOig3GtiadaRsTdqnajBiXvRER+vOgGucWfwpaDIAtCwbWRzP6+J3wJuzs1JCxBD2XFJyVhHPszciN0iallo0Uh0fdlQRP9wJjt4ToolNZ/YiL+2ZFWkiyTnZOpY/dHbhMRAROVmtyqZNTPvux7/BSmbwZ6wi5/rI6FVMue91/8j/5fgWyRNNiB8mdx+PeNnQguifjrY1itk8I/L9r+RZkmw15j5nn+AE18yrUxAPiB04O9vi9gVogn5LN93xqIrJ/wtyAADMPD52C1Hz+awARA5DFPd+BvOn1Pk06NqtFkSByqbKJf2d4uFDzRPH4N7M5m9zgppT2/YXbxmUqfYBaYSCTtAv5dHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(86362001)(31696002)(36756003)(2906002)(66899021)(31686004)(2616005)(53546011)(6486002)(83380400001)(186003)(26005)(6506007)(6512007)(4326008)(316002)(8676002)(66556008)(66946007)(66476007)(478600001)(6916009)(41300700001)(38100700002)(5660300002)(54906003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1I5Z2NsbC9td3c3bWk5R2ZqTi9ONkFlN2dvL1NCeEwrbEM4cU5NelZ5dVVs?=
 =?utf-8?B?SDBYaGoyQThGNFVLSWlrbytseDdFeEovOEdqOSs4UzRTR0tVaU8rOFNyOStK?=
 =?utf-8?B?a2hTMGtSblgxbTlvOW5pMlFQbnVtZmYzc1JKRklDdUZSbm9nRTN1aWNTVFFh?=
 =?utf-8?B?Vldkb052cXpiMXByT0lzcXhscXRoLzZZclVIR3ZiMUNaUU8rME9mc3FoaTBs?=
 =?utf-8?B?R2ovVXBOQjIvalVxeXhYT0t1QTEzdFdEN3MyMDByMXk0SEVWWUVMWVp1THNh?=
 =?utf-8?B?WkNTTkZwMkVTSUxTMmc3aUZzYlRtQnFUaURScHVGb0xRY2l1dVVXM2s3ZGlW?=
 =?utf-8?B?c0oxQWFJTE9SQkQ1ZFU0Yzk4NTNsR1dKU1dCZGVGbG8xbnRkZWxqN0RZcTRV?=
 =?utf-8?B?SEpoUm1vclFYZHR3ZWUwNlNmcjFIL21MRDJ0anJ1RkY0Wk9iMEZheTA1S3Yv?=
 =?utf-8?B?VjY3cFJpRXJiV0wvNTRqRWRtSktha0tOQTFoWFlMTHhqWWFwUUY5MVdjNW44?=
 =?utf-8?B?QmNUc3pBdGR3TDhTbVZPL3BzeHUwR3FBSm4zNEZ0OWxqQUVKNkJoamVOY0xT?=
 =?utf-8?B?YU55cG03QndqOXRjd2xPa3lDU0owc2srQ0dTYzRweFVzbFdWQjJNazRFQVBs?=
 =?utf-8?B?Znh0RG5FVW5ZZzZCNnhmOVZRb3pOR0wwTzhzRkVGRjJvbVJUT2l1dzRJaFdI?=
 =?utf-8?B?Zmk0eHphcE5sVnVSVUdzVEFKNkRWbG1oTEs0R0NpeFh5Q3kyeXByTUZtSURS?=
 =?utf-8?B?R0p0OGZlZ1REU2hGNGNLVER6NllqZkpHVnYwUC91RER5UXNNNVQxdmdDNVVP?=
 =?utf-8?B?bW5NazZWTEFFanY4RHZydkhxZXFiZGFLaTIvcFNOYTg1aEZuSC9pczlDczlC?=
 =?utf-8?B?dyt0UnVWb3dSeW1mWFNzd2cxNjBZYmlJeEV2UG1OYnpXNFRtN0hhYnlpOGtq?=
 =?utf-8?B?TnQ4V1MvYXJSbE5NSFFQaHg4TTF0bVJwSmRUMmNGQVVJclU5Z1BUTDZUK254?=
 =?utf-8?B?dGNrY3BkeXRhNVRXK1Nxa0ROSnJZRXhwK1BNTUFISGJzY1Rkc3BnTjRjdjN3?=
 =?utf-8?B?eUNoYnVZTWdCd2UzNGdCWEh0dXNNYjZPeDhhK3Mrc0JYaXdFL2lIaWJqZDFI?=
 =?utf-8?B?RXQ0WmRsT2JqcjRnZWR3WnlpVUhUbHYyRlIxcTE4YWxhaEZuTTFubGc0ZTFn?=
 =?utf-8?B?MFBkVXdLbDF5WFp0RmdxUTMxeHZoblU2RmVrSFR3NUdqQi9vVjRHZWQzaExS?=
 =?utf-8?B?TEhXYzlnNDNra3hmWTJkMFIyRkxqUjhqWlJWNUxkVytCMTQyNVE2b0ZlS0Jq?=
 =?utf-8?B?MXpzK1JxUERNQnhnTzhYUnpFbFBtYnRQeWFtWXRsS2k2Q1pBU0JnUVJHOEtp?=
 =?utf-8?B?SmVTSnAydm9RY2ZxR3M1WGlISVpGc1Rlelg5Q3JNWXYybG1Qa2xyUUpiRjls?=
 =?utf-8?B?YjZsdTRuKzQ5K0MrQTY5aWJaVFdMZ0xnRGxmSVNzOVF6emF6NFVrcFl3QlVL?=
 =?utf-8?B?L0pYTU9YbHhIaDc1L2dpYVJndEdBaDJ4R3F4SGZnTUswRWplS1RONkdIaFMy?=
 =?utf-8?B?Q2Z1c2pmYWd3RXVPS3czNlR5eVVhWStIV01FYWRDTmZhdU9YS0d1NkJLMXE1?=
 =?utf-8?B?QngycU1CR1RsQmx4NDcxUFVCSFlQOTNPZnFqd0ZORzk2VHFEdWRFTDFzeHZr?=
 =?utf-8?B?em15ckxmSUQ0MXRkQlhvdytZK3RiT0k0aDlHeHdTdTliQXB0aWhMR3BhNG1z?=
 =?utf-8?B?a2FVNHd3V25IWTJoNVNVWmtFV0hFcnlXaDhpOXZqV2dUdzRjVjNhSlg3M1B6?=
 =?utf-8?B?VTRWNHVESjBKZ2hZTDRKQnpMMEQ1SlpqSldWcmxiTks1NC9uYkhVUVJ5UW44?=
 =?utf-8?B?NEU2UXVRMyt2RWN5UUlEd2gzZVFMajIwK1FQK1M0cmMwaEwyclpCQVZLVWNU?=
 =?utf-8?B?bjBSdWRBazF4ZzZpOU5tR1BjWmg0NDlZOVpNTyt1VHFvYTRUSm1RbjdqZnZ3?=
 =?utf-8?B?ZWpMeGhaQVhIazdnUld6S2xZZ2VWMHo2SjlwdmN5RGlIVTdYcm53MFdpY2Vi?=
 =?utf-8?B?YTBnNk1Fb0hlSXZSSSsraWt1NDRSSkxyQW42TW5HSm11cEtlbXFreW5Objl0?=
 =?utf-8?Q?BWfOoCZX5fxxher62oMid9UYZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2eb8a3-7588-4689-7181-08db3518467c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:24:18.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5bmXlbQWSLGApp+34QHSj3odF9BdTECl1fqcqBoqHbQvTjA2EiNQ1JnjXP2FwhgU6gh1x5nhiywhIhujeQpBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8482

On 04.04.2023 13:41, Roger Pau Monné wrote:
> On Tue, Apr 04, 2023 at 12:31:31PM +0200, Jan Beulich wrote:
>> On 04.04.2023 12:12, Roger Pau Monné wrote:
>>> On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
>>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
>>>> applies to guests also when run on a 64-bit hypervisor: The "extended
>>>> CR3" format has to be used there as well, to fit the address in the only
>>>> 32-bit wide register there. As a result it was a mistake that the check
>>>> was never enabled for that case, and was then mistakenly deleted in the
>>>> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
>>>> CONFIG_PAGING_LEVELS==4"]).
>>>>
>>>> Similarly during Dom0 construction kernel awareness needs to be taken
>>>> into account, and respective code was again mistakenly never enabled for
>>>> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
>>>> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
>>>>
>>>> At the same time restrict enabling of the assist for Dom0 to just the
>>>> 32-bit case. Furthermore there's no need for an atomic update there.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I was uncertain whether to add a check to the CR3 guest read path,
>>>> raising e.g. #GP(0) when the value read wouldn't fit but also may not
>>>> be converted to "extended" format (overflow is possible there in
>>>> principle because of the control tools "slack" in promote_l3_table()).
>>>>
>>>> In that context I was puzzled to find no check on the CR3 guest write
>>>> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
>>>> of the low reserved ones) could observe anomalous behavior rather than
>>>> plain failure.
>>>>
>>>> As to a Fixes: tag - it's pretty unclear which of the many original
>>>> 32-on-64 changes to blame. I don't think the two cited commits should
>>>> be referenced there, as they didn't break anything that wasn't already
>>>> broken.
>>>>
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>>>>      unsigned int   partial_flags = page->partial_flags;
>>>>      l3_pgentry_t   l3e = l3e_empty();
>>>>  
>>>> +    /*
>>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
>>>> +     * understand the weird 'extended cr3' format for dealing with high-order
>>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
>>>> +     * initialised).
>>>
>>> Don't we then need some check in the vCPU init path to assure that the
>>> cr3 is < 32bits if we allow those to initially be set?
>>>
>>> Or will the initialization unconditionally overwrite any previous cr3
>>> value?
>>
>> That's not the way I understand this "cut some slack". Instead I read it
>> to be meant to cover for the VM-assist bit not being set, yet. Beyond
>> that it is assumed to be tool stack's responsibility to constrain
>> addresses suitably. If it doesn't, it'll simply break the guest. (There
>> is some guessing on my part involved here, as the original introduction
>> of that code didn't further explain things.)
> 
> If it's just the guest that's broken I would think it's fine.  As long
> as such mismatch doesn't cause issues in the hypervisor internal state.
> 
> Did you see a toolstack setting such entries before pae_extended_cr3
> is set?

To be honest - I didn't look. As said in the longer reply to Andrew, I
think it is more logical this way (the page table root already being
validated as an L3 table when vCPU 0 is inititalized, which includes
setting its CR3). Hence even if right now the order was the other way
around (which I doubt it is), I wouldn't want to make impossible to
restore the original ordering again.

Jan

