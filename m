Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187A66C590
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478826.742250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHS0T-00020U-Gq; Mon, 16 Jan 2023 16:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478826.742250; Mon, 16 Jan 2023 16:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHS0T-0001yi-Dx; Mon, 16 Jan 2023 16:06:45 +0000
Received: by outflank-mailman (input) for mailman id 478826;
 Mon, 16 Jan 2023 16:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHS0S-0001ya-05
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:06:44 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c29f80ba-95b7-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 17:06:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 16:06:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:06:36 +0000
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
X-Inumbo-ID: c29f80ba-95b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEJr5CPaLfegeOmSWOAwY9BRU6NTliAgupipIVgJFJjQ6wJCwMIH3AQmciIzOWbDkVZd454RyW5yGPEG2GTF0Ba2ybGhWBy8MRb5xS28EK/XaZOSVpinHD5hjMBHFiHvGOVvyXUqhj26/wgnhNQoz4ZKPW4TfGC8FcBIzG4bh/PPOTgipN466NJaNfT2fhMazWQyPCqyJvCOiketAMWI3ucUMeKM+74BbkqYO9FXZJIYoVMYgdGMSnRO0GSXv6q/WcYv1dEjjMa7IoEt3Q1rel5A5FNZbpirbKGsJAsYFqAKYGggnc2zqcdeKqa3Wkq0wbPMgMVzN4pgGtMWm3cvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tPKXKMoi99fM2iPt+23QD/yD2JohopK3GU6RwAmZXY=;
 b=bjyEaN+DYSDwofY6IzZQcQjvrc4CZgPuXMP8zbdACfAX5Azn9I1E5AUE3Nv/Cr6OAM6UJtW1Aef3L3k/y9rePf2F7NO2QafEzE8ROE4spUy9HNDKp6V/7AL+E2p1Fm0NvdGyQCCxRir/M3Fv6fRrs+IUYxGHUXpvDjBPKuLqKEcPqKmvHQAPxpeaAQ0a/mhzL2/fOYC1qnpn8iwyMKqbv54zBMLMZj1svsVPE45PP6/H35AawQrOhK7mBxvx8wSdo9hM+O26enKA06N2WaAAOt9xIyzlUg9azjdSiZaoq+QWL+bpuuVG06IqmksQFKmL6CMVHUQfigCBff/ctHl/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tPKXKMoi99fM2iPt+23QD/yD2JohopK3GU6RwAmZXY=;
 b=1VEAvsqMQo5AFkgXE1sutDPEvFiD2Iip8NHnqrr6hC+ULDEwvvCZcTlVNWNeyPYYbqPBsVmOvOlCSX3AzkAMhdMP+PdC6thQC3p4ZGjPeGOgsz6dyaQdSj6Ihcu3qGut7uWWcql0uxhwQGJnIvJRocxQiKRehFRBu7thVh2txE8zV7PMzQG4iCnY71DZUpKJXbyeRbnav6X5eMlWYiz670EYwhMuqPXIFrQprpOM8O8OTMsjJ6IFmn9X05Fouj7/Ya0zPU/JN2dMUQ2fD5zA3vZ+PHdeMTNjTIOYHj9SYydL2+z5ZAo/Vv9V1lCezI0imjKeJksoDeaqKZg8nMLGZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ebe5337-f84e-12a1-e8a0-92832100946d@suse.com>
