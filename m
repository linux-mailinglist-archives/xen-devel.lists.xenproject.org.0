Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9A4443F8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220938.382399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHez-0006z5-Id; Wed, 03 Nov 2021 14:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220938.382399; Wed, 03 Nov 2021 14:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHez-0006wZ-Ep; Wed, 03 Nov 2021 14:54:41 +0000
Received: by outflank-mailman (input) for mailman id 220938;
 Wed, 03 Nov 2021 14:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHey-0006wN-BI
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:54:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7be9a93-3cb5-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 15:54:38 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-0fJYfuh6OOac4q3XpgE2cQ-1; Wed, 03 Nov 2021 15:54:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 14:54:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:54:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 14:54:33 +0000
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
X-Inumbo-ID: f7be9a93-3cb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635951278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tY3d8kMC8nolLW8Ft0h1VvmR9+RaTIzykG2O+FU0kJc=;
	b=TUjHI1UBNaVRFsh2Lt0PuFGPpAKq9/Eicx5pwPY41umqjxh3PY2xOi4J0bc4YZidqN/4+C
	oq2QNSepVREEl/AYIoPgVZhPEpuSVucIAdMOal9AyyKSfKM4n8VufHvP2pJ6wiHr3py941
	8p8/1al2EaW57bbMnKt7rccqiL/fqFs=
X-MC-Unique: 0fJYfuh6OOac4q3XpgE2cQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJQ3ihsD7L15W/2Jw9gxMuD6J20l7zvpIURn7GHwpChE2kOqe7iGBd7wdeiTyqHiNee81VI018TaF7TnjwO56P67lHshuNmpSj3VLGnabLyQ1rbrKo/wX1ZKbIvwogbA4AEm2VpwgeptoSs0ky3ZLFz92/jasbvr54sUHAYta3gRLSKUt358ohcEjxpnqWfMQFZIPkWBVH73sEz/qt1SF+w+y1o0UAtI7YUFSp8z4/3EU9hh2NRPdpk5DOkfqaFfa5bg8d1cgI23vW8NCCkq7dWxRvH6gQWAdUIAgABIAoSZkOgIWo75nEx8F/7RvBtl2JGF0gJ71wJWVsNnVLURbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY3d8kMC8nolLW8Ft0h1VvmR9+RaTIzykG2O+FU0kJc=;
 b=KU7vYQKucpjn8GDcoB37RoO9jE8kDGGVo2HK+96TuC/USIQsDojXEKhzvvTleNuKggvHQqXDjqlwmN/DHeUxS5zCz0/z81vAxs6ek452oQIyK3vUiLyhe+kWSW/6/KkCf9DV7WpczOrnVa1cU3dM+H485C7f3ePGS78Ug2ZIXSiGdP+QJvcBHz6P0PRaZWJNPFMgOHGPIU0GBDwBmLaPIfhXOmElKaGEJgqTWx+YXD9WO4+HbA7Gtg87obhESWvEIUgx+waW/uNDFRg2q3idxG/eXy4RTRjQP1qOku4zo8/3AqYRSj4OQ0kBHI3Ca/0GNhgakzmJCkUb4gzpnoqnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63548dc2-9816-e6f6-c2c2-a375d1b56404@suse.com>
