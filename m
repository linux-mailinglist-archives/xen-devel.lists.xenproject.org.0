Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5FC4AF400
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269256.463285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnv1-0002ho-CF; Wed, 09 Feb 2022 14:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269256.463285; Wed, 09 Feb 2022 14:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnv1-0002fv-8k; Wed, 09 Feb 2022 14:26:03 +0000
Received: by outflank-mailman (input) for mailman id 269256;
 Wed, 09 Feb 2022 14:26:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHnuz-0002fp-LK
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:26:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3403c0ac-89b4-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 15:26:00 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-u_rbBuElPuSgoZku5A9Swg-1; Wed, 09 Feb 2022 15:25:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6161.eurprd04.prod.outlook.com (2603:10a6:208:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:25:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 14:25:57 +0000
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
X-Inumbo-ID: 3403c0ac-89b4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644416760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qGQSia3V8LStIAG9F4GxWF7jFSPXXwvssOpyBRHn4s=;
	b=T1QiM+SBz+U1FuGORqDNT60tv906YhKy/ebQAoeeRHNylGT8iPNT4jJUvhWMiTFBIS08KD
	rrQAI/dMc1ibRsnMarfJtVLpb2aqX5Ez2CoVsG7efY2uvfDKkXzYtnvd/LznrqSTuzNZcd
	7/YwuDZswPTwZC5cwfr8Se8w3X9y1vE=
X-MC-Unique: u_rbBuElPuSgoZku5A9Swg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENVJtSxifBiqMbh7AABGqG8O8Sef2OWKc9uyQPfW73ubENcf/Q8OwHsW3X9FI9J4ooTuO7MKHmTj+GBNz1vVC+Sj0bQJ1Rar2apg2ohFEJX0mzvptN2yp0oGdJzsFKsA8vvyxBi3OiJWo3Q4bnHAi5UdpNDxleoXRyUbwvLG2xW7eHqJv55skN8jF5noPWuc/BnOT102CMpgKmIq9BXkIySCjOULkoTx09P3+S+aNY5hApm2jgqzJeJrF1uxE7TD6lVxArxmHCDjemKEqk58lyXgVhTN0WnXMk7jaLXXCfHetF3OXq88hJQWIl34hJch4v7ZOTi0YKfwvEVzGX5Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qGQSia3V8LStIAG9F4GxWF7jFSPXXwvssOpyBRHn4s=;
 b=QiqzzMhzFYyboc1ikmXxGOKUF+csJrLEv/HSSOTClEydgbvoDMsZVgYmewHouqVBRhIPnvdLaWuy5ihCRKZF/uu8kwKe0RaiJHdkglnEpdDGtpoBCa5rnFAXo4wEeKkdBMa09eMeKmNC8n5TToYp5n85KVamz6pwobQVQVrVKJ4F+YRlu5fPR+OTh7hebpFyhE+ncdEKn3d6Nrw11638JowNHTYQ2kvl/O18G7uulE0kZWbjxHLBLDzJ3viHjh1anPHFSNVqJVEY76updgvWXoIUC0fhxEVRyVZhXkiHifyjknCbLnAvvgPSEDShSt7vUIOfq3qXM19Sv7XLFrRNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad339015-c5e7-d776-17a3-2dbd337fcd4a@suse.com>
Date: Wed, 9 Feb 2022 15:25:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] x86: Use low memory size directly from Multiboot
Content-Language: en-US
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
References: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
 <20220209131251.387-1-dinhngoc.tu@irit.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220209131251.387-1-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0053.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dde889a3-99c7-4d84-bc69-08d9ebd8166b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6161:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6161178B78F17A569453251FB32E9@AM0PR04MB6161.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bHNGEaUP2t6piLBsPxpXMMhzknMRl4addGNbFR0PBkH8MvGAHdamDzi8hfSPfIS1K515w0ECzz7dF64piFed1bO2gupsaZCz5gyVjxYbOsfdIMVJGDSazRPBFsEFH7bbkvOaXyJW/qKLJQ0FBtC5A+nggavKV67zkK8cJedH4wRL4xqZS/2ePPlQmalxGdf3tTBIvh7sOM9d3N1LqFvoh5Mk5dKhNO+R4doIych7T/r2VL0NyODaBrE9Hctw/DjjdVPMiXaUIN8XrfUg9htLvrZjVggaJ4+o0r4CD8bIjHahL1ct8Bh2bAWTjkABZGSpCC+JuOmzUAxv9JXHsCyXtYs9vx5Fqi36zOoBHZLz3T8lXSz6YaTz5tdQ43WuTE5oI4GRh+V4w/jhWGnh+2AU7KlyHkDEDbP00uoiSt2VqD51uW6J0nBoz4u9qwz95t7dTuBJuZg/heS13jXnPncQGshR3yYH5m3D+kirjqONkYgdWLVOQ9cYRsuNvKAjgyQauOgimVWLebDxCJt2nfrJwy2u8MyFpp/9bTQFDGfTgTRi5FGKXVVNorJnOsH11072/Zc2P5gmIOLPOSXsqVVfWUm1Yju1Zshoovy19XLjrycAu29eV7muc7thTq7d63IZ1G7jU8u9yJwhgn1bkJuqxk6uOXp7IDEwNDhiVd19kM5i2VxKGt9cytqJ+WMIZse1E25IACjksXBS9UHcRPF63fzUWruJP0mqVhwMseE/vKYurV1mgJiJPUaYCiOCFa8H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(86362001)(186003)(8936002)(66946007)(26005)(66556008)(66476007)(2616005)(36756003)(316002)(6916009)(2906002)(4326008)(8676002)(31686004)(5660300002)(508600001)(31696002)(6512007)(6486002)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG1nRFRsUWdpN1o3TnZKdmRZWjNKZWFneURwQ2tDQzAzQnFGTHg3SFB1Q3dh?=
 =?utf-8?B?Mlp2QzY4L0pwMVNRdzZRSjhzSzJyTGUwVGFrdlYwUUJSUkJZVytLdzRNMUNV?=
 =?utf-8?B?N1gyTW1tb3N1UHR1MVdiVVVTOWVtWGdaTlNTYThiUC9lWndXSHczSjdWN1V3?=
 =?utf-8?B?cFdaRTdENUREMkc0REJZM3FpKzE3SHRwYzlXcFVoS3Fmcm9lM3l5UzJ1cXBh?=
 =?utf-8?B?SUVOazVIbXF1aGhRMks2TlRpeDBEMlVVOVVsV0xaOHpNOEFDM1p2a2Vxa3Jv?=
 =?utf-8?B?TkNic2hhcTRBK1l5bmRqbTFMdmhqT1RBVFRyTjY3UWtRU21MQnhOZEY3SXBR?=
 =?utf-8?B?NVZwamJ0L3lkS0Yrc0VjamZWWXVJNDlvYjZVS1NTTXF6T0JiS3VrWFBVYitp?=
 =?utf-8?B?OUV5T01hZlMxTUtQR05PZkRGNUhnT1FZZHRDanVEWUFkSnZMa1lQeDQ4SmRZ?=
 =?utf-8?B?Z0RMU0NkQmZydlpYQ0V3aWZ3U1d6Yk1mSjVkWUlTR2FjT0p1aXBkbVNsdGZT?=
 =?utf-8?B?RVh0TVY0SFh0VjBhckNERExqQ1k2cE5sZWlNMzdZN0R0Rld3dXNMOUovbE4x?=
 =?utf-8?B?c1BPRmRuWWNPclI2U3JGcTdKL1hBWkxxSmtkUDhPaEdZMmVvQUpPZnJ2TFZK?=
 =?utf-8?B?UHZna2dCV2xLMHNybEMwQlhSRXQyOTNxOFArM2ZSaDQ1UXpKNFhYVVhmMmlk?=
 =?utf-8?B?VW9qUUZXMkpRcXlPd1I5a1lyUjljUmh5UXoydUtzeUJWUm5RYWVQeG9ZcXZk?=
 =?utf-8?B?L1dUTUpHNm9GZnphUUtJTzdKeDkrdWNpZWM1bGs1WnV4WDJtY2pGMjVhM1ov?=
 =?utf-8?B?cURiZ3IzaXpINmg5TEFxUnlYQnVCZVpMVThIV1lrQW5SdDN6R0dwQUVqejRU?=
 =?utf-8?B?VGxRNTVyMWZBYm10d2hsYWlNeHVpTm1XT3owb01ab1NoeHZkN1Q3cVkvdW43?=
 =?utf-8?B?Uy9EQ1c0MWFnNkk3cVJXUjE4WFp2bGRyWnh2UVRWcVArMHJ2cHhWSVl2QmNo?=
 =?utf-8?B?UTlrVk1CdnN3NzExRXpOWU9FRVZKKzlaclFwQVZDTEhRQ21xWCtSeHhHR0Fv?=
 =?utf-8?B?OWZLa3JpU1dvMTd3eHBENEEzbjZJZGxKWDUvM2dFREppTENNZXhtZE0yb1kr?=
 =?utf-8?B?N2RUUlZkTDFkdDl6N0NCK2pPaTlXQ2laVVZuZDF4b1Flb3FXNEVFMFU4RWNw?=
 =?utf-8?B?ZHpEZDVob3N6SUZUb0Y5OHFwM2NDejcwNHZZb3NzcHQyRmZmZmMra3FKblpp?=
 =?utf-8?B?ZjI2RUl3Umh1N1ZTR1dNTUFnTVZ5Q24xVkV3QWZFMFROS09qaDRoYVFWYUZP?=
 =?utf-8?B?RTBWZldGVTdVSlJVOUpWZG5UOFFUeHY1S0F5WXpHNGl2QTAxR1FhdE1qN2V4?=
 =?utf-8?B?bUJLdlFCSm4wK2cxL29OeThDNzFmN0lPYTgzeGJxN2Z1RmdLM05Sa0NOWm1P?=
 =?utf-8?B?ZGhrQzlSU0pJWnlpdEE5R0VqbUF4K21NZ1FUR1FCZUZCNDNxMzdOUjZWN0Vs?=
 =?utf-8?B?NjN5UHpnbUc4WFNxVVUydVE1SXhEUi9IWk16N1FOZ1RDamJ6NU5GMURyWXBy?=
 =?utf-8?B?SG91Qm9CeTFOTE1jQkZqVzExV1BYZjZMNkxPMldXWFNMZ2FlZDllbjkzTHJW?=
 =?utf-8?B?L3lxdTFDOVlBY1FNV1F5OHlBOWlGZ3B6a1ZEMW5MbDJOMWxTWXVVSjNIQy9p?=
 =?utf-8?B?NFNKckJzd1VaaUl4bzBRMkpCcVo3VnVCa2xHcFRsYStSUkNIUTVoSytLN20x?=
 =?utf-8?B?YllRZWp6dE9jNWh4Zy9LWEFMTEhqTXJrNXlCUEFGNDVwNlI5VEgxWEljeWdK?=
 =?utf-8?B?WktjenVZQU9PUUxxa0N0d1hwbCtrU3FvbDk2ODVKZ1JTNkgrTmRiRXJ4SVUy?=
 =?utf-8?B?NVVSclZEaThXRVpwUkZRWDBOa3dHNUpUR1NoVmRCMTZjRWdPRk9NUlVEVEhY?=
 =?utf-8?B?NFI4NkEvOG40TFNvYVRvUk1QZjBjbENVOHBiUjNpcFlLQjg3RGVlOTJXc2ww?=
 =?utf-8?B?MHFvQkJuenIxRkljWkFXVzIyVk5obW5JZ2tTM1E4RVZueUc3M3VPVWhNRU5o?=
 =?utf-8?B?TENGK2pHamJvYmFPUER5Z3BUL0VUU0xHRGZIdDNJTXcrYk5URlBZaFBHT3Ix?=
 =?utf-8?B?Qmw0LzVSbzNVR3lLTHFuRE1UK3Q1Zysva2dxZlo4VUZYOVZOMlh3MkNpTVow?=
 =?utf-8?Q?b1duQ5GR5WXcefmy9/+KPQ0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde889a3-99c7-4d84-bc69-08d9ebd8166b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:25:57.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6z076wAF90kp8K8IbIlbolXapzPgP6/Pw6lTYyYnIqVM71khL5NOEIW+tuwzoubVkQi/hV9V2B0BJDJyJynBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6161

