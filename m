Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1F4175F5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 15:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195400.348084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTlLs-0001FA-UN; Fri, 24 Sep 2021 13:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195400.348084; Fri, 24 Sep 2021 13:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTlLs-0001D9-Qr; Fri, 24 Sep 2021 13:34:56 +0000
Received: by outflank-mailman (input) for mailman id 195400;
 Fri, 24 Sep 2021 13:34:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTlLs-0001D0-2H
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 13:34:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 336a549e-1d3c-11ec-bad2-12813bfff9fa;
 Fri, 24 Sep 2021 13:34:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-_Y7-zfS1O-2kTtxSM_KuiQ-1; Fri, 24 Sep 2021 15:34:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 13:34:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 13:34:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 13:34:50 +0000
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
X-Inumbo-ID: 336a549e-1d3c-11ec-bad2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632490493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vm0NoYzt0htDoXnmvDOfpIHeSYoMkw+l5gL+SKv2DPs=;
	b=msSaBZfdv5JzapX6Xwysk1fxUp1wzRSUFNFNlwrzSUKKSyP/gu/ImAYx1M1YLDqsWQDo39
	aFDOUCml4M+vit10JsXI0gn9rnOFK8dATXohd8PN8H4V7Vv+Tp67ddjd2fghoguV8Vp0Go
	v27TglNanQBd1wV2eNGuvm6C5q5Aw6A=
X-MC-Unique: _Y7-zfS1O-2kTtxSM_KuiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfAqsoJlrXPNN2UTA67MkPT0lxWpaePFegM6BNJGFnYYdRJc1HcK6Jq42kRAKXaRPZ8vmP/5fdp6SKpur3+sPEK2wguz3Xsg/knBxNqseGYenLySz42GlYJWKdCFh5uAOwuOEP9NgKcYnWfmHexU4QSYPENxlHKMJWTN8z/d2g2CHmOC72cLYdEaaVqSLSyiUgk75XG7MT7A+40HkOnGAboYyGwqT3yKnZ3ICSRM2PhnEhfOCXctTYwYGJJfLYU1DzsCIoLkdS3/2FKMaI1ZWXmAU/YEwtyGEVMDq6omxeInNuy70k55E2JIOCGxe4UF0//XPFZA2e15wz2Ho4p/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vm0NoYzt0htDoXnmvDOfpIHeSYoMkw+l5gL+SKv2DPs=;
 b=fMxzWPbRbgrrjPLRG0QPPc4LJ2tcbdLfT8vGQ8f0czuKrPQH+MUHRWG2irryzlN5HS649K9Gutm0DDfNvYUR6uHokQmIqLdnI0+w6ZHsijNFQGDaXPg2R8I0NlMwvwLUczGCdBbw48hPx5S3TFy7s+KI5kLpoFR5qu8Nouf/Bh95l1i0r/2rDps9uaJK8ojJo3MLcAVIQnzREph9xmCEMe4F8oh70cHczjiuR27p5J/OLpvAgkFalycXYcG5DNSE4cTe11Xzv24ykSIAr8xW2Hmh/8En1pnx2JOwBS0fJcbheSl51hFfrcFVQS5VPy6SHw2WAA20TCDv8jLLbLLObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2.1 14/12] xen: Switch to new TRACE() API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920193234.19409-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34bf6a80-d306-87c5-8bb0-6fa1f189ea6a@suse.com>
