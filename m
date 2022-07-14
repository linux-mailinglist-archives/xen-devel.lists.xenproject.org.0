Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CC574A8A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367293.598382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvzV-0003MH-BL; Thu, 14 Jul 2022 10:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367293.598382; Thu, 14 Jul 2022 10:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvzV-0003Jj-8T; Thu, 14 Jul 2022 10:22:41 +0000
Received: by outflank-mailman (input) for mailman id 367293;
 Thu, 14 Jul 2022 10:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBvzT-0002vg-Sb
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:22:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2f8c746-035e-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 12:22:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7133.eurprd04.prod.outlook.com (2603:10a6:800:126::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 10:22:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 10:22:37 +0000
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
X-Inumbo-ID: e2f8c746-035e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G96STHvvt+V3ZJDvdHwpkHE+uCVngx+seSLqVAUN9rAe9gsO05BNLRPs5mnFAT69V98kBYKtlGFpsktIvxlXBEYYIjPjnHqen2zvbDe50eBfxclzjdmxG3eXzYPzGRKU5h4okwvvT7JqyRAPJPB2m9C6peeeiIjzUdZ59ZmJaSDaPKb9CXEoIqRnxqmBJgNOKJ1/g1e0L8Zgq4KhW26CBxXEWOONfqKr4Fqp0AdGocTVaRzgc0/7YXel9/3RtIAp8E5gToinjptjhNj+X8GKAnbjAlanQv7CDUV4zYL17Ieabj6svYkg91dcdRNQye4Bxgjzp7pxo+YMzR+M0YPIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8OpmW4MgrVn+Wl2J7lABTGUu0w2yPM03XOTyhPALbw=;
 b=mzqpuLbpKaUPKOzdycKm2zp69LhzSUHwwy/6EeeMXkzTjrsBMDuL03lrhWerPFQoRx6ehesRHziB42kB4Zv2oNiqfW1/YUBre6TEaAinoaSLrnoVJg2OFJ9Lr/ywyB4e+hML0RVZcJXQ4d72xAWJA+aLdUx7A0G/tHDEfxy6+8FzE92e1wmSKq9s1t4eneu0mJM1Vbz0xbuxp31WRgn5qh23KxCA0AvehHIgdiIMcDvKM88YwatzovKX24iT+HBpJcic/XOWQ/MJDIAwvtmAS7tjzlKOaMSgUFEdmHyV36GNk7VBl62pPdG3ZKRC0Va+CssP18XU80Es5C+0FMSYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8OpmW4MgrVn+Wl2J7lABTGUu0w2yPM03XOTyhPALbw=;
 b=K7YtrtQsIX0xDuLCiAKVJ0ZKcxirbgJlyZ120W4LkYPcRaqDx3YPr8p2MvFdCcIQt3i7SEuRF1aeb1m4vuTTArl1F746h1w4YS3M6nMGypGj7t3HO+VrOFSb1rildDWjF5qx/MURLKehldfTWCOhvWGKXesGqdUIZ5o9EGsJD6ShfnKYmPg2tlaE2RKh//vzhOudGh2IRqUqobKa4KbXVTBSzXj5yBYKQLPK4McGBIRQGdqe6bTLNsVOkPDMcaOOhwlsaU2MN6OYoRehiA73G2b0rdZNqAfnOS4nOU0Xmfc/QRkDHAXSpLUZUS1Pucm88d0sEwfdZ1OSPamof2CsyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00c64c2e-a007-8188-469e-08e8c8cd25e1@suse.com>
Date: Thu, 14 Jul 2022 12:22:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] IOMMU/AMD: wire common device reserved memory API
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <457056cbc6dcc00958b1f4e0cad35121e0cd1557.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <457056cbc6dcc00958b1f4e0cad35121e0cd1557.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P251CA0004.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c3746ed-f069-4732-0bb6-08da6582c685
X-MS-TrafficTypeDiagnostic: VI1PR04MB7133:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kv3eMj1OlrBcMj6jldRYK//DvKwfYKYvPsOZmtoWYOHMbkSTIfrHR0OOh47GqXm+QdyAZrq22mKnBdMuEKKLkUI0MowZ8KGZiEICzuK9Igfu6952oJv/jOa0QGVsT4jcD/FM2yL+SgwJZV0QQC9dupCZuU3c+TGg8KK908/yxgEM64jUArkW4PZcfDLc2VPKs1C0WsvdQrTz8lmlGgi2g1lponIAODRK97eSZX5+3BGn07o/msZczdztNJl7bzKMze++rvWA7UAnc4HLUi6LkpkO+IxYzf17gjsNK9+HAgu63+HGc1o++4hTX4vpe/fyn161vihz9OHzcgcz28wQXio+7unWaTebdseyO1oKiZ+mqyYE2zuHGk9wdJjje0ME1MnBd0cK5sWEWSHP5JvMTx4DnMhaB35MrQlKl/y8+/5la6imlDBuUpYNfQQkCzE5OJCCyLOS//RHjlysXMU2gZzY+RVnxQdx9yIFQ59psssKYU1YyeKfRnLcbsVFDuOITtoK1TBdJQNoDzdv001NH1yWhpiIEwIFuPpfHNwP+Jn9Z9XYwyZ+mcHAL4wtKgT0GLWbreu22kouVcTZIGlMTnq4Vom/3UNh6UdkfuI6PMUwdG2tG3kIsHbPHJwYj+QFLmZKHcgI/jgWO9Zoaj+EdEL3TA/3zcq34yhdiDJ/N3SkemIf2kDi2oQTTDM7tgadrnCrEBqHnDk7Ht4NgP1fpahLHNqwYhryIiHgnNIT8MeaH+Byh0FWqvZZl4v3Zj5wn8urmSIbhljJBaf4khEjltqHa4YELIQ9uAqp84wnd583HQIJ0nK2G+SmetRNLD3qW1BnA4MxRVwkh/M3HTyCV0Yjl77a8YWpCfUpgSbqFXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(376002)(39860400002)(346002)(366004)(26005)(6512007)(316002)(2616005)(6916009)(31696002)(6486002)(41300700001)(53546011)(478600001)(86362001)(6506007)(38100700002)(186003)(83380400001)(66574015)(5660300002)(36756003)(66476007)(8936002)(66556008)(31686004)(66946007)(2906002)(4744005)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJDWVdkREFUTzZpWlNQL21iMnhGMkhwcVhGeVJrd0FYM0diUitlTkVOcW5T?=
 =?utf-8?B?UUFUNmNEWUJHenN5VGhEMWpuOEhDU1AvZEJNT2Z2Vm9TU25JK1NNbnIvc25B?=
 =?utf-8?B?QkhwZDljTW9sR2lHUVRtWnMxTWEyRVBqUERtL2xSa2h1SEpqOGh0VVlPTURX?=
 =?utf-8?B?TGdKUkpFVEdEYmpwdVRxdk1KMkxqUGVXeGt3TVcvS2tRL3pmRFRQVXY4T3h1?=
 =?utf-8?B?ejh1bHptVnB5Z01pa3RyV3JJUmtXUnlmUXFUVitQRlVZSHRtd2lVV2FWRzV5?=
 =?utf-8?B?dGZ0VHRLaG9CTzFmK3dmaDJ4K1dRb2lweHhMdlJ5STBrSUhMQ3FQWWdUamdX?=
 =?utf-8?B?L0I4UUlnT2J2eVpOa21BQWJOZS91bTJ5Rng2T1Rhd2syWjkzSC9oSmVldWNH?=
 =?utf-8?B?UWxha2NiUVF0aWw4SmFib0lTeXppYzVYOXkzcW9LMXYvYlJTMXoxRkFINGJP?=
 =?utf-8?B?S0hxMUNQM1k2RzNyYjBaNWxFSGlub05mczJWZlc2QmhvY0xkOXJCZHRVVFp6?=
 =?utf-8?B?bU5JTVhpNWlzUjk2N3ZVL1NGbFRDdnVmNk1TVUNQK2FrS1NxQnRKQnRqSDhV?=
 =?utf-8?B?Q2ppMGY3QmI1UFJwNFg0SmlCeUhmaDdJVkZXWWY5OW9Xd2E4Yjk5MExIUnhB?=
 =?utf-8?B?WEFHNTRsY2k3UjBLblh1N2F2Rk5FMGJiOHhDRXlNRXRIUnlOckFQeTJsTXJi?=
 =?utf-8?B?OTNMbHkrdTg4UENUUDU3b09uV3VRVEN1ZmFjQ3pmMXpYdTl5dmtVcUM1TTFy?=
 =?utf-8?B?ZnhNUFRpQXo1YUY4eFl0WG5JWXRMWHU3cHdVR1pUcS9UT2FCR04rUjRpTm1o?=
 =?utf-8?B?Ym5aVHdFclpkMXBURFpUSmlUOFdXNHlhbUR4WlZXbk85a2hHVXVBSUh5aHV4?=
 =?utf-8?B?R2FnZmliYWo5d2Z2Y1ZmRW11dTNrWVoxL2VsMS80SzR2YzAvUm5xVDhlb2FR?=
 =?utf-8?B?VnB0bWx4MFhXOVJTaXN2VmlwODR4VlVMSGxlNjBnTEZBRG9GOE5KRW0xNGpU?=
 =?utf-8?B?eG5aN2pWazRxRHcwcGFjWnFjdC9VTFF0eFBDNmxCQVpxZjdDaDFBVCtaTXoz?=
 =?utf-8?B?L05TM3p4b0RXUUxQZWVmR0tNb1pEZ1A0WUhIaGZtT0JHczZheGljUjdOQnNi?=
 =?utf-8?B?Sk5OR1RDREcvS091L0VXejhEbHI2RzRNdUpxdWl2Z3NzRDBzU2l0WitYQmlq?=
 =?utf-8?B?bnlZbkpZZ3M4VWIrNWRaeTRWcVlFUUxqYSsxNWtIc0ZjUUJVbDVPRW1ONnBv?=
 =?utf-8?B?eTlzTCtTUStZWG9rVW8yRE5EMUhIbWFhNnlkTkYyd0JaNlVMOFZVOFBWTjg4?=
 =?utf-8?B?ZHFmd3JYdFEzQnhmdDBlbkZPNGVhZjU4bmlkNmJ1dVRTM2loaXhkSXF5L3BQ?=
 =?utf-8?B?a2dvNm4yTnk2K3g4Zi9BVHJzbHhLdkx4LzRhWVJONGxiakpnUDQ0RnZCQm5u?=
 =?utf-8?B?RzRLaTRKZzVHeXZsMytnWGRObFB2Ny9aaGJIYnBOdDBSM3ZaUHE3Q2JnSG1S?=
 =?utf-8?B?QmplR1gzR0NjMURHcDkzZEQzRHZBZVE0VldWOVk3cWk2Y3huTWxvVHNGVWQv?=
 =?utf-8?B?RVgvNnRGRU0xWHlyNFZodm5PUzVzZytOaDg5NUJBc1lNWi9pOG1rNnJuNkpG?=
 =?utf-8?B?QXFGOGljT0xSMzFoSkhad2dYcWtSaXJpOEc3SVlUVkJjUHBuay9DM1hQM0Fl?=
 =?utf-8?B?ZExBbXlsNVlrUmE4dlJLQ2JQWStZcmJqOXkwRHV3RnFLelREcG12SjM1OURW?=
 =?utf-8?B?U1dGaXlGekVmSkJGcStNQ3QxbmROM3FTWmlGbUxYL1c4a0I0SnN3NUd3OWhF?=
 =?utf-8?B?UnpDTXBWUk1oL0NWNFMvd2EwZ1RsYkxLZ3JmR094aTlMRGM1R2hCUDV1V0pp?=
 =?utf-8?B?YjFTbXNKNnhWQndrKzhTczR5N1BPL2gwU0k0eGVNcm5JK3A1dHZRNGgzZTlj?=
 =?utf-8?B?KzE1UVdiUTB0WXVQcCtBZGpvV1VKQkk4Z0VjQ1k3Z1N1cFlGZ29ZWFZRZG9r?=
 =?utf-8?B?NjdOT004OUJyaFhJYVlseWlqYzhZdnJaelluczlNVXArekZzR2lHSFM0NUVW?=
 =?utf-8?B?UmJtellmenhTekZkWVhyaUQyOERRQmhtVEYxNDB0SEVjSi9Ha01saVd3V1lY?=
 =?utf-8?Q?y3NsimJ8YPEa2ZL5Vf2H8k1SM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3746ed-f069-4732-0bb6-08da6582c685
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:22:37.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMdmmPhkMAAE6AETWXPAP4wLBkoh8CHDs7jmDUTj8tocXooAqFbc9KrQ1gDV7uD/DAdg/GUwDTFRwAmqLkrfsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -1078,6 +1078,20 @@ static inline bool_t is_ivmd_block(u8 type)
>              type == ACPI_IVRS_TYPE_MEMORY_IOMMU);
>  }
>  
> +static int __init cf_check add_one_extra_ivmd(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
> +{
> +    struct acpi_ivrs_memory ivmd;
> +
> +    ivmd.start_address = start << PAGE_SHIFT;
> +    ivmd.memory_length = nr << PAGE_SHIFT;

Aren't these at risk of truncation on 32-bit architectures? We have
suitable wrappers for such conversions, avoiding such issues.

> +    ivmd.header.flags = ACPI_IVMD_UNITY |
> +                        ACPI_IVMD_READ | ACPI_IVMD_WRITE;
> +    ivmd.header.length = sizeof(ivmd);
> +    ivmd.header.device_id = id;
> +    ivmd.header.type = ACPI_IVRS_TYPE_MEMORY_ONE;

Please make these the variable's initializer.

Jan

