Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDj9KYn3r2mmdwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:50:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D3249B07
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249986.1547397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzufd-0000I3-Oy; Tue, 10 Mar 2026 10:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249986.1547397; Tue, 10 Mar 2026 10:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzufd-0000F1-Ld; Tue, 10 Mar 2026 10:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1249986;
 Tue, 10 Mar 2026 10:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzufc-0000Et-AM
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 10:50:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7004f13-1c6e-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 11:50:34 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo6265259f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 03:50:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57401sm29081393f8f.38.2026.03.10.03.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 03:50:33 -0700 (PDT)
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
X-Inumbo-ID: f7004f13-1c6e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773139833; x=1773744633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G6fvKaTpBbw6vpDPHysRCUkc3qx/GI/I0SvhAXdQ1Qg=;
        b=Qj5xkEs7aslGIFwuSD+H07MtDx2MDL6HiQNi7pergEsYI/Vc2JZDd6T+5ULknhr23N
         8mejO+5aSPxO8t0oQzXXmXdVv3FoYujwFVb6DSFqIqVJBet7AD9csYwWW0+NEEfS2vTp
         9Hoeldi9Ffcqg64akXeAmjedC+Ck8Bu6xGXQmKwldxdVMSfZb8j9g8zhTvd+NHjGFKWc
         abejTeNJp/qUep0anAYEp9DWkVpp+0/vUXrJnyU44l6val/uZLPjt9qfPtQoW6dMMnCr
         HMGfNSDC+dSCdZ4iVrxtPfxwpvbkJX7XDeM/cjymZrlMTliya66SOpwmPFgtv+Tf1u2M
         NRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139833; x=1773744633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6fvKaTpBbw6vpDPHysRCUkc3qx/GI/I0SvhAXdQ1Qg=;
        b=UnSbXDWjt89wgTkjbC/reVZP/lcqwfEWTFarrXdt3SMv2NRed5OwoLiVgIo0rvwvpW
         PGXYAp3hb1+fdYuNrJ1TSQ6lkASzSS/e/hlvnu/L81Nf1mia5GYqKx9qtif1HUQWVxlk
         0Srkh/sKOGavjAspfKW3seD/uQfz2DR1TsdSlMfRNJux7GKyKfE9CEDTcT4kX+XBoc9R
         eHEpMnLmO0ewoqKRLMtjw5W2P63wZ/qbO7uxOy1hKjflXcQq1mRM0k2ZEVbA2sLiv/JG
         /pKRTB/OTUTAJf0NUNS7zkfgvVGZ26C2fwNZ19OvCOnsK2h9OOZzrXRzAMfS1WJeCIar
         CVgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZebBfMqmAKOm/ufxdByY3RqviUc2TwAij/8MhlPRY+7AJsQ3h5FRopoNGXz+6o6NAa9Wi+R/CJps=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzCgQ1CXGxUBRZKtZYRrTByIx5uev29FyxishrE7ZlZaDWZ4uY
	He+6A5Fmvyur1pScjazD/3W6TZ0nAKOhOdoA5y/Eefhdoku1ugAscLCyXNnoAkE5rPr7a2uze4s
	7PV4=
X-Gm-Gg: ATEYQzw8O6B7I2+ENffi/muAsoVKbVktM1Xl108H93ANJr0Jkv/rgzzMOY7S/Cjs+Hh
	VuAVNjlkAt3nA4qNlsh8BUqQYEP8/Ii/vE1CkUcyfIVnKmd6GczM5qKQks4R9zlraysq+lp8MjL
	4FHlWllsNZGAm6We+uVTQVcHVdDvH9BiAPCXurcDtOUIIZKltVqL5Ut+y3FybPcfVwA3hs6cbZC
	9mz1csGP54/GMQLjCkR+6FRsGV7MPifZGNaIP705bXLFJfCeQLwgV/TRjDa/l6r6LAKR4+44wIa
	JUKVvrxw3f+qdu+0d98XJRughLv3kPtGTYAMomZa64uKaEAM2iBQIKzygHRG+nld3T3UUmkON/i
	1+vkoN427ccl/Ll+l0XE7sNfOWtiS//VjLTwgHy56zteTdSt/1/Ias0rUm4vL8hJLRY2AhTmyl5
	5Uv03p7Xv7rbj+NyCbg+KJYHkx+539/GFGhEcYaPAiMn0PA/Yo1kuYyh/1f9fLdPWXE+ba01yL4
	j1JqjqUXm5XGBg=
X-Received: by 2002:a05:6000:310b:b0:439:bc2b:cb50 with SMTP id ffacd0b85a97d-439da348173mr27037766f8f.4.1773139833489;
        Tue, 10 Mar 2026 03:50:33 -0700 (PDT)
Message-ID: <0f184667-6b62-466c-bb07-393f2b3ca759@suse.com>
Date: Tue, 10 Mar 2026 11:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86: Remove x86 prefixed names from cpuinfo
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-7-kevin.lampis@citrix.com>
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
In-Reply-To: <20260304195350.837593-7-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 173D3249B07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 20:53, Kevin Lampis wrote:
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -43,19 +43,15 @@
>  #ifndef __ASSEMBLER__
>  
>  struct cpuinfo_x86 {
> -    /* TODO: Phase out the x86 prefixed names. */
>      union {
>          struct {
>              union {
> -                uint8_t x86_model;
>                  uint8_t model;
>              };
>              union {
> -                uint8_t x86;
>                  uint8_t family;
>              };
>              union {
> -                uint8_t x86_vendor;
>                  uint8_t vendor;
>              };
>              uint8_t _rsvd;             /* Use of this needs coordinating with VFM_MAKE() */
> @@ -63,7 +59,6 @@ struct cpuinfo_x86 {
>          uint32_t vfm;                  /* Vendor Family Model */
>      };
>      union {
> -        uint8_t x86_mask;
>          uint8_t stepping;
>      };
>  

But then all the now unnecessary unions also want to go away?

Jan

