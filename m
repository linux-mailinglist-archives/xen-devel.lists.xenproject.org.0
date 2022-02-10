Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1364B09A9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 10:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269723.463808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5tw-00080n-Ej; Thu, 10 Feb 2022 09:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269723.463808; Thu, 10 Feb 2022 09:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5tw-0007yy-AD; Thu, 10 Feb 2022 09:38:08 +0000
Received: by outflank-mailman (input) for mailman id 269723;
 Thu, 10 Feb 2022 09:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nI5tu-0007MQ-WC
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 09:38:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2625d32f-8a55-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 10:38:06 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-UqynWL_zOJyxg0VGlgjb0A-1; Thu, 10 Feb 2022 10:38:04 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 09:38:03 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 09:38:02 +0000
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
X-Inumbo-ID: 2625d32f-8a55-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644485885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5q6dxP/k7rShSl19FkBcKcwKdpKKn40N5IXShciDLY=;
	b=OaBB7SGRrWeJbCn94GUJ1+eQLLayG0Prwbhelx6lgXFZhDm07qvAOOUGPHNwYa+HPJ9KHQ
	4mZeiB5JM7KDSk+g3Np4dACgOpIEfwGOINkMQdaET8v+VyWPR1AxvmMq7jd7COaSBf0FnH
	l8dAvT48GvZ2ByxuafzmTsoQ2S40tgw=
X-MC-Unique: UqynWL_zOJyxg0VGlgjb0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7pVBWX9mXBzlqpTeBGTHWjikGptsKKgsJjVWa/zSRwgGiEOzmZScAGXpQruA/lmQv2u2tV9gkYmarkuOO0AY++9OTJwKLrRqIVfmBVrsiFrPAYCVHkqlOyWI7I2qKN0Hqdjhaf2QOqA8UgdStQhCg+fnKeJHy8SrnTXF6w3LW4P1Gjb1PXkySlfMNT0GIWdnMLxJFyXtWaRznWYCPi96EpU9bwhnZ2GF3rJGaKa98DZ5H8BsGVmivDjBJfK6NCFPkCoUPBzSO7YGhf8yYMdHgEyC3t1Y2l76Zs7XfcGEP3/rmCvKgjOlDfXB3nkpdMoEpneswJlMnqXTGxodjLnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5q6dxP/k7rShSl19FkBcKcwKdpKKn40N5IXShciDLY=;
 b=EnGshvLDUeTX2UY2Dv8rt60HESmQI7MyY1uqYWOo2LoKDpp+hWq0ifq+oqaSB5dl4vojEm2d/dETMmJQKOxtjEE/QeXVwRjxfGVUlSZ1njydib6ls28U4nsCRu8+rb3wASGiMEm61qE3sv3rJZRyk/IArFa76AZ1FU3gO/vDku635Y4c0JH/XsV5OrIol48SMOBUZ8b8VMYWjFIVqAVww/BSyk0WrOqCCV0k3tcS/hXOBUYQ3uXbQ/PhRlhFMu5KIm0IhyOQKUW+SapP323hppp83mqGcsGbhl8Ri+1M0iI7DR5QwqbHe8DPyZb3MAVTTPF4BTMK924iW2p+lU+mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a88f2f3a-5a6e-5f4f-dfa9-ce1f7121868e@suse.com>
Date: Thu, 10 Feb 2022 10:38:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3] x86: Prioritize low memory size from Multiboot
Content-Language: en-US
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <000c01d81dcae25e6f0irit.fr>
 <20220210084436.84-1-dinhngoc.tu@irit.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220210084436.84-1-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3dc8bf-39e4-49e0-b965-08d9ec790886
