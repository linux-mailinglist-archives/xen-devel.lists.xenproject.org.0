Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D0773A8E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579929.908137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTN3F-00040y-G0; Tue, 08 Aug 2023 13:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579929.908137; Tue, 08 Aug 2023 13:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTN3F-0003y6-CN; Tue, 08 Aug 2023 13:47:09 +0000
Received: by outflank-mailman (input) for mailman id 579929;
 Tue, 08 Aug 2023 13:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTN3D-0003u6-QS
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:47:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f932adc-35f2-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:47:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9884.eurprd04.prod.outlook.com (2603:10a6:800:1d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:47:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:47:02 +0000
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
X-Inumbo-ID: 0f932adc-35f2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1m968OiRp76HrSj7ITHPRRVgVOs+H0dWMw8gUvnKVTfdtiwoA7lzdUFh4DIyTC5CZ1ArXgty2oCFR5hwluXSSDa2mvgD7yWwgUrqfVUHQfhTaImh6Y909CjLZfBov+EEbF6t2CqetQPUo4+GFVDL1L40BeRaJsI0Zkc6KQdkwEVoKLsGXLykX+2E0q2+vDOpyGM+vYRfQxzCj1BRMAaUUWA2x588Fj8or5BSXzUCDl5SehU2mywLTW273KOo7xshqVV3Fg50HdNrcQCy+G4ZirFNn75JMEj6U5rlONzVt9YEI7T95FH6HuqxcCdvM+WIhaylWIhe3WJmbH+VaNc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL8Pm/P4/zQxUN8Cll8FWmPW6DZ35OKVjXUR9OfSrZ0=;
 b=n5DhyErNsY+xiSsNyOHz8CHn1qsgLChxcfcOb7LYc/z09jmzX3OuzBXMRKhznrmeSKWm3/J095hK/eeznyV2cF43eY6+ZSH7nlsc6nEye66oRIQmFMRSH9FGYx1XtMnU1tGaWz2TWZdRO5ZBGhoJ/i8iXhtIr2Ns2Hg4RSyhH8ZVGiCMMPDX5mvPtjB0DvvumgZ+qwdw3EEjPC8ykocFoDpRCK2IT5JUtYJg0GSP6kIYHDrV7jmdijRHJW/NrzQc15VD8o2bDoYEhLLwshxODuTf55M+yEvhM8rnvuu6saGzRcLlqHoSpfZkhaUeMtUW5AeR6EENnpaCZOfthaUInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL8Pm/P4/zQxUN8Cll8FWmPW6DZ35OKVjXUR9OfSrZ0=;
 b=cUhMl7s8u4hFJS8b8ZPEJLqccqE4q4cJEHrKFwaMBbTLgu/2uxts49p4LKQCx/xgrOIL3AyXgNKe39TOpfKYoI/zCi/dT/oQns84ErcUd5vXbYGESayxZuhHvuANJ0nlWdvQGryRMh44wwwXnG6g7a+P92SG9JjRME+yt0rrk4cDDeSFyFQT8qC4XgiGVqnxT+yuY3GkAwoOQVR0sBUCm5i50vVA61fEowXtvCTvpbTgc5caC5x4gNcyFB8Dd15bXh3heMfImkRanIe1uTMuSe9Bsv4mau3x9t8oV3Fvo3IUXzMfgyCEsRDRLo2jrJb+OoM/sDmfMQNer4C2Hj50vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a35a6462-15c6-5413-12de-d089fcf1e298@suse.com>
Date: Tue, 8 Aug 2023 15:46:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 1/5] x86: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <3a9db416c6f8b2d5a549d49ff02238eb408cc905.1691492441.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a9db416c6f8b2d5a549d49ff02238eb408cc905.1691492441.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: 33633e7f-0651-4cca-2cac-08db9815f20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Sjr5r3Rp668gmoZMy6yYulMMee/4vWA3HyRr8cTTVgKXA9QXZI5PdtxNtBtjPjYbJP+RRfwI4SFuR/FBzxJBR2F1WPlZXB1zj3tsdrAPv+XJz9+KVuTCRVoKuGdoCwXv4nXGiY+exTdHvIRym0h1vj2gvLyq7CkRDrrp3oWvz1VcvPPCOfJvjJ05tEo7grgSuCxpdxM6XmbCawxNQ39NXQu7Mat6mBW/yeIoc6QxC2KBmY7Gf0GPHhiA0UPSa0Z91lJLFYvn/Am1tCAAttDDUwPSBDFC+Zhwum9bzJfrBEETP75BaLHOwkGuX9D52kwPffVjhUW8syoUiwLkS+kApUaT7UHyv6VaImu5p01IIMSZPAAk9bGTq55ZAgVTEdsO7BOiqFdtaf3YQCI3r4AgCowSCSi8QxyHZi2cE7yC1DMk9I+0s14/A22GRqIWoxiGNc63yJZuRgpL5jmyaFZsohmFINsVLm2V9Gj4Sh2bXOeZ09YnJ6NJxsZFgZNz7OZrr9aOqMasVSFiDPwfTCug99ououaZ/h44vRzcpScr/PY0Py9zc6ZH9ToMBe3nwu46hODe+yMItcIz576thO3EIm+tnRLxZtl1QSAPSWW91/eRzdlzvGTY5gXKiThVWJxNHdLNQjbrzCkY7kE91LYrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(1800799003)(186006)(451199021)(478600001)(31686004)(6512007)(86362001)(6486002)(6506007)(66476007)(26005)(6916009)(66556008)(66946007)(53546011)(4326008)(38100700002)(54906003)(6666004)(316002)(2616005)(66899021)(41300700001)(2906002)(83380400001)(36756003)(8936002)(7416002)(5660300002)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHEwOTBObjJvSkJWOTE5OUErVlhWcUlzTmR0OWxBc3o3UGp0Q3VJNmpoazlK?=
 =?utf-8?B?RUNwNXVlS3RUY3ViNzNBa0JDTmRqM3RUMStYRk92ZXp4VHNpWU9EVFZ6UjJL?=
 =?utf-8?B?d3YvZU9HQStFMVduemp2NjRVQ0RIditiQmd1c2J3NjdFM1VGUHpGTnpLRXRT?=
 =?utf-8?B?bUg5OUpCUnl1R0JNZ0ZQdUx5S1hWT2lEeTBuSEc5cSsrZ3g1K1VXZTArdkFx?=
 =?utf-8?B?V2dBWmlTMUhWTDFiRVVQdUE0VndMdDcrR1BnVzZoQ3lyZE4yTk5lK251V1kw?=
 =?utf-8?B?K1VaYzRCZnVQNnh1bmtqZXFiM3FiOEFzcEs2aUVSelIyaU12Rm9tN3RUTG5R?=
 =?utf-8?B?eVprNXpUeVV2b24wODhQU0xsdXRCS3MyNVpoTmZaai9VeDNoUFBMSS9tenhh?=
 =?utf-8?B?akE0S2MycFA4N3BEUzhydEVKdFljMzNraGdodDFXM2k2Syt4T1ZDSHRmQnV1?=
 =?utf-8?B?MzE0TkU1bFR0TSt5NzREVnhIelVZYTFrMUQ1c0svejQ5RDZ4TlpzdkRUeE0y?=
 =?utf-8?B?blBlcjBlNU5KTWlTZzloUHkzUkhnUUNCWkJ5QXJyeWZyL3laak90K3dkcHd5?=
 =?utf-8?B?UHpiSFZ2cDlZcnJPR2U2bUlYcTJPY08rWmw3eUJ2NVBxRmU5WXR2TmpacDZa?=
 =?utf-8?B?bkhQYnIxQkRLdkNFdFJTQVhKR2FXNlZ5Tlc4N0tDbmhlZU9XNno3NzJLNHZU?=
 =?utf-8?B?cndRMkhxTzBKMERObFF6eWJxYkx2NzZSRjZlMGVlN2cybnNzVGZNeDcrZ3pY?=
 =?utf-8?B?bUNXWXJoVW5qV2lkUE5WeTdCcE03ZEk3b0JpaTIrbCtSUHpPR0lRRzlJL3Fp?=
 =?utf-8?B?NnZvenBRLzNEam5CcU15MHFIbFRETFBteUthTmdCSHhXdkZjaEpDLzZ4T1lG?=
 =?utf-8?B?MGR5c2trV0l2d1NsVGVLbHdhR1B5ODZlbUNrQ1c2c1RQdi9QVmdxdCs1ZjhL?=
 =?utf-8?B?TkR0Z1Zjc3l1ZHczTnlxODNiZElOWWwrUVh3ZTVMYW9xSnpVRXA5WUwvR3d0?=
 =?utf-8?B?YkNVV2lZVE40SGUrRUdnQ0F3eEhTSkNuOFpPWE9HK3YrNXZ5dmVIRFhYOWZQ?=
 =?utf-8?B?QlY5ZVcxaDViVWZDbHRqbDJBaXFDa3VldVJtVitaMmJjaldJN08vVU9OYVFz?=
 =?utf-8?B?RWVnWkdTOEV1MWFJbXgzZXZIV2tENWtoaUpMWnVCQ2taWjJ2TE52b2x0RG5u?=
 =?utf-8?B?R016cGNQSGNvUm5udzJkNmpOVHBldlYxenVCSHN1ODJLdWQyaEdmbDNXeXY5?=
 =?utf-8?B?a0FFYVNKY01iUlpMZ3N0aC95UnBveDN3MVQvKy9EYjlmRkpvWlo5dDZGNTBv?=
 =?utf-8?B?YXcxWjh1MzNhM0JUb04rUmxXNnRxSk1rNmVEK2lYTml4SEJ5cEYwWUxqZVA0?=
 =?utf-8?B?S2pzS3gxYmtVOVUxN0x1aTYvM0NHdWVCVEEvU1FnOEoyRWdEeUhqMExzNEJF?=
 =?utf-8?B?WkFEOWNKSzFIbFc4WHJPMmRyT3BNY2hFOXdQK3FoSWV2WU1vSHluTEJpdkN5?=
 =?utf-8?B?clIyeCtDWEpDMlJrR2QzVytDMmhtYmdPNURiTEVDbGJqN3M3RFFxbHVYZ3A2?=
 =?utf-8?B?SjRyeUI2anRQbWlxUUZtOHVNUmJvU2Ewdk15VkwrbmRWZWdXTjVIUXZQd1NN?=
 =?utf-8?B?ZE00YnJxcHZuU0xYdy96ZjE0dDFKbHVvWklLUyt3SW5sRTZMOWNiU2REeEln?=
 =?utf-8?B?R3ZrOFJ6cDFXbkp1SFJ4aDVWODl4QVp4MFdHYnFZYnhPUWJSblZEbnNFQ3BB?=
 =?utf-8?B?U2NFLzJYemJwZDIzZnp6cFBCYWprUVRLTkg0aHFwMDAyWVViM1pPMGEvczh3?=
 =?utf-8?B?UXlqakdqaE9lOXpnME9KTVhUK2xZcmlJcDBCSjd4djFZR01OVGV3QmpMNFJa?=
 =?utf-8?B?TkJ5S1Q2L1ZNdDd6SVBGcmVJOStjOVBtR2J6VTA0aHFFU0RaT3pxQUNLTTZj?=
 =?utf-8?B?SGFVL1cxNmFndWpJSm4rNDdQWGpmeloyN1JoN2FpMTR6YkhYYXFYVHV0OU51?=
 =?utf-8?B?Tk5VbGRRU2prU256RzRxLzVmYzh2bFpCdUxueXNxMkhGNnNTU1l3QXpYR1J4?=
 =?utf-8?B?WFZJU2cxcHF5eHI2bEZkVit6aDY0L2FEU0RuemF2Tlh2QzhqekY5akR1elYr?=
 =?utf-8?Q?Koz9ZrhGD3DFAFpaIKzRlbtE6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33633e7f-0651-4cca-2cac-08db9815f20b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:47:02.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mt5GbH9y616r/puKuYTdaE/QwhKOVt9ymT1L5vf1KCvpztFrbhf6eLtbmmG+S2gQXBYfnNVPAiw/6tbP2w3ZLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9884