On 09.02.2022 14:12, Tu Dinh Ngoc wrote:
> Previously, Xen used information from the BDA to detect the amount of
> available low memory. This does not work on some scenarios such as
> Coreboot, or when booting from Kexec on a UEFI system without CSM.
> 
> Use the information directly supplied by Multiboot boot information
> instead.
> ---

Btw - please summarize here briefly what has changed from the earlier
version. As it stands your adjustment looks to take care of one third
of what I did say in reply to your v1. That's not enough for a v2, or
else you should have taken care of the remaining aspects verbally.

Jan

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -524,33 +524,23 @@ trampoline_bios_setup:
>          mov     %ecx,%fs
>          mov     %ecx,%gs
>  
> -        /* Set up trampoline segment 64k below EBDA */
> -        movzwl  0x40e,%ecx          /* EBDA segment */
> -        cmp     $0xa000,%ecx        /* sanity check (high) */
> -        jae     0f
> -        cmp     $0x4000,%ecx        /* sanity check (low) */
> -        jae     1f
> -0:
> -        movzwl  0x413,%ecx          /* use base memory size on failure */
> -        shl     $10-4,%ecx
> -1:
> +        /* Use lower memory size directly from Multiboot */
> +        mov     %edx,%ecx
>          /*
> -         * Compare the value in the BDA with the information from the
> -         * multiboot structure (if available) and use the smallest.
> +         * Old Kexec used to report the value in bytes instead of kilobytes
> +         * like it's supposed to, so fix that if detected.
>           */
> -        cmp     $0x100,%edx         /* is the multiboot value too small? */
> -        jb      2f                  /* if so, do not use it */
> -        shl     $10-4,%edx
> -        cmp     %ecx,%edx           /* compare with BDA value */
> -        cmovb   %edx,%ecx           /* and use the smaller */
> +        cmpl    $640,%ecx
> +        jbe     1f
> +        shr     $10,%ecx
> +1:
> +        /* From arch/x86/smpboot.c: start_eip had better be page-aligned! */
> +        shr     $2,%ecx
>  
> -2:
>          /* Reserve memory for the trampoline and the low-memory stack. */
> -        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
> +        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>12),%ecx
>  
> -        /* From arch/x86/smpboot.c: start_eip had better be page-aligned! */
> -        xor     %cl, %cl
> -        shl     $4, %ecx
> +        shl     $12,%ecx
>          mov     %ecx,sym_esi(trampoline_phys)
>  
>  trampoline_setup:


