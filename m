Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A228E44E44B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225082.388730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTJm-0001OL-Oe; Fri, 12 Nov 2021 09:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225082.388730; Fri, 12 Nov 2021 09:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTJm-0001MR-LS; Fri, 12 Nov 2021 09:57:58 +0000
Received: by outflank-mailman (input) for mailman id 225082;
 Fri, 12 Nov 2021 09:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTJk-0001MD-G7
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:57:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ce2926-439f-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 10:57:55 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-eUqUkz_VOB-yC6oK1Q4G8w-1; Fri, 12 Nov 2021 10:57:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Fri, 12 Nov
 2021 09:57:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:57:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Fri, 12 Nov 2021 09:57:51 +0000
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
X-Inumbo-ID: 01ce2926-439f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636711075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EF+CkRbYwN02vUrJtpBRDo7aM/U7Qmg73EJhHAHKvU4=;
	b=aOMEmBU0CCVlJGVOxi/fjxVB5cJJU6FOowrFaFmexn6YKfgYA0iN9rhiGZRdNOHfOKNytr
	V4TJUl3+A/jiI4uXL+m4P+m9XgPN7wVCzCw7uVo8otsCoLtXnoIFm1gxhPZuITZ4IgzZbC
	oyyQDm/HfBq+c0wfKQH8YEuVVw1CFcM=
X-MC-Unique: eUqUkz_VOB-yC6oK1Q4G8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dwj0f4v6j9uNtBh6ndauxuNqW0AhceN2KyuLgru2SXDCiZIRPS5y6YGPWwQo+mtq14KwbmbGlroVR2RxEaC+5LQOLyupLmQfvlCpDtkfM+oOoAcWk86s7luIS8Vt20j83otqt4CD7IuwGDxj6ADfimMVrQkZzZpm9p6DgUFSwIVDXw84QhnBDko757S1WqiudBBmH12Rgoyn10YyLcRidApLeNOuHgbWt6tOiZjeZWTw+FX9X4XBCYYwNpz/mKokE4QVPLhvNzjRL7kJ8fKEHQYHM+n5PAx2SximvH9oDkcA6XliXTbybOhu/SeCKwI3z0PQ1gZhSYTDMJexOOEgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EF+CkRbYwN02vUrJtpBRDo7aM/U7Qmg73EJhHAHKvU4=;
 b=TG1Bt6ub0xszHRxtrMgdI88qETdgEKuNWOn7hpLEeTKk0kbLRhisvCbn1w7UdNxCiLeAApNfNcm3rYYrryTs3fPb4kYzaHV4+vTdH3J3trrhneVfDlXgxUhCZv9BY2f5TXJTHmNM53gQw9ImhGf+ZikrYMDhBx/okriYvgjHC1l+/x7hFdfMVZnLITc/avG0Kn64GfgFPIyfgxA49es+jpM2kuKp2WZ5B/uDQ62QRN4Hw30aJvLYSR4i2ooI7lzOuB4Tp67BQ24BM/g3RbOPdrkDlPI3acfViFX+iZ7m/pIyxkLTuQsP7rQfMRRcVlzFIU0FM3KTGTNCLKbmjkyw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6306ecd3-011b-51ee-65d3-107099b6dfa1@suse.com>
