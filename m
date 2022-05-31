Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F40538CFB
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339271.564104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxNB-00023d-Gb; Tue, 31 May 2022 08:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339271.564104; Tue, 31 May 2022 08:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxNB-00021I-Cg; Tue, 31 May 2022 08:37:05 +0000
Received: by outflank-mailman (input) for mailman id 339271;
 Tue, 31 May 2022 08:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxN9-00021C-R4
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:37:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d54a852f-e0bc-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 10:36:58 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-AeFmhA16NrisHjxngcJEog-1; Tue, 31 May 2022 10:36:59 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 08:36:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:36:57 +0000
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
X-Inumbo-ID: d54a852f-e0bc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653986222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plUvyu+jMPuD6s3oTwsFMxsNbOlAIf56SLfvlxkIZ1E=;
	b=YLap8ZM5HxP3cxMvR8+u+pyh/yxbMkwWt6P/v122/WtHUAcNUATPAh5B2wamvBhJqp+N74
	GuFaJDqchJntNGdWs+WAt6jOVLDQqJjd1a/sP+cZuLZzQFy2Bnkk9KC2SomWeyR40c3k2i
	IaLR0KDh++Y813jCh3ZpzjyCCtI88SA=
X-MC-Unique: AeFmhA16NrisHjxngcJEog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRnSDadgl7SMWFbnPyAGnlf+XqdY4nU6Vud84Ch53gEbOtdNUdxW9w1uwlOExqlxScW2Bs9NcZHC1761Ss72WBVZYjtF0/9P71jD9B0mgxG7fuUB6JsOhssCFwvc3/oy9M5OARq3KTd11oVan5c2EBBC9XdIPvq2d8FCHINrzw4mrSCSnE0qUhBMrvYAZK293gd45eeC6MgQ49S9PdjOop8CzctJATgb3MxNbYYSMp0uGrtZiyXWuZxWgwxH8pltxfgFggbGynj1l28JJy0BWfBM19yqwpVut33wafKqb4de2IEJ3OU+Nz9x13TT9kQ2JMUGr/IhPMflWjlHbCf9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plUvyu+jMPuD6s3oTwsFMxsNbOlAIf56SLfvlxkIZ1E=;
 b=bOALTS7kwIU3bJqAAon4+AR0pIIfF60yJTNRSX4/OhNAH1JY8YfnTAjaQ8GbuIJ+H/lYM7LWBr31kGSyuLsTG0fzYNBD7DACgOax9U/otph+OR5cerzCsCfic7vRD1yPrpsZoQACP/rsUBNBOUUst2ZHNBfCxBh2J2Ah6FPJW6kyC7GX5LJgZIuEhsn/jbKhlaoQzeTiXxzlzYwZehozGLIOK9lr5GHL4CNqVWAZWNLNsIxoDwZfGjOD727vkBLr6uXZoCSlPKHRR6lIzCW/QNse8vMt5hB3sCczDf0h/sq+YzFCqrnVkGVRgtR3m73yzSZDN7tFyqpIH/iRI52fDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f0d9d47-236a-d7c5-3498-d8706c616fcd@suse.com>
