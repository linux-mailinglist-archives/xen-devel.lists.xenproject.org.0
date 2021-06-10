Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D773A29AC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 12:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139834.258489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrIJd-00067L-9L; Thu, 10 Jun 2021 10:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139834.258489; Thu, 10 Jun 2021 10:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrIJd-00064o-61; Thu, 10 Jun 2021 10:53:37 +0000
Received: by outflank-mailman (input) for mailman id 139834;
 Thu, 10 Jun 2021 10:53:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrIJb-00064e-NI
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 10:53:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b18dfbe-3d7b-4fe6-999d-acfa82f864cb;
 Thu, 10 Jun 2021 10:53:34 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-1VUHVzSvMfm0gvTPYaktZQ-1; Thu, 10 Jun 2021 12:53:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Thu, 10 Jun
 2021 10:53:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 10:53:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0050.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 10:53:28 +0000
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
X-Inumbo-ID: 0b18dfbe-3d7b-4fe6-999d-acfa82f864cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623322413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZMruOKPvUj3F4CifjynfF7FGm3G6uXlbGRQuTBF1xM=;
	b=AAoC2Dzl+AVufBk43svSf4DUNVNksa/YgYaXEXaoMb2wsjN6dZuSVSNLX147HrD5Vr+Txh
	Ia86/lNqJPqmIcE3fqTM64laQZRT0HVJXaDw8FdixF9deXr1/dy8uUVbzzm/V7O2rnwsHh
	xqcFJrUDNkZFDknUbBFVVBTbV5E2GkA=
