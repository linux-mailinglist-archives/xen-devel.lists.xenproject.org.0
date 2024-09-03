Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A839695DE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788717.1198180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOBT-00008b-B4; Tue, 03 Sep 2024 07:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788717.1198180; Tue, 03 Sep 2024 07:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOBT-00005o-7f; Tue, 03 Sep 2024 07:42:39 +0000
Received: by outflank-mailman (input) for mailman id 788717;
 Tue, 03 Sep 2024 07:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slOBS-00005c-3U
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:42:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 141f409f-69c8-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:42:32 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a86984e035aso595822266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 00:42:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c55sm649923866b.194.2024.09.03.00.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 00:42:34 -0700 (PDT)
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
X-Inumbo-ID: 141f409f-69c8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725349355; x=1725954155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qIH3O/ZMdv28jjdWSUaQ90KAl8Wc/O07xbHeFXgYjOw=;
        b=bra2Huu3xvn2WcXHrrfIIwLoPFhJooEHFyU0u+f/cb+toKC6DXaPca+rDXfeW3tXLL
         TPt9aGwA+6lj7hAHH2KjY90sK0inAUlQJz0ImRIuPeU7lN6NjYW1luF1JccI+d+LEEuW
         Dn/MXIyeELZZ6xCD7sv/xECL3aF7o6L4DbDI1MNSLvoKOvA4qBcW4Sjqq314a1T6WF6b
         u0AAUn0lQItO+2PFh/QB7gfRY5vmDktlvXfsox//PZWbsFvkt+3AirsQ1HKBz1MVH5JE
         9nILhpu4BzSxJ0UKWyIwfj1O6+lrUhYFmpVUK16XpFghGfHB49HoZlAHuqnOaA+xVqTy
         rYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349355; x=1725954155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIH3O/ZMdv28jjdWSUaQ90KAl8Wc/O07xbHeFXgYjOw=;
        b=AW1BeXgLAF5KCr7++X8ZND5ehUZYIwJ7YJ2MwqEkQMfZ7yTQqX2xuJ+ZcK9swO73rk
         F0+GSVn2gF0pUfFgF06oHz7VBRyApR4rJ87BUF+E90Treg8t2TdqyuPSQmqkYL8nUlLm
         KYsMRUwze6vXGV+s1z/103XTuJ8hUTXp3GgK/PQDv29jXfMP8R/x3xZ4adMEDcYKDx0v
         IvUfrK8x0FlwRkpZEr4kEo5jGCVuwQ+dciDoHy9GdrSEmiww8jmL1+Fw+9dmRyMlBHyu
         WAsDx2kkSVLF/9oURgDS3MDsOSTEs52aDRs4psSp52CvDWm+kVP3R8HNcSQHOhJ9/ayt
         1Y7w==
X-Forwarded-Encrypted: i=1; AJvYcCXPsTRJGNe1ovVWyhUO0uXo45XbIbmtCUyZCzhgLTheIf/SmXw0cEH0PcRnkZsrqfUsr2+rs6M0g9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE9hs2aWE2AQRxaIRp06R+QvcurKNIrXfXqLqW3MhQdc/O/Jq8
	KxhtJy6SV9IsdQzq9iGs9qei8qutMizMJSLOS/VhloAA3FzW85LRtLcXBUWjoQ==
X-Google-Smtp-Source: AGHT+IF2wO3lOKu6ZqAdlFN+JUeLIvqKjUaqg3AK2oOfKK9TT3DAMHbPi6d/5uGlMzXWI6FzcOStow==
X-Received: by 2002:a17:906:db07:b0:a86:ae95:eba3 with SMTP id a640c23a62f3a-a89a3823702mr963416666b.62.1725349355147;
        Tue, 03 Sep 2024 00:42:35 -0700 (PDT)
Message-ID: <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
Date: Tue, 3 Sep 2024 09:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240903070424.982218-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 09:04, Jiqian Chen wrote:
> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> xc_physdev_map_pirq map a pirq for passthrough devices.
> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> codes.
> 
> But it is fine to map interrupts through pirq to a HVM domain whose
> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
> reference interrupts and it is just the way for the device model to
> identify which interrupt should be mapped to which domain, however
> has_pirq() is just to check if HVM domains route interrupts from
> devices(emulated or passthrough) through event channel, so, the has_pirq()
> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
> 
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
> interrupt of a passthrough device can be successfully mapped to pirq for domU.

As before: When you talk about just Dom0, ...

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case PHYSDEVOP_map_pirq:
>      case PHYSDEVOP_unmap_pirq:
> +        break;
> +
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:

... that ought to match the code. IOW you've again lost why it is okay(ish)
(or even necessary) to also permit the op for non-Dom0 (e.g. a PVH stubdom).
Similarly imo Dom0 using this on itself wants discussing.

As to my earlier comments regarding your commit message adjustments: I
forgot that the change had to be reverted. I'm sorry for that.

Jan

