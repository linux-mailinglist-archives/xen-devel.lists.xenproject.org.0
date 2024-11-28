Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE749DB487
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 10:04:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845166.1260628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGaR1-0000Oo-PA; Thu, 28 Nov 2024 09:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845166.1260628; Thu, 28 Nov 2024 09:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGaR1-0000M4-Mc; Thu, 28 Nov 2024 09:03:39 +0000
Received: by outflank-mailman (input) for mailman id 845166;
 Thu, 28 Nov 2024 09:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vEu=SX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tGaR0-0000Ly-JO
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 09:03:38 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a599f8a9-ad67-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 10:03:34 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ffc86948dcso5414471fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 01:03:34 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c17bfsm43795666b.3.2024.11.28.01.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 01:03:33 -0800 (PST)
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
X-Inumbo-ID: a599f8a9-ad67-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE1OTlmOGE5LWFkNjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzg0NjE0LjQ2NjYyNCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732784614; x=1733389414; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4KfBA1guSdprzGGYtfR2gH1pb5hYac2R3e2E7meA70=;
        b=re2+otfI6Km0yFrOsEo7jGSnP6fISoANZKMVUOCPsg+c5umEzhdx04hMKyb9sNtW33
         dezOg9+/kQGNu+68jTWqQ6ZJKDvuPAB/5DUv4JkBgTb/TXdQMdCFrLAVCVrUc9xCa1gi
         xD+WP6ZlQNSQ69qzwL6ls3Dr1eV4fTbFWspZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784614; x=1733389414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4KfBA1guSdprzGGYtfR2gH1pb5hYac2R3e2E7meA70=;
        b=P+N7EajgQm/Won9MimsSzlkuyq1iKaDXl5ZlXmZYhWriDrNyseXnGapRxJj2GZ0TYX
         dAWd4F+KF+tIW7+HnJfp+6D8b1EVHqm9BItGuRkOMrlz8zUXBHvwPkvUF7ZmrxmCjBtt
         6cWlrJlHk0NxFPlXyh6zsYImLZ+zkoYpJQiiu9OWlSUxKDuXfyzd9DuXXdbIdYewjqe6
         zxr6LDXTFT7+qhJEOee7UgePeqy8LRED+JoxCevzrrF9kZb+/xxfpH6APswS5fB3fu5B
         F3QRYDd9WO3gGZO7AiN60xMrLRB6imtJzrNlCCft8uyBz0nKA+Ny28m90J85XpVYsfza
         suIg==
X-Gm-Message-State: AOJu0YwSyAt8oqD23LX58hVSqanYwSZYnG/Tcj460NrUiOIBRXFAVazT
	NFY8kOKqlmmjV4BtSfrpBWRP2+pPfjE8nv4eYDFnVfpN2yiSOvjfOasn5zAhae0oXlgBNkZh2rc
	O
X-Gm-Gg: ASbGncvHbSb7E3ZkTYSkl8C+FNt4feWzzPXtaXxXP8d22AgNOB8Zte5jTtlyEdPVhtP
	coVdZyrQmau49TmEQQHd5EDfWLYR14n7VfuV3kYL/ai0OEpBxfW/aEcAH0UUTUjtyk3iSCjSeJc
	TXo4v1JyAvRA26gSrGx6gZghS5U3v4oqYxA/j9XNIfHDIYaWcj72jxpXGnXHlM3xlkEXptpg4il
	vYlQOeZ9y0HelsvJCk2byfKH1P3l18hZ/mtj4I5hwFgRoJv2s15App0BkE=
X-Google-Smtp-Source: AGHT+IH5N5ZbRGP/igFnfeDZ6DaJiDNesGgLFF+W75ljkEQl9CGmtSc0THWjUMu9hB72+RVB98paOA==
X-Received: by 2002:a05:651c:2211:b0:2fa:c18c:faba with SMTP id 38308e7fff4ca-2ffd60de22fmr34398081fa.30.1732784613695;
        Thu, 28 Nov 2024 01:03:33 -0800 (PST)
Date: Thu, 28 Nov 2024 10:03:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
Message-ID: <Z0gx5EdqcPiEUt3z@macbook>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128004737.283521-2-andrew.cooper3@citrix.com>

On Thu, Nov 28, 2024 at 12:47:36AM +0000, Andrew Cooper wrote:
> Xen currently presents APIC_ESR to guests as a simple read/write register.
> 
> This is incorrect.  The SDM states:
> 
>   The ESR is a write/read register. Before attempt to read from the ESR,
>   software should first write to it. (The value written does not affect the
>   values read subsequently; only zero may be written in x2APIC mode.) This
>   write clears any previously logged errors and updates the ESR with any
>   errors detected since the last write to the ESR. This write also rearms the
>   APIC error interrupt triggering mechanism.
> 
> Introduce a new pending_esr field in hvm_hw_lapic.  Update vlapic_error() to
> accumulate errors here, and extend vlapic_reg_write() to discard the written
> value, and instead transfer pending_esr into APIC_ESR.  Reads are still as
> before.
> 
> Importantly, this means that guests no longer destroys the ESR value it's
> looking for in the LVTERR handler when following the SDM instructions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Slightly RFC.  This collides with Alejandro's patch which adds the apic_id
> field to hvm_hw_lapic too.  However, this is a far more obvious backport
> candidate.
> 
> lapic_check_hidden() might in principle want to audit this field, but it's not
> clear what to check.  While prior Xen will never have produced it in the
> migration stream, Intel APIC-V will set APIC_ESR_ILLREGA above and beyond what
> Xen will currently emulate.
> 
> I've checked that this does behave correctly under Intel APIC-V.  Writes to
> APIC_ESR drop the written value into the backing page then take a trap-style
> EXIT_REASON_APIC_WRITE which allows us to sample/latch properly.
> ---
>  xen/arch/x86/hvm/vlapic.c              | 17 +++++++++++++++--
>  xen/include/public/arch-x86/hvm/save.h |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 3363926b487b..98394ed26a52 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -108,7 +108,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>      uint32_t esr;
>  
>      spin_lock_irqsave(&vlapic->esr_lock, flags);
> -    esr = vlapic_get_reg(vlapic, APIC_ESR);
> +    esr = vlapic->hw.pending_esr;
>      if ( (esr & errmask) != errmask )
>      {
>          uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
> @@ -127,7 +127,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>                   errmask |= APIC_ESR_RECVILL;
>          }
>  
> -        vlapic_set_reg(vlapic, APIC_ESR, esr | errmask);
> +        vlapic->hw.pending_esr |= errmask;
>  
>          if ( inj )
>              vlapic_set_irq(vlapic, lvterr & APIC_VECTOR_MASK, 0);

The SDM also contains:

"This write also rearms the APIC error interrupt triggering
mechanism."

Where "this write" is a write to the ESR register.  My understanding
is that the error vector will only be injected for the first reported
error. I think the logic regarding whether to inject the lvterr vector
needs to additionally be gated on whether vlapic->hw.pending_esr ==
0.

Thanks, Roger.