Date: Wed, 3 Nov 2021 15:54:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 03/15] xen: harmonize return types of hypercall
 handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bccb8b1d-cf93-41d3-1080-08d99ed9d94b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2334443342B7C9D149F2E5CDB38C9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MxwajFgAdbnjFKS2voqQmOBpKLXFXNw1aACdHDyhg1RMqYTZyxyi4QMcpV3cApy9twea/6vqNZ4rhUHOjnwJsAbxUFCAyqkDmmljIl/4bMes+nsJqYGkZw2r2PiHiLdDz6P1dRytPqmWU/SsTRzYKOnBbAz+60VwqAqaSdVbasyNNU1JfoeDvDBIHX84FxlqTtF9ipd8JWONuuZPKloxxEk1CWJTw4pqqgd2ycp2vtopgsdttXykkPU0b+d9/H/6N2KCb1k05IgWm5Df+LykF5XelBr6REesPUte4XrB+UcQvBFR4zAYZpqvPD1EvguX8R6Dzphvotqrv1EbORk23VTQrRCzAqMT/K+QrgPtMtQyRlqx+VnIF3mFCcMQh5d5nxN4vrlDKJZSN0/x8xEmTPJAq9YjztLNtixo/X5O8nVQvIkUPRhglziXouGiCFTwk7qere6pbu9NBRYTn2aQkV/4es/K740uk4vrfdN5o7jx1InmVPdqKnyA8I+grNhMTlA6Bq4zmfR7WGEwCKMml5M0+57/HzqYtMQMRiNKEgDtxZnMO7FHhv850zi7qbCx5IKl6Y438imuxtgsnTzxA+BnxRubYgJmjWg4IAbMaQSk/p0l+YSOei/Z3nV/TgxXJyP24/4jwouNIOd6RdeuMaoPQiJeBrazsF9ArdLJDTyBjENTBJzKErpSuDspYxf9o0eKT2a+i49r1Wl7Nz8oupiAgqTCyApd4BbrJurs1Qnr6SlCGqySOLhSaozgnN84
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66476007)(4326008)(8676002)(186003)(31696002)(7416002)(2906002)(86362001)(66946007)(26005)(66556008)(316002)(54906003)(6486002)(31686004)(36756003)(38100700002)(5660300002)(8936002)(53546011)(16576012)(6636002)(2616005)(956004)(6862004)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWpIU2dpbWg4MlplL1Raazh1eCszQjJiaEFNcjJienJ5NG5PT0psck5HZG5t?=
 =?utf-8?B?UGxKZTJzMGpPenV0MVdVVGRxWklQZmQ4bG5Na2xrTVN5eXJRUmFNbFAxUnRD?=
 =?utf-8?B?R2NzaTFWSzVVOE1Fc3pvK01tL29ybjRqSTBQOFFUYXZHOC9BKzR0dG9MRG9i?=
 =?utf-8?B?Q0FCTHk4NFFNVzRSSFgyTXNPOWxvL1BxQk1BdW1PdkVSSExxTGR4WDhQNHJ5?=
 =?utf-8?B?NXlqTkZCWm5yVitqMG5GS25MWk9oVHluWXFtYjM0YTNYNEZraDlaRFd4KzA5?=
 =?utf-8?B?bzZmMDFxTmFIQlVYVUE2bEwxMVZ0SjlsZ3k1L1lHcWNZL1BadmRnVVlhQkdi?=
 =?utf-8?B?bGVFUWQrWlNNY1dra3hsSlF0VjJiOTBVSHhnaXRKREVjNDhqMHQvOFVKdVU5?=
 =?utf-8?B?VXlPYzZRNUNYdHllenFaZVRSbktmV25ObTB4S2czNnllN25yZk1SdVNSaGVp?=
 =?utf-8?B?ZzdCSjVqK0plYjdiejlvUXZETVppbVlKNnBJc0Z6eU5IaUNpTmxHTXBhSjBj?=
 =?utf-8?B?VWtVVHZwanhDYmVsaFgrVklYdkpBeElyRjNCSUxaaCtkYndyWEVpMGExQ2NB?=
 =?utf-8?B?ME45aGdxT2dnaXJzemJoMmhQa2h2QSt3VmZaNDZGWVFDYVpKL2FyWWtnaHQz?=
 =?utf-8?B?QTkxMmRzNzVERVVJMnR4UkNZR3lTQWJWMmYycHVPaW5qUnRjQWxiWUZNMm5o?=
 =?utf-8?B?U2VkSnZhS3daRlZXamczd1lFNm84NngxTmVrUW5ic3htVTNzczlVU0ZnOWYx?=
 =?utf-8?B?M3c3MWE3ZVNJdmtPK1R3bEd1dGxncjg3RXVZdklnYkVWQ210NUhOem80VENp?=
 =?utf-8?B?NHVCdGYwREROZmN0c29qSDQ5WkVhOU1BL1FGMmptNUpnUFZ6TllrTjNHWDJl?=
 =?utf-8?B?dnVML21HMW13VjJ1K3JuSG9jdG9JYWxlRnAveWNJRHJWNlkzczUzU01JWU41?=
 =?utf-8?B?T3NTYVdRSDNVcHZ5N3RUNDVMRHVaYjNWUndYR3RWdVJtWXAyOHVsOTZWU1hR?=
 =?utf-8?B?a0s4WHhRb1k2aXlrZWV0ZWhlR1ZKcmp0eUdWZ3UvVzVXQmI2OVBDSWJuYy9C?=
 =?utf-8?B?TGo5M282MlJudXVvU0JjTEFmWDFDVVhZRGpsSGhxaytmMiszYTZSNGtuNFNl?=
 =?utf-8?B?aXdvdkF3c1dPRUJmV2JSNmIyaS9ackhheklxWEZPY3NwQlBRN1F6aFlaYjdk?=
 =?utf-8?B?OVp0cW02RTRCTS9FeTRLelVvN3Jna2pjZ2FYTG1wOS9pKzhzR0t4NUdhWS9x?=
 =?utf-8?B?d2x3dU50WEVVdmVtZjlaL0hEN1VFMFFIQWx6VmpwNGlHSklmMGVjcjg3Y3Mw?=
 =?utf-8?B?M3MzM0RzcWlUOXhET2JwMzN5ZFR2WndiOWZRZ3hqdzVrK09jTkl2V2hzbW5m?=
 =?utf-8?B?TUN3MFlhVE01TUFZNUIxQkZPZXI2d1ZOWkZIN3kxaE5xTjJPZGdIWWV3a2RW?=
 =?utf-8?B?SUM2alF3Rld3MnBETWR2VmE1QTlzTDZTQ01xQzZPaE5EWDJaQWZZVlIzWnRk?=
 =?utf-8?B?QnlMNGhJWUd4Wi9vU3pPVkRaamdBdm0rdFdsNXhDUDliVlp1MzlTdDNlS1lx?=
 =?utf-8?B?RGNHaVNiRWF0TnczZVB3bm5HOGhsQyswQmY3SmJvQnlrc1VJUUlxSnN0NTBJ?=
 =?utf-8?B?b0FrZ2xLbVZvOEtOUEFzcCs5U1Q5N0JkOU9LVXVGa2xOTGZPQ0ZMVTFVR3Fs?=
 =?utf-8?B?TjNKUTdvUzVGTHV0NnczV0RaS0xqeXo5NjZ2clVQM2MyZzA4dXA3eVl3QmJC?=
 =?utf-8?B?R0ZtNXVxZkp4TnN5aGx1cmx0aDFDdE9kRzQ1TE1TcHVYOUMrWS9Ec0tpelhs?=
 =?utf-8?B?ektkRmpMMjlUekphdjlESnk1dG9qR0plMVRPVWMydHU1dEhkMDZLRlB4bFl5?=
 =?utf-8?B?aHNWU3RJNWtvbUszclhNbHRDS2JpTVhpWUNic0RlNjdXUU9RK0ZyR1hBZ1NM?=
 =?utf-8?B?VkVzUkVFbFMrajR5aExOVWxZWjdkc3pMaWpobnl4c1pNRENUMnZ5SDZKdldY?=
 =?utf-8?B?OHZzVjBWak55aGFtc0lzOXRPNmdVWVd4SGlMRWY3SzNlVXdOR0Mzb2lmQTJR?=
 =?utf-8?B?SWxRL2ZDNmFnNndVTVZjdWtMdFBTcG1FNUxTdGJQNkZtZlRma1VnTUIxSWNM?=
 =?utf-8?B?UHVMQXY2ZHdTVXc0RTkvR3RrZ0ZvNGhabER5N3puS0FoK0JEVnJ1SlNlZDla?=
 =?utf-8?Q?odbXDutBX6VLzPmaxJEPwuM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccb8b1d-cf93-41d3-1080-08d99ed9d94b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:54:34.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VDfX19f6fBWsO9MBfnV9XW9Eg/oh80W/qmGpU3gsbMhPuZcSxqTdXlDhN1L1Q4eFJ5IMJ77XAw6UIMUEB2nyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 01.11.2021 16:20, Juergen Gross wrote:
