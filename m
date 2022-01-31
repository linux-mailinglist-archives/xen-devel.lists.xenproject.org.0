Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBF4A4001
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262910.455367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETnE-0004o9-I3; Mon, 31 Jan 2022 10:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262910.455367; Mon, 31 Jan 2022 10:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETnE-0004kl-DH; Mon, 31 Jan 2022 10:20:16 +0000
Received: by outflank-mailman (input) for mailman id 262910;
 Mon, 31 Jan 2022 10:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nETnD-0004kZ-5y
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:20:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60ca556f-827f-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 11:20:13 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-HaemqptvMPSjPkFU05fyRg-1; Mon, 31 Jan 2022 11:20:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6831.eurprd04.prod.outlook.com (2603:10a6:803:135::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:20:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:20:11 +0000
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
X-Inumbo-ID: 60ca556f-827f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643624413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvrJp6ijHcBVRTAQYTzW44VhUrzcp4P0tZMksR7l+KI=;
	b=BAmAoquwNieWUuCvO6nm6ImNAatXM+Rypzix5bC4+RgjrRwsbB0LbU7vDvY1J8sZ4zwQZ0
	6UixDO8iIcqbX9l8X7bzOugnlKVAAnzIlFW95K35PfXmT9UFJmhGES/Rxb6DkUCkXOcWfh
	3Y56Dbqw6j/ka7Y6GlsEcXpfIzvDkFQ=
X-MC-Unique: HaemqptvMPSjPkFU05fyRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQZgXDHyrDXTjxLH2LfaSiWX95FmYUxIECYGadkgsNyC0xZ7VGsTcamK4YRBiKiIEKssLwD+dFE3eIAzYbK/2zsUuvB/P98WrWSlkwPKXyB4OxOJr8wlcpGe/ScEJcVmr2GrGZzY/aFgwE9Oz5GsS6vVM7XIAKM1AYRI9szh2tlhB6SJVO9L3mBfH4QjvzIwCD3JLI8Y11AT4LwWsKznwMTKRuZJWCL2ZrUaN6hMEfbVgvaVYr9LFmFA8xYBfj31kQJBUNGUy8Z7uqJvPNVLGtFJNE8pjiwDE1U2gVOWFAo9IH33b+K6QOX7R1AAGqgtBUX2EV4AtL8YYLA8MSE9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvrJp6ijHcBVRTAQYTzW44VhUrzcp4P0tZMksR7l+KI=;
 b=H4SM0OtHWGSswjwqUJBjP7UvuE4akXSHCKDe3d0bawOjQwCqIkHWOheLdDVzW2Er2vcKNiCZz/EotAR0Az6PnWwZH179VY0lhazfkZKg1U3XLt0h7nyO7mJp/rOSIZFOJZIGveg6vD8dxDrcuJpZi5j48xo+tWdXAwsCRNInJAOp90CQ2XYQJks7lqbJShyWq334w3Ez254+18rm/Olgdujpiv+MeRNBzT7CgZaqB2BAR3yo2QzqX+X/HZ9r0nPWLRDPj2ULLUxqxaohMV2QEJ7dMa8Vv3Z3Uayic+IDdRo07qGfI37ER44qOgaS3pY5XTP4ZLk3i8hTm2MKZQnDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18239ffb-058b-8790-be3e-0951d2d6ae6c@suse.com>
Date: Mon, 31 Jan 2022 11:20:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/9] x86/spec-ctrl: Record the last write to
 MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a2340d5-cbf5-4f39-27c4-08d9e4a343ae
