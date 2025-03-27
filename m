Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE6A72A72
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928488.1331182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhRi-00047h-7K; Thu, 27 Mar 2025 07:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928488.1331182; Thu, 27 Mar 2025 07:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhRi-00046F-49; Thu, 27 Mar 2025 07:14:34 +0000
Received: by outflank-mailman (input) for mailman id 928488;
 Thu, 27 Mar 2025 07:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txhRg-000469-VM
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:14:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20eadbbd-0adb-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 08:14:31 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso3882015e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:14:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9f0107sm19391049f8f.99.2025.03.27.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:14:30 -0700 (PDT)
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
X-Inumbo-ID: 20eadbbd-0adb-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743059671; x=1743664471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar6u3vE5k8cjJMLHtlnRZspvr+C6SO3KtqYg6QhKreI=;
        b=O1VJGFijAivdhkiqkHOHp9yVs8uA8budyUX/fD1bAn07c0Hr9617UiAQtcKl5gPAqG
         QAyKpzRhvjBvWMN5IdWmQ1qjrqze6gVAdcdSFmuG3IT1JCxTC7sN7E2xt87PU3FZGQD9
         EnmVjGafzHDxfmEQ6DAbkj3XUtWyPUzRs0yxCGf8KN17rjic5qvlignGaA5SyBUTmA/5
         hUC0Ko4D0pgKZLYKP5z1mLcGzx85SIC/bUOIcNWgkypHQxpoDZYFgf/DkDt/G2di7Pjm
         7sbSJV8jfdcdKwny6QW/NiGCgUqvWUGfc/jgTG5z/qK9J4XqXhoAINSTKdF6cJar7n+r
         MYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743059671; x=1743664471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar6u3vE5k8cjJMLHtlnRZspvr+C6SO3KtqYg6QhKreI=;
        b=IQxt06ACOLBu7bncmxuu0Za7JqamParmm1X4utpEc6geL0foDc3xUY67lhMrr3IXgS
         F5dc76YQx1BkW79GOalmx5qtgRf8IWvkqvfaUfOPgXi4iGiR0ySRalZMFfhlPXV/Ch6W
         TuoYigKwxgTlzqQC2KuLutLfduWT5L4buZNEnN60mMz9YrRw1XS6DxlFRtgzbqtMRBiz
         MU0xAnB6hXA4Tk9laG+pcqeR4okALinZIYqsWh+Px5ReA6C8Pru4+kerl3gVUVW36IA8
         QcJLpAqZMN3lnD1ZhiWVtvG6KXE/tjMWvzIiCD6l2YiloA7VSr9ifS4XeE5nmS27u9iw
         yTQw==
X-Forwarded-Encrypted: i=1; AJvYcCW144VhvR7DO0w6weIfkSBzmuiHTTgRFUxA6sQvoU9CSJt+wNH+8SW25RyFYlUJWlEycnoVo89/fjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPmIKssac0OzF/pCnzxpGtmWv46PgF0S+3wVGzE8P3acRWaIah
	OE+zHrJsyqWSeAIP+zFBwTCEXDGaXtmDi3PjFb4AyneUMxmXywnDzfNzCzLXgQ==
X-Gm-Gg: ASbGncvrwIt8GILvFIC2KdsV7oc9Ek4eQzWxmLChsLcZXj7ooJ51h5k9cAZlOqUtLxK
	mKI/nIWslucGxBACbVPFv3OzJewl+N+VzoNMlVDItqt7rKyhcccMlRv1nu65Egf1B4BPAiP5fFZ
	At7xH+0RzfGQwNILKLlMPJz83KMJ87DXZre0WfsIPDJB28tw9SfL3ZXiJAS+5s73C6e8t0zWUmN
	jYM/ezsGqjqveODnq05G4NZEGk1go4hJ5kDHkWTpQkb9ZD9lT0h7LqXf0dAHlfwGpzIaiLHw5qY
	SAo/zacYb5575V7vwpTmsFKYYyz3WY+sjNnJcNZe69RbvZnegdtkDBHkhLm2r0OIEA0BFger5lP
	9Z2X5f2AYXS8xOa8/IBwXDbTLoQtOaw==
X-Google-Smtp-Source: AGHT+IHtep/InU1QWFFePWfuIHdR+m2XCiKaoX3MruJEKbGshVMPmPG8pwrhS15NeLYvcJruhS3Gqw==
X-Received: by 2002:a5d:5847:0:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-39ad176bc4emr2579107f8f.35.1743059670932;
        Thu, 27 Mar 2025 00:14:30 -0700 (PDT)
Message-ID: <bceac7ee-9204-4d38-8c3c-19bc76534c36@suse.com>
Date: Thu, 27 Mar 2025 08:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tools: remove support for running a guest with
 qemu-traditional
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Nick Rosbrook <rosbrookn@gmail.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-4-jgross@suse.com>
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
In-Reply-To: <20250326160442.19706-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 17:04, Juergen Gross wrote:
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -108,24 +108,7 @@ void pci_setup(void)
>      uint64_t mmio_hole_size = 0;
>  
>      const char *s;
> -    /*
> -     * Do we allow hvmloader to relocate guest memory in order to
> -     * increase the size of the lowmem MMIO hole?  Defaulting to 1
> -     * here will mean that non-libxl toolstacks (including xend and
> -     * home-grown ones) means that those using qemu-xen will still
> -     * experience the memory relocation bug described below; but it
> -     * also means that those using qemu-traditional will *not*
> -     * experience any change; and it also means that there is a
> -     * work-around for those using qemu-xen, namely switching to
> -     * qemu-traditional.
> -     *
> -     * If we defaulted to 0, and failing to resize the hole caused any
> -     * problems with qemu-traditional, then there is no work-around.
> -     *
> -     * Since xend can only use qemu-traditional, I think this is the
> -     * option that will have the least impact.
> -     */
> -    bool allow_memory_relocate = 1;
> +    bool allow_memory_relocate = 0;

I think a fair part of the comment needs to stay. It's sad enough that the
issue still wasn't sorted in qemuu. Instead the other comment referred to
here also wants pruning of "qemu-traditional", I think.

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -843,14 +843,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>  
>      /* If the device model is specified switch to the corresponding tables */
>      s = xenstore_read("platform/device-model", "");
> -    if ( !strncmp(s, "qemu_xen_traditional", 21) )
> -    {
> -        config->dsdt_anycpu = dsdt_anycpu;
> -        config->dsdt_anycpu_len = dsdt_anycpu_len;
> -        config->dsdt_15cpu = dsdt_15cpu;
> -        config->dsdt_15cpu_len = dsdt_15cpu_len;
> -    }

Hmm, rombios.c references these two DSDTs as well, but - is that useful?
If we use dsdt_anycpu_qemu_xen when the device model is explicitly qemuu,
what sense does it make to use one of the other tables when it is
implicitly so?

Jan

