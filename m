Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0A3CCF5C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 10:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158203.291349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Oac-0003y5-CG; Mon, 19 Jul 2021 08:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158203.291349; Mon, 19 Jul 2021 08:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Oac-0003w9-91; Mon, 19 Jul 2021 08:25:26 +0000
Received: by outflank-mailman (input) for mailman id 158203;
 Mon, 19 Jul 2021 08:25:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5Oab-0003w3-CY
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 08:25:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcfee24c-e86a-11eb-8af0-12813bfff9fa;
 Mon, 19 Jul 2021 08:25:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-Z2oETjxWNUyEo2Vq76rq5g-1;
 Mon, 19 Jul 2021 10:25:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 08:25:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 08:25:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0083.eurprd07.prod.outlook.com (2603:10a6:207:6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Mon, 19 Jul 2021 08:25:19 +0000
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
X-Inumbo-ID: dcfee24c-e86a-11eb-8af0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626683123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6uRbLEDcSIn3pOirweLS+/AVRtzGTsuziAo0nk6+sNE=;
	b=kifTWALFZF66XOIt3eQrwd7DdgErx/uXov7bUZBK8X1zMbiNVqlCq96VZoPc+BQDdQQ4Pn
	9svtvYwUowFRXRAw8tQW9QZF6bK50q6jXgbbPO2x1qCfGzzXZC4Wj8E2VpXERjKNXcp/VZ
	W+1mS/+Da2sXaEDBC8NUmWEgqOFH1zI=
X-MC-Unique: Z2oETjxWNUyEo2Vq76rq5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLCsYEL9zoTu2k55dGuJenWwiCRMfHaoNpZJhVhVTXDaW4uEMBNziRXVsm/DURBTGFdpUS0YJ1VB2567i4b2N7ZitKBXQHKrsikAboQu0GRWbgCrASFPrZTVUcQvQGX/qa4leXCpZ1IPKZXbZbNn5LOL76RYtayYVvvr5zvzoqckQrQGI7oZFFmrM8ADexbhRoRhpj7OMU7gOJpZTfsjmUvq+qmdbftnDWpBNElbJrknVn1dQc3dtRezk/7ELxk2+e3pLv/A7OjKk7UY6LKLEDPwa4HUCs+SiSl/0+g+oAxEJRh1S6sUzsHal9s/wlU5UkmLFuc0rnz7ip5wlQO3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uRbLEDcSIn3pOirweLS+/AVRtzGTsuziAo0nk6+sNE=;
 b=SeDVFG/CZ6cdD5xbLLih8vjUStcRrzUaGVXMHlKV+PUtrZY9aAOEte3nFNwYifFsnot4DjSur6byinaaTzThMKrwqr5xuJTCvWrOcF1l8p37nqp5Q9WA+nRrV8Y7Xgq/CxMkP15Lht+Bu9w9RWn5a8xm9mENOuO/UAL1OLy2N+5MzugwHlJ7EPgnLNfNGnxCspnqJrvq7sTSaW50k/SZQekNgMsCTbSBIbiEGnE1mRMMe8hNJzuUurdoc0MVR0tDqgkxoUVgLdTSXEUVceqkKhr/fgxc6rojgG/KFYF5NdhZu39AenY04X5pPN6pVxOsyBHVva1GbQGhUe28gqbjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V3 05/10] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2ef39b8-4bdd-6d50-0c6b-a44fdf0608e3@suse.com>
