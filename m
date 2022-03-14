Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7414D7F43
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 10:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290089.491987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThQq-0007K5-Id; Mon, 14 Mar 2022 09:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290089.491987; Mon, 14 Mar 2022 09:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThQq-0007Gz-Ew; Mon, 14 Mar 2022 09:56:04 +0000
Received: by outflank-mailman (input) for mailman id 290089;
 Mon, 14 Mar 2022 09:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nThQo-0007Gt-CZ
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 09:56:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efafb49e-a37c-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 10:55:53 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-mJWOeCTVORqKsdkJt_56OA-2; Mon, 14 Mar 2022 10:55:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3928.eurprd04.prod.outlook.com (2603:10a6:209:1a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 09:55:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 09:55:57 +0000
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
X-Inumbo-ID: efafb49e-a37c-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647251760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo+xw9p77kynjZIIpg66+KaL6SeUbRKQioFIpIOtbI0=;
	b=IAVNIBwyk/CSzAUL1/mX6QADQ/uZS0k5vmfVOespYnBmIvlXX3RT5zKxFnV7l+SgXhJgm7
	v1LK/FtNjzHxasa0u55zXvBFA0CsVEIGa1NjATF1jO1VjdC+ogi6iS7FnpmZPLoKk954G7
	a3u2C1QbYxQ4KiNjB7m5f5q7g9fFSeM=
X-MC-Unique: mJWOeCTVORqKsdkJt_56OA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeUe5RqvrUZxiAI8AyTokEroYff5F3N2YOGBikyp+YIik5VujPEiAQ3//NUVEoP8NpDQpf2fyeM7PEdow00lOMTAcoL/wpLtkvlPZBo8lK1aKx7tMmkhBVIF28hXhpdY2r8jGNX8RjeiwUDBt2TWcmUHYilivBEx7eVG4S2JB/0R1QUcuD5pQQbUZYlPxkSu2M/+oJVAtnRcestoqdZvUZ0621pjkC5pXA5lCEr1N5Y1Si/nClqrLZWEbSMejbwcgaRSQ0/i7kqb7O2OMbfBu4A0jx6D13pDyCVhjlI1s9iX+gA7H44QibdPeEmt11RuOXWKe6JwZaLdGgBW6utdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo+xw9p77kynjZIIpg66+KaL6SeUbRKQioFIpIOtbI0=;
 b=LwIJ/oCgzehoTZyAXyBZNH6GWQP2VH1FfI3jPPk0iRtRQl7oVAFWxvpMOl8PV8oplgtYPo3Qdfltm0uION5sogwzlAvp/VqGWJJur+fP8b9kwoYqV7jmuXA7kni+VPDxUWI3AXpuyvHESz/rJk+iPZCAPBC2Riep5jQbCGuqOAuFjp8ZXn1DATlPz3Ty8zL2buOR6uPidx1fbTgcIgErQ1w+lYIJxNrfkfrWNRP7qKMjFFE1wsE9KPpqpYXM7hPVm+pcvwUP7N2nIow4TDKVwFCHXV3jYK7e6F4e4VNqz+JZXO2RGBbrS5rjTOOX0SxHjeFyMjid2XYvsRezOa7V6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
Date: Mon, 14 Mar 2022 10:55:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <20220228112224.18942-1-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220228112224.18942-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5016832-8162-4be9-e119-08da05a0d5f4
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3928:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3928185C83CAB26121A1EFB7B30F9@AM6PR0402MB3928.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cVQY2nWvgDB8Yj8RLLUF92UXQ/dvAculVgxfUdE6JxXFaDUawwQwEJQKBTk7qH0Xr+DV8rhZ/4rdt8Gkb1tCOQ/kcE5iGhkve661a1Y0W8sOF4wKFIknwtwHOCYnPIRGYNx/zZZ85KLSFZrmWESs66KXXu/DuET4XyUZSht5NRTiCGhir7xxCO2nzR7o3bAVMupa1198fuh8mAObVLqsm8X9hqAYoKVMm3D5JgpUJ22Ks5N9r7vNFP6Sk8uTxfOCbZDvjCVtgm2lLP4JYJI249XV5jfCXoavxm6WUPtnj5dlJIW33FDsIkIda+Vm4BPUUg40d14bkBtDV/7oq6ft8dyPAsnUk1cFGay/NrCr5rN+NAsd2JTP7cPaRBK7hcsr9yIeAeUtzAXSeSQQlCtE6QL3UtFWhBfSxScbV06HYBvjtg1VsdcfwxAx57ilUqqH/DXi4iKLl/HVF+CRBr9Zppux+p18tuI6zBQwGg7xm961ND+PyyHeg3jXO9oOBcSwBvJ4mbhvaraV+mJlYwsBooBXzETEf2BBPCjwlYVIs2dWfwGSabPHOnfXWhXuBLT56glemlQ4Vs9/btpolaNRWl4tztheE5S6T50LvKyJS44GqlgUkj3HsAAzc22n+1YdjRTmFd9RZUNGckA09s6N/8kLJ0mYFIt56yuHNVDXFynyra9rZzE/RqtFCql+SSogoZKL7JfhOOm0zagiDytpFLM9+V4k9iNuuiwrVdLZzDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(2616005)(6512007)(86362001)(2906002)(6506007)(31696002)(53546011)(6486002)(38100700002)(508600001)(6862004)(4326008)(8676002)(66946007)(66556008)(66476007)(5660300002)(36756003)(8936002)(6636002)(37006003)(83380400001)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmpEUjdhMkR3bmEwNDFSOTJ5T2NrT05sZmdkTTdpaG9Od0MyS3UzSEdHMFlu?=
 =?utf-8?B?U3NuQm4vYTVBeDRjV2ltK3dHcGhHdDNTUnI3ZlhkM0N4V29uWXdacUdWM3M0?=
 =?utf-8?B?RFhkR25QVjFLQ3VnUlNIRkJlK2lBaFhDcmxNblliVENMWCtUTEtJZTBHWjhw?=
 =?utf-8?B?SEtFMFZzSERZeTdWOUVhSXh6RVpvOFRhVlBnbC9rald0VDlxWk5xZko5RXow?=
 =?utf-8?B?dkdqUERRcFpJaDlUL3F3NlJWbW5vUHRkcjRBTlB0OW5EY01wT0NSdGlGenc2?=
 =?utf-8?B?Uldtd3YvQmM0enQxaFg3ODNaUzVUMllMaWJod3Rpdk5PME9sL0RkL2o1dVR4?=
 =?utf-8?B?WVlzWU1EWU9PWHdPLzNQaU1HM0JWMDYxNTdLRkNLZjk3a1lFeWxSVjMvbzNJ?=
 =?utf-8?B?THpXQ0poaGY0WWszaHZwNWd5WnlTTjcrSFd3QjJBanUyTnNVVzEzbmN2RmtH?=
 =?utf-8?B?REJqc3JKaVlqdFZJOGJLdVRic1VzU3dPYjFzc3B1QmFjTEdOWW9RM2MxZlpO?=
 =?utf-8?B?OEQyS1FxQU5oVnowTTZLWDFILzErM0VLUnBOcDBzMExWa1c4RnVnWmJVVWNE?=
 =?utf-8?B?dDNYcGl5bHBJN01RUEdld21kZlljRWRqb0lnZExDT1BIZ09OTzZ6eUxRTFk5?=
 =?utf-8?B?WndrMkNoZlhpL292TVV5bmlsOGUwakpzdTBoZUtZdlFkdGI0NVZvRGpCV0Nl?=
 =?utf-8?B?STFhdUs4bEZYUGpxajdiMzRvbTNjWXA2VUJWZ0dLVS82bit5OXV2WkVKSGxm?=
 =?utf-8?B?MUtmWXg0RVhISVdKZXdYWEJSSStpdnFreHd2aElOZWM1ZEVLcjFYZ2VtQVNN?=
 =?utf-8?B?SzRyYW4rcEgydVg1QlpvQ2ZoK0x4SFl5VGdSY3NoZmt0Q2hSUUJQdWlQN3JE?=
 =?utf-8?B?UndPR0tWeHY5Uk1Wc2wzMEFoelNrSUY5MXhTUzkzMDdHQmdWRXNGZm4yWC9r?=
 =?utf-8?B?RjB4RVpHdzFETUtVYUVjMno5MjdkZ05OazZzYWlUcW1ZY1AvMFJmc2NrZjRF?=
 =?utf-8?B?ZHlmQkt2N2xGbVBLUHlYVllnY1BDbldkeG5xTkdOc0ttTkkyS3NBL3UyL2RE?=
 =?utf-8?B?a3B1STB2TVNHZjg5U3VEdW56K2xudGcvZzEzVlJ0U1dVa1grT0VmdXY0VHl6?=
 =?utf-8?B?djc5Tlc5ellxcWdzREh0Q3JWcHMvZjNjbW5nRk1saFNUQ2JMQVdNbTRKc2w4?=
 =?utf-8?B?STdxLzRnM2VnNUppVWdhN0JDUXErQ0daWlZTL0ZIMGJ4ZTc5TjFGRmoxcVVi?=
 =?utf-8?B?Q2lJNExqUkEzc0J5VHVCaUpGcktrMmkwalhXc0o2dDloTHhkZE12Q0R2VVF4?=
 =?utf-8?B?WlRMb3VUR3V1MUVTSDFyK1JVdnhrMDlUN1Zybi9jQlpxNHdTQXVBRWFwVXBm?=
 =?utf-8?B?NkRUdTdnY1MwT3RFc1NnazZRbVpjdTU2bW03VHVyK1hLbHdYU3duNjRyN1lz?=
 =?utf-8?B?K2hrVUVFODFqZDZ5eklXN1lYLzE2cyt4V2RQZWFsN2pUdmU4TjAwakEvNzhz?=
 =?utf-8?B?ell1WFNhMy9jMnZySWFmeE9wWjNFdTlTQXRYSWlzcHlEV3FMTE5NeWlYUTFx?=
 =?utf-8?B?czBEWUt1dWhnaU5EY1FEbHA3bEpocXRTb1lWUWNWOXc2aFdScGt4ZUNqcmJZ?=
 =?utf-8?B?S3ZVUjdsNHVUSFlnWURKQ1NWeU9sZzFDUVhpc2piYnFtb05ZSnVBUmN2RGRL?=
 =?utf-8?B?NWoxak9kTERKcXRDSG83SktFVHVSdHpFdVZjTlRpbE14a1IvYk1nR25iT0NP?=
 =?utf-8?B?TmFJb0pvU283bG1JSlBmU3ZwR0VMNk5ITWoxOUYrUnk0MnNFM0JSNEtheHpz?=
 =?utf-8?B?VGEvcEtrd0JKZVEyZC9JdGx4aVJReko4dnl1SmY4eUVVUldKU05OM0VqalVo?=
 =?utf-8?B?Z0JCTFNBcGNyVFQ3WWRrQUppZ3ZweTJ3blM0eXUzd3pJU3lsaTZEdXg0QVpT?=
 =?utf-8?Q?mwVM8cZQ3bACN2bMTODUgyMCt0doqTOo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5016832-8162-4be9-e119-08da05a0d5f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 09:55:57.1035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEEhGYwDg2jBiFcc2E9G9ULGVExUc2GvxN2LcWJWfIeVff3F/Uo62BEFS0BaoD1P/UT8i+mWAne12NsWbPVdqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3928

On 28.02.2022 12:22, Juergen Gross wrote:
> --- a/xen/include/public/io/vscsiif.h
> +++ b/xen/include/public/io/vscsiif.h
> @@ -315,6 +315,33 @@ struct vscsiif_response {
>  };
>  typedef struct vscsiif_response vscsiif_response_t;
>  
> +/* SCSI I/O status from vscsiif_response->rslt */
> +#define XEN_VSCSIIF_RSLT_STATUS(x)  (x & 0x00ff)

No #define-s for individual values for this? I see the backend use
e.g. SUCCESS and FAILED, wherever these come from ...

Also please parenthesize x here and ...

> +/* Host I/O status from vscsiif_response->rslt */
> +#define XEN_VSCSIIF_RSLT_HOST(x)    ((unsigned)x >> 16)

... here.

You cast to unsigned here, but rslt is a signed field. Is it really
the entire upper 16 bits that are the host I/O status?

> +#define XEN_VSCSIIF_RSLT_HOST_OK         0
> +#define XEN_VSCSIIF_RSLT_HOST_NO_CONN    1 /* Couldn't connect before timeout */
> +#define XEN_VSCSIIF_RSLT_HOST_BUS_BUSY   2 /* BUS busy through timeout */
> +#define XEN_VSCSIIF_RSLT_HOST_TIME_OUT   3 /* TIMED OUT for other reason */
> +#define XEN_VSCSIIF_RSLT_HOST_BAD_TARG   4 /* BAD target */

Are the all-upper-case words really in need of mirroring this
aspect from Linux? To me it gives the impression of this being
acronyms of some sort at the first glance.

> +#define XEN_VSCSIIF_RSLT_HOST_ABORT      5 /* Abort for some other reason */
> +#define XEN_VSCSIIF_RSLT_HOST_PARITY     6 /* Parity error */
> +#define XEN_VSCSIIF_RSLT_HOST_ERROR      7 /* Internal error */
> +#define XEN_VSCSIIF_RSLT_HOST_RESET      8 /* Reset by somebody */
> +#define XEN_VSCSIIF_RSLT_HOST_BAD_INTR   9 /* Unexpected interrupt */
> +#define XEN_VSCSIIF_RSLT_HOST_PASSTHR   10 /* Force command past mid-layer */
> +#define XEN_VSCSIIF_RSLT_HOST_SOFT_ERR  11 /* Retry requested */
> +#define XEN_VSCSIIF_RSLT_HOST_IMM_RETR  12 /* Hidden retry requested */
> +#define XEN_VSCSIIF_RSLT_HOST_REQUEUE   13 /* Requeue command requested */
> +#define XEN_VSCSIIF_RSLT_HOST_DISRUPT   14 /* Transport error disrupted I/O */
> +#define XEN_VSCSIIF_RSLT_HOST_FAILFAST  15 /* Transport class fastfailed */
> +#define XEN_VSCSIIF_RSLT_HOST_TARG_FAIL 16 /* Permanent target failure */
> +#define XEN_VSCSIIF_RSLT_HOST_NEX_FAIL  17 /* Permanent nexus failure on path */
> +#define XEN_VSCSIIF_RSLT_HOST_NOMEM     18 /* Space allocation failed */
> +#define XEN_VSCSIIF_RSLT_HOST_MED_ERR   19 /* Medium error */
> +#define XEN_VSCSIIF_RSLT_HOST_MARGINAL  20 /* Transport marginal errors */

Some of the name shortening that you did, comparing with the
Linux names, has gone a little too far for my taste. But you're
the maintainer ...

Jan


