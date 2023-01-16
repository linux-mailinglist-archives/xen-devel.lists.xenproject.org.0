Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD566C8D9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478881.742360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSaM-00031x-Od; Mon, 16 Jan 2023 16:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478881.742360; Mon, 16 Jan 2023 16:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSaM-0002zF-L5; Mon, 16 Jan 2023 16:43:50 +0000
Received: by outflank-mailman (input) for mailman id 478881;
 Mon, 16 Jan 2023 16:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHSaK-0002z9-TF
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:43:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b62b85-95bc-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 17:43:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 16:43:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:43:45 +0000
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
X-Inumbo-ID: f2b62b85-95bc-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+Y+M8plUiUG7O69FlKBvv8yqCPRTSu3BDPokQvSG4qSR5GKi03EWz0+YDV/OtL4lS/4BOqWaQMCm1Pb64M76A179IteaPGr7KSB12cYch4sfogrvhaoPXV6p3jkKUuf4IclF1sF8MPIejQJi9XT+muNyFn1RrHSmUqbd7nw0P16ynb7O0N17ET0ClGJWZZ2+CbUrSp4YXv3aFNxCiXlb3Y5zrw4rrgNYSc5qydjaW2ggDJxfaZ6+D6Kyjw7+FEsYPvXHAdRAC62fRFt8lI+IyGu9s/yxOKK3AV3inwy88lWvPKmPkn1XNXinUOwOlB7TUVotbBiNEbxQGLsFbUlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5BypSEu7nhC4vzlRDwc4z+jEE3hL2Auckna78YSUOE=;
 b=nsplM/PysY2OZXz/+3ogafLU7qqKtOrXKUj5nEaC2vXgzdbNHd6EeNCYkJjZTOjpsb6kMlItnNXTFCm1Ca6Xj9dpmlL5513mn38Pt+BJqi1iSASyA8eZkJeTc1PO6FK1Vgzr9QLdzhWxauoctRqSy/BwGC+/IDK9goQqQbsSXsc9OB8yKuvI84jlmqlJBQkW6rvk6Y/DlOgIZCGVGrEpIPWQ8CE8gNXzA9abasqQt20J8JsAU4te8HegyihJlAQlaFmfL2H/kyYhq7dovAlEc0m/ngMkua8vCWsxp1JkARbNXsh4fLSO1I2woQIKE0NcIGi6IS7I9B8y4ZXVPDLLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5BypSEu7nhC4vzlRDwc4z+jEE3hL2Auckna78YSUOE=;
 b=RH9vFzq04tu1rufrevrdfnbL7B/hEF72XJQ6ANZwpN0CCZd8CXREPdTFHK9caKtn4ULqhdFLMYMhSvn9Fgv0ZlxKX1ig/zyUwl7jc3+dcxdyFkRQtgB2VlEgeieXoreNKnaZKZJRN4SauTEvOGvTsw0cB/rdESGyprOxkPGhRpSMlTJPEdnuDXeHK8PTMw1M4kVTBCBLJMW82IixeVvYz+9f3EaIjOwkhRZ2YVeED7qbTfvRQoAH0GYZpMKtadGFm+3cU8tbCkFfUNWWq8DZNkOo49LKO8rbdAw5WCZYTPcKjfx36SusG7dX0NvYgbsFQdk5Ivk21+OMc5cZc1AIYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7586398-8625-2cc6-c44a-821001293974@suse.com>
