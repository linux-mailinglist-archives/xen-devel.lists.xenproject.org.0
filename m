Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IciAJdnnWlgPQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:55:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE118413E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239544.1540947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoCf-0001jJ-H1; Tue, 24 Feb 2026 08:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239544.1540947; Tue, 24 Feb 2026 08:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoCf-0001gm-Dy; Tue, 24 Feb 2026 08:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1239544;
 Tue, 24 Feb 2026 08:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuoCd-0001gL-Aj
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:55:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 941d545b-115e-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 09:55:33 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso36813665e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 00:55:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm277044795e9.13.2026.02.24.00.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 00:55:31 -0800 (PST)
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
X-Inumbo-ID: 941d545b-115e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771923332; x=1772528132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pse68QmsMZ2mYBtP5DOaMmGWE8cCC9HDLA/Vs7gWXZQ=;
        b=VJmsTbCujRWATth8aNRiVmHJC22eVuVzMH8BVCUJfuxd4An+s6OvNfLLzmhaqyi32K
         rU21RzomjnVB+SCmzclSb8JeFpbksiqYcvMyksrs3gpyOftbNy3ALgfkba3C9La8npMv
         iywAdz1lIfdIxIs2RotoWzw1Kd//FWbzHE6YgyoGckjtE/KVkKvGI3GdFADHlxLWUZhn
         4lGSgqIkO1lE9SaOTurhirsQ+hXJco/BVv9a891uL6S1pUtzdRLhjTojrLOyBsuGjxbR
         tirk5HAihylh9mY1nJiK0a/fMIRzFTWQlS1TOBJByUi8Eb5Hoz3bubhx9buvvsjOBCxk
         eNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771923332; x=1772528132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pse68QmsMZ2mYBtP5DOaMmGWE8cCC9HDLA/Vs7gWXZQ=;
        b=eFB+XL9u2p1LgS1Xbi6k2eHrEwAzXCETYPGRverADV0Atn9+CKlSMBeEkRoIIm06/J
         6ImIVpEOyGDZJK3/vosulM/mnu43duM5Fs8uTUSx6+KXyfk9zSbeD9Z2UhzAUb/BT4Z5
         nIpNUdxZ80PMHMHGTehlQW1kyvocu0zA7S0wkKXoN+n3zhrMQrqXFBEd6h6zSKirK9ct
         QeHcAtL48EU4DU8RbAeRv1SmBjL4iUlrvAsbxU7PF7lxAmItXTdCoPn4SNDGzJBEBGcr
         YtiYNFWX6DTrt2dW2OMJdYT6jzo7frQGMg9itMdS2Dj5kvAGicY/v3vh8Gp0XREsxlaj
         494A==
X-Forwarded-Encrypted: i=1; AJvYcCV3DMQETnFAHTykKNn2XyrHM/F5LBjkdiW9EYFLEhh/ITrCiYVyvxWamUemXs6YTG3p2okuoVvvNuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoGIw5tu3cT+WXC6OTMfcOzhxe6B+xqRQrDn6tFWyNcG/+olmr
	R0Els/8a9EjNNZIn4fLSahRzdO6sZ+5tdpsPGGIsqA2gEOAGYRz2Wi4+EwiHa1YucQ==
X-Gm-Gg: AZuq6aKgDi/L2yhgu6PyW/EQljkhQLhNR1lc6O2R3oy819reKfUMV6M+tOO2KdQiJJa
	QCYr6w9K5o3OEdn1eHym7abO7PSbwk1+TpxF5RV3P3ohgsTJicfWMNFtzakpMHZfh1/q49Wrnr8
	Kuxx6C7seN3oB93LtShi9X8QqqxnAGdrycU5Ts+ji76INDhxvxnv3qQZZ3zBvciEb2kNOYUrU96
	vPDEoeUppcuGuaXNYUyo+E54uMUik8Erb+pPvv4tizDQwBj0A9Yr1glmzYeOfxElt7JsAQeRhzc
	65qRwVcHH/r+0+r3FWorzEDL4exT7ZbI6tgjM3Kkwi0mJw/Ue3LmCdn/vzfLt+IxF3C9UJGTgtb
	qVCATZ1vEdH4S5I8eqeYZQfBUq8/ySiRnC9jS5O/EfKwGaRdG1feSf3uOgHW5aJ+TqWpipyuJvk
	tSw9bzhL5l7OCswxoDpdjqhLlnnF9K/+IIjLhPfqEJX851se3C5FEevzO0q6fsCvGhxoKUVYfgb
	suyUYllZJ1g8uQ=
X-Received: by 2002:a05:600c:1e1d:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483a9637a55mr204577105e9.25.1771923332163;
        Tue, 24 Feb 2026 00:55:32 -0800 (PST)
Message-ID: <fee7d624-68df-4fc2-b340-e1e72a341fa8@suse.com>
Date: Tue, 24 Feb 2026 09:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Remove fallback path from SWAPGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260223170856.3594016-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260223170856.3594016-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,sreg.base:url];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5FEE118413E
X-Rspamd-Action: no action

On 23.02.2026 18:08, Andrew Cooper wrote:
> In real hardware, accesses to the registers cannot fail.  The error paths are
> just an artefact of the hook functions needing to return something.
> 
> The best effort unwind is also something that doesn't exist in real hardware,
> and complicates following the logic.
> 
> Instead, use an ASSERT_UNREACHABLE() with a fallback of injecting #DF.
> Hitting this path is an error in Xen.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Tested using LKGS's extention of the test emulator for SWAPGS.
> ---
>  xen/arch/x86/x86_emulate/0f01.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
> index 6c10979dd650..760f5f865913 100644
> --- a/xen/arch/x86/x86_emulate/0f01.c
> +++ b/xen/arch/x86/x86_emulate/0f01.c
> @@ -192,18 +192,21 @@ int x86emul_0f01(struct x86_emulate_state *s,
>          if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
>                                       ctxt)) != X86EMUL_OKAY ||
>               (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> -                                 ctxt)) != X86EMUL_OKAY ||
> -             (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> -                                  ctxt, false)) != X86EMUL_OKAY )
> +                                 ctxt)) != X86EMUL_OKAY )
>              goto done;
> -        sreg.base = msr_val;
> -        if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
> -                                      ctxt)) != X86EMUL_OKAY )
> +        if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> +                                  ctxt, false)) != X86EMUL_OKAY ||
> +             (sreg.base = msr_val,
> +              (rc = ops->write_segment(x86_seg_gs, &sreg,
> +                                       ctxt)) != X86EMUL_OKAY) )
>          {
> -            /* Best effort unwind (i.e. no real error checking). */
> -            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
> -                                ctxt, false) == X86EMUL_EXCEPTION )
> -                x86_emul_reset_event(ctxt);
> +            /*
> +             * In real hardware, access to the registers cannot fail.  It is
> +             * an error in Xen if the writes fail given that both MSRs have
> +             * equivalent checks.
> +             */

While copying the comment to the LKGS patch, I wondered: What "both MSRs" is
this talking about? Both here and for LKGS it's ->write_msr() followed by
->write_segment(). This hence might be alluding to your further plan to
avoid ->write_segment() on these paths?

Further, both having equivalent checks is either only a justification for the
latter not failing, or only for the former not failing because it writes a
value read from the other MSR.

It's not quite clear to me though how to best re-word things.

> +            ASSERT_UNREACHABLE();
> +            generate_exception(X86_EXC_DF);
>              goto done;

While mirroring the change, it also occurred to me that this goto can be
dropped, for being unreachable after generate_exception().

Jan

