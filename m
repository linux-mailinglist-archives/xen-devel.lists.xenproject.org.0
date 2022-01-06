Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7154867A0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:27:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254152.435726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VbC-0003ip-83; Thu, 06 Jan 2022 16:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254152.435726; Thu, 06 Jan 2022 16:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VbC-0003gA-4X; Thu, 06 Jan 2022 16:26:46 +0000
Received: by outflank-mailman (input) for mailman id 254152;
 Thu, 06 Jan 2022 16:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5VbA-0003g4-EK
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:26:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee5e2cd-6f0d-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 17:26:43 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-Biyb27MkNXCYhWWRi51gtQ-1; Thu, 06 Jan 2022 17:26:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 16:26:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 16:26:40 +0000
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
X-Inumbo-ID: 6ee5e2cd-6f0d-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641486402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Swk76muHQKM4C14x8IWxeU9P9ERecA7pBQN5GbjnAI=;
	b=kRnbmGGvN6wbImeiotJrQQlc9ybr81weA5Jkazrag+dpVgCvqZ4gh5x96Z6IYuFNnp0v8x
	zzbQJBCwjOKPQmeIUcH+7xR6twClddE+YY8Q/Qiu+7Nvnw7ljMvxRr7jW77Lx/yu5KtXR8
	/7zNDA4ttoU7WqmmVbQA0LMgOd+96Ts=
X-MC-Unique: Biyb27MkNXCYhWWRi51gtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeKQD8K4jVU7/Q4KM9qT7CKrtzZCz7DHQbhfVMXh2XnX1GFa7MmE4bbj9N8J+szJrcviIWe383uHYr17QcPgIeKugMnJ+eFDTZ2xMpfUrnUK4GqTfbUXa4Z3ylLANRtTYX45XKDfp3P0ej627rRtolotgUvGQLODWOHbJCvn02bpH3jFYx/P24KL/zUxjb4+AWzjTamgWiptPszV94m1Ng8NTByofUQgeruUAHLM2qo8bVcUtWLhtplHYP4Cru/jtm8y/fTKOMxOjKY0M67+z5hN2hIz0ZTnE8f3GuUudabbEwjGpPxaNe+leJ4A9UEYc8FeGDT4N+EYwbcnvYMXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Swk76muHQKM4C14x8IWxeU9P9ERecA7pBQN5GbjnAI=;
 b=JISniLaOoAskb4UZ8jSpfUdVgtmYKKlxUFQxH8brSGpr8HlDBtKa93HA3vlT+4PMm5fh6NpIHTqrIyq/STqWR9hMPIRspL4A7Dy799Y2IvivkGChqCwBDalZ8/0fPML4CZslGkGe1yzkQgAaWZ3qoIwELqKgyKox2I6j1EXD6x6psb6YCiDnzm8CPDwkwzNdvLDEU7bsIOzGjFri50j/wgoavUwP0Y38zFfZ9OerOpeiMeb8YKpmZ74KirhVz1JHF6NJFqNZv2nYWQ9MyTjKMxpUfcZAW/9z8nGoKGa/8RoF/mMMcRnnKirkPkTrbqCS2uHWJ3ZLl6d5cWF7ifcu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52c12a24-fd34-c971-eca7-b6b60f08b0b3@suse.com>
