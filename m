Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20957CAD97
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617795.960837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPbD-0000PY-6F; Mon, 16 Oct 2023 15:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617795.960837; Mon, 16 Oct 2023 15:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPbD-0000Mc-3j; Mon, 16 Oct 2023 15:33:43 +0000
Received: by outflank-mailman (input) for mailman id 617795;
 Mon, 16 Oct 2023 15:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPbB-0000MW-QX
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:33:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61d76008-6c39-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:33:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:33:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:33:39 +0000
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
X-Inumbo-ID: 61d76008-6c39-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9dHEMf131qX5IU4BsqCG4w7WCyJ9Xo400s52MwHu1IwsSFIlNpavUsM52eQD95ih5jwzV+vaoX7PIw4BnH1BuENzSqMyQUGZxRwzRkQVksG1aJ8OvSki/k+RmEae3nCpa+X4J/140k8VoRuAhZVH4j0dha/5Rb8reYe1I3kZIy5m6e/DpPSe5CnyjEqJzZmTq8iGQI2HhiSD/7PZHtpzMlwmvsRQwBIPGNbxvd6O5czgyzDJC9z6ijHC82qikuiKh/S5IwYHg4D37tub+0Dl+zEE0+WJztm+H5++vK64epZguUPdCQKbMhz5EjHGJfoX6VuSsyna6T2RKvxkm+PbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBokwC2mnfdRoh97JfouDhPZyzLPNML0HpprPGECk6E=;
 b=bFGiE7VAvEepy8PhT1YL5SDtYdKCWVmUDzdo+A9IzR0QJbjiNQJ+8S1mx1Iq9SoJneKoHUA8hJY08fPNfQBNS5ow7BW2aZqD5C65JjJJPWurZk4jEaTy2WdMSvQHU43cj5wD0/GBNltWETgNZIgeXLo6PMoM4nvLpHK2wNu4Hrxjv7AwVs+TGOYLhEYrOkhKOIb7AoZD7rSteDJURRyVTXMNCCElfyNYfgjM6HDQrEx+v14ksQ7E4RtASD0wdVb6BxR3DsEROH+sBNr1dDwjr4H7MJ0+M3Alep1X4G1/3+1IQQq7lLzoxdP8wFWQPi55Nt6iWWkFTtO8FQ3yL0utmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBokwC2mnfdRoh97JfouDhPZyzLPNML0HpprPGECk6E=;
 b=pUG2keL26zN/bMy6qX4mMz9yGGoSvNTBbsG47pSmT5xD854r3dfxyL4H5iG/xeNGaLarvQ2hj3/iAxld1044TDY28HINMw1aaoQ604SMcn49z6/CPmaT/5nIqfc072MQxVzQYyVclG4DaOKUjwcZ0Fb1EfP/rCGF868gztK082TqRlXFqKr7RUMm1sabJH0PTkdfar0NfcROTASjgcI9aHugqm9KP+WXSm3aFzgDN6W9c3pZiV3GVlNkWBaujg6Tjh6tmv/8AcJ/Bs5LfgYERhjBWGlZU3Yhb23rkCh6hPA8YLfu0kaknZOkxH/jBlq/lrT0WnsPoP3OwCrtQZLt8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
