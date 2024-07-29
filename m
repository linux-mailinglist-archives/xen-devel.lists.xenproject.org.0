Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9E93F3BC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766606.1177113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOJN-00043s-DM; Mon, 29 Jul 2024 11:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766606.1177113; Mon, 29 Jul 2024 11:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOJN-00041r-AH; Mon, 29 Jul 2024 11:13:05 +0000
Received: by outflank-mailman (input) for mailman id 766606;
 Mon, 29 Jul 2024 11:13:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYOJL-0003ds-Bj
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:13:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85680bb4-4d9b-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 13:13:02 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso453167466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:13:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad426aasm494112666b.105.2024.07.29.04.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:13:01 -0700 (PDT)
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
X-Inumbo-ID: 85680bb4-4d9b-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722251582; x=1722856382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S0XskagNe3/5G8CJDuDPhhS02aAa2EarHZUmEHf3vUg=;
        b=OjmmINxUCGSOd/lzlB/Wh65FHmTt7LFZPzX2wsj+kWw3CGfv2wNIJQaXEqnOnvnNBI
         Bs3hoDTKBDjFsINHsjSKvahIsH5+/QLCNzj12hlcidSiKMGpI2GDZTbf/peObShMFUTq
         7OKm2TrcL1cEAmGjL/CyFvlBD07bTUgGoZStHhQn7iZ+icrtjer0o4+p9JY7BCUoSXpe
         wxHVaxHsvE3ATryCjlmSjk5t3bbTwlb1BosibSL3H6OXnTHYj/ueaDG3K86ijpEq/yR0
         zDy+OdZezcqLMBRQVqMB8/9SBja895X0oKKXSpEI+DPkay9DXIMFNonw1tNaLj7t7sva
         /kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251582; x=1722856382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0XskagNe3/5G8CJDuDPhhS02aAa2EarHZUmEHf3vUg=;
        b=WVHFClcUCVPEGl0Na3JlTBlCgfrB16/lePyBPqD2MUpQWKONCHpxvKOEZM1aTwcLeG
         D8TdbmQ11wWqNk8bjwOFqTViT9zpDvv/xSdtdQrk0EG9w2buYVgRJDTMFxKgpGSQYw4B
         DWV/40+ExZJQ6VESSsYzCP0Ws+Unqoii8CZdZlWhC6awEvu2l1Oxi+VcxI4R3QtS0TQJ
         YZ0Pj+HvqQqcdZm18qlP56thpqp063DnS5CPrtvvvo6fDNKDDMnaVqi7IQqRmGYTqpgI
         Q/ulBOK7tu+8yPy7U/KT16zn7Ntn3Xtjwt7DQUY5b3A0Q1YiRbKCGN1MsQr3vSev4yf9
         Y8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy6CR5cXk1IrG0GD9UFbiNSe1dpiea8A5Gj+VhWuYyNpO4TLHu7asBJIQoZ3rXTuCr9K7xfLGGmilKk2qEGwNctBkspj4H15NQXzAjoFo=
X-Gm-Message-State: AOJu0YyinzHc9VAZkOLEzlj+Ofb6UORTcFJan8/QrWEGiXb5hBmxXv6K
	NtS9FL9kRUvnW7WTGrhtoKMwvP0iCU2O6SqNJGYcKhpTGqa8KzpR0QWa4VsoHw==
X-Google-Smtp-Source: AGHT+IEo6OUdTUDTGyPhR3Vf4FZmQt6CAiOf9SWn61VlB8YqEn5C1nWU3+Md9QqJa77ocgMZZNSQTw==
X-Received: by 2002:a17:907:7e81:b0:a7a:3928:3529 with SMTP id a640c23a62f3a-a7d3fdb643fmr546004766b.13.1722251581942;
        Mon, 29 Jul 2024 04:13:01 -0700 (PDT)
