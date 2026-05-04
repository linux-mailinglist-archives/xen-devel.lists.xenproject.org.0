Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP8IC3xd+GnatQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:49:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B264BA820
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299593.1574135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoys-0005JZ-Ly; Mon, 04 May 2026 08:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299593.1574135; Mon, 04 May 2026 08:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoys-0005HI-JH; Mon, 04 May 2026 08:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1299593;
 Mon, 04 May 2026 08:48:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJoyq-0005HC-Po
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJoyp-0051Ij-MK
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:48:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f85d54-e002-0a2a0a5209dd-0a2a4505aafc-42
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:48:43 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f85d6b-aaa8-0a2a45050019-d1558030a411-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:48:43 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891f625344so39629025e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 01:48:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebb2fa5sm219896165e9.12.2026.05.04.01.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 01:48:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777884523; x=1778489323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vbgbYCz/JWTeo05X+V/PquPUE1/R1Os3MOYFeqM1sQw=;
        b=QxHGSdlKoMKsMUs0e1F04sJNyYKmkQ0NcoKWt1qiI7qTryasZhQ/jirCYqw6zNM4YP
         bw9vvkR3JSfc/fFc/U+f/ZlE+/X7u04lEyeYGdUIK+uNxvViZjzmQmdhxpvmBfiIhSPx
         +I/lMlkLE947FFgWjZQMYZChZ/QI7HX3GaXRuPuOJyl6pXmydkh8nZVgJke+6FpeMwOd
         tyl1kVZRk31YOzh7Mh9O2OxOFMCTNtCoc1k+E2qMW3cmvwVQImQe529MwQoYtQqVw3HI
         nWqKshO12o+FZWGXPcoQ5fp1HbB2coWoC2XZ6iCdBCZrc7QasUbCKCXU6ZBmol4ndxnb
         eltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777884523; x=1778489323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbgbYCz/JWTeo05X+V/PquPUE1/R1Os3MOYFeqM1sQw=;
        b=hFxWKdmyDLmPN6wjVRaaVbH1XNjilY+AK9eU5qC5Kt+wxC+8JS947PghIm0WDXo2XB
         kepd6uQRdF8TV3rKpr88iOjtOdXCNPFJKGd9akzsfO5y0A15WcBDghzd3iZIzpzU6l8S
         TJoHHqCR4oV13HBhfPX17F4VXpp7317QptsyYc+kk/olHYNSXYXdxULhXJzv9O4um0xS
         B0CxlyBexZkGOdi953Dquf07d/+lz0NK18ncFnbk4aSxAyStcofK/lUfg0cwi63wgAKj
         oa3qOnuinWnosFMMqiw9H3PDFxpjdDYpyi5WCLOvIKnHF0x2M0hL7AWufqhYqf6cU+xP
         Fl8w==
X-Gm-Message-State: AOJu0YxhiS05Srw94rGlFo7RY7xuOpBOqlJBm4GMF75WnQ9daIKHxjki
	Q4ozzfLjqCFejYtbODwnnFZSTpJOgx7BArfCHmBm3AUwWQWsIHh69ESth9QV8z5x1Q==
X-Gm-Gg: AeBDieulsrmQNiSYSESdAVIE4j/URB+9qX1unQsVyEv+7zbh9R8Ia5dnFRGzNaLLI6L
	zwZcG4blZHb/kXL+VvFmj+pKjXIDO4fb7wY4zlX0cqA8p72eEofikwydLpONUqyPEh+ZSWTMY++
	1DRv6GjJRtz9LCiPrrOKR4D3JuSJJTJSMirGvt73Y+elNh0aEhS4VhydaHTTYaikJON9qacQmKh
	9N588BJKwVtsQmcf9tXbO72JjJMXUyDKzKsbcQHzEyY5X5odrLFWqtdVLPToxBzDOS1ZHbmNLUM
	IGNqiKlRh5ZgTJi2pCFxB0hUbS0QJbyIeqJByupfunMF0Z3b853NOsk8PYKOLSSTpOTF2JJ1Nil
	To6ozAgXTeIF/mPKQ58IlyGybKR3w8NsdP6VC3sRbzydz7jogKebTtBXH2dujW9Hp7iSNrKPccG
	3gcgQspsGar1gx9wDW3PeHhpCw5xTaO5U43SMG7sF1JG09YgT41+Nlwn3mBBWFlVWqMwpz9gh4k
	Dl348ySEj6Mt8rJu6TFY/MDGg==
