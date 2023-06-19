Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B67735BA9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551195.860593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHFn-0008EF-T2; Mon, 19 Jun 2023 15:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551195.860593; Mon, 19 Jun 2023 15:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHFn-0008Bc-Ps; Mon, 19 Jun 2023 15:57:19 +0000
Received: by outflank-mailman (input) for mailman id 551195;
 Mon, 19 Jun 2023 15:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBHFm-0008BW-2e
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:57:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f618c256-0eb9-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 17:57:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7000.eurprd04.prod.outlook.com (2603:10a6:20b:104::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 15:57:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 15:57:12 +0000
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
X-Inumbo-ID: f618c256-0eb9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQ8kirtkpkRffypcitRX468fdXyJR61S4IsH03H686UUG1nHndvL54+CScOGa8XsweBvyEwF1RwRYkav31TIsB/z1QDfT6vD9VyIRcUYYmx9dL7SvMpmba+YDmRN4E/O8IW3yYXo6cA9qh9U5BT7Wmxufcp6bvAqf4YF4YvVY/yyfaNO5dwJaveP+jQCu7SNounQZzlSe99anw9qBOeZy9GWbCa6bQu2128JvuObsc9v/sd0OBwhQW+oysgtHjodEdr9bW0BV+abjYv6KcUN85IVitt9niyU5DEUXL8VWtsXMZH8AAiSK5KZMTtv2kJiD2h9YtyRc9TsiEvPZGHTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9A/PKVULEm1DS5aR7DiEHFj4m/K2MiLPWgyED5JqJP0=;
 b=NQ7y2zh6dTveDqhfJlGMYI4rDQXsbcglGHG3XE0HGHh6jFyJydmiN8WOCmz6f1jRCTnT+9lAjifDDRlEiJ0waA55N+945950co01rg8mNwRKn0bL8P+drf4T8K4hF+amrWeAnALR1ZeKXJJBt7Bu47wr/oKYm5xNUqVgeVaCdVVsgYtmaJMzjzzV0FgFb2bn/a4utfU98cI9auZEz1Mc3jwEmI5ADER7XJXGACjubOy5w8t2VnIAdTemrKnQRuG1mIPyT7eZEzp2bo0qo/jilHiZua5vP+sjKYnNjzibbtNOfD1kWdwMZagEuUINUvFGAWq3LptzcDPayHJEMek+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A/PKVULEm1DS5aR7DiEHFj4m/K2MiLPWgyED5JqJP0=;
 b=lwLeWYBZem5xmkO/3u+C/VGCb1JXZ7MIcyqPsyjpDbw+QvN7zDViTN1pGCq0v6gYJVxvnmA3hAIWY9AMFXnqM5Z7qTI8njw5XXbrvtLwWWmiw2KRmns4kO6j6s/ap0BaOQ+eoT6p39aeOsW2bxk0dl9sM2Jd6oFq48XlGQTiBYwYcuprAo64rRlhhn/2y9w80e9vRIRquFLdmI/SipU17ed4P32R/ierbXzwv7nvp6aghYSwkw5sZ/NFijes/P7J7mB4I/pTgR6q8C6MfpPanVqk1VIiYXkqqpTP3AB0ruN5bCqH3QSOq2DBgXNlOlMUvl9bXEk7gLDcipaI6QcRrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0b2bd19-8b77-50f2-2759-065529b89c84@suse.com>
Date: Mon, 19 Jun 2023 17:57:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/5] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-5-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615154834.959-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: cf448f39-04af-49cb-4c84-08db70ddd87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5kepzg+1BH21QY8NBj2jtFD7BNXxncpV6vn4Yxqr8a65U/rBm3hNhVhjUZ3keT8zBvKgadyu53XzKVFibU2xqzEv6pqYn89bm5YswvL4eTw2SYqqui7EoIxTaPTwBfo8OQ4gYMJR8Q/PdG8WPzg3b3LlfNVnfBpGvmV55tDeNNxn+c/LvRLHItxG4ckj+4CILH8xnHpRJMoe/qz6aoQibwUD38Kj0/IfZrtZDmlVzUG9gesl+iFKvdplRyf64wMnp/iI3dxnduev+ZNWzOBs4nTOqt+EQNPK1NAfjSqZ9I6W+aX2GCr7Zr9elZNY99Hlus41H9yx5gHTwb306uNHDoRBfDyflV3YLPn4vugomJVUbnm+D2c6sJ/RxpFfJApIM0ssoThQ67PuV11uj+5i1f+nl/CcVvffuTDN57RXTiApWWyQwuSgVp11lLPgSemx9L0vred0Cs6xr/XDW3kmWg4tU+ERG6QzfWb0Onn9W1nLmuFPBN5EmTo4km/6xak2obE14iGpSugQTfblaBUghePKunbwWDRvIDT95OfyUbRJV7QrVsaxgPdV8XvIw+JxiQ0o9aLzNPjkxGTSoxhoUwm0wdvQw/YnYTteYjXhM1+sQeQjKQFA/2HgpqnEm7FUYXJW8dqYa2krNVHru2/LnTQqsYP8s1G0djw0pxoH1P4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(4326008)(54906003)(478600001)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(36756003)(2906002)(8676002)(41300700001)(8936002)(66946007)(66556008)(66476007)(6916009)(316002)(5660300002)(31696002)(83380400001)(38100700002)(86362001)(31686004)(2616005)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFZlb3kyVjlHRkdZMktrMDZlTHhtQkcyekVWK0ZCWGJiNEl6cXYrRjRUSE9F?=
 =?utf-8?B?NDVTMUI2c0s2VUp5UVY5UTJndVdWc1JBa25CVFA5bmIxdjBscmdOdytBZ2dr?=
 =?utf-8?B?Sk5vZHMxMlZjRFpQVFQwdUxSWCtuRGpjcXRWTVpJS3BMVlV6Mis3NklPTU0v?=
 =?utf-8?B?eW1NZFU5cE9rZ0JtL3BxTGdHWjBOeXZIYmdVc3RiTzR2dTd1VVZwMHdYeERO?=
 =?utf-8?B?V1lHdXVsRElSMWFmYXBZQnBwSDRrczh2dG5jUXNXSlFWc3JqVnU0OTRUbDFG?=
 =?utf-8?B?SUVUbG5yelVHQUk4OE5NL3pmVEg1L05nT2pkWDJUeUMyTDVQbVpIYXQ3cDBo?=
 =?utf-8?B?aWs3ZU1zbnFZQStxbExxR21ISlBEN29kNVZYd0tjSXpsYnpoLzhmbkg3WXVz?=
 =?utf-8?B?Y0YvemZKYzJmenVQdGRVYlBUcW04Z0ZvRlhDZEZvV0hsZnVKSi9VVTgzdU55?=
 =?utf-8?B?NlhUQUlGMEd3bzRRS2lQeGx4Q2RoMlhBVHBrQlZzclFYM09tYzdtS09Jd1VT?=
 =?utf-8?B?VFk1WnN2V3NydVVid3FIY01sQUNSWG00K0ZZeDF4MjZMYTZYRTVNZ3hjdytH?=
 =?utf-8?B?bjZWZkJCZkZDTnlxRE80ZkViYVBJSVl3T2VTOURDNzE0aE1nZzdHd0Q4cU5W?=
 =?utf-8?B?bDYrZkxESEU1djNOUEZiaUx2Wmo5dUIwZDdJZWY4V0lvUm4yWTJHWlZxbU0z?=
 =?utf-8?B?MnZ3UWRKMWVVRXRuMDAzS2JzbVBrNmUyUUhIdlJEcUFML1UzS0tnK0x4OGFU?=
 =?utf-8?B?YmJsTSsxcm1HYjB1Qk01eWVqQjRHK1Y3a0ZraDRyRWI2Z3VuU04zcFB2SUhI?=
 =?utf-8?B?ZXRzc1d3N2JrT3BUR3FZUi81dTNPMnE0dFlNMDAyNlZLbXg3cGVOajZuUml1?=
 =?utf-8?B?MXVYWXkxb2pYM0RySzV4L3VBLzBiU29CMEJsVytFN2c3b3YreFBic3RtM1cy?=
 =?utf-8?B?MHNVcmxCaU9qRm9vTTN1STNaT0lRSy9PYVI5WUNvV2hUUythODVGTml1K21r?=
 =?utf-8?B?aWZmaVQ1OE4yWEhtZGZoaFI3SlV1bDdCd20vbFlkRkltb082ek5KMENRTng4?=
 =?utf-8?B?TE1zM2pnZVhwL2ZBSEZ3SkJhTjZxRUw5eFNsRzRGbjR2bytnS2J3YVo4SzZI?=
 =?utf-8?B?a0Fxc2FFa0tabWV0NHJtQlc1MXg5R1NHRHF0M1pOU205cGFaWUJxaEJQTDRB?=
 =?utf-8?B?WFdWNWE5Y0syQ1Ewa3RwMDBxazlTTVZnZTY4MGRkRi9iWW1FV08rTUdQQW5J?=
 =?utf-8?B?bkYxZy9ENE8vSDQySFFmN1BMTzMrTzg5anZkUWE5WmxNaUFoVCtacngyNk9K?=
 =?utf-8?B?czNvZFZTbkExcUdCVWdHNm1FUk0za1hqb2gzV0VrV216a1FxZk5iZ0lVS2dp?=
 =?utf-8?B?Qm01M3lWWHhidnlTaWNTOVVlZUFSUnNibXp4VHhlUnVIQ3Rkd1pWZ0JRazdt?=
 =?utf-8?B?UmFtcE92Zno2eE1uNDc3VFNVc201MjdMVjJ0bloxOHZOcjFWZW9hdFB6Unpj?=
 =?utf-8?B?R0FyeHZLZ0lmcEh3dC9KTlMwNkpROUMyelNEMHVtNFVLandNb2RTQ2VXd05a?=
 =?utf-8?B?OVFsQ2VHUlNkbGxxRjBJbWpva2VvZmJlUlByL3NMT05Sa1d4K1J1eEdRbXdi?=
 =?utf-8?B?dEZHalMvYVM1aXQzMCt2VTVWWWtJbmFkWWpFa3VOdVg5SzZkZksycWdLU0tD?=
 =?utf-8?B?bi9GSStwRWJNS0dMcGY1aEgyYU5EZXE1WjRZS093NUtVS0pNeUZGSFVRMkxM?=
 =?utf-8?B?K0pCRFVYS2ZGY3N1Y1BhdGdwK2NCV3dJbjVDc01FVUdnbkp1SHpUQ2RWNWNL?=
 =?utf-8?B?bFdZa01oakduWGhER3NBMmRFaUlNbUNKUlVJVm0yZDJLNEo4NzBaWnNJdzdi?=
 =?utf-8?B?bWcyNlYxdjJrWERsNkVYUDl3Q1F1eG9iNktENklYVmdNVEJldTVZSko1V0lF?=
 =?utf-8?B?Ukh1SjlwQk93OFpkS0lWRmZzaGordU5PWnhPMjFYZ2dvOVJsVjVmWmVuQitl?=
 =?utf-8?B?bEVGd2w3blNsaU9OQ3ZrUk5rZGpOS1F6WHpiaFRXY2VlK1NVSXg5TjZBcWdQ?=
 =?utf-8?B?OUNYcE5vWEdhdmw4eW1FdHlVdzdMb0p0M1lxaFU4VmxPQVJ6dUs4Q296aFA4?=
 =?utf-8?Q?aGQxQBRidSrm+m1ZkRImAWWt2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf448f39-04af-49cb-4c84-08db70ddd87f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:57:12.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq6R9qz0TbWz4wHLIS9sbXHU8apKyhNbNHavY2gcrS7W6tFkDYWvVW2ROPK9YoW+4PgscKNSah+78QBZMbfOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7000

