Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D246EA5E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 15:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243102.420431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvKl1-0006KE-OP; Thu, 09 Dec 2021 14:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243102.420431; Thu, 09 Dec 2021 14:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvKl1-0006Hg-LC; Thu, 09 Dec 2021 14:50:51 +0000
Received: by outflank-mailman (input) for mailman id 243102;
 Thu, 09 Dec 2021 14:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvKl0-0006Ha-1V
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 14:50:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6544c76f-58ff-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 15:50:48 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-CffE9WTwOmaK9Uk9yCpKuA-1; Thu, 09 Dec 2021 15:50:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 14:50:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 14:50:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Thu, 9 Dec 2021 14:50:43 +0000
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
X-Inumbo-ID: 6544c76f-58ff-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639061448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0d1plSlWFWoRUgH6Y3v4RbPTTXNogkUNcjowDv6cRhE=;
	b=Jxny0q4tc3EFlmmR/e3chkwer3qrqpTRlwjSa+VqoItXXDF11T96uYt0hREOrah7OnSS10
	/WGKAym7gmStbCGHtfc4llkPeoaD1R41LJdK7elpdgevlLM+mJiXjq/WLr7fvxUBEiW0qw
	tvsg73Rf9Mvn2XwIqt+KTukee0RhuSU=
X-MC-Unique: CffE9WTwOmaK9Uk9yCpKuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJjXC/Sxv6lF35B7dI2Q4k9fyCD1jUPOuDcXyw4aqB+s0l5UdEQB6MTS5EDU6m6zFu+YROazBijKSV6KnXlsDQyCxffGGwqbMhQGmYgUWRcOhVRIHz2DDFIJ2cAN7E/i5pdYyHofaO7mEwD93F2FtgRGHjjcKnd/KjqJ0PnmtJBZsZfQdrKAIwufP2q9ruQSPQmtn75yZDMWUt1aGBw8DD5N70wNIcADavgRIFLagGHc90lbXH4Qt0jWzuWUXS64r+5XwVyYGcJHW7CULt4YPdEnljy8XI5NV4Tw20qTSPVGHQa+A28QVQZ1GDudkxWb005hztC9DhJtsIx7ue6okA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0d1plSlWFWoRUgH6Y3v4RbPTTXNogkUNcjowDv6cRhE=;
 b=jIlGuM7V1n6Jo4wk0qLbm+GcUd2nCANC/HdV0eBmdPYBV4OsdcqbwswSpzMMo89/Lt6X6J7jiOcYXaHm4uDp26xq9SVIQkWfumLAmRofmxd3mi7PRAbwUNBLMRTGgo3mJhhk3KY0gRcS8ponKLkhOJQk9qzMkZwZwSNMlquraRTQEC5azNE/uX+t62cayc4WlnPVhZXGuN9ukLHaUPmx1ZTPp3nzdg+VEjaXJHsM8VV8bqfWET4o9o/ZDRKttFbk+XSDQW8Lui5OCSYRSLsRJZ9ekWdvER1mvOFnzVXTgmxqialPwK5p0nIz91RyEPgNom3GmnaLUMJ8hSCb+eyGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a098fcae-7aaf-b5fc-79fe-acf9922e2cdb@suse.com>
