Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC72506786
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307909.523294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjwq-0002O0-3F; Tue, 19 Apr 2022 09:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307909.523294; Tue, 19 Apr 2022 09:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjwp-0002M0-W5; Tue, 19 Apr 2022 09:14:59 +0000
Received: by outflank-mailman (input) for mailman id 307909;
 Tue, 19 Apr 2022 09:14:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngjwo-0002Lk-7s
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:14:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7b727a-bfc1-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 11:14:57 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-2dumpEFVNkCEXD-E-xUnVw-1; Tue, 19 Apr 2022 11:14:53 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB9125.eurprd04.prod.outlook.com (2603:10a6:20b:448::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:14:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:14:52 +0000
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
X-Inumbo-ID: 2e7b727a-bfc1-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650359697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GkGb3tsZKp7cwVLodyek/nmMqvzXVknfmvXj7A655g=;
	b=I9f9RcRO86m9/cgQC4sXT9j3bZfsfKEfq6/LflWq2w/P62/uOaMNbbg6p2Ku2+/YL0RTuw
	hpceZ85D3zbPNnj+j6mFWwfbEYdNkdT7gg3ZUQLa5/PwwoqOrFVg4zcf3+0G68BWRQq6rs
	Bb+TUNy+zZhcNDkDdj7cTsv240i4Xgo=
X-MC-Unique: 2dumpEFVNkCEXD-E-xUnVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlEdzF+LIINjmbQq9xjEExf6mv15DxqxnRTMht6+onwslCljVhSJzedWEpUgNoORvEBEcLcMG0MYIzd83QbVdPmvoYdzPtFMIes3hOZzysn75bCiuL7RLEaDL5jGTWILETfnhREtp+290Pyu5xNl4BtoHz+/N2fGCJjzQYcyti4xUDjDGSFo8kkCba6huq7ZdNwhJzRSvba2nKEy+uCgPuO3rFcOtd1Q9XI4GC86YiiRGFwIviJR1rrTVVNY77Iqg6jdc2egXUggcO7micF2pRYCYKMXHb6vJc3LqVt/rf1GiqRifw4v6KpDBKwN2/muyodjBfBl7eQhuc3oibh5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GkGb3tsZKp7cwVLodyek/nmMqvzXVknfmvXj7A655g=;
 b=AY6AyTrFvfcwBaiN1C2Fqh5dV+N4vryccn/+uFnk3GuBogX2PkT1J4TWj6hBl9m7TMmj4QpDVHe4DPQal+WVXMao2FKbHi4dGpH9F0w6Bx2dhEQ4LP0kWd7GbW6l8Qnb+ZBgT5XfiOrBS2QzA2HiggOwYhgJh/ZkueYhPv4DMbC0sl2fCbPsICRjYy3LtGBs/FVZcsQw6P1eLetINkcR4wuwtoB6hUrbaPuP+Otqkga6dIU+y7uMFh8B3BE0kFjrWMPiUxDSLBSjuYZS465ZdEdS84bWCnUbDVU4/R0OTNz83vEY30fZf0tEa0qPjgxDytochG0OkEW2ipFPQbL4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c204a98a-2988-b85e-20e7-a77e77e6f39a@suse.com>
Date: Tue, 19 Apr 2022 11:14:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 6/6] xen/arm: retrieve reserved pages on
 populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418122251.3583049-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0065.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ebc6014-38ec-4fa7-accc-08da21e50fe8
