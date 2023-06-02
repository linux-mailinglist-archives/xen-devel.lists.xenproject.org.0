Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F071FC23
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 10:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542995.847514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50CI-0004G3-RJ; Fri, 02 Jun 2023 08:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542995.847514; Fri, 02 Jun 2023 08:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50CI-0004Dg-OF; Fri, 02 Jun 2023 08:31:46 +0000
Received: by outflank-mailman (input) for mailman id 542995;
 Fri, 02 Jun 2023 08:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50CG-0004Da-AA
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 08:31:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5960cfb-011f-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 10:31:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 08:31:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 08:31:10 +0000
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
X-Inumbo-ID: e5960cfb-011f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMDQL+eQsjJ13oWpu/rNEj9rvB8DkeG6xOn6Hyi8NLKoeU4e+2J7n9BQZgH+vmPRZK1k/Zr13AcysKQ01SobWzzpDYpy/NJqts1+ek5czhzzDFPra/GGGsoRyGgZxHWWkLXswIfsMkqlNMGYQDF4DxZaUyUfqFjLT+TfDfMq5Me1uuDdqRz5O9ssl8DqREbBZrtlvgyixuPJ5kfd9VKsctGF37Y8JgCDxNmRiiee7WYJd23Xy+V+K6XYMTFtKLdioXjAUSGok0z6Z7Qv3uurGvZFYnDg3RPXnwkhpX4t5+NuOI0dphTx5UZHLTeA4LyUpUEzfT6T81O64RW5+WRj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMjj8e0o8WR1BdrHgAheGHQw7ORZQ5RCVQAhUgCAXDY=;
 b=ceFDSlL+krHIGOzC0as5Z37cWU9Np6j7kjBhsktGuqafn671P2OLS+Q89hwH4Dho/LdiNAjIKq7MrgrFm5vhqTLOTftzOIEVceoDq7SIEV9Sg2F2+HxP2o5xZrV9EIjkLSZPue2HHE0Y5CbqqjaPk/hg8NPMmJxangh+uBxRKCLfXTbukEWnrvQLzWeQ6Z8ib/+tzfenEAPyGnsTz9ZSUW2dXYIdHzjX7YwjJ1Bt3tvWfS0oS8l28tPoVJNaGydrtA3kahQO7cLob/H2yqgJkxhnzn/H6PPW2Y1JPIVzhyaadd8fP31iveEZqvV0HGtq3sKKIotnSN9k9t6GRiXM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMjj8e0o8WR1BdrHgAheGHQw7ORZQ5RCVQAhUgCAXDY=;
 b=O02F4MBtHqHfjcVGPbq4rXyTeh/ijd4xWlN0poZcSAcfKURUj2gTM73Y+hPF8C7JAIjsKujDXKEKVhqeaosKn1TuX4zZdyDYRghZKWAF8OPFBA/oYHSLGHhPj4TqLks0s4d9KZ0HjObuCVgqO7DIxQx1Kk6t8wLsXElhRb9wnvg5WNs9+8ofGsdOy+Evi00FWEcgwPw4HliJTALmnu1QehNA7xQJWt6eVBsrU9wZsOkb8ysCDabF1bAzZx9feeeHov8lpwqH+9gUVi3cDKouXLdWDqj74V+nVGrCSCmIZY+mP9p4h6330LXaI6qvTvOmqB0GGeIyw7J7Fd+aQF25qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <619ea01a-2058-c4ed-0f5c-394a82f838a5@suse.com>