Date: Thu, 9 Dec 2021 15:50:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] tools/libs/ctrl: Save errno only once in *PRINTF() and
 *ERROR()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: anthony.perard@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209134054.20757-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211209134054.20757-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af58e1cf-94b3-416a-b5fa-08d9bb2346fe
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494429FE5778295DB74B9E55B3709@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VUYq7SzOKt9MWhMbwSalr800vxc8nGu2ZtzBrwgU6dRqUmWpSy58a1j7lGTQd9ywKsP1IdjeYoTbbx4IRe5gUcWSXZHRoFgEUoBymJlLr9j4BUW4BaT3dluIEPqokuKCi3wY8eH3cDuNfERC0ImzYK8nToST3CGboneZrpEuuak6eFp1ZB8BJzZsyKfpSGLZ73ugGQZJmN58rQlsFGRvN9r0gv9B8jVbpeycwEPEp6x+ELlW+sU1owA1KA/LqmSbYGbg4C1zv5Wlfo9F5uHttBcp+v0CKUHtMvKyEg4tPeri4RxwioGm+6ilqnznco60tovLEHiV7HtuAhyxj+u7bUjIXAl7GL9EG4FPiFpbXCrv6eOXZNzLHH7NAHyhW9w5zi8FtqLIZs+Vd7Vvt/UomGURpcI+khelH4HiinOy89eGffP+eVs0TsWr6XrqA5xXSG/VLlWPJXIA48JiJWCvYQ+8wt3AK1sIAZHl8SusaCVspE7IGx7BoW4vVeHk2mOKtUtlzuW6mPYW6p17QTNaV0XiojvHTRUUXkMM/zSKFNH5bwuJbQjW8d8O7j0qab4HyexA7DugffnoyRIo+1sYG+IXwF7mJJ7FZQmjaKDm2lYeKfND/7R9lOt1uKMlQPH+HT/bpmHcqfDRJFz7XB3Ijo9e9gN+Za9O/VO45YL86bOjRLiCJQbUVdXgUISavqaiCnZY0WFXQnX5sz+7ZGOh0j0vkJ12v7inArxth2MwpNU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(2906002)(6486002)(31686004)(26005)(36756003)(8676002)(6862004)(31696002)(8936002)(37006003)(6636002)(316002)(16576012)(508600001)(5660300002)(2616005)(66946007)(66476007)(66556008)(86362001)(956004)(83380400001)(4326008)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXIzM0Nrckx0TEpsUk5jd3k3eTlHdUZMa3dYQkJZS1YvRTJGd1h6dklhdUxk?=
 =?utf-8?B?SldlZ2tDU1lVSmVEdXRhVXFhZTJ3azJlQXkzWFBrQm9MSmVjak9wR0NtOVZp?=
 =?utf-8?B?S2dZYUp4MEhScU5zbkRBenc3N1hWZ0Z2YnYwV2hmekgxNGZBREJHSDR2ZFVS?=
 =?utf-8?B?QjBkZG9uVGhqcmNEQ2xldmdSalBsdURyeGM1NmxDcUlLbGtPWGhWUFBhNWVI?=
 =?utf-8?B?T3BtM0d2TGpuUGQyWW03RkorQVgzaUI4TGNGV1UwdTQxS0RwdmMwams4Tmp4?=
 =?utf-8?B?bGc2R1lIMGJPSEU5aWxDaTZLREU2UkhHNUIvSUpWRENnRVJHT0M2WFNiWXM2?=
 =?utf-8?B?UU52SGY1MEVFNG1hZEFxWDFXRWc0UjlYZUhBUGZSTDViRHRJYlBQbGtwN2lN?=
 =?utf-8?B?VVN3YWxXekE3SDFud0thUWhzWWtzbUp2UTBuMkdoem5UVHdFUUQwcUovNWRa?=
 =?utf-8?B?b2Rtc1o3WEowN1BzY1pBMGJQdzB5cU9hakNzUTYzOFJESy83dmpldS8vZjZo?=
 =?utf-8?B?eHhJdWIxSmtFeU5jelR4aGxaQ3hSWksxL0YweDVjZWFjdUNBdHZGZG1TYzF6?=
 =?utf-8?B?L0ZZZWo5NnZWc240RjJxaTJwV0NJdWpTVFdac0ZNUXFOZ2ZEUlJKdk4zQ0xT?=
 =?utf-8?B?Q3Nnd0QraVg0V1RSenNpS25aeWVsYmFVZDhxT013U1g1YnZQTXVLTDM3eFly?=
 =?utf-8?B?Z0p5UzFHSTVWb2xVMTllWm1SeU1TSUtqcktoUlFUNENkOWFVTGNhMExlSWtk?=
 =?utf-8?B?RHZmUWhQQmt4WmNUdTlsTUNzNGZidExvTHk1VnhBc3RFN2lCZ0pwbDBGeTd5?=
 =?utf-8?B?QzA3aTNhNkpLNFVZc1RKRm9TakxVTU14bi95R2dROEpMellaRTA2c1F1eWFS?=
 =?utf-8?B?YWNVY3BLaXRBWksyVzZJR0VOc1hhQWNrWkxzVW5FSWZLbDVQdFNiT3BRcXB5?=
 =?utf-8?B?WFN4bDlsbHFvdElSNEVaRXlNRGx4TGNwMTdhcDQwcENJNGVEZDJJdG9hTzFC?=
 =?utf-8?B?blpqNkdmb0M0eGJXVXNZODI0MmlKZnRqTEpkMEN0SExoVTRlTk0xUzh4bFRS?=
 =?utf-8?B?a1NEOXZYMFE2TmJFTnpTTm9uSWE1UXdrTmx2anVWYzJmTEt6L0pkRDFqbkxM?=
 =?utf-8?B?L2FwZFJPSEdCSWVZSE1Cb2Z4SWZBOVhWSllzZkFxTEZNUHlTV3lwUk5ISWRi?=
 =?utf-8?B?emIxKzVuMUVTTlRsZmErelQzbkdYRUViR3o0NmE4bE9QYXZHTzFzUFNENmxK?=
 =?utf-8?B?cm1wNFpQeHNZNkE4dWhWdmxvcUZBUU1JM2svaUtqUTk3K2tEN2QvR1lnZUd4?=
 =?utf-8?B?ZWJ3bG5oM2VOZExTdmhFY29iQ2xWRm1UajhOSktiVXJzeWZrRml6Z2Z3c3VS?=
 =?utf-8?B?dWRWWHh6d1Z4NDNvT2VxcjlOM24yRHo5THkyc3BMb3k4V0NpcDhLRUx5WU9z?=
 =?utf-8?B?bDdKMGlPa1RCTWtVWTBmYTJDTmplOXlYZjQvb1JKSCtZaS92TXRxY2F6Vy9Q?=
 =?utf-8?B?ZVk5dEJIT1Q4TDQzWjU5M0JUVFhNTzl3aktpQ0FJbEZZNm5EWTdOQVViWVJx?=
 =?utf-8?B?TldNaHRHRjJRZEFMOGNvMndib2F4TmpPQWNNc25PWDd3Rk9UWkJtcVFXa1Iy?=
 =?utf-8?B?eWVZMFo4TE5zbnNjNjBlSG1EbDUwNCt4V0xDNlhrd0JoRjg4U1YxdVUzY2tZ?=
 =?utf-8?B?WGVvZlNLd2FEWGZuM1lscHVNRUp6RUNZcVg2cC9rYXorOCtmTCs1WmI1b2ZI?=
 =?utf-8?B?ck12dDVwcVBsWm1walpLYUJOYXl6WHRsaUtISE11NHExSHI1aGNQQUw2YzIy?=
 =?utf-8?B?QUljSkwrcExzWXVLRHpTWXpMcFhIbHJZalA4MEtSVHkzVlRtcm1UTjNPQTNJ?=
 =?utf-8?B?M0xPeU9sNzBNWTVRWHdqNVVZZi8wVkRJMWEvWiszSGRneWxISEZCejdMb01l?=
 =?utf-8?B?bGwxYWFHM1pYb1RWQ3l5ZkpoNSttN0hSbWZKWmtaNzJJZy9Ra2F5OThISFZD?=
 =?utf-8?B?bEtVT014TTlVcVpWYlMxaHFqOCtXbTZTckorV1ZvaUoyV2JGa0VHY2pWTlZN?=
 =?utf-8?B?Y3c2Z0wwbmRBenZHMFpKNTlZcmo2WVVFSEdmYmV1Z1ZGUVA1aDVpUGhJaFYr?=
 =?utf-8?B?b1dicHRoMHM3czdGRk5SMkwwZTB1Q1ZHRjBVSnU5MlFKUzNJNVBFUGdBS2Yr?=
 =?utf-8?Q?dX1b0xGr26FSI5bEmu7BZ20=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af58e1cf-94b3-416a-b5fa-08d9bb2346fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:50:44.0112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amsV4YbgULhe6jszy29cQr3EDj+6WubeXqdMgpIZ1uuj3r0y3a2e+ym8oKQBOT3fJ1cCs93w4IuVWX+PtGOJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 09.12.2021 14:40, Juergen Gross wrote:
> All *PRINTF() and *ERROR() macros are based on xc_reportv() which is
> saving and restoring errno in order to not modify it. There is no need
> to save and restore in those macros, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> V2:
> - style corrections (Jan Beulich)

Thanks. Sadly there still is ...

> --- a/tools/libs/ctrl/xc_private.h
> +++ b/tools/libs/ctrl/xc_private.h
> @@ -122,28 +122,18 @@ void xc_report_progress_step(xc_interface *xch,
>  
>  /* anamorphic macros:  struct xc_interface *xch  must be in scope */
>  
> -#define IPRINTF(_f, _a...)  do { int IPRINTF_errno = errno; \
> -        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a); \
> -        errno = IPRINTF_errno; \
> -        } while (0)
> -#define DPRINTF(_f, _a...) do { int DPRINTF_errno = errno; \
> -        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a); \
> -        errno = DPRINTF_errno; \
> -        } while (0)
> -#define DBGPRINTF(_f, _a...)  do { int DBGPRINTF_errno = errno; \
> -        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a); \
> -        errno = DBGPRINTF_errno; \
> -        } while (0)
> -
> -#define ERROR(_m, _a...)  do { int ERROR_errno = errno; \
> -        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a ); \
> -        errno = ERROR_errno; \
> -        } while (0)
> -#define PERROR(_m, _a...) do { int PERROR_errno = errno; \
> -        xc_report_error(xch,XC_INTERNAL_ERROR,_m " (%d = %s)", \
> -        ## _a , errno, xc_strerror(xch, errno)); \
> -        errno = PERROR_errno; \
> -        } while (0)
> +#define IPRINTF(_f, _a...) \
> +        xc_report(xch, xch->error_handler, XTL_INFO, 0, _f, ## _a)
> +#define DPRINTF(_f, _a...) \
> +        xc_report(xch, xch->error_handler, XTL_DETAIL, 0, _f, ## _a)
> +#define DBGPRINTF(_f, _a...) \
> +        xc_report(xch, xch->error_handler, XTL_DEBUG, 0, _f, ## _a)
> +
> +#define ERROR(_m, _a...) \
> +        xc_report_error(xch, XC_INTERNAL_ERROR, _m, ## _a )

... a stray blank ahead of the closing parenthesis here; I'm sure this
can be taken care of while committing.

Jan

> +#define PERROR(_m, _a...) \
> +        xc_report_error(xch, XC_INTERNAL_ERROR, _m " (%d = %s)", \
> +                        ## _a, errno, xc_strerror(xch, errno))
>  
>  /*
>   * HYPERCALL ARGUMENT BUFFERS
> 


