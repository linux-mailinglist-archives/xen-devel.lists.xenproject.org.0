Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DAF7A47B2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603913.941052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiByC-0002Mr-64; Mon, 18 Sep 2023 10:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603913.941052; Mon, 18 Sep 2023 10:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiByC-0002Kr-2F; Mon, 18 Sep 2023 10:59:12 +0000
Received: by outflank-mailman (input) for mailman id 603913;
 Mon, 18 Sep 2023 10:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiByA-0002Kl-44
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:59:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe13::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64689622-5612-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 12:59:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 10:59:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:59:07 +0000
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
X-Inumbo-ID: 64689622-5612-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxE1gQo52HRpXSHz7xwDasPoymtN0Qsk/6YGVRTneXacFd7yZR287AK5uOcA3pJD/KVEJKhdsIQUxsUxuAMUw0TcTo4Z49AKDyi1DtsGoK0PLXOS+FkneM3SR9RWOC1t0yxwfMF2pl0L1w0bG7sHaodZhm1oiLrkBytjtkMsQG9QBOgy1DvMHuVRLXVt1esGLJqzpsv+FXx4jBdkmqcDu6I0LTssp79R7/BWGovWjYP6RSWhVUMb/E+UWTy+JdBJgss0dQotdly5YfYnW7XOBHHMAB51L00jc8DaTCE0N4KhQ8uIaGeJPNj7WTzJ6kPbXK/LGyZmKBrRfuKJRcExcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jglYSOER0UZuJiCF0yX64wt8kemfXeBIGJxzN9uRoXc=;
 b=C0mu4WmkSoTQYGgDpSI5iUFLj7jfywFIbNTSbZt6AjMmiKem9qK3zlI3NePUqQjJMwt5y/TR5AngEEWN7AHmPsVvQHWK98F5iIXJ+UADX7GHHfWi5Ff3RkH85Cqf+1l1bhEwwrf2vU193xZ4prx0Vd6rHt0S2bM7zNxbTFYu6i4ptQWy6LH+AFWJmz3ki6sARGn+6U2SFRCVzYKyMwahT8QY3c0BixhLh8+cssBCdhBrZBDRpbyYhHuWPu8D9dEHJB3sBFf57oKtgSN7q3OdFbnJr8kf7gPHl03D13yIX1lTD3rC4WARuB8TC7kLrQ7RZJvnm4W7NjAAE1fYdHkkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jglYSOER0UZuJiCF0yX64wt8kemfXeBIGJxzN9uRoXc=;
 b=Bj2uxLblbTh3+2+mIC4PSij1G9iisP58nn1R8qYy4IYeMB+kTeOx4croukKpl8/5eZkY/qAGSv8QuuJpdX+m7Pywz33U7YjANog0QCRO6m/lyQif2SwulgUCS5iyenPEqABW1myuHJk242H5maTzcohCs+czCVHTEEzil5ud5zNQyC42Hthbnrzmb34mfOIoMtSb1Rs3ICiV4MZnE5ki8t3Qr5bGlcYl12X+JG6vm0Qnz4Kno8Yc/x57VE6mgcJewLcCj/ovkM/R5qNZLnskV7YWl3RXCI/y1Jk/yY70crYDamSCq62v0Qr0TOYkfcV7QEZDZSo+WXjupk0wxb+ESA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7eeaaf67-336b-e5a1-6f64-9ad5db14e330@suse.com>