X-Received: by 2002:a05:600c:6087:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48a970fe6e2mr138711185e9.13.1777884522787;
        Mon, 04 May 2026 01:48:42 -0700 (PDT)
Message-ID: <8c619af2-0dbd-468f-aa17-c1224d315304@suse.com>
Date: Mon, 4 May 2026 10:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Skip boot memory scrub on platforms with full-memory
 encryption
To: "Samuel.Montgomery61" <Samuel.Montgomery61@protonmail.com>
References: <xJXmemuuJ0kqnGWQ9PWwfFn8_KZVhYSbsAyHFGvDeiqpxUK1Q-ar7Lab7ttRPx-tcEHduS26pU9BkIifbhznT1Qc06vyHfovl1-IXC0cWUU=@protonmail.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <xJXmemuuJ0kqnGWQ9PWwfFn8_KZVhYSbsAyHFGvDeiqpxUK1Q-ar7Lab7ttRPx-tcEHduS26pU9BkIifbhznT1Qc06vyHfovl1-IXC0cWUU=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1777884523-E3B60443-6D2E7520/0/0
X-purgate-type: clean
X-purgate-size: 2787
X-Rspamd-Queue-Id: 77B264BA820
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Samuel.Montgomery61@protonmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 04.05.2026 05:24, Samuel.Montgomery61 wrote:
> Hello,
> 
> Xen's boot-time memory scrub is one of the more time-consuming steps
> during boot, particularly on systems with large amounts of RAM. I'd
> like to propose skipping it on systems with hardware full-memory
> encryption (e.g., Intel TME, AMD TSME).
> 
> These features encrypt all DRAM transparently using an ephemeral key
> generated by the CPU at each boot. The key is not accessible to
> software and does not persist across reboots. This means residual data
> from any previous session where encryption was active is unreadable --
> the same property that boot scrubbing exists to provide.
> 
> The important nuance is that Xen needs to confirm encryption has been
> continuously active since the last scrub, not just that it is active
> now. If encryption was only recently enabled in firmware, residual
> plaintext from prior unencrypted sessions could still be present in
> pages that were never overwritten. Possible approaches:
> 
>   - Record "encryption active" to an EFI variable each boot; skip the
>     scrub only if the flag is present from the previous boot.
>   - Expose a command-line option for administrators to assert that
>     encryption has been consistently enabled.

As you point out, there are issues with default-disabling. We already
have the "bootscrub=" command line option. Is there a reason this can't
be used here as well? I.e. is there a strong reason to put in (perhaps
significant) effort to identify and cover all the corner cases
associated with default-disabling?

Jan

>   - Some combination of the two.
> 
> The optimization would apply only to the cross-reboot case. Runtime
> scrubbing when domains shut down would be unaffected, since all domains
> share the same key during a running session.
> 
> Edge cases worth considering:
> 
>   - Memory written by firmware before encryption activation.
>   - Crash/kexec without a full hardware reset (key may not change).
>   - Suspend/resume (some implementations restore the prior key).
>   - Interaction with existing bootscrub= command-line options.
> 
> As a broader note, multi-key extensions to full-memory encryption (such
> as those used by AMD SEV and Intel TME-MK) could eventually eliminate
> the need for runtime scrubbing as well, by giving each domain its own
> key. This is relevant to the confidential computing work currently
> underway (Teddy Astie's recent AMD SEV RFC), though the boot-scrub
> optimization proposed here is independent and much simpler.
> 
> Feedback welcome on whether the reasoning is sound and whether there
> are edge cases I've missed.
> 
> Thanks,
> 
> Sam
> 
> ps. I'm not subscribed to the list, so please CC me in replies.
> 


