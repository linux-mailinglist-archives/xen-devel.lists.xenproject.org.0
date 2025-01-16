Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E3A135DD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873334.1284296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLb7-0003KU-Jn; Thu, 16 Jan 2025 08:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873334.1284296; Thu, 16 Jan 2025 08:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLb7-0003ID-Gi; Thu, 16 Jan 2025 08:51:29 +0000
Received: by outflank-mailman (input) for mailman id 873334;
 Thu, 16 Jan 2025 08:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQTT=UI=ventanamicro.com=ajones@srs-se1.protection.inumbo.net>)
 id 1tYLb5-0003I7-Ve
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:51:28 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12319c9a-d3e7-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 09:51:26 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38637614567so324350f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 00:51:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c3428sm19402764f8f.87.2025.01.16.00.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:51:25 -0800 (PST)
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
X-Inumbo-ID: 12319c9a-d3e7-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737017486; x=1737622286; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vdYGACSqmD06pBhAeXOqTAZ8uvEoU3CDJANNyc9PH5I=;
        b=jBMgE8kWWFrRlmsPe0saWqUMRYedVc5KxBS70Ce6sKRkrvHiLDD6yY17ndN7ruFPmT
         7YRENDkwuAJKOr7E4NtRGyhDmmD4h+cN3PgzpwP+rc18ObNHaoa8B0dFjIJizHVp2bvC
         vkJqF4EenFchglQ1+LX4tnMQQsJ74FqsDOHyJcnGzMMPVt55ogiWU9clm/dGxpYMru4I
         hNNOxFGFyj5NvYiELUbvtAQ8oC/PrtEJ5+1YXGFcE7dE9iH09tqGyWliBSKVygOGsZNv
         hoUB/yD72xmSd4IoW02jLYpNEJWVlU0MVaPJRgLcLJxRNtTP08sDEBRSObrsRE4+Vbzg
         2ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737017486; x=1737622286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdYGACSqmD06pBhAeXOqTAZ8uvEoU3CDJANNyc9PH5I=;
        b=dy+LBKlwa1i0QpDx15W16iakYi2+Hl25BCEIX3Z8IVPABUlrFLrJBxffB8PS3oj9Sp
         b0oBY7U4BUdqMgZVfecxEEBxYcs3IpfgpRJnUgowfV2snLkIAw9fmxw3S2gVCcpxjNgR
         s4KTMhR2B0FASK8dx143S6cJT4drv+tJZZgUAQ13REpLzyBF1ThCBuQtMD35mE8rzCRP
         F81virNTe3lswQ3uWkCOn+puksDK3UGW+Q1zzQbuk1t6miJqFTogX06xwluvfy7cSBn+
         sc+/anVcWYZCZ3JtqjKQYssqrlmTtMure9N2hIKFGrXgtAvzp/7+QEPtj73T0qp88gam
         pcrA==
X-Forwarded-Encrypted: i=1; AJvYcCXyLNZTE7Zz0+0E2ki0k4yGBXohvOw4pzKtrzj21lNhzfRwnPq1fsxbNNHcdaRZwAgdCXs8l13RkSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyBLroQ7XkotKtwhLS672QJW2y9mSQQSNJ+uIRyJTTsl4zIKHY
	1v9cOab/K4lIgoeE/D2LAvPdZaHt/ld/I4UOVl3Zbmcp60g51UbYC7Mj48WpQAk=
X-Gm-Gg: ASbGncs+clIxJHGrkBVF168OrCcAhr8vcj8fiiIF+Enwo2ag8jzKig6wVm8i4Wqe3p3
	B47JWM+hFv5a9Ph+9hYZhHtMzotUafCG19bPakye9LZ2Ibi6xgeBh63uoZ14tlo54Yibnconjow
	89xgeTAB5DVe9BGtpd1FphAFGs48t7Aj+lkZ+zrBOEkBhYmBNt70IbvgvFQ4fFV52gWHyFKO4Zn
	8UaBn4GFpQQpQ8Vzms2UO1zRLqyHeAzEwn3ij/fSgRS6JSZbHQmUWfB1pvdHqpmGIfcjJF/Ll5H
	ZZysPMAkO+/MbTIue+WwTsh5OsqucLlE6AmGqqLebA==
X-Google-Smtp-Source: AGHT+IEsbulHh7PZVHSAEnmDh38IVvfobmbwOpTAusRtk5MN3iwIfCnGsZ4ArTaC23pmkWtqt4FHJQ==
X-Received: by 2002:a5d:47c4:0:b0:385:ed16:c8b with SMTP id ffacd0b85a97d-38a87309d21mr11955948f8f.23.1737017486382;
        Thu, 16 Jan 2025 00:51:26 -0800 (PST)
Date: Thu, 16 Jan 2025 09:51:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Milan =?utf-8?B?xJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: linux-riscv@lists.infradead.org, jgross@suse.com, 
	aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, 
	linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, 
	sstabellini@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	xen-devel@lists.xenproject.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
Message-ID: <20250116-aa9eadde9279e66dbc01c705@orel>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <20250114-316084c962eb867c0b681043@orel>
 <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com>

On Wed, Jan 15, 2025 at 08:04:05PM +0100, Milan Đokić wrote:
> Hello Andrew,
> 
> On Tue, Jan 14, 2025 at 7:18 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Tue, Jan 14, 2025 at 05:09:36PM +0100, Milan Djokic wrote:
...
> > > +++ b/arch/riscv/xen/hypercall.S
> > > @@ -0,0 +1,71 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#include <linux/linkage.h>
> > > +#include <asm/assembler.h>
> > > +#include <xen/interface/xen.h>
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_event_channel_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_grant_table_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_xen_version);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_console_io);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_sched_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_hvm_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_memory_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_physdev_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_vcpu_op);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_platform_op_raw);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_multicall);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_vm_assist);
> > > +EXPORT_SYMBOL_GPL(HYPERVISOR_dm_op);
> > > +EXPORT_SYMBOL_GPL(privcmd_call);
> > > +#define SBI_ECALL 0xE
> >
> > Shouldn't this be 0xA000007, i.e. the SBI firmware specific extension
> > for Xen. Otherwise why refer to SBI? Note, '0xE' is an invalid, legacy
> > extension ID in SBI.
> >
> Hypercall is triggered through SBI and we defined 0xE just as an
> SBI_ECALL ID on Xen side for hypercall handling (among other operation
> IDs), so we're not referring to some standard /legacy ID here, just
> utilizing SBI for hypercall handling.

If the SBI specified EIDs and binary encoding aren't used, then the
hypercalls aren't "triggered through SBI", Xen is just doing its own
thing on an ecall. Xen doesn't have to implement SBI at all, but if
it wants to provide SBI services, as well as its own hypercalls, then
the hypercalls should be encoded in the same way as SBI functions and
an EID allowed by the SBI specification for hypervisor-specific
functions should be used. For Xen, that EID is already specified and
it's 0xA000007.

> Is this specific ID (0xE) not allowed to be used on the kernel side
> for some reason? If that is the case, we can use any other ID,
> including the one which you suggested.
>

Linux can use any ID, and Xen can decide what that ID is, but, if Xen
wants to implement SBI, then Xen can't use 0xE, because that EID is
not allowed by the spec for the purpose of hypercalls.

Thanks,
drew