Date: Fri, 12 Nov 2021 10:57:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211111175740.23480-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e0e530f-1d15-4731-263a-08d9a5c2e465
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2959439C29B75DBF39E6ACF3B3959@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4sDDHS4SET+dZzawJ2UWx1UXr5nPRH+u8KypJLKr0CEcl1YGyzs2DQFVbjEpXCi5c95b7D+rmIiQb5GOSuNbn4Fnu9n5XdujeuO2VHI7x/uCtzITrr9PoP1oB7XnEW2GhsibO505Yr3wehV/ZVvV+a7X+GjLwcETAGAj/CVdHBhEVZ56wRmI+vl8ddrA6Jub51YPnJjlp1eo3VNgMNCt5aEqTutEYxzOGLs7pZXJ2IKUYxdabc1C1VfgXTk87rJrRywM1JwwFKzaiMf2H+MhTE+D/6TAZUP0GDr0eGlcmjJp5EYPyc7LZzCW8locBScCdrkbd2BuPyNPmbZduoHZs5DF08BkkmrZEAWB6am7r1au2ajtgNQ7ltVxjzlRAGbv6Zr0MJh9o/SUL51oaVPcvBoaRsWy3hfa01b5xPw4/wwzUqvFWXEDvVsd1lETgKZ8+PMjFniI5EVDcnwQVzRdpLOpzLI/MNr+6mp/vD8MYhNQEhFv1PY4GXSOhuFh5mPBcAHFme/Sp5RZtc+Ludsx3IPznwOIThy4dF8ATH7mvZlUjsmR2tYl/vAmNCTQNWo9vSHCq9UjUwIWB4+fGirIFKd+/lJY59hfJW4N1dF3BSTKW/pfVmzGherSlqBSUd53rpeBqIH9mZLcJh4aghYTOp4FpNB22J++EJj4UIaXiSnjPhEHGNCoafq4WnBBB11JeJ8JKk48JuMexOfjQmG5qnvDEufJn0SNaLE54D318/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(508600001)(4326008)(6486002)(5660300002)(2906002)(956004)(36756003)(86362001)(186003)(2616005)(66946007)(6916009)(38100700002)(53546011)(31686004)(26005)(16576012)(66556008)(66476007)(31696002)(54906003)(316002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXdmUEVramVRN2pnMnRSQlJ1M3lMY0pVWlZtbElIZmRxaEJaQWtwZThlRGxJ?=
 =?utf-8?B?cDFDUTlnTTJpUG5rbnBEU1ExeWxpMUxXMG81a3RHMGd5M3haSGZkL3ZHYzJU?=
 =?utf-8?B?dTN3OFVjSmJObVlPM3ZUcnFza0VZMGgwSTAvcGl6cjRrSkJKWUhia1M0RXpQ?=
 =?utf-8?B?bjVwRXFCVkx5N2RLSVdZTmpVeG8vYXFVbklkTGM5bW1yaWdGNldqS1ArWDV6?=
 =?utf-8?B?c1FhRjIyVzF4ZEQxd0pjY0dPaVJRcEpKUXFSVVFvQUo1MzdUd2t1Ty83NVd1?=
 =?utf-8?B?di9XS2tlSXA4VmRGbGhWejJNdFlGU2U5ZWcrWGJkY1B2YUx2T2UrUENlVW1Y?=
 =?utf-8?B?WkhlNVJrcytOZ0pRYzZZR3dJayszZ0sxS3Y0cFZ5SDdkeGRZM20vL2I0d1pO?=
 =?utf-8?B?SUhkanF0UXNkNXdKQUNHeW1sSElocytTcnhxZktYOTRzb0RWM0FFQW81MmJj?=
 =?utf-8?B?ZkJCNTd2SzVxUlNiZk1yUEdyZFRia2FPczhnMmlicnJHUDFzU0hLNElSVURZ?=
 =?utf-8?B?NmhEdjdBdk5JQW5PQ3VFd09ib3l1UEFuU0VuU1k1cHgzS3BubHdvdk14ZGJa?=
 =?utf-8?B?Wnkza0cwdzUxTnQxWE9BRDdacnpqcHczaHVoYVg3bXhnYkUrZ3h4SC9nUFVW?=
 =?utf-8?B?WnMrbHVzaW9HOStTdmlwak85Nkx1ZGtiaHpDRmlCdHAvUkNtY0YzalFlVzJn?=
 =?utf-8?B?aFIrWkd2M2hHdlA3Q0FXVGVSdE50aVUwSGthcG5LQUFoSmJiZi8vQ253c0tz?=
 =?utf-8?B?SysxREQ3L2R3L0hieG1MV0FiTWVCU1NGaC94c0lUd0ZsY3N6UzU5NXZ5dXMr?=
 =?utf-8?B?MVB3V05EUVpMVnpBR0dwdk51TXJMVUE3MVFBZFRSWGFLUUFSOXV0YUdUcTlX?=
 =?utf-8?B?RlhNcXhNSXlQekR1TmdpZWowQ0pFaFNmSkdqSWYyd052TjBnQmh2TU43dFlY?=
 =?utf-8?B?T2dlYnNsaU5TalVEa0Zyei9RUS9hRXczZlduUldKRFlkN0g2UFdVNzRtOFEx?=
 =?utf-8?B?Y01NVm9wVktudTRVbGZXZS9ydCtDSWQ1eUd4ZWo2cCtnK2hhcHJwMnJZVmdm?=
 =?utf-8?B?Y0ZlRkEvWUtQRVhnSTVFOXdJYmR1MUsrdXlDeE01akZ1dmtFaGtEU0ZNTjIr?=
 =?utf-8?B?OW9TemZjT25OUnM3NlU3eXhJY1pJVTdlWHE1TnRxeWJtVEFod0tzUnN2ZEJE?=
 =?utf-8?B?VDNQcXBLMFNGWUNhK2RtcmVtQU90cWVTK0NlTmM1YWxoakJOcytLalZqZTJP?=
 =?utf-8?B?NTQ5dWllZHVRVFEyUStHSThZUFI5cVE0WnZQUnVJcDQ5KzFBcjV1VEtoN3V3?=
 =?utf-8?B?VnNBdGZoZTVqYmIzdlV6eVFxR1ExU1ErZU94ZVFkTUk3VDkvNW9qSElTNXRC?=
 =?utf-8?B?K25qN0sxUm1PcmVOTkVMU1hiYmVKK3VRTEJ6Z2lKQUFMZzRRMzd0T2M1Ui8w?=
 =?utf-8?B?NG1QZlFmK0FwbWhGQ0lxOG81WlZLUXVWN1hWa3RWekVUbHBRZjZQcHlTUGZw?=
 =?utf-8?B?eGNjdHpSeHMwTGd0U2tad2pHZjVxbXUwUzdUYU9VZnV3WFVEUFJDVk1QbG03?=
 =?utf-8?B?MkN3Rlp5Sk5vc0kralhjelhqWXFtVjJBQi9TOGhBWDZ6K2k3eEw5d2Z2NDJi?=
 =?utf-8?B?ZW51K0Fjc0gvYmVRUW5BOWNNRWtEcGV5cEtYQWdoV2pmWjZpVVBWWHdPSVo4?=
 =?utf-8?B?SlltYzl2cVJSd2wyZnk0Z0k2ZnVKcERhZFJhM2F6QjhvVGxBWndlZTJjYndt?=
 =?utf-8?B?enB4V1FLai9HUnJUSSthNGgreFVlZzhBanl1L2ZLS2R3eDIrUldyanlnZmJJ?=
 =?utf-8?B?VkJqaEVORnNWYTU0STYvaTRGQ2RFNEVIdzlabGlJYTI0ZkZhWEIzeVk3NDVs?=
 =?utf-8?B?cFFjZkRQOERkbE01M0Q4M21DbHhZRU5SOEJsSGQwdVdtdGFnRTFZS1BtTzRw?=
 =?utf-8?B?bXNEclozdE5KRkxXc1VDRmlMdVR6RzFWK0hxaHBURmlpcE8yOFdGbjgxWFdR?=
 =?utf-8?B?RWlpVXZUUE56eUQ0aG9HTk5XaXNWVTlNVWM1VXUwT0Q1Snc5Y1VIWWg1LzBz?=
 =?utf-8?B?S3kxdzZTYWx2Zzd6NWFQajB3MDh3Z0FOYzJ3MHNEbFh0ZjVpL1JmVld1MTdp?=
 =?utf-8?B?Zm9MdXh5NWszUXJsWHFEZ3krMmF4NkV2TE5xOGJDWXRLc0E3K3EyUUFYbG1U?=
 =?utf-8?Q?3nNKiYvagvkivW+FijF4w5I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0e530f-1d15-4731-263a-08d9a5c2e465
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:57:52.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcFhRQCt9tmaHqd7XdzGBWrsoPtHiAQPb/P5e5EEYr848yDzEFnvvrmvSnBJugWN8hTgn5a/6vobc/QXZZttBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 11.11.2021 18:57, Andrew Cooper wrote:
> Retpolines are expensive, and all these do are select between the sync and
> nosync helpers.  Pass a boolean instead, and use direct calls everywhere.
> 
> Pause/unpause operations on behalf of dom0 are not fastpaths, so avoid
> exposing the __domain_pause_by_systemcontroller() internal.
> 
> This actually compiles smaller than before:
> 
>   $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
>   add/remove: 3/1 grow/shrink: 0/5 up/down: 250/-273 (-23)
>   Function                                     old     new   delta
>   _domain_pause                                  -     115    +115
>   domain_pause_by_systemcontroller               -      69     +69
>   domain_pause_by_systemcontroller_nosync        -      66     +66
>   domain_kill                                  426     398     -28
>   domain_resume                                246     214     -32
>   domain_pause_except_self                     189     141     -48
>   domain_pause                                  59      10     -49
>   domain_pause_nosync                           59       7     -52
>   __domain_pause_by_systemcontroller            64       -     -64
> 
> despite GCC's best efforts.  The new _domain_pause_by_systemcontroller()
> really should not be inlined, considering that the difference is only the
> setup of the sync boolean to pass to _domain_pause(), and there are plenty of
> registers to spare.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit without meaning to override Julien's concerns in any way.

Also a question:

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>      return 0;
>  }
>  
> -static void do_domain_pause(struct domain *d,
> -                            void (*sleep_fn)(struct vcpu *v))
> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
>  {
>      struct vcpu *v;
>  
>      atomic_inc(&d->pause_count);
>  
> -    for_each_vcpu( d, v )
> -        sleep_fn(v);
> +    if ( sync )
> +        for_each_vcpu ( d, v )
> +            vcpu_sleep_sync(v);
> +    else
> +        for_each_vcpu ( d, v )
> +            vcpu_sleep_nosync(v);

Is this really better (for whichever reason) than 

    for_each_vcpu ( d, v )
    {
        if ( sync )
            vcpu_sleep_sync(v);
        else
            vcpu_sleep_nosync(v);
    }

?

Jan


