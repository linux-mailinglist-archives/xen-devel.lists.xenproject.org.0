Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6E5801E3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 17:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374656.606779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG01b-0007Db-91; Mon, 25 Jul 2022 15:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374656.606779; Mon, 25 Jul 2022 15:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG01b-0007Bm-62; Mon, 25 Jul 2022 15:29:39 +0000
Received: by outflank-mailman (input) for mailman id 374656;
 Mon, 25 Jul 2022 15:29:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oG01Z-0007Bg-FU
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 15:29:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96b17522-0c2e-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 17:29:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB3964.eurprd04.prod.outlook.com (2603:10a6:5:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 25 Jul
 2022 15:29:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 15:29:33 +0000
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
X-Inumbo-ID: 96b17522-0c2e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG2+9DyC9pz8pZvHT/JBkTmZJZ++cJu715FDPjXHwQx4u23JuoKTe6GDtte57nFMc0j4CvUkDo6v5VbwQryVxLvhvEyd18K6v+1cIgoJeicATtF75Oy1hshMRHzy1HnyLKgzBrhLi9qSvyYDiZZ8oYZQTGevg29nLGAbZJmWlIqOMuonyYOB8HjvGVFHi6gJWjq8hWX9vkIi9FUgxZ42Y5rHjmffwq/RUr5XTg6G5PYyxG2qm6oVbAAzetFN43t0Y6iEACCtiqybDTGHxUcxQ47b7XVE6p28+xqyOlb/A+2PxcVcj9I4vsoWZSj1iHXjTG7W5IabiK1yF7hO0rnhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8sRcLpwRjFEyUxKeqRGhLngYzc44AUkBJ73exqTkPg=;
 b=dD6huxbmlqJhciEiuWa6+i6xALuq5ODsPI9bCt3aiUq0jJ2fyko2icRSk7M96Uv7nKxidOl3gypSKv7uMGucsADFIGhEYiULuPmELXI+hYu2CFkWDj0E8uf7ZDId81HH3jjTmnTQM8S/K5/qEo7E0rKpjK3zYJtI0K7vj2LImRtyTUUcKxa8TeHTj/EsewrWKcoi9SSQefxr/rVscg5mUk2QE1AGvIxwS9qIszx2MJofIfM07IBGjaZevHb4Oe2QdvhI9CLcqb5JsgYsz4257HdeVHaCff85DEFu81EdgdB9Fw+7KBUM3Kip5s90MtgJY28MZyQsvk6oCVyYTIDnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8sRcLpwRjFEyUxKeqRGhLngYzc44AUkBJ73exqTkPg=;
 b=mlu6XRndbd+Udkl6nrEGMstoAFQeYhoPP5KhCWmTdmCEGVtmnzT89hHwC5drzLymJXAxnHa1VtiUuse8dZcvYZqqBgXFATUlhhhvbSnLv3mqcbuu9aZ91rVE9Tq4IzuQmsO/YAAEGi8zhGR0DoBPc8PPlJ3Sv7LXq/lVkPpsHIKTxaR41RiTzMsQwvArjsZgILWI1ty7HiQqEatK1KqZBd2qTBzuLi0477ekeShRuGiQJQyido8mbNQki12F/u7pJodfBGe2rcgrpdmH3VdBrBEy4IhYlF7N8s0H9IgQ4SYXoxlTK6U+5e/lX93Ey67i1sgRCC5ZolXcQ1eKcQpeOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee54bbc8-980a-7119-2e49-a12128ea3d88@suse.com>
Date: Mon, 25 Jul 2022 17:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 2/8] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220720054611.2695787-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 743ec0a5-5374-4bba-4219-08da6e5279a8
X-MS-TrafficTypeDiagnostic: DB7PR04MB3964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OSQNqY2lGRaDfB2IYLXObsgNXzZJZfgLJMNgHxRpI8UHuV2vzBEeKGQzvVeR+iHooKV/5H+Um4mXHgPlrFNXFQUFcRjAfouxYoWNgJ7LV6iq8KIGirOrBADamv2Bjx3A61WGIAvrjyux3EVIptHQT3Lo0rxPkJs5JfaiH4PnuNtdC3HLHNdyRq8ECbxHhUKGU76Bvghftkd4NVyp7Puh8Lt9EF6Ti9JRy5u4pYn8vwZmandNicBf/zdLAIWXTVt1VsSrKFsmbjqL1YGrPoT1wMAGY4SRNu6MMRSl7KB0z8rj/VOLY5d6gHvDmpBsvm72JTM0tqsN9tjStpWlKlExam+t83NsYIjpghH6RDSR0lCEf9qm8NlEjnWAEhI2wWf4j4La01pksG+1lQAuQbXFU/SVc6iq8nq3BaBXAHCIsWXp8M78thHy7bUN9cnsxcLxQpchLpyA6aY7Ti7FJUarzB5myBUHBm9a4oePlfdbOSV29gWusRaxu4R8WZwOSUoY5L813TRMWssG8PXiHdcwmYnlMYfRtgLsJXK/1sP6ihviErzZGib22ls1Zy5o9EIJGS4ordcULcy9imKb/4qfpAj2cY2Ds7Su07pKHNHw6bqVYqBKzwv/sWNluA4kVWGTvy2n9eW8n/HyBHEfdgbMYdkoPxg1JDddEdc0idh/qwiXhWnEVV+OGui5XtpnESsPeqnNswKY1tFa26nPaTpMlrCB91FI1zhysrEW1EYJinfrZbF8lydJz8Ju5aFQYLl+Zq6iiMdV6wTDVyleanncJMPHhBgrhibVIVQAhxXG1au+tOVBcPtO/u5PVTz2YXhJ8mEQvQYasuHfEqPVkzzsCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39860400002)(366004)(396003)(136003)(4326008)(66556008)(2906002)(8936002)(316002)(5660300002)(6916009)(7416002)(8676002)(31686004)(66476007)(54906003)(66946007)(36756003)(86362001)(38100700002)(478600001)(186003)(6506007)(6486002)(26005)(2616005)(6512007)(31696002)(41300700001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU83ZWlURFVNbnZqTmlqNjVCYmFnTllJWmYrT0FxVVpWVlFhSGVoSGJBV1NJ?=
 =?utf-8?B?TzltR0xKRm5EbjdnSWlhTmVIM2x4UGczUkdSMFNEWDlLOXNNUEhGa0FraHp0?=
 =?utf-8?B?VVlBKytrUHBZemhGN1RmOCtjenIzakRUY3Q0SHVGTTFvQnc1L3NhUzJvVEI5?=
 =?utf-8?B?MTkvcDcvKzl6czRBc3dReUx5U1lkZlZJdUhnT0V6OUQyek44Y2MwMHNBek1J?=
 =?utf-8?B?ZzRLdTczbWJFa1VURzdLT2VPajN6N2NtSGRqTS9QMzhVUTBockJiN0laUm5p?=
 =?utf-8?B?c1RWNndFcDZQVTFDWFhhZ05Cd253Znc2bXphZU1hdTJtWGdBNDVralVDMTgw?=
 =?utf-8?B?M29ZNFliRHNneHg5dldVTHBzYU1lWVZVUTIwK2RLa04xQU1ZaFBad0xQbDla?=
 =?utf-8?B?WjFxejBJdnBqUXpNSFBTSHVlNjZwOVV3TjN3SHJKY2crTldFQVQrcFEreDhP?=
 =?utf-8?B?SmlUNVJvemQrODFHa2dxY2d2R1cxc3hEa1R0bjRtejFVZVVZU2g4TFNNc3RG?=
 =?utf-8?B?cDhrRm00R3poaWd1aDlHZDk1SEpadEZlSXFEZTBJZVdlSWxYelhFaTNMRHZK?=
 =?utf-8?B?dGI0WHd1eXN3T1N0aU9XYzN0MXI0Q0cvUE1zT1o4YjEzeUlMbys4a205a2p6?=
 =?utf-8?B?QUkxWEEyOWRPTHR1OFR5dUNBaktsbjl4RVhoVmxscHN0VjFsN1ZqbHdXZDIy?=
 =?utf-8?B?aTUwNXJ5KzNwQ2kxbS9nekZkL2J4elpkUHlKbytkN2R2OFdxaTN6V2QwOG5U?=
 =?utf-8?B?L3hldHdmalRkZGZtemp6R1pYNURONWg4VXlMSG11a2I1V2FEYU5LdWRmN1Q3?=
 =?utf-8?B?Q2diNFB6dE9IcUozSURYbnlzbEdQaDBPZ0hlVUk3R1hvMzVQc3habU1SR3RW?=
 =?utf-8?B?VExyRlk0TGFWUHFlWjBLclF6eFJJVllGMDljbmVpOEhIaTRNcHlydW1Lc3JY?=
 =?utf-8?B?bjRWUTRYYm5pRHBVZHVGWXlIN0xlaDZuaVRrVFJaR05VaElQdkJubTRpcUho?=
 =?utf-8?B?Z25FakV3d1daVWFzQ0w1bzJ1VjZ1NjE2akJvc1A3M2FpSS9WMnZ6emNXRWlZ?=
 =?utf-8?B?UWNrWFIrL2pUQWpXdWpVeUZWbEdoREVaaTc0WGZDeERwRGw4ckRrb1E1ZTFr?=
 =?utf-8?B?OWJqMERpb0Jrb3RROGdnOG8zeHh3aERDbyt3NFZVSklKcVQyamRzVGl2WHVt?=
 =?utf-8?B?S3JhditROU92OU5CUUhTc0RWSGdvbnVDSVQranAvQWxWVDFFenRpRWpqcEpa?=
 =?utf-8?B?aVdvZ1g4cEVaWVdYZTZ1emRrNmtBT3dwMUpDdUxkN2FGakg2UFEvcWRPWkds?=
 =?utf-8?B?b011TGFGZWU1eUIra1pzeWw1SmJKeGlLUFhyRlhHbmlibzhyYnZOR1orWk5R?=
 =?utf-8?B?UXZjaDNPczFDcjVuYWFkZVNxNDNVSmpMNnIyR29aWnQ0ZWZKd1I5UnRjek1q?=
 =?utf-8?B?VkNncXY2TGxHT2VtU0pYQXFHK01BeUNEQWJjQ0FSZXpvTEM3K1cvWm5icWVB?=
 =?utf-8?B?UldISi9IZjgwbmZNOGtjaWZGSXFnQzBhc1RRZHlGRG5OR2kyNkdIbFdaV0M0?=
 =?utf-8?B?WW5XNDJROVBOVE1HbDllaVhKa2hOUmprb0dnTUxYVzJWcTRGR1BRdmtPVXdm?=
 =?utf-8?B?dDRSeFhGMDFIalJWZ0l6L0g3YlZhV29xa2tOTlBZUmU4L05YOG1meCs5azR4?=
 =?utf-8?B?Sk5KekJMd2lUdzdiQ1BNT0JNTVpWbkFBNklOM08yTkRSUHdoMXBzNTJ4MXNB?=
 =?utf-8?B?SGdIU0l6VnpxZ3VLSjhFT281R3VTczBMZXR5Q3hsczlSVDBMZWU3NWNNMmtJ?=
 =?utf-8?B?MG52WGIybTVxUTY5TzdOcWltOWFESTRyZ3JkdGxoUHdod0loZHpVS0Z2Rytw?=
 =?utf-8?B?TkRDd1MyNGFSaVJLSUd0UDBLRmpYbzY2L3ZGZitBWWViRjQxSlhtaTk1SFRG?=
 =?utf-8?B?L05DaDNCbHZZRmdYWldXV0VEUzVlV2pHQXBwVTZZbDYwM1J4cnpGc1dnZ2hH?=
 =?utf-8?B?OXhENmRNa3N4VDVrdzByM2dNV3FKNlFJbFhjQkFZdm5oeWhCN2hUdm1PWG84?=
 =?utf-8?B?VGIveWJsOHVhMU9BcHdtYW90V05hai8rVWg0cFk3SVdhWDFWVFdPY20xb3ds?=
 =?utf-8?Q?gXv01BOvrJE+z5FQDW2v/5wL2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ec0a5-5374-4bba-4219-08da6e5279a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:29:33.5821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3k3fe3WEfDiz1c0+o0us0yLjAU4SWOvSjdaupGI9sbSEI+VrIVb15Cnp4A4NQr/1z0DqKDRacuhqNHpY6zSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3964

On 20.07.2022 07:46, Penny Zheng wrote:
> Pages used as guest RAM for static domain, shall be reserved to this
> domain only.
> So in case reserved pages being used for other purpose, users
> shall not free them back to heap, even when last ref gets dropped.
> 
> This commit introduces a new helper free_domstatic_page to free
> static page in runtime, and free_staticmem_pages will be called by it
> in runtime, so let's drop the __init flag.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless two remarks:

> +void free_domstatic_page(struct page_info *page)
> +{
> +    struct domain *d = page_get_owner(page);
> +    bool drop_dom_ref;
> +
> +    ASSERT(d);

I wonder whether

    if ( unlikely(!d) )
    {
        ASSERT_UNREACHABLE();
        return;
    }

wouldn't be more robust looking forward.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,13 +85,12 @@ bool scrub_free_pages(void);
>  } while ( false )
>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>  
> -#ifdef CONFIG_STATIC_MEMORY
>  /* These functions are for static memory */
>  void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                            bool need_scrub);
> +void free_domstatic_page(struct page_info *page);
>  int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                              unsigned int memflags);
> -#endif
>  
>  /* Map machine page range in Xen virtual address space. */
>  int map_pages_to_xen(
> @@ -212,6 +211,10 @@ extern struct domain *dom_cow;
>  
>  #include <asm/mm.h>
>  
> +#ifndef PGC_static
> +#define PGC_static 0
> +#endif

This disconnect from all other PGC_* values isn't very nice. I wonder
as how bad it would be seen if Arm kept its #define to 0 private, with
the generic fallback remaining in page_alloc.c.

Jan

