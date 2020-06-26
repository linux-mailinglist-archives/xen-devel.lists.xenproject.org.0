Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26F720B093
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:32:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomb1-0000sh-SK; Fri, 26 Jun 2020 11:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jomb0-0000sY-8o
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:32:38 +0000
X-Inumbo-ID: bc64fca2-b7a0-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc64fca2-b7a0-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 11:32:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so8500809wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=wGNOGSdFb+vuii9abQIYL/oVZwugiFPwX3yapdXkByg=;
 b=YdfulbR6UaCJVHBQV970kmcm++I1qy1YmR02GyNHJAHcLeJ1Ksl3AlwujBtEPq1ECL
 Cs6HmEHeSagss9mqkzn8IGLy/yT13WjPrqWn9e4ZfMJvTvKftigXfb3jOqylj8rWi5Bq
 jKX0n+h324dbVUUszxZxawdVCrwetGycKDYoajsjlG9e2erMI6MSKLHCkzX1vUhYMf+C
 Cx8QYxVEklzj9w7TfNqKesjgtvY0/kXFvRPHt2oWUo4w1cxQsAW1e2RNXpqbrVi1/Cde
 zBL10wjzPkxZjI21R9e6PDRbiVch9GljGsaH/fkWKREyYinIbbBx+sU9wW7k7Bg/jKkr
 BrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=wGNOGSdFb+vuii9abQIYL/oVZwugiFPwX3yapdXkByg=;
 b=nWM36Il0M3/MxhwXwCn7FfWJPrEeCxHvlwMrEyLZZi7wjGZLUCOg9lDHwpu57OVkLy
 e/MLzFUIqubyqhg9x+NmLbcVJgvI+yIvJxMD1qUejd2LaWJatJQZPXfPDjXAGScHaCzD
 Iv7NnpelsEcTkC62xr7WzCVRkDsUHfhCMmGuQFbBq/HQEUqPBFwTG4qunLl1zTLNPs2g
 z35YWM8yIINTOPtyvqEUXN2ktvPVv+TjKj5UZRAZBFkumixlr8SQlUnp9qotywE4Robk
 e68yqEnGw13SAmMLPS4PbLhb1CtNgerStcanrmKqh9HA7COHPvsh+vQ4yw+JccovCXOl
 tJQg==
X-Gm-Message-State: AOAM5338Zg7nD3pRQkEXENjfPkVIpCWUUSRJsdnHFVV4M6qfwPHxdX6e
 IPYU5oxrJNq86OEmDKi+W+k=
X-Google-Smtp-Source: ABdhPJzvN5hE9na42/fWZo8IBA72u6c2sIUZF29ixkQODJRKZoxYtHtvLY2yyc2fZexZ8rBPnTjMxA==
X-Received: by 2002:a1c:4408:: with SMTP id r8mr2955751wma.100.1593171156606; 
 Fri, 26 Jun 2020 04:32:36 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id 65sm17562247wma.48.2020.06.26.04.32.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 04:32:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200626112937.919-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200626112937.919-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 for-4.14] x86/msr: Disallow access to Processor Trace
 MSRs
Date: Fri, 26 Jun 2020 12:32:35 +0100
Message-ID: <000901d64bad$7d86f3f0$7894dbd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2K7Qshipg+dBwwv0Oi6OatfdfEqirA1wQ
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
Reply-To: paul@xen.org
Cc: =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Wei Liu' <wl@xen.org>, 'Jan Beulich' <JBeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 26 June 2020 12:30
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>; Micha=C5=82 Leszczy=C5=84ski
> <michal.leszczynski@cert.pl>
> Subject: [PATCH v2 for-4.14] x86/msr: Disallow access to Processor =
Trace MSRs
>=20
> We do not expose the feature to guests, so should disallow access to =
the
> respective MSRs.  For simplicity, drop the entire block of MSRs, not =
just the
> subset which have been specified thus far.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
>=20
> Paul: For 4.14.  This needs backporting to older trees as well.
>=20
> v2:
>  * Drop the whole 0x560 =3D> 0x58f block.

Looks ok to me.

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  xen/arch/x86/msr.c              | 2 ++
>  xen/include/asm-x86/msr-index.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 0bfb5839b2..22f921cc71 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -168,6 +168,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, =
uint64_t *val)
>      case MSR_TSX_FORCE_ABORT:
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>      case MSR_U_CET:
>      case MSR_S_CET:
>      case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> @@ -329,6 +330,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, =
uint64_t val)
>      case MSR_TSX_FORCE_ABORT:
>      case MSR_TSX_CTRL:
>      case MSR_MCU_OPT_CTRL:
> +    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>      case MSR_U_CET:
>      case MSR_S_CET:
>      case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
> diff --git a/xen/include/asm-x86/msr-index.h =
b/xen/include/asm-x86/msr-index.h
> index b328a47ed8..0fe98af923 100644
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -69,6 +69,14 @@
>  #define MSR_MCU_OPT_CTRL                    0x00000123
>  #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
>=20
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