Date: Thu, 6 Jan 2022 17:26:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/hvm: add more callback/upcall info to 'I' debug key
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220106154647.159625-1-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220106154647.159625-1-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a4f3c5-d226-4859-3bd9-08d9d13151d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4606EFC18948C6577BA15538B34C9@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ujF8AYEvUxcYZzfhgDjsKAMdERFlVJxY0OelyP/QpIqlOSsIabRqXfCRImF9dieG6HZCNozt2kIcwWCnpD/V2fe1gvYYHqAjGHWZCVODvqvdMBrTcMGLfA5wDKxmnhGdHIEsV2G+K9jgEhHkX8S1qeULJa+qwh5mzwApZEYJeI1ajwDtBxJlVgf7Xh/ulVAS1Wbads3HVU3hviBB5sTTfhlpEBZC+94DdKPEYwvllXDvoFZttAlBKkze3KUPOiVjKN3x1lhjjBa7jPkzjno0paJG95xWNDP65b6Ud5sI22LZlxTRXajyk+jeffBb1v5QqisakF6xK+ieOCeJRm36JENrmZ9xyoZ7Pk7b4TBCUnrYY1EUCDnFtvt7FcocxijrfrXricW4q6QkMdDChUQGzlZ7TR3PagFOqv/GDbDEfz+tXamQYIk1QWlKZT4z+RfeE6XT3ILKOlATP7pTvFvq+yPzipvxSn66w8ZV9TNprVcWUEqWigAyHjt1jMeV7SrE8TwFhYRrVFlrvgKw2Hp+XX9qoXOXZQwYbJc7YulHhXHHpV6itXJJXAPNt6HOMS8sySJ8NDHx5oEjXE0xh71s9FST0WgcKE6uliu3vUrhES1o8MWzTzo28ZUUmuY5J4kC3Y6ZS5J7sfaMBVY0x0CiHaY2dRg705xXtm6xKi4pLsWGrAriDuzlUAwwRnDnlald2T04gaqBl1xbdhQURQWgjOWHJEUBHxReCogQCbToOnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(26005)(66476007)(6666004)(66556008)(6486002)(6916009)(53546011)(2906002)(508600001)(186003)(38100700002)(8936002)(6512007)(6506007)(316002)(5660300002)(4326008)(8676002)(31686004)(86362001)(83380400001)(31696002)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXhaOEg3ZVF2RDlvWGtxVXczVmV1aFBmQUx5c2hZYnVsbTJFYXpRNGl5Y3Y2?=
 =?utf-8?B?endIaXdmbmt6RGswd0xyQTVoOEhwOFU0aWI1WVZ6WksxbWlsRXVVT0kzWkdj?=
 =?utf-8?B?MEZGQ3c3LzZmc0RMaWZpOU1WdVA1ckE0RmpGQm5IeHVvZE5JczJMMlhBNXdN?=
 =?utf-8?B?TkJOQ2FMTnV3WVVYVWtMN1R6Wk1DRWhQUjI2SGo5ZldUNDdQVElpT3BFTFAr?=
 =?utf-8?B?WERZWW9JaHZhMXRlekdQczN4dzZkbXFkeEtRNkQ4UkdHYUlQZ05Dbktiak04?=
 =?utf-8?B?cGt0MmJObm8xYWlBNnJPTDJqbGM4OVdCKzRWR1h1NmFvT21aYnozMzllOVdh?=
 =?utf-8?B?eUQvUXJVY0pkU1ExUFdTYXJ0VzFqWEt5WVlTUjhEcCt0RzNQY0lwL2RGY1E2?=
 =?utf-8?B?d0NWVUdrQnMxY0lEUmt3RU9COVgzaDhXSzJyVVdYZ2IxbCt4OFdTS1g1cjZL?=
 =?utf-8?B?bkV3OEo1dmRMNzhtWDVVbDViZEhYcVJoMmc1UGpVY09ydHl2UnlzTi9rYUhL?=
 =?utf-8?B?ejVtY252anlsbVROUytuMmNSSjE1dkZmR1EyQUZvZmE5N01ySm5TTjgwSk1z?=
 =?utf-8?B?SXc0RCtpUEFXUVFmUDluNTFuTndpTGpXTlhUUUtkUFg5UFJxanA0azM0NTVm?=
 =?utf-8?B?bThJcUQzN1JtdG5yZUVBb2dVa05md01rV0E1ODFNZW4zemJkK2d4S3J1ekZi?=
 =?utf-8?B?UVc0RWVpNzQ5OWxKMVcyNVZTMC9kZ1ZuQ1hQYkVndktYM25EOFQ3Mk1Fbmll?=
 =?utf-8?B?Y2h4Y3ArbmdmeS8wZW1iQXRxOUFPVVVuRHNQUXhlZXNlWWJTWVU0RHJXaHk5?=
 =?utf-8?B?cVJCQmpKelFvT05YRmZPZ2I1RjNSZUx2ZEdwOHNWamJBSFpNdWNrY3FodDh1?=
 =?utf-8?B?bWYxelVxNEluNmk1cnFDcDlaZVllYjgvVEhzRHVwd1F4dHNxeTZ3S0k0V0Qx?=
 =?utf-8?B?eERGdTg3cnllOWRTOEZJMExzcVg5VlRVN0o3TjY2NnpBTy9NOW9scitiUTZ1?=
 =?utf-8?B?MlBmS2k3eXlSdEdyRzlydzBybWk5RDJjWDFiVTAzQWZ3L0RWendLcEdNYmNw?=
 =?utf-8?B?dlV4NmRobDZhM3dKNmxaOWtOUS9BUDlOUTBibjlkZlJXdlpSbUJFaUNVbVlI?=
 =?utf-8?B?TkFwS0Fia0hsYzQ5alFCeXdXTXFjN2VMNjRXVk5mMlFpaXB3SmVjOG9NUHEv?=
 =?utf-8?B?U1U3bXZTWjNtY3BZbDlST1NOeGl0YXZhMHkrdXJOZUZYWTBTN3ZHZ2VxTDIy?=
 =?utf-8?B?VUxHRHpTTjMwTHdMT1dDdHl0MjhFcFp6WGpWUnQ5bVJXSkFoZ3RsK0N5bEVy?=
 =?utf-8?B?SWlYTTQ0cVFyeGZueFBPdHhMWjZDa0JxeEZ2UGhpREVKRWVrWENTSUpVM0R6?=
 =?utf-8?B?ajVSNlpsK3hJMUtpaHorWUIvQitsdmpUTkN6TWJlU1FXWFVzNmpMeE1NdFVK?=
 =?utf-8?B?a2NoT2daQXNtckhONk9FaHhUam83ZVU4c0IyN1ZPOWFHNnZpNTRVbzBzQUdo?=
 =?utf-8?B?QmhmcFRHWTBEQTQ1QUIwS0NPcyt1NjZpRk91SEhxZDAvR0JTNUZnYU0wSGt1?=
 =?utf-8?B?aWlGMklRcTZKNlBUQkFUcmZvbzRIV0MrUlhObnRsVWduSzl2b1dvRzdkZ24z?=
 =?utf-8?B?RnFra2pXRmhZbWJBTWN4bnVHOXlNb2g2N0p4eTQ0RHRxQ3lJQmVwVDVUTjdo?=
 =?utf-8?B?bFkrZlJWVlJKRTdpd1FLMHBXa3ZHQU1ENUpxa0FQeW1EbEgwUTFJYXhRYXN6?=
 =?utf-8?B?cXRJTWxPZVlwL1ErekVFcW0wU29UQTV1MjlDc0g3M0tQUWovM3hGZUxTV29q?=
 =?utf-8?B?emRHajZJWnhuNUZXeTNrYit0dHJUcnFEdnhQbFpPTVBJZkk3bGNoNEJyN3BI?=
 =?utf-8?B?VmpndHRIUUgrUWdxY1dIVnhjdmVVSnZvNnAyWkxNcG4vRzEwRzRsY0poYm5U?=
 =?utf-8?B?R0RtczFNMUYxa09pV1EvS3NscVBOT3Y4Nm12L3BQNVBzTldQVXhUZll2eVUr?=
 =?utf-8?B?eVc1bGJXcGFKUHRuaW1MMWFpYWxVWW1HTW90cmJleWlaRm5leG1jTFdDRFRa?=
 =?utf-8?B?Zyt4bGZua05rRVF5R1ovSE12elA4Nm9TVDlHQjVDVlZEa09tWjJ4a1ZiTytO?=
 =?utf-8?B?dko0WlFVN2JaOWpiUDFuOCs1MnJYWWVINmE3Z3V0VThPbkdpSERVcXRVV3lW?=
 =?utf-8?Q?VYxzX5NYuuKJiEudmujuosE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a4f3c5-d226-4859-3bd9-08d9d13151d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:26:40.7688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt5NQ3fumb3qL3hH0NoUMS72aTVo+nnw/UhgeE1zrzqGghQqchIUVaK4NwgH4QRmiacVVCENysCBicV6qJfWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 06.01.2022 16:46, David Vrabel wrote:
