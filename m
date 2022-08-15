Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A65930D6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387536.623836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbB6-0006G4-1s; Mon, 15 Aug 2022 14:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387536.623836; Mon, 15 Aug 2022 14:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbB5-0006Ci-VO; Mon, 15 Aug 2022 14:34:51 +0000
Received: by outflank-mailman (input) for mailman id 387536;
 Mon, 15 Aug 2022 14:34:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNbB4-0006Cc-0r
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:34:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4d91de-1ca7-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 16:34:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5884.eurprd04.prod.outlook.com (2603:10a6:10:b0::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 14:34:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 14:34:47 +0000
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
X-Inumbo-ID: 6a4d91de-1ca7-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7Zu3etebJrV8jd1fw+iWoYna/zPjpAgP6ag4NQCqmtLtiGNcg7E6qZF3EArJjf5MM33A7Pc+kqqklROdZtLiMG5wYNe7c7dNQslJPI5EDlRgH82w9jcfwjamlUH1gmoLJdS1hhnVZtvA6bPR1dj0k2XNsMk6ho4caT5FjX5DxJipl309pyjNLbBr2ZqJII2Oc8DwSVWQaWQ8HOnp44IL/8xJDZ4PfrgHswkwCYz8rwBqoRqrytwwxg5cKiv2/begHmTPrSaNVaLnnKdSm5U3l/SCRFNJbmOWKy/fAI//DUEMGAb+QF7jV/sJT6AOkYed4E7m/1rY/gd+eaUWiU38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgMuU5/YNSyPZxwYiJMHVBD1qLPEOFOaXITD7jC1Fng=;
 b=Zik0cZFP5QQl3qVZkhaqd2sbfGnTkT8X3KFv6V8AdDa83oAgXJAsbi3voJ/ngFNK33KAnaxB+pX18qSy3Ah+Oa+S89LFqn6+GyW8ix0A2O8P3P+YqseBstHvf9Rl/M4ivcrw8n3Z8KwgF4FN0aZnCpEHYNtTHqPD0U786pGHq5voZu5RUpcrrvQSMrZW3KtC6pfBDaojbyeCtRx7TCwVZ5CKOsUIu6P7tflV5ej/AbF2SKe9UQlPx3AeiN4/kVbSlm/9nQCq4TfzF99wzAmu8xTPgyphNGjRauLyaZW1EwFstXmBf/v0sFYizPaYtMgnfT/m2+jpEvfGwdCytDNlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgMuU5/YNSyPZxwYiJMHVBD1qLPEOFOaXITD7jC1Fng=;
 b=WpMg9kPWqf7ybnBfZkL3OfzDqdTPDtukiOZt+Acpz3BoYfJT1quLJTFyi06b8cmuy04IDmCobzooTP5HrIgJM6sHyjPgVZluD8TAxjq8Kwtz5mWettBfR1NE3c1qTrG1oFrP2SNHnSM4JXOmIfr6yLTwwYw2+/xujRQpFAyuiwzQZu5ymS/QlN3K9lJLqWxH3P1LUYpB++YkyEmF4ALno+fPvU4Q68OpjBQVpqHxAAPAZJkQO58DgjGaAdNH5MN67UsuHJXjqKmw0nH3+pOysnpNsUkIY3fBKaToi+6qEB0ApKBxVPHe994kuhfw1wc8Ic38shnbjUJ1fKv07JNCGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9dd6cb04-30fd-aaa3-5afa-02c4f3264f97@suse.com>
Date: Mon, 15 Aug 2022 16:34:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/13] cpufreq: Export intel_feature_detect
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-4-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220810192944.102135-4-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea4f803-4370-4204-e4fb-08da7ecb4dac
X-MS-TrafficTypeDiagnostic: DB8PR04MB5884:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EWwHH23FJfeMY0Q4mIrmxPMNhW1d6DxlGxwpvrw7fxNa2pgAhn8LjQNfIBdsPZ/YdXDlhQCmoAYl7UX68opGTSd3qco/zrdO5XSXB20R4RSC9PjoYNO1kTXAZ6LAiIT1i6Rs8jWU9HvR6HNhKWo5eK109y9QHgn0Tw3hO11QyRdLIGTRzocAMj9nKUSAFprdNjSbEDjugG28Mtx+k7lGh/FO1BUE4eYgRzks5uFtfil3Peq1+h+OeXLfG1Pl+pjMi27AqSD+HdAVZ0p77EJ/M95DblBYcV/FDjxgGZCC9D9S3/mbg2MOYEMAINEtNXJ1ThH9qdnG506q2cTSl+MSZlYryHAIfVCrdhkO8mb6D1HAzTsiQOp1O1uXlFfgi6mi0u0MD65WInWye0p2aN5k6VjBoF0J1IcDKFmfiuos/acqisYfZCn2E9yJbsZj9g6Pb/tbtGgxuiYBo6d2RAK/LQcowS78seqo2Qolavqn92Ety6/G08ntKdcQr0HAbC8dVNhWuAIlKfzdh3s8njJR+xF1leuY/Ehmui0ss7q74b0EQ/M0gWXo3Fqt9QdGhzgxixzATcCD1Xb3ExlUVHFFlmKaKCpY/7e7A81jFIZVuF+rUjoj73dEZSCoUg7P7g1X4qxoxe8PjP/t6WHvB3ALMB9zmZUGgRS1zNN/Q1FzoES7WCUxkei9VHihusl2m0mSg0XbcVWnRhMPgf8uVTb9Cg0/8Lx/Y47K6KOoOpcoKbuzpJy3AVfPvEW0EemsEr/qTG6yequpmyC0f4AnLwveKgp8cdRlqye5QSPvAW3pADWcb1WkxirbzRf+qUGUnsoFdYaTYiy9YU0SI+mxDZbikg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(376002)(136003)(366004)(396003)(66476007)(54906003)(31686004)(8676002)(66556008)(4326008)(8936002)(38100700002)(6916009)(86362001)(66946007)(36756003)(31696002)(478600001)(53546011)(83380400001)(6512007)(26005)(6486002)(41300700001)(2906002)(6506007)(5660300002)(2616005)(316002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3UwblJxbWhOZW9zZzJXbkd4d0JhVHphSEhkV0ZkdmRFNlFwWGlsNm1SK3Va?=
 =?utf-8?B?d1Fma3BXS0hrTm9RTGVyVjcrRTVZeUlzcTdCUzA3SEJlNEtjcXNSVnY0TU1m?=
 =?utf-8?B?QkU1NnhBWVYrTUIwaGdnUDg2UGZkVTZQUnFNbmhzQlRyZXlCU2JhUkg1R2Yx?=
 =?utf-8?B?WDBrcy8reHJqU0Fxa2VKeVVxTkE5dDBaa0x0ZmlrOE1yakxwb1VJLzh1MGhl?=
 =?utf-8?B?RlBtMzZSdVM3ek1VTGFqSGI0U2J6eFRJNUlXM2pnZnE2VnJkZHdGeTNxSm9V?=
 =?utf-8?B?aGtvVVQvL29RaEMvRHJSbFVwN2JnMVdUTEZlOXdscWtYdmRkUU0vbjRZbFdy?=
 =?utf-8?B?MTdRUHgrSTNjTzRCM3lqa0szYzJzNGxtckZEKytuT1NCMnlBWG1EdEdZSTZn?=
 =?utf-8?B?bFM4K0l3UUxycjJuN01TTyttSncrUWRGaTU1Yi9IZjVydDE0MUtRY0xFZEMx?=
 =?utf-8?B?NGx3UUFhMzIvdUV4eVpEaEdxZjU1NGEwQnBIM2FORGtPNWZoQnExcC9wZW9o?=
 =?utf-8?B?L1Q2Yzl6RUpKQStpb0hUVUs3amJDYkY5UGVxSWErN2RlT3pOYXUxbDE2d3Q0?=
 =?utf-8?B?c0h4cjhKT0ZMSXlGT3VUcHZJMG5jNDEwN3ZkZ1Bub1dlRW02elpMQVgwMjRi?=
 =?utf-8?B?S29lRS8wWC9kcG9OSHJjVWsxMThqLzRZMlJlWmhBcy9ZZndHWmk3SU5GRDFS?=
 =?utf-8?B?Zm1mWGtYVE9SUkZ1M3BYZVhCMWw0UUFrcjAydzJHSkZ4TTFkcjJmdzdkYTVL?=
 =?utf-8?B?U01TY3FFSlBpbU5Ya1I1VTZ3YzlxOWlMdGM4T0x5aENuamNRK3YwRHd0aXkz?=
 =?utf-8?B?d2IvUUpXYlJiQXBGSDBSdUt3anN2Y3VPOEVTd25TbjBqMjVJRENWWDZoa2Z5?=
 =?utf-8?B?dGprRFhKMWhnSnh1OTFWQjRIK3h5b2lCYW85eldRV0xVb1VxR1hEb2IvN1Fz?=
 =?utf-8?B?MmVLLzZkRUg3WmNyMW5ZTEwybnpmWXV6Vk51cG5yNk5oUHpVeFJWMG9IbEJ6?=
 =?utf-8?B?UG1SVnhiRndCVWhsdmZuY0pzUTV3NlZxMlZla0tISkRHbHhvS3RrSkxreXFo?=
 =?utf-8?B?MXZzZDNZWXdhUFNMeThoQWNEY1hDR0VVUlI4WEJWKzNqbytPenI4emYzZlB5?=
 =?utf-8?B?cTJPcFMzZy9pV1B3YTVObzk4OENQYW54UDlaZDNpVGNZaU1GT0NCeGF1bStz?=
 =?utf-8?B?R2Z5TVFWR20yRXJTaGREVTBnQ3FwR1JuRXVOMTl2dzI1UU5WNWdzUmlaaXNh?=
 =?utf-8?B?U1l0ZGdMUDRLVm9yd0xjQmpDNFd1Y2hnMERmN1hIcVFhbnRsY1pFN1UvRUFY?=
 =?utf-8?B?ZVVBU2ljU1hySVJzTGVmdUt5WE1jS2o1a1IydmFsUlVMZHc1NWVMdHF3WG5p?=
 =?utf-8?B?RHRBMk9ITjN6bXJuRWxucGwwNU8yRkFPOW5XWldDTXZkbUVIaGd1U0tFemQz?=
 =?utf-8?B?R0pLUFJxb0Vwa2lManVMT1VFNWpJdlQ0UzZFOE83UmNUVm93UjZYRGx5b3VT?=
 =?utf-8?B?LzRsck9JcFpwTTRQM2ZqYWg3dTFKTFNkY3NQNHBjSzlCL05XVjMxeWJSMUkx?=
 =?utf-8?B?T0Zjd0I1UjhEN3BpbklpVUNEME53YlBZbXdqZ20xK1lvMkdVZXZnbVdpQThn?=
 =?utf-8?B?NU5WMjA0VkhQanhiUmpyN3RQb0lnV1dCSkM1alF4Um9sTm9xcVZXdm43cmEz?=
 =?utf-8?B?RXRXeUttczliSDY1cmk0NHhCYTN0OHVEbkwxS05CM2VkbXZXTHNOSWJyeFBr?=
 =?utf-8?B?WDIvQ3A5VlRNOFZyamk4Z3dFMVlnWnMwVmVDNmM5THFabXVCZlhhY2lSQW5O?=
 =?utf-8?B?SnFjUHBBVHNUZ3BWSUdHUXdnQmh6bmxNY3VreXVwaVp3cnN2SkxmQkR3UENu?=
 =?utf-8?B?Ti9rVDJudG1lS2RUaklsLzV6VmxabGYxeHFSekpIalgzN3FEdUlVTzM5c2sr?=
 =?utf-8?B?NVhVbVExTnV5T1BwRXYzUEoxcUZGUDgvdExpR3EzNk05SXZCbVFUTmphOUtL?=
 =?utf-8?B?RVVtQ3ZvSEdHYndUeloyUTNPcXdrd3hYc1lXNkVzYmk2MzBVR1BzeGJkaDg0?=
 =?utf-8?B?bnpFUEY0d2hMVEtIVEh3TTQ4MUFySGRGbkMrTDY3eU5seU1IL0J5ak85NDk2?=
 =?utf-8?Q?4jOjS1fTP/ucpdfbHBUx57n3Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea4f803-4370-4204-e4fb-08da7ecb4dac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 14:34:47.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+fyfbTx0+leJ/18kDhkxp/O4R0NS8Kl46zLCXGwL1cxrwyK6mHGGDU6Y4bIG1IstIFbfaQCTzyc+CcGnKZ6xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5884

On 10.08.2022 21:29, Jason Andryuk wrote:
> Export feature_detect as intel_feature_detect so it can be re-used by
> HWP.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2
> export intel_feature_detect with typed pointer
> Move intel_feature_detect to acpi/cpufreq/cpufreq.h since the
> declaration now contains struct cpufreq_policy *.

I don't mind the new placement, but I don't follow the reasoning.

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -340,9 +340,8 @@ static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
>      return extract_freq(get_cur_val(cpumask_of(cpu)), data);
>  }
>  
> -static void cf_check feature_detect(void *info)
> +void intel_feature_detect(struct cpufreq_policy *policy)
>  {
> -    struct cpufreq_policy *policy = info;
>      unsigned int eax;
>  
>      eax = cpuid_eax(6);
> @@ -354,6 +353,11 @@ static void cf_check feature_detect(void *info)
>      }
>  }
>  
> +static void cf_check feature_detect(void *info)

This function is invoked indirectly via on_selected_cpus() (hence
the cf_check attribute) - I wonder how you get away without that for
HWP. Or else why we need this as a wrapper here when then you'd have
another similar wrapper elsewhere.

> +{
> +    intel_feature_detect((struct cpufreq_policy *)info);

Why the cast?

Jan

