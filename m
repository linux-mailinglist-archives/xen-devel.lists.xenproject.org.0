Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCD850677A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307894.523261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjsz-0000Td-U8; Tue, 19 Apr 2022 09:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307894.523261; Tue, 19 Apr 2022 09:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjsz-0000QM-QG; Tue, 19 Apr 2022 09:11:01 +0000
Received: by outflank-mailman (input) for mailman id 307894;
 Tue, 19 Apr 2022 09:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngjsy-0000QG-IO
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:11:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a094ec30-bfc0-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:10:59 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-nOQza2sDMu6QOvhZuPEjNw-1; Tue, 19 Apr 2022 11:10:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5178.eurprd04.prod.outlook.com (2603:10a6:10:19::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:10:55 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:10:55 +0000
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
X-Inumbo-ID: a094ec30-bfc0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650359458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FH75j/gPxIjG4KcoeKe+OwXwmNiI3S9NHVYhjyKE1ts=;
	b=R1t0wvK45aIJXXcdDOIXK036SwfdfSi6uvwCNc5Pgu1zaOb+Q9C/F3IWE///pLdxFd8QSk
	mBde4FQeBGPl6wE8CqUAFJuX/T+DPJdFLK1J1DcYdea9qnFZ1XfJ9HSpqCgSUItL3afwNW
	d7pkzFg7IBd2KI7mmyxrC2WxOrb0OCQ=
X-MC-Unique: nOQza2sDMu6QOvhZuPEjNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTnYG8DfVO3BAjvPwN0NF9xCbLUeeZSxnMAUIxGQ+fYw192sn0DrL/S8eW+KhvERFLeQkSHcnbErHqId0bzY5CUMWdXpWGfIwtqKdNFAyVz4FN1kwVekgFhiJVVd3pYym8hAU4oFp/QAhPQKjyIfrrwzMpEVz4qkyCy1CMManhSl4vQ/psHKpwtqYoqSbianPqPcX1qjrRqbSALba7Q42yQdI+B6mCRZMvepVFFqM4rh/ks7lSRAwXNBPjxhKt77Fa0AGtNPbsd/HSISnmqomZaTj/vO1FrRU2Xgzcvx4WJb1xRqZYDx+eXBv+m0m3oFGqRMSwJeXxt+uPwV1fKYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH75j/gPxIjG4KcoeKe+OwXwmNiI3S9NHVYhjyKE1ts=;
 b=kTbtXxewn4Medl9fssvYp0Ht5TYFwh6xjLEcY9bRjo/MiJYQAay/+EXFjWSYqhrx73kdOKVqeJgalD+pAZVhP1Q4RQsOhVF9WhVaQncbjJENy4XX31D/fOavnHbM7n6Mp81awQ6KpoypP6Q/uCSrW7c3WawuBXTOumyJQ94wumaXpG0m0oswdpi41PDlXJYj4XJzUePanq9Qewm4wzeH14XwIWR4sQXOgqR02AgdifVumC/DoppBnLqTwicZt+cKK8vxL6R2W8wV+BMD9GixbzK+gPR5PHLKgXItsVnQea3rE7NgfuYnU1LxKNqrPsMFgK4sxvMUE+4baIDsp5tpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b76b3207-4eb7-5236-6812-d64cd4dad17f@suse.com>
Date: Tue, 19 Apr 2022 11:10:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-6-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418122251.3583049-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d536637f-fb5a-4c21-e7fa-08da21e48253
X-MS-TrafficTypeDiagnostic: DB7PR04MB5178:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB51789C7ED17A8B3C8071B9D4B3F29@DB7PR04MB5178.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XnGNAFOQU6tmrCl0hjxHZLPFjbnwtE7tuyA8yeeoSZbeqL2BSwuOa8avzvDwlQe87oqNBw39IKg2Wd3rbQwmAPscHvUCIfUKX5gflZSU8pMWaV0yW6/f/eZHxjxzwCH9bh6NM0UzgAdsSsahti2DG3hrCvSYnviWjLV2SVun5orgsDsB3xP1G2bhzeUA+qFHfDCJN9FJdeuWpzKlQ+5tgqPBzYT7yDqzcnEy7r3QkR8vKcXIIR9yb0wrspvvNyPb8eBz3PLVTgwmUoq2roX3fhHKjJT8zM4iBg7qKc/4HAUe0EBR3lg/CyUjTzmBP0jqvdMfrX/yXXJlBY+75LN/ua5JCiOEn0EYnHG2nVyNAbOlmoNSLKH6pPuU5oCfePPk+iBO2GuoSvy5lHMpxRLXEcAJNwqVh9fcJPWBpqbnX3I2ksiwahjGwtF/iy1UQYS4V8DNBw1bkuZheoEYgbDlyewNECGcx/W4wSKV1+DIBpTFtypcgEo/uFG0G7k34EqTolETYDUt70RlS5kqiqhNTLKBRKvy5fMTgsp8KSo1694PcuLoJjoWsnEZcdCk7BIC67BN+47u7aD33OuVhdOA4mvLZ5J79DLQK6dCBpPU1ah2WyYzUEaJB/RONR6oyNES7qODhtAJmNkbO2ursgaSTN2gFgjpYoyttx0sSXIsRPAaPt7iGttBlOivdEwigHyZXxNOlZ9zIydxlPeY2z8q9JVmHZE7/O2Xvi2SBFe4W+DkOnOfJ/aeYM7eCQozAMdA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(4326008)(2616005)(8676002)(186003)(36756003)(5660300002)(53546011)(508600001)(26005)(66946007)(31696002)(66556008)(2906002)(6512007)(66476007)(6506007)(86362001)(31686004)(7416002)(54906003)(8936002)(6916009)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUdoRXppcHlmSDk1MUEwMERkdnhPeExFem5MalpqMENsZ2JVYmZQdE1OTyts?=
 =?utf-8?B?WG1rU0JGN2tMam0rZzQ5SU53UVV6RzdkeUZ4OWh6eGkrTTJ3dVlvbjlkaGR3?=
 =?utf-8?B?RE9UNkRnYkVJM0o2QmtzUzl5ZW9XcW9WbVk4RTBuZUE0dldXYVpoL3g4THpx?=
 =?utf-8?B?QTVKMmFkcTArL0prRTV1V013eE9majJXUzdZcTJ2UUpWWVRjVndFVnJpc2hr?=
 =?utf-8?B?R29VdWUrN3Zpb1VVdWNzOThNNWxlK3AwV05rWGpXUElrS3BoSjBCNHpFQXVr?=
 =?utf-8?B?L2VzWlN1b0xhdmtYMmRtL1l1Z2pTMXJoNThSaEpQNWNZRlc5Z0pnTk1oK1Rh?=
 =?utf-8?B?dGJwV0lDNCtQckZKbzV2a3dHK1Q4MytVejJwUnZJcW9kSmtxMytzYjRzZm8w?=
 =?utf-8?B?RUdiS29PNVJHUzBSRmVESURTcUlxVHdWb2dnTlBhbGdlcytpV0tMQmE1U1lZ?=
 =?utf-8?B?ZWlwdmNJVjRwZ3IxVGc5VXdOVTVjRmRkL05NMkZWa3IrR2dJcFppL0JrcHk5?=
 =?utf-8?B?ODhlSVRiZ2pwRHZoMUcxWjZkdElzaTYwTm9QZ1NwUDhJY3RJV1A1cUttMFY0?=
 =?utf-8?B?ZG5CYkt0SW5sSU1ibGdadjg1cW5qMWFaeStGZEl1OStPVmhzWkFOdTJQaWt0?=
 =?utf-8?B?aXVRTFA3ZGhJaUJhZkprblBsbHA5bExKdXRYNmpCendnWngxMFRpZ3ZITkMy?=
 =?utf-8?B?WFY4Q1B0NDM3ZFBjWFpGSHEzL2Q1VnFQeS8rQi9hR1BKRnIxWXJKM1dCM1pG?=
 =?utf-8?B?ZmFFbVZaMnFHR2d1aStXU0l1UzNhWk01ZWpmN2N4RklYczVla01mY2I2alFv?=
 =?utf-8?B?VUI0YXhHdFRrMVo4VHJGam0zclNwZWUwZzNZY3l0d1JLWG5Na0k5MlFIK3pa?=
 =?utf-8?B?YXpLVFA4YzVBSGkvbEdoMnZrQ1lPWVh6RklkRDJsVk04S3VVMHFuZ1MycWt1?=
 =?utf-8?B?R3pvWmVLaDRqSE4rVlhpSXdrTlNqRUFJT0VCTE9jSmN3dEQ2NjZVaTdNSzRD?=
 =?utf-8?B?SkpxaG1JNVNCTFZkU1dzTVZrWkdJTGd1M1A0V3Rkd3hlLysveGlVczZ6V0tn?=
 =?utf-8?B?NU5WQkxRZjdQU3diVERqSm9aZUZsT3dhbkx4bElvZ245TEJKUWtqc29oK1g2?=
 =?utf-8?B?bzRLeUozMHo4aGMxUFNrRXJhZkRkenBwNFRGb3RuOHM5djVQSXdyNXJzYkpk?=
 =?utf-8?B?VktmZzRobDZOT080Wjh0VldWTFo1WFo4SVAwd0ZyZkswQjJDU3lvRnc0YlBx?=
 =?utf-8?B?aVhrQ1JLM1ZoYnNXWWtHOTNhck1GZ0RXL2hLQXlRTFQ4ZTlIM0RVdnlBRE5i?=
 =?utf-8?B?TVpKejJkdTBNY2lsVXBCMHZuWXNONzgyQ3czbXBnL0xueEVHNUFIUk9GY2dL?=
 =?utf-8?B?Wnh5RE92YVl3dGl6Q1ZSaDdLeUxCWHYxZjhhRmd4bUE4emJlcitpWUVvMlNk?=
 =?utf-8?B?NnlkNWo3STduWDZET2hDS1ZZQmdDKzB4TkpOTG9rMDNobEJKVXdRU3FtRFJX?=
 =?utf-8?B?K09tOG9CWXJYQllycnpPdk5LMXdFNWZ2aHRBRjJHR3VsZE1ob1E3NFk5SVRx?=
 =?utf-8?B?RTdpYlV4UG1waDRKUzZJQXNiSnhJb2F0VjNWRjFxNk5SeU1JYnJ6VE1VazNL?=
 =?utf-8?B?VEEyK2xzOFlNOGJkbDh5WTRBRDhyd0lRWFE1SlkrMnpDVGxFTjNvdFBVcGxp?=
 =?utf-8?B?dk1vQnFlZVJxbzQra1VVUVlLTkhhcWw2WERlYnBCdU5VMmUxbS9hNVJFQXgv?=
 =?utf-8?B?dmJFUFE3WXF5MFVXcjF6ZVFnbEhWeUlQQTYxaEhmRks4Smgvd1NpcWUzbU8r?=
 =?utf-8?B?Z1p5M2U3R0krZCtYSitPWkRsYkhRSXBISVAvNld4T3ZaZWdCR1FabEZzMVpv?=
 =?utf-8?B?dE1YVkZ5Vk45NDlmR0xMNS81RTBBVGVUSVhnbVJUc1ZvTlRlUjRqTDN2TVJ1?=
 =?utf-8?B?SmhQNmpOejFDdFZRN1NHQjZkeWY1cUVGT0RDK1NwMWl3eGxDRmZtYXRsNEZ6?=
 =?utf-8?B?by96Q3p6ak5Samg0aWdQYnBPdlhWamV1bGtCKzhMQVVMSU9zZDFjN2pDbVFy?=
 =?utf-8?B?ZkZoaURyMWZtcWN0Ry9KdjV1b1Z2blI5aDJCckFYTjdwTGNBcm4zcGRLUjhr?=
 =?utf-8?B?NUo5a1JOamJyWlZId01wa2RlbFV1ZFRqRmZSeFJkdC9VUjRSWmczQ2VWcjBI?=
 =?utf-8?B?M0ZYQVNHRVNhZ29ncEQ4MzNKbG1mcHpOejBaODdlbjh0MGdnZXFoem5EK2sv?=
 =?utf-8?B?VDJ1MFpJeUd2aVBHdVZZUjZYWGh6ZnlMbHRHYzM0VWx2RUwzbSsvM3VYK21q?=
 =?utf-8?B?bVdMNGpZTGJFNXRHcWFGNkNNTFlnS002YXh5RkZLWng5VkN5SEtuQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d536637f-fb5a-4c21-e7fa-08da21e48253
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:10:55.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Kjk/6eYertfOE/aWGVI72vkacbT1xn34ILKv1ItQtVKFxVwhRp3auc8w6RrLnDX7Iy7/VTlB4T+SILXgYPsgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5178

On 18.04.2022 14:22, Penny Zheng wrote:
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -358,6 +358,23 @@ void clear_and_clean_page(struct page_info *page);
>  
>  unsigned int arch_get_dma_bitsize(void);
>  
> +/*
> + * Put free pages on the resv page list after having taken them
> + * off the "normal" page list, when pages from static memory
> + */
> +#ifdef CONFIG_STATIC_MEMORY
> +#define arch_free_heap_page(d, pg) {                    \
> +    if ( (pg)->count_info & PGC_reserved )              \
> +    {                                                   \
> +        page_list_del(pg, page_to_list(d, pg));         \
> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
> +        (d)->resv_pages++;                              \

There's no consumer of this counter, so I'd like to ask that it be
introduced once a consumer appears.

> +    }                                                   \
> +    else                                                \
> +        page_list_del(pg, page_to_list(d, pg));         \

Is there a particular reason to have this page_list_del() twice,
instead of just once ahead of the if()?

> +}

Also this entire construct want to be an expression, not a
(compound) statement. And it probably would better evaluate its
parameters just once.

Jan


