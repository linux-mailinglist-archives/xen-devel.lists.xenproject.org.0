Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F8D019BA
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 09:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197381.1514928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdlac-0004rI-4F; Thu, 08 Jan 2026 08:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197381.1514928; Thu, 08 Jan 2026 08:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdlac-0004oe-1L; Thu, 08 Jan 2026 08:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1197381;
 Thu, 08 Jan 2026 08:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdlab-0004oY-5g
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 08:41:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e407e8-ec6d-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 09:41:51 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso21209635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 00:41:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6ef868sm138402175e9.11.2026.01.08.00.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 00:41:50 -0800 (PST)
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
X-Inumbo-ID: e0e407e8-ec6d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767861711; x=1768466511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FSd53XP5/GHgnvJv/b++KvdNlJAFLhPHwT5yv/HRIU4=;
        b=PtTzlXDaHBIXFfciCst2cL10JWRnd26Oh/xLo6G5BLplcbjszbhBoaR9PJ4nlSUzwt
         ijh2NToeegTvZ2b4YulsI97J11vY5mUkZn49Ox4DhjJn8yiBeppstFbKM/y8KQ1we/b1
         H4T5GJukOnOtG3mjUlSSmNEYcipomCzup1Hu1BHhIY+WETy6F0fgKtK/A453AedRhVCy
         AcaJuskq/UokT/pcnW7DSlo9Tex5+SxMQcxtmDhWZJZgK5tXnvtce442TozDnElctDHa
         sgEN5ZdiiJTqYy8jnMQE9vfWTQmWpntesbAQkzl7LSqz7C9fWLXn4SJj3iQIFFQwfUGY
         qLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861711; x=1768466511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSd53XP5/GHgnvJv/b++KvdNlJAFLhPHwT5yv/HRIU4=;
        b=h8clScdkcVPtQSmc0kfqnstRbyv2hfixKUNG/8aJbJiHVHbR5xt3IcOPZYcov5yKsw
         HKSg8N+Cp/Ud06vE/mIBuJ8Ro9gid3La5RQrflrGatqyEBugBF1J2QuLaRSGUlllMQM3
         Lhx0EZbDxZRRh5nlmEPLUf9Yr7tlCmNEohEzN4vc7DiecmSvz5wlkYPBB4YQ55F4JW/d
         XMtUewvTlFyAk713jgytrbrFdQIj8mPt1feXb5xpV6ePYA3nTnUl00io8yzrd/yAWary
         UE4pFBTMceZsLSRAfymtV5GSz11S7N91UPTtSyOyAup23u5MlayP9hC6gC3j9sAP+9mW
         txww==
X-Forwarded-Encrypted: i=1; AJvYcCXQGpduDqHFg8YKQC+Yogo/JdknC6/43Jyc6HTKONf6kvEs1nJYq4wAu/VnwN6SfvcKYcGx3LFhkg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyKkyQvMR6JhUdI61Nk1tVQYAgocCSHhvPiMJsk/oYppz1edRa
	tFN2jl6PPiteP2jdMgjBMuuqiNUQwAmUMiJkjif2lzPdJn3g6h6dQG9lSq/fPO7jUg==
X-Gm-Gg: AY/fxX4nqUb4ZVfpT2QUKKDMjf3fguTCaK3Cqg1I0/pOuzT+GBi8eIkN7as0WhwRgqM
	44qyaRONcqB0CbNI0UP7AjrA3w4FsVhg97zLUZycbDUNwp9Ixfua3vDvys+LHRX2Jk2zsKFekr+
	0Zi60cTE+p77QBDcOUg5Yq1uESAljulQZGvRKQvYlMXj0WbCebn5qZnb/MmtzdZzNsU8pWCT4uI
	SSs3qWaX8sC68Yd9/NNMupX3MFpLFKMahyH1bUxXlmd6aYcaNNSVasMhdt7OJFuJ2kiZmya/N8Y
	Hr8xJ+kFSpleGjFLY/51nk49VWLFYx9L8pMrSbc5c7hSmwKakE1hK5GBTg2QXHjYI0QFPHXlyFu
	APzu9kW5q+5IXy26TKZAMtdJaaVyjEdZMbnJs/osdLEyP927HCq/yHOgwyLl51HiwnEUkdanvMM
	26vGQPCp8s1rtzFo3Skhcx22z7shpznBbJOoUEm2yJEatKS5F3fuyNE1XDA4S1NfPlbVLJ61mhF
	Tc51F3C6vZkXA==
