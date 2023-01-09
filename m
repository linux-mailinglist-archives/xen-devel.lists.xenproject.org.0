Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03376627C2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473664.734393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsav-0002Hm-Jl; Mon, 09 Jan 2023 13:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473664.734393; Mon, 09 Jan 2023 13:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsav-0002Fw-FT; Mon, 09 Jan 2023 13:53:45 +0000
Received: by outflank-mailman (input) for mailman id 473664;
 Mon, 09 Jan 2023 13:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsau-0002Fq-Dt
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:53:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b0a9cb-9025-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 14:53:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:53:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:53:39 +0000
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
X-Inumbo-ID: 06b0a9cb-9025-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0tEHTExiuTOqFnDhL6pPEkwBOcPREzl45Bmkgu3wQO0wDdZzHuHcHEqxjQhM3v9/WLp9PC5IaSek0fbuZC3gq7IzcrUHtGeZRRCtWcJIefHuD4n+Ns87ACaS6uBDZCTFi/3qAk2Js+Ff/2k5hKhmnL0WS3tAcHjucvCgnVd3X21MEhO4LDoUPsI6FOd+TWDTf/mc5L/gIz+0EQkHse01/LdmkSzwBRntC2RiKVnvvnzrV23eKdorIsiggWNQygaA8Pq9h1J6XlWXa6TU8L41gsKAUf2Z1V9X6iLWkXyX6GArDN/TeUP6/awqvmcKNV2EI9KYOmjJHz0YR69POm7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB+XLs3uTRl0EN98OjmZEzYQQmFrZx6LJBm6WUg9zXQ=;
 b=Cdi8zp/OdcgF8wqFKhiZboYamcqJ5cUUCw01XU7M8YUPEvdBPp/AZVoVSHGec+6onJWys7oteWwLFBx0FGMM+WVAm6kjEOYdoaqLHGV/uNIlOJoRmml30SYqIbr59fxkiMmLiPEoDVeBZismINScXzwu9bHVfLkmiA3EtHMEKoSqijzI7g7in9U/IpMkMV2POH8G/MeYpwjnC+YF+8Od0Uqmh+V4NZDX/gbRV9a4RNZZr/oRyU6nH/SWZW+2hxwjhhkQ3ksby4VV1OxG22ufUGRbLwcSDs/xrmDS8+aH/utmTXiXufCtpkx5RsaFtIZx3TD5s4uuuPuK0+I0fP+hqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB+XLs3uTRl0EN98OjmZEzYQQmFrZx6LJBm6WUg9zXQ=;
 b=E//Up1tmz51BFj0CvPMV3O7zhzXCh/ipiVodjWL7l8I/P3v6wiJWXrmUgA6kENIMeCvXO7A6NnHAHlos+d9g60Pwi77Kd1MlUmZYNXZBwr9+qxMRO03tVsAFhT7VxDcATVpEhwmc+IGYuajeQZod6Uqp1m1mvOz1LsPb6QOjVbA7yTAfWC+OrH0MdPwEalJfLZfjd+esEQj9GRJ/9nCC9OnhrauMXHkDHdCbIM/77/d9RK0q5GcXB/F/7SuG6a9h2fPcBD/jFzdjP4rMY19o4rknJp6peua0j86Y3opMFxRm77urL3YbmZCnOeNPzE846AxtY1Gtp4LPY86bxOwwMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b2a41ca-f801-7188-e961-b29f577b8d78@suse.com>