X-MS-TrafficTypeDiagnostic: AM9PR04MB8226:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB82269F09A836F14628A58B23B32F9@AM9PR04MB8226.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3BEYmEL1AXumc9CIeC5kV8L0hqlguNC1UWW/+eniXpC9xo9DUpaeWTUoA8nKcxQzD8AvZMLb7jfus2aTKCSVGqrAUb9cSsq2n7Mgdaae/ooa7WjQc6YJsIPM+ygCrRDOBgYku6AxAtExNBxILh3SXKwYo8L0oKETbS2koSeJo14kExNTTvktWRkgPK9sg3Ye3oB4Ao1k7iEDOn6QBZtsfINusV2ib/wj3OFhbSIFwDurXRKGHpjB5erw0+Ka06riCa/E+9RbsDOHC00Lv5PmK9W6p1SwQsjY6BTzIgwfB0KtzfO6WQJkFlrWLYkYAbhkqnCJY4yhp1q8UMOrX6iBcTqse2JHbBCO3k2TZO5RoTGtP/vpb8iLaJse4Jm6ujGmNh/f2F+H8n9Qct790vT6uO/+rgvfemwJ63alL6by7vF9tpTTF1nlDRz6LQF/u05vir/Xx41gWS3q+FPDTkx4LLbCYjDAXzSuU1A61vUPqokXD2Vrok9gtYHDAal+2Pzuxp6L6Acy2ZtEaPvDe8FBoZvI9rZTPQXQMhR665VP7+bxs5aobqXrQ0Q01m5GITQTiR5cUwlsxZWlt3tffkWBu/b3vycXaJByQ1TULm1T+Iy5Ckn4+9Hh4sf4BmtAAO//txSSXlYwfs3I9ECi/wNPHzHBouT1z91cawAkzeo1T5svsO/FDKHwgJZzcjFSKQ7pdmMAHJQppxhIfZ38+RUzUyJ4h+clj2q3do1+o2AphbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2906002)(54906003)(6916009)(6486002)(38100700002)(36756003)(186003)(26005)(5660300002)(316002)(2616005)(66476007)(8676002)(31686004)(86362001)(508600001)(66556008)(4326008)(66946007)(83380400001)(8936002)(31696002)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME1tb0VLS3ZvYjdQK1lybDFjSnBxenpHTndicFR6Z093NVZoUlIxdktQRUl6?=
 =?utf-8?B?RHROa0NqaUVaa09IMUE2MGNOWGFrekRtVFF3WGpudW5oeEV5Q3RXVXAzZ1ZQ?=
 =?utf-8?B?TGk2eE1JMVpmUS9VTHBoa1gzbFF3SXF0ejhEOVE5QndjOVB4S0tlNmtidDlk?=
 =?utf-8?B?MHYwNzVhcXVOOVgrbU1HM0pCRVhad1JwTnExc2RnWk9WdSs4RXYxWFhWSkp5?=
 =?utf-8?B?MHBud0RYdkF4NlNnRE9OWUVPbWdNRDlEaTZiOVVmK3RpeDRDczZZdGFLdEI1?=
 =?utf-8?B?dzE0d2MyZ3ZGZkRaYzlvbWo3V0lOcE5KNmFsRSs2VFlmZWFYU2I1aDBZT3FB?=
 =?utf-8?B?ZlN5cllteG5YeThoMnY2YmZoSmpWNmk1ekw0RFE5N2w4MlB5YWJJQmwySU1D?=
 =?utf-8?B?azkzNUFBL2F1ekRPS21nZ21jMnVKMnVKK0RYemduaitiWDlOSFNTZ2NQamlI?=
 =?utf-8?B?ejZQVkNVaEZ4RzVsV1o5d0ZPNmFuLzVwdll1NURjQzhEanp1Rm5WeTRUTlpD?=
 =?utf-8?B?MjUzZTE1bmZoNGg5RzREMDZTQ2VTcmRta2NaUENxRHM5L29kcENWWGVJU2lI?=
 =?utf-8?B?dlE5NGxMQU5VSnlJcXhNRDV1eTA1WDZ0Ty80TVRLZU9JOGxiT0FjNHpRS0Yy?=
 =?utf-8?B?NXZaTzQ5NWFIbXZNR3FvTkRmcndqWGR5cWtpckxmbjQweVJiRjVob2tDUlgr?=
 =?utf-8?B?d3ZMcTZpWnlYR2tsYVBlV1NDNVBtVEFRNnVXVVJuTXdaZE03dyt2Q1Q1N2p0?=
 =?utf-8?B?NGxJY0pLU1VwdnRjeCt6RTNENEtidE1mQmNUZG44MHVFemNNU0F5YjdOb2ZF?=
 =?utf-8?B?QW9GVDFmZXNROXIyZ1dvNVo2SjVqK041QXZTVTZiY2V5a1Zwb2RZbW40L29U?=
 =?utf-8?B?MVoxdGVNYkN6OHB4MXVXa0c3UEtmKzdDWmdHWm5rU3dXR09qUFZnWHJDYUc0?=
 =?utf-8?B?bWpCenFON3E0Z21DNm1INmYvMC8zbzZxeER0b3g0T1NWNmRRZzhraGpycDlE?=
 =?utf-8?B?K1ZLNWMzamFVQVdYN25vSEJNOWFwbkxsVXN3UzByYmlxVFFzMVcweVM3dWxi?=
 =?utf-8?B?RlF5TU5vclZPbEVLRk5zdmpuTElORTVIL3pXV1FIcTVXMlRqME5udXZEcGNo?=
 =?utf-8?B?akhhUE9DRVpTL0lING9zZEtXb21PMGtYa0xGRUZIajVaUGwzdHp1aUp5VWxn?=
 =?utf-8?B?aVRVZ2ZjNlVlaklBUzR6azJBVmdCOVFMTlBrS0pqZUlkRjIxWXR5RDhaS0FR?=
 =?utf-8?B?N2NQQ3U1d1NUUnRqU3hiTElZeEsrVU1WaTQwN2Y1NDVINVNHdWkxSGlzM0FL?=
 =?utf-8?B?a1owaEdJL0ZWc2xSM2QwbUV5bzQ5MTM2VlZYajBIQjlZR1JCRlBuejdBQlZE?=
 =?utf-8?B?YXQxU2l4TkUzNWVTS3o5bndGaTdqZW1KbE5oSnVGbkVscFNoOW5YdG8vejN4?=
 =?utf-8?B?Kzd0QUJvZGdDMXk2K3UySU93SWxQc2MzTU16S1V3TFkySHQ5d1VUMjkzR2dY?=
 =?utf-8?B?TUZ4RmZ4R2FsMmJkSzBnMFdKNGdYcGVMYzhxYm0zYTBZMm1jcHpzRUNuQlJ4?=
 =?utf-8?B?dDRGb0paSHRsWTZtVzNYdnAzZTNoVzJjRURSYWhGNGVXSldJbGJBZ0pFVFRN?=
 =?utf-8?B?RjJOb09aL014Y1Voc3FCMTBrZXBCY1hwZU9WODhiZkU0ai9lRXVsZ0dXcjJL?=
 =?utf-8?B?c0U0SWxZUmd4SzdvZ2o5bSs4OEI0cEt0SFc2ZWNQVzIyZ1hKY3ZRV1J4NzZs?=
 =?utf-8?B?QUVjMWt1ZWZxUFVzUzZTcDZaZ2ZwWXl4OHp3cDIyUXpmY0Fqak9VUVpmTVI4?=
 =?utf-8?B?Y3VIRnFVV2cwZ2JjV0lLUEFhV2p3N1N4MjcveWJyU0FyNXRqTHp0SW1ZUGxq?=
 =?utf-8?B?Qk1QVzV2YmZGV1JVNnl1Z0FUUmc3VG9QQXFGZHRSNk5HK21NWXNuWVAxNUx4?=
 =?utf-8?B?TncvaXkxekRTNEtyRWw3S1N3SGFtcEJNaVYrdktFbzFyVndUS1JldEtkeUZG?=
 =?utf-8?B?UkJyZDU3bVhkM1VGSDIrNmR5eCtrZE9BWjZCRTFOZERHL1RHbWVPQ1dNQ3RL?=
 =?utf-8?B?Q20xY0lUaUtvSE5MVmtqQ1N5L09zSlorUjBOYXRmQnM3Y0lFVnYwQTVNSHhy?=
 =?utf-8?B?eUZYMzdtZklDTGN4eHZYb1A4MXlLY0krUkwxU0NrQU5pbTRueTNhQ1BENzBj?=
 =?utf-8?Q?M+Ua77naaeQg4NmNrMvLBhg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3dc8bf-39e4-49e0-b965-08d9ec790886
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 09:38:02.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKl8FqXye+HnENXCwLxLaJwHudYTI7C2pUttFcgvdJnOr/15nn/d4UEngtdIUvGIanLfIxiG20m90hxoW9oFxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

