Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62A4461115
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234389.406785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcwg-0004tJ-WF; Mon, 29 Nov 2021 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234389.406785; Mon, 29 Nov 2021 09:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcwg-0004qX-T4; Mon, 29 Nov 2021 09:27:34 +0000
Received: by outflank-mailman (input) for mailman id 234389;
 Mon, 29 Nov 2021 09:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcwe-0004qR-S0
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:27:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93e5bc5b-50f6-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:27:31 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-AAOLLMJkM6CQKihvtVjV6g-1; Mon, 29 Nov 2021 10:27:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 09:27:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:27:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0054.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Mon, 29 Nov 2021 09:27:28 +0000
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
X-Inumbo-ID: 93e5bc5b-50f6-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638178051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtLNOk294Uo74MVaSXdJsRjdvm/2GnkJvkOrt6Xmrf0=;
	b=mgOUqjgEsVFgVBjMieaiM3Cvw7xPL3SC3EJqQ8XUdJGutPN6pQMtOM57DSOMZHCOlh5opG
	MJsmce2bQ+T8/h/hAR05NASmVtjdBVxQQk1lgKg+SiXnUgNMAaKBcgSNZE/YbC1lF+z5T8
	WjLijrjJNd00IQruDfsjKr+F85srqQk=
X-MC-Unique: AAOLLMJkM6CQKihvtVjV6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaLCBIbzKCebPnQpJe/+mI+qitbqWFMqsKBMp/VL5/FegHJcRNp8ImorrhnN7tZjgOwYIwZ1HR5pPL8TxpynbsXLoqROyCrOkqn+bmT3xd9xAU9LF/yNZlEHecy+4BwD5nfboSxA83PxbKjYa91ej4D+DedOiST9k3YtKCmU1eIjXGVklgd9twA37aqNS4Q2GA3BNKdJn7GMS2rdZwmBovAjn7R+A1H40p8v3/8bYex7oElWDiVXtg2ZPi1A3/ayD9yrCR0G2t4XPtr6yVEC5zBH0sl8+wAZfn0UEV2WTBD8FTrgC7cmC01CcN9PXr5uWS5D7xumS5fmM+IgsMbGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtLNOk294Uo74MVaSXdJsRjdvm/2GnkJvkOrt6Xmrf0=;
 b=YbrbUY2+mu+QZB32iXO7SpTwFiZGqlsyXXAktletYZ4AnKh+beE401HRx9ebEFFKyAnDY/keWQ5dNrmNSi6mlPjXibIVhS8QoXpIEdThuwtEXnkuYO1daVRIltHBTymDxOZqaOE7c7SFZbvNrYJxWH/FgIQ34DhdFEIpDM8EWQLd172O2cz70z+xaAwGo7jgy7bQsP+r12/7E5z3dG6a7QLTR+EecOmOfian+Fs7DqPj1eLwMPD1VIlWY+dxwkvUqANrhCylZyGm78846D3NwK0hVZ7mpNC9pusVj82LthMnkv9FM803xRTTLPKJFOnUsJLkHNKQetkN1CSgZ2WNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb030726-c3c1-9225-08a9-8e2c37281962@suse.com>