Date: Mon, 9 Jan 2023 14:53:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 2/4] x86/mm: Reject invalid cacheability in PV guests
 by default
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1673123823.git.demi@invisiblethingslab.com>
 <eb9aff037aa9afe1a4a37661847e44d2316ad094.1673123823.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eb9aff037aa9afe1a4a37661847e44d2316ad094.1673123823.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c85d9ff-4a18-44ee-ddd4-08daf248e974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23cjNQZz7xzlHnSCtkZ6zY/GBy1qbAENCqe7n3KKAucGlbQqtAh0Boo2RaX7N/oV7EWM7aFpXnYiuzOTnaNfToyY8XIMPfjsKWLnIYV5mjoy9AOFW4+BnZ8727skM8vbDHLF1GZWlbzSAvpH+D7Uyp/P9IggXwHmwo/USPYncaKEW9bikinqVkfF+yReIzCN7i7m9UmRmsv9Iwe6/t570S/aw7y0/6f1+cIVFeiA0MuHwURlxAnQdYR0ALErv20PtOHXcIJoQ+CJkDlNk11wvzUcKL08gA5K7jBSybuoZWCzoa16mtvY5/tEBpHDJyAxrulR3Ran7mlB2+Id6apbMAhafQpqFRGJzMhlZrQouyPjsK3uy3nrtqSIfYvlfHOk6/pNniKebtlqxQ6vuVm4bzZjiL0XAVlJTM2mVrwlpjc3rTh+dcNztzt5kpx5oUTRXqYgQEWxc7rGhAZi6248LmnyFWbuncjOtdVdujoLmiSPgmutxTJpmsg4bmNZmMRXdtxPilLweA/vU4+WQT+nI6p/XRi0MkblBi8Hu9gP+FKwfTOGBC+IbsHe1iKxETV2B1Fct3bGeDidnbIiVNkXvuynBCx1vVMaIxy/YS/bKxCUTJ/JnbuxUb0qqpm9GswOBoMucIGgh8YabpmK5x21kOEFWmy5JmtbacDAAmF/wE+0ShaJb4hCYVfXBKCyV8zoj4dhkOdpZHMg09HTm+HFUDzlIL7NBlv+nKJC/D1Mq0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(39850400004)(376002)(346002)(451199015)(316002)(5660300002)(7416002)(26005)(6512007)(186003)(6486002)(478600001)(2616005)(31696002)(41300700001)(6916009)(54906003)(4326008)(66556008)(66946007)(66476007)(8676002)(8936002)(83380400001)(86362001)(36756003)(31686004)(53546011)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGZIcDhtR0xCYmJiNCt3SDd3dkZZMENKQVVlOTcxenphOW1RZEFUMk05RVVY?=
 =?utf-8?B?anRneksveTdJK3lGNXNZNEhpTXlQaWlZcEZhMHVVU3hJVnVlaEVUdTY0NkZr?=
 =?utf-8?B?YUczWWZMNmlucnFCSmdYMFFGSkJHTjRIcXJ0R1QzWUI2ai9TRkI3Z2ZjdjNO?=
 =?utf-8?B?aFRPekMwa0RXUTI0aUhHSWdTdkpnWmRaY0VyekF2QVZ1SktLT254ZGxPNFoy?=
 =?utf-8?B?R3lzei96eWRBKzdEU1RiOU1UQVI0SkFYbkdHL0hvTGxmbytQRG02SFpHT2Rp?=
 =?utf-8?B?L0NaaTNQREU3UDRnRTRGemhpTFlOQkUxSmkydnlMbTZUSjZwcWUvRDhmU2t6?=
 =?utf-8?B?N0J3RW1kUHVJTXNmREdYNVR3aHl3bGpSdWY3TGRqYTRUWm1ObWNlZzQrdzZ5?=
 =?utf-8?B?cWNtMGRiVHNlRWt5VXhlbTdhWmJzM2l0M2F4ZnVzeDJ5QVlBZmFSOWZ5Rm5C?=
 =?utf-8?B?RXNOemhkWm81V0laeHArM2lvV2IzYlV3amRlNmNGRFY3TUZ0bzZGN1JlVDRy?=
 =?utf-8?B?Y2gxVGtmY2JMbnArKzJOY1JrbVNhcXVpczNVeXgvV3JpWEw4ODM5YVhyR29a?=
 =?utf-8?B?TXFYYS9YNmNIRjg5dGFpbTltUlhaaHJ5djM0MXNSbkFtSWJHWEFTZlEyRHJX?=
 =?utf-8?B?ZUk4WXh6L042bXNOQkQyQVdZWTUydGRzOUhPV2ZSSWk5TmRwQWNjZmlnRXAw?=
 =?utf-8?B?MGRoZVNYaExMenJJZ1FxVWxnTG1XZ0xUSmRyL2owZk9ESFBoQ3NQME1PckJt?=
 =?utf-8?B?TVZKY0FQeTBYNVFobUxLcFo3ZUpRaFZuZ0YwL0l5bnVuNEFKcnFnQWNiaEk2?=
 =?utf-8?B?dENoc3EyQ0t2di9CeWpuWkd5bDBZVU9kTlpManlLUTdYYlJqYlVycFZCK1Nl?=
 =?utf-8?B?TS9oV2lLbU1TR21xZjZMeVgrOWpmaG9YOFM4RUM1SEd4Y0FaZUh4WDlpZUtL?=
 =?utf-8?B?enhIdG9iUUo5MmJUTlY3cERMU1RTNXgzY1hRODgrVk9qaldLUTY2WllZb05Y?=
 =?utf-8?B?d2RTTjcvelR2YzdHbUxyNGlkVHdhLzFwQUFDNmgzWjJ4eWRIc0ppM0ZZVDJs?=
 =?utf-8?B?Yy9RZk15eUVGSkRVZnljR3BPdmFZaTFWdmd3bW1mVWVIZmJDdXRnc1EweFlp?=
 =?utf-8?B?RTA1QXd4cDgzdjdYN3h6ek4xQ2ZXUUJhRmY2RGZMM0ZucGlvYlpJYTE4c01F?=
 =?utf-8?B?U3FlUkVCdkRJSXVaMmw5TVNqb0VtVFRyQWdpV296bklkOVpvek0xbkwyZUhV?=
 =?utf-8?B?ejhIdEJtTjNVTDV5emVsQ0R5WnI1dkY4N25KM09aekpZd1FscUQzWk5kTUIy?=
 =?utf-8?B?b08zdVMvcDdZUVhOSTF5bzlOREpnVEhZem11STFWNUtLQlRMTzg2Z2VrejNI?=
 =?utf-8?B?V25kUDlwV1ZEdS84Um9Qa3NxV1JQS2xidXdzalozWGpDUWJNNCt4RjZPU3dm?=
 =?utf-8?B?V3ZSZUR1cEFjbXdqQzMvakczdkdiNDNLSUpLODN1ZHplWC9MR3BYSTZWb0Y4?=
 =?utf-8?B?U3ZwbUdrWkRVaENTc2YwamFUcXVSY3hlbXprS0xtQ3h2ckFFanl1SndOSWJG?=
 =?utf-8?B?R1ZtalprRndvbUFGcnFvUUo1RlpXcDVrRjRRMXU0b2Y4cy9PcCtzeVZXT09C?=
 =?utf-8?B?RG83eE8xeHhpdTBoN0Y3UVlIOW1CWkdVaXJETDNnTmo5QVh3bVNFUE9seGxq?=
 =?utf-8?B?WEpwQWxONEVKMW9ZVUsrYmZMenRDcDVyR092cmN3ckwzUEZKSkRvcUJjVnlP?=
 =?utf-8?B?dEpOM0g5cUpOYUNkRzhXK09NTlg0ZW54c1QzbW9UUmR0NStCNjVNUjZJT3Ur?=
 =?utf-8?B?cDBURGRWTTcrVlVIM1cvVmRlbDhhVGlQMkduNjlTSHd6d213emd0TUZXb0ht?=
 =?utf-8?B?UmJremkxK3R3Y29aUVBoMkFsL0FHdVdPenlXYUh1V1ZpZnpmS05COUUrdEhu?=
 =?utf-8?B?dk9nVDAzY1FKbkJHSWhBUHJGNE81dy9hNjUxUjlodFlBT3NFTWRGcDNjejJP?=
 =?utf-8?B?dFlvYTdwNDMvN2JJakhuZjJpZ1Awa0J2TzlRSzZPWGJmV2M4dGZBTitZM2lY?=
 =?utf-8?B?YWFnbjJsYTZuQVhtN1plY3h4Z2NBVThmdUZmTFdnWmF1QjlQQkx5Q3ZITk1X?=
 =?utf-8?Q?dmGN4iXiaCgyJSFopc9mCbecx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c85d9ff-4a18-44ee-ddd4-08daf248e974
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:53:39.8257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pySXsT2j8WdRsShPXwI5gWWgoI8ou9SEWUpX+atwyw1v+TD11+9ORZk1JKzilV9HlVRT46TjTt8K+gfQ8hE+0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183

