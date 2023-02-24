Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAA6A16F9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 08:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500765.772249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVSIF-0008GF-7b; Fri, 24 Feb 2023 07:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500765.772249; Fri, 24 Feb 2023 07:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVSIF-0008DZ-2x; Fri, 24 Feb 2023 07:14:59 +0000
Received: by outflank-mailman (input) for mailman id 500765;
 Fri, 24 Feb 2023 07:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVSIC-0008DT-Sf
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 07:14:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0298bf4-b412-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 08:14:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9374.eurprd04.prod.outlook.com (2603:10a6:102:2b4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 07:14:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 07:14:53 +0000
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
X-Inumbo-ID: f0298bf4-b412-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyyLPK4P++HO56at5riagvcmw/roAYgjWypnyFPkIsO4a7ZzVRqXMuvafuTu8+srKKu06VJgA2fO/c0yP9X2Y6/k5RRLJKAHl2911xZP4URJlQY8TBcXlDDSY8cDhYOI9gBzpJLbb2fLobCg3yp1Pq+RDG8CBaBLtTWdiA7emrTg8Wmr52Hh2KC9HIcofxwAqZVMWs3ePXbB1j9JuAPH3ZSqKZLiLuxa/JjX6dgmZ5ZOQ2NXp9AYfuYj5iZZojwo+iW6Cp062gB2M0CKDMyNioAXd+PS0yM2KDgpuabm7Crv+NmdxbP2P/7o9/szwo3xno4BAnDsnQ2HKy366Nk4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGbfGEBunhTlr9zfh0yNRITe5jjsmtEzlDmrXf0QWtA=;
 b=Xxpgl5C12PvGp0YjclrJvmXrdWgy6gdFIEOT+58yoAhhnQhDlsV30D/bkXsMfLrnpekAm9QmW7rrUEITBOi3+6/+sQG+dAQempYrmYh8X5FCgvRtFSB9wE+D1PnCDXrAiswbTVZtiFcjYCpbDBEy7dHyLNYsu1I7hEH9uY8rK/5fr+bHsLm6JmWPAvKOFa13e/Svi3LSNJyhFSR92ZvDbdIBiUQu01vQzq+6jJzH4rcXpCdOh/klZuCukR88nECHF/B1PnAmYuftuiAgw16GkyHlTMW4m6IDwC7sZZafyqhylMj9wCAlskyGZ9buqNMg5GgRi6CW1CjVxrf30aM/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGbfGEBunhTlr9zfh0yNRITe5jjsmtEzlDmrXf0QWtA=;
 b=0gRVAPLfNASewnRmBIL6gSlVUUo6q4K04z/BJzw+ov3GWi1Ko/GAeAud81bZ0Fq7Ph1bpGPpy6CI4LHjjx22MPNv/jYr7GkD6FUpGPT1phqXS1iHjFIoNcfGDW6/Z8RUGutdqqDx4C+Q689YSKt/KMhM2Ih+x1KXDzmcSVD4muvScrvKe3tUCuhf+Z9WVrmGWV/l+zhDIHs/ThaiDnOZGm7nqxR8y8VzytoMmmGMUpfjfxeYAm51/T4gqNgA4v1pBpW9ob2Al3Rs8gCaDa3H3HurqR5+Z+gmrL0NyT2xiEISa2xDQu63aeaPNKJtc/n6hWrLurwArU9vumuCFwP6cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25dde064-0b6f-0871-d7bf-9cc99c104bfb@suse.com>
Date: Fri, 24 Feb 2023 08:14:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen: Work around Clang-IAS macro \@ expansion bug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223203659.2594851-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230223203659.2594851-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b06033-a0f5-4c21-90c8-08db1636d2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yy+oNFG8+kNjiyEQpsSfJhDUe9HVjYXNbghR5hypca6n6WXCERPTGpGWVhiWsMU5kOvYCI9m4MimxyqRcGmi2gtIgxudrujb+nIs0i+qArLR3U0hpj+3r5MMP0b69/PGuXdxa4YYsyezEkK3NIKB9Fw47g1jwJSU4lTXa9bIyLybIMP/ZRmFX4yAdVWGt4E81JA7BY5Wpd33+9yUOb8CmDsRL5CEX4/bzR0F2R6+HiDpuUTMbwHvyzpX9scj2AVtPYZPoWMwWpAmrlWnAGzi7rNUEZdR/OMCZDl2GXnAO34uTJry25Na0A0qfQfHtxOjbwuQPPibIMtw+w/fo8EFfa3dvNF1fIn2C10FOW/FojxXLu4sZq4Zfi+S6YdIpG5qkRJb7paX8hMWaPa8waL+aLnFD12ZRHWSUsF9o2+ItxW12kW59Alr6pvI364n4p0BFTQ0w/B1s3NfOUqOfOXPGiXWstsMP56tAXbruxSnRFDRaRUn76YtrtDo9Mehu6WzwK9YPXsQADDddn1ktBVuakLFwe2x+T2eqHOF/YcbcuZ/5X9G1ovDU5cvQ+Mo5LUsblzKq56ZPtoMScgosEdEACBvR7R5YvaBKnqnbiVdGdSIxRLOJYlGjYRuz4RrWj2htH0/vrDBNh5mYIP1kui0txV1WKtZ8RVUZeekcYasUHwn4wk6HZCyQITpCoTrRpc2e+s5NLkYBJmsGeKF2l2qBOf8X3HEn3TgBlWLQv0Naow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199018)(478600001)(6512007)(186003)(26005)(66556008)(41300700001)(66946007)(66476007)(6916009)(6506007)(966005)(4326008)(53546011)(8676002)(8936002)(83380400001)(5660300002)(2906002)(38100700002)(316002)(6486002)(86362001)(31696002)(54906003)(31686004)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBPODdJZXRGTk5ha2s0LzdPVng4R2xGdjZtM0ZkYjI5RDA1cm9JUncrcWsw?=
 =?utf-8?B?VzN3SERUVDhGM3hITzcxOG9ybHNSa1B1eFZ0LzNqSDIxaHB6OW1UMlZCVmRk?=
 =?utf-8?B?S2tjNGtLZ1FLVy9CWXZSMFZ1YWhDQ093eFVhVHZlR0hoTXJkeWFmU0s1OG1V?=
 =?utf-8?B?ZGtQbW00MnJhTk43YUlpVnVvMkpXdEFHdTNFV2hZWHFQZy9LdmtNOC9lSVc2?=
 =?utf-8?B?dEpKdUdCN3A4MDgyMXJYTDJuOERKS0hSdXgwRU9nTFZGZTJpZ0dGOGp5S3c0?=
 =?utf-8?B?ZEZpYVBlMXdCUTdSalJFSDZEY3dBanBHM1N4ZndydksybEZXTXBUNUxob3Rj?=
 =?utf-8?B?K3dKSUd1UTJXL091S0w4ZTRvMjZwZHVTZEFXekhpWTRyVnRtUXltWjBmSFBQ?=
 =?utf-8?B?R2pnOWVDZXk5QlJZVzRiNnUxakdJTEw0a01ORzNpWUVzNzNxSjBrVDQrMG9y?=
 =?utf-8?B?cVowMStRUzVzMEJFaVVEUmRvK3ByR1NlUXAxL2RrVGw4L1orQmZmUkhoUk9j?=
 =?utf-8?B?Y0dBdGFVNGFKSFNRSjYzZExyb3ZRTG1IYzQxMTkyVW1peGwybzkwZHlaMVdH?=
 =?utf-8?B?dVlCdXREUStqQ3NFNU95UU1rRE5oQW1XbWR2S25XUmZ4Rmt0UGdWemZlV2Va?=
 =?utf-8?B?b1VZL1VGbW9JV08vTnUyRzdkVTNPRmJ1djZhL1doYStUY1RaS0FvQ3pvUEU3?=
 =?utf-8?B?SHllRXMvell4TjkrbzFXT1FjZ3FtL1MraDcxcHN5Y0RkSTAxK1dMREk4TDhH?=
 =?utf-8?B?WGw5djk1V2dPYTdwMW1wSmtKWUgreVFNR0pDcnJ1WitVVjN6cEM4amY0bjYr?=
 =?utf-8?B?UnVtNGxFWnZrTnhwNklnVU9rbVloZGFyZ3ZKVTc4QXNoYkpBOGJUMWJ5MFNs?=
 =?utf-8?B?T0N4dWpGSEFVcWhoSG84LzJZZWI3Z2ZzT2FEVWpSQ0JoSmg4cHpvd1RFTkVP?=
 =?utf-8?B?cG1uOEp0SjIybkJUaWtZUjFPejVnVm4xNU5XLzR2ckNsSjN2OXJkbUllSndq?=
 =?utf-8?B?dFZPS3hwSnhIY1hBMi9RNHppYVZycEdJVnRnd29VNU5MNzJYNWQ1YjJCT1hE?=
 =?utf-8?B?Y2hKUXJsZVY4bDFkaGVibW5NZTRkb1loNllBeStnMmlVOXNZV0MrQ3J5QlIy?=
 =?utf-8?B?aFpTSWJzb1VIZkpLMUtwbDlZWFBYNWpUUE8xZG9rekdJczRjZXBNTktuSk9t?=
 =?utf-8?B?c1M4cHh3K1FRME1mS3F5OFFoQkZlRnREYnVrazNXWGpyNFJUcno3c0NSYkJy?=
 =?utf-8?B?MVY4RFprTm16RUVoY0NValdyOFpIRGVRK29kVllmWngyaGNJRkJSNlJpWlRJ?=
 =?utf-8?B?OUM5VGhJRzY1c2NmTmM0UlVmU3JZemU4ejVNcnZ4UlViNkhEL3liaWdVdkNE?=
 =?utf-8?B?dEQxY3U3dWxRV3JwSXUxYmQ4QWQ5YlNZdVhZMStaY0cybkwrWmJTVUNsSVB0?=
 =?utf-8?B?bFU0R1pWb3NUWG52WVAra1VmZFQrSXFBd3ZLVzZoeDVkeldyVnRsWGtRTU5X?=
 =?utf-8?B?a2NzMDJubEYzKzRoeEtaRFAwa2ZYaXBnbmZWcmFDNzV5Z0J4YjZydHRiWW14?=
 =?utf-8?B?YWVMeU1jZk9VRGg1bHBJckowNkVXUWwrUjI5Y0xHcmprbElhY3orTUFUQlR5?=
 =?utf-8?B?T3J6empTZndxbFhZZVcrK3NDQnh1bDB6SDFMNm5mQ2YwWU80WFM3Q0o1UFps?=
 =?utf-8?B?S1NQQS96dTMxbmtOM1hSSlhqc1Vxb0dRb05ZVnRteitnQWRPbEtkMy9Ya2Vz?=
 =?utf-8?B?OENJT1VudGplSStvTGlQZEtxU1hEN09Zc05xZGlmN1F5V20rbjRNNFlPRURK?=
 =?utf-8?B?d29mbjh3YmxrMGhISHBlNDVmNm9mWWJUeTlZc09YazlraStGRnc0YlV6Zm12?=
 =?utf-8?B?YWZYVjgrSzZ0SnRUZy9rOE8vT1BHWHc5T3lGd1N0WXlJV09wYnVFT1U5M2Vk?=
 =?utf-8?B?b1V6QWhsV1V0bmk3aXZmaE01OXZBMk55NnZhU3hPN01zSnhibTRsQkZyUnhL?=
 =?utf-8?B?MUtqM3cvZFhBRWtPaXVFaFFlblRHZFB6VFpiMU96L2x1SGpTNm53WmhRUmFq?=
 =?utf-8?B?MW0zQU9GMitVVHdzVGVET2tJaFp5RTB0R1JSRTRZcDYxUEcrTGdYWHJhR0Ev?=
 =?utf-8?Q?hfEzpstKU8bOIWC5TxqP5Lp+B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b06033-a0f5-4c21-90c8-08db1636d2f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 07:14:52.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzbhPoj0R8LiZbBXnmLJQxDNQDOAMdnMf5eG9nmNrR7KhhC6nr1dXCdsPxGsdZ2cwzbgnZ+KB10Nip36fdIFng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9374

On 23.02.2023 21:36, Andrew Cooper wrote:
> https://github.com/llvm/llvm-project/issues/60792
> 
> It turns out that Clang-IAS does not expand \@ uniquely in a translaition
> unit, and the XSA-426 change tickles this bug:
> 
>   <instantiation>:4:1: error: invalid symbol redefinition
>   .L1_fill_rsb_loop:
>   ^
>   make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1
> 
> Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mix %= in
> too, which Clang does seem to expand properly.
> 
> Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

A little hesitantly
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/include/asm/spec_ctrl.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
> @@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
>      wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
>  
>      /* (ab)use alternative_input() to specify clobbers. */
> -    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
> +    alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,

Especially with there possibly appearing more cases where we need to
add such, wrapping the extra parameter in a C macro continues to
seem better to me, for having a minimal level of documentation (I
has CLANG in the suggested name for exactly this purpose) right at
the place of use. The way you have it you force readers to go look
up the assembler macro and read through the commentary there in order
to find any explanation for the oddity.

Jan