Date: Mon, 16 Oct 2023 17:33:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd3deb9-4854-4034-b2e1-08dbce5d4526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KDhTtbB6AzwPpiKEeCwQDKT8hB6hNC9I7vv45p0VXoKMS8SYlJBkila/4mlBKGCpJZ3z7OBqjvQqXNjMNgni5yi89n8cNUMSMiVL9K5t7WD1KD/mvEDOwACctFlFvv+5FH2/J3yaJWqG0QEkw5Sfd4XijzluMNNafrBsvzhg5QzPeAjcJNx2wAWr1/1kJMg5MmHxPd39CKbq9/5lRanxYSYWsgVw0Fs0Nkm9zSVBWjyXMxsvjPyBjfjxUUuHkUOKhKLB6Nk5g6CtK3uznqUgUW/XEereRINWbqGIb8wGPfNrvM3v9I+yUOBS6+wbn55F6Idfm1LI7wPpPmE8Gau8AK95nG5zvACnnUl8zoLvY+0X/k0WdUVAvR0yU8iYtYOl3KrCjCNMSWl5eXmMllFR5yWzO6uXG0GrRIreqqGvXVKhqZGdrEVm81TMB4zlXfOWU2O3jDv3AQ4BY8hmG7OzRf300INwUFHgxkDR0pqEeEsAa5oE74XB2OAm1Wq0YicX0A0QKT0VWYs3NqNWMR9H/QarJrJpn89ZqTIQ0s44cXNhic7U+BQ7qiN5bKdsKnqp9teNdqPBomGGT8z91EkYr9X6C7lc+3QDBjg2Qw+p+LOTYW7KymMLrJo+eRWpLeFM9Al20sgaRnqika34VL243g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(31686004)(86362001)(31696002)(36756003)(478600001)(2906002)(6486002)(6666004)(41300700001)(53546011)(6506007)(5660300002)(38100700002)(2616005)(8676002)(66946007)(66476007)(66556008)(6916009)(316002)(8936002)(54906003)(4326008)(6512007)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHBPdFh4S1lwM1J1bDErSUhXb1crWThJbmNwNVQxVHdwMVVXdGFsWU5qMGgy?=
 =?utf-8?B?WVFUNzNWQUdXYXc2bUpBSVhCOTBwWXBGalFYRjBsUmsxOGUxOXovY1ZqQW5K?=
 =?utf-8?B?NnhkSnJIQWNBY2F6WEtnY1NFUXY2R3BHVnJ6R0diMGVFZkpaTUpSelZldnJD?=
 =?utf-8?B?UVMwR25mZ2hOOTg5ZStERDgrS0Y0L2wzb0U2ek9hM05pdDdLSGZ1ckVJTzJ3?=
 =?utf-8?B?NVA4ZUlocGVYWlNHZjFmSlNXNjlLNUgzbW9ndlQwbzBtN1ozN250VUhKWURH?=
 =?utf-8?B?a2ZzeWk2Ty9jZkd5bVVGTTNCclNPQy9QQm1zQWwrN3U4NTFWa010QmE4ekFk?=
 =?utf-8?B?WmhRZ0grVmVYa01vSnA3Q3hXNGlvZkZrbGk5ZEpueWxQSTBmdHg0SUNGYU9t?=
 =?utf-8?B?UHhOVE1WZmx0WjJ2SExPUm95bnY5cnhpTTlhUE1LN3FsemhRMlI3eE5QK1JL?=
 =?utf-8?B?U1gvOEZUZDF2UDl0Ymd5eEJONG1SUExJNS8reDVJaWY1MExJM3czWFcxZmVv?=
 =?utf-8?B?TjRvdXU1R0l4dXZVNmk2ZzZXWHdCS3g4MHNFSmNtcmsvakJlRWtFN2Zicml1?=
 =?utf-8?B?TzU4bkk0cDNFWGhOWGRhVHJkbC9iUGplZUJHZ0hIYyt4QW9lOVBYcFJiaVkv?=
 =?utf-8?B?OFpJNDNsazlkcjRoNzNHb0gzRzRZalk4V0c0bmd4VU5zN24wMm1PTXg0UE1k?=
 =?utf-8?B?QjdPb21SbXZYTkkwcXlVVENsajJqUjZDbjQxUEt6UGNxMDRDcUhaV0pJdlR2?=
 =?utf-8?B?MlBsekxxRlVSLzZXVmV3emFRUjFReDV0TVVOZWk3OFppZ2dQb0dLVFlXQWpn?=
 =?utf-8?B?ZHAwZ2xkVTlSbGhlRWw1anU2NWtjeE1nWjZEb2hCUkpTbjVLakZrK0NIemh4?=
 =?utf-8?B?blJXMlpHYXpXQUltYU9nZzExa1lNOElTTzdURGlFNkV4UVlIdjdlYzdkQ3dq?=
 =?utf-8?B?SDY1eHd3dzdpQmU3SDJ1RlhQelNacTc4b1RNalBLa044UW9aMmNXb0xnWnFi?=
 =?utf-8?B?M3VKQjZqZFNlOFJxalNlZjBOU0w1SGZxYTBqN1Q1NEdQUkZrbU9LeXNaa3Qx?=
 =?utf-8?B?RkgxVm5rd2tuaW5kV1JVcFFjZXY0N3RPVlV0M2RkMUpFQ0g0K1V5d1dDMFpF?=
 =?utf-8?B?T3gvdzJtakZ6WVE5ZVJMc1gwY2d1ancrbWprYnp0UklqbVllK3VvNVdkZGd2?=
 =?utf-8?B?ZGdwTGNYQy9DVFR0WW16bGlGcXp1YlU4Z1U0UmRybkFYK2RjcU9jclZjcTJB?=
 =?utf-8?B?dkxZKzM3ZTZoNnZNQ3hraERPSnJWTFVuTFZCUWhQQmZOeE0zNG1MeU5jSUZy?=
 =?utf-8?B?ZkUyRGxjMzNPOFV6eEVCQ3MrMUVjZkYyLys3TTZpQURtcE5QZE5VQ2Y1R3RJ?=
 =?utf-8?B?TFplMTN2c1U5dXRHRldHQnRBRzU3Ui9zTW01N1R4RzJMRjFvRTNUM01pdE9M?=
 =?utf-8?B?OXJGczd1bHVzanJVWmlOSVFKR2dmcmVkMnpVa2hRVlBKQkJISGYyY0RCSUty?=
 =?utf-8?B?Z2JibE01OEovRit4U3ZidnBYYXVubXVyUUZiRkhWa3UxZ3VnS0RUdFM4aWdz?=
 =?utf-8?B?VWRmTDJPK0pPQXljcTR3TXExYU9VdzNrSWZ4eU10WUpCUk1CT2ZQdlF3eVZU?=
 =?utf-8?B?K2U1cURJVUdmcGlmNGgxc0tHZXhBM2w1YjVHUkhaczJxa3dWQ3JPZlh5VEZq?=
 =?utf-8?B?cHJVQ2w4SWM0KzNBaFY2S0pXS2VXbEY3WUpwY1ovRWFjR0gyTXIvcm5OZ1Rn?=
 =?utf-8?B?QUFRMkk5MzhTU3R0aEtrNkRHeUx5VTZxdEYycWdNQXF0YjRxWFFLeUV6N1Jk?=
 =?utf-8?B?cjB3c0VwOUtYZlhnR1ZBYS9iVDlIcXR4MisxNWp1bzhkdndGV3o2bEJOS1Vi?=
 =?utf-8?B?REY1bFNRTU5OUjRtcHpmQ0xrTGhDdktrY2NodDluRGdJUGkyYlJFUGpqbzRN?=
 =?utf-8?B?NktUU2RmWlZvMFYvUkZUYkxvN1lQcXM5NmI2Uk4wS0Y0Yyt2ZFdFbFBGTWM4?=
 =?utf-8?B?U1JRbVBudUZ6QnpMRW1rK2wzZnlLTEJoTlZCWk5YTS9qblFVZ0ZEYklycktx?=
 =?utf-8?B?Yk5EbHdadnJLSFJMcFNNdFZBR1VJOXdvTVpGVzRVVHg1MnhaN29LbWxSMDVK?=
 =?utf-8?Q?FWAvPRCKQt0seqM6deuw/k449?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd3deb9-4854-4034-b2e1-08dbce5d4526
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:33:39.1528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lI9LSyDAPVC5BjJ0XiB2EbULLBbBC3ya4R1Y3JccoLDwzWpAblyG23gfzqRs4MPdn425EJVTDTiNeZaV3ei6RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313

On 12.10.2023 17:28, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -274,6 +274,12 @@ still non-negative."
>  -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
> 
> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to obtain the value
> +2^ffs(x) for unsigned integers on two's complement architectures
> +(all the architectures supported by Xen satisfy this requirement)."
> +-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
> +-doc_end

Why is this added here rather than by ...

> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,10 @@
>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> 
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))

a SAF-<n>-safe comment here?

> +#define LOWEST_BIT(x) ((x) & -(x))

Personally I consider the name misleading: I'd expect a macro of this
name to return a bit number, not a mask with a single bit set. No
good, reasonably short name comes to mind - ISOLATE_LOW_BIT() is too
long for my taste.

Jan