Date: Tue, 31 May 2022 10:36:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531031241.90374-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:203:51::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8780d869-b789-4bb3-01b9-08da42e0b94d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8583:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8583CC2667C7CBB5639F402BB3DC9@DU2PR04MB8583.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J/rPMJk1WSjQTS8DAJHrAoTToKMxoxv8utotsNeH5ZJeNniGIs8FB/UKhlhUVWKj8FnXNqr9TM24O8yPkLaRm1iVO2V3j12fhKfuzbIs0akOBZK8SLG8L35nkoEgAYi1IGQI+YHjK1dK2GVJUcB8GmnE73Z4L/j5oK/alvf8JFbIrBu4Hc50O7icC5XQgyFHbTK8gMzsVOC9yUknXfW6JBc9Na++eYvKpUKh0rX6prE7pFuhffBoxHTtSuWnsd22Csblzhe8Z/C1LJ0m3iAcwfccwTWK2zYoOn4RIYizgtkqyjGhgZPjGanbQtrzq9YPKLrb5FxgwGLroOnfaz9PaE7+F8/VZMH3x4ICcNCCiKmI9mJ7sq3DYF3T/9Zsb6ehYLi87BJvIpuNF8zopjtvAkcS1DEDQM57xTf8ZY+RWsr+FkxyEgEBYAWULTUGXoEONeInZhuWodTPp3xisFuCAQnEk0d6T07xKUmW/Zwqdiz8/JqTN4Z34KDzDqO9XMh5IsREOOSOg0272meSjjEATxIhefe7FjpyZ/UTifFP9Gdv4aAqEDyGB2L2ISksYTFPxBHWCEHXcmSRjCdNY4KMwdkx36ukIfEtCZMx96mCFNaxVIPjBawtZWrGPTDZenyu4T1zXZ90nl+a5gZlFKKBwtFi6IUvc0GmOUI0FoZQvOgh8YNbheEf+zNzTWChBL718TXdQBRarVn5I34R/kKN4Sv0wpnmPlO4YGC9v4mMsowawQ/mPirnZRr4hE7o5O66
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(186003)(6506007)(53546011)(2616005)(8936002)(5660300002)(36756003)(31686004)(2906002)(7416002)(508600001)(54906003)(66946007)(66556008)(8676002)(4326008)(66476007)(86362001)(6486002)(83380400001)(38100700002)(31696002)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlBrOHBrbnpzeHZqSVloTVFhY2JuSWZ1RXlVTSt6TWdkcFc3WDk1NllFTEEr?=
 =?utf-8?B?WmNRalRMWGNIMzh4M1JJNjR0SG4xbXhGV0lKT1VBRVFFTFZhV1FPMi96VzZD?=
 =?utf-8?B?TzNVMVltWHNSUk5ZK3dUYXA0VGJITzdkVE8wTmNsOFd3elpLVC9wamkzcDBC?=
 =?utf-8?B?M3F1Vkx5c1ErZDJDZzRBdGtrVVkzSjJ5Z3Q0b3k5YVNCM09EWExFQitYTVVC?=
 =?utf-8?B?MVhYUzdIM1VwRDVxNzJBL0sxZndkWE9rRnNyNXNhSSsyUmhyei9aZHVnK1gz?=
 =?utf-8?B?Q2NKT0ZaYS9GemxMRzFneUQ2cFgwQkEyQmJtNmd2dWdIc1Uvd1R0cFhZTmlT?=
 =?utf-8?B?T1Bmc2RzSkRuaTQvMnppME91SXBXcHBCblNBNWYxWGtxQ0JNeEQ5ak94VUIw?=
 =?utf-8?B?emQ2d1lyK1BaSmVJMEJPRTRNMTRtNmhJYzJFS3VGb3JlbmNtMnNOUzNzbjJ4?=
 =?utf-8?B?dGswM0dOT2tLT2ZPaXU0RmpVQVNES2hGa3dHVktkL3NObS9nN1gzdHRydHMx?=
 =?utf-8?B?bERRZmE2V29JVldvQTYxVllIZzF0NmxPb3crMWF5c3Z6QnFyNm5XZFhGUlZT?=
 =?utf-8?B?dkIxVkdqY3BZTkFTd0x1Ykw1ZUZpV1BId1dxeWo0cHpUZEJZcjZvMjlvQzRm?=
 =?utf-8?B?ZTVDdUxoNk1BVnNhU1RKZlV3eTQ3OEpZNnpaakx4dy9MRCtMempZVnlzM2Mv?=
 =?utf-8?B?S2E1SEI0aTdZdTJEWkpDWHhvT0FuNlo1YkJvZUNTZWRVRGZNbUYyWmxYYXFy?=
 =?utf-8?B?dVVHZ0pSbmlmbTRhbkZIb2ZiZUsyQUdIQkxGUTBhT1F6c2V0c2J1ZmZoSFk4?=
 =?utf-8?B?bEVOWnNBLzRLL2k1ay81dFVFaGgvQ1ozUEd5ZTV5UlF6eE5KeFhrVjdGVnd1?=
 =?utf-8?B?MXJXdFM0VjRzblA1YWN5YWpMTlVnSUtwbmdtRkNnbjFpN1g5QS94STZSSzQw?=
 =?utf-8?B?enpTb3hyVkluS1JjR2UycDRUVEJ4a1NFQWpnZ1FVcTRhUERmSVJpR1NRZ0d5?=
 =?utf-8?B?aEhIZXNIUEswSUpQOG1SaFBUeW1KL0MwUmwvSDh2R2NzRllRa2d0S1B0Tnd4?=
 =?utf-8?B?RXh6RUtDQlhSVm9BalZsNmxSb1k1ZjhreXEzdlFoS1NFK1hEM1o4MlRpVFNI?=
 =?utf-8?B?MUN1T21zNzZET1hqd3hOWHZUcEM3QVo2MEhQeHdNSWx2SmF0R1lEQm96bG50?=
 =?utf-8?B?S2d1TmFkOVpMbkVwVTl5WmJYTGlBUHVhbGV4LzdVWldxMXgzYm90Z0hwZWt6?=
 =?utf-8?B?ckNENXR6VEVzMXBiTzM1RkxVMXdRcjlhU3FndzN4eW1tSXE2a2JzcEpLUWpD?=
 =?utf-8?B?UjdyVmtydnNoU2krZ1ZlSjN0TWZHeWlHQWVaWGVycVpDdzFYMkMyTGc2OHZa?=
 =?utf-8?B?b1V2c1pvczFKTS8yTEN6VzdIOG5XaWN0Y0dZdy9QeHBRRmk4dFZGaWhaTDZD?=
 =?utf-8?B?eGdOUUthNGJ5MkN1eTBwRUdZeUZCOXk1YldoTGtXS2NCTUdqckxCeEdkTGNK?=
 =?utf-8?B?SWlIdHRBTUZ3ZmVMZDB3cmVwWU1qbGxvaEhEdDhUczFCVjlTendNOXZ5NFNu?=
 =?utf-8?B?U3hUVSt6cjRGT3U2cHRQWkkrU1ZwblFwOTY0M3hYWnI1a3R0UmRXLy9rWSs4?=
 =?utf-8?B?TC95b3FFU0hGQkoxTXRuNlJyWFFvaTVML0kvNUUxQkxnajNwazRoOWJrR3dp?=
 =?utf-8?B?SWxkNFZKL1lFOTZJQUtPb01scTdzTHBXbXVIQmJib2hhcSsxVkpET0R5enBj?=
 =?utf-8?B?ZUljSnNoMFd6Y3RLU2VJVS9pVUUvUzVkc1hMck1WS0FUeHBHblNnd3ZDTXA4?=
 =?utf-8?B?NkNVZFEzckU5VmpzempTdlNvcmZGcGhoZmdKT0VFVGxEcFVIWXNla3ZGaGxx?=
 =?utf-8?B?SEMwbVovYWkycllTWFdiOGNzenZJUFQ1U3ZVOWw2OGgvSitYZytaY0VmeVoz?=
 =?utf-8?B?bWUzV0RNbGpmK3NENE4vSGY1VG5tbFd4SXk1cHFDdkpWaWpMWTI2OFhmU09m?=
 =?utf-8?B?M0JnMkxqSDI4cXZvSnBLa004Z0cvVWdVUkJZZXI3ZE1XR1NtdTlWNEZpYUhM?=
 =?utf-8?B?aXUwV3RSSVIySVE5SWVHOVpucERaZ2RsK2ZmQS9aNlhRMUZSelRRdHo2U2ZO?=
 =?utf-8?B?TVJrQ2JydmJUTVNrUndDdE5laE5ZQlVERTQyWFJCanpkVGFiQlBmK0N4WS85?=
 =?utf-8?B?U2NyTlJLWlkwRkpTYlU4UVExNVpKb3FLMkc5MlZyTWpneTc4bVg1anBJWDFU?=
 =?utf-8?B?WXdISFptd25YaUw5QS9qWFBBa1g0aUsrUGpYakFWNHdKUkpqaGU1cDl4ZDJV?=
 =?utf-8?B?Qm55UmltNEdYMHdNTlpPejJwdHc1YVRYOHVIcFdXalBGRHI0ZlhLdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8780d869-b789-4bb3-01b9-08da42e0b94d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:36:57.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gANvYMhyJfmtRcFuDIKVOIhvbhFYAgGiqmxOqJtH53qYyIRVJKHOChDb/x6XAxhuP5WuhkLS9meUCvC7MS2JdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583

