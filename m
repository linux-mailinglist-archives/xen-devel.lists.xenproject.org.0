Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BE4D3137
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 15:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287888.488171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxZE-0006y3-92; Wed, 09 Mar 2022 14:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287888.488171; Wed, 09 Mar 2022 14:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxZE-0006vX-5N; Wed, 09 Mar 2022 14:45:32 +0000
Received: by outflank-mailman (input) for mailman id 287888;
 Wed, 09 Mar 2022 14:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRxZC-0006vQ-FS
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 14:45:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90820e00-9fb7-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 15:45:29 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-EFg7FMO2NBO-dO3E8qdqDg-1; Wed, 09 Mar 2022 15:45:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4293.eurprd04.prod.outlook.com (2603:10a6:209:42::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 14:45:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:45:26 +0000
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
X-Inumbo-ID: 90820e00-9fb7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646837129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8FjfXobxanBccpWmkWYP1b5RdC8oUZVydx3gvwbpUk=;
	b=brGSJBqAFAAeRFSP1sfxhj77aBGwu0m0ZPsRqxrAG4XvDTGLUqDYDfgGuKH1aerDb+LNrR
	Atlc2NyfHjOFfdN/QM9JDrH3wvFJ2+qqLyWrneJY1GjYFlqFbP36FrCxnKevV7vyP6612O
	2k4xaMLr/zXcgp5J+PnRgOIUexplX4A=
X-MC-Unique: EFg7FMO2NBO-dO3E8qdqDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtaOlNLMH8ilsewrf2j88xFLE8WaAhKg2mAQo5T04/CVlQQZboPSQa6JkUquI6ki9CLrd9XkusNz0XV7ceYKJCo0OQG1Evds73PMSaV4KjCGL6etuzaWfqrTspQwygVDQ3573vZFZorQ9aWxF/Tm3j6oV1WRM5Fmn9IF1R073ECneno49qcA+1va+GARBjBgMwEQmbcmGpjAp2pvQZknI0m10egbRgCAnsZIUux9CQwJwQBi7hK1CJbqPbwbsHWsLWnXBJIOtBBklu9GINnEClIE5IqKyLmBJiE9DrZqRe6RxLkOHY54+i6ITjlGxXJDHJwyM+vi3oD+BtPiVCUsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8FjfXobxanBccpWmkWYP1b5RdC8oUZVydx3gvwbpUk=;
 b=d0hm5wxLZGLjWW4Cd6zvBhPkjiqX8V/tlPZS1hYpHgjbcB4PR96DwuLkRvUVScaF2MYuheI5H5XX46fxN0DlOSUeZ9EwIAuat5aNMy/gwRxxzUs5m70Ww1t1IdriWuSQ7jygQJdfRNCOdNQj6ufYgY2IOAuHHCxeRC580SM9F8zTmAWtaXGN41zCDKw8VgoCdCgEYWIPCHWkt8eFJNFFrXTOwCJo4drcMDaVuCLQVgr4REyiAccLyeBNZBTJwZJ7/nMkGNObc2MYE/VbOSsNuO1vK7UzIIRVaB/Wj0NYDJVwcc9AnzKAP+4BMILwAvmrfSqeFJ1JWc8xWOpBF8bGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <438cd24f-cbe4-5406-ab7f-3a6e599907c3@suse.com>
Date: Wed, 9 Mar 2022 15:45:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 20/36] xen/common: introduce buddy required reservation
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-21-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-21-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0361.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 542c362a-910d-4162-806d-08da01db72eb
X-MS-TrafficTypeDiagnostic: AM6PR04MB4293:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4293C45A37EF6FFC49156AC1B30A9@AM6PR04MB4293.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fwqMNMxekA7joUZz+KjWJRdxMOiqpxL8f6AJcbwa/kaFBTdpGICJzVonbAWdDWgLYPpHFoiLbVAP0TM7Ca5kJikurVJRFAVUX+GKlbzULGSnCJfB/bVCQrSUM0H7zOAa5S/FuHKBYklHP8Pi0yd0zLCAmr/EJck3/TFRMz54dG9GFYXY6omARr1VrRASs61THkBx3MLmIqYgKjLGMbkQwJtCI0lrm+vsZg7VLI69qrEd5rfrdoFVOZMpkIM5JZwb+iekj/3tM2OjlIaBh9jy4cmma6fs1n9PGlkydPwodYCwOZE9getzMYy6PhPdg08+Z/BytBv9E13yoLl8CjhDIMZjueUoSwD62L/Wk5SncWQCP5X1pecFao14x94j6YBVmmoWtaUGQ2uVtWFt78PT+vWeyZcYX3BZr671PMU0U6pwmUwIwo3V9UujNkBa5My8QfmaDg7NHXenGJnWjeyLctDjzxD73v++AWGkoOD0Oth31USZnlTzCtHaWT/V1ATybaOTTnW9PILdnR3OQIodWmzMaieTaLlaiAXUYVHYsS5G5gjcKOuWl5uCLpPvDTNNxQTyvJ0NVWfc+IOpLiYPsx47xf46rUsxTRoZlne4GRyGC33Ve2++a8UHnN23jN+tq104TqKVYf0vNbgjtjwkfW5Wxs6ZaK1UakBKCzYpSKsPB9futxUFfSMFKI4+JqA6DWS8hkiVtbISRXtAHcGeViOLd/tGhe46Fk8QRskme0VPbUqFzIJAYQDWK7gvTB6I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(2616005)(508600001)(186003)(6512007)(6506007)(4326008)(66946007)(86362001)(31686004)(53546011)(31696002)(5660300002)(6486002)(36756003)(54906003)(8936002)(7416002)(8676002)(2906002)(66476007)(66556008)(38100700002)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVVTM3kzVWorQ245ZlJiMWpXT2lVUC8veG5XOGM1bGc1Z2c4NlMxbTg2MFVT?=
 =?utf-8?B?c00wdERaTFZ2VnRaK3diNnp6cHlEZkQzaTliL1NJWi9DTUM5WTgxK3hqTlhN?=
 =?utf-8?B?SC8wMHloWmZ6T2VQelBRNlFJcExQVE5TQk9Yak5WR090cEJIZ3ZBSzV5Mmt1?=
 =?utf-8?B?NDc1b25ITWRNdVl2TFdvaU10d1Y0alJZNVZaaFZxR0l5S0VTVW9vUFdMRldr?=
 =?utf-8?B?RXpIYmVzZ0NVM0Y2dmVrVFVrcFczUHprd3pVb0RKV3NLSy9yN2wvamkxUmI1?=
 =?utf-8?B?SzlGbVdYNWFMcnlHRHFPbHZNL3ZBYUVzQ0FLMndUeWJsTEpSbzVsWHUzWG1h?=
 =?utf-8?B?NUdXUjVFTzhUdlJlUXhSY2doV0F5SFlNdVdQNkw5UjVpSWdsenFvcGozcHZa?=
 =?utf-8?B?TGZUV3p2aG9ja2VUMlVtemUxd2hUOG5wemVHU0t2UURNa2MwbXRJdDNMVVNT?=
 =?utf-8?B?NVBQOWtZTjNrVnQ2VGh6bllMdjVkN2FseFZsTW9ZRWlLTXpRMWY4RnQyNGNS?=
 =?utf-8?B?bzJIL1pHakJ3UzhzbWJpSkZCTHpHbG9HVmdIcWlaT0xDLy9ORnJzRUMzOFVR?=
 =?utf-8?B?R0x0T2NGUXZWL0M4SGZpZWRhQ1FFSUxtT1ZPTEw1ZHRmSzhDRXpkNFVZbkN1?=
 =?utf-8?B?dkk4WmFnVHIrak5DOXBxaGZvV1dQYTNDTjlTNHMyWU5KRmx5SzRCZ25JdEtz?=
 =?utf-8?B?YjNVckJSdHpQMFVRTC9ScUtVYmo1WnR3d29NYW0xSjNzT2hYK0hwM2hJRlFq?=
 =?utf-8?B?dGwwbFZWMkxNR2tGa2VxdEUxMFN4aDNDZnBmRnYrU0ZQb21PQ1FFK2tEUkc2?=
 =?utf-8?B?M2FTU1AwZ0pzL01WTWJnVk42WVZRUWUvVUt0MWswellWakduMndYK0wzRmln?=
 =?utf-8?B?YlJ5dEgrbEs0alQydEVDVTF1cVY4eTBFNGdEMHRHTldjRG5VWnRoN2VXOXVY?=
 =?utf-8?B?S0RHSGJaOHk5NFREZjlGdGQrb2hBREU2RmZQekNvZWtGMkdQM01IZVVoaHZR?=
 =?utf-8?B?SVhoNzNvWk5mV3p0cFk0ZEtMaktnaUJLbnEwaHpQQ2N3a2NvSXAraXhaTmJs?=
 =?utf-8?B?YmZqc0lJSmdSY3d4MUlmQldwb1Rhb3d2VXFTMWNzVGdQNlRCN2tNd1JuUjlZ?=
 =?utf-8?B?RWNucHdnTVlDKzkwY1huZUlJd29wUXhCdHlZek1YakVRNnhBblFrbmlJWG1i?=
 =?utf-8?B?dFhUQjZLTDhLY1ZocDFKeDFUK2J4TjNpcnRLMG9Fc2lrWCtVMHd2NFAvMUZP?=
 =?utf-8?B?TGdpL1plcHpvZzJWRXNNcVYycHFyVEJFS0krMDZWM05JYVdYNWhHaFJUc01L?=
 =?utf-8?B?QXJ4RVNxZ0g5bC83Unhid0VncGNCVysvSThMYllFVXFaMktGa2RMWW5UdnBT?=
 =?utf-8?B?M200MTVEaStWRlJsNUpnQlV4YmpyRFNDbENEbTQ2V3B4TEN5bWVGdDVaNXU0?=
 =?utf-8?B?Y1QzdklZUU0vSitWT1l1S2tGYUs1dllHcWJoekJhcEJnY0J3WHlUa085SlpW?=
 =?utf-8?B?Z0ZncEI5Zkx1MVNNR29CdS85c1BuUHZtTDBBWEVOSzl0SHd0TVNkZ1RGTVhK?=
 =?utf-8?B?K1E3TlBjMFRJa0VQaHd5cTdLN0hycWNGbllxZnFQck1Nd3ZXOWxNcjRlVURz?=
 =?utf-8?B?dEZYb1k2MCtSRU9JTllyMmRhc3hKdEJsVnZnZTdWY05QYUlZRVBCZkd4V3FX?=
 =?utf-8?B?enlCalNwZWQvTzNLUXg2ekRUU0FESnZ3VXlrWXNJMjAzT3BCMlYzZ1QvN0o2?=
 =?utf-8?B?eDVSUWVsV2ZiQkI2WlBna2k3K0pnRTI1MGVIZDR3NDg2RjFlWlFKR2lpRlMw?=
 =?utf-8?B?OVpxc21SUDNDVDM0d3l0SlN1NTdiMUhVSWhQZUtlQkszclZTVWdLUGFTWVNr?=
 =?utf-8?B?L1RQRUFaQWRtR2tnZUgxODY1dmpJSnJqd1VpdklYdk1KZUdDU2pNRTZocnNF?=
 =?utf-8?B?ZG1zeFozcHNBZmVHQ2NKN1dUa2YyQmRLQWI4QUpDYXhFV0pLUVlhZlFtSU4r?=
 =?utf-8?B?ZDVsOE8wODZQQXZMSnFGYXhET3plbmswNkJ4bWd6YSthT1o3aHBScGdVSVVt?=
 =?utf-8?B?elBEMXZoUTlvdEFlMDd6VTgremd3dVhhb0NhdGhkbTZBV0JKcjFMekZORU1B?=
 =?utf-8?B?WWhtVVpiS0tvSmJPdU1wVldDRjQ2aXU5QjAyNGpxM05RQ2RvNkY3N1ZUNGZr?=
 =?utf-8?Q?BJF9NKPsUatczDP4aI913ZI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542c362a-910d-4162-806d-08da01db72eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 14:45:26.5254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd552zK+an56D1Clw7cC+dlMpW41CW+dSFlmmUqgl3Y3VqISZDuiJoR82GSWkFeGjPlkudqTp1DuyCFoLMhYtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4293

