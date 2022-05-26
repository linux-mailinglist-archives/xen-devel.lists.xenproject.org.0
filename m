Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E284535174
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 17:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337643.562302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuFS9-0006jW-RA; Thu, 26 May 2022 15:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337643.562302; Thu, 26 May 2022 15:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuFS9-0006gh-N1; Thu, 26 May 2022 15:31:09 +0000
Received: by outflank-mailman (input) for mailman id 337643;
 Thu, 26 May 2022 15:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuFS8-0006gJ-LF
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 15:31:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc83fbb1-dd08-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 17:31:07 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-dm5yD9K5MhKnRmsJl_-Szw-1; Thu, 26 May 2022 17:31:03 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 15:31:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 15:31:02 +0000
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
X-Inumbo-ID: dc83fbb1-dd08-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653579067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W82GIxvujUZKFBMLSIORS/H4mpxmXUxgQqKM7j010fM=;
	b=KorI4h9vMiJZK9HxMSc+yK3+j90LespqCpZV7IStiW6lmFrHuqmlJIl88IDmvy5EM4Iw8x
	K9yo3oRrvx6Q4qW7adS/stukxamS8e3rdXisKKpgxrZXlljAcBIuzboXHU1ynyQTk4BM4r
	S1djPyPYQmWkl+9N2w+JxgQbGOurIX8=
X-MC-Unique: dm5yD9K5MhKnRmsJl_-Szw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpY8oyAdsLJnBC8/4DDlxqtjrhoy2WxMGfIZIfIwezSn1n+URAUAE+v2WFJfqzH6fhTtf0TaAOUQ1i5b4JO1t3PpmVIIRuEbcd4IBNHoojXAtxjFE36+kTIAZBmtO6sVmciplQIm1DmUlvQdcMtvqBDIK1TpQ9HARn5M8eCsN+QykuGHjzncjmNKKwAVlJi1UeoINRYDgMoq8xMD3ej5fJdPtvv0YtycgKhzWFdraMgZ1OfAQSgo+avQg4Fsw4cjhZmkVH9sKVpdFKS+jn7+E/uXXKsuarXhnVZA0nPgtB0cXJgNZtcP9hUXYIrU6jqMnTvUmAwC/FIBky24ofrH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W82GIxvujUZKFBMLSIORS/H4mpxmXUxgQqKM7j010fM=;
 b=Wx/V4t8oOy9OqaN0QwdSQl2eRIOgFPtD6XvG+MOAtX4zQUXgcVNJeNjjwYZbK3PWD0Ms/IH2nSfiISqiit+wPzuFM2Atop6mBap4DrTNcev6hH2B4bjiv3YDCUBwrzMAA/2DepXkNIHFtk1prctzULfefac1+qWcsSfk+3dFNpafFvQjQ3zwyoGkx/07k8PcyrjjSyP6GGfZ12bF3Pn6R3rj98FFykyVoBAaSdwjIRMQhKEus4fW7U4ZaJDyQNLZE77Pvb51+ZvAJgHBTr8Hqzr0bx6qL5RytZZQil9q9uOdxVqxM0HTspVZoI4ouk8ZrVH/9j26at/vL0Lwh6x7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d312593b-fbfc-b006-6959-c97a2bc6e50c@suse.com>
Date: Thu, 26 May 2022 17:31:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] x86/mm: Remove unnecessary mfn_valid() call from
 get_page_from_l1e()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220427140400.20152-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427140400.20152-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc35ad06-a96f-47b2-90af-08da3f2cbddb
