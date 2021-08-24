Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91F3F5D94
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171263.312541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIV5D-0001Cs-JM; Tue, 24 Aug 2021 11:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171263.312541; Tue, 24 Aug 2021 11:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIV5D-0001An-FH; Tue, 24 Aug 2021 11:59:11 +0000
Received: by outflank-mailman (input) for mailman id 171263;
 Tue, 24 Aug 2021 11:59:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIV5B-0001Ah-I5
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 11:59:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af73e2da-04d2-11ec-a8cb-12813bfff9fa;
 Tue, 24 Aug 2021 11:59:08 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-6aYEruy5NI28TF1CKf40Dg-1; Tue, 24 Aug 2021 13:59:06 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6420.eurprd04.prod.outlook.com (2603:10a6:208:173::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 11:59:03 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:59:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 11:59:02 +0000
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
X-Inumbo-ID: af73e2da-04d2-11ec-a8cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629806347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11ieDCyf49YgIwSuJtBWwxS7LbVOTbTc4zhWNsxNMCU=;
	b=kqJCLsXD5oYeDySWfi6WfoosOMVwqiHeADC5VLBDkYECelY7GGaowpnUMFadwuha1GTrZ0
	3JJ0383iDAiJqGHI+semLE9/4f/ygN40Q5KdwE6NR7YXxfoahX1MaBfpvrjqT+QXfr3GL2
	vopONGw7txVpjlGMBmXtkAQDIQ7qivc=
X-MC-Unique: 6aYEruy5NI28TF1CKf40Dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXdJnQ4Iz8Cohomav6nf0dM/02zRU8GAoHPcWZ/tSfwjNyFxq1GOrkPbbHv8TVZlT2YUjsd+2qQJt0trbC/tvV3QnuBDnpC80Sb2VC+TuPYAS3YVn55EtqLTJosBxti0fBZDJWM8N9hcAUrrJpGUa0p88hNbPvB8ap5bfV+/sCO6i/f/KDBnlXo9p2T04t39ozoWPWtKZsKSNQFpzzN+/wGaSnnZ8vrNr5NGrqv6wWKXCWGaUoJLKfN8ki7+t/BOKwULwr5Uy1UytOQw6E3OzW1B/gUjfVLfZfk11PnbyS+b8ILHSitNKBK3Gb6XNqDXVhvfP97rbmm76Um1dfB5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11ieDCyf49YgIwSuJtBWwxS7LbVOTbTc4zhWNsxNMCU=;
 b=W8I57WZ/Zlwr7p8kyUB4rhVsZ9VmdQDpEotWOU3HSDAceg9U2XQVEzxutxijGZieWl8B+8fO8AiqVzhxHJRkg6gt3NU53AyGw3citBdyPSfzEb54ZIxqeqFOQC0drmlKnYVBHtDzSkSgHIErLV0Krap7+CJPpxs5LrJE+H2ZUAyvR2yHweZZKC6sZEOZ7GDxeu65BoVnsVsMoObxppmL0YD+WIYQJ+inTgF9bV3O8bcozUdW2+MnZg615xVhnH5YWeK9/iASaClhy2OLOIzUSyID8iFxQd/FER+DIQqnN/OTKECrgBOlgJmW9Dq7i4Dii1Z9zifDo0IU36TnzzJm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 4/7] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-5-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <258eaed7-e23b-8b97-0ee9-9350052ec1f2@suse.com>