On 04.03.2022 18:46, Marco Solieri wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -230,6 +230,13 @@ static bool __read_mostly scrub_debug;
>  #define scrub_debug    false
>  #endif
>  
> +#ifdef CONFIG_COLORING
> +/* Minimum size required for buddy allocator to work with colored one */
> +unsigned long buddy_required_size __read_mostly = MB(64);
> +#else
> +unsigned long buddy_required_size __read_mostly = 0;
> +#endif

Please avoid such redundancy when possible. Here perhaps easiest
by having the value come from Kconfig. By giving that separate
option a prompt, it would even become configurable at build time.

> @@ -678,6 +685,13 @@ static void dump_col_heap(unsigned char key)
>  
>      printk("Total number of pages: %lu\n", total_avail_col_pages);
>  }
> +static int __init parse_buddy_required_size(const char *s)
> +{
> +    buddy_required_size = simple_strtoull(s, &s, 0);
> +
> +    return *s ? -EINVAL : 0;
> +}
> +custom_param("buddy_size", parse_buddy_required_size);

Why not integer_param() or, even better fitting the purpose,
size_param()? Also (I may have said so elsewhere already) please
prefer - over _ in new command line option names. And of course
the name needs to be unambiguous enough for it to be easy to
associate the purpose.

Jan