Message-ID: <a713e7a4-61d6-48ec-95ca-ad729fa3395d@suse.com>
Date: Mon, 29 Jul 2024 13:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.fe70b6220fe40bbe11f97b9396340c5dd11d59aa.1721958949.git-series.marmarek@invisiblethingslab.com>
 <7439bbc83314e4d24a82afca4f6dbf1a1d002141.1721958949.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <7439bbc83314e4d24a82afca4f6dbf1a1d002141.1721958949.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 03:55, Marek Marczykowski-Górecki wrote:
> In some cases, only few registers on a page needs to be write-protected.
> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> PBA table (which doesn't need to span the whole table either), although
> in the latter case the spec forbids placing other registers on the same
> page. Current API allows only marking whole pages pages read-only,
> which sometimes may cover other registers that guest may need to
> write into.
> 
> Currently, when a guest tries to write to an MMIO page on the
> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> from userspace (like, /dev/mem), it will try to fixup by updating page
> tables (that Xen again will force to read-only) and will hit that #PF
> again (looping endlessly). Both behaviors are undesirable if guest could
> actually be allowed the write.
> 
> Introduce an API that allows marking part of a page read-only. Since
> sub-page permissions are not a thing in page tables (they are in EPT,
> but not granular enough), do this via emulation (or simply page fault
> handler for PV) that handles writes that are supposed to be allowed.
> The new subpage_mmio_ro_add() takes a start physical address and the
> region size in bytes. Both start address and the size need to be 8-byte
> aligned, as a practical simplification (allows using smaller bitmask,
> and a smaller granularity isn't really necessary right now).
> It will internally add relevant pages to mmio_ro_ranges, but if either
> start or end address is not page-aligned, it additionally adds that page
> to a list for sub-page R/O handling. The list holds a bitmask which
> qwords are supposed to be read-only and an address where page is mapped
> for write emulation - this mapping is done only on the first access. A
> plain list is used instead of more efficient structure, because there
> isn't supposed to be many pages needing this precise r/o control.
> 
> The mechanism this API is plugged in is slightly different for PV and
> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> it's already called for #PF on read-only MMIO page. For HVM however, EPT
> violation on p2m_mmio_direct page results in a direct domain_crash() for
> non hardware domains.  To reach mmio_ro_emulated_write(), change how
> write violations for p2m_mmio_direct are handled - specifically, check
> if they relate to such partially protected page via
> subpage_mmio_write_accept() and if so, call hvm_emulate_one_mmio() for
> them too. This decodes what guest is trying write and finally calls
> mmio_ro_emulated_write(). The EPT write violation is detected as
> npfec.write_access and npfec.present both being true (similar to other
> places), which may cover some other (future?) cases - if that happens,
> emulator might get involved unnecessarily, but since it's limited to
> pages marked with subpage_mmio_ro_add() only, the impact is minimal.
> Both of those paths need an MFN to which guest tried to write (to check
> which part of the page is supposed to be read-only, and where
> the page is mapped for writes). This information currently isn't
> available directly in mmio_ro_emulated_write(), but in both cases it is
> already resolved somewhere higher in the call tree. Pass it down to
> mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
> 
> This may give a bit more access to the instruction emulator to HVM
> guests (the change in hvm_hap_nested_page_fault()), but only for pages
> explicitly marked with subpage_mmio_ro_add() - so, if the guest has a
> passed through a device partially used by Xen.
> As of the next patch, it applies only configuration explicitly
> documented as not security supported.
> 
> The subpage_mmio_ro_add() function cannot be called with overlapping
> ranges, and on pages already added to mmio_ro_ranges separately.
> Successful calls would result in correct handling, but error paths may
> result in incorrect state (like pages removed from mmio_ro_ranges too
> early). Debug build has asserts for relevant cases.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with the prior restriction that this does not include the usually implied
ack.

> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    unsigned int offset_end = 0;
> +    int rc;
> +    bool subpage_start, subpage_end;
> +
> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> +    if ( !IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN) ||
> +         !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> +        return -EINVAL;

As a minor remark: I can certainly see the value of having separate
assertions. For the if() I wonder though if it wouldn't better be

    if ( !IS_ALIGNED(start | size, MMIO_RO_SUBPAGE_GRAN) )
        return -EINVAL;

Jan

