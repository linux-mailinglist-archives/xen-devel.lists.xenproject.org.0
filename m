Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3A731B7F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549647.858285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9o7d-0001sk-S9; Thu, 15 Jun 2023 14:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549647.858285; Thu, 15 Jun 2023 14:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9o7d-0001qw-Oq; Thu, 15 Jun 2023 14:38:49 +0000
Received: by outflank-mailman (input) for mailman id 549647;
 Thu, 15 Jun 2023 14:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9o7d-0001qq-1I
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:38:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5639f9d7-0b8a-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 16:38:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 14:38:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 14:38:44 +0000
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
X-Inumbo-ID: 5639f9d7-0b8a-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJIhXUpL3Z4kYdVxniWVs7XHi9kpUiY8aWiTMwkuuchhZTUGTT+Egs8vtPK9x0wOGPIP3ibgLNlQgarGXBbHkQ611/aCSiUocNDvMB1O+jkfsszjMm0euLVCdv//sBQZEYur8znbyZQ+uS3mfr40pm0JaozGg0V2es7SzvKgMRTwJpesXnSAg8hIfCXudEGMf4LQVnBSCsqJWdFWxFNuIcOaHhCoivzeeqzaqrE+tHGhR7t1JRH5HVxwIEcK62XEItt4gTMC5QvH2Rus4Ys/k8wHavt7rQxyM0toODmLYZFiGsllUT/4o+ohUVB+GLr6xxJ9EPUo44FReCGM/hfELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMQcq16yR4R4HnA7uEqbnUpjDmdxy1iUNDdOMtJYSwM=;
 b=WC/6gKS/WQnoPEfXxrF5r+5+8MLBbv/7tmA09ugARVRvnYnGk9XTrW1AY+/3kl0HwSdVHrbQQ3wwXNtXlzvzt88eyzMeldPAugokMiJAjA2KBzkL7jdR0PYsQLVaL4wSnZTWU7KLAqoMTNfXUFbUg+UirrleoGNg6QMD9wUqgPBNqBRiACXY8gTWSgv4BhHslUTJDHrs5Nbj69D0OL0OOD+mHmylK5ja5TnJefW6OZ5RG1zPVDwMYMlSRDov6GZMdHS1U6UQXykhTm7U/M4mXq0EaZ5P9Ym95FTGxoAr7cbLxQdzAL58Pymwtq9B+uVDaIRIgFM9h2AxWRadZEfVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMQcq16yR4R4HnA7uEqbnUpjDmdxy1iUNDdOMtJYSwM=;
 b=jLdTzHm5j7fzwvcbojxk68MqdT83oq1jLJWcnPEGAiNu41QofuRMKuZCqnL4maRlEDLT9v7wCu2nkMs0ZTxfA324vkahlDCaQXuNZj8j6b+0cgPjNo9ZNxK2PnSxn3f7EbrG8h+u9yypXb/f8t3fqvus0rdaHMCgk9ifJM6IJlIBjrf6PP4fYIDq2qJVdW6gnrR/huhM9AvNijRKGRbavjT0CB5WocZmq1uDOknPimApILYQ8eJT5AWVn+mxH762iK9NmriqIk4xQr3eAFKYTmiH8Jw38rNcSOiQeu6Ko8fR1GnF0+Sqw31mk8X9GdAntvFjAW6UYEWlypiOMhRB1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ee7b593-6e87-25f3-83f8-6309c1cddbfc@suse.com>
