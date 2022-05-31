Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D9538C49
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339192.564016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvwi9-0001HW-UA; Tue, 31 May 2022 07:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339192.564016; Tue, 31 May 2022 07:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvwi9-0001EZ-Qi; Tue, 31 May 2022 07:54:41 +0000
Received: by outflank-mailman (input) for mailman id 339192;
 Tue, 31 May 2022 07:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvwi8-0001ET-Ax
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 07:54:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e925f40b-e0b6-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 09:54:34 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-EIB31IJ_OdKhky1jwuu5Aw-1; Tue, 31 May 2022 09:54:36 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6033.eurprd04.prod.outlook.com (2603:10a6:208:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 07:54:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 07:54:34 +0000
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
X-Inumbo-ID: e925f40b-e0b6-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653983678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHOSTUy1FnbFA7QjAi/DOZvPLsWqa2smmUvHnWE6jaA=;
	b=eHBCJ2cvdBCj53Du/NN8V/FhmvVEuLtiFxHBRxPfMSlZOh9XBx68jLVed8HkMCZuO3bsn4
	uzQcQk2HRUurQ8JMZyYWHdK2HUnZ0PkyDY7mi8xxpnzI75KzPekwyQSzB6yG6LlOxRxbW6
	kHB1uRF/L3J9tVoXzmZ2A+eU6583dEs=
X-MC-Unique: EIB31IJ_OdKhky1jwuu5Aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1f4wU4VsiLGZAbz+n/SzJi8fcWnVwLhDiMUf9dwihj5GSn9Ib7w9NEKupnMxEiNeZq5oELxV2ou02nJfQSgQAd/fEUZXvjQSpPp5UlhShJTd9MdpUrg6DA6V23eMeoDHs55eLGCLw3rl0YqcVVNnpokqDQLgIHeAJx/CEaWhswL1Pae2OYCp/nLmloSzgZyuxU2VZ5hrOnforADzFyUtNZtTOnu61B2kehU/443YyAgkZqjEPFR/tvRQGVCgpTWO3vf+/8imbJvHtueks8dqhhSWD2uq2xjG9332ivVqDIm7mPx9/S22WW9m+MXO4pGiJ8PwNAqH//qkt5Hsg2b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHOSTUy1FnbFA7QjAi/DOZvPLsWqa2smmUvHnWE6jaA=;
 b=nOYwGJyg7/M6UuaULsa8lvly4wyKzjUc+ureruCNQS/XxKbP5Staj9jm0ZK9Wo+QpEiqhm7QtGsc7/xPVyGtWhsZx6mRXfJ6UWi2wibGoF3ZGNVTcvbjlk7x4L9mvTW+tSOd4GHQQXva2PEJL9DfOKWPGs4jIDCBmZfLIl0beSbCJn9ubGapt7pGsQ128rPeHZavq6sIE+wzgfrgodpR2oVH0p83vPjJia+dyCS+GRBOHDT5F1Qmo/el3ylboUsb53Ni0vK3qQZxv4hClfQpxO11vZ3nQQ783nUcFjzzrhKz0on7FUBUY2m1waa5Lw//zIeUlRdZE3ihH6m8s+AxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55710c63-c531-3330-786d-ec6349690311@suse.com>
Date: Tue, 31 May 2022 09:54:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 4/6] xen/riscv: Add sbi.c, sbi.h
Content-Language: en-US
To: Xie Xun <xiexun162534@gmail.com>, Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1653977696.git.xiexun162534@gmail.com>
 <ab42b2b2309874e5c3a42ce04e2f94e4409284a7.1653977696.git.xiexun162534@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab42b2b2309874e5c3a42ce04e2f94e4409284a7.1653977696.git.xiexun162534@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b851272-bbd6-434b-788b-08da42dacd1c
