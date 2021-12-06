Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A446944A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 11:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238786.413838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muBYi-0008PQ-Pb; Mon, 06 Dec 2021 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238786.413838; Mon, 06 Dec 2021 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muBYi-0008NF-MH; Mon, 06 Dec 2021 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 238786;
 Mon, 06 Dec 2021 10:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muBYh-0008N9-4N
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 10:49:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b33d7cf-5682-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 11:49:21 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-3mnH_djAPGGCFG0uQS-UVA-1; Mon, 06 Dec 2021 11:49:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 10:49:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 10:49:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0017.eurprd05.prod.outlook.com (2603:10a6:203:91::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 10:49:17 +0000
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
X-Inumbo-ID: 2b33d7cf-5682-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638787761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETWBE5Tgi7RxJH6hIPyvMR1Kms4ofCQDjyr6RKVTKrI=;
	b=CBLKTRIx46VV/a26bydoI9/qKycBCgk/gGl8KJ0lf6jh2C7Gn5+Spu/loUcUnpbYanxCcF
	dqnX1Hv8VryyLXP9b5f9TWRwvFmgNRc07Edh+c58vJIilHVx67uAod6xCGvgwAEi+G/3IA
	gEsR8tM+lYf3c64dWmaBa9lQHGgSUXk=
X-MC-Unique: 3mnH_djAPGGCFG0uQS-UVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmBMBWBJiy7PS2KeTKkIy5zGDqm9Ig/Dts85EHda4+x6uhWBTJ4paL90Cb8yxrE2Kex1mjBN9ar666BBCLAbPigZ0VmepZpB75aTCLBdzFD0ulIcGmk2D9AuJECQbCRlVqX1yjPMkKuIHRaxtQwcWAfeOT8rZp0S0Lfr6Zm3XXltRUnZ4ivLsgFrxSkBC6E1pu+OpJrHz3SitFYqHDtLVvBAgRAOEch54I1i2w/AtnNrBFm3kX1A9wK4tuIFmfyX3hcANbqqGv+vpCnr9bAOjH7gjrl7n8YgUXuIWn/m9KpqfStU2b0EYR1ziNKYkvfXk3eMwUAtc0uuQUDFdcOEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETWBE5Tgi7RxJH6hIPyvMR1Kms4ofCQDjyr6RKVTKrI=;
 b=EAzv1dyFhRcnC+CVCC2YNjIeSwRLb6M7HmJ5NvJ5GdpEiUqfA2d+ItmhdsNrcFx0dgDyjNEUkXAsDjr+OAzq0Ir6YgneuzQevot/s5cx7/+fpDgzLOz6PCUiTcxH6qwlhC5XexrEdHIWjTi+v+sUX1BlRa8w+SuTc6fo8b6+sP1GlFlvL5cj9C75KY9nW4CnU01RpF+2gvxrDid4RyNEX+30aRsOuLa5k9dOfR5Xrk1hVJXwRvnpoS37cabTNSYJc1X1aHlUICWfAcWQFfpeXSAO8+2tetd7JDMC8VDLg2gGhRmtl5SVZXEtEEpU86l1XplfA1BLR4w9h6fMQ2S+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64b55cdc-484d-5657-e0af-3462ebadd09f@suse.com>
Date: Mon, 6 Dec 2021 11:49:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 63/65] x86/setup: Rework MSR_S_CET handling for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-64-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-64-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0017.eurprd05.prod.outlook.com
 (2603:10a6:203:91::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70c42c52-aca8-44b0-98db-08d9b8a60d1e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377492345CA3BA00EC96C9ABB36D9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CwmXh32o3I8rVYU5e25A+hPlzdV8TGSW0Z+4BkYfSliuCSh10GpDlF9D5H35Ny9XgSYTBKfOcGvbggt+sB12jiICMvo0mEC9Jvgb8fcOSdpJ7je53xx3yAV27tyQpvJfTV5yAptU2Vb+EHMvYa9tlf/SW8Ld4XXUgTR+3lquIGc2I2+3//CH/qUqv0oKzIgxBLwoZXsn0Rg+RQqLGk3Xbw8qravuw/vwcgKBSF8wpSsGSYyvxwh1Bf+4391d4PXh3UVLFhQlQwA/OOtnboi+FqMQgcMlP36XYxC4SxKhqit5f1Jk/ka88Ww/KYt0Bggg52LkhnkzmDh8wXlhSuZbMT+U3+FbHnNIHpEEv1TSVGwiLCkTZEd0sJShIw8Z6PzG/fmaQ+1CBHjoPnIp8M6ftAtH2xIuwRNJG4f/P/Pj+OU36YgUAiUAtZcVUDw7YOV4TzdFSWY9vKmZPfuHXhJUBYgZQFQthl6TlOvsnJkFkTfNFusQhBW+I+UA0YdbkDsatE5dXBm0dSoDPrEsWGgnzbaV3WYJD7cty1TfmL05uX9TiJCY7MaI0Pej6z9Ndrmkyr16Uigeam7GeWBLIV2YWUkyWYCpZ/26DqYCNYeQ3UHq5Xe7L7zXiiXtdfeqNsu2ttkLFn4gAP47gh+AxZl1PM/yodS/aBe8oF/NX73FR8dr6mn1c74X2JuNsIgCEnK+EcDRPtI2SuZM8kZndAdFhp9PZX72qatSJbMkLN/X//I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(66556008)(66946007)(66476007)(26005)(8936002)(31686004)(508600001)(31696002)(53546011)(6486002)(8676002)(6916009)(956004)(5660300002)(186003)(54906003)(83380400001)(2906002)(36756003)(38100700002)(316002)(16576012)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T015SkY0RjlPWEVQaUM1U1htSnQrTDk0anQ0VWZyOFVoV3g3VXZUREN1VDRX?=
 =?utf-8?B?T2xoNHRuYjlGcWt3M1E5T2dOQVZ6aEgrMXEyTElzWjVCMytZd0ZqNzkza25G?=
 =?utf-8?B?anFvQTlzRGpWNUViK3FQcVFIb1BET3loamVuNkxURFpNTk9iQVBUQyt2NjMz?=
 =?utf-8?B?SzQrMHFTZ0hkZS9nbTdOeXVXVWtuWDZJK0VPUkhHWDJqV0hkUEF3cUM2dnNY?=
 =?utf-8?B?L2xtbXJHOVZoTjlYWG5oYXV4WnJPMWhMdWQ3R1RrNEtTTVV4ZlRtWFJOc0NX?=
 =?utf-8?B?aGV6UDNQekhYRFpDK2haNThsdTJXdFpzOWhQd2hCMlNoOG5nTis5VnJNbEIv?=
 =?utf-8?B?andFT0VHci85ckNYeWNQaXNHT01STjJBeUtsL0xOa29CeVB1YTR1MkloajZm?=
 =?utf-8?B?aWhpbDNtV0JobFE2TEI1MnI2UXVhSFIzcFl3YnhZMXRKa2pUd21NNHhMOXlF?=
 =?utf-8?B?NHhyV0wxeCtvaWsyRlhkVzJMQ2NtV2tKamprS3RMaUhrOTVrTXVPWXVMQ0Q4?=
 =?utf-8?B?OGRLL3J2QmxlTnRoZm9zNk8yVy9iQ0JjK2ZQejhpUzFHZUh5UTNmdnptc292?=
 =?utf-8?B?OHRUdlk3ZTlOSElDbVM3bUsxVVJkaC9YaHBadFJNcmo2aVNwRFhxS3BoRFV1?=
 =?utf-8?B?Zjhkck50KzBGSGlJWlNYWE9PZXdabitiM1BPSi9LVElMaUdSSDNZc3RHQlVO?=
 =?utf-8?B?cGxXdWllOWR1Mk5wemk5TE9FRG9BVEEyVTBwOS9qeFZUSWNFSVgrK0RUZkc3?=
 =?utf-8?B?alovZ1VuVjhPZENTWWh4cFFMRzY3b3R3clAzOFg0RVlKd2xmTmF4MVRFeitP?=
 =?utf-8?B?dEttakQ5a1RKN1N5YlZMRjBqQTlnblR6bUJoTjdSYStOTDN1d2I0NzR5WUM2?=
 =?utf-8?B?RnQvcHlYYXRHazZwQmlQUXdoUWhHU3BoQWd0VjBuMktmTThSTk0yUU5MM1Er?=
 =?utf-8?B?TDZwWWEySFZZL20yVFgzK29CQXVaTWNTaXRlSktSZCsreXZISzJUQ21JRnRN?=
 =?utf-8?B?ME5tbytqbTUvSmZPS1ozN2o1RVdxT3FPWkwvT1laTG5hVTlRZmwxUjhjTjdw?=
 =?utf-8?B?aUJ6L1E1Z1U3RHRaMVVyMXNrYXNQdXFiYzI5UmVUMU0wckhnMktvazZrYjFv?=
 =?utf-8?B?aWx0SkVGakJFRFdZNUVUcFlLNjlzR0ZrR2hlbXFnTEVPTWlhZ24yaGNTYTlC?=
 =?utf-8?B?YVVIUXdIT1d6T0l1MFp0QWVrWjhINDhWQlNRRHdxdFRLaVJ5RkxOQ2ZnOStP?=
 =?utf-8?B?Kzc0UzhRaGdHdy91ZWg2UEF1TnJ6OFJNL0puL3RacFMvOTVHVTJ1NXkxaVJt?=
 =?utf-8?B?NHZCeGQ0bU41czVLYndScWZmQmw2N1JWcEZTY2pWeGdxbkcvNU5ESVhQdVdE?=
 =?utf-8?B?UG5GbzZqN3pOYmtNbVUwTnJjUGJxVVhTenlBNWd2OElkdStEUlc2RmtOeGdl?=
 =?utf-8?B?Qis3dkRmd2JTYjRXZlJqUVB1a2xUNlFqU2xKcDM4RFFQdnEyT2FUWmxKamFv?=
 =?utf-8?B?UDVKOTNoTGJuRkhlR0VBbjUzRTJQQUJxZXdkbVFSNkcyOVNwZlk4cUVvUURm?=
 =?utf-8?B?WVNlYWhibmpLVllrK1ZoblZuMEFnTXZEK25wYlp6eU5LdFZJb21WZ3FsNWhP?=
 =?utf-8?B?eUFDS0VyTE44RW5SYTBaU0cxcFJxUmZzRm1uVXJKS1hJZDVRL3ZuRHNmYms1?=
 =?utf-8?B?TDZ2aHl1eUsySjhVUlVGL0pjTTlIdXY5aWR4SE5LckxQT0FPTVB2NFdWVHgv?=
 =?utf-8?B?SFFXa1VKQXRXRXZhQ2IyYjUzdzVjZEs0eVp0b2tyOEY2YUxWZytWdHFINXdN?=
 =?utf-8?B?Z1lHMTVLZjRhbmRhTnI3ajVTMmltWTlZSzFtUHE4a2pySGxSK2FoTWRKS2Rx?=
 =?utf-8?B?aFVmVlNEWUljb2ZGcnRXdWNkbUhmVlRhcUtrTVFDditLSWcxa2xSdnJvakEx?=
 =?utf-8?B?SURlQ1lGZllxTDZYNUdJWDI1TnpjUzFNSEwrNHVqbUZneUJaQ04zeGo5TW0z?=
 =?utf-8?B?OHRCNmZSaXhnZU11TExrbXhpM2h4YXJhaXVlTG1rWVg4WEdCSVhRMlptWEJj?=
 =?utf-8?B?dU1PbjVMYjM0Y3FMK2daRENyM0NEaVdnS3lMeW9OdWs4TDRNbDB2V2J6b25z?=
 =?utf-8?B?TEpJTUJZTGE1eDEzbDU4VWZqSTVTWE05Q2NoeEg5c3VRTkVCWHRpeVNOeks3?=
 =?utf-8?Q?xceSNIOxPODOVUr7sbWKa+s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c42c52-aca8-44b0-98db-08d9b8a60d1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 10:49:17.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY+g6KO9azwnBUsz4TePEDDld6klyXU0iMi6atqRjV+iR7AH+LZ3e5sphkr2JxgAHOOWdh0G+ye6iqGWESH1Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 26.11.2021 13:34, Andrew Cooper wrote:
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -63,7 +63,24 @@ ENTRY(s3_resume)
>          pushq   %rax
>          lretq
>  1:
> -#ifdef CONFIG_XEN_SHSTK
> +#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
> +        call    xen_msr_s_cet_value
> +        test    %eax, %eax
> +        je      .L_cet_done

Nit: I consider it generally misleading to use JE / JNE (and a few
other Jcc) with other than CMP-like insns. Only those handle actual
"relations", whereas e.g. TEST only produces particular flag states,
so would more consistently be followed by JZ / JNZ in cases like
this one. But since this is very much a matter of taste, I'm not
going to insist on a change here.

> +        /* Set up MSR_S_CET. */
> +        mov     $MSR_S_CET, %ecx
> +        xor     %edx, %edx
> +        wrmsr
> +
> +        /* Enable CR4.CET. */
> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
> +        mov     %rcx, %cr4

Is it valid / safe to enable CR4.CET (with CET_SHSTK_EN already
active) before ...

> +#if defined(CONFIG_XEN_SHSTK)
> +        test    $CET_SHSTK_EN, %eax

(Intermediate remark: Using %al would seem to suffice and be a
shorter encoding.)

> +        je      .L_cet_done
> +
>          /*
>           * Restoring SSP is a little complicated, because we are intercepting
>           * an in-use shadow stack.  Write a temporary token under the stack,
> @@ -71,14 +88,6 @@ ENTRY(s3_resume)
>           * reset MSR_PL0_SSP to its usual value and pop the temporary token.
>           */
>          mov     saved_ssp(%rip), %rdi
> -        cmpq    $1, %rdi
> -        je      .L_shstk_done
> -
> -        /* Set up MSR_S_CET. */
> -        mov     $MSR_S_CET, %ecx
> -        xor     %edx, %edx
> -        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
> -        wrmsr
>  
>          /* Construct the temporary supervisor token under SSP. */
>          sub     $8, %rdi
> @@ -90,12 +99,9 @@ ENTRY(s3_resume)
>          mov     %edi, %eax
>          wrmsr
>  
> -        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
> -        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
> -        mov     %rbx, %cr4

... the writing of MSR_PL0_SSP in context here? ISTR some ordering
issues back at the time when you introduced CET-SS, so I thought I'd
better ask to be sure.

Jan


