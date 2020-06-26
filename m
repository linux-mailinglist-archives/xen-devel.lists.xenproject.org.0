Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25A20B09A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:35:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomdd-00011Z-9o; Fri, 26 Jun 2020 11:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jomdb-00011T-CF
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:35:19 +0000
X-Inumbo-ID: 1c022f68-b7a1-11ea-82a4-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c022f68-b7a1-11ea-82a4-12813bfff9fa;
 Fri, 26 Jun 2020 11:35:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 17so9062026wmo.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=d7U+YA59uSygIA3iiTRXVXEJD5qkA9ZYnnSsOLzLJtw=;
 b=lVHWx+lnR0VUOf92PCWH3iw2xFXD3ffYWb4EItZb9db/uank2nSbN94HbWVpXRllsi
 a1nuRXVp4ybUr/iOmeoB+xvJkV89Zlc2gi+2mIvyaJj15VaWrp1JRjxRVSz9que1l/tz
 j1AdaPlh5boRKMoLaupDWsqu/3j/lijo2QktdpMcCjJt8MOhMQF/WcnzkcP+lsgeamHO
 DPZgpsrPwdlEfvJ7nguicQbDLQWg/8Tiz6MnQHgnAgIa/vbdkgTcXBSotsTl97w/XQuh
 CeIDx6k9yd2iukj/vOz0LwwaRLkdZZ0+XO14WBPYuZm60Cd6hGjaHPT0T8tiIlFIeldl
 REaw==
X-Gm-Message-State: AOAM532ZDjktt2K/d5QU9PbsUMZhcIXH/9flY6QxpcB5pYoiI3BZnSgu
 3jOwUV8ltiQkTGfjdxZMuI72lFCq
X-Google-Smtp-Source: ABdhPJyzdw9qagh+dUsvSz75mc9LqRSyqKoWUzuLAe1fxsOkfvvDNCNvpdYrZ58MuImTLb03HjtI9Q==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr2937021wmf.124.1593171317255; 
 Fri, 26 Jun 2020 04:35:17 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p8sm449954wrq.29.2020.06.26.04.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:35:16 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:35:15 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.14] x86/msr: Disallow access to Processor Trace
 MSRs
Message-ID: <20200626113515.hqoa4ppt6bcnr4wj@liuwe-devbox-debian-v2>
References: <20200626112937.919-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200626112937.919-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 12:29:37PM +0100, Andrew Cooper wrote:
> We do not expose the feature to guests, so should disallow access to the
> respective MSRs.  For simplicity, drop the entire block of MSRs, not just the
> subset which have been specified thus far.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
> 
> Paul: For 4.14.  This needs backporting to older trees as well.
> 
> v2:
>  * Drop the whole 0x560 => 0x58f block.

Reviewed-by: Wei Liu <wl@xen.org>

I have not checked the MSR values against the manual, but the
modifications to guest_{rd,wr}msr look correct to me.

Wei.

> ---
>  xen/arch/x86/msr.c              | 2 ++
>  xen/include/asm-x86/msr-index.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 0bfb5839b2..22f921cc71 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -168,6 +168,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      case MSR_TSX_FORCE_ABORT:
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>      case MSR_U_CET:
>      case MSR_S_CET:
>      case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> @@ -329,6 +330,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>      case MSR_TSX_FORCE_ABORT:
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>      case MSR_U_CET:
>      case MSR_S_CET:
>      case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
> index b328a47ed8..0fe98af923 100644
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -69,6 +69,14 @@
>  #define MSR_MCU_OPT_CTRL                    0x00000123
>  #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
>  
> +#define MSR_RTIT_OUTPUT_BASE                0x00000560
> +#define MSR_RTIT_OUTPUT_MASK                0x00000561
> +#define MSR_RTIT_CTL                        0x00000570
> +#define MSR_RTIT_STATUS                     0x00000571
> +#define MSR_RTIT_CR3_MATCH                  0x00000572
> +#define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
> +#define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
> +
>  #define MSR_U_CET                           0x000006a0
>  #define MSR_S_CET                           0x000006a2
>  #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
> -- 
> 2.11.0
> 

