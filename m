Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9A737C07
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 09:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552492.862610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsG1-0007Sr-88; Wed, 21 Jun 2023 07:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552492.862610; Wed, 21 Jun 2023 07:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsG1-0007QK-4C; Wed, 21 Jun 2023 07:28:01 +0000
Received: by outflank-mailman (input) for mailman id 552492;
 Wed, 21 Jun 2023 07:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBsFz-0007QE-ML
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 07:27:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 241dcce7-1005-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 09:27:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 07:27:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:27:54 +0000
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
X-Inumbo-ID: 241dcce7-1005-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi7wm8rwqf2RC/B+wEq4QmY17kagfsske03Rxlox3mSrycNBW4PEyzvb8QLvIv6RmjlbUqfd5wc4WvXpcK2ILzOBtToLh+dO0lYArxHlwgGEw/Yrs7OEmjFg0Weyc0OF6I2RMA+3y1MoS1muZQlYhLA4rY/ldIde8hLuNpeijnrq2RIxO4b+5iEehjSbLRhHytyRNXLRdaFRRs0ZMkPTlK60nrGqQsg4VWVYE0gvhvD4hHY2gDIapLthnfznGO40D7OgkUF6ISaj4UrMVianLWtj5hDqVpUdJpmjNLS577/23pJI6MRXg2zpCPPdoPweSHjEm8vrmzqDDcv4atjJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYeZO+PfpbyGcZM/QTnmiajuf3q3Xwky0uctM6/Eox8=;
 b=kZFosY4aILAFfpdItGCHbhw8yzwElt9aVxYz8I0vZFFQvtbs0/fr6TKwrSlNejyUzXLbopkJkerleltOqdsJTWGquhnQ6znzcWC/SzQ/kwUitJ1TF2QxdG48o64pPcAqt8eBl6Vfji+IbupBigOgFLdfEHmI+m5dFY6Pe4odTOoHAAVpylLRsz2ROLRbYWsFQyf13zRedmYwfwlDVrZY5AiEW0PUaXSGE9N733Lbr4NfwqwopKNopZ2nIVBLOxHyJlDgIwUM3GBma6LxtFiaDnvhMWnlqmwPp45Aloyt//ZGUPkIs8qWp3N5LyQrvftGISt1FNYQa9l6zIdMN5OVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYeZO+PfpbyGcZM/QTnmiajuf3q3Xwky0uctM6/Eox8=;
 b=rLTSspTENQZvqZQlIxc5EusOSXxzLa1s7VxHk+JkmPjSruwlB0AgCVV4i6fKIP+ewFPodG9DxFgiOQt6VS3w6QyswBZ+ZqStXQA2OcQ5cQnuyYLB6obHN5Rrrrqbhwi5B4lASiZSWHhKWX27IvVOegSnqBsGF/0DOkqO9OjLTNlsMDBKCq2Cd2C9oiIKudFWgj3sYpq4bZyvqphQSRDvHD85ef3n92d5b21GdKtQOGZUZXsRSYnDQ3JSZ/+zAeKJQ5Pj+oCfZLTaBQ6CVMqGUWm/vT39hzFX+G0Fk4Exp4AK8/kNKM+h/tOlGHTyD9cTOoNhLIvv1AwPABbWvolW2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98a2acc7-956e-d97a-ac2f-5d7368f2cdc3@suse.com>
