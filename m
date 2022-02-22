Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461314BF4B9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276582.472783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRUk-0005Lv-Hw; Tue, 22 Feb 2022 09:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276582.472783; Tue, 22 Feb 2022 09:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRUk-0005J0-Cm; Tue, 22 Feb 2022 09:30:06 +0000
Received: by outflank-mailman (input) for mailman id 276582;
 Tue, 22 Feb 2022 09:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMRUi-00059y-Ut
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:30:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0399790f-93c2-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 10:30:03 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-eqG4bk48PYudGDjzL3Exsw-1; Tue, 22 Feb 2022 10:30:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7710.eurprd04.prod.outlook.com (2603:10a6:102:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Tue, 22 Feb
 2022 09:30:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 09:30:00 +0000
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
X-Inumbo-ID: 0399790f-93c2-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645522203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxGUja8wR0wdlRFQGPfsJs8qAIY2KjxDeviwEOwRZZ0=;
	b=YjHgoccoQh8ktsZCCqktC6Ze4Pgr+bDQNyAXRKu628hSkODC9ieJMnq9CAP14XxKjhPitf
	OxvZH7ceNK/H2i1+y75zIfh80/ufTKzTvuw3evKZMJy8xfax86eQsrWOVKYhDea+D5woPf
	GZ7k7tLcyCU966xyuC0y94XlMnMAvpE=
X-MC-Unique: eqG4bk48PYudGDjzL3Exsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTq0/9HUQUUbSvb02ZYhG8NNcDrlpLQmaXic0bNqi0dFnKAai8q5PQTEU994Ih5FrUQtY9dLXNEyWtMeXkbzqXjs9QHi2U1YvSkxmoA1oAEzMbYE7BtxvfeBMKXK/kJneI+AMTVMhM8SJDc1/H0bbn0Qqk+qRJtSyfvYYG/t12ks1YGSLZ0prBTCCThcj9x1j61eHl9iJFQIYN6aeeT7xlwcOv8cKlAok6yojEvNK+q9W2gaUePTUfNjuy8TnfQs6S+mJXsucIgtMUnLWZdyfGzR+U73cNa4CqmI+wKD849jSwLT7a33m4AitTagHUuQ7TIcto2Xm+AicFScYSQ2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxGUja8wR0wdlRFQGPfsJs8qAIY2KjxDeviwEOwRZZ0=;
 b=mRdcMH2ivgKtmytdDlMMSioe0cG2mHN+8915FMMFhLI6eKHGtiOJqWtfGrQWO1tMIw4EoxdskMm1m2c3Tumrm8juCPKks6oJKFJ9wUsln5jG5Hqz/FDO374Xxzair+Dd3os3yCkAkUmgXF/Z0jueHAdBdmxRrk5DkSJ7OMuD42/5p5srJFX5F0137Cn1b9vyk4pCxcycgRcduUHPB278cOYP2GcTfZltX/owwpLLC3gcDJPwpBC9+hlBN1WfseTFOSxX8+5ArYe2QMuDjsZBZm8qiEnUP04mHjlUMx034Uf+g9Hfkkz6JUjcKENYtZQqL/tKydV6shgLGs1DRqkAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
Date: Tue, 22 Feb 2022 10:29:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220221180356.13527-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220221180356.13527-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0032.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97dfaaf0-3cd1-4dcf-2cdb-08d9f5e5e5f7
X-MS-TrafficTypeDiagnostic: PA4PR04MB7710:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7710372B77F097A8185F66AEB33B9@PA4PR04MB7710.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yX6QBG9JCgKnIbh4oDDumcTWBgwtDQe/RyjyXDUTXE++CPxQL5gdLkpLoYmByEvzQS89t8vh0UdSAb0TdwORBIMfo6rZngoA5QhTWL00QsTlGcbJInSG5tWdRbu5hh5iK7FkTwyhUrwP8nv7GZi3PfF6oJ7QJUZYXExx/LUecRlBePVvm84rKvDhzNwt82bebDw0/63JFKuOk7xz1b00evyofjykD5AZSyJSj4i2a9XcEa5pXYLScQ6wJOacFcEiK83dxKh6A+aqUdlO+43LI8HRhTqf76Ls4pnWalOpnXkCdL1Xue8K888TQdTTHSzKtmSxnFR/cP/8gqFDQkwgjm3aS4GB7XvUTka07zabbJOwi308Ejr3riHsqeqdoZGLfayDyAiWP+KwSoc9E2HwA5uIkc06ZVCM9lc0hONjkVQbyRjrdtEv+NPp7EWd5pfHZ23f+OXy/q/KY2O1E3HOZcmvL4eaQ9z4gdPwy/rx41DonGcLrwvhQaIJ9TKRy3pMf+T0+LtJV+8RlXNEj/iRc59ZSSIg7Z7H6LRVbW9qxRQDLZ4LfkvzyQgCx5LlAHW/yDDIKRXN6d22fAjotyDcpUmoB8gdHfZJGKQDBQG6TcneChx9PF1krtqTK+G1mirvcBoUOJGz6K7Cfa0i4Ht+QIf6ec8SAk0FYYFjYg3JCyEjtu709xQ2OWhypLe6KxpqLKGNEQ1RHap8Jq207D8wQxJJ2av0qxMwNVrkgvCY3eXvdoUup7u/8EwkCmTIqrJf1csQxOqfRTn42PX29w0btREfqjyekFz0Zzpzv36NXhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6916009)(38100700002)(6506007)(6512007)(53546011)(186003)(26005)(2616005)(83380400001)(31686004)(6486002)(508600001)(5660300002)(8936002)(54906003)(86362001)(66556008)(316002)(31696002)(8676002)(66476007)(66946007)(4326008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVBiRkJsVnZaenoxbXc4RWlwMVFBdytkdjZ6MWV1bmF2SWhOeEtxa2NGdm1m?=
 =?utf-8?B?V1d1S1l1VDRma2VLYTZkeDJsTjFKTnE4NzI0REZxb25DejY3VUdqeFJDaSt5?=
 =?utf-8?B?Q0pITDIycll2dGZaWVhLQ3Q4dDZYV1I3ZVRvTnA1cnFlbzlzSHArVkhCVmVE?=
 =?utf-8?B?QmZMU05sbVlPbVhkWFE1K1R5aHhPK1M5YWJldk5lemo3cUY2cFArNFZqS01N?=
 =?utf-8?B?R21Pa1RlU0pTdUNlYW1saEFPM3FRSThXR09PMzJYOTFEaDZTTWloVHYvRlov?=
 =?utf-8?B?K25UYXJhc014YlQ0QUJWQ1pLakk3R040bXhxaTBpUWRYM3NPZk9LcWgzbmk4?=
 =?utf-8?B?aFVpa3E0azBRK2UrYzFpeW1valRXMllYdW1DUXUrQXZGOU41S2pTVm9OMExU?=
 =?utf-8?B?cVZ4M01paCsvRnF1YmdPWmtRV2YvMm9BWEl1TmpjZVJoa201UE43V3FBbHNX?=
 =?utf-8?B?VUdjRW90aTFTYzFNNEpwRXRsaXNvSU0zZjF5NnhWdS9RcUZxcnZZMXJRMms5?=
 =?utf-8?B?Wkpvak5MTFhTZEpzYkVXYStnbzhMS0RDV2ErenNqVFl2YTl2RStSaTFmMkNh?=
 =?utf-8?B?MTVFVjdTeE1ncjlDanpoM21oUmxxeGs3WkJpdDVmTDNoOTI2TmNYcVJVUTJQ?=
 =?utf-8?B?ZUpMdHpPNWRlSERXVjB6S2plQlJCeG1ZTjl0aHo3emRJZDFjZ3BVSmIwbWll?=
 =?utf-8?B?bUltTUQyNFdXL09jUDNheVMvMnBhRnEvZm5jbFVnRmlZREIreWpPMlVwUjRM?=
 =?utf-8?B?NSt1VWl2N2l5WWZXenBjeEdjZzVtWE0yckExU3VybmdGQmJXUzRsRVhjUmVG?=
 =?utf-8?B?L2I1K0YwUzZYNEFza0pSYlA1VVZXUld0eS9sMEIxQ09HRWNMM29KaWwzSDVy?=
 =?utf-8?B?NEtsRDh2V3VONUJxNWJlcDRCSERPSU4wcEpHV0poSUpLOFlISUpzWUxyaXhQ?=
 =?utf-8?B?KzVOK1NmalliajdPUk9DZEVYNHZHeXpCSHo3WVYzVjNReUsycHF2K2syOEcz?=
 =?utf-8?B?UWVwZXhPVW1LaWkybHdHaENndWtha0dPcmxNMUdVTWFFUVNUUWxKeTM4akRk?=
 =?utf-8?B?NVhpeVlOeFhJMi9ncGw2eGloMG40MUxpNndXY0pZcnR2N292UUpSNjAwOGZT?=
 =?utf-8?B?b1NLYkd5eUpiam9IU283NUd3T21rVnJVYTBzYkhGVzJJT0RKb2pIMWdISHVB?=
 =?utf-8?B?RmZmVkxDaW5JWUhUU0R1VVJ6YXpWeXBBT3RvSnNERkVFWVdOZ0w3UENPQmFS?=
 =?utf-8?B?T0h1N2xXbEw1RzVPZ25yT3dZYjRmK1NQT1NSeGdBbThRaE9WRUJ2UW5uZTlI?=
 =?utf-8?B?d0d4MGRDcUlxQ2hQVXBPblNlVVMvbGRQdHlSNDJ0cXJNV0pPKy9MWXpvU1pM?=
 =?utf-8?B?eFFwTnZOZUloRS9aSHpFRlMwbFNUQVZjdFNUNXN3NklIOFBIeGNzSGJkYnBx?=
 =?utf-8?B?WFkzbWY1NWE1aWlBbS9CSGpaNHN4Y2VYSjgyYUZBTFVPM2pMZmx5cHlGdWp1?=
 =?utf-8?B?ZTA5VE9zREhZOEVxUm1FNEJwWGNKbEYwQlNmOVhpWmZNUzR0SXNaY3U4QmF2?=
 =?utf-8?B?Nm1mYW9LYlA3bzNTaWgyYkN2L2xhRW5FNnNNbmovaUc0ZEZSSjVTZjBmWXNI?=
 =?utf-8?B?NVZlMmhhQUp0bWR1T2pFOWozenBJNWQ3eXZhckxIWlZobWpDbUZtbmRQL0px?=
 =?utf-8?B?MkM3QnM1VU5wdmVseWRhQmpXdlNEdXNvbkl3WUNDd004dnA2dStNbVRTSUMw?=
 =?utf-8?B?eGRWZzIzSDVpQ0FnRHo1eXpaZ0hmNHpDdWg4QzNmQmhQVkFkcEVTYmtRbWNV?=
 =?utf-8?B?WHplM0w3SzZGa1ZhNkZ4UllQUE43cm4xR1VRRms1Tkl4ZmtyZHpoRDV0b0wz?=
 =?utf-8?B?WTVjMnk2dllIaEFCaE1Wa1ZMOVp4M2pCby9sTlhEaGhnVE5yUVJRaTgyOXhP?=
 =?utf-8?B?OUMzRDhJQ1gzb2J5clRtaVM4VEpJN3g4dUhvbmY5TWRQNmk0OE01cFJMRjBp?=
 =?utf-8?B?VzRmQU1ObHlpaFRqMGlISnkzSzZhL2xIRDF3cDM0TFV0dEdwTzB0NnMrR3d2?=
 =?utf-8?B?MWlHRmxMUU54bUNLbUloQjgvcWY4bTBaN3IybXUvclF4d3orbHBINVIwUmRX?=
 =?utf-8?B?QXNaaDY5TkdjR0RCTjNjZmdkVHFYQ1VqSGZmdkN0bERNTnQ3VFNkZ25DZTlu?=
 =?utf-8?Q?3B5DkjZPIwkN6yZdeVrm3FU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dfaaf0-3cd1-4dcf-2cdb-08d9f5e5e5f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:30:00.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kam0QuTfoCaJQumX4NFsWVK9gNWkWrK/OloDYXeh/0MdCFIke7pXe7kEa13yLUWjHrKi1KZBeDGFq+TimdG8AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710

On 21.02.2022 19:03, Andrew Cooper wrote:
> Most IOMMU hooks are already altcall for performance reasons.  Convert the
> rest of them so we can harden all the hooks in Control Flow Integrity
> configurations.  This necessitates the use of iommu_{v,}call() in debug builds
> too.
> 
> Move the root iommu_ops from __read_mostly to __ro_after_init now that the
> latter exists.  There is no need for a forward declaration of vtd_ops any
> more, meaning that __initconst_cf_clobber can be used for VTD and AMD.

The connection between the forward declaration and the annotation addition
isn't really clear to me.

> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -72,7 +72,6 @@ struct arch_iommu
>  
>  extern struct iommu_ops iommu_ops;
>  
> -#ifdef NDEBUG
>  # include <asm/alternative.h>
>  # define iommu_call(ops, fn, args...) ({      \
>      (void)(ops);                              \
> @@ -83,7 +82,6 @@ extern struct iommu_ops iommu_ops;
>      (void)(ops);                              \
>      alternative_vcall(iommu_ops.fn, ## args); \
>  })
> -#endif
>  
>  static inline const struct iommu_ops *iommu_get_ops(void)
>  {
> @@ -106,7 +104,7 @@ int iommu_setup_hpet_msi(struct msi_desc *);
>  static inline int iommu_adjust_irq_affinities(void)
>  {
>      return iommu_ops.adjust_irq_affinities
> -           ? iommu_ops.adjust_irq_affinities()
> +           ? iommu_call(iommu_ops, adjust_irq_affinities)

While this (and other instances below) is x86-only code, where - with
the removal of the #ifdef above - we now know the first argument is
always ignored, I think it would still better be of the correct type
(&iommu_ops). Perhaps the "(void)(ops)" in the macro definitions would
better become "ASSERT((ops) == &iommu_ops)", which would check both
type (compile time) and value (runtime).

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -540,7 +540,7 @@ int __init iommu_setup(void)
>  int iommu_suspend()
>  {
>      if ( iommu_enabled )
> -        return iommu_get_ops()->suspend();
> +        return iommu_call(iommu_get_ops(), suspend);

This use of iommu_get_ops() in such constructs is a pattern we didn't
have so far. Perhaps it just looks bogus, and all is fine in reality
(apart from the whole idea being wrong for Arm, or really any
environment where multiple dissimilar IOMMUs may be in use). Or wait,
there are pre-existing cases (just not immediately visible when
grep-ing for "iommu_v?call") in iommu_get_reserved_device_memory() and
iommu_setup_hpet_msi().

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -56,7 +56,6 @@ bool __read_mostly iommu_snoop = true;
>  
>  static unsigned int __read_mostly nr_iommus;
>  
> -static struct iommu_ops vtd_ops;
>  static struct tasklet vtd_fault_tasklet;
>  
>  static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
> @@ -2794,7 +2793,7 @@ static int __init cf_check intel_iommu_quarantine_init(struct domain *d)
>      return rc;
>  }
>  
> -static struct iommu_ops __initdata vtd_ops = {
> +static const struct iommu_ops __initconst_cf_clobber vtd_ops = {

Ah yes, the conversion to const (and the dropping of the forward decl)
could have been part of "VT-d / x86: re-arrange cache syncing".

With the missing &-s added and preferably with the description adjusted
a little
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


