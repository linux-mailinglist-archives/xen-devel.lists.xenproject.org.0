Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D242D488
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209064.365400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mavnG-0003vf-OO; Thu, 14 Oct 2021 08:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209064.365400; Thu, 14 Oct 2021 08:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mavnG-0003tr-IT; Thu, 14 Oct 2021 08:08:50 +0000
Received: by outflank-mailman (input) for mailman id 209064;
 Thu, 14 Oct 2021 08:08:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mavnF-0003tl-AG
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:08:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f5fb9ea-36a2-4de8-af4d-164fba92f45d;
 Thu, 14 Oct 2021 08:08:48 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-kRjNosiFOsOv2kiZ4rq5gw-1; Thu, 14 Oct 2021 10:08:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 08:08:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:08:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0030.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Thu, 14 Oct 2021 08:08:43 +0000
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
X-Inumbo-ID: 3f5fb9ea-36a2-4de8-af4d-164fba92f45d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634198927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GW9Cbua5oZ362cbCXIdYE06fuKD9FywCuCQTgiWmguA=;
	b=OmGieRRQh2aNbD9DFWRqeynfuaEIfzMCFubxnPCh9++zDVdhQN2sHEZoYk0VGnfgmzDNBh
	55vy5WlHCUDgiauO/ydbfjxHzhd1vWi0cb6qbBV2GGwt5HuLdxyfP5DggEwZ3Qo0JuaXa+
	v+34+bFFEu3wBlZ7Sz0Nyf4FfNrXq8E=