Date: Wed, 21 Jun 2023 09:27:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] docs/misra: add Rules 8.2, 8.3, 8.14
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230621012618.2661337-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230621012618.2661337-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cba5cae-0e7f-4a7d-c92c-08db7229074e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJkFMzOk1ZuIk24iV4B2zGzW8TkEVJMMOw2bdKZ4vG7GttIQZI4hHG3T1IK8kSuv8tciaoD29P0EdZcT+sOixY7hpSfzafEswlU+qduwd1yjTwuZIDUFfPiYqatayf+WgcFI00D8N7cBLyxKHKqV73t4L/q2OU8SxTbYWTMCBGBNqwCYssE9W1SJ0QRebqDt2D+qgu4i7q9JcqvlGoVqpEiCKbzVh+Xfw87/7Yo8totUNkFHox7f3CN8NFpD65/ysLBioqwZGyLIgV/S8u2HtsH10TQrAOP6Yia/e6b06fNHBSexRH12LkZRZ9xhg7tG63miBHoJs9svKiB++procGfYre2zbNnpJJSGeZdhL+rEM7C+bWbY1ogRO+6xUFpwXSuvzXxy8g7RphixBLbTPqyHqbDKSrg+Czqgnl2VS5k5gzi4qb9bnYD/IFiwGYjpbX8nsLYPWD+GY2SxaxRNmS7+4LRKCvRhzgZoP0TTXbtMgNyNtaxL+GhGg4NLd+jB5eCUJEdr7JeeS+pCvDljqc/96urUcSTp9utg7xQFhESwGO5tAo5suSSP0Ki22bVJBw476Lv5kZPEnx0Y2ayXR3fnVvg9S571u1rZUjRyh8MBK5LxQQ3idM8qzGRx4rwSiXFMDWaRTVLLXAHum8fJiLV9n/iJTi89vuP5sF8SLD//WD+g5o/h8TkYui74Ndae
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(31686004)(66899021)(38100700002)(6506007)(6512007)(53546011)(26005)(5660300002)(8676002)(8936002)(186003)(316002)(478600001)(4326008)(36756003)(66476007)(66946007)(66556008)(6916009)(2906002)(41300700001)(2616005)(6486002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0RyWWdTbnZ5M21NaWhzTlNQWWlLeVFKeGtHV3ZnWTcrQXhyUHVHbDFLb1pp?=
 =?utf-8?B?WjNjUkQ5K09zalNkdU9RRy9yZkxmVlBLRzBtNmJxWjVOZ3V0enIxSHRXSzFJ?=
 =?utf-8?B?TG9mNU9HY3NlL3o4REJTVEczQUV6aGVmUlBnYjFhQm9neDdzclhjeStjUEZz?=
 =?utf-8?B?V3hxVE1NT0kySXdUOVZHZDUza2JCazlSVVRaQzhSR0pTaThCc0tlWm5obGlk?=
 =?utf-8?B?SXlIblhXNHlPNktLSTlPeUFvY296NkdjN1BFSkcxck0xMWxjb0NhTWg3RHNq?=
 =?utf-8?B?Q05wcm5LS1E4OW5LS2pGcW9Ud3h3UHBPNS82SWxwemZQSUcxT01JaXJkK0tu?=
 =?utf-8?B?Um5WN2tSQ0FIWDk4dHNpUjZlOUFWKzNhdFhERGtzREFKdGZGZjl0VTJsWkVM?=
 =?utf-8?B?WWREWXRtV0JMSnFTREZUZ3dpUjNreGlaaGFXSVNNUXNWNERvUlU1dWVLQWdu?=
 =?utf-8?B?Y2FweWttTXNhd2hoVXIwTDFPbExESDJzNlNFMDNoUzdMYlF6VThRbm5DMnZW?=
 =?utf-8?B?WGFKL2g5Z2xJNnROYUoyZXp6a1l4a0tLQWlIdmUzQytQYVBaQ0drOS9yL2FK?=
 =?utf-8?B?blh4ZXY3c0lVVlpUVHhtaUtxZ3hJU2Y1MjlLa3JhYXN1SnlBN0pKTHFaSzVt?=
 =?utf-8?B?eUZyV05Rd1AwQTFmSVhUN0ViOVUxTUdUU3NxbHlyeDZmV0RybEhja2hwN0d6?=
 =?utf-8?B?aUpna3dpV014NUhpZUtzZWY2cTVXQlZFOWhaK2Z6OTJJQ2dCN2Z2L29zcVJi?=
 =?utf-8?B?SEN0eWdUNEpWLzJVeFJkWTVmQ09tSlpFODN5eGhnZEhwNTNBSzZNMHBuVko4?=
 =?utf-8?B?NXh5cUt2Nm8vSWFRL0tCbENGWGViaUdwNlhVcUNONnJYVDd1VkNWQUZra2VW?=
 =?utf-8?B?MTl1bmlyVXUxMFlLTEtJUUpSRWQxWDVqbXRZUHYzeWQxRmpUMHgrcmxvb0Mx?=
 =?utf-8?B?Qm1GblloTlovQUNFbzVjOG9xVnQzcnBFcGJiMDFuN3ovNFUvdmNlWXdwMVdy?=
 =?utf-8?B?N1RGQW96cXJFVWVLcHJobEhWdEc4RnpNcUxIRWNtSXlQU3Y4aXNPaVJiRlRB?=
 =?utf-8?B?MFAxckhGV3JmOXd5b2JNTXhMRGVpZ2daaThodFQzcE9qY3FiY1pzMjk2eVFh?=
 =?utf-8?B?a0lPb2dab2NPSTg5NlNsdVZDY042MWJ0blB2djY1NDhRZFZxb3NRYmNQUnQy?=
 =?utf-8?B?di9XUWtwdnl1ZS9BTG43anA5L1ROaGdiL2M0SWVsTFZjRzh2Wi9RekpiQ1lR?=
 =?utf-8?B?alptL2FYblpERlNJRG53ZmNlMWFrUkJRbG9WMWJFL2l4SDZSL1BDaTBxQXlm?=
 =?utf-8?B?dlBKb2ljNU5VaG1yelN1cHpCNE1CMFJTbFpFQ1ZTdTRhM01Nb3l5TjdUNHRu?=
 =?utf-8?B?VEIycnJ5b2VsMUdWT05Rd0l3T3pHeGtyNXpVNFJMU25BUlJBUTZQQWhRSzNV?=
 =?utf-8?B?Wk5LU0FUc2lrVlhxc1EyMTNNY3NFYW9DSFpENkNVUWh0Y2kyM1lJc2tQOXhS?=
 =?utf-8?B?ZFlqcVVJcHRsMTFITVZvZVJJUjFyWWEraXprS0dmKzRoNk5ZczNPZXhXbzVD?=
 =?utf-8?B?T1RhZjdhM2dBRVNZUXZDZE5pdnpyMkxyVjhEbUlDRlU3c010aVMzSFQrT2Vv?=
 =?utf-8?B?VzYreWQ3SUZuUUNOa2hQNGpJaWREOTB6YkwwUXpSNm5zczlKMHB5UEZBU2Np?=
 =?utf-8?B?QmVKT0MwNnZLbGdUMjBvTVF0OGdMWEcrb3JTY0JDeXBPeWt0d2VaVllscVRG?=
 =?utf-8?B?L1dZL1JTUjRSS2hxWUd4cytnbkQ2NHZFS3JZem9FU055YkIzL2xVem5XTHJN?=
 =?utf-8?B?VVRCeC9HdHk4c3Y0SWVGQXRpZ2RsM2RnZjlwUlNzcVdvN21zRTBncS8wMjE5?=
 =?utf-8?B?WWdOTjFWdndwMGMwTVhrUUNzQUNUcTVNMzZiVjdLc0hULzlTQTZ2bmFldWho?=
 =?utf-8?B?TG95UzVxRm9OaUM4WWdrRG5tUGdqcThuTEZyRVEwY003S0ZvT1NCOVJiRC9W?=
 =?utf-8?B?YUNqVVZib2lKaHZ1QzRqSk53U3VTSFg0OUtxQVJJREpwa2pPNHZTMnk1VXcz?=
 =?utf-8?B?WHAvOUVMK1JSQzYvdnRqYS9OM1NLejczd242aHZBQkRBUElCSFRBMTNwSDE3?=
 =?utf-8?Q?W/bfl5fNIgzrJT0WL5QVlz4L5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cba5cae-0e7f-4a7d-c92c-08db7229074e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:27:54.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDFPmLL/hmopn/a8WfWk6KqNXtbzRf3stN+DX/R7EVxXkqRZXtObOjAauZUPU/cC4TLtVd/1UY27mu6pbEVAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984

On 21.06.2023 03:26, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -213,6 +213,17 @@ maintainers if you want to suggest a change.
>       - Types shall be explicitly specified
>       -
>  
> +   * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
> +     - Required
> +     - Function types shall be in prototype form with named parameters
> +     -
> +
> +   * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
> +     - Required
> +     - All declarations of an object or function shall use the same
> +       names and type qualifiers
> +     -

I think we want to deal with uses of const when not qualifying a pointed-to
type: One approach is to simply say we don't use const like this (and the
few uses there are should then go away). The other, if we deem this a
valuable feature, would be to make a project-wide exception for this case,
as having such const in declarations is meaningless and hence at the risk
of being confusing or hampering readability.

Jan