On 15.06.2023 17:48, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -879,5 +879,18 @@ int __init early_microcode_init(unsigned long *module_map,
>      if ( ucode_mod.mod_end || ucode_blob.size )
>          rc = early_microcode_update_cpu();
>  
> +    /*
> +     * We might have exposed MSR_ARCH_CAPS after the microcode update.

I'm struggling a little with this sentence, but not being a native speaker
it may be me, not the sentence. I would perhaps have said "MSR_ARCH_CAPS
may have appeared with the microcode update."

> +     * Reload relevant fields in boot_cpu_data if so because they are
> +     * needed in tsx_init()

Nit: Missing full stop.

I also wonder whether you wouldn't want to insert "e.g.", since iirc with
the next patch tsx_init() isn't going to be the only user anymore.

> +     */
> +    if ( boot_cpu_data.cpuid_level >= 7 )
> +        boot_cpu_data.x86_capability[FEATURESET_7d0]
> +            = cpuid_count_edx(7, 0);

I take it we assume the maximum CPUID level won't go from below 7 to 7
or higher with the ucode update?

> --- a/xen/arch/x86/tsx.c
> +++ b/xen/arch/x86/tsx.c
> @@ -39,9 +39,9 @@ void tsx_init(void)
>      static bool __read_mostly once;
>  
>      /*
> -     * This function is first called between microcode being loaded, and CPUID
> -     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
> -     * the cpu_has_* bits we care about using here.
> +     * This function is first called between microcode being loaded, and
> +     * CPUID being scanned generally. early_microcode_init() has already
> +     * prepared the feature bits needed here after the microcode update.

Is this true in all cases? early_microcode_init() may have bailed
early, so I think you need to further transform early_microcode_init()
(and as a personal request of mine preferably without goto).

Jan