X-MS-TrafficTypeDiagnostic: VI1PR04MB6831:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68315495CD5E8B94FA40B25EB3259@VI1PR04MB6831.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n+lNNPFc2HUGV4rgwKQzxSArKuj5eFG1cTubmndYfcjjIIdhDZVfj06Jh1pjSldEN13fn1nRHJW8DCfE9DuGvdhnlmkAq6l76b/Dz0/6IEj7nHEKh3+Togzu7fhBPh7ETQmsaYaESYz55elgKDtGzhVDj4Y4g0C9qyxuWDJJxG0+u5ffVPjgF6xrPRBdGZ9R1Hfqc3ShG8i7dnH8jx0ecd8t3ybwhEPCBBS9NIgFReNHvtZVRxREg3IkeFJrKBHZQJ1GfD1+wcnPOG+keNYelY41vLjLSDeRAgWuEIN6w5pnvFPq43Jr+RP0pT/W3+MeYolWMnrVeL8B6BGYRmLLZeMTvPPVCMKKJtZ/v47/Skvsn7QzTcFsWMzXF/wy32p+AhnNX5dGCzm30L7rbcop1vmNoIuWD3k//mhA5JiEeuYF7mLGRgIrGmbV5F74hBolGuZQyFDDp36LaFjpAaWU6hBbtTTnE/kNLJa5lccrZXHxa54RyHNsYRDEw/+5/N2ZhndBEq/0/CDqoxqgc6Ma18AsoXqNYHT6+dLH0rutntRSJ25Y4ZNlhxZnPVhtjxtYvRWl5Vyt0m35d1T+/52I6M6Z8XTootcQlUu/2e2jLdRvxPuvyGaRuLG2E/5ils2YTJEn5SODak3QTb+sB+VvJksiE2q4v/phYKanH6TKqnMpi1VQz7Xj0tjKi0/s9t2/DZG1pw0xVF+B3GCWS745HEjVD+wRvlP4NqY9J+ljfuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6512007)(53546011)(66476007)(66946007)(66556008)(6506007)(4326008)(8936002)(8676002)(38100700002)(86362001)(31696002)(2906002)(26005)(186003)(36756003)(6916009)(316002)(31686004)(6486002)(54906003)(508600001)(2616005)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJKdHJsbFJhOThrb25Rcnh1ekwzNXN3dnpKWDRhY1Z3RlN0Qm56aUdtWmlq?=
 =?utf-8?B?bzM0V0ZNbS8zZkVLTE9PcC8yQkdYQjNyTlhGUEJIcUU2eTZDYlhPM1cyck8w?=
 =?utf-8?B?bVpOL3JBcjZpWEVhZ1pucEVvaTNQSHFob0NuRWh2V0tCMlNwRzBEYjNQRFE2?=
 =?utf-8?B?cktXdWszbk00WlFGMDNUYi8xdEd6ZFlHKytMMWJBR3kvcHIwV2o5em5NSlZQ?=
 =?utf-8?B?MXp2c1VCWTh3dlVwNXBNd2x1Tys0eERja3BuN0xQeWZxN3FZaW9USDB2TXZt?=
 =?utf-8?B?ZWFWY1JZOUQ3N1FxR2hwa1h5NWxobFZBVVhvOEhLbzk3MlFtNzhvUWxINkxx?=
 =?utf-8?B?OG9TM01XNXYzYnV0TG5KN010UFp0U2I2cmdhRlh3T1VoMWFwc3F1WlBEVlk4?=
 =?utf-8?B?ZC9WT3dnR0JML0s0WnRrYStkY2F0RnF6bEYvSmJwWEJtUCtiZU9obmkvWmQx?=
 =?utf-8?B?QkVSTFJDdlZSc2E2eGdKeEJUSDg3RjhFc0dxbk5CMnM5anhZeUJ4ai9wSWMv?=
 =?utf-8?B?cG5ManBEVDN2WVVrQ0J5K3lndy9tSkNDUEliWFhleStDSmxJTWVoUld2K0FJ?=
 =?utf-8?B?dkM5cDAyc043MEJCZ3Q4VG5kZFJCZ0tOSXE3OU10SkVQWEU5TGJSbVp6UW9h?=
 =?utf-8?B?alUwRmV1WG1hRGpTY3RTd0w3d3FZSm04TlBqbjNCdndMbUVKZVJVbElQQW52?=
 =?utf-8?B?YVlyaXZ4Q2NZQ2xtODFCYkliNlZ4czN5YXhNVHJ0cEtuYlUvbVQ4OEtCdUFR?=
 =?utf-8?B?S0FmeUZOU1J1UGdPZjVpZkJML3ZkYWt4Rmxid2FYbVNRdlMremdiQW8vdVcy?=
 =?utf-8?B?cy83Q0t6QWlEZ1hOUURMWUFHcjRrUE5VSlNFQWtndi9Fb0U4dHFkVnlYcW5i?=
 =?utf-8?B?bjcyUXNHek01WEZSakM1T3VUZ0dVaitMRHRUUVdiMjQwK1h6ZUtDU2xVYVhU?=
 =?utf-8?B?RmMyc05PSy9jTHJmR3Avdk1UcnNwWTBZK2dteDM4THFLU1hoRUhTOStSVDJB?=
 =?utf-8?B?OHQvS3hMY0toNXZqUXpJSGpod3Q4UWp0Zm9RZU03em5LMXJGeEhCUXpzckNs?=
 =?utf-8?B?cGx2dzNqYWMwU1o4MWxjemwrUm40MFk1aHl0SDg4OGtRSWdVNUdrMFh0Sndy?=
 =?utf-8?B?dzlWclFqM2g4N2ZFeHY5dll5QXU0THBGZ2l3Y2ZGVlZ6d0hPUWp1YjdUNDZO?=
 =?utf-8?B?UHIvVTNVcnI2L3plamgvaURwZjB6dnZqaDZXalptUjNJc1M4aEFsSmlUZGl0?=
 =?utf-8?B?dmFNeElBdnFWbkYvMTJGdGszdndka3MyS1dLVnQxQk9NSnd0V0NBNGFPQ0Fw?=
 =?utf-8?B?bEhYcmZGYmtjcEpjMmhsVkNsRHlRNW9va3BkbnFsbW1lRzdkQTc1YXNjby9r?=
 =?utf-8?B?UzNla0IrdUNUSUFWQ3U1QUIzN1ZzbW4zRUNBZjBaWEk3TTVtK3ltb1lGcngy?=
 =?utf-8?B?RUhrODY1dk5ocDdMTzQxUFgvYUNFUDJYcklBWnFadVJ6dTJuaGlneVMrekhk?=
 =?utf-8?B?bXdhRFhqYW9UOUtPSm1MTkFEd2JWTFlXQkpTK2Y5UThwQTkxNnRUTGwrMFJr?=
 =?utf-8?B?T2hsZjJrc1FrL3dBems2VVBsTjVZbWptWWpSQXJHT1VoLzhXaHc5eXREL1Fv?=
 =?utf-8?B?N0kyTmhpZk1aQjhZb2ZrVlVqeHRXSTlQdjZBLy9zbTNEVkRTZEpOM1VML0ta?=
 =?utf-8?B?cWQ5STBwdVBUTmRNYzBBdkdhQlozdlcyVFBQSjgyckMwd0Q3NFZUUUI3TWpq?=
 =?utf-8?B?cmczd2xQd3pIUWlzRTJBMlFHZU9Qb2RPV3dYTDJQSVV6d2JRWU5pSXY3RTRh?=
 =?utf-8?B?cm1MU0Y0U1N1RllJOWtValV4eGFTTkdocjhtTXBNemVUNU9wVjYvOGJwYmJh?=
 =?utf-8?B?UEFQY0NmYjJMQU5NV29NT3JYaWZuWjFiZ3JpRVhaVkV3Q1dsM2RrbG1jdnJm?=
 =?utf-8?B?TXlFeHVKWDVpZTNTZmdac0UwV0h1SlhUb1NuUjIrNkhBcTVrbFVzSUdSOEMz?=
 =?utf-8?B?czMzc2lzVnduUWFCcVkvUXhlR1Qvd0E1eEFBR0FtWjREV0Z4cVJJMUZsbnZ0?=
 =?utf-8?B?MFk5RGdYMkNadzkzYTRuZ3BSRU1pWnRSYUJjM1BsYm11WFMvZUtjbVNST21J?=
 =?utf-8?B?cEVoYWZ4dVVUWWxSMGhicUJKQWE4MFYzdWY1ajRVN1M5Mk5xV2pkaEdxWkRu?=
 =?utf-8?Q?6Fwm0FQADk8VV8wUVZHg+tU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2340d5-cbf5-4f39-27c4-08d9e4a343ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:20:11.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFUQ1rshB+MPEhzKLNheD8/uOj8reoraG23eIvIY89wyKkbsrO8KKXjxeFblGuneJcQqwLgUUe/Lbc0R/4uEbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6831

On 28.01.2022 14:29, Andrew Cooper wrote:
> In some cases, writes to MSR_SPEC_CTRL do not have interesting side effects,
> and we should implement lazy context switching like we do with other MSRs.
> 
> In the short term, this will be used by the SVM infrastructure, but I expect
> to extend it to other contexts in due course.
> 
> Introduce cpu_info.last_spec_ctrl for the purpose, and cache writes made from
> the boot/resume paths.  The value can't live in regular per-cpu data when it
> is eventually used for PV guests when XPTI might be active.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But ...

> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -296,7 +296,10 @@ static int enter_state(u32 state)
>      ci->spec_ctrl_flags |= (default_spec_ctrl_flags & SCF_ist_wrmsr);
>  
>      if ( boot_cpu_has(X86_FEATURE_IBRSB) )
> +    {
>          wrmsrl(MSR_SPEC_CTRL, default_xen_mcu_opt_ctrl);
> +        ci->last_spec_ctrl = default_xen_mcu_opt_ctrl;
> +    }

... wouldn't we better have a write_spec_ctrl() helper doing both,
perhaps with the check-if-same logic added as well (overridable by
a "force" boolean input, unless the cases where the write cannot be
skipped can be entirely determined from previous and new values)?

Jan