On 08.08.2023 13:08, Nicola Vetrini wrote:
> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -543,27 +543,27 @@ static void __init machine_specific_memory_setup(struct e820map *raw)
>          clip_to_limit(top_of_ram, "MTRRs do not cover all of memory.");
>  }
>  
> -/* This function relies on the passed in e820->map[] being sorted. */
> -int __init e820_add_range(
> -    struct e820map *e820, uint64_t s, uint64_t e, uint32_t type)
> +/* This function relies on the global e820->map[] being sorted. */
> +int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
>  {
>      unsigned int i;
> +    struct e820entry *ei = e820.map;
>  
> -    for ( i = 0; i < e820->nr_map; ++i )
> +    for ( i = 0; i < e820.nr_map; ++i )
>      {
> -        uint64_t rs = e820->map[i].addr;
> -        uint64_t re = rs + e820->map[i].size;
> +        uint64_t rs = ei[i].addr;
> +        uint64_t re = rs + ei[i].size;
>  
> -        if ( rs == e && e820->map[i].type == type )
> +        if ( rs == e && ei[i].type == type )
>          {
> -            e820->map[i].addr = s;
> +            ei[i].addr = s;
>              return 1;
>          }
>  
> -        if ( re == s && e820->map[i].type == type &&
> -             (i + 1 == e820->nr_map || e820->map[i + 1].addr >= e) )
> +        if ( re == s && ei[i].type == type &&
> +             (i + 1 == e820.nr_map || ei[i + 1].addr >= e) )
>          {
> -            e820->map[i].size += e - s;
> +            ei[i].size += e - s;
>              return 1;
>          }
>  
> @@ -574,20 +574,20 @@ int __init e820_add_range(
>              return 0;
>      }
>  
> -    if ( e820->nr_map >= ARRAY_SIZE(e820->map) )
> +    if ( e820.nr_map >= ARRAY_SIZE(e820.map) )
>      {
>          printk(XENLOG_WARNING "E820: overflow while adding region"
>                 " %"PRIx64"-%"PRIx64"\n", s, e);
>          return 0;
>      }
>  
> -    memmove(e820->map + i + 1, e820->map + i,
> -            (e820->nr_map - i) * sizeof(*e820->map));
> +    memmove(ei + i + 1, ei + i,
> +            (e820.nr_map - i) * sizeof(*e820.map));
>  
> -    e820->nr_map++;
> -    e820->map[i].addr = s;
> -    e820->map[i].size = e - s;
> -    e820->map[i].type = type;
> +    e820.nr_map++;
> +    ei[i].addr = s;
> +    ei[i].size = e - s;
> +    ei[i].type = type;
>  
>      return 1;
>  }

To be honest this isn't quite what I was hoping for; the many ei[i]. are
(imo) quite a bit harder to read than ei-> would have been (hence my
earlier suggestion to also update that pointer in the for() loop header).
Then again I see there is one use of ei[i + 1], which would likely look
less neat as ei[1].addr when everywhere else we have ei->. So I guess up
to you whether you adjust further; I'll ack either form.

> --- a/xen/arch/x86/guest/hypervisor.c
> +++ b/xen/arch/x86/guest/hypervisor.c
> @@ -63,7 +63,7 @@ void hypervisor_resume(void)
>  void __init hypervisor_e820_fixup(struct e820map *e820)

What about this one? The function parameter ...

>  {
>      if ( ops.e820_fixup )
> -        ops.e820_fixup(e820);
> +        ops.e820_fixup();
>  }

... isn't used anymore, and the sole call site passes &e820.

> --- a/xen/arch/x86/include/asm/e820.h
> +++ b/xen/arch/x86/include/asm/e820.h
> @@ -29,8 +29,7 @@ extern int reserve_e820_ram(struct e820map *e820, uint64_t s, uint64_t e);
>  extern int e820_change_range_type(
>      struct e820map *e820, uint64_t s, uint64_t e,
>      uint32_t orig_type, uint32_t new_type);

And what about this one? None of the other subjects in the series suggest
this is then taken care of in a separate patch (as per the earlier
discussion it indeed doesn't want dealing with right here).

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -686,7 +686,7 @@ static void __init parse_video_info(void)
>  #endif
>  }
>  
> -static void __init kexec_reserve_area(struct e820map *e820)
> +static void __init kexec_reserve_area(void)
>  {
>  #ifdef CONFIG_KEXEC
>      unsigned long kdump_start = kexec_crash_area.start;
> @@ -700,7 +700,7 @@ static void __init kexec_reserve_area(struct e820map *e820)
>  
>      is_reserved = true;
>  
> -    if ( !reserve_e820_ram(e820, kdump_start, kdump_start + kdump_size) )
> +    if ( !reserve_e820_ram(&boot_e820, kdump_start, kdump_start + kdump_size) )
>      {
>          printk("Kdump: DISABLED (failed to reserve %luMB (%lukB) at %#lx)"
>                 "\n", kdump_size >> 20, kdump_size >> 10, kdump_start);
> @@ -1308,7 +1308,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          if ( e820.map[i].type == E820_RAM )
>              nr_pages += e820.map[i].size >> PAGE_SHIFT;
>      set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
> -    kexec_reserve_area(&boot_e820);
> +    kexec_reserve_area();
>  
>      initial_images = mod;
>      nr_initial_images = mbi->mods_count;
> @@ -1495,7 +1495,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
>  
>      /* Late kexec reservation (dynamic start address). */
> -    kexec_reserve_area(&boot_e820);
> +    kexec_reserve_area();
>  
>      setup_max_pdx(raw_max_page);
>      if ( highmem_start )

Seeing all the knock-on effects for the add_range() change, I think this
separate adjustment would better have been an independent patch.

Jan