Date: Thu, 15 Jun 2023 16:38:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-6-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-6-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cebf405-572a-4e46-9059-08db6dae389b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GP57PTr+oBkr6sQo0Bu35UvPFDISz9GcAyRrOm3gIE5CPHZnoy6SSlwCvF+lyWXaR7+Y9RwXuxjqr+ZtRLXOcbb+Wh2cRcPmwG4nfpNm4bEibIQNmQwgQSzN6lZCTB+BqEJq1nnw5hC/HIw8NGhID8Qt3dUsnqss8FcSSpD4Icv/CzqneE2S1n0r85vaP4HD8kMCk/qS9fxrMcySId+vgE+regK8HfCC2z6Bw672R6NehCpZqe6UlJIlW+nUTwG/NKf6mHtjC3AX6ba1u7thAmtLWdIUWkYnJ2CmNaXf8BmYGQVFGrgJ2tYomElaIL5i1S6TRjegQFJ2dU9TFabLqRoyIA/0bczkJIRFWoKaTGqD3ZsPDYhKXzL4FtGO2I07nJnjPJPQN1EXjWf3lk4K9IHqBseWopstsYDs2D8Rvoa6o0bSxxu9xj79kQ2RtYLEqLh9AJ48ycGc331PJsMrL4/a6GYIJgLKa31emNR+8zbi/OJm0prZYuY4mD6MnsSDB1nHWd7wVxnfqWoN5/+lDpN4a/PN3UpVIk0OadvwHTdy3yDD+LUGxJRDFvjlo4Y2+4c9/ySSEkv5GozsuCOfozdIW8v5ySfZ8hQxIcrdls8kraeB8lnAemCwk7OBwjz9m3d5e1XKdtrlw4PyGyro6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(83380400001)(31686004)(4326008)(5660300002)(54906003)(36756003)(316002)(53546011)(8676002)(8936002)(86362001)(66476007)(26005)(6512007)(6506007)(41300700001)(2906002)(31696002)(38100700002)(66556008)(6916009)(66946007)(2616005)(478600001)(186003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC90b0NtTldneFJaUXpkY3lzMTMrR2xhOENObUFmNm4xRGxwMG9pSjJIdHky?=
 =?utf-8?B?ZVJvQU1OVVVsbzg2V3lOZ2swaEVKSTZmazY2RTdWWlRmWDBuTnYyLzN0dXZ0?=
 =?utf-8?B?ckFNWkdNdVozUnhhZEJoUW5RcjhUZnVsMXJLekNoZitWY25xTU55a3FTVkV6?=
 =?utf-8?B?WGdIUXZnSHgwSGFyNkNEclk4L2J4Y3hPeDJsYXBaMFUrbzFYTnV4OUFDUkty?=
 =?utf-8?B?YTIxakoyNzVTNlZqMUNkV1QwQWJZbHNiRGxQcW9KQVJQTXRoWnJyZzgwZjAx?=
 =?utf-8?B?ZmFFTGpsTTZweTJhZjY4QXJlVUs1bDhDekx2dGo0QWtFMlcvOThZMjdBbUl6?=
 =?utf-8?B?U1NZcDVtdmlKanhMYk04dmsvbFdTeElSRCsxdXcyT2pZVmJFdG15REM5MWJB?=
 =?utf-8?B?YmczMEFiZnVBNStzU2JCbkRvWk9Oc0Rwc2ZxWi96Q2kwTkpmWldWRFpJN1Fq?=
 =?utf-8?B?eVVrdy9PdWRQcW1ZNlpVcFZhTDlMK2FDUjVQRTZyOUhaYnFUbmc4ZzhDNU12?=
 =?utf-8?B?ekk2OWFjOFNjaXhOeEl6R3oxWmVLZUhUeXZkOGVTZ1ZoNisvbkw2ZmZzRWpK?=
 =?utf-8?B?eEpvNmtLYUxYSWRmVGJtQ3ZaOURENGNyUG9RNGdPR2lKWWZ5cFVlVFhzRm5w?=
 =?utf-8?B?N05kbDQzQ29IL3JyK21uRWx1MzIzVkI2bFNVZ0NZbnNrTnlGNEdCR09wM3R5?=
 =?utf-8?B?ZXIxSStBRkNoTnN0b1JXUGF3QWY4NWJoZUlnTWpZRnRaNFIrb3djUmlaRkU5?=
 =?utf-8?B?Mm56ektkc2dnQzRSUTljN1lET1BsaW9xdjhqOERsS2NXaWNyMlpHRmJTOXZO?=
 =?utf-8?B?NEYrUTFuc1AxVDkxdnBSeVkrbHRIZEg0Qmw5VUl1Vng0NlhyMzlxazlHTnc2?=
 =?utf-8?B?WkxQRVMyakNzMHM1Q0Y2Qys4K0RkdVF6bEYyWDVpa094UHJhc2xraVZLOVpY?=
 =?utf-8?B?OWd5RnQwaUl1NjZiSkMyMU9KUXptV2hZVEhYZHJCN0EyN3pQV2lLeEIvKytZ?=
 =?utf-8?B?dTdUc2tOMEJ4V1pPaUFjMTZ1L1YxQ05sYlNzTGNOMlpWYkcvWk9WVHFFRzNo?=
 =?utf-8?B?dG9sM0FySFFhZk9DcHZxSnI2dW9ZcjFFNXJWVHQ2TmkzNWFhRHkxSUg5dUJo?=
 =?utf-8?B?TkNaN0x1SFFWaVN0YUhmMVo1S05xWXF5N3JoM3BqTnl4R2taa2E0dU52TnhD?=
 =?utf-8?B?cWNjVEo1Uml4YjgzL3gwUC94czgzUDdGYWFydnZUYVNIWERONUFoa0Q3ZzJZ?=
 =?utf-8?B?Zk5pRXdJV1BGL2tQWko0RFdZT1pMNkNsVkpaSTlIYS82TVNybjR0S2lCdHhM?=
 =?utf-8?B?TXNnaFh4clh1T1ZNN1JqSVc2VGpHQUF4dzBZM0ZDRmltN05jZ3FpYmJyQlhM?=
 =?utf-8?B?b01BeVdIZ0FYYzQ2WUJ1dU9KczNLOGYvUS9RNHhTejFndzJVMHJXVUhoQi80?=
 =?utf-8?B?QXpUeDY2a3lOcE1aK2Ztell0RlN2TUxSSG92c1RVQW9tV05tQVdjYXNMK1pI?=
 =?utf-8?B?N21wZHgxUkQxYXR2VEZNaWlFUjQySnFHbE5BUDNFd3YzUnNQMzUvYWV0a0Jw?=
 =?utf-8?B?bzAyUmdVbG15aVYrSXJmSkVGMTRGbGJ1eUJMMjVnMnlhS0ZBSW9taDhsYldS?=
 =?utf-8?B?MnZZYnN0M1RMQ2F4aW9FNXRhNXkrUnVGenYvbmxpY09FY0JkNUF6OFFHb3Ix?=
 =?utf-8?B?MDl2dUVlRWFGMndHVnlycnJPS0IxcDlBUCs4Y25PMlZIWHBHSk1SZEZTOGxn?=
 =?utf-8?B?YWlBdVBCbzBjbVM3eXoxd3dUTWttZVZNaTAvVW12djZEZVUwQUU2TSs1bEo3?=
 =?utf-8?B?NThMbnM0L0ZLUko2NDF6a0R2S202a0pkeGREc0djckZDV29TV1hCM2NWaTFl?=
 =?utf-8?B?SjV1YVpUeDl5UGpGZ0ljbU5GYUVxcG5HNkFqSi9LUjR2U2lLcnFaOXVBaHNP?=
 =?utf-8?B?bkwwSjFpd0dYdGhCTW5XQ29WMzBzTDlMYVJXOXh0QUhNanVTT1pVSDRCaGtZ?=
 =?utf-8?B?MDVsb3I1OGhtc2JhWEFQSWUyMTdCRE82Y0Z5M21PNUthMGNiNWxLa1I5SC9Y?=
 =?utf-8?B?dFpRL2NZdE5adkZWTmJHQWJvK0tPcGFZR3lSckVtUTZ2MnI0aGNhVXMzVG5y?=
 =?utf-8?Q?XScN3K4sD28/Z2xkRGevT3aVe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cebf405-572a-4e46-9059-08db6dae389b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:38:44.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42sPgn0ERCYyiSiiayYAqQUILeqR5QbqxJd039cJmoKtXlhNrgSphfxoZZSC9vrj+6tZP64lVUHH8YXgzdSHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

On 14.06.2023 20:02, Jason Andryuk wrote:
> Move some code around now that common xen_sysctl_pm_op get_para fields
> are together.  In particular, the scaling governor information like
> scaling_available_governors is inside the union, so it is not always
> available.
> 
> With that, gov_num may be 0, so bounce buffer handling needs
> to be modified.
> 
> scaling_governor won't be filled for hwp, so this will simplify the
> change when it is introduced.

While I think this suitably describes the tool stack side changes, ...

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -239,11 +239,24 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      if ( ret )
>          return ret;
>  
> +    op->u.get_para.cpuinfo_cur_freq =
> +        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
> +    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
> +    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
> +    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
> +
> +    if ( cpufreq_driver.name[0] )
> +        strlcpy(op->u.get_para.scaling_driver,
> +            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> +    else
> +        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
> +
>      if ( !(scaling_available_governors =
>             xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
>          return -ENOMEM;
> -    if ( (ret = read_scaling_available_governors(scaling_available_governors,
> -                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> +    if ( (ret = read_scaling_available_governors(
> +                    scaling_available_governors,
> +                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
>      {
>          xfree(scaling_available_governors);
>          return ret;
> @@ -254,26 +267,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      if ( ret )
>          return ret;
>  
> -    op->u.get_para.cpuinfo_cur_freq =
> -        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
> -    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
> -    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
> -
>      op->u.get_para.u.s.scaling_cur_freq = policy->cur;
>      op->u.get_para.u.s.scaling_max_freq = policy->max;
>      op->u.get_para.u.s.scaling_min_freq = policy->min;
>  
> -    if ( cpufreq_driver.name[0] )
> -        strlcpy(op->u.get_para.scaling_driver,
> -            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> -    else
> -        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
> -
>      if ( policy->governor->name[0] )
>          strlcpy(op->u.get_para.u.s.scaling_governor,
>              policy->governor->name, CPUFREQ_NAME_LEN);
>      else
> -        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> +                CPUFREQ_NAME_LEN);
>  
>      /* governor specific para */
>      if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> @@ -291,7 +294,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>              &op->u.get_para.u.s.u.ondemand.sampling_rate,
>              &op->u.get_para.u.s.u.ondemand.up_threshold);
>      }
> -    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
>  
>      return ret;
>  }

... all I see on the hypervisor side is re-ordering of steps and re-formatting
of over-long lines. It's not clear to me why what you do is necessary for your
purpose.

Jan

