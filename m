Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88862B0BCE8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051036.1419354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkHD-0005dQ-Na; Mon, 21 Jul 2025 06:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051036.1419354; Mon, 21 Jul 2025 06:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkHD-0005an-KN; Mon, 21 Jul 2025 06:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1051036;
 Mon, 21 Jul 2025 06:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udkHC-0005af-8v
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:45:30 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49aa33f4-65fe-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 08:45:28 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b611665b96so2109147f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:45:28 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4894asm9493995f8f.49.2025.07.20.23.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:45:27 -0700 (PDT)
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
X-Inumbo-ID: 49aa33f4-65fe-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753080327; x=1753685127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0wrlhv2+SHwYP0B5eenP+5aE1q0FLovvgCYOJVk9WVY=;
        b=QiL2e2jj8y0Ojb31RhBzzf5PPFr178sTdXoRBGYfv9ytRUis8dn5NMnB4Z7XductwR
         YP2Jo/hmV/4uJ/eq6HIolk1boEzWn85NWqQNxT5s66fzV5hn+YIs20YVcQYjoV8abPuR
         g/Jf3Q/ZvfVhPsmkViRJiubizY+Zrl/ZVm5vM5yKh7YOlLqWQmQweP6mYYOXLp40wXLT
         GjHHuZjoyULcewEilMCIolXalnB3hq4Lv1bkvVtu9Gq21gCvwadX+6pWMovf1XilG5kb
         9+SAS9PI2qTPjJ/6jBkW/rcP3/TvJtnKZLNGgsrel/j3syTTCZN4dgcPLimrIVVsZyzA
         e7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753080327; x=1753685127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wrlhv2+SHwYP0B5eenP+5aE1q0FLovvgCYOJVk9WVY=;
        b=ZvrbyR1ME/70UyZkC4vOloP+T83tWKg+0GfxeBZObjnRrwO8TQX80vpZOzW+F+Y3h/
         VjymyVQJRHtAIdmwXOYgu2j9YTm5AnQ7kQevnE5D5nIiLa5pPjhsBAGTcYRT1Fl/wlIm
         FjgwY0a2uol87jK1GgQfW2H+uGkFV6wLdziPNthsNn+haIb2g2Fch0ohwY7HjDP8EHJ+
         58lh7EBkxdLw8mKGA7++/0R1R0kEvO6XDzASxvaC38Sk49pzKo8qSsCE/w4VTxFdyjSq
         roBzwrwCFR+sDdtiuZ3h9UACozJeigr2pfrjR3oZ2qUHTyH5mxb0NnunbCjM2fq5leqF
         7w0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+iqmC9ZN/ilAM13pkUSQGgE/VIri2kE9aOX91573lzLdPj9hbrpgDpIy3sJ2YHr0VY0SYwpJKG0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYUH6ib6Uki7OijIeNd7+mj+PD9h8vyd3APwwQb3twxIGZhZh+
	pO9uYDR3mxAyZnnWRT2+iLzyxKVp6DOa3wywhQNhLJUO95kB3PMnI17bHeGbW0BBmQEp31ptHp/
	pcWE=
X-Gm-Gg: ASbGncu3x46DU0RwgivrDFsigJvGP406O2wMCidlpVAzPpmkLAygp39jQeJzZ8N/qG8
	kBALItv80Yv7B7N/fSa8aNHCwzpjimBhI8XV0AtcYzxfHDd+HQTjgjO9uyzwCX/QDdtAl9GkYdn
	9QxE4iL2pS7/h81UvnCtbveXgMpbZwKBe5nDOHQyJIQdaWlWC6o20O4DY+uRS//7eExooR+6E75
	efidoznUAmRl8AH63U3Qw4gZLD9hGH//t+ZK819flMV7riExd4UUe193f4lmUCeRtsUX11MnFd/
	Pj1y9Ksm/3Darlh5RGbrYEjWfmaRLVsx33VAAYoUwi94FPap80HVnWQbT9WTJ1UlhLSxUe6gBMB
	xg+lXM6AixdLNVGNAzAujcMv8v9ldKxseg5iuy0AI7yAFf2/QPFKqczjka4GMjEXxoWHTBBYVTw
	hQ6B4umEHRpG9s3q03whfkyBxzn43RR0tOGLrmJe2XwkJTB8dk89Hzd7pL
X-Google-Smtp-Source: AGHT+IE01FeGg888VldivQRQ7Q+CMiF1Nt9rWpi0M9thdC8iJZ+4qpvCUTNRNOwtxIYeDCL2XOLQ6Q==
X-Received: by 2002:a05:6000:2485:b0:3b5:e2c9:fa05 with SMTP id ffacd0b85a97d-3b60e4d0290mr12854151f8f.18.1753080327555;
        Sun, 20 Jul 2025 23:45:27 -0700 (PDT)
Message-ID: <4c77302b-3f36-4860-a77a-49fd555e52f6@suse.com>
Date: Mon, 21 Jul 2025 08:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/match-cpu: Support matching on steppings
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
 <20250718142006.2471129-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250718142006.2471129-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 16:20, Andrew Cooper wrote:
> Architecturally, stepping is a 4-bit field, so a uint16_t suffices for a
> bitmap of steppings.
> 
> In order to keep the size of struct x86_cpu_id the same, shrink the vendor and
> family fields; there's no need for them to be uint16_t in Xen, and this
> matches the size of the fields in cpuinfo_x86.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


