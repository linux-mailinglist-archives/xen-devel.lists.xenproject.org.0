Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF37CADD0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617816.960859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPjW-0006FD-DC; Mon, 16 Oct 2023 15:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617816.960859; Mon, 16 Oct 2023 15:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPjW-0006Br-AC; Mon, 16 Oct 2023 15:42:18 +0000
Received: by outflank-mailman (input) for mailman id 617816;
 Mon, 16 Oct 2023 15:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPjU-0006Bj-RU
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:42:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 943245aa-6c3a-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:42:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8721.eurprd04.prod.outlook.com (2603:10a6:20b:428::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:42:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:42:12 +0000
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
X-Inumbo-ID: 943245aa-6c3a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBLindH1IeYN7iTfSPmaolQSB4UBKxWQqx7jkK2euDiDuCAOBe9fRnD4Bo5gMoajyu/C41hdI/eSDKHR6hcp0uHd4UWxjrAIVbIvuOS2wUl57IQBwIYV51vHqwn7HFKXA9lrw9heOx/0jw0HRnG3PWYbZwmE5tFNHi/Xdm8Pkvg0b096CkF8MD8S57txaovG1/4Vx9JYiK5dfQHYOZnrw0htrppCaqWcrV3CiDVhYXkc16+4Kw4RrGLuSe3X7TyrNPwCIMmnC1VC73pUz9IbIPoErvrGixg8hA9V9tGJgFP8HA0VhTJEV/cYCjtkB23T3B7ULQu5lnpXjAfJz88Q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTDC0WfAR+lZCIZrpiMFQMM69m657zcLgvAgFRzBO70=;
 b=lnfCweaD5byGj3nuTlvRYfk0D61InrwTDBfepD5RoG1rGEmJxRxOHDw7TOCoD4ZYP1lV8G/f0LE/oAekwQ/EgmdZIJx2CgVivS10Bxd9C8BuMAfJO1CMWVZG5pzqUqdsg/SdHArQ6rcJZnpJvAHLYAsuDBaoly6ziTs1dethkEKzGMdXyWugC3vfKO2pF3F6Jbq7P2260RN/7czCFicgSatwKyHi4cG3orbEtmj+m+6UO2uvjsR95Lp/yvkKXBo4Hw7LHDvDdKXmE0DKmeEFdHFGbQ1P3PpWpSB30ZxNYFpX25Bh3+znwGTd9LN/EcRTLVqhZLYV0BqY5u++UOj77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTDC0WfAR+lZCIZrpiMFQMM69m657zcLgvAgFRzBO70=;
 b=wCK1ChBljFPsezrpoZyukhVZy/2s+NBuz2aukJObuh8OlR52gqYcP6upfSRx1WL3GjFyyoOy3Ryiu6ISHWEH/Br85JZablSIjQ46TCPEcNhnZy+3m795M+1G7V4J8Q/r1P2BUEbi02m+bKBnj+It3g926Eol5ArgxAyYgkKloac/PsaaxTF8S5V1pXhKiZq0qK2b5kakOLDjirLjWcLyfNQekOpy0+2SpP77z3ovm+imjSY9lPKiIHWNwWSatLSbMFiUC3LVEzbdAf9H5N/P1Q1LcsVL/vqH8YiHNgUmPm2Wfd3tvpTteC7YalKIp6oq2v3cxHPgv/myldLYoykYQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <262b878b-578f-451a-6e7d-18af4a826848@suse.com>
Date: Mon, 16 Oct 2023 17:42:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 5/8] x86/io_apic: address violation of
 MISRA C:2012 Rule 10.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d53e82d-ba9c-4102-d3ba-08dbce5e7751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXut3EACajU9pz6wMaiJ1FGK+a53rH7C8MH1Bjc3Fh1jMUCRks8jXc0a130hZ8zqeiMhgh7DKQHBi2o2kytJpaik6/xab6s3V43l/bNSUxwx35Qp1lkzgalkK5TpeK2B98vhROTHxoU0gjXALR6B2aosbos1of/tIGIQ2BRE6CPldKK8G+NuwJ2NmelrV1b3bK0rdh5/YI7It/n8Jd1QoGnrMEN5TXoPrX+8sI+onmxEGWWuU1YU6OKzG0JTgBO7Caaq5nSpu6rONXHpBJzjBSR7TDxT2+x38zWAFJjkexXdw8/ZW0/QJsU42hSJcD3oyizDSaUZFtUhhsGSjiEUU7BcoM2ODW4+h03Vfs8JYzyshYMAByT0K4vi8bZk/Z4OvT+QP17uo9PQrZB0gqW82HZRO4IQ4xE4ey4dNai/k0ZiFwCJ0TJRF3gvrA4L5EDqTgSm3wJQYsmO0cyjLpZbPD5EEB2XY9XurwEtrlxmnILXF4xMw8hzVu+6lWO10mtH/ZTEq+7w3p3gfL/sr4ht5kNp42qZ0ciliWmr1BYVMMUnth3uZ4XagCABLUutfuAGymGzB2TxJWNYG5PlUOmSkdp0v+K4Qumid52K1SVMBoiMsdgC0kT5vvDYDjdmd2+jVhHlsfNiUe7bJtCZzzRMuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(38100700002)(478600001)(2906002)(6512007)(6506007)(7416002)(316002)(66946007)(66476007)(66556008)(6916009)(4326008)(5660300002)(41300700001)(8936002)(8676002)(83380400001)(53546011)(26005)(2616005)(31686004)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXM1K0lOL0ZjYTN3THFoZFBQRERvRTRVTmRUYTE0aDBOZWttNzZRM3dDc2tR?=
 =?utf-8?B?eWNHZnNEbDVOc0FrSWVPcUd1enVkSzMxU1NkVFowUWV6eHBRbGVQampIa1pU?=
 =?utf-8?B?OUVZWUZwaWlyYXJVOGowVkRlRHA3UzlpdGxOK0dKQkNhRm5MSUgzU1g3cDYv?=
 =?utf-8?B?TjlYUFc3Nk5wVUVPNjZ3cjFUTk5Ec3BDTmtZelRwMTh5TXRESnM0TmQxaE92?=
 =?utf-8?B?T0puOU9Ga2JZWkRocUd1Sy9wREp1ZzY4eThTL0pHZTRPaGc5WjV4U0o5QkZ0?=
 =?utf-8?B?VHhHNkdoSEY0anZwUUxhRVBYZjhEOWNtL05FV1R0Y3VRbVptYlI3KzNPTzMw?=
 =?utf-8?B?dFNJYjliRXNZME9HTGxuZ3l6ZG12Q0JSYzNJM3c4NmxmYzF4ZkNNdFZiV0wz?=
 =?utf-8?B?UlZvYTVucGNzb3pBdnFORE0wTHpLcFBiWVVBZlU5aWh5dU1ldi9VQlE5NTlU?=
 =?utf-8?B?a21sQURFYW11b3dZWDQwc08xaVREVHdiWWN5eEdSYmF0TXlrRjZxUW1TMm1P?=
 =?utf-8?B?ektmbFdVQjFnYk9QbmxlRWxnZ2krV3BmY21qNkVsNWdCaW5MWTFpeXlDMUJM?=
 =?utf-8?B?YVUwVzRlQXZoeGZvb0p1L2J0U0J0ek1qcngxNkF4blNDYmE5NlBzWkJhK2p5?=
 =?utf-8?B?S1lWVUg1dS9vUG9yK3lBeldLTzdBR0NwQXZ4UFVHOUlEVXF1MkJwOVd3Y2pQ?=
 =?utf-8?B?YTh0WUd3LzZwd1cweGt0NjNmWDhDNjYvUUdDRDNKZmhZYUJjNHN0WkxkZGFm?=
 =?utf-8?B?djVOYjZId0pKTFJUcUhtU2FrUlhZbEwxUGhHWG1CYWVad2VuN1JCa0hyaUll?=
 =?utf-8?B?ZEQyNnUvMkRkNG5nd2FFamlzcnY0a1BhVzRjek0vdVM4N3FkTWthVmFCS1Ny?=
 =?utf-8?B?cU5GR1RjRDVlQzhiK1JraHQrM0VUdUxxSTZzK3VaQnphWnp1bnBpVjUrQlFB?=
 =?utf-8?B?a0pMS0c4UU9weVBIc3JzVVVkUGp6WHVZSlkrN24vcHFZSk83Y2J0NjNGMUNw?=
 =?utf-8?B?VHVVZ1UrVDZQSzN0UUR1Z2RNVTBaZExNWThQdjZ5OGJveVByOUFtUHlaMVRp?=
 =?utf-8?B?ZW9OVit0VlR5NEtISDJUSzhhWkp3U3BrZFEzem85TVFTTG8rNUNBZWpYZFJj?=
 =?utf-8?B?UjBWRy9iYXhRdkw4aWU0SEFUM25tQVpvZUJLaEgyY2VsL3RLR3JJUkZGcTkz?=
 =?utf-8?B?cHk1WlJNTkJIWklFbXk1TWpueUFMQTZjTWdXUFZEZ0hwRlA3b2lHTUNIYW1I?=
 =?utf-8?B?MThLR2xmZDBwRFdyTlE4am9MY29xWlAxTGNhbnQyckxxTHBjcm1oWFgwd3l4?=
 =?utf-8?B?dWx3TWJZSUlIci9qK1pmTkZNb0YyUnNRRTdpNkN6dkRSMzBPRTFBOHh1b1hm?=
 =?utf-8?B?YUk3anpsVWxrTVgxWW1EeGx6UTRKRkhsYUsxZWZKbWlhUWxJRnE5YXNhNWlk?=
 =?utf-8?B?NU1SYlZQZ3RhamhIL0c5cEpPemZoQ0JWVDBwN2EwbThDaUNjRWQwdStVWnZ6?=
 =?utf-8?B?OFFxODR6UThiRWNtNStQakZBWmI3djd5OHExbjl2eTkxYkhJQUFWdnFDWitQ?=
 =?utf-8?B?YURXLzV3WXVMbFNuTDJCcjc5RkltQ0piT3JkSUlabXVib2hEVis4T3BoMGlQ?=
 =?utf-8?B?d2R1OHRkcE01OVZxWHNqSlVvOUpCcGozNzFzdEVCWkpWdllHR3JzVWlPR0pD?=
 =?utf-8?B?SGJLWGVMamN0aHFTenFTWm85WnJ1K2Z6bkRBS1RRQXpNT1lub1I0Mk9JTGhR?=
 =?utf-8?B?NFRObVIxTU53ZmM2V0REZnMzUzZRdi9qeDYxKzcxMXQ3R0kwNUJmY3hiK2dv?=
 =?utf-8?B?L0tVeWRjTTdpb3NtZEJtbDd5eDFuODNscTVhMElXalpsWjdxVkdLaWtLVVI1?=
 =?utf-8?B?Z2JTQWVYSEt6S0JQRHlaOTlVR1NMQzJxcEdPWGN1a1ovMHZxa1drSFlOUlNr?=
 =?utf-8?B?TFdwblZrMjZKMDA2cUhZNi85d1E3bEdxcnZiREQ0eHI5YVNNeFJ4a3FUK1l6?=
 =?utf-8?B?SUhsaWkzekpXaGFscXRubCtFNmJMWGxuOEZKYlEyYmgzY1NVTlpvT1MwZVVP?=
 =?utf-8?B?OVhEcFQ2NTcvTm5sd1FmbzFrRUsreDZqdmlGbkhJS0RaQ0xFUkRoWmlZYmt1?=
 =?utf-8?Q?FflZpm+4lvkAEEnHtUq+iYavE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d53e82d-ba9c-4102-d3ba-08dbce5e7751
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:42:12.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/2hFrPUd4CAPiBVdb7chIlygdE+w+KprTCr96kyoCm67oMVRmg2m6DZn1zknK/8eT02RnR+8r3UsTg2xtEpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8721

On 12.10.2023 17:28, Nicola Vetrini wrote:
> The definition of IO_APIC_BASE contains a sum of an essentially enum
> value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
> instances, is unsigned, therefore the former is cast to unsigned, so that
> the operands are of the same essential type.
> 
> No functional change.
> ---
>  xen/arch/x86/include/asm/io_apic.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
> index a7e4c9e146de..a0fc50d601fe 100644
> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -14,9 +14,10 @@
>   * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
>   */
>  
> -#define IO_APIC_BASE(idx)                                               \
> -    ((volatile uint32_t *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + (idx))    \
> -                           + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
> +#define IO_APIC_BASE(idx)                                     \
> +    ((volatile uint32_t *)                                    \
> +     (__fix_to_virt((unsigned int)FIX_IO_APIC_BASE_0 + (idx)) \
> +      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))

Let's assume that down the road we want to make __fix_to_virt() an inline
function (which perhaps it really ought to be already): Won't this trade
one violation for another then? I wonder whether the better course of
action wouldn't be to switch the two enums to be "anonymous", even if that
means adjusting __set_fixmap() and __set_fixmap_x().

As an aside, since you touch the entire construct, it would be nice if the
+ was also moved to the end of the earlier line.

Jan

