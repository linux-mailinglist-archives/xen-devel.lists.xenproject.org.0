Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA665EEC1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 15:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471951.732011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDRGC-00050f-KC; Thu, 05 Jan 2023 14:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471951.732011; Thu, 05 Jan 2023 14:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDRGC-0004xO-Fz; Thu, 05 Jan 2023 14:30:24 +0000
Received: by outflank-mailman (input) for mailman id 471951;
 Thu, 05 Jan 2023 14:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDRGB-0004xI-6I
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 14:30:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2076.outbound.protection.outlook.com [40.107.6.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b6505c8-8d05-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 15:30:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 14:30:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 14:30:18 +0000
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
X-Inumbo-ID: 7b6505c8-8d05-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvKCrra4pCGYX2/7daq2swJ+jHr5ThbKox1PqD+IxuoNlNrQIQY05kcSpEdTdsTCUdHVVfM4LfRqBH0K/HgewjppCfyw53X8kL6WPUx0WCQVv2gflVavBTJCLO6KdpwbjyaYo/nHpNC6uwYK/Dx1CviGz43fw/W6h1lyodHovH+RbbWGDb6Sq9upmIYSSaqLgFSz7rF8E7M13Dsq+Y2uX0rV3aQtvnu9wr0v/XZ0FchaI85BhF41bkeAKXs3PUyBmONsPmIoXxn7Ajj5w1vykJaUHpl47iujkJ+Qsh6kwe3fL6OugCRl0QsAfEp+ecz4MD8/67QOePCRFaHMeGuv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9/wtwNaCOrx6wqy/6Rdxnz+hvDUMmJOTdH7TQTWBzk=;
 b=a1sz5c2xOicAhM451JpZnNm1ZhIP4OgawUxXDlK6Yr96tnSFZVx6dj0PUPbw52XB15lqCuzta1ntwY6iVmb5rPAZKrufKgEc4b5/b0KTKIz5JnV0Mx4F3YgtBuqhJk1Bi/diZmVgnMOJDTUnuIF6cBVQsYkSMgwsvq5KTTTyakNfh7bkGjj3qSpQtDA+AtRkUZ7eWUalusGFWJ6bYYahjz7DVx5L9vKMMxEY0dKEGVGKLGFPJCeGCAx+DEw5/DUe2o78UMYsLf5SpyFAN5Mu0VQCWishBfa8V0nry9IsgHWYP7xnQgMkW0O/ZqTUuoMCwVvv26e8SDqC6Rv8wU5Cig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9/wtwNaCOrx6wqy/6Rdxnz+hvDUMmJOTdH7TQTWBzk=;
 b=XdU+5R3xwr+DkBWuB6q0dF9RoL7rOhR8R45CUJ0c0Fkw9goIXsK6Vfv3h7AOV0/WNNgIyCalvXuxjRosbZ85Ft4x5BfPVRnZyEsfWNA7r3x8x942YF7Wdeo7s6eOPL/u+/jcIJqeJvgrU82ACVn0440HuM44URrE1+PqvKp2AWRUCSDiH+y2HtvpkUKUIBn8L9iRJXaCDEzRGDICPT81UbU9xjkvuvoP3kfd/u1WOqB2SUAZ11YhnnmfEFrc1g5h6G/wY0NoM4MCgqOEtU30vSd9AP4NWTwmkHNYzeBcEan/qjGpwRsxex37rujyG8+GF7TYUGicgn1sDpasR37Jjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fce631d-2e59-f0f9-3330-9618eb5f3057@suse.com>
Date: Thu, 5 Jan 2023 15:30:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: e05a91eb-adef-49b5-c670-08daef295e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8uIeeGYxl30ILeSNdKYRqRuVeARHcGIZxqQhndcuZ/xl0HF1F9HYnj9Sh43/+9lb6yfYa9KpaRHmHnIized6PghRDQsrdpktt6BJzwdOMl+pYE2vdPNg7XJ+3yLwX57DOGcephPC//FqPPwmfza4C19Q0KuTzaqRY0ndK6nUwqoycksIbewqzYqiRKEZ9pT6L+nfQNkX+5sHkdvIbG3e+N1qsJyZkJz5IG4pVvlSFMScA+RLb7/35J24LArzcxjq0RqIDUCAImcmHTHOLj7ygdKlQSS30kjsNSPeUIJKOQ8o4symS5gJIc8tpwP8P7J7R9WCWcuNIBfu1fjQ2ANpHFzFUNLG3iZaMfH3lNqjYP067pa7paKT/IeAIvRi02Np1JmngWPZOq0j0lIMOdOoYNaWQ4KoQkt6vQMVIRhLCczVp/A0/naJWRc/+vdPBHSAzrtyiSc1ArF4SgrPNHQSZitvejAQASwHTmMptxeA9yPcKknlZMZIJTfFCVfEUv2zFtcJtI03DHZFxW8HzR79vrYfVrRkKrwM7t4ktsQRrTm12KEWhZ2lL0vVHTsXZbyeU9Me99QSHW2BMGp96Q7rL+sbKYowj7/JavEqDPghvxBHg6Pp0fGtW/bIySJ70K1LBtpnQL2/VaUXoHFCTb1vz6NSDvynFODcQ+SERpaX/rHgeg2LgHOqncCDw4/kpfhofiKk9jkH72xPRnEsvKFKrF69VOsvh2GDg7z3YqJOSC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(66946007)(66476007)(41300700001)(8936002)(4326008)(66556008)(8676002)(5660300002)(31686004)(86362001)(54906003)(316002)(6916009)(31696002)(2906002)(6486002)(478600001)(38100700002)(2616005)(6512007)(36756003)(186003)(26005)(83380400001)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NElCeW01RUZwYXhTLzYyNUdGd3lzbjM3UDgvYk1SMU14OVJoMkg2R1BrNmMw?=
 =?utf-8?B?R3RYaWp5MXRDWmZvOU1ocVNGTThtMUpjUkpHZTVnNmtndU0vRkFxUG9LSW1U?=
 =?utf-8?B?RnJNa1VZWTNzaGhsSVdLcDEzVGJVVW92UVE3QkRDUXRjNThnUlRjMkJzbkc0?=
 =?utf-8?B?ZkQ4djNGYVljeUJXWHhsRXFlN2FCV25Ca2ZYZ0FkTE0xTFRZaHBVeHhPdlY3?=
 =?utf-8?B?djJNZnFKQnd0cGN5c0hvZ3pFMkRwNDZLWFErUGFaVnRqSGVIVS95K0ZMZVlF?=
 =?utf-8?B?cnpKWEpFNWYwOFVYNGlrSkdhdFJFbjl1YjFwckV2aUVrRDQxWW5uck5HTzNa?=
 =?utf-8?B?d2dFNjlQSkVYMS9vVTVuV2srS2JRWENTRk45bzJYREpvYVJGc2ZId0lsOEJ0?=
 =?utf-8?B?czZ2V0hpR212RFBXajhCbDlSeC9UVFlnMmk0M2tsL3FJYys2VU95RnRXYXQ2?=
 =?utf-8?B?M09lZEFndmhSeHExcHlZY2hOS2FtYWZxSko0dlBKT1IvMFBGdWcrZ3kxem93?=
 =?utf-8?B?R1djN1dsZ1Z2S2NVaEFDbFgrVjErWGU0QXpjbTZZL3BzbWpjdkpsVWtBVldh?=
 =?utf-8?B?QXhXcWhveHY3WVlEOUdaOFhHbURzMWUxRGN4MGpQaEZBUEoxL05vWmFwak8y?=
 =?utf-8?B?MG9hZytTV2pWUWdjN3pqcm5ZL0lrbGRTYWlFckoycXgwdWU1bHBBV2M3dktL?=
 =?utf-8?B?L0Zaa3Q4N1ZYRzZJQXl5TVNMZGFrZGN6dERJaXh5Zms0cWthQVNwSWZxL3ZB?=
 =?utf-8?B?S0tmallQZDVNcDd2K3ZoQ3BMaUN3d0VOcDF1NUV2dmo4amZPZVAvaXpqUFZV?=
 =?utf-8?B?RDc1TGRrb2JtSmt4bldEVHphRnVoRnIzMm0wZ3pINjlYNDVjaWZ6c3B3RE5W?=
 =?utf-8?B?dTlRSnpJZm1id2ZRMHZxTXZsNkhhMk41YTlSTmx2R0tRSVhxdFM1Q2RQUzd6?=
 =?utf-8?B?OVBpNUJobER3dEtPWDY2SnhjUDF6SmdNU2ljeFNmNDd0ekFHSjhNUHFBK1Zz?=
 =?utf-8?B?dkx1a1ZOUi9kdVc5VUFpM25sRHBhZXgxb043eXRHa3AwN0s2cDIyWENzd3U1?=
 =?utf-8?B?QzlTMU1XRkRsSG5Bdm1mMWVyc0Q4Ynd3T0c4TkZWVjdYQjFoa25XTHRWVXFl?=
 =?utf-8?B?dFlrRXhNekVEYjVEMWxSdlFmWFpRWDNCR2Z0Rmw3aXlObXRqaWhGeFRsSnoz?=
 =?utf-8?B?MGRtMEoySzZvNTlKbCtuM1B3ek9sVTMwajNBNmNwbWNFb1FRQmpRVGlqcUZq?=
 =?utf-8?B?VzFXM3poYjZmZVYvUnMxRHREdlZVMnMycWJTdURGOHNCOWc4NUVJUWFpQWlS?=
 =?utf-8?B?RFdCYUhNUjZDSXhBUXFRVkY0YkIvaFFHdFcyQThvb2Z3VmxGK3R0dGNENEVn?=
 =?utf-8?B?bHp6Zzd2KzN1TEUxWU8yQm1YTGZ0OEI5SlZtVkpDYW1GSTM2NStzQWlJUHNo?=
 =?utf-8?B?dTl3WG90a09xMVJ5cW1VSzUxUHFaVnFIVEQwNk1QS0cxekVZU2Q2SVFMdk9D?=
 =?utf-8?B?TDM2cUxpZmRtMXRXNkZPYXFZOWIvVnFYL3hyTU5xZkx6bVl0MlVrM2cxa0Zv?=
 =?utf-8?B?US9PM0Vsc3VJODNkcmJZZmtCRndlM1RIaFcrUGF6ajNZeXRCR3RSb0llcFJX?=
 =?utf-8?B?L0dGNXYxMG95MGNRYkptWTJSQi9BeGYvZVBBcEl2NXkxUmhieU53K2gwdnJS?=
 =?utf-8?B?TVMzems2dWMzUlFIaXV2bnBFczVBZWRydEx2a1dwdDF6ZWRET0Y2YzF5QWNy?=
 =?utf-8?B?dVNWbnBSNTBLZzVCOEJEellpMnd4MnM1ckEzOWVrdG1ONnVWLytSY25oU2ha?=
 =?utf-8?B?Z0U2V0pVNWJZNFNNOVppM3A0Y2ZOTVFScnZMalpmRldoSWYrdUxaOVlMMy9p?=
 =?utf-8?B?WjhuVzkyWEJ2S3F1MzVXOGEzcGpnUXBkSm9XbG1RUmROSHlwN0lXMUwxcGNn?=
 =?utf-8?B?Wllvby9MeUozT1o0eEZHUkFNUUFXc1E5bnZiUDNmWHRnNHR3Q1cyb09sb3J0?=
 =?utf-8?B?S1RidGgxeWV1ZWdDdjRXWHptOXJVYm90WlA1dytmVk41TTZYYWRncC84enY2?=
 =?utf-8?B?c0ZYRjZxcFpOTTVFNDllZnFYbVcvbkNDemt6VHJvTStLMnZNNjZKbGYyM00w?=
 =?utf-8?Q?6lsN93a6QTdXUiWLmgQ0OtjE5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05a91eb-adef-49b5-c670-08daef295e74
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 14:30:18.5005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSvra5CT/1d3qprmWD2+sD8Npfvmq700Uw6+9C6BNzU57c21iKk1BL77OxYVso7xVIVlASf9F9sfccWWtL1vLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

On 22.12.2022 23:31, Demi Marie Obenour wrote:
> Setting cacheability flags that are not ones specified by Xen is a bug
> in the guest.  By default, return -EINVAL if a guests attempts to do
> this.  The invalid-cacheability= Xen command-line flag allows the
> administrator to allow such attempts or to produce

Unfinished sentence?

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1324,6 +1324,37 @@ static int put_page_from_l4e(l4_pgentry_t l4e, mfn_t l4mfn, unsigned int flags)
>      return put_pt_page(l4e_get_page(l4e), mfn_to_page(l4mfn), flags);
>  }
>  
> +enum {
> +    INVALID_CACHEABILITY_ALLOW,
> +    INVALID_CACHEABILITY_DENY,
> +    INVALID_CACHEABILITY_TRAP,
> +};
> +
> +#ifdef NDEBUG
> +#define INVALID_CACHEABILITY_DEFAULT INVALID_CACHEABILITY_DENY
> +#else
> +#define INVALID_CACHEABILITY_DEFAULT INVALID_CACHEABILITY_TRAP
> +#endif
> +
> +static __ro_after_init uint8_t invalid_cacheability =
> +    INVALID_CACHEABILITY_DEFAULT;
> +
> +static int __init cf_check set_invalid_cacheability(const char *str)
> +{
> +    if (strcmp("allow", str) == 0)
> +        invalid_cacheability = INVALID_CACHEABILITY_ALLOW;
> +    else if (strcmp("deny", str) == 0)
> +        invalid_cacheability = INVALID_CACHEABILITY_DENY;
> +    else if (strcmp("trap", str) == 0)
> +        invalid_cacheability = INVALID_CACHEABILITY_TRAP;

Style: Missing blanks immediately inside if(). Also note that generally
we prefer '!' over "== 0".

> +    else
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +
> +custom_param("invalid-cacheability", set_invalid_cacheability);

Nit: Generally we avoid blank lines between the handler of a
custom_param() and the actual param definition.

> @@ -1343,7 +1374,34 @@ static int promote_l1_table(struct page_info *page)
>          }
>          else
>          {
> -            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
> +            l1_pgentry_t l1e = pl1e[i];
> +
> +            if ( invalid_cacheability != INVALID_CACHEABILITY_ALLOW )
> +            {
> +                switch ( l1e.l1 & PAGE_CACHE_ATTRS )

You want to use l1e_get_flags() here.

Jan