Date: Mon, 18 Sep 2023 12:59:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/9] x86/spec-ctrl: Improve all SPEC_CTRL_{ENTER,EXIT}_*
 comments
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915150038.602577-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f51002d-ad1a-4576-3c1f-08dbb836475c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VwcsfKOodmLh9FyF+vJmzfnywDfM2N45kg2zkZDfjSYF1ZBUJ6qbZxCQiLCz1MBUgJ7haVp/W2XjRkBvuRkOWNPHqUomd/rso6MTGsUNFWy7QIx3nzbjNqjOhYa9OlUkHDRxmsa0DcfeTf3WkqoiwbVQqDcEopFyz6ww4NaTjWHv4+SLlaj91e1L3aglg27dNRa6SBydQm3x4PtQwBimkOl6uZTNOWjDWrEMNkEqHGj25Q3Sdb9e7XlwenIBiFcpYHeMKupai1odnu+373Tusp1TzlZngHrW6isMMXQwbI9UhYj9pylVvmz9tSnEuOXiTW1Vzq+Pung5fH5stafJiTyp8nAP9TOdmAPXwQWRxF5uFKLZoHCewDQGDVQr76uAJ6ywkUPfAgvmjSOwROG5rKhJmR0fInfDoDN8Vud3WHWZCA5mwIjLA+ht0ZriJnXREGVZ54l5An5v6TOX11cAxe/J5gqilmbdr+GixwyX/ne6bpUXejGAnKfALbLSEe5ae80zCMotVbV8DKhxsxA4QuruH7SZCjX8E0p1CiVSJ2igHUi/4BNV5RB7cy1HttuTHQi9tdrrklYt8epkie4VwyOuOQDbOiEgZldgvBZpqhrKotS9yFB4Hzlhhp//iX24r4uWFHR/R/fvcogoWbQe3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(4326008)(2906002)(8676002)(8936002)(26005)(478600001)(41300700001)(31686004)(5660300002)(66946007)(66476007)(66556008)(54906003)(6506007)(6486002)(6916009)(316002)(38100700002)(2616005)(53546011)(86362001)(36756003)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk1UOE9NaG1kWEZsZm9rN0JjN2FzeExNQ3VTTEhPb2RaUm5lVDdubEErcDVm?=
 =?utf-8?B?QUR0ZnB3Y2grZUlPU0M0U0haOTMxN2pYMk1Nb0trbFRSS3U5UHk2elAvTXRG?=
 =?utf-8?B?TGZ4eWQvd1duT2pOY0lPNjlFYmtqaHVUaktwRHpzYjN2NlM0aCs5V3BlRTVB?=
 =?utf-8?B?RUNCWWNKSnlvUE9MOHo5aWJua1pCSmhFZ1JDaHpLeE5rWU81Nk15bDNMTkh2?=
 =?utf-8?B?bm4rYVcwM0Z5cm00QVVxNEYwV0NtSVc1cGNaVWsyT0QzaDNiOEwvYlFTY0ZL?=
 =?utf-8?B?WmxNellnTHVMTVhpYlJJTW53ajJzaldnZnU2K0d6Y1hmQ2FBMUwrYlBHWGtB?=
 =?utf-8?B?Wm5ITkZUMG4reVRUWVZZTVZBQjJTQmdIa0FzR0tHTUJRaTFkUCs5WWJuRWNL?=
 =?utf-8?B?UHViUlhlbWtRdFFnSU9VUkp1d3lHODdqWUYwcDFqMm9pOS8wK1BwWDJTRXFZ?=
 =?utf-8?B?ZENGNExyZ1ZVdW9HOFFtRVBGNFR6V3loTmlra1FrME9tSEtsbkJLN0dIaXNm?=
 =?utf-8?B?OWd1QWJkamNIZ01kdnVsazFFMlowRWFmWU01TnpDSWZmOWJaTEROb0JOd1c4?=
 =?utf-8?B?TEN1YUJzQWRXMnhTSzNKY0p6eDhUSkExMXNkQ1BuMWtkSG1QQ1ZaUHJiVktF?=
 =?utf-8?B?KzZjeDQyUk5aNVZlNnRYZFk2dXdZS1g0QlNQQVlWMm1mSVczcGVJMEZ3RFc1?=
 =?utf-8?B?OThJRWI0OGFCa28zSy9EZUMyYUhJRllXeGNvUTZRY2VET2UvUHpMbmJzNXI0?=
 =?utf-8?B?UTEzbFBBYjFqTzRxcDBMOVFxaXZCQUxOZTRJUEN2UjNxNXJWd09mcUxad0dM?=
 =?utf-8?B?UVRTRzFwcGVwQ1RzMm5oUE83M0xHU3JuSGhBUXpBYWJJUmFlWVRCT1lULzgw?=
 =?utf-8?B?MmJlM2FqL0JYNHVPU21uWTl3Y3BQcE1oSndHZVFuYmRudDNKTUs1b2VqUmxw?=
 =?utf-8?B?U3p3RFRUY3RrRk9lTUxIUUhHNUlUVjRKRVRDVWsySVNuUXJyeWE2NVpicEtt?=
 =?utf-8?B?eENiWFo1RFp2eHg1M0QwWlE5cENHTmR0dnVqcHNmU1FUcWJIZWloSWlMZmlI?=
 =?utf-8?B?TllHby9XZHJGTWhtbkJNL0F0b3k3N1FQcThTTDVoUUlpQzdwMlVYSWxUVjFH?=
 =?utf-8?B?bzhQMWZTU0pSVEZROUdJSGhHL215aXJWWXlsU1VBUTVqZldIQy8vVDk5YzFm?=
 =?utf-8?B?UGhNU2RPbXRsenpxcDg0cVg4QkxQNm1kRHkyWWFqWkZmYUVORkk0a2cyWFph?=
 =?utf-8?B?Q2N0MXpjZEs3SHpMZU9qeDUxRHFwVWFuMmVlZjBkYU4rSm10R1RRM2VtU3ZE?=
 =?utf-8?B?aCtsR0xaUmU0dEROOWFtK2U5dDU2ZW8xRmpEWFR4OThGejdLV1Nxc0dpL0du?=
 =?utf-8?B?WWtvcjRuZldjYzFWUjVLdTMycFU2T1Y0RmszR05BSFJYcGQ2YkN2cFRsTlFK?=
 =?utf-8?B?YnFXc3dLdHNicFMvR2dFcUh1dURXTDNYZkR1QU5LSm0wUDU3UEdoU2N1NEkw?=
 =?utf-8?B?a3RxNm9BZ3B1RS9tVGN1K1g1UTY5RHNwSk5BZHV4TTY4TTRjRTk2TFlubjRi?=
 =?utf-8?B?WjZxRVZ6RlJ3U0FqbjRwdnE0UVE4S000WTBPV3lXdGMxSVZXUXIrNDEwSnMz?=
 =?utf-8?B?REJMY0tyTE1wRlJEVHFnbk5MU2VYR1REV0dreDUweURXdnQ2ZU16RXdRSWJt?=
 =?utf-8?B?cUZTZDdmdmVQNHcweGtSaEdPRE5UU1p5Q0lWY3dNQ1luK1JGYUxVV0NoczRD?=
 =?utf-8?B?SVhyZXlCeHdvbzVuMXVtSWpsMms1eXdHYzVkYjFnakUxWm1jWVVrR0tJNnlC?=
 =?utf-8?B?Ni9WY2w3TzZLZGFiZ0h5K3pvc0JsNVBzUkFxdkZjWjVtU0wvTFJqdXNJWEpt?=
 =?utf-8?B?enVodUFNTmNQNGRWL0FTWkI3bWcya2FNWW8rdUVDOVJTcGhwUTU4NjJMTkU1?=
 =?utf-8?B?TE5KN3p5RU0vSDJXbWx6azlvam9KV1Y3TFRiamtUUWxGK1ROUXg3cE9DWkUr?=
 =?utf-8?B?UG1IVFpURS95QnpueXdua084UkRvY250MHl6QTZIMlRCaEQ5cVArRTJsVFJt?=
 =?utf-8?B?eWFhcHhTN3dDRnhXbUt4blNJd3VRL0dRWGlFOGR1NkJlUkdSTGswaW1yNzJL?=
 =?utf-8?Q?hM85Ly6g0uNiefXHcwUG9sp/T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f51002d-ad1a-4576-3c1f-08dbb836475c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 10:59:07.0437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajyB0YioXjEbGXMw2jpJWlplS+KWQ8SlciLB5jRZM/9Rgkeyibv0qfQZRpdr7KMunaYHOZcyW8Wa9oh3TzVCXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9422

On 15.09.2023 17:00, Andrew Cooper wrote:
> ... to better explain how they're used.
> 
> Doing so highlights that SPEC_CTRL_EXIT_TO_XEN is missing a VERW flush for the
> corner case when e.g. an NMI hits late in an exit-to-guest path.
> 
> Leave a TODO, which will be addressed in subsequent patches which arrange for
> DO_COND_VERW to be safe within SPEC_CTRL_EXIT_TO_XEN.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Two nits though:

> @@ -233,7 +236,11 @@
>          X86_FEATURE_SC_MSR_PV
>  .endm
>  
> -/* Use in interrupt/exception context.  May interrupt Xen or PV context. */
> +/*
> + * Used after an exception or maskable interrupt, hitting Xen or PV context.
> + * There will either be a guest speculation context, or (baring fatal

Isn't this "barring"?

> @@ -260,7 +270,13 @@
>  .endm
>  
>  /*
> - * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
> + * Used after an IST entry hitting Xen or PV context.  Special care is needed,
> + * because when hitting Xen context, there may not a well-formed speculation

Missing "be"?

Jan

