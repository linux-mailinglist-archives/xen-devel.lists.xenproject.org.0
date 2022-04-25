Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54850D91F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 08:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312366.529575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nirnu-0005Ol-OT; Mon, 25 Apr 2022 06:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312366.529575; Mon, 25 Apr 2022 06:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nirnu-0005ML-LH; Mon, 25 Apr 2022 06:02:34 +0000
Received: by outflank-mailman (input) for mailman id 312366;
 Mon, 25 Apr 2022 06:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nirnt-0005LG-7S
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 06:02:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ae2523b-c45d-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 08:02:31 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-9P4aHIH3P4uSSssyD2f1xw-1; Mon, 25 Apr 2022 08:02:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5383.eurprd04.prod.outlook.com (2603:10a6:20b:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 06:02:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 06:02:27 +0000
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
X-Inumbo-ID: 4ae2523b-c45d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650866550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DI0mNHaVTQhsn0fbckggEE65l3p6hVlWm31IMwMt9NU=;
	b=WF11njSWtADStRc/2E00g8QuWHCpP51PKxWFunzGVDPl/dKrwnRmJ1I9itAe0ObpqnD9gs
	7KTJzqxWGm6Es50IJHaQShp7Ep4jjAOXm8WSLT6QYCs41G+/FCn71uuhD3DAdU7uZqhfab
	59O0581u0MAWDgWxVenv1R/VNpKvRsk=
X-MC-Unique: 9P4aHIH3P4uSSssyD2f1xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wf3/ZJBpMh1g7w8qsl3LiA/1X0VMH1FOstLu7j1bg2QY0n4JjeiF4KQ/Nc65KDl8RMQlwhG1BO8/bUA3D2mWxCzXE6CZHUJKl1gOhBIzZl0fi45JNUsPfe2rUbuUZelNhcfcuCQnaQ+gbQRHwJSNH1T64jp6RHr1QrN9AtIYomxBQ3AQuQrBq2/gskRIFGLPiEDovk5nMsDHb4DNf6bJqIpKEwAct7dEtDRIlHtkisMk1VcULFHWoJjhBLXVq5s+ByWFvGhGmW73l7svmFIpKETb17+jRdsD8SaFqnYkzHO1gAiGrPbiAvP4RfAkE9lp9gLydpWuY13XwoT3KECNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI0mNHaVTQhsn0fbckggEE65l3p6hVlWm31IMwMt9NU=;
 b=PyzANgPiFpVkOMVhdCiOWxS671zvrnotFOkzwZAOE6gudHLuK8ULrXAX6rUra3vzk0mDn4bjGHsJIc8YCUmKX2Gs7SgbEbKjR1hR2V6eZhi41uzfdx4OhlcC1YE6iQcUtllLBvUkfz8fk4qF1Lvhiwzmc6PHcttAuSfqpsCfrmQejE8/gHquUagxNYJSJ7Nvf23t2zNjQiauuH3LCPvx8glKBT+n4rrjc6b0X41vLWEOAHv4u6rbpxGbU89eVgXQKTfPgDs4DamQPsHvbkk6O5po7HcvemolIjN6N7FMNxILhrJHQc1gpybA+4Z7vrqrFiT6MqIJHkb7TXCCB9hejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30b1dc39-4572-2980-df09-0fd06c5120ab@suse.com>
Date: Mon, 25 Apr 2022 08:02:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/efi: boot fix duplicated index, offset calculate
 operation in the copy_mapping loop
Content-Language: en-US
To: Paran Lee <p4ranlee@gmail.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
References: <20220424144414.GA17868@DESKTOP-NK4TH6S.localdomain>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220424144414.GA17868@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0175.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7052b413-d28c-4dd2-8528-08da26812c9c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5383:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5383E1A2322FCCFB87887EF2B3F89@AM6PR04MB5383.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xFFqZQskFWB++g8ji0lLvfU4YvkyNwx7ZNqTQLiQVccd7c/V7enBiv4b0+YFu+Jg+D2h3j7Q8kCS4pCngdpY42fIwZdNHORsLNh5oTw3mrjuWe+o9n5Dbp2Q0mSMLTttcP+WgaVKB7ufN5YpNvHoqd2AInGchRcfMJUuZPCiSvZETZ8mdaK45Kjq+Gq2igUmV52eBotvgIPZH9qOfz+4ZsnnUJIs1qTSlfYVIQWY917nlo6kh/9eNY5qfb4O7bHSdkGzXU6WAnuxqsUQUhubndpiJ0UrYdAxxAV0kasEyiCa4hChgaWGZ0wfsD+2IcgdvP3VZU8omDbemvMv6+BIdQV+MQ6ZEoOdhH0rC7cUX9hTvh5JDPWDdCFg/IjAW9x9uXtPzHI8CRaEOsufiLczpq0s+D6kcTC693/zm687MTOhosVvO7LQq1DHXOoUTtST0cjlsVqSgRJn4Cr9tAOBwILRdJbnJbhKyM3vlEU0ruCvzka0/gp2QoWA6OM1B/QHT2IqoU/VbKqJTMTKChYLp9mcgRhZzdT/OQlWfRtSniAU/AAeJMv2Dmo2PAdqJKFp63UublhtiMbZtb7Mna1dGPbD9tVEANcb+uZDypmd/WAXpaRClVrjwAg3wBiQ1bUZlstQLa2zMt4w/jaw9K26uAmYmIgxXRy1jx0tbhAcAp8GXf9rxewsW8d3D2vtQUvLGWRf4R8ozXbhhj7hSiwY5LSR88wXjIg09mbKguIe6KM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(31696002)(86362001)(186003)(38100700002)(8676002)(2906002)(66556008)(66476007)(4326008)(508600001)(36756003)(31686004)(66946007)(6916009)(6512007)(5660300002)(26005)(316002)(6506007)(8936002)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWNYcU9wTnhFbkthMUlHVHpCM0tVYXlTclFSVGFrUW9QT1lPOGw1ekpDdGxv?=
 =?utf-8?B?cit0aVdyUkU2Y25lR014Zk54Vkl2Z0ZQLzE3RXd2SlJyOGlzcU1MK1NIRGhY?=
 =?utf-8?B?NEo2ZytVTzZMODN4M3RMMDl3Y0dLbWdzdXJocU95dkpjRFZvMCt4WFNDRURu?=
 =?utf-8?B?bWFmck1UVnZvTERiY0dCYU1qK1drVnJPZTJMbDNDNWg3cEFXb2h2enEvRGFX?=
 =?utf-8?B?b0VOMS9XSDNLNk9pMFlWeWlhVFNRRS9jU3JKcmE4SVF3T01La1VmbVBpUTFY?=
 =?utf-8?B?TmF6YkRtd1hIeUY0YThoNnpTTDNHSDZlUjF6dXBjQVBZVEJKdklTcms2cVZp?=
 =?utf-8?B?Rm5panh3eUgxMUFRcG92QzJmbXRVUHdSbnpFdDE5bjREUXEwd0Z0US9kU1Br?=
 =?utf-8?B?dWR5eHp5SFBYL1F2bHJMemZpMDJaU1pZUFZ4WGhCVlRsWDhTWTdPbDlHVkd2?=
 =?utf-8?B?R3lOdmtrZHFMakRZRGlTZnRza3BjcisvTjkvenpNczBaUnJSNy81RHlwOWI5?=
 =?utf-8?B?MURnbjU0eldpMkdnMFBQMlgycUh0ckFnbWVveFhDb3ZrUGxlaUtjZFdVTkdz?=
 =?utf-8?B?R1BqYlN3SmhrWFlENXc4Q014akJSMTIyWEpQMGEva3Q5SUhEYkVmT2x0Rml2?=
 =?utf-8?B?TDdMeGZ6QkQyNnF5c3dmeitmUytjeXo5NEFvT0o1c1lsL09IcFV4ekRYWVZR?=
 =?utf-8?B?VmtMbHF0UTg2d1IyWlpZZ0V2YURlVDVoekRKYTh6bUZ1WGRua0Z0alg1Nkth?=
 =?utf-8?B?WlRVZDhHemVWODlCM3Y1aTlyQm9uUW9Pb1BrYkpKSXlicmRDcDNabHJPaVRm?=
 =?utf-8?B?SlNQdUJzTmlwTlBJTkJXMytsbEhqSklPY3AxMWNjUkVQdXVFcGZudmxjTVpz?=
 =?utf-8?B?OExPNkZ0Q0c3Z01OMXZmK1dMZlYyZzU4SWlBNVVPckw0N1BIdmF0QUUvbVZ1?=
 =?utf-8?B?MGZTZFNlY0w4VUJlN0Z5bGJPeHdiSFEvZDl4b0tPY3EySmZpWkZuZnBQb21E?=
 =?utf-8?B?TFZLT3JkdGlaVkRBVXlhRC9qcTBkSDlmZG5JTFJtQXhZRHR1V3l1ZEtob0JN?=
 =?utf-8?B?MTdvWVdFaWlrODNpS1ptSk5rRTJwaWdYR2hFOXhzR01Wb1E5RURpc0U5MlpI?=
 =?utf-8?B?MFhvaWUzNGlpTGtwZzg1Z2FiaUpPU2lUVkdpS240WGhTVXBRREt3MlczbVRy?=
 =?utf-8?B?aWtxSFZLMXBmUHBhZDNhazg3WXlhRTNHWU1DRWFnb21BWUVzSmwrR0ZINXF5?=
 =?utf-8?B?UTVVT1pTYWN0aVgxK0s0a1VvVWJlZDd1cWRxUmJhZW9oQmN6bFl0MFJJbktz?=
 =?utf-8?B?dWl2dXhaZC9VdTRjcmdIZzdEVkY3Nk0yMnJQZk90MndVU2w2aVJHYkZxK29F?=
 =?utf-8?B?VThLVHhKRVN3Q1RXdHEwdkQxcDVwWGhEZGcrUUx2ejZPUjZDNGNReVZuYXhY?=
 =?utf-8?B?OWd4bEdxZ1NsZ1JhNHZTUmdsb1BJT2VNb0RCaFkrM0FyZU9Sd0NQNWVvUEVt?=
 =?utf-8?B?blJ6UXhPeXFUU1drWkF1YXpsOFNkSUhkK3RsVlJPZC9sbEdwZEY5WFJWMFVU?=
 =?utf-8?B?N1BxdTNZRkFaZUNjQmNTZkJzYXZFVjgyQlY1RGJHZHZiQWt3R0pKbnFxZjhC?=
 =?utf-8?B?clB4ZUhsT0hNbDhMZW9hUDBabVVWaUxpSThxSU54a1dFM1g3N1BneXRaZStK?=
 =?utf-8?B?S3UyWlRIOWErVGZVWndTQ3lRRTI4QnVBajZuVVpMWEFmbHNzeXVwaDJnRUFZ?=
 =?utf-8?B?YkczM0tnb0k1MDV3N2l5WWZyZ3A4a3JVRVd4WVpwdnBISmtuSkNlQ0hTM0RW?=
 =?utf-8?B?aXczWXBla0M4aWZEUHZXenFnZVFqSnpUYXZVSE5DVjlKV3JGZE1jdmhvWkhm?=
 =?utf-8?B?a29Xckg2TFBmNFp0ZHhYdW5WOGQxTFdmT0pBU1czQkd2TGV4eUdWd0Q3MmRu?=
 =?utf-8?B?dmRwcWRVY1hHT0FzRUZHVDJYa3J1Skc2bGhMcmFSbXNLQWYvc3prUVdlUk5S?=
 =?utf-8?B?enMvdWR5STdwR0dkRmZFczhJZERZOStGdW5Wek9IaGd5aVB0VHZ0UnI4UENP?=
 =?utf-8?B?c2FEMU5TcmtzUy82QTVLRmllSVBDdUJ6QVlreVVmOGViZDVrSm5jRVVTTHlm?=
 =?utf-8?B?SDgzUTd3S2FMMmtZcjdtdEVrM3BJcXU4SzY3Wm10eklyRkFuMG12NTBkdTg0?=
 =?utf-8?B?Tm81d1hFM1FZcGhPNERkb0xEeklNVkovMUxUWkhxOW9mWTJ5bUw3ZXZkWDM2?=
 =?utf-8?B?ZGN0eWY5MHVkM2ZLOVhGNStIckUyZkF0akNOaFA4RlFSWEZaZk5KWFF6dnNi?=
 =?utf-8?B?MkdOZnVFc3hMeEZlMGt3TGVrVkVpck9PV1dOcVBBQ3ZsNUJwRmRKQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7052b413-d28c-4dd2-8528-08da26812c9c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 06:02:26.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTXaCq2KWHxsFTmMVnDb5PuLhNVoBUNjSKABckjU/IjMhX8A4DUAd2ffzfM6tuCuA80FIW68JfAN+Md6cPsHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5383

On 24.04.2022 16:44, Paran Lee wrote:
> It doesn't seem necessary to do that
> duplicated calculation of mfn to addr and l4 table index
> in the copy_mapping loop.

I'm not convinced this is an improvement. If the compiler sees fit, it
can CSE things like this, but it may see reasons not to (register
pressure, for example). Furthermore ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1470,7 +1470,9 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
>  
>      for ( ; mfn < end; mfn = next )
>      {
> -        l4_pgentry_t l4e = efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)];
> +        unsigned long addr = mfn << PAGE_SHIFT;

... this isn't 32-bit clean (we build EFI for 64-bit architectures
only right now, but this should not result in there being issues if
anyone wanted to enable the code for 32-bit as well).

> +        unsigned long l4_table_idx = l4_table_offset(addr);

There's no reason I can see for this to be wider than unsigned int.

> +        l4_pgentry_t l4e = efi_l4t[l4_table_idx];
>          unsigned long va = (unsigned long)mfn_to_virt(mfn);
>  
>          if ( !(mfn & ((1UL << (L4_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) )
> @@ -1489,7 +1491,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
>  
>              l3dst = alloc_mapped_pagetable(&l3mfn);
>              BUG_ON(!l3dst);
> -            efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)] =
> +            efi_l4t[l4_table_idx] =
>                  l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);

_If_ your change was to be taken, you'd want to unwrap this statement
now that it first on a single line.

Jan