X-MC-Unique: kRjNosiFOsOv2kiZ4rq5gw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg4C/voBt2yikgn2Ex4SnHyRznAwb6QktcgP3wlFQimyYKPpBCWmzp4ON7Q2nD9u5m3lw251Qb1QzSCFf8QAcdA9wyj8y8bbhWu6I/amUVs8RthF6SoicNMG0xuACjU/PD9SwuyF1dxe/eS/q+9ic+fA0/FZ6T9mLCT3dth5c7TIgjnjVKXZtAwN+q1RrcTGGu0PF+BvoiuVrP17rbfMx1HlbawWqfro598mt+xLEcJV5U1SosnXc3fRffDHadNbXkXcCpDdyH4R+TMHnw3YOyDSFyWLEU3k9R+m4vP7ErvlZoNHQumrCzjpd4wp6vsUb2Q/VQ3y+5IuygxVILGmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW9Cbua5oZ362cbCXIdYE06fuKD9FywCuCQTgiWmguA=;
 b=a9S5hX7rs3RxLJGyAxcswMP2qM/+1KyvZUrh+sYq8rKINBSNhPmazkl9YsGsflOFqK4dzir//MXaMWD5y5TXmureEOdZgQwBJfCg+TcadJtn3AjkBO4+sIYtOZAR9Ajmv6VJuuwvwEn7tFAM4t1VrTlmQqm0nnzqyJCEWI0DEUn93C7tSAYU/v8s7QEvUsQ8V2x1S3Tm1feZL2hg1nudheAWLJHP+p2a1q3m8PA3GrGdkJ9GTUyWx2Wd6plw0L6xzYTRV3mNmQ5XFLA5FIWuGkvxbOygIXyQ6+lEjTK+5cErJnzNrMCv+5eRMg/xlGl6fg9plw+AK2fEQUbQkXIvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 40/51] build: fix dependencies in arch/x86/boot
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-41-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fbe1805-3d56-1146-c19f-3be2f8e949be@suse.com>
Date: Thu, 14 Oct 2021 10:08:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-41-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a2665f9-241c-4268-d8e2-08d98ee9d769
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448942930B0E3CFF4E6B0ADB3B89@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TkaR6M5BdzG3Km+N+jEsImH/aIlwfa5YkLWOvVONly26IAznH/z0l5+9tRLTd4h5xvN83NUZcvHzNWRDyD8iaOU4btXZBmJAmiEovXxbS+8DtNj+Jk32P6He5qAMrNOnAvGqhPOk708z3VTDkpBbaVgzuiUynvMVyU1eZcVCC/Ltl6PfKn7hBuzyVQb+jPzARWpdddnTilKgcfUSF4gs3kod5oV3foMdwA0G8HdOE5436XJE6Cmc0AbzJQAL1QGo4tDQL5dXXXNVqlnAIhNKVMBd2UMGq8yB4AD4CV0w+Nvplwusj+WY2JqN0y5WremVzFKh0y2uTEsSbv51JaNE6DNdgMGUyWywd+tCzqchexcBMD7XCSvQFYFhlA/IaNT2wy6KdflN4BoiLDKdK7+M0hC4cti/+/Pwo8wn9Ano3TJqLFC7jqWmo7hNAP0U6E7Jun6eNX0v7AJjRyR0ywJvfv+DJJO1ose7I9L6V8u/JkiQr0FuxdWtyKmvIxuYB090ZpsagC6+hQaY+v+q9szPg9zkDCjw+2Kyb/bgisrhxOYkS0gttkGmOQAfkjBEUOo2oJGKZ+4YlL+6vlSgZl80jPnBcTaYecfLSiHBCXpEEbRH8MBjJUhNcvmNPdcEgI6TACMB75o7n1c3S1oP8C/qahEMhLx73ajMCHH+qVYS7nqFf9Iq/b5fsmkCVOkwTgYcJrQYr0s3ghxXyK4XzvAT2eDrYcykLgotavsh4FUpFaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(8936002)(26005)(53546011)(5660300002)(508600001)(186003)(38100700002)(316002)(66476007)(66556008)(16576012)(54906003)(8676002)(6916009)(2616005)(4326008)(86362001)(31686004)(36756003)(956004)(6486002)(2906002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBCRThFS2VtUk4zRFB5SHpQRjVCUkFUcHNQQlhFK2VKWTc3TGtBWFRKTHds?=
 =?utf-8?B?azNFMjlaU3Z5NGZwM1pUQUdiRFFiTnR3dkFDWGl5QnErUWYySnNQQ1o0a1Nl?=
 =?utf-8?B?aTVPTXRVYWhUbHdKYVFmQ3pWcUVZU3VsaHY5U2dMcU92RGRMaWN1c05nVDRw?=
 =?utf-8?B?RGY5bDZVZFl3cC9RWC9KQnB0R25pZk9WR3lkcHl6eitDQ3M5ZHpsemx3b2h2?=
 =?utf-8?B?Y0hVSVZNakRPOGswaERVL3VsOVg2WjhYZGlNNG9YdUIxMXNnTFNwRm9PLzhQ?=
 =?utf-8?B?UlNVWFlzNnZLNmE4aCtaSncxSnpmSk5qVG1XVGdTclZPTUdXRTJhNGl4bFNQ?=
 =?utf-8?B?b0NoZ1dNbGVjMUFMUkFvOGlGRDNoZEpFQUtQeUFCTkZRdER3amQvVGhDQTZz?=
 =?utf-8?B?S2dPMnhHNHNEcFdGekFMeTU3OFlxeUFGdjhrM2JBZWpjWkFCeWNSRzFiUlcw?=
 =?utf-8?B?dVpuNmNNd1kzMTBSYTJ6QlA4UmcwaTNkWlVobzBEZHdxTFVOYmlITFowd2xq?=
 =?utf-8?B?QWlQaHRDZEVTQ2JQZUUxTCtZQy9WN3JobWc5QWpua2JzM1cwVVcwK1k5ay9u?=
 =?utf-8?B?a2c2aEZtQXBsMGMyOTBSckRPS09pY0NUcHJKMGpjY1hDT0NRdTVFWmdyRGIz?=
 =?utf-8?B?Ni84Mm1zZkxQclMrY01vNC8xNUxaRW4vazNRdTI5QnlIdnpBOXliYzljOGp1?=
 =?utf-8?B?azUvV0Z0MmN4WStlVFZiSzhoMXR2c3dLaFdWd3F2bDZDYlRFM2tWczRLNUow?=
 =?utf-8?B?ZzRKbkx3aE83QVZjTWh4U0NpUUgvTDRWckI3Snp0d0hheUZFNThvNkFicTBG?=
 =?utf-8?B?dXJ4VDlJNE16cUhIOGkzNUNVc0N1Y0VRck13T1lQZ1hNR052QWFiSjV4aFg3?=
 =?utf-8?B?ckkzSytMQVNiNnZHckVFL0hrRDlvNkk1VE9KUU9BTVQyZU1CL1Q5ZFlaUHFl?=
 =?utf-8?B?MTgraXp0cm95dVprMFYvYS8xcjBUbWF3WGNYNldERVFJUDdVSGpZOTg4WXEx?=
 =?utf-8?B?Y09IV3F4WUFqR1VTYVgrSG9TMmVUSmJuOFNOVk53MGhkVmpPM1JYbk4yTjQy?=
 =?utf-8?B?SWh4VkZ3bndDMnZQSGt6WXAreklUb1lZbWsydnN3WkxVWlprQ2ptVU1VWHFa?=
 =?utf-8?B?SUZHU1oxN2REazQwNk9IbzZaOGsvSzQrVmpmNWYzNTV0TFFpdXpqV2VYREhO?=
 =?utf-8?B?d1F2QWozN2FnMW9zazVkR0h2WTkzUDZIVVM4VHhXRTE5N1N6TXhtUlFWY1dX?=
 =?utf-8?B?N3Q1Zk85TklBK0d4QndHVm14bnVEMDQ2MGRTYnNReE9ya2RzbmphUmUxaHZD?=
 =?utf-8?B?L1FXN2g2dklsNmtJOUo4MGdXeWNPTUZYNUtNeG1LM2FjemVYZmo0WXlGeUlx?=
 =?utf-8?B?SWJVcHRnUUltTlNvOTluci94NFpoVSt3SExwTlJTN0d2VkxtQlQzQkV1UVhV?=
 =?utf-8?B?bkhCRWdIRlRqODNxQVdqL0NnUWwvOWgxZ2lXQU5YNUJUK1F3d2F1MUJzbWl4?=
 =?utf-8?B?d1haa1dUTmFabjJ1M2NScUg3UkQzK1BKU0o4TEkxTDlXVnJva2pYVG5BVTZa?=
 =?utf-8?B?WFhQWnZ0MEowdTNEdHR4cytVbDcvdk94NjdUUk82MTBxR0M4VjRYblpPRFBT?=
 =?utf-8?B?Qnp1NFFFNDJSR21zWXVDN3VDUmJ2SC9WaXhzcVJZWGtNc0xQSEhTRWg0L3VR?=
 =?utf-8?B?MFBEUTNzdk1zbGZqd1JHVGdGemtHSzRpWFBqbUtpQ2luSEcxZ3RWQlBhU1JN?=
 =?utf-8?Q?2+36mAWOzeHZOBTAQRwnlPwvyEYbrm6EzzCFr8B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2665f9-241c-4268-d8e2-08d98ee9d769
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:08:44.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsId+KFAMD8OM7HVc5q6g45O+VGf6E2vh0BGGgCKlOt662tIFxCH2zwG8oQLifcJ0Kyce/TdZCdi/0FuVxRBkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 24.08.2021 12:50, Anthony PERARD wrote:
> Temporary fix the list of headers that cmdline.c and reloc.c depends
> on, until the next time the list is out of sync again.
> 
> Also, add the linker script to the list.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Afaict this is independent of all earlier patches, so I'll make an
attempt at committing this soon.

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -2,19 +2,22 @@ obj-bin-y += head.o
>  
>  DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
>  
> -CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h
> +CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h \
> +	       $(BASEDIR)/include/xen/kconfig.h \
> +	       $(BASEDIR)/include/generated/autoconf.h

Especially with this now needed in two places, I think down the road
(unless we'll get dependency tracking automated here, which a part of
your description suggests is not going to happen soon) we want

kconfig.h := $(BASEDIR)/include/xen/kconfig.h \
             $(BASEDIR)/include/generated/autoconf.h

and then similarly ...

>  RELOC_DEPS = $(DEFS_H_DEPS) \
>  	     $(BASEDIR)/include/generated/autoconf.h \
>  	     $(BASEDIR)/include/xen/kconfig.h \
>  	     $(BASEDIR)/include/xen/multiboot.h \
>  	     $(BASEDIR)/include/xen/multiboot2.h \
> +	     $(BASEDIR)/include/xen/const.h \

multiboot.h := $(BASEDIR)/include/xen/multiboot.h \
               $(BASEDIR)/include/xen/const.h \

(and by implication I think DEFS_H_DEPS would better be renamed to
deps.h as well).

Jan