Date: Mon, 16 Jan 2023 17:43:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/8] x86/acpi: separate AMD-Vi and VT-d specific
 functions
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230116070431.905594-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: ad720afe-4d63-4c0e-5a9e-08daf7e0d59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wp1W9UfWjEnLx4z0DnvM6kWJnjGfqhJWKnWIhFWauh2cdgSXjdxNKVJC6qGtdJpswzO8JA7kERqo4nIUL37Vn9/yb+d8/9Tu4KQW8JTj5DMt+qrpwCukSSKiq0PDVR/eNExapMKHi3JQ491Olqpafrdw1BnoK+KAUryZ74nKtLB6AazbGl8Z6QzVJt96cTYBcctp997SD4EjHt9QlBGY6hgHWLdYguD44dSEsMSQhcjuKeawYFSOuO/MMtVkfi5LLE/9Jgwd7dYTDkbjzN8tidMWwUdau5AcBF6+qEdpzNOS4AA3QhQyPrdtD7M7QJlQO5c/RuA0Na8CYBWCN/+vVWaWLZT5LK0JiUIuvY6Ll/VsfASv+bZ39ygz5R3fWT0PXp5D/E1TaCAY7damiMfR6OIcYl7JNvWI6O0+0tMxv/0q7/WvvI0kCQ8uYD4D/1kuVGXiN03btdeRZXDbTJgAKyYS4zf7/rKFdNWdMlN9Bheb5TBclE0/K5pmzV8cOMd7fXKZ9SY8nECuh01c9x9C9S0UoPmjWwbOf/rpgU5P1HIZ2np0U9K9R7qO1dvEjojzqb2R4o91fAh/qKdCvbP0qPSvnNvM2AdPLEOf6KKYFlh5eZe0e+qR87mdacwrV4WULG9mRfi3lQz5kpIDB7wfRTCCl/GFUKCGwt3RE+n0L2L9dCMSP1dQX25OpJ+ojXGB7RXykdmFtwbF28+ju43nig6zTVaWRtabKJKQDiqNaXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(8676002)(66476007)(66946007)(66556008)(6916009)(38100700002)(186003)(86362001)(26005)(6512007)(31696002)(316002)(4326008)(2616005)(6486002)(36756003)(478600001)(54906003)(5660300002)(8936002)(41300700001)(4744005)(6506007)(53546011)(2906002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzJ4RTZLd0lPcEk5UGEweVpiVFVncExmdEFXY1k3YnhyeUxMWmpGWkFwdTRH?=
 =?utf-8?B?dkh3TC8yd1l0NThDd0t2UW51YVJ2SklWL1RHMFoyUUN1SU43WXpEaFZTUUNM?=
 =?utf-8?B?RUtZKzlJQnNRSm82Zi9SSmszVUpQS2xvcHE5NzlaYU1ZaENuWHlRSzhESEV0?=
 =?utf-8?B?NWlXUGtaK2NOY21sVERpbHVZNHZrOGZwa29NQ2hOUGNPQllHQzAvS29jZHVZ?=
 =?utf-8?B?NnVkVHBtNXFFWjlOeHdDbmQrLzhXTjRUMGhQL0tCZWFJZ3BWcDNHeDNaV1Bi?=
 =?utf-8?B?c0kzcE1na2VSYUxUVEcwd1ZXdU0xRjF5Y0dndTNxSXIwREpXMWpRTEZicnVS?=
 =?utf-8?B?L3BNQWh5ajNCU3B2UWd6cS9wdFdqeTg5TWFHcVpsTXBTL1Vlc1JUWXlLOXcy?=
 =?utf-8?B?Sk4wUitUWE1jNHBYencva2swZlRXYWhyU2NHWUlEWW1YNGVOa2R1ZTd3K251?=
 =?utf-8?B?bVVEN0E1bVNjbDZZbHNXZmNaMzhGbk52Q1lpMFhKRWZBMmhQb0UvYllZUmlM?=
 =?utf-8?B?emJFNFUxUm8zSWlTYi84TXhUbjF3bS9DRE5ZWlhXN1hsVlZrNzUvQkJrK2lS?=
 =?utf-8?B?MVBIcHFINzhXV1h2YzdIbm5aSktMQzRWWVF1L1ByeXI0Q2JUYUMwMkgxeWw5?=
 =?utf-8?B?MTdFeW9McnJpd2NRYlQ4VmZHR3Z1T0FlM2tzWnlkdldFM0toUERCYlN4cThI?=
 =?utf-8?B?OHlpOURlMGZ1TGlXKytOOTAzMTZRd0dkMy83b0oyVHNYMHBleWpRb255VkF3?=
 =?utf-8?B?VkRnWXh1U1hOVXJtTWR4YklCWmxKT2EzdHVBYkNTNVd3ekZtd1YyemFqN3FZ?=
 =?utf-8?B?dXk0clBLbFRURVdpalc4YlNvdDFaUnczU3pyQlV3WHUyOVF1cGdzYjdmR29M?=
 =?utf-8?B?QzVRUy9LWlZSLzQwRzBRek8zOU1NVHRxejBScWZLOG1qbGVlbWNlNDZwQmcy?=
 =?utf-8?B?MXhySzF1WGRxNnI2MmRQdVh6STUxL2ZrVmdPNjdSR1VGcnowVU9BRVpGMm5R?=
 =?utf-8?B?Z1RHZWk2WHhGWUZuRzRDTnlOOTR6b3czcmI3clJpbyszdnRwdjFTRlY1bGNl?=
 =?utf-8?B?Mmd1UzIraUhwZGxiL0V5SU1SVGlsL29WOElyZ01VK0RtbkQvRTNmd1d3bndC?=
 =?utf-8?B?RTNnMDU4SFJ1ajlLMW9XWFYxeFFKclhFWE53OFJGMURIaHo0TUswM2NHREw0?=
 =?utf-8?B?dGFPQ1paTnRHcHhuQWVWZE1FaHl3aWE4ZTJaSVRzaEhqclZnSHlORXl3L1R3?=
 =?utf-8?B?M2t1SXlyYlNodVUwZ2J2cDg4eUhnZTgwZnkwNFdMSlBGcDgyMCsxOEhxNnor?=
 =?utf-8?B?L2xBYjlvaDc4NTdGMTlKVStjTytqdzdWclltNnpuMWo1OVBFdDFyejgvK2pI?=
 =?utf-8?B?Q3hOdnZ3YUFZUmFIdGYxR21seEZEd21Ub3J3bTYzR3RSQ0V3YjFicU1FN1p2?=
 =?utf-8?B?RFd4U2pqd0hXaVlma0ZzY0hYUFg1YkQwQWxhZVF0MFBHOFRVVytlVVVLcG4z?=
 =?utf-8?B?WHZXb0tCcnlUTE9EMlk0MFpZNDQ1RHJ5UEhtQStNVzk3M1NDK3M3U3YwalV2?=
 =?utf-8?B?MEVrTFAyMVAyZE81cy9IQnllUWxieThteE8zbWFTNytLNkhxUFhHeXUxdEdD?=
 =?utf-8?B?VlkzSVRJUjZVN1puaENnWlNCaUFIZ25CMDhKUjFrZEV2TVFldzVBYVpma0lQ?=
 =?utf-8?B?cWlZc1Znam4wVzZSUWtzREFKVGRETkN6NmJzUTFSMDhkMzdKaWo5anBLL2NN?=
 =?utf-8?B?V0hVZjErR25QcWVLcmZTSzlnRkpCeHhyVDhlQ1lYUE13QVBTNG13NU80Z3VW?=
 =?utf-8?B?SG5OQTBTcjZBZ2Q3MHN2TjBlU0ZySDJQNGlicjIzVi9SbzBDcktvS1lCcndR?=
 =?utf-8?B?d0U0aFphTzZveW4wTTdGRm9xdHpsSjRobWJxZkVKTXdEQmV4c3ZrMDlPd2xt?=
 =?utf-8?B?RHdZRGdsczFlNFJxTnJkVFdHN1k0c25kOEdjdmZnSDZVclcvVUJEVllFMmlC?=
 =?utf-8?B?Y2dScEhBNkhoR3dZQStjS3hOVXp2UnRmQjNTc2dIdjBYdjcwNFI2UytzdDdI?=
 =?utf-8?B?OHR4bzlXeEkzNllBdGIzSUFhMlcxNUJQb0dNdXRUTTJweXl4Z0ZpVW5JYkgw?=
 =?utf-8?Q?yfVTacarkUZCDluaIlkFUfso7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad720afe-4d63-4c0e-5a9e-08daf7e0d59b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:43:45.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUsYBFeyx3dgE5GTzDI6oRbUhecVrUPxpSQbZkanKSPZYubJaFQJOlCM7iMQD8YYJbm6mPPwhSN0Pj4bMSB69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

On 16.01.2023 08:04, Xenia Ragiadakou wrote:
> The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
> VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
> To eliminate dead code, they need to be guarded under CONFIG_INTEL_IOMMU
> and CONFIG_AMD_IOMMU, respectively.
> 
> Instead of adding #ifdef guards around the function calls, implement them
> as empty static inline functions.
> 
> Take the opportunity to move the declaration of acpi_dmar_init from the
> x86 arch-specific header to the common header, since Intel VT-d has been
> also used on IA-64 platforms.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