X-MS-TrafficTypeDiagnostic: AS8PR04MB9125:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB91256FF38359B68FA790CA11B3F29@AS8PR04MB9125.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WeS5Gucn9Wcf/ThNXhcgr+snlZxyHV0zZ0XBnnnnr8LWm7hRBIfQSWcYFwxSSquiCFznVRlMx8xtkZiZjZiKvwt3AMn/V3mZ0/Z6DRRHTbWoemCnZtTp7o9eqa0wneEcw0+wIhnJWOwr4rbHtmANiMVDGcfJ0t57Q6U2O6DdQVMOstPhnRnytc5VY5ASi0ZZ7JmE0hYfc3bOfduIdaOuSEYGsiy5jalpBinGYvp65eUsme3Hqljw//Kbt6fYZJPihcose2MHD+DW5iIPzXjRug5ObqqeKFB5l+yTfWWgMxPH4k53l9o2FbSzo8x96m3n4Ij+M1wNHH2R2eCcP2yK3OEpFKtNXHIO7WHY247eKuRt6ZvcyrcpKslqnxB5lgUaGNBFpKuMguSIXP1+x1bp4Q7/SEfJA6ZkW7dfasRU3yMnRt3xelFY/7BFwkG6aqB5TSiJtdG5LK+hY8jrMlOwdkBsyY/5kv/5BgmGWb6iUqwclF9RbppWG4gYOecKDD+0lx1xPMm1PKRLSShCZP9t5Viu7ew4AGHW548NMmB0Y3nTahJHomiHmeuZDc/r5Ui8EOzTEBK22wuVJaUHHcxKApfxtHWnnqN5Hv9yMSoiqT25P3VrgSuCRpmAg3/FCpqRdFZTOy1q0q59wN/Zn62hxut2++2GmyHDjmp5XaJkcVabvSSizGxclRfR1FGx+VA1VqbbblIkYsg56lZ5vdq752r68pUAkC6HYvixDqoW1jw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66476007)(508600001)(5660300002)(53546011)(6506007)(6486002)(31696002)(86362001)(6512007)(26005)(2616005)(186003)(38100700002)(8676002)(66556008)(6916009)(4326008)(316002)(54906003)(36756003)(31686004)(66946007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXgyQnkvYXBVM0pvWVVtaUNxT2xhMlNrQmdGbWZRY0k4Z0tiZ2Q0OUdRWHF4?=
 =?utf-8?B?alB3dTZ2SU15bmVRRU92YVViY3BIMUJVWFNMWTRvamxvSWdRZFh5bmRmd0Jj?=
 =?utf-8?B?NWlaZ0RnbmtJZGZiT0prL1o1WWNwNWExL0JVQjR4bjV5VFZoMml4QmYxVGJQ?=
 =?utf-8?B?UjNuTWpyL2d6Q0gvSGRmS0hWQkZRS0pVS2hnVTNnVFhQbWVDdVZFdjVCcTZk?=
 =?utf-8?B?dGZteDRhNWM0ZTE3cUJHQU0zY2pHZEdsY20xTWNxNWNKNnhoYktoQ2NHalp4?=
 =?utf-8?B?TWRkMTdNcWN1OFJKeEsxaStzSStnS2htSHNiS1plQWd5VXBSY29abTE3bXZj?=
 =?utf-8?B?L01SNGE1N1hkRy85MEhScUd1N25aZ0pnTUVwbU1weWlzU3JLUzdZQ1JtYXZ3?=
 =?utf-8?B?ckZOeStXUWxqRGFPVDNzcy9jRU5ROGFLcHp4cForM2hLUFBBRWZ6b1Z2TXgy?=
 =?utf-8?B?eTd1M3BJY09ROElSRWVEdTlJSUJwY1BmQkVJUHRsNGkwdWxmT3EwRW9JVmtr?=
 =?utf-8?B?OHZwNExXcnZublBWc0pJMG9GckNCa1hkS0NsZ0dOR1hRWnBBVTV2Tk80RktL?=
 =?utf-8?B?bGxSb0RnZlhIUExtdHk1N2dUMTlRKzlRMUJ3bG01NkROVnA5cnp1Y1hMNTlF?=
 =?utf-8?B?c0pvZlZRR3VsQkxScEZvTklIem5YT2lTQmJ1MXljRnl6dHowOXJVYlNQbUlj?=
 =?utf-8?B?aHRuNXUxbWk1YTYxbENJSVE2N2FlSjl0TnZ5b0IzOGM1L2FLajNGa3VaTmhE?=
 =?utf-8?B?QjlBNGQxLzFRamdVZzFyRWVkZTJVWXZxRjAyMGVrZW5kak9tMzdBUlNIcE9O?=
 =?utf-8?B?SXJUS29tQStQUEhQUG4rSDB0bTI2Mi9ucU1BbzU4V0lxYjlHMzdDSmdpQTRX?=
 =?utf-8?B?cUpLMEx6eFVDOVFONXNTSUJyK2NVMUlNc3FRRlUyd2h4Wm1KdjNkelFLVkRP?=
 =?utf-8?B?VnpGc1BtU1JBN2hVUHBLRW5TbkMvNG1IT2s3MFJ2RFRwMXBDb0dobEZnUlVs?=
 =?utf-8?B?amNHUDRIT1Rvbm9vUHdwNWlZeThQNDB6RERGcU9XQUFCcElPbnh5cXdyY3pK?=
 =?utf-8?B?Z2J2L1VzeW5GcGZZcDV5WXMvZ2haUkJ2a2VEVUM2NGJJQjZVZDBpdEZTbkJV?=
 =?utf-8?B?WWlCWFJ2c09rdklKVkhzODJ2SDdtK2dWRUhWT256Ui9Cb01xUFc3Y3JDOXF2?=
 =?utf-8?B?TG9MblJtTGNPSWgzWk9KN2JNaVo5bHRwYmJEdzhaRkFMU1FoNlR0MXFWUzZZ?=
 =?utf-8?B?bk1QQ1IyYVVIQ0k0Z3lTa1h0ZHRlSU1XU1MwTlRTYnVtMEVwR1A2NG9SZHFu?=
 =?utf-8?B?cFBwcGJTRE53WlRXZnRnRGU3WWVRd3BLbEZqMldIN2drdkNmK3ZBcFZDUDBE?=
 =?utf-8?B?MXd3OWtxZXNKMGVBbmlZNDBKRCtVYmxKUEU0WHRjSnhteVMyU1ZxT2NUb2ZT?=
 =?utf-8?B?QUJwUDZNeTZKZmY2ZFZmRW96UFczMFdYbCt6dXBlTmdCeUpVS1hrdExNenln?=
 =?utf-8?B?NWU4dXJzbnlIZXZ0aldGRFcvZ0k5SnlHZTlUd3Bhbm4wMlJrVUxkTUtmVUZ2?=
 =?utf-8?B?RnJ6U2I5NUgwQ3hsNGRhajlqeE9IblptaS93RGNVOUpBQUorN05DTHZxZENq?=
 =?utf-8?B?NWRiOGM1Um0xYlRNVkRuMkJDdWFlcVRNSjBydGlFcUV2TkNEZHNNekFYOHZ4?=
 =?utf-8?B?T05GNG9WOW5NZGNySCtUamZISW10UU52WnZwQ2JGSjFSWDE5U29XQWZscWRW?=
 =?utf-8?B?ZG8yaW44bFRwN2hGYzlNZHg5UXZ6S2FIcDVPMDdiaWVxdVRXZENsb1Nyd1Fq?=
 =?utf-8?B?QzhZTTViME1GbUVqM1ladlBWNGt6VnBwOTBXUnkvcFNuQWFEK2djQU1pbVFQ?=
 =?utf-8?B?cWRndzRzYUZ5aWVSMlFYV3FOQlBpKzd4QlB1RmpIUjJBV0dzMkFmQzJqZUt4?=
 =?utf-8?B?UmpuRERZVkRDK1hWa3JsUWwycEZpQ3RpLzdNM2ZSb3RTVk1VaEVQeGNadlhR?=
 =?utf-8?B?dXdMOFBKTVJkdkI3S0ZBREFxYWdRczZnaU5BbTRSQyszc252MjRZYkZmY3RK?=
 =?utf-8?B?RDNmZFBZeUhqcDMveTNsRGFqVGJUSVU4NHg5ZHRXZ2hhMitYNGJZeSs3MDVa?=
 =?utf-8?B?UXpiMkFYOGhTQnlLV21rdUhGd3M5YVEybE44SmJneXdTdmtsa05UMkFDbEJs?=
 =?utf-8?B?TUtsSE1Ld1FrVzc1MDczYzR4ejRVb0R2R3N5TzM4UFdNcFFzbkswV1pqTTRR?=
 =?utf-8?B?RWlZRmR4NVJXZVByMkJ1S29MNnNMc09vWElha3cwNTNZTHVZaFYvZWNveCtk?=
 =?utf-8?B?aDYzTDI4eXo5QWdwdzFydkNRWDFYY0ZkRmZhQzBCOEpvNW8rM3dVQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebc6014-38ec-4fa7-accc-08da21e50fe8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:14:52.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2JAjz6r6dybrvSFOqD3xVc8N95mAjvrWASzQasDEnV4i38xRukSCW0IIhRYH37xtFEM5wI9b8PmH4KWXiSEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9125

On 18.04.2022 14:22, Penny Zheng wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -35,6 +35,10 @@
>  #include <asm/guest.h>
>  #endif
>  
> +#ifndef is_domain_static
> +#define is_domain_static(d) ((void)(d), false)
> +#endif

I think this might better live in a header. I wonder why you add it
though, considering ...

> @@ -245,6 +249,31 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> +#ifdef CONFIG_STATIC_MEMORY
> +            else if ( is_domain_static(d) )

... its use sits inside an #ifdef which ought to guarantee it's defined.
That said, even better would imo be if no new #ifdef-ary appeared here.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2770,6 +2770,34 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>  
>      return 0;
>  }
> +
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +    mfn_t smfn;
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    page = page_list_remove_head(&d->resv_page_list);
> +    if ( unlikely(!page) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to acquire a reserved page %"PRI_mfn".\n",
> +               d, mfn_x(page_to_mfn(page)));

"page" is NULL, so page_to_mfn(page) is meaningless.

Jan