Date: Tue, 24 Aug 2021 13:59:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824095045.2281500-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0014.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::19) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8fa3352-b8ba-4f48-2766-08d966f69110
X-MS-TrafficTypeDiagnostic: AM0PR04MB6420:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB642048BFA4E8C9E0B2D20188B3C59@AM0PR04MB6420.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y3jdowXyHUQpPMuMyK1BCbjrgbRTAPbxXwziIjSeMtgDo+FlFmDELIKSUD6iSGyo6HWkHJuJufaEUSnHLTponZoKgzhk7+s3E2NkvJz4qN42RjngzxmWgei/w2eewminDZZkak0RtwsgYVYa2GAZldV46SCSfxm7XcovBsotw672tvJkac63XAiHxt91OkImtyoCqR74uENh7YhvmHEwIDy4ziu3yk6nm4D/q8J9rSrnOVSd/VSHFUPafwHXOkkDTKwSrZFQ+pJMBx5wX+PNHzjqaUHVgbidGenu17LQMFr8PfjCAfY26Nmy00kDXgxvbX/9v1fc5FOn44H9P919bjkP+qvuE3LafSL/BdXr1Qt88NrVWLKNeeOLw4H6LHDQ9Hsc6/jLRD8dD7s5M66QvSk5t09Z5Q/m6aslYmwjW71THps3e3D81gG6dI8GJC2N+/SrH1B+ERz5wMMlCvqu7coL1WIxVJUqLJdq4sv2hbGbcFISiV5m8kX7hzjZWJJ7E5Gt16UomE4MP4CxyZ9F4bwp2pfbxm9xTI4IiD+aXJCOUfF6cqIUPZDoZeqMu17PKuVVAKYhZBzwys2X05jeyZ5CeQ2I4qU8+HWnarJt8DrFIinA4ECfsWwSIUiINTYYCj72hYVJPw+EhHPfTU1E3ZaTMrQgQ2D4TQgx2Maly/nocCkp2Ptc6t628xpG5762476okdF0qMmhuRiN5f/V4PmUr9n60uqjEVce+HUzVXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(396003)(376002)(346002)(83380400001)(31686004)(36756003)(31696002)(4326008)(66556008)(66476007)(66946007)(2616005)(956004)(2906002)(6916009)(8676002)(478600001)(8936002)(86362001)(186003)(16576012)(26005)(53546011)(6486002)(316002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enVEWHJVR3FSblJHT2k0enBLaWxUczZNcG1RdTRodFQ3SnJwRSsyMG5YRjdo?=
 =?utf-8?B?NDhmN1FKWU8yNmlZbDBJS2tqaVpocnNuWjF6YkdqVW1nbkJ5bHhvdnFMQXJQ?=
 =?utf-8?B?dkxlZitYOHo4d1FORVBOQVZSYTBDc1R6RWswRjQ4RnBDSWdyWGFKcTd5RHRL?=
 =?utf-8?B?NTN0ZUlwQ3lleTBVbHNQY0tSNFRSUW5EZDZ5dUF5amtEZ0REN0MyTWZCcHoy?=
 =?utf-8?B?d0pGaS80UnRVOHF0T0gwaHdqOWUwWU91MldhVjNwYXNNK0g0SitxamYwbkJi?=
 =?utf-8?B?RjVnZnpkUHYxM1JWTnJDTGFuNUFGYitaU01ZZUJEbzcwbk00cmsrRkQ2dk1X?=
 =?utf-8?B?WGlEOVgwOGV0NEo0UW9xTGtSbUVTMnpxZStuay94QWFvZDBIbDFBYjFaRzRT?=
 =?utf-8?B?N09NMVM0b25WYXl1ZlFzYjBiVTUwT1hPKy9kWDFRVTIzc0piVG4vNStoejRy?=
 =?utf-8?B?dkNoMnFTM25sT1NJbHJKZlorTVB1TGM4bmlCemdnclVxY2VONTQwQXpLNCtU?=
 =?utf-8?B?djBxbUN1SGp4bko0N0x5WWh2clh4OFAzNklEbFp3ZXZFY2NwNWM5WndDc043?=
 =?utf-8?B?SHlXVHk0UllyUGFNMGlDRmd4VXJ6WnVNLzc3aElCSW9oM0RibzhGUWh3aTEv?=
 =?utf-8?B?aDl0c0lDVG1sajZYMkZENnZrcDNLdE9kd002QjZMckwyakNpS3lCbHlwMHdK?=
 =?utf-8?B?dUNoRDZmWUE4ZTZYTis1UVVIQjcvMmYvL00yajZ4d0dSdzBldzBkZjhrUTQ0?=
 =?utf-8?B?NlRvR0ZoTFB3cjFFZHZNbExlRXF3VHVCeHpTbFkyeDFweUp5RXd6RFVoOEs1?=
 =?utf-8?B?RndrY2FHRVRCL055dGljem9saGFxNk1YN2JPdlB5WEg4MUZ1ZFl5R3NWMFhl?=
 =?utf-8?B?Zk4wK2pHRTVEQnRabWVKK3JFU1V5N2hjME5PSzZsY3R6RmZsR2ZjQ0RDN3Nj?=
 =?utf-8?B?eXc1encxMzBoMzBqdEpibnZPdDF5eHU2VEhndmlSV2RjeU9qcWxxcjRVbXIr?=
 =?utf-8?B?VC9oMWhpdmpxbXlqamo0cm9JclNVMHRlNG5ldDBXSzYxNEQ4eFZOYTlNRW1P?=
 =?utf-8?B?TkVST29EMkszS0swV3pKQk9mczNFOW9IamxUUk10bjZOK2c5RFBmZ1NHblBp?=
 =?utf-8?B?NTFraUFZZ3QzYUhZYVNreS8zZHJwV2hMOGJVT0o5Wk03Zm03NVlYOVpydWRp?=
 =?utf-8?B?a2NLZHhqRzlESzEzdlVwUjUyZnU2and6TzQ0Q0hLL3RnSXdDM2dkdHJmbTB3?=
 =?utf-8?B?STVKTTFQdzE3ek5WdFdtdEhqMzVDZm9HRW1NeDl5enM0eVlCKzI3ZVM0VG1H?=
 =?utf-8?B?dVVqL0hlQitpckZGSDJmRlRKM0UyQk9mandYNFpzSmhtbmxTUk1aSXg0YXpJ?=
 =?utf-8?B?M2VBODZLQXREZ3Q1NWRxYjVuUnM0UFdrczZwcE5QVzNxSDNsWFNIbS9uYjJa?=
 =?utf-8?B?bW5WZ1ZucVVPTjhPZEJOR2JYV3ZBYjlESlgyUXB6VTlZeG51WVZoN21Jc0lD?=
 =?utf-8?B?YVU3Q3RrMHpmNEdseGNUS1JHbTdBTmVnVWRDUE54SEp6aFZ4SWNRNjF0QU1N?=
 =?utf-8?B?c0FXUHgxV3RXbkVDWnp2K1JaQzlXa1RiNFFGMVhZcmgrOVdRQlJ4ZU9DbFFP?=
 =?utf-8?B?R3AyaC8yL1dVTzlEZmE3MVRlYlpzbUhZZE9sMmNudFR2dGJjbUtsZFFraFAx?=
 =?utf-8?B?ckNxb0U0QmVSdkcwYzZ3TjlrWEZiRDdyK3VEUHQyckxuSnc2NVZySHFkYjhG?=
 =?utf-8?Q?lMj7baHvOTqCcknoLXd+PtjiSHQfeLMArup4eDx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fa3352-b8ba-4f48-2766-08d966f69110
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:59:03.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf/OLx1XQpMuYojpRQdCVDcdon34QHQiiOBhxFrk4E+t3GdkEN4pInqbvZw+F33lKyA9T+CAZr60IXGUByJXfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6420

On 24.08.2021 11:50, Penny Zheng wrote:
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -609,6 +609,29 @@ static void __init init_pdx(void)
>      }
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +    unsigned int bank;
> +
> +    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
> +    {
> +        if ( bootinfo.reserved_mem.bank[bank].xen_domain )
> +        {
> +            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
> +            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
> +            mfn_t bank_end = mfn_add(bank_start, bank_pages);
> +
> +            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
> +                return;
> +
> +            free_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
> +        }
> +    }
> +}
> +#endif

