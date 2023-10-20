Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61287D0815
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619652.965090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qticT-0007On-8n; Fri, 20 Oct 2023 06:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619652.965090; Fri, 20 Oct 2023 06:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qticT-0007MP-5Y; Fri, 20 Oct 2023 06:04:25 +0000
Received: by outflank-mailman (input) for mailman id 619652;
 Fri, 20 Oct 2023 06:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qticR-0007MJ-HN
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:04:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83a5a24a-6f0e-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 08:04:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8525.eurprd04.prod.outlook.com (2603:10a6:102:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Fri, 20 Oct
 2023 06:04:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:04:20 +0000
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
X-Inumbo-ID: 83a5a24a-6f0e-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1DnYz7uQeuKinI9wdqGFAZq5RbDoXLRnRDNOro1E1TmoQouM9YqesDG/6L08f0bJ53j5OymP1u8dbUvt3w1nArGmJTh3zx8g/rkhcUbdnwtyjpWXPv7g+4gf4nZ8y2WjpsGwzj5MSJFAJdZo7uFMrQ1o1te99EG7IlR34NqOXRWKczynGQkQmlWSPtGdlwBcgZFO/lbiV5JpM3Z0sod7WmFTuooCGyJ1xUeJFmU68XK1YOkTpdZs1eg/AENTg19NlW5wRJdq7E/8/oEkeYScm3vp3cFRlyx0mHrUilQeYSerg8g7ixO7cwI2egl99T0scIPDQ8L/onSXnYW3u/Ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST5PFKJELAYjfeN5xAQ9z5qeuXzG2OqakSxoS50WKHU=;
 b=GgxikNZXhJ6OA7gida15cSC0Q26dd7PYrySOY8EZMLpmvj82YCpxP1tl4Lz2/d3+WUYqCNvdifEMnuWMnQlXi+fHrrrp/4QzKD3oBexlkLr8DkxyYUSGb9M7FbBoFR7lh3hg9Q8UrsC0hpKu6DDve1aLAqICsRWa/SvADmVFt1MajoWUZrd/wkyPE1j4PrERWts7z484viWgbLWyz+MZN6TSjrKproXUni9CsuSuI+AV034WUYdVCxNr7DMzwUQI6QmKlNxUyEERYx1VEGDNAoc9sAannV9Ref2KIUDtbQdvbIlYS/P+qOsblxipHS5U8o4ZCJ/tUPBEdx147Xt1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ST5PFKJELAYjfeN5xAQ9z5qeuXzG2OqakSxoS50WKHU=;
 b=AlmBp0/10wdRGAYFNS/CePba/cGhNtfpV2Bxed0b7kWlF8k9oeAdmbHeGBjbQiVATYX0eHuxOSIXzPyH4CeNDV4y+riFELmOeFW0knL/rWEcgondpakozBwQtF0fe3UKa7CUtbvNcBX1Js7kBdC+/smF79f6DvzIHitBOG5tPEhysgIar6Gr95gu5j1q3v+vPvI0+WA2u9NZMBUyfq+u3cyRhwmOMhUv5firNYcoHhthgIiZ09qx21KYpkGmrqV5MqnDhnjTH7pWqXWPCGoxJSB6kp/NWQpaUrglnWpLn451F4hCXYH6IxRISEsnZBouSardJVqzxrmwV2rte5UOqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ed0694a-a8cb-f01b-3d16-681c29d48522@suse.com>
Date: Fri, 20 Oct 2023 08:04:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 8/8] docs/misra: exclude three more files
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
 <0eae39cdc68e48932936e2c510a867ebe1f7c298.1697722648.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0eae39cdc68e48932936e2c510a867ebe1f7c298.1697722648.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 28768b09-e8e8-425e-56ab-08dbd13266e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U8IVQtOFqgUT4A3iLySuG7JdfIhzBDxOa5PgAy1CRjaIscf7kfAluIqLv6mgF0ay1HeTKMWSrt4FKxxXEkrSOYsCYG+vOcFxDnvlfb4IuYQTNByyz0mDic4X56Y6SbJGUb66LWLx3FXwqNBcw9xnH4nv4nekx3Q6TsuxBt343BMzuh//jhC/G53QEx1SgpTJ4C8htp7BOOFPZ4b9aZsYe+w0Rxnbh2kJ113ynPJFza/En3nYL+r+h0ry42leTKnjwAyMjzLD9yzjmwtdq0nx/ynBZ4Lj0cECiH6+Bd+4/9CSQeFTBA03HWt9negfoq9ZVNkTfTf5zdo6demteYQp0Lg6QXwLsFJcBQkB2ruzIhHfS0WQwhwdIccSsBYc+0AYdmk/6DL3fgQRgYtav0TZ6675ByJnbikeDyxGWJzIPHZDCoJ8Hk7X2cwzu1kJkzx74ovkcO7u/awmPK2Xp2giYcmW+0ONl4r2zy6fL80LQGCH4PuyU/WJl8AbBJwyyqKTNivnF0DrXjT6HhzR/i/rK5iLr6e4gZnPmAYMEmsc48dfWZjMdHCkgqp1bmY0mF/FELjUb/2QnkPgRO6JIpVayNupYv96+uyxxweBm89yBSQKQpKc/IMRVE9D7jKZnXhVHZg3mCIO1zPubzKD910gbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(4326008)(86362001)(38100700002)(31696002)(6506007)(7416002)(41300700001)(36756003)(5660300002)(2906002)(26005)(6512007)(2616005)(53546011)(478600001)(8676002)(6486002)(66946007)(8936002)(66476007)(316002)(54906003)(6916009)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JtQWUyeWg0aE83QTVTMzNidExaVG02U0E2dEZhWEZUWlNaa2RRMEdPSEpD?=
 =?utf-8?B?dDVuc25jRFB3d3lxZEJldmYvQ3hBYVpnS0RlT1Z1QllMdVl2WmtxZlNndHZ3?=
 =?utf-8?B?WmJUOFpXU2dEalJoYjZLYXk4WlI1WmRFem9rcndqNEcyUEFFU3F2M0RJb3Jj?=
 =?utf-8?B?OHJLalJGRlNKMTc4aTkwM2tKZXZ3T3pEVVJnYjkzZGdPSTk0c3dCMWNidmNP?=
 =?utf-8?B?dkhOVDc1c2NHQ3BWS0tuU1RPS29PSUcycGlmcXBCeEpaczY3WjBPMUNkK0hs?=
 =?utf-8?B?c0daNEQ0QWljV2pSTzEzUTFHaDRrenRUV3kzV1BnY3JDdVdYblV6VjZwd0Jl?=
 =?utf-8?B?N0ZPdE4yOHd2UjZKMkpTazdtM1BSeXJCRzIyRCtpdWo0WWRDa280ZGgwSjVz?=
 =?utf-8?B?c0QrbW9OME5DQ3ZCYm5jc2FQNWpXaDhrUmhEUlNoRVcrYUk0UytMenVpZTZv?=
 =?utf-8?B?djBFNXZJMHcvR1RTQkNqeWoyMEJYZVIzM2VjaFdVblY5Y2g4MzdFaGxaRXZ5?=
 =?utf-8?B?ZTBvWFY3UStuMVZxdVgvcEhPYjQyRnpDYXBUZUhwU1ZEQnFtb1BkNDNXWWV6?=
 =?utf-8?B?RXRGY3ZIcDBkMGpBN0JmQm5ockVnTUMyWTB1OFFGQW5zQ3pHYU5yWUhuYS9D?=
 =?utf-8?B?bGkxaDJtZzFxbFJSVi9QZ1g2NFRwU1MzZml0NFFHampYL1NRZXMwTDA5UGEv?=
 =?utf-8?B?NGNXY1RXVnlWbmF4aUlpeitmNmp5R2R3NkVFL09mdEFoblhYN1g1NkF1d2J6?=
 =?utf-8?B?WENWSjJqb0pUS1ZibHE0dkhNYitxS3dhc1UyVkpxMjc0L1J4S1VoUzJ4SzlX?=
 =?utf-8?B?cEoyODNySjVYWlJodG1wRXpzOTI1NjI5ekE2WUtzUmlFQTE4YTA2MzhwRkM0?=
 =?utf-8?B?WVhIaDN1b1ZPRWtBNVUwK2w5TVFkK09xV3JsYnlTUThPWVBZZjdiSUFEUXBB?=
 =?utf-8?B?bExSNXFhWDMvMDR5WXN6QitOaDBreTJlNFZqSGF3Q1BWb25ScVZnWko1SEF3?=
 =?utf-8?B?cDRJUnlOaXRmTXhsMDZaMVkyelFsNmRtNlNvZy8vRytsUitObUhSSVdVV2VT?=
 =?utf-8?B?Ylo3UitKbGJRaUgxbXl2bzUrOGFVaEFOc0JMVnpZNnlrSnFVeVVBNk51UzY1?=
 =?utf-8?B?R29BZzdVazdvWVlIVUZHRHo1c3MzSGsxOHdpTFlBc2dKRmV2Nlh2MnFFazRG?=
 =?utf-8?B?VXNuRFVNQ1doY0gxbXgvUkZTRVdBZG1FKzltWDA2dktpR1puYXRWQ0dhTU00?=
 =?utf-8?B?RmpKUDlJWXdKNm16bUthMi9LUHBXL2NsWnNHSnJZSTZOWkxwQzZ3cGxIVVRB?=
 =?utf-8?B?ajNhVlY3R0E1dnJhem8zbXphcUhDRzhhRHo5SXZIVG14WWlRRFY2YzVUM3Zo?=
 =?utf-8?B?aTlCRDZpUmc3Y3ltQUg0RkR0cXRNQk1XNFdIY3p1eTdvcHZmeDRnNlJjM3ZH?=
 =?utf-8?B?cm55L25vNndhRm1ienprMHpuWXBiRlZLMXl0TGdOQUY0VGpRdEtaejY2OUxQ?=
 =?utf-8?B?WkhQdVZucDRxWUM2VGZzTGNCdk1zTmZiZkplazAyTlhKdlQ1bHdpazhVWS9y?=
 =?utf-8?B?MFRRL1dHZWkvak1NV3UwbTBlMjA0cUpJTlRTOEtGY3NZSU0wbXF0SmNZUGIx?=
 =?utf-8?B?UDBMMkdwNlV6VjI1ZFVmTEJtVmFpL3JkMmVzV3d3TlhzOE0rc0dPYWJzT0hi?=
 =?utf-8?B?U3FJaXlObDYzY2JvenFsNUI4Z3NPTnE4U3RoZ1l4dmRJaCt6MWM1TStCOFMz?=
 =?utf-8?B?bkoyZXVwV0k1SHI4UHRkazlyOXpTZ05kRlFEeTFaT0lmK0pvNDN5eUVxNkxq?=
 =?utf-8?B?L1RnVkZCMHRlRHRveFBOS2EydEt2UENqZzB4ZHB3ZnowUUlhSitLbGNKK2M3?=
 =?utf-8?B?K09MSjFBUUN4c09pUXl4ZGdsS2NzVE9KcUxYczg0TXh4Qk9xcUhMZ1Z2TnpP?=
 =?utf-8?B?bEU0Zmc5SHdhRHJqeFJyVTBYK0NDUVJBQ2xTKy9tQkNWUGZ5aWVKNVozcW9Z?=
 =?utf-8?B?Z3JkS0tUcVFyZmJoRlRZaTNlb1RXbWw0RTZ2NDMyRllLZmx2bjByN2NPc1RN?=
 =?utf-8?B?REs4VnBxZkpCa0JsTVVNbTZZWExraC9UQTEwaHo1ZW9zWWwxaXFNd1ZsNmVI?=
 =?utf-8?Q?zQwAfWMSH4zWMbGSpNoGPLxJq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28768b09-e8e8-425e-56ab-08dbd13266e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:04:20.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyMMavZFA4IZd5sbWszoG3Z+a6tDGfxeN4FUbVaRUabHb9Crt2pM3vwt7/QswvUXUNWM2cnz/Oq77cIBa6c2kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8525

On 19.10.2023 15:40, Nicola Vetrini wrote:
> These files should not conform to MISRA guidelines at the moment,
> therefore they are added to the exclusion list.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> These exclusions are automatically picked up by ECLAIR's automation
> to hide reports originating from these files.
> ---
>  docs/misra/exclude-list.json | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 575ed22a7f67..b2b4b9253615 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -145,6 +145,10 @@
>              "rel_path": "common/zstd/*",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "common/symbols-dummy.c",
> +            "comment": "The resulting code is not included in the final Xen binary, ignore for now"
> +        },
>          {
>              "rel_path": "crypto/*",
>              "comment": "Origin is external and documented in crypto/README.source"
> @@ -189,6 +193,14 @@
>              "rel_path": "include/acpi/acpixf.h",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +          "rel_path": "include/acpi/acexep.h",

Typo (include/acpi/acexcep.h)?

Jan

