Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500FB10707
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055598.1423986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesds-0006DF-DV; Thu, 24 Jul 2025 09:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055598.1423986; Thu, 24 Jul 2025 09:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesds-0006B9-A4; Thu, 24 Jul 2025 09:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1055598;
 Thu, 24 Jul 2025 09:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uesdq-0006B3-Qa
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:53:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f5e8e16-6874-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 11:53:33 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45600581226so8058125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:53:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc6d32dsm1680443f8f.24.2025.07.24.02.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 02:53:32 -0700 (PDT)
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
X-Inumbo-ID: 0f5e8e16-6874-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753350813; x=1753955613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nYTMUeywEtHWnf3fH6Fj7QrTxizU0HtiRoQ7uw+ZCVg=;
        b=E0pwtPpw3Ur99KtiN41FvDRAwa7kWIKL7JAV2qyDkoS74jwG/4ysnKCDNzcBg9DBIJ
         UnuQnPElQgsuae72nM+SdpIBtZEuoH+aj+HN7K1am0UyQbWDE6VqeHUQVQ5nbYJdUwpW
         T2AFNGX8XpDH8BqINmq2imklB8g/JdBBq+ehRG6VB5gR1WJmXnpSb83amaKKLJElTunt
         AJgicCMQAWgrtbsoPA7hg8Cj22NVIIDm2X6lR31uIO+U3lYmQlSzi5Ds3HPtOlXBSb5H
         jSbvEVPK9jNdQbwSvryW4DB6vGgUGJc6Ptk7ST+Ly4geGvMZy1DisZq2m14i8KWapxiw
         P3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350813; x=1753955613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYTMUeywEtHWnf3fH6Fj7QrTxizU0HtiRoQ7uw+ZCVg=;
        b=AebkGveFO3+F0ASDh3OAZHeIts7Dtn2Od7cEcxUsiag7T+83tRMW85iB/w6GnOCZsO
         LMcu0FjT3rivqUQ4unM98ooTk/reSJER8dSaMcoS2m0v+g8zwFR/60Nc/Ett+z9cchvr
         TpS6SJspSrIg9W5zkh6PEZ5AwEZb210Kc2290oiG7f0ZpSC7elgwC43sU9kP6kc4fLqn
         MEyZdiggFMbDlKpdi6su2rP+9sLaefVRuAKewMYWlWA9lvHKHsk6Z+WGKOGqytqAC0u7
         0Lc5L4UloGsRpXo/CYax47T/CEn6x+zrFmix/s3HVXjG1pZ7/e14oaRRGle2bh8e5Pl9
         FSlw==
X-Forwarded-Encrypted: i=1; AJvYcCXNP0LW+yItc8s1H3s+5Pi8V92VTihJP1UBbYokK+CI4iws/cQVWRUCyy6ov/pWWvPi7nxxLWlcD3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+k4SYSRmn6EIOM7/1LjdsBPZIydSEtfvbEoC3aGeCCrYtD+CF
	MVx8FmMpLrnB3bCP4hY2k5R7QtmErAn459BsPqKvwiadZV+IxianUGsha8+nvxJhfA==
X-Gm-Gg: ASbGncu9I8UmyC4whfrwk6RZW9lJ20TZrl5Je7n8Cm99lh4hRfPMHFEjerL3JWl7VjI
	CJEQADafWz+E7vMIEkKEHYqAg18QY8l0YlfK3DbB5b/g5qBQSiSiMq6mRUa6eLnNXtvXyRJc6Po
	mftfzw2pbXSJbCFMDKCLyLYc0ZzhfJY6EsPzaYKhkJ2dUk7DHsOi3Syq7WxN96h2MFlQJkS6yY/
	8myUp0BLn9DhHmm6U+TQU4JwSAGVGhQAgDx4ela62KAFqPzizq3bNnlRYsfiF5HqQSwyosozh9m
	kPwsDTXOchzC/hKPAYZJyJJzeiJ1Eow5Q+W4KYA+OBG2pR6kSfEGWtN1EFWR8ckIkJ1SnfTkEPU
	WQB4QG3YoO3FfXk0gdpA2YICouUGaDZJ+I06HWlORiU5UyUH7VZW9Xo8dl2rMNvAUN6f+PbwXrr
	DiakPZIP8=
X-Google-Smtp-Source: AGHT+IHPTDtaudbhd20hNZuaX5NL45E/BDn04iGQOCTZSxADbYvqcFBbWT6Q4TajqH17lHxSgO9IWg==
X-Received: by 2002:a5d:588c:0:b0:3b7:664a:8416 with SMTP id ffacd0b85a97d-3b768ec1dc2mr5226743f8f.23.1753350812813;
        Thu, 24 Jul 2025 02:53:32 -0700 (PDT)
Message-ID: <8d996de4-0c90-4c34-938d-7b864a8e6189@suse.com>
Date: Thu, 24 Jul 2025 11:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753348261.git.mykyta_poturai@epam.com>
 <5a6bc670f5874ff7015668f25392e5001bdb2414.1753348261.git.mykyta_poturai@epam.com>
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
In-Reply-To: <5a6bc670f5874ff7015668f25392e5001bdb2414.1753348261.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 11:44, Mykyta Poturai wrote:
> On Arm without pci-passthrough=on Xen does not know anything about
> present PCI devices due to PHYSDEVOP_pci_device_add not executing. This
> causes PHYSDEVOP_pci_device_reset to fail when trying to find the device
> that is being reset and return ENODEV.
> 
> Add explicit is_pci_passthrough_enabled check to return a more
> meaningful EOPNOTSUPP code.

I.e. just like PHYSDEVOP_pci_device_{add,remove} already have it. Which
also helps ...

> This change should not affect x86 behavior as pci-passthrough is always
> enabled there.

... proving the no-effect aspect for x86 here.

> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, the subject prefix is entirely misleading. The change helps Arm,
but is in arch-neutral code. Without "physdev" or "physdevop" anywhere in
the subject, whether "pci_device_reset" refers to a function (and you
merely omitted the parentheses) or something else doesn't become clear.

Also, nit: "is_pci_passthrough_enabled()" or "pci-passthrough-enabled" in
the subject, both to correct spelling and to make clear that either you
explicitly mean an existing predicate, or you merely mean to describe that
verbally.

Jan