Date: Mon, 16 Jan 2023 17:06:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113230835.29356-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 8702ab57-e1e8-4568-b167-08daf7dba4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FDh6EvXxWSZw2bqW92YwY5EIA5mVfq1Eyrr8XJWf7vLWRKHqldZt3YhraYjzgHGi5o/L8EY+lFlxRRhaT3rc15L0/hhc8TMyV+xBshDcJbxAF+yshkRHws3Y1dsdr2Fu1tI4TOYz+/P5kaHglWfrFHY7HAn2woM5mcLAEadVq9r1DKvATQXPQieF980A8yRv1YFRkJTyS0EBKT2RStcUf391sHrv2FzGRC4LNx9qL/MhNVhTpMdNq9Upy5RyJhCzBqqaD729kBqdu2mbKcWPGTqqBZc96WN8GFnBLKawQDzEqke+SmworQwHsGzRx1VwMysvQmTzs5IAHtaG7HsOT63nJ5CnMGmpz1muKJw6MLZDizoUCYIxpkvRe5uLG3Qsv1Ehm2CIVW50oPVMPatI7MGSfFuYU+m/5F8FqVIWojOFXaCxqqOtGcdkJUwCtq3XngOxx63CTqpExixEMGTsDblXILM2iiviyw9K3IhVbUeK/Hj+Ur/rjlUmb9Ujk9LTVmxLIlD3/678F0o5jLaVPjGLcd+Cavo807hW4BbbwRrRC3+g9uOiCRtelzrH2QfJW8ntHrtVrEhl18pcXk/T6yszkmZ+oYn0O/pAWI8VRU4Yurhkc5HD/t3xVrP1sY4QbgTUXsfvUvFyzfpV3TnZO7zUj2uSlDOq4doXL/BPU1WfCe6UtyZuMcJho/XP2BGEAHcVdsVRBY84F7QXwQQOhZZnpuchZjUO6TBS0/5F1xA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(53546011)(186003)(8676002)(66946007)(478600001)(66476007)(66556008)(6486002)(6512007)(6506007)(26005)(4326008)(2906002)(8936002)(83380400001)(5660300002)(41300700001)(38100700002)(2616005)(36756003)(86362001)(31696002)(31686004)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXdocXdlUVRya1YwbXNNU1F1Um03TGpsRU5lMTUxY2VXVFB4dENWZXM3NTBl?=
 =?utf-8?B?K1JXL3p4aENhRnQzeS8raC9za2QvMCtMS3VVTmR1WUpBdEFZY0ZNLzhodWtl?=
 =?utf-8?B?Z3MvUXIvSDhNZU9BM1hRdVF1dU1PTXduZTJBTHVDcjZCZ2ZWM3ZvSzdpcXlE?=
 =?utf-8?B?enVKUzRBZm53L3hwYjc3S0xoaVEyZm83ZTFTanNqb0hlelFyNEg2S3lVek1i?=
 =?utf-8?B?YVByYk1GOHlocXhmVFQxdXJYOTZtUVA1RGFKbFBTY1NLTVMvTTRuOFdRQkhH?=
 =?utf-8?B?RC9RQ3Avb2dqcGJWeUZaMGM4SmQrbmVsMzRyL2ZyRFVMRmVXMC8zSWwxQ0ph?=
 =?utf-8?B?N1Z1bXhzQTBEeittVW9NbmQyd1FOSHdiR09wbWUzRCtQbk1xc3ZSUWlqbGV1?=
 =?utf-8?B?ckVZejN3OHZIMXdHZisxV0VhMzdqbWdVZkl0cXZZekV1MUNNcWpsSDNHZGxt?=
 =?utf-8?B?WVBxUUQzSWxrM2RPVXdpWDVjakM5UUJoTEErUERvT2dCMmZ6Q1gxay9JUWd3?=
 =?utf-8?B?YUI0QnNBUjJJa3NRUzR6aC9OKytoWlhlRUtlZVlTck12V3lPeEFpUkdiNlM2?=
 =?utf-8?B?OHowVGhlaDY0bWRDY1lmZU5Bb3FWQ1BCVTUyUjFSMFdZYi9YajRVV01vdEQv?=
 =?utf-8?B?YnJDUU4xdGZyQ05zMHVSTmFscGUwc3ZqbGVqK3hkczhtZEIyWnlKWlEwQm42?=
 =?utf-8?B?dmkrTUFWdVgybWl5WkI5d1hQRldYaUhFTlIvcWNNNmsrdStIRmhKOXNGSE12?=
 =?utf-8?B?cFgzcXhRVFk5VGNMTTRKMmw2TWg3Nm1McUh6NzYwQ1U4anRLbzlIbnRaZW1M?=
 =?utf-8?B?eU1WOUJ0ckh3ZEo5OEFZSlhqd3lLRGhGcDRQb2poS29IbGEzVSt3VngrTXJE?=
 =?utf-8?B?dWxCT0Y0dE45UzlQL1U4c3JmdUtKUFhjOUhHMXcvMkV2bW0zeXNOWWVxRndH?=
 =?utf-8?B?bjJHa0U0aDVXcTNVRmQ3UitKOVJHaEJmcXRKd3JoeWxiRzcwWXFPV1IwcXNO?=
 =?utf-8?B?dm5CNms1aTlEbEtBVExSMEdILzhpTDhmRTBpNW16TEZ6cGl1QVJVOEd0aXFB?=
 =?utf-8?B?bTIrUzhyVERiN0h4WTNFY2xGY0ZOVzdIZE9OQit5b3ducE8rRDg1VWJPVkxo?=
 =?utf-8?B?MXg1RmZ0U1gwSS9DTDc0NmNpaHhObVpjenpCdUo0Q05WYjVTeTlDMG5xZTJF?=
 =?utf-8?B?QUI1N21jekVudGpPSUl2VTN5dlpkT3NaaTc3TUhTSVhTcEQ2UTdCY0pDZkJl?=
 =?utf-8?B?alYycjBueUU5L3dMUEJwTHgzdkVKR0R3Z1cvQ1NxTnRha1BoOGVSa096ZWNn?=
 =?utf-8?B?RVpPN1U4SkhhdHVuMEg3c3NUNVBpWXlIYkpPZ3hVcDk3UlZtRFRkYmRxL1dB?=
 =?utf-8?B?Qk1sdVhMcXFVTVhjWGZteGRxMC92YW1nenJFaVVNWkZMWk00cWJDSmM5ako2?=
 =?utf-8?B?bFUvQ0J5cnU3K2Y0dnltcXJ3akdaV2JrV2VhWVlHYi9OaGpBQ0hXV0NNdkZq?=
 =?utf-8?B?emNzTWhHVjA1Tms5eTRkMWhYejJKbTVZNmZFZkRDbTQ2TzV1dnF5U2lSTGZW?=
 =?utf-8?B?RTBJSlR1OGtONnhvWHdlWjlMMmZEQ0pzemhIY3djbDA4ZXNmTUVsUUdtcVRi?=
 =?utf-8?B?dmpRWGZaWDkrOGxCTVhwZCtIWjM1bmk3Y2dsdzY2cjdtczh4bFhyZVNFWEg0?=
 =?utf-8?B?K05yQlpYelEwZEtNajZqczlqRG5ybFRCemhxS3ZxRnZoU2FHSzRheGo0Q3NG?=
 =?utf-8?B?YWxNblN2N1EzeWtVd1dMWTNoMnNCL3RrL0QxZWtlekJjMVhrcVZ0NW93T2hZ?=
 =?utf-8?B?dzZ4ZHVIMlhkOHpFbVErTlZ0eWtWY2FtNE1OenR0bEdrTDhJUTJLWmc0V2x0?=
 =?utf-8?B?WFFqcFk0L05zUEdnM2lVcWNaL2FvSFlINlNKTDQ4T3ptYWluK0lpNVl0NmpC?=
 =?utf-8?B?S01tQkNKRGFpbEUxdVFZMTB4T3ZLK2RKV2ZPQW9TOHc0MWpaS0pPTGlseVdi?=
 =?utf-8?B?cHJGdmNLdkVDd1ZhZ043a1ZuVlBxN0tTcUowemIzZDMvNlYwS1FsMWNoZE1n?=
 =?utf-8?B?UkhVS0tzZEhIYkZ0VVNxKzluZHk5MTBNekxCYmgxZUlYMmxqRWx2Q1FNbGpt?=
 =?utf-8?Q?840HDxVPxyqqU/1icAQA9q6aV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8702ab57-e1e8-4568-b167-08daf7dba4e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:06:36.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sW+LIIsKXsawwHkcIE95zElzhQ89UtbqHECQ3cIo7MitTJmM4IERY2RuOdSLd9eqga60gOUzrZVxuXVqOxU2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466

