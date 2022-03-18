Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600C4DD689
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 09:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291954.495863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8MZ-0005Rb-Vr; Fri, 18 Mar 2022 08:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291954.495863; Fri, 18 Mar 2022 08:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8MZ-0005PP-So; Fri, 18 Mar 2022 08:53:35 +0000
Received: by outflank-mailman (input) for mailman id 291954;
 Fri, 18 Mar 2022 08:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nV8MY-0005PJ-9h
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 08:53:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2dca272-a698-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 09:53:31 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-cKEKuEC-NN6z9WmMn8v0eg-1; Fri, 18 Mar 2022 09:53:29 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5966.eurprd04.prod.outlook.com (2603:10a6:803:d7::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 08:53:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 08:53:26 +0000
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
X-Inumbo-ID: e2dca272-a698-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647593611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzPr8GVFOOilUUuLAssPglcr0JrrBJPBMDCvT9TuiX4=;
	b=CyHxpDU5ziRPT5hKNM45UWSwUWL9QAU/jPefX/jX1WmgNTUXqsSUdbYC0/LrtG9E/tONnF
	B2PPzMtkexXAeeuIzcE0OBWpdzSDaAnBhQJ8WIdy0EHDXUPmxMvQj36NxtZ8tSPIE3PYAF
	sj2Zv1jKgU5RP5QeHWIIvIuUTxJoi5Y=
X-MC-Unique: cKEKuEC-NN6z9WmMn8v0eg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZd/6Lw8caj3K2V6KOn8tVeKPtnArfeiKhYrIppfE1A/mB88X9wrWtX7qEHRKDE073vo53OEw0CKi400PC4f+O+hZWutyNrxPhdXxBI23HWFRSKOxgZ5fLQNEPZvi/8mvWRjfGvp9HlsJW2EXTLVvgsMR3LVVEL/1tm7ZHE+gpK8mJE80/X6pnGRr2+x5iGN3YJb3aImr/NPgarlwrTxBXOH1SMAqYlMP0QfBJjl0V32kI+mntzLGFJFs4afd8DsHclALhq5lMnCj7nglDSalJwkjAoMw0mtM7KRvFb7pAOc61YBRi+HH1WRHBRYiJD5J1j4XPzdNz7O6qvOt5k/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzPr8GVFOOilUUuLAssPglcr0JrrBJPBMDCvT9TuiX4=;
 b=n+dKsIRQSuClBzKcb0jtsEWAJ1dLIsC3ovKcW3ukP7wNUPfc5kXMoC6YgCxyHSvfWdBxedvS9pzkhPLk5pWaNc1gbgogeI2rYj4AJ6I7TQLipQ/lFn8hPIpeERmlZ7OEhWnHUks5Z5UVZWEAX5m7sWUJ/JeQFcCFZWQxiRM6MwXvN+N3RnFprk/gX24SqYtmNvc65mdHBWy0sUa/TygXWKqQB8GTiwQ3o3KjYFMw+ZMZTTbdAX1rXAQRCA87LBkD50mGMHmHJNQ0hVwqtlmxrlXdXGWGXWwSsCPYqpTdieTCrTq2WgklQd8L8okfAyu3TxYepTuAgZkfALzVVXocHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
Date: Fri, 18 Mar 2022 09:53:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: nd@arm.com, Penny Zheng <penzhe01@a011292.shanghai.arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220311061123.1883189-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a709d170-2c98-4f99-f0df-08da08bcc464
X-MS-TrafficTypeDiagnostic: VI1PR04MB5966:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB596614CD541D0AA10C60AF59B3139@VI1PR04MB5966.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HuLBsXnsHiMmKvd5/xDbPV8MZ84bh5jub2Ld5GydK7y7mlCYsQAuhhckR3SDoFOmaXZzTXdeN7viIWamMzZbqzmF5oTrbvVY+P0wHVBZh58aHj5NAIzxlqs4i3CIscVr5BS0lb41QrmZ7ijCZZOabpanRl7cLl+VTf8TLI/59P5iSzaqHZ5fLmW1GDMyveA+ywhU8lkAT3oGkN00YaOIwUJF9Us+fQQP7eHS7CbTBAceYOLJxT0cKVWqQZPKfThFo332ee6b58TPfqw4B9uYAjZ+kvtjkjnAcus3ydkKjQJm9IUBJOUipDE8h5zAYMe/TEcdVOd35rI75P30rR9bhQLzgRKniy5rjDmHTewxEY7gTBcyndPKdwStUejXpCbzZ7pdwBmD9S7fAEW0WsTkowC0bPfLQ+4zAW/B6+gBAqQqdhmAmGFw91Dd6P6inrW+E9+Yzl9yACsS2l9a4XBHmUYlQ7vD2ospUfFQS3k63EdQQG8dTdhv66qLj6jcCaDASAs0Iu9/NYLj0MAEtyBrogcSeqcAER3FgxRw4DSbbn3nTFVP1mYLS5MPAIbI+KfsmuaaDf3QXyzW+CvQ9Bv3TC64LD+hb0Y0vhHfHpssZMTiOZfKMJU3CNr7278eyO+TFhNAanzmw0yo2iH7+n6/ou1rKLleuMaSenL9qArx/hp3PJ8I7Jjf9xFUX/iR4lUX7+5nfCIXxswrnlF1mLf5jEcwd48sBi/om5EL2jtM/yk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(508600001)(6486002)(86362001)(36756003)(31686004)(2906002)(316002)(38100700002)(83380400001)(8676002)(4326008)(66946007)(66556008)(66476007)(31696002)(53546011)(5660300002)(6512007)(8936002)(7416002)(26005)(186003)(2616005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHNkS052czVVd2g3Ti9TcDVIMDJrRlozck1DWSt3ZnF5SVVNNHA3dnpMdEMv?=
 =?utf-8?B?NlhsQzlOVXpNNlhyRjMrUjluemxWMkhzeU9pdk02Kzk4RXBQTFBxZUZZb1l1?=
 =?utf-8?B?ZHVDbkprTGJhekhrbmRweDhMSzg3S05hS3JoU0ViMnVEc21LMGUrWmszVVBo?=
 =?utf-8?B?aEJ6TGwxaGhrMlZRRnU1MXdFMitoNGNTczFsRFF0TXFoUW4yckNVd3RVaU51?=
 =?utf-8?B?UVRRcnRveXJucFZGc1Buc081VGtuWkxzWlRsS2hHamt5cjY2eTBrYVA2eU5N?=
 =?utf-8?B?VTNVb0duclVBNFNWY0xtU3NqVUtldE5JTkI4T2VvRjNkOVQra2VnNmpKa0Nv?=
 =?utf-8?B?TnhubDkxT2ZTYmZzR0VYZVpGQW9ZNnJkNVBsU01vaXIyYlFsbWxsZ3ZTem4z?=
 =?utf-8?B?cHYyd3ZkN0djYUxhdkRsKzQzU1IvL0JDTWNNRkpqM3IzdDZ1N0YwRWVWNjZV?=
 =?utf-8?B?dHRHQUdvdEtWdFJVdGczdk5sWlJuRVpJV2JtRVRiWTE2ZWh4WjZqQ20vVVVE?=
 =?utf-8?B?ZmRJTWcycnU5SVE3Q1RBSkVvZWg4clA0cjZXVmI5MVJ5dlEwYXZsNFVXKzFG?=
 =?utf-8?B?VERzT09mR1VlMkNJdUxSRTVpTTJtN0JHZVlNejdXVTNxTUs2dS9QanM0ek50?=
 =?utf-8?B?RmRqSk5ET090ZTZBcTZaZk9WeWNnRVQrZU1JazdRdlp3TU5aU2NzOVYrM1RI?=
 =?utf-8?B?Zy9xU241eEtpeERJeTR6MjFYSTVhY3Z2VkV1NllGS0xqejdYbFBNUnExTXUw?=
 =?utf-8?B?ZE9YVFVLQWd6NXJ3TXRIRmRpejl0MklPMVRHd2ZneFBtRVUxanJ3bm9MSVRz?=
 =?utf-8?B?L0laNW0yajFxRHptQnRidEN2SitpQmdFMFk3ejhPaHZhNFRxRjl0OXcxMDcx?=
 =?utf-8?B?NkJMUHRYNm9UWmV4OVc0cXhudzBxWnFGWW54S1hHYXFNQWE1MWovbWhnM1dF?=
 =?utf-8?B?SFovakRvakJpQkdWOEFqQ0cvRWIza0ZLZnBDU2FkUE5oa0NQNWxLNmN5S3Iz?=
 =?utf-8?B?ZkVXS1NOWE1sQnZmZVFpVzl3SVBzZzhGNm1BeTNZdjlxajgzYk5lN253Z2pJ?=
 =?utf-8?B?aFdkUFZZcTI3VUlVY3VoMklSb0JnSzhMT1lOQUJLbEVQck4rdWxvQml1ZGRC?=
 =?utf-8?B?VWh3b0hJSW40cUlIWXFSRm9iRTZlUlZJeGZxT1h1Z3FSVmdlVG9TQVF2OXRt?=
 =?utf-8?B?cGlHbnR2bTFEcmNIY24rK0JyWVE3bi96YW5OQ1VFdGY1eXlWSW4yUXgxMGtT?=
 =?utf-8?B?cEQ0ZUNya2o0aCtXZmlOM1JSbXdNYlIxK2kzbVpodVZvRXl1K1RpakUvWm9T?=
 =?utf-8?B?TWFUWVM1cGVURFNzNFhSNEp5K1VPNzdTZm9jc0ZuWU0wdDJJSXI2QjdCU1Uz?=
 =?utf-8?B?aU5rQWxxeEo3a3daNnYyaGVHVkc4enpYNExsQ0R6dkJvdGxpU2NjT2FSZWlZ?=
 =?utf-8?B?MVBqWnpiQ1JuU250Vlo3cG0ranc4amZRYlYvYUFTS0RveVdvVHEzRHdNaEFH?=
 =?utf-8?B?NmU2VVI4MUV2d0xzZmt5aTVvQU5XbGVYZ0ZBd2h3eThXenBCN3BFYTdvZkVr?=
 =?utf-8?B?ZEFGMTlQeUhqYkFFVzZJRW9ad01zZzhmUGxFc0cvcmJuL2hsMjIzOFhlZ21D?=
 =?utf-8?B?RWxIY0haQVI0cDRTTnVYeTY4RkFjZytEdW9UOGdKRU1GbmpqODhNV1c5TlVi?=
 =?utf-8?B?T09VVjlZd25pS05xcHRZb05MUkw3VGcrU0hJZ0JBd0pzOHd5RWFJc08ySUxF?=
 =?utf-8?B?b29RWUE0R29YWExCb1NUN3J3YU03YU5adFd3d2tQUTdGTDRxbE5jYWczOW5Q?=
 =?utf-8?B?YVlIL3phbm1iQTlud1V1N0ExWXVpbDN5TzgvUWVhMUtoazR6U1hHbjZCRGdF?=
 =?utf-8?B?N2taZ0FSTmJmMnU3dVVEazBUUU8zUVRyUTVZOXBocENmeGtNSFVBb3RBdjFj?=
 =?utf-8?Q?N+tCIyRzFTpslEXRHHWE/PqnKk8xYRb/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a709d170-2c98-4f99-f0df-08da08bcc464
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 08:53:26.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Y8ioq9wUNPKPBcuQLBZuuU6pMpvxWpqawC09LyhXbkZUrobUFjO0hQswxxxoz+J3EHVZtqCl29etX8/2Keysw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5966

On 11.03.2022 07:11, Penny Zheng wrote:
> In case to own statically shared pages when owner domain is not
> explicitly defined, this commits propose a special domain DOMID_SHARED,
> and we assign it 0x7FF5, as one of the system domains.
> 
> Statically shared memory reuses the same way of initialization with static
> memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).
> 
> We intends to do shared domain creation after setup_virt_paging so shared
> domain could successfully do p2m initialization.

There's nothing said here, in the earlier patch, or in the cover letter
about the security aspects of this. There is a reason we haven't been
allowing arbitrary, un-supervised sharing of memory between domains. It
wants clarifying why e.g. grants aren't an option to achieve what you
need, and how you mean to establish which domains are / aren't permitted
to access any individual page owned by this domain.

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,13 @@ config TEE
>  
>  source "arch/arm/tee/Kconfig"
>  
> +config STATIC_SHM
> +       bool "Statically shared memory on a dom0less system" if UNSUPPORTED
> +       depends on STATIC_MEMORY
> +       default n

Nit: "default n" is redundant and hence would imo better be omitted.

> @@ -712,12 +716,16 @@ int arch_domain_create(struct domain *d,
>      d->arch.directmap = flags & CDF_directmap;
>  
>      /* p2m_init relies on some value initialized by the IOMMU subsystem */
> -    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
> +    if ( (rc = iommu_domain_init(d, is_shared_domain(d) ? 0 : config->iommu_opts)) != 0 )

Nit: Overlong line.

> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -855,6 +855,20 @@ static bool __init is_dom0less_mode(void)
>      return ( !dom0found && domUfound );
>  }
>  
> +#ifdef CONFIG_STATIC_SHM
> +static void __init setup_shared_domain(void)
> +{
> +    /*
> +     * Initialise our DOMID_SHARED domain.
> +     * This domain owns statically shared pages when owner domain is not
> +     * explicitly defined.
> +     */
> +    dom_shared = domain_create(DOMID_SHARED, NULL, CDF_directmap);
> +    if ( IS_ERR(dom_shared) )
> +        panic("Failed to create d[SHARED]: %ld\n", PTR_ERR(dom_shared));

I don't think this should be a panic - the system ought to be able to
come up fine, just without actually using this domain. After all this
is an optional feature which may not actually be used.

Also, along the lines of what Stefano has said, this setting up of
the domain would also better live next to where the other special
domains are set up. And even if it was to remain here, ...

> @@ -1022,6 +1036,14 @@ void __init start_xen(unsigned long boot_phys_offset,
>      apply_alternatives_all();
>      enable_errata_workarounds();
>  
> +#ifdef CONFIG_STATIC_SHM
> +    /*
> +     * This needs to be called **after** setup_virt_paging so shared
> +     * domains could successfully do p2m initialization.
> +     */
> +    setup_shared_domain();
> +#endif

... the #ifdef-ary here should be avoided by moving the other
#ifdef inside the function body.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -643,11 +643,14 @@ struct domain *domain_create(domid_t domid,
>  
>      rangeset_domain_initialise(d);
>  
> -    /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
> -    if ( is_system_domain(d) && !is_idle_domain(d) )
> +    /*
> +     * DOMID_{XEN,IO,etc} (other than IDLE and DOMID_shared) are
> +     * sufficiently constructed.
> +     */
> +    if ( is_system_domain(d) && !is_idle_domain(d) && !is_shared_domain(d) )
>          return d;
>  
> -    if ( !is_idle_domain(d) )
> +    if ( !is_idle_domain(d) && !is_shared_domain(d) )
>      {
>          if ( !is_hardware_domain(d) )
>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> @@ -663,7 +666,7 @@ struct domain *domain_create(domid_t domid,
>          goto fail;
>      init_status |= INIT_arch;
>  
> -    if ( !is_idle_domain(d) )
> +    if ( !is_idle_domain(d) && !is_shared_domain(d) )
>      {
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;

All of these extra is_shared_domain() are quite ugly to see added.
First and foremost going this route doesn't scale very well - consider
how the code will look like when two more special domains with special
needs would be added. I think you want to abstract this some by
introducing one (or a small set of) new is_...() or e.g. needs_...()
predicates.

Further (there's no particularly good place to mention this) I'm
afraid I don't view "shared" as a good name: It's not the domain
which is shared, but it's the domain to hold shared memory. For this
my first consideration would be to see whether an existing special
domain can be re-used; after all the set of reserved domain IDs is
a very limited one, and hence each value taken from there should come
with a very good reason. We did such re-use e.g. when introducing
quarantining for PCI devices, by associating them with DOM_IO rather
than inventing a new DOM_QUARANTINE. If there are good reasons
speaking against such re-use, then I'd like to ask to consider e.g.
DOMID_SHM / DOMID_SHMEM plus associated predicate.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2616,6 +2616,11 @@ struct domain *get_pg_owner(domid_t domid)
>  
>      switch ( domid )
>      {
> +#ifdef CONFIG_STATIC_SHM
> +    case DOMID_SHARED:
> +        pg_owner = rcu_lock_domain(dom_shared);
> +        break;
> +#endif

Please can you avoid #ifdef in cases like this one, by instead using

    case DOMID_SHMEM:
        pg_owner = dom_shared ? rcu_lock_domain(dom_shared) : NULL;
        break;

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -618,6 +618,8 @@ static inline bool is_system_domain(const struct domain *d)
>      return d->domain_id >= DOMID_FIRST_RESERVED;
>  }
>  
> +#define is_shared_domain(d) ((d)->domain_id == DOMID_SHARED)

Would this better evaluate to "false" when !STATIC_SHM, such that
the compiler can eliminate respective conditionals and/or code?

Jan