Date: Fri, 24 Sep 2021 15:34:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920193234.19409-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1fff6a-8592-4075-cefb-08d97f60161c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024A31B362397BB0423A9B6B3A49@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2lnrFOSl8IsMzBvNAYZ+6CYmWZxRUlx5fCUmVrqZMdpWR/2ZGBdYa8DpLpoJj9dfFG+NntV4bK0L8HBbC3g2hg/nZ/UBtY+mnLmupe19ENlI6eNJ5REdwassNCKZIH/D+roy19rnGzb1PgDJjR8QqaiHh6rKM5bVhm3gjN/trm6m0hh3kiMiZXUb9+57K87klDUPOvaLQaRXUmW1ztkTHfJ73Z8G08Q/2hCCd+WTKkI1uQ27I+SDsLtA3XUCrt3aFJ0FvHwqTmUE2InwBYVMtkOMNsbr4WAqH0QcaCimj5/pHW+wXs9W0ZQJxmCyYwsU5+duGOE14LpvR8hPMF96Buc0KyNg8gBWfa5DoE9aidaDb+Hae3iHThjrplEKG14PXQKPRGJwBgNpf4v+9jpbX3bs4+GnqGJ7oZHSxjlmoElYgCm0Zcsp2iwSknEMOWMiDhJKSJoEa0cRsMjz/uTWXGeMgMDLTmlW7A3fRNtuK0AQeF73OU+kUi8aa8eW07t9jzYV6F03BGg7Al1+e03tCnqx76fCdPFeahzfxPA4gpSop1lILMvqOlXDJaChmw9WsCarkBvgXymo4n6fbegzHqn7gkcJKH5r36uPt0MTtgCqVvgMb83c3Frwhmk87aq9Btk3E6mu9bXOfJws53E2YrhyV3w09tggcqDt3wCUvLjzfrbCn0nFdeSzKvqNzW/yXXof1nvql444BE8UVocwKuvX1xVNkc9VD7Qy+ijvkA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(54906003)(31696002)(36756003)(5660300002)(83380400001)(6916009)(53546011)(16576012)(31686004)(86362001)(8936002)(8676002)(508600001)(26005)(186003)(66556008)(66476007)(4326008)(66946007)(6486002)(316002)(38100700002)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9yc1lqckdBWlBlaTRGVFArK2Myd1o1YktRSkRTMG80bW5mNTcxRFlyTnBP?=
 =?utf-8?B?ZEc4RVVnbWJnSUVSOWNGdWtQZ21pWmdIbVFnMTNjVUFPVnlhUmdHdXVTN01M?=
 =?utf-8?B?Q01qdllhRGMzUWpieWpTNmxvbldxZkM1dllDUXdVNStzbTh0UzFtc3VWN1Y1?=
 =?utf-8?B?bUtsYzU5UWtRZjRsRkZveDdzcUJMcnJFOHRESEZ1cHRrY2hNbUxnbUVzWGVR?=
 =?utf-8?B?QVI3WHRHQkJsaDMyQmdlYldxbkRCQXZPdnZSSzAzZFY3NzEyVmZibk1rOXYv?=
 =?utf-8?B?M1BMaDVycnFIUmt2MnA3KzF3Yk5Td0EzRkp4KytiUkwrV3ZESzFRUjNGUklj?=
 =?utf-8?B?UHBEZTQrMDZEcTFMYWI2ZU82WXhYWTRjWGpBbUR2WHdUNUJlN25XU0xreXVv?=
 =?utf-8?B?OWF6a0ZNRC9HQlZWYmh6OVFaRjl0eXduSk83Ymh6RlQyeVoyZzAxajZVdWQr?=
 =?utf-8?B?ejBiMGgzc3BXNVN4anR6VDBQWmVxMTdCZzhnem42dW5WRy8xV0pJOTVSYmUr?=
 =?utf-8?B?WUVKa1RvU2p3b09tV0NmRkIzcXorR0NJTEt3L29lNWsycmZFSldlT2pjZnNt?=
 =?utf-8?B?eDIyVGZES2Zwajc4TlJleWgvblV4Y2o5ekdyK1dNZG9qWjZLcDkwam5ONndT?=
 =?utf-8?B?Y0NLTUhEbklrR0l6ekpiNmVYVTE1OEpEOVVJbGkyTlg4QURrbnRyTzVlWTRD?=
 =?utf-8?B?L3cxT0g1aThBckdtbGUwY3NnRUs0d0VjZWVWVmxCSStyOHNRbGF3Yit6WUZG?=
 =?utf-8?B?b2UzbzhpWkRpNjR4ZXpiQ3QwZkpQQ2RvS2tHTzZiSnRkcGZSb0lmT1o3MElX?=
 =?utf-8?B?UDlrMDlsN3VVUkl5b1ZSaTc1YjZnWTlzbWwzOW1reTZkbGxybHJQV0c2QkJr?=
 =?utf-8?B?WjQvaW8wUmZ0S1N4YVRsQWVEaStGa3BTb3BNcUpOeCtMKzMvK09keEliZksy?=
 =?utf-8?B?ZnZMSDhMRk1jTFY4VEI5a3hhZHR6RXR0TlhJR1NuS0ZSZ1kvUWFFUzRZNDNv?=
 =?utf-8?B?NldsanQ5RFg2bDJVZ08wc1grRGJ0RlZvOTZ5WDhldFMvdExWRXRGdzBtNW03?=
 =?utf-8?B?YVJIbmx4c1crbTllRTkvV1k4Z1QyVXRmSkdsN0orcDh6YXdxTi9lbzk5N09h?=
 =?utf-8?B?c3oxdGNPVHl2RWsrT2lYZko3cEZwSVhaMXY3VUI0dk05Sjk3TmRESlBDc2pM?=
 =?utf-8?B?V0VZaW5DZzBud1NxUnA2RDVGR3laK2tmNjlDTmhzN0l1a3cvUnlFcU5wUGdy?=
 =?utf-8?B?WHUwZmxpYmZ1YWJaN3MxTzhWWmJiREpUVEpmRHNkNDByZWZmQTd5ajN3cHg4?=
 =?utf-8?B?eFFLWmVtWUFMSUtaOW12SG5OSnJFNEpqZXVqWkhBbGI4QjRJVHRZMkdTaEFG?=
 =?utf-8?B?VW1XcFZTRURaQmd1M1A1cCtGZHdrY1BFOGlyRElseUVtWkNTNTVZcUg2OHJU?=
 =?utf-8?B?dWdRS2xGaGYzb29NNm1ValRNcUlIK09nc0dXbkhDbVNCMkhMdk5wSkdGaC9H?=
 =?utf-8?B?RjdHOTgwWGdPUVA3RFc2U1FqTHk0RVlQUGJtS3ZUS0lQVDJhcm90TFdJVC91?=
 =?utf-8?B?ZlM2T2JVaS9ZbnlJVzVSU28yY1NsaElBRnBoN0VUZklSTU5qQ3dISmtyV2Nw?=
 =?utf-8?B?MHdDemRaM2tnRnBpcC9jRVk3Z0ZPWWw5Rkg3UDZESVp6Q0dvc2phSkxaalYx?=
 =?utf-8?B?bWZ0KzliRjZSRzNwN1B5UnhVeTVJeUkwcE5UYVk4R2FJc2daM3JhV1dHVEV6?=
 =?utf-8?Q?eMXlHU91Ls0hnWTECpf7yvz0gfZp2qsaJkwA3U2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1fff6a-8592-4075-cefb-08d97f60161c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:34:51.5229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV4qeOuqOV0KsCF7FdoWtd9OGRwLA8SdDH7E4MjlOmvxKO/oUzGJ8RfE8bAmjJMk+k2+6Bp420J+qyZlXtf/xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 20.09.2021 21:32, Andrew Cooper wrote:
> (Almost) no functional change.
> 
> irq_move_cleanup_interrupt() changes two smp_processor_id() calls to the 'me'
> local variable which manifests as a minor code improvement.  All other
> differences in the compiled binary are to do with line numbers changing.
> 
> Some conversion notes:
>  * HVMTRACE_LONG_[234]D() and TRACE_2_LONG_[234]D() were latently buggy.  They
>    blindly discard extra parameters, but luckily no users are impacted.  They
>    are also obfuscated wrappers, depending on exactly one or two parameters
>    being TRC_PAR_LONG() to compile successfully.
>  * HVMTRACE_LONG_1D() behaves unlike its named companions, and takes exactly
>    one 64bit parameter which it splits manually.  It's one user,
>    vmx_cr_access()'s LMSW path, is gets adjusted to use TRACE_PARAM64().
>  * TRACE_?D() and TRACE_2_LONG_*() change to TRACE_TIME() as cycles is always.
>  * HVMTRACE_ND() is opencoded for VMENTRY/VMEXIT records to include cycles.
>    These are converted to TRACE_TIME(), with the old modifier parameter
>    expressed as an OR at the callsite.  One callsite, svm_vmenter_helper() had
>    a nested tb_init_done check, which is dropped.  (The optimiser also spotted
>    this, which is why it doesn't manifest as a binary difference.)
>  * All HVMTRACE_?D() change to TRACE() as cycles is explicitly skipped.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> I'm in two minds as to whether to split this up by subsystem or not.  It is
> 95% x86, and isn't a massive patch.

Either way looks fine to me in this case; splitting might allow parts
to go in before you've managed to get acks from all relevant people.
If anything I might have preferred seeing e.g. all the HVM*() macros
getting replaced and dropped at the same time, rather than the
dropping (combined with others) getting split off.

Jan