On 14.01.2023 00:08, Andrew Cooper wrote:
> @@ -470,6 +471,59 @@ static int __init cf_check param_init(void)
>  __initcall(param_init);
>  #endif
>  
> +static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    struct xen_varbuf user_str;
> +    const char *str = NULL;

This takes away from the compiler any chance of reporting "str" as
uninitialized (particularly by future changes; the way it's here is
obvious enough of course). The NULL also doesn't buy you anything, as
...

> +    size_t sz;
> +
> +    switch ( cmd )
> +    {
> +    case XENVER_extraversion2:
> +        str = xen_extra_version();
> +        break;
> +
> +    case XENVER_changeset2:
> +        str = xen_changeset();
> +        break;
> +
> +    case XENVER_commandline2:
> +        str = saved_cmdline;
> +        break;
> +
> +    case XENVER_capabilities2:
> +        str = xen_cap_info;
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        return -ENODATA;
> +    }
> +
> +    sz = strlen(str);

... we will still crash here in case the variable doesn't get any other
value assigned.

> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
> +        return -E2BIG;
> +
> +    if ( guest_handle_is_null(arg) ) /* Length request */
> +        return sz;
> +
> +    if ( copy_from_guest(&user_str, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( user_str.len == 0 )
> +        return -EINVAL;
> +
> +    if ( sz > user_str.len )
> +        return -ENOBUFS;

The earlier of these last two checks makes it that one can't successfully
call this function when the size query has returned 0.

> --- a/xen/include/public/version.h
> +++ b/xen/include/public/version.h
> @@ -19,12 +19,20 @@
>  /* arg == NULL; returns major:minor (16:16). */
>  #define XENVER_version      0
>  
> -/* arg == xen_extraversion_t. */
> +/*
> + * arg == xen_extraversion_t.
> + *
> + * This API/ABI is broken.  Use XENVER_extraversion2 instead.

Personally I don't like these "broken" that you're adding. These interfaces
simply are the way they are, with certain limitations. We also won't be
able to remove the old variants (except in the new ABI), so telling people
to avoid them provides us about nothing.

Jan

