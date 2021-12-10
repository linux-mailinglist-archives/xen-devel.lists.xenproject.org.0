Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F173D470621
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 17:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244060.422214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvj3P-0001sl-HR; Fri, 10 Dec 2021 16:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244060.422214; Fri, 10 Dec 2021 16:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvj3P-0001qO-E7; Fri, 10 Dec 2021 16:47:27 +0000
Received: by outflank-mailman (input) for mailman id 244060;
 Fri, 10 Dec 2021 16:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvj3O-0001qI-LK
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 16:47:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da5717a9-59d8-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 17:47:25 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-zai0f2OPNsqvYDDia0WxnA-1; Fri, 10 Dec 2021 17:47:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 16:47:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 16:47:21 +0000
Received: from [IPV6:2003:ca:b712:cc7b:8ccd:cae1:f50d:112d]
 (2003:ca:b712:cc7b:8ccd:cae1:f50d:112d) by
 AM5PR0402CA0021.eurprd04.prod.outlook.com (2603:10a6:203:90::31) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 16:47:20 +0000
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
X-Inumbo-ID: da5717a9-59d8-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639154845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OoT8J65wdTJrGjWj7O5wKytC5VIw/mqui75K01BWofs=;
	b=aCCqzYkbWY0z3BsuFXCcFStkTZWHL3Zl3HVNN1frVMZuV/tBq8WlvGEGEVvi2I9MFajtuE
	9c8rGo9Kbxb+CwD8e7nT/Ljx/5SkOgKkdXU4gYjobTOEJoGBcfDsmYVVlFTIMNeRAuYgKx
	l+N5ABy5Kkdjldk71RONL9by44QxW2U=
X-MC-Unique: zai0f2OPNsqvYDDia0WxnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a01D+cUHheCs2ZNGAAMaum/jJfCm0hr/ukjpi36ZCpUpuw7DLGdmW6FWSZW7NpbuFsRTR6ge0zqhEjgvULXD+lhfb0Rl4v4lfVqWLfqBpD06Eg8F11MtJnsUOwpZEnDHlGtgoQHNOONNJi0aQ7wig2Y9fa65I93eriFvuYA31YT6bSw3m2XRWV12THNAVLjmdnu9NxIT4Fn0BxkX6OGotE1WtJm3Zs4bHBlfTF0RT+jLzn6eL4RSB3muzH/jxMJjcg3kfFgAORKYz0FIS3+XLhcGqY8pPrYA55sQdNOojzSUjVY3lZTHDRVcZocje/7cjV5KrR5wKwPLWmy7ShqOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O54XzNz6VIIfsiZ4FsDIUDFLH3VGBKmwPcLZtpPVZuY=;
 b=F0wnHUBtqLzJlfF1DAHhgs+o2Q0fyEa3W9EwxVsNBRS1dpi0ooW8CKg96D2eeYmTPvSuv7bNoyIqxZtI5c1jnzE8xuGS28GE8m6BdkeJmOo5Fvj1mV01NtgZVX4e9nlfXF7/gq03BLKHyYhBkY/isKIbQKkMKXgrItAaURYqFDEF/MbrqT9+tu7dt4VjXm4tgQ/lpkpg9GWz74iXDy+p1apnKpXnJXFW+mt7U3yM4zLRuCH3iZnMkIXm1KmqZxrNDLgoxvLGQFtrYkzFkkpDqdsFVWIvuKTOlDgfxh0h+ye1CfZZkPipu9j2luRlBarTaarQ9vugcjS6YOFr/WgVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <712b731a-948d-d341-c33b-b8a446ee4b95@suse.com>