X-MS-TrafficTypeDiagnostic: AM0PR04MB6033:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6033CB9B488F1E7379E72FB3B3DC9@AM0PR04MB6033.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DZBCEKLdnSp0ZwTfJCyD59n157Usb4+MibhhJctduTwo3Sc7NjDV0J2P4RSA0E9wwXbCvM8zSTuiIdmnpj4aYbWsKs9Y0psEhI1hIryVPCQoJ/748P93etZ5TlNwfGGojxBZTTDp+e+NEP6scB8ohJXJusLmu4y7O8k2WjwMHo4sWXhWka21PwMeEDM8/9A/+7RHgtlOg3DcHiv5lx7fPN2cEQRNAFcc+kBLhXJBFekQUusAEbrLyahIUmyz2S/A09W5ud9eabiNKMcmu3fI68WlphB4QSxdt14wuzbwURwHxkKUtRsEGz2lz7i+/jLWBWT/VffZYVJZpKDRdckpji76ualQFXzDjcPRIShD9WOl0+TaFtMzGFSyAOJZnzMFWwJHZQGnZ8AOidMbo867gSDh3VUc3X1SsC8lO14Le96DNy6aZwsK+ydFKhOEcjRJSuuOXw/oI7Hxk4q5cYG7iI17t8glgTbDeYmSpTynna4+3ccYEpVUHE/Zm42QAhOWIk2Iu5e3G+FWLipQs4LJbm7FsBSmI2e87IqUbtLkC4Ps/Tx6v7UcBPL3ReZd+TepIng6KtkCdsSof0OYsfE4LtduPJqHjfls2YnPK67Q7x7yFHW7A8Bjem2s5HQx85BiXmw0+eaxI4h62Lq9lc1Uq/o3EicUtvWIFbdSMZFJGaWZpIbqa34HhC5zOjaQPnmfe6GBleAADzrnvoy9N3WGKX2071StuVwkzNYe3WW13c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(86362001)(31686004)(5660300002)(54906003)(4326008)(8936002)(110136005)(36756003)(31696002)(2906002)(4744005)(6486002)(66556008)(26005)(53546011)(316002)(66476007)(38100700002)(186003)(508600001)(2616005)(6666004)(66946007)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE91dldpL2JmU2lFRWRkVEdRQ3graDNxZTdrRkFERzByMFBqZVBUOXdzamZL?=
 =?utf-8?B?d0lIUE11TkdESUlvTFpKRW8rYlpYMTRTdW1GdW5ieE9ZSktLSWF5bEpoNERl?=
 =?utf-8?B?OWZwU3ZvNGRsemdmQXlVVmx5UGxjVE05NjRzbTFtUTMzM2ZXcTFGYjRQSy9G?=
 =?utf-8?B?VXJwTVc0cjVZb1h5MmYwN01udVZjSytPcS9JS3BYY3BTOTRNWGNhWDZyVXlD?=
 =?utf-8?B?cVUwcVpWTkdvNjZIUkU2NkxNMU4vOVUzZ3ZaZlhaN1lxWi9kTkwyZFk1UTBO?=
 =?utf-8?B?akxXdmU2RTRYUDRHZWZ6OVNBb3czM2I1RXpMK2g0bWluZGNiT0JTdG5oL050?=
 =?utf-8?B?RjFQdExuLytESnFjUmkreUVtR1RQQUJnTlJxQy9NQU1vNEdhMURYNWtDV2Zp?=
 =?utf-8?B?M2dTZlhvNVlzYi96ZVR1c3dRdDJOZ1Q4Z0dHM2lFMjZwMENxZlIzckRMUThu?=
 =?utf-8?B?a01PVVVhZEtFWkRHenJNN2FlNy9MZktVQ3d5a3RxMFpiNzFlQWhnODRuNTZ2?=
 =?utf-8?B?WTZ2QVM4bzNlRUJYMWhNR1J0QjJxVzVQMkwvOHVZWWRVbDJwZ1RTazRZYWFC?=
 =?utf-8?B?RkZNaFcrZ2F2SDllK1daYVI2U0JmbVkvRjcrb2ovbWR0Z2VHbnUzazZDMklz?=
 =?utf-8?B?blUxM01XeFd1N0M0Rm45ZjhyUDV1QjlWKzNzWXBNTmhoZVp5ek1jSDY2VG5I?=
 =?utf-8?B?RXVySUl6YzhzQi9zYmgyWXc1NEFIVjVtb2FENm5BZ3B5MXpOdm0rUlIyM1hq?=
 =?utf-8?B?eitra09xS0lJdFNjTmR6SVJlRlFKcmlVZzY1Z051TmF5UnpwVnhBNDJYZWhT?=
 =?utf-8?B?dStGelU5TWh6ZFhTbmxmT3NMWTFKKy9FM3JxNkpaeXRyRkdOakhySTIzb2dJ?=
 =?utf-8?B?SExreUJrTFlXZlRCT1RsRDFQeFgxQ3lSZ1EvSUM0YStBTE4vT0pEQjQzM3Uv?=
 =?utf-8?B?Nmw3a2RKRmh3NXlGVXNqMUx2ZFJkQVozYjRLOG5SMi9iNmRGQ0pzSkRQMmw4?=
 =?utf-8?B?WStsTmRYdE9GTFU5ck5xS0xIK1FtaHU4QTBJMjBSekxFTmVWb0luOHNnSHdI?=
 =?utf-8?B?U2pQUVVyejRxTmpRd0ZVc0U1VFhlb0ZiOTZsNnI4bVpLVnB3WXlVYnYwZUNF?=
 =?utf-8?B?WGYyT1M0dWkvWXFmYWxMWVBRK2o3U1FFbWs5ZnZEZi9vcmt6dDZIQTJuaytT?=
 =?utf-8?B?cWF3WGRCTkR1MTBkS3BDUm9Va1A3M05tNndmY2p2bzl6ZFRBSVNMSHkzbWZS?=
 =?utf-8?B?elkwODRoaXhTQVJHeEF5UHFURUhOMnZ2ZFhGU2E5UTgzSm5OQTV5RlR5MXFX?=
 =?utf-8?B?THdIc0FuclR3aGNwcEpkTmd3T0plZ2ZiSFc5b2NMMWl4SEoycXhIYWJyYTBP?=
 =?utf-8?B?aEdVcC9GYjZXSWVYbmhHWFFjTnhFOERSNnVMZGVtMHNnbHFGSGgvUWhOeC9P?=
 =?utf-8?B?S3c0ZHhsdXMyeGFkN21uZDZ5cm5hcER3dURjd3dGTVpXSkxjdldrdm42S1l6?=
 =?utf-8?B?MGYyZFJVRHBhRzkxcmxhWHkvNEhrQ0hzMTI2cmJyMG9XQ0JqVUNxRUszWUlI?=
 =?utf-8?B?YWhJWWFoSWEwMXRYT1FKc1poRHdYSmpDR0tRcTJNcnNDWm1Fd2hzT3duSHlp?=
 =?utf-8?B?aFFGd0lXaVMzbjUyeXhSTjZuU2pCOVVKd3htekRSWVpnYXJmcFpEeGlWZWdQ?=
 =?utf-8?B?emp0Z3NYRTdHVDFJblNnYmZQb0lrUmx6cnI1RDJrUDJLeFNiNFE5V1pkUVcr?=
 =?utf-8?B?ajZZSEhBeEhLRmU1QW04aWZTT2l2d2I1WUpMSVJpNEVESWNNRjdzTFRkeEJF?=
 =?utf-8?B?aUNWeXYxaENoamlqWmNkQ2FNdjZWSXVPdjN4dzQ5azQ1WjVvWUVlMnU5UCtU?=
 =?utf-8?B?aUVGTlBUK3loZkJML0VhelBhYktCZlpUNUlMTXdIc3lYVG9tWURPZ1BNbnU1?=
 =?utf-8?B?VXE1c2JBYjB4YkdCakhJeklodjVUR3hkSFlSMkNVclEwUFlHOEUzWlNpSktj?=
 =?utf-8?B?bmppZ2RXSmRLVVVZbjBPOFVrQWdKK2NEenk0eG5kSWpBQkt2ZGdObjJKc3dI?=
 =?utf-8?B?ZE1SVHZTWURWZVNIQnNNaVVUSTFDSzZNL2Rua1ZIckRzbmY2ZU1Vc3NRd0Ja?=
 =?utf-8?B?UzlwcUhtZFJzQkJTRCtXYkZ2Rmd6OU4yVW1UN1F4Q0h6WEhqdW5nK2thdzNO?=
 =?utf-8?B?QXFiM0tESGM5R1BsZHVmamtmT3VPY05SQ2QxTDRKS2ZaQVFvMHFxcnhiWmg4?=
 =?utf-8?B?Ykl1ZUYzbTY1MHA1TExiUzRPQlFSK0orTDk1SXV5cG84QUlKd09ZSlZBcU4w?=
 =?utf-8?B?SDhOcjEwZUxpV0FMMHcvQnN0alQ2VTl3UXFZK3E5RW5iYmtpZFpWQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b851272-bbd6-434b-788b-08da42dacd1c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 07:54:33.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNNlTY4Ot4xJlUN7H/0l/v3NWFf0KajBWF1KNNWndqRQQXGZy0Oc8058BRAr8TV+LqQiQlKgSc2qNSJT2XqHlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6033

On 31.05.2022 08:57, Xie Xun wrote:
> Signed-off-by: Xie Xun <xiexun162534@gmail.com>

Is this correct / complete, considering ....

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -0,0 +1,275 @@
> +/**
> + * Copyright (c) 2021 Vates SAS.
> + *
> + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).

... this?

Jan