> Today most hypercall handlers have a return type of long, while the
> compat ones return an int. There are a few exceptions from that rule,
> however.
> 
> Get rid of the exceptions by letting compat handlers always return int
> and others always return long.
> 
> For the compat hvm case use eax instead of rax for the stored result as
> it should have been from the beginning.
> 
> Additionally move some prototypes to include/asm-x86/hypercall.h
> as they are x86 specific. Move the do_physdev_op() prototype from both
> architecture dependant headers to the common one. Move the
> compat_platform_op() prototype to the common header.
> 
> Switch some non style compliant types (u32, s32, s64) to style compliant
> ones.
> 
> Rename paging_domctl_continuation() to do_paging_domctl_cont() and add
> a matching define for the associated hypercall.
> 
> Make do_callback_op() and compat_callback_op() more similar by adding
> the const attribute to compat_callback_op()'s 2nd parameter.
> 
> Change the type of the cmd parameter for [do|compat]_kexec_op() to
> unsigned int, as this is more appropriate for the compat case.

I continue to have reservations here, but I'll leave ack-ing of this
to the kexec maintainer.

> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further nit:

> --- a/xen/arch/x86/x86_64/platform_hypercall.c
> +++ b/xen/arch/x86/x86_64/platform_hypercall.c
> @@ -4,10 +4,11 @@
>  
>  EMIT_FILE;
>  
> +#include <xen/hypercall.h>
> +#include <xen/types.h>
>  #include <xen/lib.h>
>  #include <compat/platform.h>

Would have been nice if the addition was done such that the result
was properly sorted; one way to do that would be to simply omit
xen/types.h which already gets included by xen/lib.h (and very
likely always will be).

Also I'm not convinced the do_get_debugreg() hoops are really
useful to retain if one way or another we need to rely on
implementation defined behavior anyway.

Jan