Date: Fri, 2 Jun 2023 10:31:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a33c52a-188a-4b0d-0f6c-08db6343b829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CikHlAdh5++ebf8aoglQbgxCrfKBTRmwWE42kzM0mslyShiufLucgx8xGk5z2wU2p4kHCI2wG76c2TKGm3ZU1Wa0hRJKvrrIkAaqvRR50zmcRHE+DzEHZ9XzudeMf59QaKXWzMiss0kpS/b+DeH5smycWBoRIutv27CykfeirnQDcz/+0w9oZLGtC1tTNfmdJgpyp+JbnarrUTN5FZCnRypj8ItDOOqMuRw9e1XjkCz4OJEqc36aWGwoPCQ9Dx6BowI/atxW7yfeyltd4wYd5K/Fkb9rNMCEgOzRqRNljDldi/9jKQW2wvvnYZDEY5oCJx7wXlKYCyrvPcGTiK1uWF1XqpY2ypDOKSgqSCxVbAsxXYE73htv+mzMRxOmDx3yugcYQ27sTgtOwZ+y07FA59FX6CA/h2tnLn1EH0906f/LT2v3PwICXJ8NPtTw+2ROd9mDpUZ2deVV98bx5s/FGQdiTpOtYYXX861YiDTLBraMfsVT29ml7jEEbEYtMejdqPqF4BlLzIIUme9SCkaB42Q2/imNDt5vm9FVi+WkG5O0y8FoSElQ238js8CKXgMgyGJuzzqYhmehrlHxJSvFc1hbsjzv329zAqoJUHvLm3veo88cGRQFErgezgfAOu4OwrHgJ+lzq1U/OLRJixmZgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(316002)(83380400001)(186003)(2616005)(4326008)(6916009)(66556008)(66476007)(8936002)(6486002)(66946007)(478600001)(54906003)(53546011)(26005)(6512007)(5660300002)(6506007)(8676002)(41300700001)(2906002)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2tGMStIdmxobGtoYkhFTWlzdEVuV3haRmU3SmpqakMwVlJ6S2JiV0d2T051?=
 =?utf-8?B?NmZKL3MyODVkQjlPM2N3cFlHeUswa21va0FWNklzTVVIVGp1M2dsRzg5QjdG?=
 =?utf-8?B?NEFTS3k1ajA1RFhQeGw4eWZQMVQ4My9OUnk3Mkd6dFpHYmtFQ2N0TUVhb1FQ?=
 =?utf-8?B?R2tHdGpnYS8vVFZmTlZHaVptMHFrb0JVcU1ER1pMU1JjYks5VFd0c0xwQXN5?=
 =?utf-8?B?eHFTUE9HVTNHOENvWEhQeHhqU2NrSEUwMWxOUlM3Q1BhNUdGTWNxVThRNVNI?=
 =?utf-8?B?djJMM1d3aVh0dlgrc1hzcHFGbXd3L0VQd1IzaGtoNVB2ZENnT3ZxVS8rV01U?=
 =?utf-8?B?UjlsNU56WFRHSTRXc040ZUdiTjRNQ0IzUEhKUDVNQzlJc1RLT1ZWb3hnd1Rj?=
 =?utf-8?B?SitTLzRpdFVxTS9XSjEveEdhazh0ZTV5eFZYSDd3QkNEM2FlWmhGMm15a2I2?=
 =?utf-8?B?Q1BGUjVkQ1dkTHJHMTRuRDU1RHVyWnprNzNhNUNVbnhMVFY4dGdqcEhMUjdp?=
 =?utf-8?B?QnpTSTU3V0JsYjhkMEM1UDBhNXdsK2g4ejAwNWJ3Z1ZobGx3cUtJdzJ2S3k0?=
 =?utf-8?B?THdudDMwOW9Vc3I2bnJ5VzRwYnZQR2tQd2lPTEV0VENEN21TeDRCNlVnTFVD?=
 =?utf-8?B?aVQ4a0c2MFJwbzg4RG1OMEk2NmlzMVRFYUZUVzBlQzNTL1FpSzdVUGZHbUo5?=
 =?utf-8?B?NURQMHpueTFyK2NyRWNtNXhsZHZFMzF2UllBaHlSWDhlcHNoQ2hjcjQxWmJr?=
 =?utf-8?B?NWV5dE5OUExRSkRwaTM4NGVDN0t4Z1JoTklPTnovczQ5Tjg1SmVodmtaRytF?=
 =?utf-8?B?L21LMEhZUTBqZXhZYkFWTjVJenpnNU8rNFhEWGwycnBST3NnTjZIWXlKSkFU?=
 =?utf-8?B?cEUxZjYzRDN4UUVpejFLOGt3OTN3eXBQUTZKcDJjT3NCRmVYVVl4OUxJK0dB?=
 =?utf-8?B?Zlo1VFYxS1JYWEc4bEFFUTBCUUFhbDZSUVdCS1o2dmFhSVZreFc4eW13cDhw?=
 =?utf-8?B?QlZYWUlUb0lVc1I2Umx4Smp0OGUyb1FybC9SdTVuQjlONzk4blNBVHhVcWtZ?=
 =?utf-8?B?dGFuYm5XWmV0L1o0UjR2TXgvdnBZdjA4K3RZTGttWjVvcUozdlVkTzd6cytt?=
 =?utf-8?B?Y3NpcytxQnJ4UFNZMTA0ek8wM09XYTdZNmJrMW9ybmlRT2NIcDNCOXArSElY?=
 =?utf-8?B?YmlJQk1abStFZ1VZd2FRWS91c1JjWTdtYmJlc243VW5pcXdpZ0ZyTXoyWkNR?=
 =?utf-8?B?RG9CQ0lsWFR6UnYvT0dDeEtWblVGOUNjTnlSZU9mT2dadU50UE1XOExObHda?=
 =?utf-8?B?VTdZNEwvdUYzMXlyamJpVndJcjZYZVRtU1QrWW1pYmNYaG5meUpaS1k1NHNu?=
 =?utf-8?B?QkJjS1FBbU5uWjZTenNsaHJxRzd2alNwRU13dnJuVklyL2ZYMGxIVTEvbkdx?=
 =?utf-8?B?OUwxSTluYlE2Sm9tRjVyeGIrVkFWajMzS0J4ekJjWHZzdklEeVJKUS9HUUll?=
 =?utf-8?B?Y3pvcDJrZVFSNW84Q1Jsc09iZzFvRTBpYXM4bnRYLytIbExJMEV1UEUxdWc2?=
 =?utf-8?B?MmpZdXRpSG9MT2dONUVmZVBuKzJFbDdNNUhIS0ZFS3doMW51bG5nY29NUWRI?=
 =?utf-8?B?TjkwYnBhdDR0Q1NCYlZRT0N4STRUYUh5U3NPMFRqQWd5eEQ4U203MW00MnVC?=
 =?utf-8?B?Vlp3M3VUT3B5NlRlaTN5bnc1Q2F1dEY1TFg4VGEzU0VhbUlGTVRGNUIrMHJR?=
 =?utf-8?B?dXQyamYrWWltcEpwaGlTbk43aDFiWXZDWEtBWDBSZTU3SlYzcE5NV1pCbEFT?=
 =?utf-8?B?YWlRYmpqS2RQY0dPOSsxeFZEcDJNM0QwVWdCWWpJU0xIOVJycGVXY3pKbEQv?=
 =?utf-8?B?ZE11ZkdwU1hBMjhpT3dtNFZ0UUoyVXFnbWpkMVRKTXZ2UU5zaWo3TDNwUWVX?=
 =?utf-8?B?MGhLUmJ4akx1VDRoVS92akpTWDcwRjNFRkFwdWxIYXE2a0d6akYrYnhhNFVm?=
 =?utf-8?B?VFF5dkJOVUYzZERoODhzWk05YTFhbkl4VzFESnRUZDJUNFdqWFR4RGt6cnoy?=
 =?utf-8?B?TXhSTTZ2ZS8xTmVZYmZ6RTVLUWFxNEtIV1RHbFJUbnM1bUJ4ZEg0T0FkMVVh?=
 =?utf-8?Q?tAAx27zuahD8ygdJ4bWpVGzHd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a33c52a-188a-4b0d-0f6c-08db6343b829
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 08:31:10.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qw+GOwkflkwNpgKQcd4RAOF01fzZ5rd8DlaHRa8r3VC23g2pgMdaOjZjTivWq+aeA1bjkSEusqOT85g5kdI7bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 01.06.2023 19:43, Alejandro Vallejo wrote:
> This allows replacing many instances of runtime checks with folded
> constants. The patch asserts support for the NX bit in PTEs at boot time
> and if so short-circuits cpu_has_nx to 1. This has several knock-on effects
> that improve codegen:
>   * _PAGE_NX matches _PAGE_NX_BIT, optimising the macro to a constant.
>   * Many PAGE_HYPERVISOR_X are also folded into constants
>   * A few if ( cpu_has_nx ) statements are optimised out
> 
> We save 2.5KiB off the text section and remove the runtime dependency for
> applying NX, which hardens our security posture. The config option defaults
> to OFF for compatibility with previous behaviour.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

