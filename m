Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E589343361D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213130.371253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoOr-0005fy-Iu; Tue, 19 Oct 2021 12:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213130.371253; Tue, 19 Oct 2021 12:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcoOr-0005e8-FY; Tue, 19 Oct 2021 12:39:25 +0000
Received: by outflank-mailman (input) for mailman id 213130;
 Tue, 19 Oct 2021 12:39:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcoOq-0005e0-4g
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:39:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9601115a-30d9-11ec-8312-12813bfff9fa;
 Tue, 19 Oct 2021 12:39:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-8MwZ-9bAPam7B7gPHb1kpw-1; Tue, 19 Oct 2021 14:39:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 12:39:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:39:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0092.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Tue, 19 Oct 2021 12:39:19 +0000
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
X-Inumbo-ID: 9601115a-30d9-11ec-8312-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634647162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0nQ9XuYTAjbiAJ0Watq2DV5kmRmzqQrNUQSZ11A9vg=;
	b=UuZtSQSexvMDdKLtjMU9iJJnkfY9Q9MmztAAvRWGvu8FxW9TWA+7Xi6+lmuc2T/TGxoYWl
	tlxHbvwk2jINzv+9rhW6eIGzAgY2Bj71xg714qUMMT6TufldA8slxxnp9Mj6fVtz42Y6RH
	C/GqDY8LjN97ZsqsC9wgdTr95xBxWJ8=
X-MC-Unique: 8MwZ-9bAPam7B7gPHb1kpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVpgu9YsZtiUyoR+QA/WFi/E6uGcflqoxDR+QrJiR2/el5QrzWB6zVR0YwcpTv5In8f+lNEtXMY2k1RiStg9MdbXeGQrGZVYnNOoLcZusUb8TCMljv9GzhJe0lVTbRgkB3/7jQBjCUFc34FD2efJqKD4uYx7vJmhrt71VWUVhhOHkZusdVMwzBTY+xE4s5HYv9kPfQYO/NeCrX4iNIWyUVBowja68Df2kti7d21rcareOz+vWMrXh9iTE7Xlc2KI4e9naMjsMVx076nws2ZsUR5YCR1r1fnDWBN0H9WNpGCmGmJLDahM1Zgvo80ECf+MerUFNR7BwBFPbBlQyUcBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0nQ9XuYTAjbiAJ0Watq2DV5kmRmzqQrNUQSZ11A9vg=;
 b=WoonGhq1SG5bA/6PcyMX/z8iEDD/ncN7lROAGL92wd0oGD75a4C9CaMdQG3oEpV1CkFjdsl0dGLbWKG7fIuCzSWFryuBiFbyr6M29n3uUjcsTxox/TV6/h8NBZqUNqXm7vMtdd7MgO0YWLocPKuEws79RJke2ZnPjtSWN+I0n7g5wXnTWEab9wfT2J7Vjg02hINjRDH/08IByqRV4x6cnqEbehYE+WXtDZkFvl8io6DdfDtamsnqzWkMr/P/AP5hT/WPSp+0GQ0trc1DhxV31xZQXbBPNKFNRDsm68PYHsIF729JhfZEJVqk/4oObehbebUdNT49oAe7Q+H6TPOYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/3] xen/vpci: Remove __hwdom_init for vpci_add_handlers
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: iwj@xenproject.org, sstabellini@kernel.org,
 Oleksandr_Andrushchenko@epam.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <33b03be7eeea521953790542eb31d5a1386d2b81.1634639117.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <116f5313-f2a3-376b-a0a3-af0d14d82125@suse.com>