X-MS-TrafficTypeDiagnostic: AM9PR04MB8827:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB882786DC72F5EE93748130D6B3D99@AM9PR04MB8827.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5GMQHjefHhNrz5E0QVGv+TW35aME7GVagkuPCZ72kc57mR1VY1rV9EiU7hQG/ZjW6LkXRCXJHlBZafCeE4P9BHxjd74O6PJetZ0dk+vuYlUs2Jm1IVpLpqPYfUf5GrufZg+sqYsBlwDN8QwegbkyGYJmDWRn8ryfgJWkU3TZAkx003d5WsRPhkO9NYUfIZdyxzY0/QU0q2VrRY1z5+74UJxnFfbKVuo5MSuX2C3FpfC4aDaddtPJyQJ8ZIkGARsRKpgqOfZfq8/aveyabZ1Luen+BGzDBINKS+BvWFQJsGyw2V5yUYYlhpXJIYvohDYlulezZg74eUqEGcHciwKxm3I2qrO2CdJBnAjVM220zbNWChNWmgPEklD7QIu42DZjrW6K26xUbtOkmUVVwqNg1Ek1jgSWaSH7nsAVEyok9fLQj+ssJ+LPtH645atoFLTmHxBETgncAoL/ZIJKFbsHoUOXGgXUyq6bIUgWnxnym+Sitct575fD6XQFWkZk4KohKGCBBSsR+uBzLSlGiQzHjHU7zz9iLPzMT+gZ+hgiNrX/8YFj+Se3xWK3+x+5lZom6hoi7pRHgp9V9cedeY0DLXFHsN10TXTjVNMLW/dmI3RXosNPFzAo18yVRc2IKtew6gJ7gTjtj+LTbC0lxEvsL0KU0fj++EfKKPEBA/pvfXC1CO8g0mhedeUyCnPwjh/MbS4TRb2eFH6qvVVuIG4nWRpmoKzcF7waJ/QslnbueA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(38100700002)(2616005)(8936002)(83380400001)(6486002)(2906002)(316002)(36756003)(54906003)(186003)(6916009)(66946007)(66476007)(66556008)(31696002)(53546011)(8676002)(6512007)(6506007)(86362001)(5660300002)(508600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djVWU2g0elZBNzVtdmp4UEdqci9jRkRFVXZ0eE9tVmMrWWYxaFBEQmYzVk5j?=
 =?utf-8?B?NC9GT1FBYXF6elR4czloOExLZkxWSkJrMHlwU0NrV1h6UWNuRUJUM0lJYnEx?=
 =?utf-8?B?eHBhMnpoNzE2eEkyNVg4bWRxVGt0cWhZV1UxLzFYUDJwcndJaERRVFRrMS8w?=
 =?utf-8?B?aHg0c2JCNUNpNSt5MGpTeWwvY0ZXSWcySjdwOHZ3TEdmQ3MxNDBMejAyRmZP?=
 =?utf-8?B?MktnR2xYRmQxcXpUeHlua2JOWmptWDQ1aE9xN1lXYXpaQVppbGlXY1RCVllM?=
 =?utf-8?B?K1RYUS92THVJd1czZXNIUXJXRXJyL0xJa3h2SjlURnNTRjVVb1hiM2JiVkVW?=
 =?utf-8?B?TW0xR2JHMEpnQ3JaVGg2bm8zekVkbzlQakpvZHk5ei9Qb1ZVdXdIcDYzb1pW?=
 =?utf-8?B?M3YwNmhOM0VXVXY2T2M1bGFFM3JwTHZXS1VCNThaQmhObDdteUMvUEkrMmEx?=
 =?utf-8?B?TldUa2JkdTZzSkFGTG1HRDFyTllyVDRVMXUxeVg3T2NZaGxiRFlHVzVPVzU0?=
 =?utf-8?B?UHdXMnM4UFd0UHhLVTZkU2QrZld5QjV1VGtsVXA4V1Z0Ti8wRmZlZ3pmaHpC?=
 =?utf-8?B?a1B2K3hpdzAvQnQ1R0VMS1RDaGxhRXozZEJrMnhKdTBjS1gwdjVtWk1kRjMr?=
 =?utf-8?B?MVRQY21kZDJVK1dJMVB4ZTZob3JJam9UNXYvZ0FYMFBIVFMxOXBQdUtZOTVZ?=
 =?utf-8?B?aEpnYXFybitRenBFemcwLzBLS0ZaNlQxYks5bUI0TFA2MU1yTmhlZ01UeTYz?=
 =?utf-8?B?a0dDS2laNExURHNQVnlVY0Nqc3RvZnR5cnpoZG5TdGdjMmh5c2puMFlYVVlN?=
 =?utf-8?B?cDRuUEtjbHJJU3VOamI1QUZzZS9DanVHYXVxdnBnYTh1a0pTVkI3T3J4QUsx?=
 =?utf-8?B?Y0RyQk9Ud2IzdjcxcnMzVGUvVHZab1BnRFNMZEhZNGJnRlJra2s3b1ltTnF1?=
 =?utf-8?B?clhTM2M0Z1I3VjFFL2x3cDVqMXV1ZW02Sm1abXlCakVwTWljV09nalhUME95?=
 =?utf-8?B?ZlBFb0ljdFpka2Y2ZnRHYzhUaFowTDdvYVMzUGdpZFNPb2pxVTE0QzZSRGF2?=
 =?utf-8?B?cldZOUJvQUkwZTBuQXFndExrZWpoaVFrUndLRzNrLytuWDZNeEVmMGpmZWxy?=
 =?utf-8?B?Y2FjQkZTeUc5UmNpcy9kVGs5amphSk1EcEFrODArNFdxYVVtT1Y1VjZ1Tzhs?=
 =?utf-8?B?Z3JBR3QwSW1pUHlvUHpwZ2dGWUR6SWp1Rk52Wkt3ZnBoZlVWYnBlQkNrMFJs?=
 =?utf-8?B?M2NUcDdyY2duZ2dBbTd1Zkx5SmZGbmJNK0tmMkttczB5WFZWNjI3bEduSW9K?=
 =?utf-8?B?SnR5YXJmOE9UVnlpT2NXblFHRjE5d0J2QzArS3pVM3ZwYkxqam0wazQzVit4?=
 =?utf-8?B?OUUzNWFhTWEyamhINEJCWVA4aExWOTB2TytsK0tXalEwVDBXa3ZJSjlkZ09D?=
 =?utf-8?B?Q2ZmKzV6bWVhc2NHQ0ZwcC9HOXpKcy9IdStXMVNZUzB3NVJDNDAzOVR0ekFM?=
 =?utf-8?B?QldFYVlGcC9wZFFqL0FvMTdrdlkvcDZQQk5OZU5yUnZFODRGTGVaWWp5NXBW?=
 =?utf-8?B?aFQ4VDhFR3lNUmdjSUNHNk5mOVFhYS8vUzBnYVN1a3pXdU5nUEFXelhKLzVQ?=
 =?utf-8?B?a0tQZVRUalhUUXpQWStzTHdyTHhNLzA4TFFsWWZMc2o1Z0t6U21QY3JhOWsx?=
 =?utf-8?B?ZTJRNHptN0RhdEU1QWkybjdENHF0b2RXYitsUEpBcmo1TlVXcDFrOFRDa1ZE?=
 =?utf-8?B?c1JvUlZNcUV3bkZrcXMxamhOa1RUdEtxbnRNZEZCMXJEc3J3RGNsVFRkdTc2?=
 =?utf-8?B?T0lENGs4VlZIa3p1N3RRcGtTRE90ZnBHb3VseXdyS1BmRFdVZXpjYTNZUnR0?=
 =?utf-8?B?Vjl0dFE0NVhCUFV3N2h1M1ViM2UzVHBRbHpaRGJwZHlkQTRYREJzUWR4Yk0z?=
 =?utf-8?B?MFcxemQ4TDBISDA0WEt5NzlwRDhJU1BQNHZqWlphL1FncEJTVm5FMURsQ2JE?=
 =?utf-8?B?ZG1sZzR6b3FDZEpFQzZsa0w2U0VWRDhNRkJrQ2orUlNFM2wvSFZ2SnJsK05q?=
 =?utf-8?B?aXlEV0diMnJHRDV3dXlGTUIweHVpS05oaXRyVWVTYktMZW9NVVFOaUFEek9m?=
 =?utf-8?B?VGp1ZXNyTmQ2SzlvSFF6cXA0T2lQU0tieVcrOXY3aTJYQnFDZFZFZEROWVZR?=
 =?utf-8?B?d3U2OHhxZmdxVm9DYXpXeFduV3o2dkh6T3VkZllvZ1RVTVhpZ1p1VWxCemFP?=
 =?utf-8?B?a3JrZGdxa24vdS9OYWlQbnU4UHZtckYxUXNGL2NpbWxVaWI0RmdVNGhKdjlX?=
 =?utf-8?B?cmNKSTFLSUhkSmd1QnE2RkdYY0VhY25BQ3krN0dmaldrbW83R09EVGJ0SlJD?=
 =?utf-8?Q?Q3Dcr9YHFrtXiw64ospHvLS08cKQ8t3fAirunB5++QJjo?=
X-MS-Exchange-AntiSpam-MessageData-1: yjOMKc1E5pEkLw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc35ad06-a96f-47b2-90af-08da3f2cbddb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 15:31:02.4146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRqjwZrkX5V81024kfb8vkRVvCR2uSK/4U74j6yvrppIyqNTutH7KZZ447r8jTXHWwIQzg1+aYVsrUJjBbtQmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827

On 27.04.2022 16:04, Andrew Cooper wrote:
> mfn_valid() is not a trivially simple, and contains an evaluate_nospec() for
> speculative defence.  Avoid calling it redundantly, and just store the result
> of the first call.

Since it took quite some time for this to actually be committed, I did
notice it among more recent commits, and I've grown a question: Isn't
the latching of the result in a local variable undermining the supposed
speculative defense? It's not as if I could point out a particular
gadget here, but it feels like the adjustment should have specifically
justified the speculative safety ... But I guess my understanding of
all of this might still be somewhat flaky?

Jan

> @@ -902,13 +902,15 @@ get_page_from_l1e(
>          return -EINVAL;
>      }
>  
> -    if ( !mfn_valid(_mfn(mfn)) ||
> +    valid = mfn_valid(_mfn(mfn));
> +
> +    if ( !valid ||
>           (real_pg_owner = page_get_owner_and_reference(page)) == dom_io )
>      {
>          int flip = 0;
>  
>          /* Only needed the reference to confirm dom_io ownership. */
> -        if ( mfn_valid(_mfn(mfn)) )
> +        if ( valid )
>              put_page(page);
>  
>          /* DOMID_IO reverts to caller for privilege checks. */