If you moved the #ifdef inside the function body, ...

> @@ -736,6 +759,10 @@ static void __init setup_mm(void)
>      /* Add xenheap memory that was not already added to the boot allocator. */
>      init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
>                         mfn_to_maddr(xenheap_mfn_end));
> +
> +#ifdef CONFIG_STATIC_MEMORY
> +    init_staticmem_pages();
> +#endif
>  }
>  #else /* CONFIG_ARM_64 */
>  static void __init setup_mm(void)
> @@ -789,6 +816,10 @@ static void __init setup_mm(void)
>  
>      setup_frametable_mappings(ram_start, ram_end);
>      max_page = PFN_DOWN(ram_end);
> +
> +#ifdef CONFIG_STATIC_MEMORY
> +    init_staticmem_pages();
> +#endif

... you could avoid this further #ifdef-ary.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -67,6 +67,23 @@ config MEM_ACCESS
>  config NEEDS_LIBELF
>  	bool
>  
> +config STATIC_MEMORY
> +        bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on ARM

Inconsistent indentation. Both want to use a single tab.

> +	---help---

We try to phase out "---help---", following Linux. Please use just
"help".

> +	  Static Allocation refers to system or sub-system(domains) for
> +	  which memory areas are pre-defined by configuration using physical
> +          address ranges.

Inconsistent indentation again. A tab and two spaces, uniformly.


> +	  Those pre-defined memory, -- Static Memory, as parts of RAM reserved
> +	  during system boot-up, shall never go to heap allocator or boot
> +	  allocator for any use.

I find this hard to parse and I'm also unconvinced this belongs here.

> +	  When enabled, memory can be statically allocated to a domain using
> +	  the property "xen,static-mem" defined in the domain configuration.
> +
> +	  If unsure, say Y.

As being unsupported, perhaps rather "N"?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1519,7 +1519,6 @@ static void free_heap_pages(
>      spin_unlock(&heap_lock);
>  }
>  
> -
>  /*
>   * Following rules applied for page offline:
>   * Once a page is broken, it can't be assigned anymore

Stray change (I don't really mind it, but it doesn't belong here).

Jan