Date: Tue, 19 Oct 2021 14:39:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <33b03be7eeea521953790542eb31d5a1386d2b81.1634639117.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0092.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bce99441-3a54-41d1-6fdf-08d992fd7875
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174246092359982D00AB495B3BD9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ijbxdHiixkKZPTxDQnuE8Tt/uBMy5lu2p30kcZPyv6TbcQPVpGf52gc30+DAWHZ0Dt7inJYFtguAPXKH0s3F16zdZu9Eg6ZYSWA55tlb07+SBs3oCCLbiKhweYcnoHyhmqswSjWqX7SoSaIfB3vsdsTp/gCAwWdW70MvKQJKGw8oZ2v6q/XF4oatDCPrccKFU3/cTdEPF2oTe2+aq+YJ7zkg/SW+xVtOm5EfRKV6EMR5ShiuIJiobZ0pI3POTNK+wCrMRu4NJfQTp19AZCaU+//lzWxHuUS3s4PzYH0xgAup56wS5XTwl2z/B6p1IkiB1t8lfECL3yo71sKMzVcpBTf06fgzStvLYxyTMTWVu/DIxwmYkTtdXvX7qtGATyEo94v8mOtT0cLXYCCSlzAUhtf7mj8XeQsdo97Z7C1wxlcpLvwARpojJ3ec+88/t/yfe94yno9pbENYmZ8MPPnvY7lBw2xzkLRRWwemB7OST0kn24MGwXafz+Ky+QRzvWLzkTlq1MYod99fTGAQ9xLl6AxUZ+b/8mlqMVNx+EpSjBLKyXWsJtMeqkZc4ttcmIQwO39l41BNht3T2AHsiPD5jkGYanN3PL2KKo5siwdJum5Z3/84YLeHIU1X8o6wdTSrJnU0QRdmICZLtEOPaetBHCaI5oHcOylG6BKoJWVRZOStxsMo67JJ8XTurQVa7/D75WYohjL+VshQVMwdFkN0hdcejZnQIKi3QXZOql2WKojbwJuteEVW8BpYwCi2jtOp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(6916009)(26005)(86362001)(2906002)(8676002)(66556008)(16576012)(31696002)(316002)(66946007)(508600001)(956004)(53546011)(8936002)(2616005)(36756003)(5660300002)(4744005)(6486002)(38100700002)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xrdDQxS3dQVWs2emZhWFNjbG1HS1FUY0xiaG1Qdk1nTTJLcHMxQVFDcG1O?=
 =?utf-8?B?a3cwektNdlJGNk9VLzdTT2R0VFJaTUVEY04remxvUDk5OUJ1ZXFVRlZVRUs1?=
 =?utf-8?B?ejcveVo2OVFHRkJ4ckpxZllBUzRmbFJkQVlKY1ZnWlEwUEJjNEVGWkF1YzNx?=
 =?utf-8?B?VEovTkFEb3BUZ2lxSHhzaHA1SExaUUtieDFnQllZaGdIUkJLZHlZSisxWUgy?=
 =?utf-8?B?VmFnNlFmZ2lRSGV3cDEyYWJseTZGUkd3dTdVRjRUaVpVei9ZNnkzZTNNTWYx?=
 =?utf-8?B?SG4rL1JYWnFJS3lmMlJ0a0hkRERhL0l6WS9XZk11R2VxUmVBWCtNZnM1TUdx?=
 =?utf-8?B?dVJXSEFIampKVzFRUnRDQzVyMTJxQXFpdG9KdUNTUVkzOEZVUzZRZzBIMzN1?=
 =?utf-8?B?UFlPWVZ2TWJLSXVtU3hrc0JoaU0ySldyUHFmaXZLNGZOZkMzV2tsUzlSeXpa?=
 =?utf-8?B?SmpZZ1hhSEJHOE9pSjd4blFleXlzaFBCZmJRQ0RwU3pqbjIyL3RtaCtOSFBx?=
 =?utf-8?B?RE9RNXAwdm1OZHpMMzJ1UExaWUpKblpWdkxmOHNOb0FkZW45c3M2MEJFcUpa?=
 =?utf-8?B?aC8xQlMvYVhnUnVCNU9TdXZOV3d1bXNjRHFtOWpJQlNWMXlzWFM1Y3BjYmJJ?=
 =?utf-8?B?eThrQlYwRnh3a1dvc1dwb3BXUC9reG1KNURTUWhOUUNCQjdlMm1RclIxa2tU?=
 =?utf-8?B?bzFLdWlGZkJkK1dPV0k4d1dBWVhLSHd1UFBycFZqcjBQNnh2ZlFORTlnNStQ?=
 =?utf-8?B?eTdCZXdubFNPSUcwVEtpYzcwYUFqOXRSbXl0NHdUQis3VmJCaHlvRW9UYlUw?=
 =?utf-8?B?TnMvR1JhNEtReDlhemV4SDVPOWVTWVViNHdiK3dWYitYcDlXUTA0UDZGNE5K?=
 =?utf-8?B?VXlqWTZ0TTNYMTFaR25ybkxhekN4REM1NCs4WVFSQU05azJMVldqaURLMGNs?=
 =?utf-8?B?SWZUR2M4cFBjbzBhc3JtL0szcVhHcFZlNzBCNWZHMFFWNUgvT1R2QXdIQzQy?=
 =?utf-8?B?Ni9UQzVMQXhyb3AwZHB0cGlGOGJCdDdtY0VBOUZXTU1iNkpKeEQrZVhDRmVp?=
 =?utf-8?B?RCtONzBwaERZeFVuekFJR2NOdkRsYVRwanAxRHBjRzZQRnFwb2t4TC9VUmcw?=
 =?utf-8?B?dGxPUFJCcmdXaEY2dU9yNGhld00yTEordWdDd0NVVjdjNUpMVWh4bGNnSlJj?=
 =?utf-8?B?S0djcW5IUERnTXEvM2pFUjdRaEZJQjZZdGswQkZnOHE1aEc0RGpIRVFua204?=
 =?utf-8?B?R1FuVFFRT0grZzdKbzJiRWR4ZHBZc0FwYWk0YVVmTkloVm1IWmdMQ0pqKzVC?=
 =?utf-8?B?ZE1yQWZEZGJZVHZKeDl4T3U1MVRMQkpNZkc0RFVMaHBBdlo3blJETXk5b0sz?=
 =?utf-8?B?YkRIVFNXVkhYQWtzbFJhb1JJWTNBdUl1aFNjR2VWckovNU1rd256Yk5sbGRR?=
 =?utf-8?B?bXhPUDNrb2dycC9qVWVpNUY3OEdnR2EraEpyUjdMREhsbWh1dkhSWmFvTnVz?=
 =?utf-8?B?NEpLbVBvQnl5RjlhWjZjUzJHSmlEanZOQ1J4cHpZNXV6Yk9veklLTk0vdmdO?=
 =?utf-8?B?ekxyR1BhTkZTS1Rham02eXFjQ0pwQURnbzNEbUtnb1pEbEhrWmExMDh5TjlH?=
 =?utf-8?B?dUlqb0M3Zm5tQTlpOURrcXJ0bExqVCswczhpWlNyVEdnRWQ3Y1pvVjBoYXRj?=
 =?utf-8?B?VkxpUE11NlBNZzNtZzZoczI4aUZFWVc2QnhlbTJPUlV4bGs3LzJoUnVGZVR5?=
 =?utf-8?Q?hcJY8yKGnKS+IbkEZqYJcwuJuqeWcoFgCsNf/n0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce99441-3a54-41d1-6fdf-08d992fd7875
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:39:19.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNaXyupmc1p6oB09G4j4O8SJjtrhJMMRH89NQeT1Pib5b3xsppPh+3h2j8ZooqfjPNQnXiTWuiBXk2kzQyoLEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 19.10.2021 12:40, Bertrand Marquis wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -54,7 +54,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>      pdev->vpci = NULL;
>  }
>  
> -int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
> +int vpci_add_handlers(struct pci_dev *pdev)

A fundamental requirement when altering section attributes is to
also check that all referenced entities are appropriately placed.
Afaict this is not the case for __start_vpci_array[], and you'll
need to also adjust linker scripts to deal with that. Further
you'd have to check that all functions referenced by that array
aren't __hwdom_init. In taking an example (init_msi()) I'm
actually surprised to find it's not marked __hwdom_init. So
maybe all is fine as far as these are concerned.

Jan