On 10.02.2022 09:44, Tu Dinh Ngoc wrote:
> Previously, Xen used information from the BDA to detect the amount of
> available low memory. This does not work on some scenarios such as
> Coreboot, or when booting from Kexec on a UEFI system without CSM.
> 
> Prioritize the information supplied by Multiboot instead. If this is not
> available, fall back to the old BDA method.

You're still failing to provide information on why this would be a safe
thing to do. In the absence of such, prior behavior has to be retained,
and only the special case you're after wants adjusting for. This is
first and foremost (but not limited to) you moving to ...

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -524,27 +524,41 @@ trampoline_bios_setup:
>          mov     %ecx,%fs
>          mov     %ecx,%gs
>  
> -        /* Set up trampoline segment 64k below EBDA */
> -        movzwl  0x40e,%ecx          /* EBDA segment */
> -        cmp     $0xa000,%ecx        /* sanity check (high) */
> -        jae     0f
> -        cmp     $0x4000,%ecx        /* sanity check (low) */
> -        jae     1f
> +        /* Check if Multiboot provides us with low memory size. */
> +        mov     %edx,%ecx
> +        test    %ecx,%ecx
> +        jz      1f

... checking for just zero, when originally ...

> +        /*
> +         * Old Kexec used to report memory sizes in bytes instead of kilobytes
> +         * like it's supposed to.
> +         *
> +         * If Multiboot reports more than 640 KB of low memory, assume we have
> +         * this problem.
> +         */
> +        cmp     $640,%ecx
> +        jbe     0f
> +        shr     $10,%ecx
>  0:
> -        movzwl  0x413,%ecx          /* use base memory size on failure */
> +        /* %ecx now contains the low memory size in kilobytes. */
>          shl     $10-4,%ecx
> +        jmp     3f
> +
>  1:
>          /*
> -         * Compare the value in the BDA with the information from the
> -         * multiboot structure (if available) and use the smallest.
> +         * Multiboot doesn't provide us with memory info. Set up trampoline
> +         * segment 64k below EBDA as fallback.
>           */
> -        cmp     $0x100,%edx         /* is the multiboot value too small? */
> -        jb      2f                  /* if so, do not use it */

... the boundary was 0x100.

It was for this reason why in reply to v1 I did ask "Is the kexec case
recognizable by any means (including [...]), such that we could skip
using the BDA value in that case?" If it wasn't clear, I did mean
_just_ in this case.

> -        shl     $10-4,%edx
> -        cmp     %ecx,%edx           /* compare with BDA value */
> -        cmovb   %edx,%ecx           /* and use the smaller */
> -
> +        movzwl  0x40e,%ecx          /* EBDA segment */
> +        cmp     $0xa000,%ecx        /* sanity check (high) */
> +        jae     2f
> +        cmp     $0x4000,%ecx        /* sanity check (low) */
> +        jae     3f
>  2:
> +        movzwl  0x413,%ecx          /* use base memory size on failure */
> +        shl     $10-4,%ecx

I don't see why this shift can't be folded with the other one, by
moving it ...

> +
> +3:

... below here (and removing the one further up).

Jan

>          /* Reserve memory for the trampoline and the low-memory stack. */
>          sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
>  


