Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541536523AD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 16:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467157.726178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eZm-0001JM-H1; Tue, 20 Dec 2022 15:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467157.726178; Tue, 20 Dec 2022 15:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eZm-0001HP-Cw; Tue, 20 Dec 2022 15:30:42 +0000
Received: by outflank-mailman (input) for mailman id 467157;
 Tue, 20 Dec 2022 15:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7eZl-0001HJ-4n
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 15:30:41 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41a26967-807b-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 16:30:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7501.eurprd04.prod.outlook.com (2603:10a6:102:ee::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 15:30:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 15:30:37 +0000
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
X-Inumbo-ID: 41a26967-807b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmj0UGw+Zl8Bd49LEo3WqJUgcpx9eQBA4L++UPtLQXfF/rCrmOICQ4WmARhc+sAewRp7h6Xn3MMA4f5Ic7rzWp3pt2Z5lZA/JGfsCb2VK/+aEcXccLG/MkfAKlTaTKaDuhJ7hsmk11iirmzf5QZ7jtvFlWMwEyp0mUIhpSd8AnpYxOtTSde3GNixBh+K/oj0OOb9nugIpi1sFyIW/M8b82o0uhkxUNMdM2PXfZkewzogd0d5PRvweTADA8NRUStDMLSGTax7JSHqGuhxa18Qjf585wBXM8Trr2pZEGoGaXHkJUuzqZ9Pd3wowub5Frg3R9cTFWfD0dw8WyPy9S6F2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG4D2LLEzs42rqBbjJxxg9IyrJ1yESnNwywZajMxsMo=;
 b=KR3BvufQkrDwdKAfFbbzBWi7vmX27u5p7iTj7PEYmwjFCXlswjTX8c55k3Vj/UOLK9SP/T8173xawhV5aLo6nWjR2F1KBmhtoAslvwgQS8cUPj82urUQSHsSj9JNoS/S8kayOS8XIeanpP0jNKCYHEfF2NRSJCv7IH0MTdNTTQOnXiDu1aeN0ygH/oK8ckBs0jH4Y9PmDrNaHdpFSdszgmJQJ6L11pstF0MgJA3OOZKNw0/IdCAX5LZHoxx0M2tXReAS2SaVSIHQ63UxovmD9VML99n4CBnon4vtyyfpztNHObwuT7rMzoXYO9+JQ26rOqnyyGkqjE8mXFt2xznHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG4D2LLEzs42rqBbjJxxg9IyrJ1yESnNwywZajMxsMo=;
 b=VtAoVvtpc3PmJnjhvJDh94BMPEh6kVGtvNy472iPWVRLVkn0nC0NdRdb0UbPsGYCVZUHqyhaT5ARz+8qXAcv6Ha+uTiZtwBUL6bweN3fmYpA5dhI4mZZjwzNRipmcctEpOjxtLtJ+IgWybVIZaZByH++WFviDYNXlk4loay2d5QDRVetScmQq5yDVl6jweEzc+IRWUnsO8cfIoiroNWKfzUpq967wVymMUvwvTiZEHb4liALm3gFemqN43G7G6/1wUcuMJr2yG/7f4yF8wAPKYzZfjriqT7dOTHEMnh/zpRKvQYEhgvJW/rS23W0PQ9OB2tlRHyT5r7GMB+wrmNSCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
Date: Tue, 20 Dec 2022 16:30:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-6-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 119453ae-5312-48ea-6f42-08dae29f251f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9tAd6SiffM8gxlFrJfsTF68wSMlJCWOy9THMfsnFMqIM7THqFMZlPVMXJx+bSxxzWN7cOfYfw3azh37OIk4PvGJAUaQC56ceIWAKqdgO/FpddN/WAx7YLFWVYz9M3m3/dUh0SC0bU78j8lW4dRJE5YGyVHMxfNMDd1CAS/ZbAB4yWjY6vhySo3K512ys6bdEvReTZo2X0Xt7LGt1X6f4JV5trH7UMXr5WijhLd/GhpQUQtMS0bIyY2ImHpkDQlPDXafiwtqhcROgXW/B4klD02lkyH78WOT8vKHiyx9GfI2pSI7S/XSAebVOH9LqMsu45VtFKy9UHj4Yv3xeXJ/EggwzyfC5yiqxqaYX/Ku1KfD4uKT8s0eIbSxJPG1yBSXdh8PgITOhmuBmqaO21JiJfBzqlhMRh9Y6VUMvZxYBmP1Wk0DU4TECZ2PHgae9OMsoNYP6xzNO/sUE9Yr7X9vrHDmIIxxS3b6rHr7M43HglP8KiDT7du6DIu6t31bgT9bNWQnEy0GhO1W8ugp/hp537Awaisz6nVIg0DlHD23EcwLaH14KUhcLIoWmrvoVVJc7RPJOdi1xfIx4g51EstuObU2pMHGBkseXgA/x2pK68H3Um1YWQ6yZD0HTmJRknfzZ8wT0YcPIMTcC64kWHFmClg/TDniDfddMKaS97d2sRjBA8qM7+ivWmsmWbOfCw2RHyV+x9di8zeHsYq4FWRZ3u5ho+Vuc+TZhPmE2i2EmdFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199015)(4326008)(8676002)(41300700001)(36756003)(38100700002)(83380400001)(5660300002)(8936002)(2906002)(6486002)(31686004)(6506007)(53546011)(6512007)(478600001)(316002)(6916009)(86362001)(54906003)(66476007)(66556008)(66946007)(26005)(186003)(2616005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NxYm50WTJMOGJkSVpJOHkwbzFtT2RkeVB4OWRVWTVuMEcvSEJHYWlycUd6?=
 =?utf-8?B?SmFCbVdONXA5dllkQzU0c3B4MzlvNEZnRHZsdjdKZ3prcTNyM2JLTWJNQ3p4?=
 =?utf-8?B?b2RKY3cvczZsOFBzQWxYVjMyVEprMExlRFhvYy9xdXNPQmJhTVlQdEZwZFpZ?=
 =?utf-8?B?R0NldW1QSjk5eVFJYUlIVzNCWTZPRHp2eVBlOVAyVm50UVVVRzRHdXFXRW8w?=
 =?utf-8?B?OVBaT1dZV3kxWk5CYzNrQkdnamxuZXFFemNqZzFxSnYxa1dRaE42SXVsSFZy?=
 =?utf-8?B?QUxZRWkwUHNLYzhaSC9YNmYrSFlzdm1kVFRmenlMaG0xOEZQUUZOVnhSMDh6?=
 =?utf-8?B?NzRHbElZc3V0MGo2OThsaU1WRFBMWmhPbkVpNk9IWXB6UGtoMVpBcE9yaUpS?=
 =?utf-8?B?Z3M1TG1lb0NUZnhnRDlURDZIRGRPYXUwSHhDVUVieCtOMGg0citkZ1VGeWd6?=
 =?utf-8?B?RWt0S3Zrb2NhRys1T0tWdlZsb2taeEdLYVVMcWxjS09scHhFR1RQOVJsQlly?=
 =?utf-8?B?anB4OFV1VWRtMzJFd3NxdGdSUlRrbytUSEdWNnd2RkIzVUFaa2ZxOCthTEcv?=
 =?utf-8?B?SDQ0V3B2N1FYMHl3RDFrZzZHREdmR1JsVGpPQ0xqZHRieHRsbnV4UGp4SkdT?=
 =?utf-8?B?eXFoQXQ3MVlKbFUrVFJQSWk1Y3lZQldtTmpLN3BzWVVmNVlzU3pnTTVCVG9H?=
 =?utf-8?B?Y2JCY2JzSS9vb3lvSGw5aVNJRVk3UUpOZnMybGZxMExGU2R6UmRqYUFhL0xM?=
 =?utf-8?B?WFdiNU5VSnJKb0RYdTh3aENibzZYcVU1M1VjVjlMM3liNlVYdFRUbHIxMStK?=
 =?utf-8?B?UlF2YU5ydm5pMTlxTUNObXQ0U1hibEVGOFJDdlU4NlZVb0dqazYwWUhucUxC?=
 =?utf-8?B?UUhiY0RxNFhDTWliTi9ZTUVJNDFkVUhtblVoL2F4Y2ZjNHZRZ25SY0xWcy80?=
 =?utf-8?B?NHpGcGdPSmRFTkZLcWNnQjFSOE4wamM3QW9CcjlXWE9oL2xXdkhlV0xkbTg3?=
 =?utf-8?B?eUNMdDRxbUE5VFF4bk1UOHNZaERFQWNHWjM0RlVjZHUwYVNOM3dlbTJKb3Jt?=
 =?utf-8?B?NjhoeS9JOGQyeDVtOUFyRytJLzkxN3JUdVh6NmdiL24xU294N3JjNTJ2VFd3?=
 =?utf-8?B?YjFUd0ZMdlJ5aFpZQUY1TzFvU2YwQVZmMGxUSHVOR3BiZDR4ZUQ3Y2VjSTNZ?=
 =?utf-8?B?YnZnRUw1ekozcmIwc0t3WHd6dFFjUmcrUmEvN1g5ZlVKQWRvQ1ZldXhNWHV3?=
 =?utf-8?B?d3FtSzNRWHVoTzNRRDRzL1NZUzQwWGhSUjlqKzdBWTYzZEp0blpRcUdtWFk4?=
 =?utf-8?B?R1JpQnNwTDdCNk5MLzRxMGh6akFVdEVwcGVHd2tyc3VVbG9kSldrcjhidWFw?=
 =?utf-8?B?bGd0QUVyRHRHSGxQMDk4NGkxTmtsWlFPaGw4YURjNlRFUHVqajdLNzJKMk9w?=
 =?utf-8?B?RDZqZmJ5Y0JBN3JhczZQTjl4MEtRcXczWm5FWHRHczdtNlRrNTFFb2s0ZnJD?=
 =?utf-8?B?dndxeEs0ZHUvbmhOUjZOWGFObXlkM3d0eEVRU1d5cVVGbTRJOEdpbWtzS2tJ?=
 =?utf-8?B?cFk3SHk5d09kUHFLMzlFTVEzem8xSzUxcnd1ZEpwNTVXeEFnM0VWbU1KZEsr?=
 =?utf-8?B?U2w5dzZGV244LytIRmxvYjNLQm1TU1R1UGNvdFRKRkwra1EyRGdxTjlRYW83?=
 =?utf-8?B?cjdUZjhwSk9ubk05b0FmNStFUHlYK3FzWWFQbzB2NVZDTm9oTEVXYWhaNEE4?=
 =?utf-8?B?bmcybUNnMXJRK0tTV3dQSXlxTnVFRmJJM0FBRThrTWhQZmNDcXdndzRFcFg0?=
 =?utf-8?B?ZjJGQmJTZXJ6Tjg3R0d2VFI2UTRKazAxQVFabWxNdjhKbDgrVXZRL2RzN1Ez?=
 =?utf-8?B?NDc2ZmVMRm42dkFrTzdhMitDRVJMZHlqa1JoWHYxeVBrVzVmcGxjL1V6RGhO?=
 =?utf-8?B?WlhSMnNZU2ZpamtscnFldUpNVWhlaFFoOTBLVHllZDF5RVlGaFkvc0l6d0lC?=
 =?utf-8?B?RmRVZHZ6MWxzNEZxK3ovMFF3ZFVzN1ZSMGFvbUVRaThqQ1JONlphQytCOXZ4?=
 =?utf-8?B?V1VMTzZEdjVlY3JpeFpnTXJRNjljYXVqVXRSOCsxNFFnWElJZFljbDJ5WnVq?=
 =?utf-8?Q?Bo7Wke4kapXy9yY97nDP7s1um?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119453ae-5312-48ea-6f42-08dae29f251f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 15:30:37.7934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML7BUKIpPkG/YSXV5D0GRukfmkg+pALb2pAYdBMqSoMaf6k7OLsFuXRrGvuPAyu85xicdN3wuVKnQQYijW3iDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7501

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> This avoids the assumption that boot pages are in the direct map.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
>  		return;
>  	}
>  	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
> -	acpi_slit = mfn_to_virt(mfn_x(mfn));
> +	acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));

... with the increased use of vmap space the VA range used will need
growing. And that's perhaps better done ahead of time than late.

> +	BUG_ON(!acpi_slit);

Similarly relevant for the earlier patch: It would be nice if boot
failure for optional things like NUMA data could be avoided. But I
understand this is somewhat orthogonal to this series (the more that
alloc_boot_pages() itself is also affected). Yet not entirely so,
since previously there was no mapping failure possible here.

Jan