Date: Mon, 19 Jul 2021 10:25:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210715051819.3073628-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0083.eurprd07.prod.outlook.com
 (2603:10a6:207:6::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bee3157-de32-47ca-6834-08d94a8ebf36
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295F225778935C20B94FF70B3E19@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJZlIGaQwnvN3ztyDbRRG5frtVT8MEHPqW4U28iNJiFQXj19qXv1fK+chZNtAGN4ivODVqTBNmLHQRsMbsAPqU6lDo2n6vlOee0senuZ3Wr4DtMvDg8uW4Q/Db36f0pC3RYhdZPckJkyI+vH8oEFBVPXjjMtPz7UPk6dlJMca9rfCca1wDZfEhk6GY8wzwRA/0/ny2leVMUdw9wB393Q/0MyTgxQVbd401AND3qQ/nuOojmY4K/VCvEnMcqA4pLpgDzmF0HSfXju6Sn97B10K7BwMXvAA7Ja57u06hYPKYtADt6B47hG4g4IpeawtkzEsfLoKuRoSOtU/iAa8KvMqH94FMFJ6L1R6ulwbnYrupW7PvAkzX2YO7PSSfAAcruWnxdcuZ6XGrbOdJd45As3a1me8uVhAkbzwkavNo7wRW+9qWESeSnfsIBvSDUruM1R4nyowp+qlTqNixxIRIiMfoMmTZtZ01NpSgVATptQDZYj7cWSRqI38rzNSYWyZ9hff3p4vqgMAjXlDIHpaZPCTYRADphhWqOgD2cE31UO5EkTAesgdp8QzFa5QggcDzsNdttQM56j1IL9EIFWy8nLTyvhd6X2wiHl+RwE8dpExc6CVe2S2SFwakm+dbQX+kRNeliNtYisFDdJT/P8+0h7WlcjZKOukYxFdsXHoGPy4LSsoZ5jJs2d7nyQizb46U606cCCpdnr3dvNoc/9zKfcJoBPfVFyWYQSAHwnIHCswZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(39860400002)(376002)(136003)(31686004)(8676002)(31696002)(53546011)(16576012)(8936002)(5660300002)(316002)(86362001)(4744005)(2906002)(36756003)(6916009)(6486002)(478600001)(83380400001)(186003)(26005)(66946007)(66476007)(4326008)(38100700002)(956004)(2616005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGFDVjlweVE3VUJWV2hiZWxqeWI0bys0eUJYRU5xSittdEUxRzE4b3NtSEZM?=
 =?utf-8?B?aXJLZzlJdW0rN1hyczdUdXZnUktBcGlKdGNVMy9vZ2RUbmx4MlhqQkRVRTRR?=
 =?utf-8?B?a2lJUkJ6L2p5UUFpRVFJd21JTVAxWVFRUS9LMDBRb2J0dnhVcGo5bnl1QzNY?=
 =?utf-8?B?TERkQ2NkQ0xrYngzbUhMYWxZZE9mTThKQjIrVWQxQ1pMb2p5WFpCdlNHMjdG?=
 =?utf-8?B?am1CYlNlSXRBNFBSRTRZUFJCSUs5ODFTMGFWaUR0WXplQWxVYnZXT1ljbVU0?=
 =?utf-8?B?dkw0RW81cnczdERFMlZKNSs5cFlpelZ4LzFzTjNmbWJlSmhzSWRrUGludjl2?=
 =?utf-8?B?c2REdW5QWEtNWWFteFhGQmVON2tRK0xxR1FjRTlNNEZhazBWeFMxTVNGbGJt?=
 =?utf-8?B?cnQwS1pKenc2aVJJUkxQaXh0d2NUUWltR3dHYWc3Qkp0WTJnVkZoMWJ6ZXE5?=
 =?utf-8?B?RDlzbTBDbyszUHYxaElrY1RvVytES3V1RldDWklZL0JIRWt6TG01QjZYN0lW?=
 =?utf-8?B?aGpwbXMyaUdCTisrQzcvc0RyYVYwd1QzK1lKZTk5VFd6ckNvdkxWTkhXV1dY?=
 =?utf-8?B?QWdJUmdPZmNoUDZ3QzhuKzg3TE91cTNSQ0JtNjNlN1RpL1lEZzl2Q0pnRlRU?=
 =?utf-8?B?dUhncWx1TXdnUWswdTlDWTNSMGhSa0lLUTJaNUR6aVlBelU3bWU2UXNvVmdC?=
 =?utf-8?B?SG9BWTZBSktYMjRIYnc0YjhENmhHVlVLVFJVV3AxRlR6M1lKVEI0MUV2dTlG?=
 =?utf-8?B?OHE0Sk0zeDIzTnZsSnVBMmdyOHcrUERMb0NvcTlFTi9HQVVneXBCNk55RmdM?=
 =?utf-8?B?Y21Pem1qam54SlVWMFIvM0dZMjlxWjFmemlnUGxPb2FjWGRXVlA2d21SSWdO?=
 =?utf-8?B?UFA3V0hyVjdqYWZzWE5Yc3N5ejVrd2xSQnB0R20rR2tLaGlBNmI5eDZpYVQ5?=
 =?utf-8?B?ZmZqcDJtNmFpamlzZFIzSWJCMW5HcGhyOXVqUHNkTkJsQ2N1d1pjcU1PcmFn?=
 =?utf-8?B?WUUvSDdEaHNuTGJHY2xyRWgyUk5Ec2pIZGViKytYV3JFOVd6Q29NYUY1NVR6?=
 =?utf-8?B?TVBQb0pTdWV2REdXcGZhM0pJbE5qVUc0bklsZ2FkQTBKQkZHSEM1bExZa1RB?=
 =?utf-8?B?RGphaFdRd3dZV214OTlFK2ozK2RMRmFJMEhsak5UYWRMMHlKTG45a1l2elNp?=
 =?utf-8?B?a25xeEUwYklrWXZiVnV2bllBaVhqbG9Lc3FoUlpCdW5aQ1RZV24yTVBKcjR4?=
 =?utf-8?B?YWR3K1JweFpuVW1DdC9kUWlWWVdvOFIxRWZoaktNNkVzem1zYUYxTmVEZy8r?=
 =?utf-8?B?R3hZSkJ1c2ZqQTNNb1BPQVNTQURVdjhHejlCTWQ0cTI1MER1Vjd0VHJDdm9Z?=
 =?utf-8?B?ZStyTlJaSVpES24xcHYxQk9nMFJuOWFwVHduK2dsaGdFdW5KQ3hJL0xEeVhF?=
 =?utf-8?B?MXBDODRTNjYyL3Vha1dYUDU5RGZWTUtLYlJDZFVGdzZ2YUpwc0VHN0FvWXpH?=
 =?utf-8?B?WXJNcDllSkV0b2p2cVQyUW5vOHg5S2hiMkJ5WjNkdzZaMHpON0x6c3dkc0tl?=
 =?utf-8?B?SnRoOWdMTkw4aFk1TENCbGRSSUI2U2QwRHVqZVNKQ3RDdDlpZW1WMXY4M1Fh?=
 =?utf-8?B?dU5ZdTBVbHh5YjZtL3EyYUE4dmJYZ0dGRjFIK1U1SjFWdEJybDc2eGV3V0da?=
 =?utf-8?B?WldNbmREWndVNm4zR2tyOHRCRzhvVForYk41b0U0cFd1OFJuVEhDVDZXMzNQ?=
 =?utf-8?Q?PCs7o+iajv/C31ZMXmJHt0/ZbIKa3xRyNfUSvjA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bee3157-de32-47ca-6834-08d94a8ebf36
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 08:25:20.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22Q89ZULItrDt9Bi3qGlEdRBovhtU5AMNitXTB2FPE9dNKWXGR/uwXwHQqhsjdogDqCzblJoGwAhZDmN/PtV3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 15.07.2021 07:18, Penny Zheng wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1519,6 +1519,26 @@ static void free_heap_pages(
>      spin_unlock(&heap_lock);
>  }
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> +void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                                 bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +    unsigned long i;
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        mark_page_free(&pg[i], mfn_add(mfn, i));
> +
> +        if ( need_scrub )
> +        {
> +            /* TODO: asynchronous scrubbing for pages of static memory. */
> +            scrub_one_page(pg);
> +        }
> +    }
> +}
> +#endif

Btw, I think the lack of locking warrants extending the comment above
the function, to spell out what the implications are (in particular:
calls here need to happen early enough).

Jan