Date: Fri, 10 Dec 2021 17:47:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 63/65] x86/setup: Rework MSR_S_CET handling for CET-IBT
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-64-andrew.cooper3@citrix.com>
 <64b55cdc-484d-5657-e0af-3462ebadd09f@suse.com>
 <d50d9964-b80f-d46a-49df-90fe5f29e2d3@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d50d9964-b80f-d46a-49df-90fe5f29e2d3@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:203:90::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21e83cfb-496b-460b-fa3b-08d9bbfcbc11
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61767513870AAFF8F0B6151EB3719@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uSLgMWMlYLWwoaWhZOUtuGKr3hByqtfXOvJGDXXeFyGTkbel4RAnz3Y1bp48Q5MijZRZZgR/pqcUHiuRsWpfUgSDYTaAN3ZO+Y/X+PORfJnEOff/4O0YPoY78KXATZadY5/eq0g7IUj6+4osv08zOwKy2fPb97Fi3NtJo2NEimxyl+GCH4S84GPpl7v20cKLk4AI31Wsi9XYq5P42CGPmheM25PVSAHCGdr1FLU0kd7PG1NdF4nQp2zzoDGRbp/VVALjh3o8ZVeAfPnUFlfERn/cx3W3d+UumPc11OiyxVOpp9FTuDtZk2rQJJlSyQXHNXV2fzxxVhlegNATPsr7fUwOkGjG/iVJc9fqMloTi6LbeEA6L6Wrfs5vJJ2nO1oHSyK0mE4l9MF/YWoeOGIcLc3YJ9nNcI5eLiSnJCsQ+ijvb9H8uUvQgeMVzOcmkE3P4rh+Tr4G+Mr7iq+wJY2CtUCIUuRvNYxk+hBMawyjpp5t07n8Ic0SK/hT7qoo8gKHNG6gAipERjDaWTn/Xb1TYvQkvzLbMVufRYm2vxHbPrNelHV8jXvaRxfsCbPZUUqgcCPwjKrimWKNHuVEsm0P81CkAAZgYdVu5bfF3NFnfYo32DoYcYKBpkLMviuU95FE5VCn0eSwIdX8qywzwKI27dka7rX9hO8kkuazVpXzSKN+/4ECj5o9qPP9hauSsgn7l77AA1kqjil8Bs+VSxNvs5BR4lxPVmHtZtaqLlB182hna40O/HMc4NFoUYuAF0dw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2616005)(316002)(38100700002)(66556008)(66946007)(5660300002)(508600001)(66476007)(86362001)(31696002)(8676002)(6486002)(6666004)(31686004)(186003)(53546011)(8936002)(36756003)(54906003)(83380400001)(2906002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hI0abVH3+76wdFqxDLxWQRvDAR9wG89zguxnoeTdql7P3zaeVIWj43CEeMgb?=
 =?us-ascii?Q?O4wq8moVfd/ZFjekNd/KJt9HiCp9V0RWvLIf4VATruRbg03cDJUjzTsAWPHB?=
 =?us-ascii?Q?HOBt5A1Cfu61RfD5J2iY7qoVR+drckNR6eQgPfs0Mo/NPI7oHTM1RZDDO1gG?=
 =?us-ascii?Q?x11IAzTCxDUYxPoRV6MMc52rIGIBWV7B0lrFdfyx7j1f+EHxozBk8NN59UE6?=
 =?us-ascii?Q?acY+bg8gkq5rAk+NAIn9ZClTBjFttQM2nippj+n7Kka9BaKOU9bSghmBExFK?=
 =?us-ascii?Q?v71SrnfvM5VYEUzTZJr7z3qtSJ4mbMaGvdMiEaF0sUCxXYCcD/mc5XBp81RK?=
 =?us-ascii?Q?emPlCpwrQwi0YAd1axAjNoAzBkXqVT9lbj+OjjGwBIg1z8LHE2dleiugZX4Q?=
 =?us-ascii?Q?crActwkiz+liP1KYTeXe0ekrsXJVycYBTSO8YfGMYwOl/5A8I6RjRmZ3Bhu4?=
 =?us-ascii?Q?+at9HNw427c4lm0+AnJ535v2KjgVS7VbaS291xHKVddOOFTpR3lPhXrZ/kF8?=
 =?us-ascii?Q?fJPHVqWss+JIl2xnGz8pnh8USWuYyNBrJ0rBEjomziduF3jkN036mcSlVB8L?=
 =?us-ascii?Q?wIdqt3rY89sT3Q1YImDqu+Skdh4szvoVsplgBxNiqLiY0sKBmK1AufBvB7UU?=
 =?us-ascii?Q?GeugwH0YAXNwKpVJzpWnYHv/zClS683FFh6w/4xxmSnKDjEZBH3lKAYeqp3r?=
 =?us-ascii?Q?jVkojSacbd+ESTv9EU6ptY9fAU6K3ufAkVbMhr/WpfoOzVmtGLWej0MEC/sR?=
 =?us-ascii?Q?l1QUBxWVDbUFGHhHCgkuCsubaZ2CF7HfoqeXGvtLHGENGnZNAjF+FjYZa0pj?=
 =?us-ascii?Q?QAE0rk/dKhbbKSH3CkmcwNz664YQBT84eEDsciYDeujchOwLBk2sojoar5w5?=
 =?us-ascii?Q?/DugvOhl0Wufy9qfqhwPX1wh94gl7pEdPkvsQdUKQT5od2rpeSc+GxMCbzqK?=
 =?us-ascii?Q?1QtyFOz0l7Tf5xgjz2g7Nlc1uSz+IwCYBK5dhN5CbN7P+TkbxkPnZrymAcXv?=
 =?us-ascii?Q?Npmobn7s/jOadOgX9tgmrSJ7zyQjj0zthxN30j17pPlIwMEKiLBhBG6PjxXb?=
 =?us-ascii?Q?RvUoKEW+n56mZzc6GTHKPOeRpm/zH9bsoXae2SE0zwRHbgThqUfg1fns8mvi?=
 =?us-ascii?Q?K9uamp4YUcU8BSfWTx2HgzGFOuhFBVz/0Iy+9E4ZPgnbdYhUGR9wt6TiQTXt?=
 =?us-ascii?Q?lGr8db7seekPsbw74TKumtlrYEKhbBlWCaedrMGMkYmrpgyC8YuJT6TcKICe?=
 =?us-ascii?Q?nH5ts1PzCkcks2SaNd3Y+i2jOgGDjxPhn1hd7pekMQXEH/jAzjoMEk/NBy9g?=
 =?us-ascii?Q?0Y2jjpBOWfjintUrwfpemCnGDWdOFow5IGYxqEC9HG4mu8ZTkzZ1wi3LbHAI?=
 =?us-ascii?Q?mOALZ3yLagjFk0UJjx05++pu2tnANhZ6ug8YUo9/Qt8QIQguKsh30o5uCnqj?=
 =?us-ascii?Q?txdafv/nQjm1bgfHmMEYeU1Su0CrkQe4H+NIAWAVa4QanWOCbCpRamDY58cy?=
 =?us-ascii?Q?3OT0dUi99iwu6u9fTzGYJa1N+SGYRBcXn0ggSfXUcP1YbyRpgqXqZC7RTUsD?=
 =?us-ascii?Q?S6hf7Pxb5CtLMyqRMBGt+ml2w2Dht2FVYc9GNwnZbYn7oC4cm1+BBxrX+ZXJ?=
 =?us-ascii?Q?jqm4u8W0lnv+futKzQ91jrbZ8/R/lv8N3HmJqLJ9Xx7ElKWyJyNIHxl9y0vc?=
 =?us-ascii?Q?AEU0UBJ4IGQd5XtRFGkopRymWkg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e83cfb-496b-460b-fa3b-08d9bbfcbc11
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 16:47:21.2502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyHq7hQX6QRIVaUNX8hPzQko+2Jlwc76TI8kG48pHhHT/zN+Vnh02mm+O3zGu7O6BvjxjCQYRgn5pIFuYisQuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 10.12.2021 17:19, Andrew Cooper wrote:
> On 06/12/2021 10:49, Jan Beulich wrote:
>> On 26.11.2021 13:34, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>> @@ -63,7 +63,24 @@ ENTRY(s3_resume)
>>>          pushq   %rax
>>>          lretq
>>>  1:
>>> -#ifdef CONFIG_XEN_SHSTK
>>> +#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
>>> +        call    xen_msr_s_cet_value
>>> +        test    %eax, %eax
>>> +        je      .L_cet_done
>> Nit: I consider it generally misleading to use JE / JNE (and a few
>> other Jcc) with other than CMP-like insns. Only those handle actual
>> "relations", whereas e.g. TEST only produces particular flag states,
>> so would more consistently be followed by JZ / JNZ in cases like
>> this one. But since this is very much a matter of taste, I'm not
>> going to insist on a change here.
>=20
> Fixed.
>=20
>>
>>> +        /* Set up MSR_S_CET. */
>>> +        mov     $MSR_S_CET, %ecx
>>> +        xor     %edx, %edx
>>> +        wrmsr
>>> +
>>> +        /* Enable CR4.CET. */
>>> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
>>> +        mov     %rcx, %cr4
>> Is it valid / safe to enable CR4.CET (with CET_SHSTK_EN already
>> active) before ...
>>
>>> +#if defined(CONFIG_XEN_SHSTK)
>>> +        test    $CET_SHSTK_EN, %eax
>> (Intermediate remark: Using %al would seem to suffice and be a
>> shorter encoding.)
>=20
> Fixed.
>=20
>>
>>> +        je      .L_cet_done
>>> +
>>>          /*
>>>           * Restoring SSP is a little complicated, because we are inter=
cepting
>>>           * an in-use shadow stack.  Write a temporary token under the =
stack,
>>> @@ -71,14 +88,6 @@ ENTRY(s3_resume)
>>>           * reset MSR_PL0_SSP to its usual value and pop the temporary =
token.
>>>           */
>>>          mov     saved_ssp(%rip), %rdi
>>> -        cmpq    $1, %rdi
>>> -        je      .L_shstk_done
>>> -
>>> -        /* Set up MSR_S_CET. */
>>> -        mov     $MSR_S_CET, %ecx
>>> -        xor     %edx, %edx
>>> -        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
>>> -        wrmsr
>>> =20
>>>          /* Construct the temporary supervisor token under SSP. */
>>>          sub     $8, %rdi
>>> @@ -90,12 +99,9 @@ ENTRY(s3_resume)
>>>          mov     %edi, %eax
>>>          wrmsr
>>> =20
>>> -        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in loa=
d_system_tables(). */
>>> -        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
>>> -        mov     %rbx, %cr4
>> ... the writing of MSR_PL0_SSP in context here? ISTR some ordering
>> issues back at the time when you introduced CET-SS, so I thought I'd
>> better ask to be sure.
>=20
> Yes, it is safe, but the reasons why aren't entirely trivial.
>=20
> To set up CET-SS, we need to do the following things:
>=20
> 1) CR4.CET=3D1
> 2) Configure MSR_S_CET.SHSTK_EN
> 3) Configure MSR_PL0_SSP pointing at a non-busy supervisor token
> 4) Configure MSR_ISST_SSP to point at the IST shadow stacks, again with
> non-busy tokens
> 5) execute SETSSBSY to load SSP
>=20
> The MSRs can be configured whenever, subject to suitable hardware
> support.=C2=A0 In both of these cases, we've actually pre-configured the
> non-busy supervisor tokens which is why we don't set those up directly.=
=C2=A0
>=20
> Furthermore, we defer setting up MSR_ISST_SSP to when we set up the IDT
> and TSS, and that's fine because it doesn't make interrupts/exceptions
> any less fatal.
>=20
> The only hard ordering is that SETSSBSY depends on CR4.CET &&
> MSR_S_CET.SHSTK_EN in order to not #UD.
>=20
> However, between CR4.CET && MSR_S_CET.SHSTK_EN and SETSSBSY, we're
> operating with an SSP of 0, meaning that any call/ret/etc are fatal.=C2=
=A0
> That is why I previously grouped the 3 actions as close to together as
> possible.
>=20
> For the CONFIG_XEN_IBT && !CONFIG_XEN_SHSTK case, we need to set up CR4
> and MSR_S_CET only.=C2=A0 This was the only way I could find to lay out t=
he
> logic in a half-reasonable way.=C2=A0 It does mean that MSR_PL0_SSP is se=
t up
> during the critical call/ret region, but that's the smallest price I
> could find to pay.=C2=A0 Anything else would have had more conditionals, =
and
> substantially more #ifdef-ary.
>=20
>=20
> I have put in this:
>=20
> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> index 9178b2e6a039..6a4834f9813a 100644
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -45,6 +45,8 @@ ENTRY(__high_start)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0=C2=
=A0 $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0=C2=
=A0 %rcx, %cr4
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* WARNING! call/ret/etc now =
fatal (iff SHSTK) until SETSSBSY
> loads SSP */
> +
> =C2=A0#if defined(CONFIG_XEN_SHSTK)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0=C2=A0 $=
CET_SHSTK_EN, %al
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jz=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .L_ap_cet_done
>=20
>=20
> which mirrors our Spectre-v2 warning in the entry paths.

Thanks, I think this may end up helpful down the road.

Jan