At a guess this may want a Suggested-by: Andrew?

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -307,6 +307,16 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on HVM
>  
> +config REQUIRE_NX_BIT

I don't think "_BIT" in the name is necessary or useful.

> +	def_bool n
> +	prompt "Require NX bit support"

Just

	bool "Require NX bit support"

please.

> +	---help---

In new code just "help" please.

> @@ -151,6 +152,11 @@ not_multiboot:
>  .Lnot_aligned:
>          add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
>          jmp     .Lget_vtb
> +#if IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
> +no_nx_bit:

.Lno_nx_bit (no need for this to end up in the symbol table, just like
most other labels around here).

> @@ -647,11 +653,18 @@ trampoline_setup:
>          cpuid
>  1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
>  
> -        /* Check for NX. Adjust EFER setting if available. */
> +        /*
> +         * Check for NX:
> +         *   - If Xen was compiled requiring it simply assert it's
> +         *     supported. The trampoline already has the right constant.
> +         *   - Otherwise, update the trampoline EFER mask accordingly.
> +         */
>          bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> -        jnc     1f
> +        jnc     no_nx_bit
> +#if !IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
>          orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
> -1:
> +no_nx_bit:
> +#endif
>  
>          /* Check for availability of long mode. */
>          bt      $cpufeat_bit(X86_FEATURE_LM),%edx

I think it would be nice if this check came ahead of the NX one, as
LM availability is quite a bit more important (and hence imo lack
thereof wants diagnosing first). Especially as the re-ordering looks
to be entirely trivial.

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -751,6 +751,15 @@ static void __init efi_arch_cpu(void)
>      {
>          caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
>  
> +        /*
> +         * This check purposefully doesn't use cpu_has_nx because
> +         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
> +         * with CONFIG_REQUIRE_NX_BIT
> +         */
> +        if ( IS_ENABLED(CONFIG_REQUIRE_NX_BIT) &&
> +             !boot_cpu_has(X86_FEATURE_NX) )
> +            blexit(L"This Xen build requires NX bit support");

Nit: Nearby uses of blexit() suggest there wants to be a full stop.

Jan

