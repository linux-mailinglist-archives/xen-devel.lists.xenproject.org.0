Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC1AE88CB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025272.1400895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSPe-0007P8-Dd; Wed, 25 Jun 2025 15:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025272.1400895; Wed, 25 Jun 2025 15:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSPe-0007O7-9Y; Wed, 25 Jun 2025 15:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1025272;
 Wed, 25 Jun 2025 15:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUSPd-0007O1-51
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:51:49 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d65854a-51dc-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 17:51:48 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1737584f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:51:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6e80f26ebsm4973115f8f.51.2025.06.25.08.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:51:47 -0700 (PDT)
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
X-Inumbo-ID: 4d65854a-51dc-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750866708; x=1751471508; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8dagTzTb5fekUVgpHboAFaIDntps4PnWDcZvFV1Gtk=;
        b=vKvZVnu1m59ePjC0z9HJ1ghwujPVWJuOi6heQJsymk885Wnh4vTKdOK8YA6Ku9TmMP
         tIz+9RZs+nRKUdmPiSeQbtixKiD/IniAv3P9RaQ2Qse3yOIyCQrd64ak7i30XnrzRBjl
         OMyn5MJNAnIbEh6saTVQrkr9iOsWBjNeG/XdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866708; x=1751471508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8dagTzTb5fekUVgpHboAFaIDntps4PnWDcZvFV1Gtk=;
        b=G9nF+uxnzT0cOV8e6P/dDl7YKfh+7I/SXWqLHqkq3yVt5foRpizGval1YXQh5T1PJT
         OzfpopD7msbeFogpkKZsgjIl66v39SD/q24lk9U/2WE9j9Jk/dPNhzVn3aa6qzEkT4Vk
         goRVuiNDmmCLh+2IwSM+A/wzJQZDTp2Wb+sJFlRHdv5khgBnFDrNTGgY/JAJc1SgyA1v
         guBqsHPoC/4domsvJPCG07whMLGT18AG/gSfqxhjoXMYB67rKXgTkXAAGcPLo/KqXonG
         l/CY/x3Km/BGSdrdaMDHIYOQ0g1tU8Nmpp7Bl3iZeQjeDCmnpqH1ZL73scyiIRNkoSbU
         ll6g==
X-Forwarded-Encrypted: i=1; AJvYcCXaIwXDNCpmSlo7TQKzI5jL9RjwZA1EB3n2ArZ852YfX/TcE6XiKxeQHcL1bf7tkjDq63N9CBnvMDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyqt9muF80DMmJapRevnu0B2HYapvXS0V+HxPakVcwMt4cbh7mi
	KrQR/tGpeYtS5w/tKrr9F6anTzuDL0EFjTZ5bfj28FohnE6A4BHt9C5Nzqoz8GLCJsA=
X-Gm-Gg: ASbGncs1f1x9jjvagzMlAjkEvNuW7Ri10lo8zGNWXn956gQVJWnL+Md8JrV5nPWQme4
	7dF3allHxNF3rZ8MgTu3SwKAzKzP8Ly+GjW2EWPQ/9Lc/JtaOsFGi1QU/1hupC0SlbUeLAiQTxx
	TMFiyrMm7Cy6/J3GgW3doP236csMhQyM9OPmESLfNvB8991THKjAU6B2WG69Ua/JRM3GjV38dsS
	yPv7+UITp64Loaa4NHoDcw/mhz5IyiFdEHsZ9CRpTaOx+//Ma/VRcD0BBhgZdl7TSCqiM2S7qS9
	EmJX/uBxQTYLWwlvp5I3vsubxvv3AsTKIoTdSsRhQ30CERAJM5Mm2jaRfP6iWMpI9OIAF4qZ+sp
	+0br8UrfWrHg8h13yTrgoQjkCnMotvA==
X-Google-Smtp-Source: AGHT+IGxhiusxpzUMBPK8NRg5KEQzm+jCEHGoI9IDCbOgQKDcxpuQGaXbajWYANYgZVvY9jZlSnSig==
X-Received: by 2002:a05:6000:2dc7:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a6ed5b8c1fmr2971086f8f.11.1750866707647;
        Wed, 25 Jun 2025 08:51:47 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:51:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/8] pdx: allow per-arch optimization of PDX
 conversion helpers
Message-ID: <aFwbEm-CYIVllliU@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-6-roger.pau@citrix.com>
 <d179e5e5-605f-45a8-9b7d-01dd13359faf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d179e5e5-605f-45a8-9b7d-01dd13359faf@suse.com>

On Tue, Jun 24, 2025 at 03:51:09PM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/pdx.h
> > @@ -0,0 +1,75 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef X86_PDX_H
> > +#define X86_PDX_H
> > +
> > +#ifndef CONFIG_PDX_NONE
> > +
> > +#include <asm/alternative.h>
> > +
> > +/*
> > + * Introduce a macro to avoid repeating the same asm goto block in each helper.
> > + * Note the macro is strictly tied to the code in the helpers.
> > + */
> > +#define PDX_ASM_GOTO_SKIP                           \
> > +    asm_inline goto (                               \
> > +        ALTERNATIVE(                                \
> > +            "",                                     \
> > +            "jmp %l[skip]",                         \
> > +            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
> > +        : : : : skip )
> 
> Did you consider passing the label name as argument to the macro? That way ...
> 
> > +static inline unsigned long pfn_to_pdx(unsigned long pfn)
> > +{
> > +    PDX_ASM_GOTO_SKIP;
> > +
> > +    return pfn_to_pdx_xlate(pfn);
> > +
> > + skip:
> > +    return pfn;
> > +}
> 
> ... the labels here and below then wouldn't look unused.

Yes - that's why I've added the "Note the macro is strictly tied to
the code in the helpers" comment ahead of the macro, and named it as
"GOTO_SKIP" to explicitly reference the label name.  I could pass the
label name however if that's preferred, ie: PDX_ASM_GOTO(skip).  IMO
It seems a bit redundant since all callers will pass the same label
name.

> The other slight anomaly with this is that we're wasting 2 or 5 bytes of
> code space. Yet I guess that's an acceptable price to pay for keeping the
> actual translation code in C (rather than in assembly).

I wanted to avoid doing the translation in assembly, so I think it's a
fair price to pay.

Thanks, Roger.

