Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E26670F6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476008.737975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvnk-0002el-30; Thu, 12 Jan 2023 11:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476008.737975; Thu, 12 Jan 2023 11:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvnj-0002c1-Vu; Thu, 12 Jan 2023 11:31:19 +0000
Received: by outflank-mailman (input) for mailman id 476008;
 Thu, 12 Jan 2023 11:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFvni-0002bv-Ag
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:31:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a09b9092-926c-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 12:31:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6879.eurprd04.prod.outlook.com (2603:10a6:803:132::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 11:31:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 11:31:15 +0000
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
X-Inumbo-ID: a09b9092-926c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZjvuQn+kyTQ9VHkz1bASGQ98kxRESvVFRsyTm5IdVYW1Ns/IHF6HJ0huUB7RmJXfcSktVW0eoVxpYt4qOWwp9gSAySjpyWdz6eqih+DEfFnCjT2rDpJ++WddyOuCeGjzzkvFJHBGrAM2vDUN/VhVcLg8lKAsEzD07BcOWw/y0rq1A8nTq2/URWy+PuP+LmicAiKYXEeZsxDqQwR0O7I2oeqfnL92JChgb+VLhnsJQ34KC6R5PASQ1t9Q0SQLatBYVcMAoRzGPwR0NWM2Izhczr2RFJe8luxYGkBG+Yqj2D9fSNpyWb5CDXer9iUTb1qFp3eIW+ipMWxp0Gji7SGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzJ8GnLtgQgzREvZeQzHoLZ4aqo9Q7Nx3aQJCiyMG5o=;
 b=Vd0Pk4gpqU4IQcjsv3JGdfKZBt+mvG06AE2xSN6xBwxI7VomPzynAzOWu/8P7plTcdTvcfMtr0UIFYj8sswKIoFs+piWwCLJ00HVEJTVA9jc64obySV53WgU/9djvRvIc+QES+Dt6tHJrjBc4L99GHBQ66mN1EEQPkE+L9dD8LTzrYs9L36Sw6sGjQKA8odKV+70RAcu4ipqZ+9BPn3gxOgLRC2RPSzL/vXB1t5yOLTFOoorz/uBoeoXEaySwVFxYmNCtCWw6fG8Pd6nQgq/6iWLKUvT57WMkyDRIjE1hO7rPLUJMi0MSJSsRcEIpVmv2PlL5wwObiJVGhaaI7oF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzJ8GnLtgQgzREvZeQzHoLZ4aqo9Q7Nx3aQJCiyMG5o=;
 b=WNmnQF9FZhx5ImVZR1r9DzZrxH2K7mgl9dK0O5ENooteDitRGOR4OBSJXukD6+cabDzK3uK/J9wP1tc/Dm+DeghHGj35hQdbW6GNzHYvPlDXdHcB/DQPVDIk8IYDRHeSwaFWAYwXILRMI+Xq37uTP5gQE+kfMHZrGQpIBF2yTwl+7GcpRrM7ypfxJdgWKGkvoD0+bdhm1cx4t4BoJbqi2JNDtDTbBkbpttB3sxHWmODVBd4FQua61L8p/Hq+Am198AAGkwwPxwWC7fNEt1wvcn1k+cq1boKjS98PmYZk+gGR00zk2pVK3GM60cS4H3ew7EIKriTs0aIDLbeK5oMgjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
Date: Thu, 12 Jan 2023 12:31:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fb5c42-3cb9-4f64-f9d9-08daf490839e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7WxWf3LLiyl6ZYtiVA/ZtiqVYz/mViB9MHBKfvVRIOdfLycXVFKEow7IF4y+vznppajpXQP5XxR1nKWJg9TgIg+dwKty6dFEPhG5bIUEmPJ7gKH1C64uPZEj86AwOfmoHwLETo5bKrRq3nvyFFt6Hvewz+H6Dd9WwFvkdA/q+if5L3FdTKlUtV234mEz5esbNroV6hGjst+uX5Llh3yli9Wp67gcZmb52syF4N8GcFfOz0wOFqEXtlCCqvwEbkGuamzC30dvwK95X+IVzFADp7eYhpiBg1RL+tf97YnOWv8Ik2rFspaxDIyxAyXwzerHrwkg9jPcdkTQ2GP3F+XREMWvl9zgAjdtnT5aayERiZfBPqzyHZIW3QdG/Pw0+s7VKndKzswNzjFv8wzCKgM17GGmnEibrsZuOtjZO14A84izQ7WXXY9qsLheP2GMrM++vrrcDxxcdHl1IkPSuIhsn7nKCyvuxFObGoJnInYGpqOHJ7pjBY967fA09daAuGBhAlbjePjQo59kPO4A+PPoqfAsmvlXTTnN+hpVcGzT4vuHtbF7WYZ8O7nhkgb5OloovC2S+6nVIssvdDDoqz4+VIbfTKcOK/sJc6vwR8bvQefRw9IlyQodVQwvIRgx/RMpHswNAQdUNrWPsKyIlkgEVV98+lDO+1Y1Wjqua0Z68J1GfxIZ17kQP7bjYJFAtm9JL5tHQPJ9Q9duSooWgzkIqL8pg6t+bZZ+w81F4ZHnhJM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(53546011)(6486002)(478600001)(6506007)(6666004)(186003)(6512007)(26005)(66476007)(316002)(31686004)(6916009)(4326008)(66946007)(54906003)(8676002)(2616005)(66556008)(38100700002)(41300700001)(5660300002)(8936002)(31696002)(86362001)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzk1NkZwV3paclJUM3dXYUJIU2FnNmRxT0VvdjRkNks2VXVFNUFKeFJ4eEdU?=
 =?utf-8?B?RG5TRWEwdXhnNUpoYTdGQmxRNVU2dHBlU0Z1QkV4bk54cjhtc0ZlL2VJeHps?=
 =?utf-8?B?L0NIOHBQelJmcXBZSi9wY1lRS0NrZmU5eWlJQlJreGFEUWlWMTZxSVhWWUNl?=
 =?utf-8?B?RjNYZmRGSzBmb01yUGYwSHJkY3k5WEVmeS9rdnlITHljVTgzY29ZNnc2RkU4?=
 =?utf-8?B?c0pwUWEyR3Q3aG8weDNXYU1LVnl6akkxUHU4a1FHVzF5aWtaeWpqNW5QQ3JL?=
 =?utf-8?B?WkdYUVJjVmN5K29XUjVmdStRcW9LUVpJYWNtTGRpclZjbEhadDhlbndGUkpM?=
 =?utf-8?B?NllYK2UvZmQ3UU5PR3lySkdzamlTV3RoN2xRSHR6ZGlMNWlPZncrV0swYlU4?=
 =?utf-8?B?TzBnREhGeXg1aS9KNCtKU0d1dGlaQU9hU1hvMmpNbDNVMWhEa1lvcmhQVlBq?=
 =?utf-8?B?MTdTWnI1Mzc2N3BmbnlhM3lyOGJkbncwVmIrRFBrbDlIZlJNK2ZWWEJ0R1o1?=
 =?utf-8?B?YWtBeVdHcmZmQ3VvVkx6MHRJMGxYTGhZdWgvNHptYkVHMnV0eEh3ekhWZEZm?=
 =?utf-8?B?Wi9mWE5KUHlNZTFoZHpmZkp4ajczM09vVjUxb0xUNW1CQlgwd2E2bUVHOGRW?=
 =?utf-8?B?dnlSQ1JtUWZCd0ZwbVlWZnBUeWdDZnFuelg0TzF0R2FVUFZuQWlhaUo1cktR?=
 =?utf-8?B?VDFUUm42czMzVGxLSGNDVDZLTUk0U3JhOGJUR2UvcW5Ud3pqejMwdFZ3SytJ?=
 =?utf-8?B?NWRvKzVTcGs0TzFFN2hPYnpYSkRWWFhNSHNRSlZaU1Jlc1V3MDcyZlp3Z1JN?=
 =?utf-8?B?b3BqREtDbkQxTkVJOE9nbk5qK0lZSVR0TjVsNEgzN01NTkFqRm0wdllPTFFY?=
 =?utf-8?B?SWxqMjc1dGI3YTMycitEOFhhTExIUUpXbnUxZ1RnYlQzUjR4UnlSTlV4UTZX?=
 =?utf-8?B?WHhkQ0p4dXphNlpLU0JFWXhmTTkzOHBDQ013ODR2Sklsd1NuNjVWN204ZStK?=
 =?utf-8?B?OENvSFYwVmZJc0N0UG9iQmlXVG1ONHUzQ0pSUGY1cWNHRXNtTTlqWUNjQXdN?=
 =?utf-8?B?am1rU3daN2NJMitzbk0yZGlRKzVYcm5hbXp1WW9MSzN4K0NvWnRHdkh4NFc1?=
 =?utf-8?B?Ym5lb3g2K1FvWnc5RllsZlhteHNFU2ZETnRmZGNqWmZtNFFBbWRyTnZGOVQz?=
 =?utf-8?B?aFFFSkxUektWdGN0c1Q3REd6bkNVN3FQbEVHVlQxR1pvOGgyZ1FpR2twZTRy?=
 =?utf-8?B?aHlPaGRTY25yWWtVUGlTZ0pCQlRNK00vQVdmeEMwWU5xZGhRTFhGR1h0RDk1?=
 =?utf-8?B?ODlWSUR0bUg0cytaU1dBU1laOHRLVmhNdS9sK0FjSlZjQ0l5NDNvbGE4ZXJu?=
 =?utf-8?B?amRUUVRqL0prdUc2RUorWlREaXlhdFF0anZqbERFSTlnNVlMM0lKTHY2RWNT?=
 =?utf-8?B?VW1uMWNLS1Z4WU4vRUtIQ0pMVXIwcU9xZDB1QTRCbkxPLzNYU0VXdDk2Ulcz?=
 =?utf-8?B?OGtidnZxeDRzNUNLa203MEZWL0V2RUtGbjR4eURWeDdOV1JvcEx1dFZyRnU1?=
 =?utf-8?B?YjJXZHpVR3FHcEpvb21zUU5WZGdzUExld29mZG5URFlBdktVNnhnVW9senhx?=
 =?utf-8?B?VkRJa0xmakZYWjkrUnRzeDU3TUJjdlk0QmVLcGRQK0QrT0h0dnhHYytmeUUx?=
 =?utf-8?B?bnkrazF0VWZoT3JQWTRiMHhMeHM0bm9HbHR0QTV4UUk5ZTRVU2NSUzNhTW9Q?=
 =?utf-8?B?MFNrTWpWYmoxRDF2QkoydDh2UVpTSGVvQXk3WFR6a2IxQ0FxTkpTWE43dFFR?=
 =?utf-8?B?TlRxMnBVbnRLMDRMckVzRThwa1czWXhRSUI4akxTMWUvQnBOMnBSNkJLL29y?=
 =?utf-8?B?bkxJMmRVU0NNUnJybEgvcEdXVGlzQUhEU1JBalU4UUZxcHpaN0JIT0FicXFx?=
 =?utf-8?B?U2NQUnN4SExFUzQ0Umg2OFlqeFBZUko3d04wK1orWGVTeWxMVmhVOG83SUox?=
 =?utf-8?B?dGRwREFlT0gwVHdIQ1ljT2lFbDNKWDJOVzhEamxXVVl6cXJLdU9uWTg0TU9s?=
 =?utf-8?B?Tlk1dldNTENtS25tRzlBSWV3NEdPSGxOTWRjMTgzaXU3cUFDVlFwU2hnN3Nt?=
 =?utf-8?Q?RG3KOwTWv1NBgboFj9h0fouua?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fb5c42-3cb9-4f64-f9d9-08daf490839e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 11:31:14.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoJSsRkGJ4Zsg6wkORHO95NRfcsh3O0IROMWEkD83765hF7/elG6s5h7ZuuAkWo2BMlBjivX9bLxelUi1uZEKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6879

On 04.01.2023 09:44, Xenia Ragiadakou wrote:
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -82,11 +82,13 @@ static int __init cf_check parse_iommu_param(const char *s)
>          else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
>              iommu_quarantine = IOMMU_quarantine_scratch_page;
>  #endif
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_INTEL_IOMMU
>          else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
>              iommu_igfx = val;
>          else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
>              iommu_qinval = val;
> +#endif

You want to use no_config_param() here as well then.

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>     iommu_intremap_restricted,
>     iommu_intremap_full,
>  } iommu_intremap;
> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>  #else
>  # define iommu_intremap false
> +#endif
> +
> +#ifdef CONFIG_INTEL_IOMMU
> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
> +#else
>  # define iommu_snoop false
>  #endif

Do these declarations really need touching? In patch 2 you didn't move
amd_iommu_perdev_intremap's either.

Jan

