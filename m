Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF629B3732
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826863.1241292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5T4b-0004DY-0u; Mon, 28 Oct 2024 16:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826863.1241292; Mon, 28 Oct 2024 16:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5T4a-0004BK-St; Mon, 28 Oct 2024 16:58:32 +0000
Received: by outflank-mailman (input) for mailman id 826863;
 Mon, 28 Oct 2024 16:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5T4Z-0004BE-Mt
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:58:31 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dba61aa6-954d-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 17:58:30 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so3210217f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:58:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b47a41sm10020651f8f.52.2024.10.28.09.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:58:29 -0700 (PDT)
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
X-Inumbo-ID: dba61aa6-954d-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730134710; x=1730739510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EQFmdnsTxtmh3WwX2n9GalSRp2I3mYORI+1Zu+WZe1M=;
        b=XAPHWjzQp7XrJwg1fsCQbiFAPTm5SQrL39YSFlW6qRw5xohPSoInuLv5Pxl01zqgpG
         KjplxmGW1OR7i+0bla4ioTxsUTy6nsZFIBH1oJeYsOJAYp+Qvu3QhUU3m/pvOSYhyLWP
         uv/q1OjIb8QVH1KqDfYx9pxPgkhlgXB+zNUg1VXlnotzv5XW61t2Nk4+HGKrBgRClBbD
         SBrwmc85DAWSifbkVS/95i3OydQqVuVzidXhLzg8MlSQEpM+QLHVOwfDd2H/d3mxXrVN
         PgI/2MZjeugYSUYO6Tz+pihjge6KP8ski+Iz0Eb9ODC9uuew99JP2MXpAncYpWYM/uHO
         6nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730134710; x=1730739510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQFmdnsTxtmh3WwX2n9GalSRp2I3mYORI+1Zu+WZe1M=;
        b=jyxJH4QEUry/ui0jNPxMoVRABTmgKgmVodJDj+a5RlI9QsS56Da0CJMXchFsmAlfKJ
         R3R1Ipv6m0DDgK8OdU+68t5mFwwUs5sbpH+RW5ISeKhByBr3s/NEI6cj2lvyIwrKdb+U
         ElCrDJEi8ZvObmJq1rmlEgHbtb1GRdnKbuJXIM3ZKT2Nomx2/OZKmxS0/QrTUs0zVOK5
         /f0TSYGnilszlzU6n9DUqzXiWTUo88f3d2ybagFwhiEccr71ENqal6otpMxVB0X8gAhB
         jLeLFVfcyIICb7G4qXzoop7Txm+xFzjmNAgsr0urCpfvMjUKy8OfxnNciwFu9HCh+Jic
         JguQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmiexTrF6PwTAMHRbY4Q7MY1wf+kDWLbomeJDDFTM9zOCvzTLaS+QGAPUvF0qc+gtukCuOpROsLik=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQ0kcoUBNpsiZ6ZBZ5mn1l4h3HmJkKIZWmDH85FVa7/xhw+poh
	3zHI0cYdkiziLOw8mnfY5iWTfjUYd/lxc0UNX2ZqC5oXPGxXZqFd7N+msw6SBw==
X-Google-Smtp-Source: AGHT+IFQbMMx14nhQK9TBIkXfsd26ZWT1pV5V5/hdfOZforK+R1TuHFnWiJF3OKdfxkBxCBRPpk7iw==
X-Received: by 2002:adf:f4cf:0:b0:371:9360:c4a8 with SMTP id ffacd0b85a97d-380610f81e7mr6802655f8f.6.1730134709651;
        Mon, 28 Oct 2024 09:58:29 -0700 (PDT)
