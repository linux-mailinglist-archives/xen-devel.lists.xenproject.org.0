Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9A6D768B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518305.804691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyF2-0002ZW-8P; Wed, 05 Apr 2023 08:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518305.804691; Wed, 05 Apr 2023 08:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyF2-0002X2-4w; Wed, 05 Apr 2023 08:11:40 +0000
Received: by outflank-mailman (input) for mailman id 518305;
 Wed, 05 Apr 2023 08:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjyF1-0002Wv-3Y
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 08:11:39 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bf60ff4-d389-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:11:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7419.eurprd04.prod.outlook.com (2603:10a6:102:80::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:11:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 08:11:33 +0000
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
X-Inumbo-ID: 7bf60ff4-d389-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHPWpZdtDyK64D90A3BgbC8RpvNru8I8zGT/6jgkJjlP7r28ypRC/wT+o++dW+LwJGJ83C5wfNjZRo+vYHlNKSE1GJx43FMXFGRbuDVeWEDfA3qInkaXlwypiJOmUBlpa8IwOYFXjM5Kepp7AKmOQ/Qlectsa6VffTrkXKBSAk/xoBXtOicc8NPHzV7RQxNWeFtzTtaxMUdBRTlE5MWJsBNbP9y7OKdXS2OchoYfkxSJjBymSiVpwDmSN9wDIPn6nZCe2bjvVpTr+uYlCmMBowfzg3SdwkzZQLYUKmmnHYUmzBEVs15ugoNjXBEdKXtzHzqDfUCFHM2oD+u6jy7eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCv6Uw70k5QdWXzfFmwvfNojOrbNjqU6z5B2gibT+ZQ=;
 b=M0C6L9/zmLXJdbjIVGDSVepBP+THbCHR6E/jHZNWOTOIahqULkrxhUu9Iqkm0vWLGgxHPDrcaSnJL6if6su918gLwHibaOpUTl7RbSjdGOhUmlRh/NXTmeLm5HsKYHGAVVtwJ+k5YxO82gSv9kfRObeDE+WJHw6qEHJLdO25qQH02lsZeDN3cI9gOm3WpbsVkO28JKazeO3UgWwj5ck4N6af/jL0pVNWsv/tHXSDYKN3C8bOLtSbPo9lNFG5vMaojFAhVbN8g6vFmfNs665SpoI/7Uf847heZvXVZuORGQ/X5u2f1cw8Yos6+umT7praazRxp6dCvIAChl/87SmiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCv6Uw70k5QdWXzfFmwvfNojOrbNjqU6z5B2gibT+ZQ=;
 b=TnNCEWHzBygeX0PbXe7nF8o7lDoe7B7g2Er+KiHyaHWox9+NjYNrIHktYFyAL52jVhFvgG+Ys7u5kTzMCM3hw0J5cBkJ0P31lioMmsUCtAzcgIjFwLF7QVdobOCb/d4tmYkBS7V3qMKdbGfzoz1zeB5iWRGzuzZuDb7S7shinhbYbGraZ+Xaz3qWxamaubji4V15HmvQEqsHXD0h8AjvcbjAbdTLS4gfDslEPZlbUkJe55cAnClegj04QuL/l8twoitCL7cifwFNqj0y9OZuURfegE0cOosNj4QixwLSZgfmzXr0lPtlB1LIxFzJlU7j+esyJuecEDHbbRCVrPwd5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cda250b-57b4-2833-99d3-84ae8ca32059@suse.com>
Date: Wed, 5 Apr 2023 10:11:30 +0200
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
 <ac13fa57-ceb2-0aaa-dcfa-42d8d01ee6d7@suse.com>
 <ZCxI18gb8zK5X+nR@Air-de-Roger> <ZCxSooPqPwpGW6yv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCxSooPqPwpGW6yv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aaaa2fc-e1cb-454d-229e-08db35ad5e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQrqelugHpzuJ9mUtxy9n/hrtCQ0aTkQUlkXSfWjTcMm7BfT+GaCBG9oeQr7LS3FUn7YSPbEyl+wmj72xBPJmwLiNiLR9ogaCVXzBvXWDQN9UP/AyKSNRjEvvDNr27s+03AC8HhsLLvd/sr69SB2mjZwYzz1qE7nCKcLqtvo7Oh2Rlmzcauqh9M4gVXbIPWOA3HwGFg/RDc8103PzElayvggKvKKLwuD9ametafRZX0Mxv5dsSnxeroVYoAm5ZmgBEvG91NTBBpaWQiDfRHySG7jnLh/0pqkW47bBam1+jY+jqeXI1zp5kwQo1kshKc5tl9xuCl43tJEnVRgEJZKY3i3Rzsmuqd9RNJcpIyXCUsKb2GBHM0m21bYKF0/Sw1kmYkWlshUAO0Q5juDuBACC75V8+v1RuyIOn1qcRTbj3Z05cOem/p1WVWdFQkwXF/eTRvsDN4whbVay91JOpEnj+QsinYJLwGB68l1QsYNV4c0UDplRnSgv2SINgiBJHhHl8d21sRq0mXx9d3IEALQfdzfroHvt/xZlHBhh6WK1wT1DSqD6iG/b7x+7v1pdTD31CfkECxCxFcUpNbdfU/pM5uoRoNppjgiykWRK5u71PhsbPZ/ZfHWAMdubHxMLCA02J5WuI+yp+tRrzaBjZRHeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(478600001)(66899021)(316002)(54906003)(5660300002)(8936002)(36756003)(2906002)(31696002)(4326008)(6916009)(86362001)(8676002)(38100700002)(66556008)(41300700001)(6512007)(26005)(6506007)(53546011)(66946007)(83380400001)(6486002)(2616005)(31686004)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW0rNksrRFhrczFRYUhZWTVqYWlod2xjajJQK0V5M1ArMmU0YUp3c2RsUE5q?=
 =?utf-8?B?OU4ycC83alpZdk9CUi9LUDNQQUxaRloyaGEwRXJRQjhWUFhEdHpzVGQ4MUJn?=
 =?utf-8?B?WG0yMlJIQU50NjczVlgyUUgxd2NWdzRjSmQvdWNrV3VCMkJXRUkzb1lWRFNU?=
 =?utf-8?B?L3Fhb0RLQXlCOEZBc3RBdE8vK3VNVHRudVRmU1ZVLy9EMDY1bW95bHZnV3BC?=
 =?utf-8?B?SjFML3NLNmFVRVVjY2x6djNmQlFsUHY1WitDaS8ycE1oS2lJbXRMNXlaZmli?=
 =?utf-8?B?R3hra2pYVW54QU5GMi9OdkIvQUlzUGxvbzdvMnlkb2E1OThKcStaZ3V5dnkv?=
 =?utf-8?B?Z3pjQ1M3TUdIalZkc0xyZXUrT0hJNmF1V1F5S05VSjFpcjFBNm4ybnhlYUJq?=
 =?utf-8?B?N3VpZlhZcGlTbzJpWWZrdWc2MTluS0R2WDlUdHNEMWswTitxbVlDM2pYMi9y?=
 =?utf-8?B?OVI1UDhWdFNPaHBoLzc4RHROcHc3LzdCSFFBL2tONFZkVXBDSU9ucmNhUWNy?=
 =?utf-8?B?SEtrSElEYkdaQW8vTWUzdTErZm5EbERiWG1QeVV0MFBuUCtzR254UzJteU9x?=
 =?utf-8?B?THEwNXlaVkc5OGdrZFloTXRWR25Vc0h2RFQveDVIQlZHbkVkRVJhLzhybHB0?=
 =?utf-8?B?c0lHRHNMMllKWDJkR1ZMUUJuOXZwc3ZBRTlzM1VIbWVHT3k0QjhwL3c0Zlp3?=
 =?utf-8?B?K3dGdUsrRFZyTDJHdWdkZVdqaVVDVlR6NnNIMFBPWXlKRnNtZVNtY1VKVFNx?=
 =?utf-8?B?VExjYVllZHljU0pUMHd0ODBpKytTaWR2NGZoMmw5MmkydFNuNlp5eFFsM1ZI?=
 =?utf-8?B?dUZmU1NGNUNjSmRPWmlIeUdPcVY4VmRseU96RzlLZWV2SkhPNzgrVlpPaDBy?=
 =?utf-8?B?MG5ubEpGcFZvNzNSQ0pJY01LU3N0RFE0am5Ed2JPdzdqMVlmQ1k3VmhLamVK?=
 =?utf-8?B?YWxRWVJ2VnJOVy9rbjFHb2NySlBQQWJFVXpWVFRjbzhXS09OOG9CdUhTNTR5?=
 =?utf-8?B?aVlIcUVTNVVlZ3BkSlR4aDIzL2l1Rk5WV0JCVEMrSVJQK1E2RzdJQ2VYYTBt?=
 =?utf-8?B?K2dvYmxDZ0UxL3FKenFEenMwSXFlL1I3akhrL1MrUkl1OW56UER2bm1KQi9m?=
 =?utf-8?B?eGswYnY1R2ZZZy9LY2RsejFsSUIzL1BxNGgzOWUxbFpMbU5JSXdsQlNHUGVY?=
 =?utf-8?B?ekRpdC9Pd3lVbjRFZ0kvS2I3YWFJVzlwcDhwaUdZK3kyUzJsY2Z5SmxWekR3?=
 =?utf-8?B?eE9aVmlqU1FrbFdlU1d2YnEwa3BEcHBNTExvM3hKQVVjcEh3bWxjeTN6SjhG?=
 =?utf-8?B?VS9RVm5pbUhCN05KdHhzcUFLN09UQVFsWCtkcFh0aDZvdWZZQk1jNDlaVHMz?=
 =?utf-8?B?cU52TmYwdXYrTks3amJDdXlMV3BWdC9pQU5HTDFhSytMVW9ELzlkSTFHeXpD?=
 =?utf-8?B?ekJ6cERmSFU1V2R6SDF6Vk41NFc2amRjdS9na1hQVVdnQ0hJcHk0ajRZclZO?=
 =?utf-8?B?WWhlcWZlekJySWwwZkY3WWNvWVN4MmdPYjVKZUZEeDY1SGNNa1hiMWJRLy95?=
 =?utf-8?B?czFyQm5keElpN1VxY3BReStSa093Y0VtR3ZYczJPY1hjWkFSdGYyUTY1VXBk?=
 =?utf-8?B?S1ZxM1pPRnY0S2JsemxlTEdOb0hEdnFSTGltMEVKVUFVVHF0TzFUVUY2alBJ?=
 =?utf-8?B?cDdsd3pRMW9EdFhscXV3UXN3a0FuYmF1WlpKNHFhbGMwaDhIb1ZGeEszL3V0?=
 =?utf-8?B?VzdBckNYSlhmaGp4TXlqR2hsRy9SU0R4dmE4Y2hwSEZUd28rdnREQXVULzU1?=
 =?utf-8?B?UXNaNkl0bjJuZXV1NTl1ays0VWc5cUN4WGFVZXcxcVpvdWhKMlJNdlNER0Uy?=
 =?utf-8?B?UnM2aWxPOWdNS2xPbmR5bnVPYnE0WnlCTjYyOXp2a1lzNXZRTUZXc21NUUJX?=
 =?utf-8?B?YVYxa3l0RnVjZkdlbkgzVEU0ZkNKaTJOZExiOXZ2U3hScThPN2dPKzVUbDFi?=
 =?utf-8?B?aW9GUnVhWk1xM1ZJNmNkNDNlSVgzMDlqQ2t6WXBvSlA4N1cxRnBTTnF1VlQ4?=
 =?utf-8?B?VkdRb01aak1qUDBKYnVndFRaVUI0c2p1dC9JWjhHYzJ5RkJXc3hGMGgrSDZm?=
 =?utf-8?Q?D4litlYL1SyzgG0K5m7OJ+Tsk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aaaa2fc-e1cb-454d-229e-08db35ad5e4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:11:33.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJwwp4Wu2JW559/hlApxWMpu3OcVu8dpes5DDXmUbyjx8IPoFixFzmUE8KNdr2q+G80Ep2CjpCm22dC8TtNiXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7419

On 04.04.2023 18:38, Roger Pau Monné wrote:
> On Tue, Apr 04, 2023 at 05:57:11PM +0200, Roger Pau Monné wrote:
>> On Tue, Apr 04, 2023 at 04:24:16PM +0200, Jan Beulich wrote:
>>> On 04.04.2023 13:41, Roger Pau Monné wrote:
>>>> On Tue, Apr 04, 2023 at 12:31:31PM +0200, Jan Beulich wrote:
>>>>> On 04.04.2023 12:12, Roger Pau Monné wrote:
>>>>>> On Wed, Feb 15, 2023 at 03:54:11PM +0100, Jan Beulich wrote:
>>>>>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
>>>>>>> applies to guests also when run on a 64-bit hypervisor: The "extended
>>>>>>> CR3" format has to be used there as well, to fit the address in the only
>>>>>>> 32-bit wide register there. As a result it was a mistake that the check
>>>>>>> was never enabled for that case, and was then mistakenly deleted in the
>>>>>>> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
>>>>>>> CONFIG_PAGING_LEVELS==4"]).
>>>>>>>
>>>>>>> Similarly during Dom0 construction kernel awareness needs to be taken
>>>>>>> into account, and respective code was again mistakenly never enabled for
>>>>>>> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
>>>>>>> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
>>>>>>>
>>>>>>> At the same time restrict enabling of the assist for Dom0 to just the
>>>>>>> 32-bit case. Furthermore there's no need for an atomic update there.
>>>>>>>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> ---
>>>>>>> I was uncertain whether to add a check to the CR3 guest read path,
>>>>>>> raising e.g. #GP(0) when the value read wouldn't fit but also may not
>>>>>>> be converted to "extended" format (overflow is possible there in
>>>>>>> principle because of the control tools "slack" in promote_l3_table()).
>>>>>>>
>>>>>>> In that context I was puzzled to find no check on the CR3 guest write
>>>>>>> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
>>>>>>> of the low reserved ones) could observe anomalous behavior rather than
>>>>>>> plain failure.
>>>>>>>
>>>>>>> As to a Fixes: tag - it's pretty unclear which of the many original
>>>>>>> 32-on-64 changes to blame. I don't think the two cited commits should
>>>>>>> be referenced there, as they didn't break anything that wasn't already
>>>>>>> broken.
>>>>>>>
>>>>>>> --- a/xen/arch/x86/mm.c
>>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>>>>>>>      unsigned int   partial_flags = page->partial_flags;
>>>>>>>      l3_pgentry_t   l3e = l3e_empty();
>>>>>>>  
>>>>>>> +    /*
>>>>>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
>>>>>>> +     * understand the weird 'extended cr3' format for dealing with high-order
>>>>>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
>>>>>>> +     * initialised).
>>>>>>
>>>>>> Don't we then need some check in the vCPU init path to assure that the
>>>>>> cr3 is < 32bits if we allow those to initially be set?
>>>>>>
>>>>>> Or will the initialization unconditionally overwrite any previous cr3
>>>>>> value?
>>>>>
>>>>> That's not the way I understand this "cut some slack". Instead I read it
>>>>> to be meant to cover for the VM-assist bit not being set, yet. Beyond
>>>>> that it is assumed to be tool stack's responsibility to constrain
>>>>> addresses suitably. If it doesn't, it'll simply break the guest. (There
>>>>> is some guessing on my part involved here, as the original introduction
>>>>> of that code didn't further explain things.)
>>>>
>>>> If it's just the guest that's broken I would think it's fine.  As long
>>>> as such mismatch doesn't cause issues in the hypervisor internal state.
>>>>
>>>> Did you see a toolstack setting such entries before pae_extended_cr3
>>>> is set?
>>>
>>> To be honest - I didn't look. As said in the longer reply to Andrew, I
>>> think it is more logical this way (the page table root already being
>>> validated as an L3 table when vCPU 0 is inititalized, which includes
>>> setting its CR3). Hence even if right now the order was the other way
>>> around (which I doubt it is), I wouldn't want to make impossible to
>>> restore the original ordering again.
>>
>> IMO I think it would be better if we could already report error at
>> domain creation time if the toolstack is attempting to create a domain
>> that the hypervisor knows is not going to work properly, rather than
>> allowing it and the guest failing in maybe non obvious ways.
>>
>> It seems to me however that we would need to fix xc_dom_boot_image()
>> in order to setup the vCPU before creating the initial page-tables.
>> (->setup_pgtables() hook being called before ->vcpu() hook)

This might be a possibility, yes, but it's (imo severe) scope creep
in the context here. All I'm after is to restore code which was
delete in error (and which was, when it was still there, not
properly put in use in all cases it would have been needed).

>> So I don't think this is strictly worse than what we have, but it
>> would also be nice to get things sorted out so the ability of the
>> toolstack to shot its own foot is limited.
> 
> Maybe I'm confused after all day, but isn't the hypercall used by the
> toolstack to set CR3 the same one used to set the vm_assist bits?
> (XEN_DOMCTL_setvcpucontext)
> 
> At which point we just need to make sure d->vm_assist gets set before
> attempting to load the new CR3 (seems that way from the quick look
> I've given at arch_set_info_guest()).

Right, it is this way already. But that's not the point.
MMUEXT_PIN_L3_TABLE may (will?) come ahead of this.

Jan