Date: Mon, 29 Nov 2021 10:27:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0054.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720c709d-a6f7-4649-30f2-08d9b31a763b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2605997460BE1DFDB25B1DC6B3669@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZYFPO0MYNdcJqdBl1Ui2oqYOG65UybKuhXtARL8+zrl7By7IA6hxKJEP+ZDV55fzTNsposGZuD2H8JRUxHciXjorN4w6fPU6XqQPdXHKsYNY2OFcUs6LgnZNhFhGqY2bPBL3o+XxkfpJO+QVx5Io2NXkUdDjRPEFdENpS7AX6OxjFexa+ioX71qvpAJuKOvPLcx8g8tp6ekwm7Ub3d/hNDUC6d5Ah65MB03LjZ1lsCmk+A3wCYA9Ru6koXolR/A3/PF5NDLvDtswPNsKfXLQoMsmSELjFz7clKL8heUx6L72D/+GvYrt1MqCDo89Oq1p0saLEoDRbWguTp+HMsgG4bUHDLbe/lwG5/20JhrzSUXPzz6hszCI+7oUErSPKI+POmqBtebwdFbLhpfc5bqWw1+ZZEe4miE4BJcNOgZiD040Ak76ppnNOg+p/d6iRbhgNtnwMc7h83QGTQqsS4t3+uTqn8eEGWMRiUSCQeXLgiOEoMRNKJqzrvLvAyheV3UZKnyhvA8ykvoODXCshKo2VkXVw12+NucQjpw1vhjoN22+n8REp1/f9+vAndns0U55giDnbgg3GrL3XIP3R17gUOdCeI1fjKsQiw0AL/qTWSW74iH52lsWKMmaUv9SSmWE2UBxkLl3muT0VopJNJAiwCoVxCkwu8QD5gy0ZOFzlKxboTp0/aJnFD/2VIfT2DEyScThopt/z1icUtPOm04p6SbJKKVNPDJGppWid8PyEcHV3WC2nWNmWcnnALPcxP4k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31686004)(6916009)(26005)(54906003)(53546011)(186003)(6486002)(316002)(16576012)(4744005)(86362001)(36756003)(2906002)(8936002)(956004)(66556008)(4326008)(508600001)(5660300002)(66476007)(31696002)(8676002)(66946007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlobXE5NlYrZWpkWDRhM2NzdlB3QXNYdmJlODVvMHU3Mzg2MzZpUVYxS0JZ?=
 =?utf-8?B?djYyZEJaa2ZGOGh5eTdNVUcvWXNVSVVQaE1JNUFwZldVcnNuVFFjcDhYeWQ4?=
 =?utf-8?B?VFV0enhTOHU4cGIrYnZPRTRrY1dGNnRFWVlodk5MMHZtbVR1bHUwcFY1UGwr?=
 =?utf-8?B?azRrN0RTUlczQVFLNmpibEJOMGtIRFMxNlVPUDFIN0ZQVndHTUFsN2JtWkNz?=
 =?utf-8?B?MHNocGI4bTNMcm1WT0dCZEF4QTFvcVpJVzZkeExIZlN3czVwMmh4MnR6Snd2?=
 =?utf-8?B?bkhNMTlXbXFaZ0ZENWZucFA1RmVCM3NsampiQ1FFOFd2RGZMb05aYWJRWEdE?=
 =?utf-8?B?a2ZJc3c1M3A4L1p1c3JvZWpNZlNwMjhmVXdLeG12U3YxOVJoaVpTbEpINHVJ?=
 =?utf-8?B?UmVWN3g4ZlFzNFFVOUFva0ptVnZXQWNLNit0dC9sMXp6M2V3akNQcGJnQ2l6?=
 =?utf-8?B?M0lMQ3o2b2k2U0pFdjhsbEtwbmxOd1kxTnY4aVc0anpiTVJPVUh3eDFZdzVz?=
 =?utf-8?B?MWQvb3JtQ1hqL1JkWE5Pdjk1dHNFaGhhUWtFdjUvbFA2MUMvR0pVYnMxRnU1?=
 =?utf-8?B?dm50dkw1aVpIZmgyalJmc2dXSDJ3YVpIZW5Vcm42K0FNN2N2b2t4YnZtSzdm?=
 =?utf-8?B?QU9GcmJtMUJKRS9oWllMMktyYWxyYS9sU1hBOUJSL2lQdExSTmpZbWRNb3hv?=
 =?utf-8?B?aU9zQ3c3eWVMVnR6MXFaZDlmRTJkNXNUVlRNRU5KSzJkT1NIYkQ2U0Z0elRo?=
 =?utf-8?B?OUIwWnhvdE5nOEhWTFM1OXJtcUw5TE5aRG9xN1JQWDh3MDVUajVTWU9ZVDY0?=
 =?utf-8?B?MCtoQ0d3OU1oVldYQS9NalhKdHliSGZDREw4NFRaRFNWYVI4SUE3QUtLVG1U?=
 =?utf-8?B?ZU5nb05yMWZQT2RjMHFvdDQwenVBWXhvL25VRHVvcGhVeTVtQXJBYVFEcVBZ?=
 =?utf-8?B?RXRHbytYTXRaZ0pZNFpyRTRKdWpaYncrS2ZQY3gxUmhCSGg5MGF3TElUMzRa?=
 =?utf-8?B?OXROYTlDT2NTdnFkYzdSSmhUN1hEQkwxODVheStvamZKengvY3pObWZ0UmNa?=
 =?utf-8?B?dzU0UzlJUWxvV2xSaGtscTVkUi94QSs1RWxCQzZVenluZ3dUNmgva3RlMTMz?=
 =?utf-8?B?Unp5eEw1TmlNaGNCSnJ0Z1A1SmUvL0tDdTZGZEJXUXA0eG9EWk9ROWhDMzFV?=
 =?utf-8?B?RmVQZkNVMGdISGJlMVl2bW1VOUlPK2hOVk00UWRka0NjY1d4WjNHR2JzOVlX?=
 =?utf-8?B?YXZZamc4TUdnRHBrd1NXTy85Mlk2NFYrUE5HZ3RoTDdES2FkZ1VEMjFLWUxB?=
 =?utf-8?B?elIvNGhHaU5uc1UwbGZ5a0JLUUxpVFl2OWNiMVpmRzJnQS9DMDZCd3BmVE81?=
 =?utf-8?B?MWtBUVZ4a3hwM0lQZ2ZYcnFTWHhsZlF4a1Fkak9JbXlwRnhDcXUxV0p0NE90?=
 =?utf-8?B?RVZYa2U0bm1BeGpMN3ExT1VOZTZrUnFXbHROYmM4WnNxWmcwdXVCNUVpOEtQ?=
 =?utf-8?B?ci9pM2hUZTJTOEgyOHNubjJLQUZ2T0tGWktFaURvU3c5QTlFWU9GWk1PNmVv?=
 =?utf-8?B?TnFWbmg1UU44T0lSWERyRCtOeDFJN01FL0NiTlEzR09YTW5EU3M4eThqN2h3?=
 =?utf-8?B?d1NuSThSWHIxbXpVTlZZV3dpUVJLSTRYdDJDYkRoZ1VrTEVvQ2cvWjNKVDRL?=
 =?utf-8?B?ay9rYjY2WGNIdzNoanRheDBtZUNIVjVKTTZ3QUlENzJsMWNRS2ZEcTZxdE1i?=
 =?utf-8?B?VXJoNGlSaXo0TmhYeWdSTWNCeXJ4QUlJL3RSMTN5RXVxUG1VTEFqMEswYlRa?=
 =?utf-8?B?TFZTZmxtSENJZ3dZQjVGbDUwc3pTNURUMVNuaG5ra3NNeHAvclFzMmxSa0Nv?=
 =?utf-8?B?KzVKV2hta1huYnFMeUhKVHoxcy9aWElFVFlPempNenVtNmtmUVZpVUltUFQx?=
 =?utf-8?B?Z0N3NnhPQS9ZS0s0dm9TVUxnODZjeFhiUWhEQWszdEtERmFMajE5czRMdk9H?=
 =?utf-8?B?Z0llTTNvWnRZeGpjTFYwUGJjTkV5UVk1RTFwbTJ6TGJ5cU5RRjlGd2lEdjl6?=
 =?utf-8?B?c08yZkpYKzdRVFlRTTFvcG1VMFNUNXFEaXVGQUNXa1d5UVZPWVFQNlNDTy9p?=
 =?utf-8?B?bHV5OWlEYjZLdTQ2OU5jdkJMUXgzM1I2cVRNcTVZTEhNU1lyb1JMbDF1UDJR?=
 =?utf-8?Q?XF9aI7JUjajmrIeneTHqQOQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720c709d-a6f7-4649-30f2-08d9b31a763b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:27:28.5407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckJCLepVVRYVNR2fY5Q5oCkROJaAlNV2oxeNB41brU0JMNVz/Do3ZIAB3fId7BiuuSrlMGmlp021rvvM409KsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 26.11.2021 13:33, Andrew Cooper wrote:
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -46,6 +46,12 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
>  
> +ifdef CONFIG_HAS_CC_CET_IBT
> +CFLAGS += -fcf-protection=branch -mmanual-endbr

Don't you mean to check XEN_IBT here rather than the underlying
compiler capability?

Jan