Message-ID: <fdb156eb-ea82-4afa-afa6-105e605eba6d@suse.com>
Date: Mon, 28 Oct 2024 17:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86/msi: harden stale pdev handling
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241018203913.1162962-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.10.2024 22:39, Stewart Hildebrand wrote:
> Dom0 normally informs Xen of PCI device removal via
> PHYSDEVOP_pci_device_remove, e.g. in response to SR-IOV disable or
> hot-unplug. We might find ourselves with stale pdevs if a buggy dom0
> fails to report removal via PHYSDEVOP_pci_device_remove. In this case,
> attempts to access the config space of the stale pdevs would be invalid
> and return all 1s.
> 
> Some possible conditions leading to this are:
> 
> 1. Dom0 disables SR-IOV without reporting VF removal to Xen.
> 
> The Linux SR-IOV subsystem normally reports VF removal when a PF driver
> disables SR-IOV. In case of a buggy dom0 SR-IOV subsystem, SR-IOV could
> become disabled with stale dangling VF pdevs in both dom0 Linux and Xen.
> 
> 2. Dom0 reporting PF removal without reporting VF removal.
> 
> During SR-IOV PF removal (hot-unplug), a buggy PF driver may fail to
> disable SR-IOV, thus failing to remove the VFs, leaving stale dangling
> VFs behind in both Xen and Linux. At least Linux warns in this case:
> 
> [  100.000000]  0000:01:00.0: driver left SR-IOV enabled after remove
> 
> In either case, Xen is left with stale VF pdevs, risking invalid PCI
> config space accesses.
> 
> When Xen is built with CONFIG_DEBUG=y, the following Xen crashes were
> observed when dom0 attempted to access the config space of a stale VF:
> 
> (XEN) Assertion 'pos' failed at arch/x86/msi.c:1274
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040346834>] R pci_msi_conf_write_intercept+0xa2/0x1de
> (XEN)    [<ffff82d04035d6b4>] F pci_conf_write_intercept+0x68/0x78
> (XEN)    [<ffff82d0403264e5>] F arch/x86/pv/emul-priv-op.c#pci_cfg_ok+0xa0/0x114
> (XEN)    [<ffff82d04032660e>] F arch/x86/pv/emul-priv-op.c#guest_io_write+0xb5/0x1c8
> (XEN)    [<ffff82d0403267bb>] F arch/x86/pv/emul-priv-op.c#write_io+0x9a/0xe0
> (XEN)    [<ffff82d04037c77a>] F x86_emulate+0x100e5/0x25f1e
> (XEN)    [<ffff82d0403941a8>] F x86_emulate_wrapper+0x29/0x64
> (XEN)    [<ffff82d04032802b>] F pv_emulate_privileged_op+0x12e/0x217
> (XEN)    [<ffff82d040369f12>] F do_general_protection+0xc2/0x1b8
> (XEN)    [<ffff82d040201aa7>] F x86_64/entry.S#handle_exception_saved+0x2b/0x8c
> 
> (XEN) Assertion 'pos' failed at arch/x86/msi.c:1246
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040346b0a>] R pci_reset_msix_state+0x47/0x50
> (XEN)    [<ffff82d040287eec>] F pdev_msix_assign+0x19/0x35
> (XEN)    [<ffff82d040286184>] F drivers/passthrough/pci.c#assign_device+0x181/0x471
> (XEN)    [<ffff82d040287c36>] F iommu_do_pci_domctl+0x248/0x2ec
> (XEN)    [<ffff82d040284e1f>] F iommu_do_domctl+0x26/0x44
> (XEN)    [<ffff82d0402483b8>] F do_domctl+0x8c1/0x1660
> (XEN)    [<ffff82d04032977e>] F pv_hypercall+0x5ce/0x6af
> (XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
> 
> These ASSERTs triggered because the MSI-X capability position can't be
> found for a stale pdev.
> 
> Latch the capability positions of MSI and MSI-X during device init, and
> replace instances of pci_find_cap_offset(..., PCI_CAP_ID_MSI{,X}) with
> the stored value. Introduce one additional ASSERT, while the two
> existing ASSERTs in question continue to work as intended, even with a
> stale pdev.
> 
> Fixes: 484d7c852e4f ("x86/MSI-X: track host and guest mask-all requests separately")
> Fixes: 575e18d54d19 ("pci: clear {host/guest}_maskall field on assign")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Looks largely okay to me now, just two type selection aspects:

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -278,23 +278,21 @@ void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable)
>  
>  static void msi_set_enable(struct pci_dev *dev, int enable)
>  {
> -    int pos;
> +    int pos = dev->msi_pos;

This and ...

>      u16 seg = dev->seg;
>      u8 bus = dev->bus;
>      u8 slot = PCI_SLOT(dev->devfn);
>      u8 func = PCI_FUNC(dev->devfn);
>  
> -    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
>      if ( pos )
>          __msi_set_enable(seg, bus, slot, func, pos, enable);
>  }
>  
>  static void msix_set_enable(struct pci_dev *dev, int enable)
>  {
> -    int pos;
> +    int pos = dev->msix_pos;

... this want to become unsigned int at this occasion, imo. Like we have ...

> @@ -764,7 +762,7 @@ static int msix_capability_init(struct pci_dev *dev,
>      u8 slot = PCI_SLOT(dev->devfn);
>      u8 func = PCI_FUNC(dev->devfn);
>      bool maskall = msix->host_maskall, zap_on_error = false;
> -    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
> +    unsigned int pos = dev->msix_pos;

... e.g. here already.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -113,6 +113,9 @@ struct pci_dev {
>          pci_sbdf_t sbdf;
>      };
>  
> +    unsigned int msi_pos;
> +    unsigned int msix_pos;
> +
>      uint8_t msi_maxvec;
>      uint8_t phantom_stride;

As can be seen from the subsequent members, we're trying to be space
conserving here. Both fields won't require more than 8 bits, so uint8_t
or unsigned char would be the better type to use. Again imo. Preferably
with those adjustments (which could likely be done while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