> Include the type of the callback via and the per-VCPU upcall vector.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

Welcome back!

A couple of stylistic / cosmetic remarks:

> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -598,7 +598,9 @@ int hvm_local_events_need_delivery(struct vcpu *v)
>  static void irq_dump(struct domain *d)
>  {
>      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> -    int i; 
> +    int i;

Since you touch this line anyway, would you mind switching to
"unsigned int"?

> +    struct vcpu *v;

const?

> @@ -630,9 +632,30 @@ static void irq_dump(struct domain *d)
>             hvm_irq->pci_link_assert_count[1],
>             hvm_irq->pci_link_assert_count[2],
>             hvm_irq->pci_link_assert_count[3]);
> -    printk("Callback via %i:%#"PRIx32",%s asserted\n",
> -           hvm_irq->callback_via_type, hvm_irq->callback_via.gsi, 
> -           hvm_irq->callback_via_asserted ? "" : " not");
> +    for_each_vcpu( d, v )

Depending on whether you consider for_each_vcpu a pseudo-keyword,
there's a blank missing here (like for "switch" below), or there
are two excess ones.

> +    {
> +        if ( v->arch.hvm.evtchn_upcall_vector )
> +            printk("%pv: upcall vector: %u\n",
> +                   v, v->arch.hvm.evtchn_upcall_vector);

I'm not convinced of (but also not outright opposed to) the
resulting redundancy here from using %pv: The domain already got
printed once at the top of the function.

> +    }
> +    switch( hvm_irq->callback_via_type )

Missing blank ahead of opening parenthesis.

> +    {
> +    case HVMIRQ_callback_none:
> +        printk("Callback via none\n");
> +        break;
> +    case HVMIRQ_callback_gsi:
> +        printk("Callback via GSI %u\n", hvm_irq->callback_via.gsi);
> +        break;
> +    case HVMIRQ_callback_pci_intx:
> +        printk("Callback via PCI dev %u INTx %u\n",
> +               hvm_irq->callback_via.pci.dev,
> +               hvm_irq->callback_via.pci.intx);
> +        break;
> +    case HVMIRQ_callback_vector:
> +        printk("Callback via vector %u\n", hvm_irq->callback_via.vector);
> +        break;
> +    }

We try to put blank lines between non-fall-through case blocks within
a switch().

> +    printk("  %s asserted\n", hvm_irq->callback_via_asserted ? "" : " not");

I'm a little puzzled by the blank preceding "not"; how about

    printk("  %sasserted\n", hvm_irq->callback_via_asserted ? "" : "not ");

?

Jan