X-Google-Smtp-Source: AGHT+IFEU2JsLKz49gL8f/AAUcx2SSczNni/oNGM3pZULGHjcrqCu1fYiRZjMXg0XnVvUQJKzUZdCw==
X-Received: by 2002:a05:600c:83c9:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d84b3b719mr72281925e9.31.1767861711227;
        Thu, 08 Jan 2026 00:41:51 -0800 (PST)
Message-ID: <6ac0b4d8-3762-427e-a856-be9118e90dc0@suse.com>
Date: Thu, 8 Jan 2026 09:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <3850c51d41b1ab67a453ca70c0a44172185274f6.1767694781.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3850c51d41b1ab67a453ca70c0a44172185274f6.1767694781.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2026 17:34, Oleksii Kurochko wrote:
> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
> match the known values, which leads to:
>   GICv3: No valid GICC entries exist.
> as observed on the AmpereOne platform.
> 
> To fix this, import the logic from Linux commit 9eb1c92b47c7:
>   The BAD_MADT_GICC_ENTRY check is a little too strict because
>   it rejects MADT entries that don't match the currently known
>   lengths. We should remove this restriction to avoid problems
>   if the table length changes. Future code which might depend on
>   additional fields should be written to validate those fields
>   before using them, rather than trying to globally check
>   known MADT version lengths.
> 
>   Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>   Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>   [lorenzo.pieralisi@arm.com: added MADT macro comments]
>   Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>   Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>   Cc: Will Deacon <will.deacon@arm.com>
>   Cc: Catalin Marinas <catalin.marinas@arm.com>
>   Cc: Al Stone <ahs3@redhat.com>
>   Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>   Signed-off-by: Will Deacon <will.deacon@arm.com>
> 
> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
> used. As we rewrite the MADT for hwdom, reuse the host GICC header length
> instead of ACPI_MADT_GICC_LENGTH.
> 
> [1] https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
> 
> Reported-By: Yann Dirson <yann.dirson@vates.tech>
> Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> I ran CI tests where it made sense for this patch, as I don’t see any CI job
> that builds Xen with CONFIG_ACPI=y:
>   https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2229673951
> 
> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
> AmpereOne platform.
> ---
> Changes in v2:
>  - Update the commit message:
>    - Use more characters for commit ID.
>    - Drop 'import from'.
>  - Add Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>.

Was this a legitimate thing to do, considering ...

>  - Make the local variables host_gicc const in  gic_get_hwdom_madt_size().
>    (header variable isn't const as container_of() will discard 'const' qualifier
>    and so compilation error will occur).
>  - Return 0 instead of panic() in gic_get_hwdom_madt_size().

... all of these (plus leaving partly unaddressed a comment from Julien)?

> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
>  {
>      unsigned long madt_size;
>  
> +    struct acpi_subtable_header *header;

Why is there a blank line left between declarations? In unusual situations (very
many variables, for example) that may be okay, but otherwise the first blank line
generally wants to separate decls from statements.

Also Julien asked for this to be const. You claimed a compile error would occur
if you do, but afaict that's only because ...

> +    const struct acpi_madt_generic_interrupt *host_gicc;
> +
> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
> +    if ( !header )
> +        return 0;
> +
> +    host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
> +                             header);

... you don't use const properly here as well.

Finally (possibly not for this patch, but mentioning since originally it was
pointed out as an option) the function imo wants to become __init anyway, for
(as said by Julien) its only caller being so.

Jan