On 31.05.2022 05:12, Penny Zheng wrote:
> Pages used as guest RAM for static domain, shall be reserved to this
> domain only.
> So in case reserved pages being used for other purpose, users
> shall not free them back to heap, even when last ref gets dropped.
> 
> free_staticmem_pages will be called by free_heap_pages in runtime
> for static domain freeing memory resource, so let's drop the __init
> flag.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v5 changes:
> - In order to avoid stub functions, we #define PGC_staticmem to non-zero only
> when CONFIG_STATIC_MEMORY
> - use "unlikely()" around pg->count_info & PGC_staticmem
> - remove pointless "if", since mark_page_free() is going to set count_info
> to PGC_state_free and by consequence clear PGC_staticmem
> - move #define PGC_staticmem 0 to mm.h
> ---
> v4 changes:
> - no changes
> ---
> v3 changes:
> - fix possible racy issue in free_staticmem_pages()
> - introduce a stub free_staticmem_pages() for the !CONFIG_STATIC_MEMORY case
> - move the change to free_heap_pages() to cover other potential call sites
> - fix the indentation
> ---
> v2 changes:
> - new commit
> ---
>  xen/arch/arm/include/asm/mm.h |  2 ++
>  xen/common/page_alloc.c       | 16 +++++++++-------
>  xen/include/xen/mm.h          |  6 +++++-
>  3 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 1226700085..56d0939318 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -108,9 +108,11 @@ struct page_info
>    /* Page is Xen heap? */
>  #define _PGC_xen_heap     PG_shift(2)
>  #define PGC_xen_heap      PG_mask(1, 2)
> +#ifdef CONFIG_STATIC_MEMORY
>    /* Page is static memory */
>  #define _PGC_staticmem    PG_shift(3)
>  #define PGC_staticmem     PG_mask(1, 3)
> +#endif
>  /* ... */
>  /* Page is broken? */
>  #define _PGC_broken       PG_shift(7)
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 44600dd9cd..6425761116 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -151,10 +151,6 @@
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
>  
> -#ifndef PGC_staticmem
> -#define PGC_staticmem 0
> -#endif
> -

Is the moving of this into the header really a necessary part of this
change? Afaics the symbol is still only ever used in this one C file.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,10 +85,10 @@ bool scrub_free_pages(void);
>  } while ( false )
>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>  
> -#ifdef CONFIG_STATIC_MEMORY
>  /* These functions are for static memory */
>  void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                            bool need_scrub);
> +#ifdef CONFIG_STATIC_MEMORY
>  int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                              unsigned int memflags);
>  #endif

Is the #ifdef really worth retaining at this point? Code is generally
better readable without.

Jan