X-MC-Unique: 1VUHVzSvMfm0gvTPYaktZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TevT3BWt7m0I88vvFgVFziEvItLytf3373osQYnoiWhBIoP1oVoQM1APWDqTsSk8juXmOhdOk9RivbcI2KszspG8sOkaF11yTZEXSzIJf9wB/J7tmFjp5u+qxTYkzrsAa9IyZZP0UXDpjyWyZMBNxHPRz59Oi3oJD8RO8CW+1uyYoexipmUeFahhwZjwYBKWA1uvuSXG0g08nSZlHf2xb5VXAUjZn+IBucwPBrVB3JyCR/SOAx6oE9IRkFbjigJdwCrmKKlHnG4DcY3HGYtei1WEdavuqkjUT9gVxx4CZgM1rEwTJTTWIP7Ntbo55nn0BrCJl0F0iOz1WEzgcnCyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZMruOKPvUj3F4CifjynfF7FGm3G6uXlbGRQuTBF1xM=;
 b=I5Y5rq2FQ3EhyaiuK3lC+HLNa1T4qsgsicPoUBg+EfQRYbMbdPIRoae4OTILy+NvAZixxR9JXw1Hscj0zpNq5PazCcyX8AHbvZG5ZPO1KkKdZ+Y5aoTzQ4egMQ+iH2NPm9FRbgF+qswgzhG7Fq06cqoHxvWxFpNrb90n7VFhqH/YJWQTj/o9iZBUP/ZCkaoc0x4RDzV91YqpKwAYV48Kxb5Ni9xQlWUWeOG9iCh+IoYGLjofk74J+hrsaYimGKkMAaCry9NiwcI3cIHvm+1yThWqYj/qElA8MwQ/wTE1qBy3dXl5TyU1UslBdsML5YBnB/WrdFHdKHNLiamC2uLIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 7/9] xen/arm: take care of concurrency on static memory
 allocation
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-8-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74756c9d-4b9d-60ee-a70f-47c73ba4c442@suse.com>
Date: Thu, 10 Jun 2021 12:53:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607024318.3988467-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82c0ae4f-205f-48a3-664c-08d92bfdfb48
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270202F5FCF5ACA5E734F727B3359@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IaA3EtoOpOHvQ9HEIYY7ZIUXIc06cMfw7kMrWEd75fbTyKBJ8lwfoxCj9sh9y0um8Tyb89C9cKutEWgZWe93bVMuW2aMAoClmy09SRBFOip0l1Oh1UVpfviKol6MThjQVYJc55q6yWTlM4ID9Uv0ImtuDA8w4zGtg4Ic1cgjSBrpU39auzjnP+CAOEdsbaEHVmDLuT3tH268vPaqLgJLTWyDZBelZI/0YiQuslS64+KuFLQjRexpWRiyRJOBFG16eTVX3QNaKvQsM/bJCk3YlLT2vNjL0tm7CllttgIzsKSQajpdbd1Ndi8lXo4dwPSa6OScbfCYfS/QNfgYutCeURbualwBmRejJwMO8ARuo9XafihMemPyFZiL4wmrsYG3ccxutA9V2lDKBObnURKRtJakoetk/tUmzaStLYCHw81e4wxM0H4AIutr1/kis8WJAqZPG2fia5ZfPuvcwbQqkAUwNejt/Cq6KxFLDwneYi3px9TrhCQxouW4FhVk9PZ7BwLxJbRuvqwT+ngdYy/BKCscotWc2jvyKuLz1C2+HCSEH9MFB7vKyCuWqOfl5QsM/r10QXuh7/f+TV66zmwfVLxHHLdfe/cl0z3m+DxqD0tJtoqsJeGhVKalV/kJSJgDmwfRC/rFHyW8blw797Qe+f7vrKfB3XA7qSh/IFpbIDX/Hhkr1GjwZNowvMFj79Vq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(39860400002)(366004)(66476007)(36756003)(66556008)(316002)(86362001)(8936002)(6916009)(66946007)(4326008)(83380400001)(8676002)(31696002)(478600001)(16576012)(53546011)(5660300002)(2906002)(16526019)(26005)(186003)(31686004)(956004)(2616005)(6486002)(4744005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?cVhiWTc1ZGxzNDdRbXJNc2krWUFCQWs5N3piNlFtWXhDT2w3RVFzVU5OL0tX?=
 =?utf-8?B?M2d6ZHZzZ20rSUtJd3hSbFkvVjZiVkRlL0xjYmpHUnM4enc0bE9KWW81UWl6?=
 =?utf-8?B?TDVOTWlENHF6UVQ1M20yTmVQQWVRWDZJL3dlYk5RT3VVK2dneVEwMkVNT01M?=
 =?utf-8?B?SE9sRnJGbXhGc0Y1Uk0xcDBRdnZ1cE15K20zLzlHLzBucEt3M0FvRFNReTEx?=
 =?utf-8?B?VnpVVVIvdDdFcFJxWlRWMnUzOHRZQW1CbmFBcW12ZzBSU3lFU1g0RC9saStW?=
 =?utf-8?B?REgvUEx4aTdYY3QxRVJoY3YrM21Pa0k0RzFvaXprNVNubjZQdDFQMDNMV2FI?=
 =?utf-8?B?NFF1Si9JY25OeXNUNUxvNjJFRXlmTXJCRkl1MzA5QU5Fem16NFVualA1dVpo?=
 =?utf-8?B?T0tmQW40bW9sVWR1Nk9kWU1oclZyS3Q5OGRtak1jcEh0STBPdWt3MlhmaHI3?=
 =?utf-8?B?NzJ5MFJmU2x1M2JUZWRYeHV2VlNiOWtYcUNVMStQcmFXTm4rdUltWkRsSkxn?=
 =?utf-8?B?cG9CSzRCd2N4Mi9Pakh1S3A4QXNKUk1vSHNKNGFWdE5vVTNqOGdNMmRPLzBk?=
 =?utf-8?B?dks1T0FWTWR5andrTzlJTTZrV3BvVzUxckdkbnVBK1gvMVRFbmZQeUZsV29W?=
 =?utf-8?B?Rk1vWTF4YnNoVTVVaUwzcisybTB5VFNHWDFGZmRrNU12VDlrODJwK1VzM0Jl?=
 =?utf-8?B?Wjk5c0dQaVF6UC9hcFNaY2tOb0Zid2hUMkZSK2JGVFNGVTBhaFlqcW1JdDZJ?=
 =?utf-8?B?S0lwNnNmbE9MTHl4c2NFS3pGSU1LY1VUQXord0c0Wng2enFvMVlaeURZT3h6?=
 =?utf-8?B?WWFmZjFJTGNXUFhuUkxDN2RxR3ZFWUpLd2VMbFZ6cCtwVllpN2craGhMdzlI?=
 =?utf-8?B?V2Z3M01lMnJySkNOeSs0K0EyeUR1Skk0c2tCa0lKcDZNV0kvY0tGdTNkbWpz?=
 =?utf-8?B?ME5pbEFUMUNuczdwWTJrbFlsVWwrSUpheC9SVFF3Qk1uQlpxN1FKZjJ2K2k0?=
 =?utf-8?B?MGhmTEh2MGlMb0ZHWFJDNzhNMWIwemVnMk9hTVhDSENLakEzRkluUlRZYnUv?=
 =?utf-8?B?cFFtRC9sS29SK2VyaWJBQkRvdmRQUHFiM3NaT0JMOFBWT09tK0F1a0E3R0E4?=
 =?utf-8?B?U01MNTM4VXdUK2J0TGpVQUNPb2RyTnEvOVkwclNFakdNMnJJdFRncTFzanBZ?=
 =?utf-8?B?L05CWlQ4WDlHY296M1NPOGtrVDVkUVVpOEVHVlBocDVJTkpkcWk3ZlA0OWZW?=
 =?utf-8?B?Y1piSmtmQlhuZkJ0elNXQ0IvMzRPRzJKenNQUlNOTGlta0JFMWZKMGRObysx?=
 =?utf-8?B?bi90SU45TlF1WkNnNXNxVWUzZXltaFpxVUFvWTdZaXFaL2ZFTVBiQk9yNHVw?=
 =?utf-8?B?bWZzMnozeXhhTW9YeEZBaE45OXloekdXUDVYRG1xS0NVTW91d25lZU1LaVVk?=
 =?utf-8?B?N1ljUFMzSXRQTkdZd01aUWI4RzNnSkE0V3h5N0JwMlo2WDVISGpGeFdkTXI5?=
 =?utf-8?B?U29abll6QkFUUVhjb21Tcm1CQ1ZMT3h1dG5MV2VJSWM2TmxwN25XZ1BCdWZ5?=
 =?utf-8?B?eGpqaldVUHpUY3NOUVBVdUtKSk5JaWNFTE5xUm9TOW9zWVNqSUZpUmYwWEht?=
 =?utf-8?B?R0MwSXJvOU1JZ0Q1KytYZWsyOXBvRHhRQk9xdEVEdnl6b0ttYTl2Ylh1QVpr?=
 =?utf-8?B?NHB6NkIvTVVtNjRSdjMrc0E2MG1ZRGc1UWczSVJxbDRmT1J4ZnFzRmtwOFIw?=
 =?utf-8?Q?JE4GevLv5UBOukK3jhvH2/T+wyFnmcZ/MYZrURm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c0ae4f-205f-48a3-664c-08d92bfdfb48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:53:29.3621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yp2UBiM5frMEDDvUi8UEroaPh6ESukxWwKwjRq5Dy5jJ633N4HdbgEPRaz84Xr5uwaO8uOjwAjg2DqgbaHjF0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 07.06.2021 04:43, Penny Zheng wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1087,6 +1087,9 @@ static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
>                 nr_mfns, mfn_x(smfn));
>          return NULL;
>      }
> +
> +    spin_lock(&heap_lock);
> +
>      pg = mfn_to_page(smfn);
>  
>      for ( i = 0; i < nr_mfns; i++ )
> @@ -1127,6 +1130,8 @@ static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
>                              !(memflags & MEMF_no_icache_flush));
>      }
>  
> +    spin_unlock(&heap_lock);
> +
>      if ( need_tlbflush )
>          filtered_flush_tlb_mask(tlbflush_timestamp);

Besides, as indicated there, the need to fold this into the previous
patch, you will also want to pay attention to alloc_heap_pages()
carefully avoiding to scrub or flush pages with the heap lock held.
You will want to follow this for your additions.

Jan


