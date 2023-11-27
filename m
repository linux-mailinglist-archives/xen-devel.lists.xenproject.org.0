Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E57FA1A6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642110.1001276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7c5g-0008OP-95; Mon, 27 Nov 2023 13:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642110.1001276; Mon, 27 Nov 2023 13:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7c5g-0008M8-5o; Mon, 27 Nov 2023 13:56:00 +0000
Received: by outflank-mailman (input) for mailman id 642110;
 Mon, 27 Nov 2023 13:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7c5f-0008M2-6J
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:55:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ac7c04-8d2c-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 14:55:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7607.eurprd04.prod.outlook.com (2603:10a6:20b:294::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 13:55:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 13:55:54 +0000
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
X-Inumbo-ID: b0ac7c04-8d2c-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7hfD7Abu8XXXpE8u5KUXUwBWwh9Qovo+D78ct98EwS3Nn+vglsbBYjmYb128NtJEF8Qs1lcbHZZi7h25BMVfhxIhLbKCIQIX3fMiWvy9jTFprc3Z2fh9a+LX9KpqOQ9yzIg3Syh4htDpqFdadZ5dla1HpDv1M/sBn3g9BHwzONKYC0Owvx0AnlitplGX3kKFjHNEwe0681OMQyMElMzKmaCuOAZOyvYn4mS0yqaaGwXedFarwQCycFnEDdiNCiPikQmQSHg7XxK6DWbwTrikR92GG/3YTQqhE7xjVWjzhx/vlJ9C32VYXaGlvuDKvpTLnbwELZgn9SCxZ4RWH+8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfEfqweG28j+L9GdXNulpUMnE4Sak2c/WgbY0hjebtw=;
 b=hlk9D06xTaTimJU24jqraqIvzERaYS/hHRIcEWgsgvGwqoFr7q7v3/RMLpvwFxlGfaPePVslEVm0ozs/3LpDk6M9OdWvcOSNpiPl6b0jlVlOfxkyYJZnC6SGoE4Pz+fkWQ0bgkXc/wL0tmvvn7qkEBHEzCNCtFR5wZmLnFYTr1F7cZNolMYucz5KdG8GZU33SzPkawMas83S3OHvbdDI2/AGEWtBXDC55dCpR3Yv5T9HKEamFeVPNZ8YVxeBK+aBCgaFNjjRX+OeC+t0S2w4xmrYbknjrRaq8CdJE9OsnFC8XpELdV/YunKiqDgnto2j/qSl61Ek3rfSrLkR8g2q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfEfqweG28j+L9GdXNulpUMnE4Sak2c/WgbY0hjebtw=;
 b=d8J8ZKtme7CqHprQkaU081eRT6el+tendJVkHPXt+4Tqk9NOgMo5Nr9rlGYpGI5mZnVJJJQZj9P4p1qGWLy1X4ybmadpJ+h6TBwEzYeQZ5+flV/8PKt9eHgPr4N0h6ssEB8brjK1ouyA/jfp9QTX+Zbh64GSG3pxtP1OpqynDcMxbmloVy9q9TmBHMh5XuMoHlM+wWWtMNRyFNt2kSLD9HvcdVhtAsmjUioLySPTfDPgl46Bw5TbLkGXw0dTdlyxi2xhgMN0TVnCe+AOCCjJloWrNDv7HHY3agREyKe1YRBEuzasTuP0+HStjIA6w6yVULQvsgfHqPuczQ9Fe2/uGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
Date: Mon, 27 Nov 2023 14:55:52 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Argo: drop meaningless mfn_valid() check
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b2955a-e675-412c-d430-08dbef5092b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85EvFNELaPZ4f0ZrNErvApCb1N2MHU6ToaJW4POwDa2x7KzWMwwBoJ72mon9lRcSEYi7KEgn977ZNnabsH3pQEQQ1CLUPCzbUxktnDYa8UHoqLPFO8wH4BPe/oQKdjUreVHBYKxkHaoibt0KWLbUyNugKdiMS8hFlLpJnn7yPs45QlCfI9lSE2fvEWy8D+CXeCJwSIXNs7JFOIP7PBx5pUsAN2C1OG7eQDU4f8eBe2osaCfJze3ZTfyY27e6vEPwIvaUeCrq9mgfm/or4Rn//pqvRMn70sDv2iFCBExy8ClyXnxo7i9T/qQIozCgtQFsVGUEoUP5NpjSTe2Gooft1OPAGiKMQiG1WZKxRHKnFOhzM+29v/CcT6+7Z27kp8Xw3GZGWJ2i+0KOq0MaDRbKPNtaRfFzRNivDaMcJhx+0uHfLFcxBB/LU4Ryh4lf/Qq8r3HQputd1II+7PHvTkP5cavgPp7KDIer+EnKRTocqDsXdlLnGsJp6UsVaUtqEg4hWkpqo9GuyLus3yurhqKr6Y7KRId2F/wBM0vCJ5nbxelKaBUdUKAAjubysOyFwsXy5+N9FHQB5D2nCVcARGPdjGArtNMjqaSkDomDCHLs4+SX8sC1M5FsrfTljaSs5jT2Dzvf3WY5wu7OaA1PMIcPPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31686004)(26005)(6486002)(2616005)(6506007)(478600001)(6512007)(38100700002)(36756003)(86362001)(31696002)(41300700001)(5660300002)(2906002)(66946007)(66476007)(66556008)(4326008)(316002)(6916009)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlBQZSswMHlWU043MSs3VUkxbGRJTEFmSmpCbDk3azBaNXNvaFZCaEh5SExV?=
 =?utf-8?B?YTJnUk5qL1hXMWxiVHhRVWdkYmJCRm9LS3Vsb2RVUnE2NE1MMkpaTUppZTd4?=
 =?utf-8?B?RU9BRnIyWDlBVkp4bDdEOXBLTlVhRVRtUjZlZFJ2Qngxekh3S3VTaFZ5OVlB?=
 =?utf-8?B?L2FCTXhEaHBxMG1DYUEzVWR3YytkVFZaOHRUMkUwTWpybU5ycFRGak5GdU16?=
 =?utf-8?B?TWd3Nlh2YlZMaHdkcGtNdExhNEJmOEpJajVTRzFyTk9pRkhPc0Q5cXE0cXFk?=
 =?utf-8?B?WWJJTUg5T2c4U2ZKQWFXNmQvL09aUUIwanZhQzM3UDV3VGs3cWFUMll3a0pS?=
 =?utf-8?B?WHdEREk2SGtkcmdOWG9uVGpPUVVSVysvQlUvYWFhKzZMK0g1NFJ5UXVqM3hv?=
 =?utf-8?B?R1d0U1RwcUQzRmNieHNpOFVjTldFS1dKVUtTTDcrYXk3RjR4ZFNzOUR2eW1a?=
 =?utf-8?B?UjcvOVB2VzA4aFBicjMybm4vUjlHb1hnV3doTkRQdytoN1JmdDhRcUpiRDA2?=
 =?utf-8?B?WjNvQUh3ZE04ckJzS0MwbTdBTTdnckk4TEUvZkMxTkxQVE1DWWN4VTR2Ri9F?=
 =?utf-8?B?Y29IZXo3aVIwa2JCRlZZNmZrbHRqR3o1QnFxSndhd2RiOWJ4RXVIaGRVd2tZ?=
 =?utf-8?B?L0hMRkREK2FNbTFXYUVYQ1NYck9STVpjSTZQL0U2YkVoaXFWaHIra0tIaU1a?=
 =?utf-8?B?WnNFQ3NFNDU1Mjk2VU1WSkc5ZlJ2QXFwZ20zTmx5MksrWmZlcm82ckVaVzdG?=
 =?utf-8?B?dmRNQVBDazBBZjU2cVgyd2xiVXF0Vkc0WVRnZjRGamtscDdWb3p2TlFwcXA1?=
 =?utf-8?B?eFoybjZxcTNZbTJjWjV3TStOMjdJcmhyakFUV2xjdjlYdW5iT05YT3poNGFZ?=
 =?utf-8?B?Z1lKa2E5M1Zuald5OTZ5bjV2WXNmRDhDRWFNc0VZNG1EdlBOZjhTYjlMc1lQ?=
 =?utf-8?B?SXlBSHVCdzE4VTRKYkVXWjVPNXE0azhLcVZCOC9xek1lUDNRTzRlRnpVcFVr?=
 =?utf-8?B?Z2dwT1NrMUt1K2x0bTlzWVkydFZ2Y0Q5THllU3hWNW83bEVBZFRqb0Q3QlFH?=
 =?utf-8?B?N1lwOWlORThjNk10REV5ZWx2UWtMVGRMcW5LZ0pmVExtdXYrWWVMUUtsZkJC?=
 =?utf-8?B?bGM0dmg1WisrVVhudlNhV0lmdS9vYTE5anRibUhTVG94LzZWb2NYYXlrNWFO?=
 =?utf-8?B?R3QvejlrUmwzY1J4azlvaUM5OSt2NXV5dENvN2ViNHlBOTlVc1MzRWZydzV1?=
 =?utf-8?B?cVVHbkI0QU9TN0l1UzBEcEloR1VMbzJ0VE0zZTczZmlBODdVOUxDeDNNZTYw?=
 =?utf-8?B?MjFKZFYxTnJQN1lHWmI5Sk9BQnMwWTQ2T2N6VlpsUzk0SG5aTVVHOG1rb1hy?=
 =?utf-8?B?b2JkL3FtUjZ1OXZaYmRieittWW9ReEp1S2RjRnBycUJDd3pNWmd2VkpBRHRQ?=
 =?utf-8?B?WFN1YjFBMXJJQTk0M3hrUlJiSFAyekJTQ1FXb0xrNDYrbmttZWF4SVRwTlEw?=
 =?utf-8?B?cFV3VWd4UFFIaVhZRW8yTU1HSUZFL1RVMVZSY0pRS0VjSDRKSzBCdklJdHJy?=
 =?utf-8?B?WWkzWlFqUm1DRThxUkFrNENhakh3Rmk3MkM1aU5xZmpua1YxMFZVZ2cxQ1I1?=
 =?utf-8?B?S05jeVNCalhtaFFuc3UwdzNRVStJc3Y4ekRtQ28vcXJGbUYzOEdrTDNwZDU3?=
 =?utf-8?B?a2RGTEFKUEFCUys5c1pRWnd2YkdZZGV0Z3l6UlpoekZoUCs4OVhzTVhOUmRK?=
 =?utf-8?B?UDBJT1BKQXFaaG1kQkZSZERzSWtHVXJtWlpzZmVYU2pWS3Z6UnVpMTNnYmc3?=
 =?utf-8?B?RCt6dFY4eGJyV3dNWTJMWkpqR1p6a1VjNG54V09jNVZmMUhMOE9NZ0s3RS9D?=
 =?utf-8?B?MVE1VmhWSUN3bFNFODlnRnNmM1ByeWJ3S3dGTnpDYTlIckdIaW5Od2FkSHcz?=
 =?utf-8?B?TStzQ0lFcS93VHRoYXMzZ0ZudHVWT2R3dG1TSjEyUG1tWGtlMW1CR3R1amtO?=
 =?utf-8?B?cjBaa1JxNUlybHQzc3FaRjBxTWZJZzFNOHF5dHJqZWFqS29KdFlsYkFBbGQr?=
 =?utf-8?B?b1JTcXU5R3hEL0h6RjZURXo2QzZHa0RJakRySjNQdTEvek9oVjJlWEUxYmlT?=
 =?utf-8?Q?riRl3wv7Z5K4ou1AP/wbjen/5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b2955a-e675-412c-d430-08dbef5092b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:55:54.2502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghQT54ELrv+MHjy2j7Y3bXllnWLNzJTgzrWyXJalo7cutyL9Wg3SPQQ1wV5Vlqm6TZHeGird5UdODMPxr0Z4rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7607

Holding a valid struct page_info * in hands already means the referenced
MFN is valid; there's no need to check that again. Convert the checking
logic to a switch(), to help keeping the extra (and questionable) x86-
only check in somewhat tidy shape.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Initially I had this (with less code churn) as

#ifdef CONFIG_X86
    if ( p2mt == p2m_ram_logdirty )
        ret = -EAGAIN;
    else
#endif
    if ( (p2mt != p2m_ram_rw) ||
         !get_page_type(page, PGT_writable_page) )
        ret = -EINVAL;

But the "else" placement seemed too ugly to me. Otoh there better
wouldn't be any special casing of log-dirty here (and instead such a
page be converted, perhaps right in check_get_page_from_gfn() when
readonly=false), at which point the odd "else" would go away, and the
if() likely again be preferable over the switch().

--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1421,15 +1421,24 @@ find_ring_mfn(struct domain *d, gfn_t gf
         return ret;
 
     *mfn = page_to_mfn(page);
-    if ( !mfn_valid(*mfn) )
-        ret = -EINVAL;
+
+    switch ( p2mt )
+    {
+    case p2m_ram_rw:
+        if ( !get_page_and_type(page, d, PGT_writable_page) )
+            ret = -EINVAL;
+        break;
+
 #ifdef CONFIG_X86
-    else if ( p2mt == p2m_ram_logdirty )
+    case p2m_ram_logdirty:
         ret = -EAGAIN;
+        break;
 #endif
-    else if ( (p2mt != p2m_ram_rw) ||
-              !get_page_and_type(page, d, PGT_writable_page) )
+
+    default:
         ret = -EINVAL;
+        break;
+    }
 
     put_page(page);
 

