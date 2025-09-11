Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4CBB5365D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 16:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120365.1465332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwiey-0007Y8-Ec; Thu, 11 Sep 2025 14:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120365.1465332; Thu, 11 Sep 2025 14:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwiey-0007We-Br; Thu, 11 Sep 2025 14:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1120365;
 Thu, 11 Sep 2025 14:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwiew-0007WY-Sw
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 14:52:26 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee16f37c-8f1e-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 16:52:25 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so1076226a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 07:52:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec3400c92sm1336966a12.38.2025.09.11.07.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 07:52:24 -0700 (PDT)
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
X-Inumbo-ID: ee16f37c-8f1e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757602345; x=1758207145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2lhZ27yQ4va1xoMlXoRfL42mfmMrtYi47J2r+hzd8r0=;
        b=X172xgHxBIg3VX3rGrrKV7Nw9pjZkDE3m0tlExk6V+yRJJGarZLn9Wius4rQtKxwnS
         Wa4rWcWebAqwPiYbVCPF5Ft2YNPajKn+7Y4rZJvGgEjVjbvSNTVoHsKdPaAxhGhxRSpu
         v3XH0dpQ/DrmMk88lWLx7WjzlR+8cyNHJK4LWiMYOg+SBnSTeUKXPKWU0GkTDPKn2y+r
         sm5YJ6Ix/kqYyBfEmwTp/sd3U0Sj6TEOnv4Z/dojjvXmQn+h/UBiQ6qKZYuPil1Jlgw/
         LTJcmMhGW5TEPhOoImAGvyZrF3xMN+b6UhXs2hhtLke7590i37AgL2cViCsMhNw+tQxE
         Y3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602345; x=1758207145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lhZ27yQ4va1xoMlXoRfL42mfmMrtYi47J2r+hzd8r0=;
        b=Ej6VU+xIo1WOwSw3vDHOjp1FLZUR39EOI1VetpEMeSkPTno6Q365AikaCF1Igoztzu
         TwFhaYnXg5oYHDvMDhdQJRTvXiHnwA0iS9UDw/F3dMezXxkzr0kpSA2mpn8ohS4xxb7R
         PQJjT6xNJvzUT7NDMjaGvOs9j6grEjC1Ctiv0a22YUfDFqq+6xjmbJ9M+pncFd/o7rkP
         BDvxIqYNpmwXQRcomkMTkaJ12xRMol6+6CtahcXdNwL54mdNtweIH2YTD12Jo7fUeOBs
         U/v3sWPiZYrqOGIOvolUXRTCWjyinJMpwxpwZjaPy8IHLpi6TvIeRFKmOVX7OEWIGHKu
         ERIw==
X-Forwarded-Encrypted: i=1; AJvYcCVKlSfPoyfrTwqmNidVJDPiZh3h1uYW7kNvCRs5QpmhDI6CkVPHuaOKTqsBTj/CeGQ6xmLpamIf5BY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1gsuOd9YeC3pEIYbbPsVIYKNCJ/hb/A0qcpo3PZbVekkm1RLQ
	8EtXB23WLpjV9lUAu8yxjIiL5iq9yT+kfb3gwTI7kElgTsE3FxamaRB2pR2P0bGjVg==
X-Gm-Gg: ASbGncviwuODmaK3os/znj6W0VX0coqjWGKJQsgfW9EYezZO8OUqls1E5i2ctYF1EwL
	LDwjBXz9ze3S0i6D5u60tmMNQH6dUC1ixxQFsaXk638weVO4LtvZf3QlHY6Yku51sCOJfFsV05t
	Z7VZkXxCSBB5u8hHv/hN4yyIKL1eZOmVRC/MUlSHhU5CeMd9OYHc1NpIzXa+NMTn7KdyjKWXA/b
	O5lQWnZVh3Ad0Oz4xa/POVSvSJVgr9zBFnhIPQeki3iEnjv1h4iXy3eKdAuctpsuZ7735l6qB95
	NmsRgoHsScK5jgUUFjY8EwdbPFsUOLEXe6wMXa+BYzh7zUwajGV/A2LeQGUHGw719Oo8kKSf6P0
	axKoDEXjHIkP9vtF4PJF2VOd6x3REnYVhjzQd9J0uxcszt2ZFjzouamAOgkLQDkzxlv0TDrJY8R
	zA+g1FL9M9FeBf4efNaw==
X-Google-Smtp-Source: AGHT+IHNCAse2nLu2lgUtDgDErKBK9yqKMEXuusRKDNyJ/cAuMSzxpT0xHeUrM5wLhnShSc680Juuw==
X-Received: by 2002:a05:6402:2102:b0:620:e309:6c67 with SMTP id 4fb4d7f45d1cf-62376d2c9b6mr17463096a12.2.1757602344915;
        Thu, 11 Sep 2025 07:52:24 -0700 (PDT)
Message-ID: <a62ce5aa-6f2e-457b-bf4b-49e6b7f6eb7a@suse.com>
Date: Thu, 11 Sep 2025 16:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 13:53, Alejandro Vallejo wrote:
> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
> by the device model. The GPE handler checks this and compares it against
> the "online" flag on each MADT LAPIC entry, setting the flag to its
> related bit in the bitmap and adjusting the table's checksum.
> 
> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
> reaches 128, even if that overflows the MADT into some other (hopefully
> mapped) memory. The reading isn't as problematic as the writing though.
> 
> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
> then the bit where the "online" flag would be is flipped, thus
> corrupting that memory. And the MADT checksum gets adjusted for a flip
> that happened outside its range. It's all terrible.
> 
> Note that this corruption happens regardless of the device-model being
> present or not, because even if the bitmap holds 0s, the overflowed
> memory might not at the bits corresponding to the "online" flag.
> 
> This patch adjusts the DSDT so entries >=NCPUS are skipped.
> 
> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")

The code in question originates from e5dc62c4d4f1 ("hvmloader: Fix CPU
hotplug notify handler in ACPI DSDT"), though. Before that there was a
different issue (as mentioned in the description).

> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -239,7 +239,8 @@ int main(int argc, char **argv)
>          /* Extract current CPU's status: 0=offline; 1=online. */
>          stmt("And", "Local1, 1, Local2");
>          /* Check if status is up-to-date in the relevant MADT LAPIC entry... */
> -        push_block("If", "LNotEqual(Local2, \\_SB.PR%02X.FLG)", cpu);
> +        push_block("If", "And(LLess(%d, NCPU), LNotEqual(Local2, \\_SB.PR%02X.FLG))",
> +                   cpu, cpu);

Don't we need to use \\_SB.NCPU here? From the other two uses it's not
quite clear; it might also be that the one using this form is actually
needlessly doing so. Yet here it may be better if only for consistency's
sake, as the LNotEqual() also operates on an absolute reference.

The other thing is that I'm not fluent in AML operand evaluation rules.
We want to avoid even the read access to FLG, and I'm unconvinced And()
will avoid evaluating its 2nd argument when the first one is 0. IOW this
may need to become a 2nd "If".

I further think that strictly speaking you mean LAnd() here, not And()
(but the above concern remains; all the ASL spec says is "Source1 and
Source2 are evaluated as integers" for both And() and LAnd()).

Jan