On 07.01.2023 23:07, Demi Marie Obenour wrote:
> Setting cacheability flags that are not ones specified by Xen is a bug
> in the guest.  By default, return -EINVAL if a guests attempts to do
> this.  The invalid-cacheability= Xen command-line flag allows the
> administrator to allow such attempts or to produce

Like in v6: Unfinished sentence?

> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
> Changes since v6:
> - Make invalid-cacheability= a subflag of pv=.

While you did this, you've retained the standalone option, and documentation
also continues to describe that one instead of the new sub-option. You will
then also want to move where invalid_cacheability is defined, I think.

> @@ -1343,7 +1392,9 @@ static int promote_l1_table(struct page_info *page)
>          }
>          else
>          {
> -            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
> +            l1_pgentry_t l1e = pl1e[i];
> +
> +            switch ( ret = get_page_from_l1e(l1e, d, d) )
>              {
>              default:
>                  goto fail;

Stale (and now pointless) change?

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -28,9 +28,21 @@ static int __init cf_check parse_pv(const char *s)
>      do {
>          ss = strchr(s, ',');
>          if ( !ss )
> -            ss = strchr(s, '\0');
> -
> -        if ( (val = parse_boolean("32", s, ss)) >= 0 )
> +            ss += strlen(s);
> +        if ( !strncmp("invalid-cacheability=", s,
> +                      sizeof("invalid-cacheability=") - 1) )
> +        {
> +            const char *p = s + (sizeof("invalid-cacheability=") - 1);
> +            if (ss - p == 5 && !memcmp(p, "allow", 5))

Nit: Blank line please between declaration(s) and statement(s).

Jan

