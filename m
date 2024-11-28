Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590ED9DB598
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845220.1260678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbiW-0004rq-1S; Thu, 28 Nov 2024 10:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845220.1260678; Thu, 28 Nov 2024 10:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbiV-0004pi-V5; Thu, 28 Nov 2024 10:25:47 +0000
Received: by outflank-mailman (input) for mailman id 845220;
 Thu, 28 Nov 2024 10:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vEu=SX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tGbiV-0004pM-52
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:25:47 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fccbab7-ad73-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 11:25:43 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5cfc19065ffso790410a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 02:25:43 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097ebae89sm577354a12.88.2024.11.28.02.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:42 -0800 (PST)
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
X-Inumbo-ID: 1fccbab7-ad73-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmY2NiYWI3LWFkNzMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzg5NTQzLjk2Mzc0Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732789543; x=1733394343; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OzStwXElrW60KPKVuqQnAZqG1yeULVi+Pd8qyTRrhnU=;
        b=ie4Wwh6SyA8QQSOkKeSjxHjwrYppHaaSq09tvsuDMOmNbQ1UvzHXzbUIikSEOPU8cC
         /JFCVZ+PPCer+4An+iDWAR8Cxh5JVIcK09q3KuY9JVs9LfcJkMoMdHPHzcY9Dtgkz1sj
         aIYlQF3jB0bvapz0+DxJrk1nwUyYRri8WMG9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789543; x=1733394343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzStwXElrW60KPKVuqQnAZqG1yeULVi+Pd8qyTRrhnU=;
        b=JpqvUqvu4L9ZLAPzwpLbSz4bkcTDysR9S+40uSs03kMtWRljeZBFEioo2IaEPpwue4
         YvBWBeufMec4fDamTqJXJ40xVT2PLhp2wusb+u5DrhCFA0sAK7ALfErGZX5+gvioxgae
         rp7AxD0ThjRjrrzwyJG0TF9BhFnqxSnrpzQ4iMR/IUKkhrFzNIifkxllf2SvbEa1yNcA
         Gzv8Fc8y2nIHmQ7WMmHBui37egv/wBGb4VSK0g1rGTA2QYv++3pk8X8cYO+8lOMRG+ui
         GZ3gagP1Jote238YxZBYDAOdv0dhi+0c2JJGI29FWt1ocMa4OPzEoRoa/yc6umW4KG6q
         uqww==
X-Gm-Message-State: AOJu0YxUfrPa23alP/d8/cmCHyFNS+dDlZgQR2zhGVmVzU/WNr2dvlbt
	DN10Et5zGIQ/5bXumaOO52paAMw/uZfDnVNo7KvT6/FZfrf/G5OelcshYg5XpaKQ5GfSqJR0qww
	u
X-Gm-Gg: ASbGncu4vjjKaXkY5zi3uykopGnEWUOyd0g9xfANGiXrU+ek1tku8ITzi1ek4OV/piC
	KRiqAOx1xfshk9xlqxl6GW0EdRR7eJDhNoQyDC3qXCZJzr2QNkc5LNSiLb4eh5pAkqrL6EA9DUT
	fimKNLSw/QwnX1zRfjz3OSBOzHBYKCzLf0nP5M2fTuRJpbIdmHd63t3/kjDPIec5Xkf5k/nohNB
	zC2EskZwxDTvUagzREEHe6Bj/gpodRDeiO2WG2iy7X26qOx872/h3fkEfY=
X-Google-Smtp-Source: AGHT+IG9Ga6iiwrjJP0rphi1sGJGGAsYhOynHWGdkE1MoUJpof7/Z4Y2jOY9IcIW3n5ZadsSF65CCA==
X-Received: by 2002:a05:6402:50c8:b0:5cf:a1c1:527e with SMTP id 4fb4d7f45d1cf-5d080bb4176mr5447274a12.8.1732789543341;
        Thu, 28 Nov 2024 02:25:43 -0800 (PST)
Date: Thu, 28 Nov 2024 11:25:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/vlapic: Drop vlapic->esr_lock
Message-ID: <Z0hFJq22n0IljtOy@macbook>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-3-andrew.cooper3@citrix.com>
 <Z0g3LBzM-8ox5dAW@macbook>
 <33f3dbbf-217d-45a7-bb9f-fac7e1a36584@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33f3dbbf-217d-45a7-bb9f-fac7e1a36584@citrix.com>

On Thu, Nov 28, 2024 at 10:10:39AM +0000, Andrew Cooper wrote:
> On 28/11/2024 9:26 am, Roger Pau Monné wrote:
> > On Thu, Nov 28, 2024 at 12:47:37AM +0000, Andrew Cooper wrote:
> >> With vlapic->hw.pending_esr held outside of the main regs page, it's much
> >> easier to use atomic operations.
> >>
> >> Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().
> >>
> >> The only interesting change is that vlapic_error() now needs to take an
> >> err_bit rather than an errmask, but thats fine for all current callers and
> >> forseable changes.
> >>
> >> No practical change.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> It turns out that XSA-462 had an indentation bug in it.
> >>
> >> Our spinlock infrastructure is obscenely large.  Bloat-o-meter reports:
> >>
> >>   add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-111 (-111)
> >>   Function                                     old     new   delta
> >>   vlapic_init                                  208     190     -18
> >>   vlapic_error                                 112      67     -45
> >>   vlapic_reg_write                            1145    1097     -48
> >>
> >> In principle we could revert the XSA-462 patch now, and remove the LVTERR
> >> vector handling special case.  MISRA is going to complain either way, because
> >> it will see the cycle through vlapic_set_irq() without considering the
> >> surrounding logic.
> >> ---
> >>  xen/arch/x86/hvm/vlapic.c             | 32 ++++++---------------------
> >>  xen/arch/x86/include/asm/hvm/vlapic.h |  1 -
> >>  2 files changed, 7 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> >> index 98394ed26a52..f41a5d4619bb 100644
> >> --- a/xen/arch/x86/hvm/vlapic.c
> >> +++ b/xen/arch/x86/hvm/vlapic.c
> >> @@ -102,14 +102,9 @@ static int vlapic_find_highest_irr(struct vlapic *vlapic)
> >>      return vlapic_find_highest_vector(&vlapic->regs->data[APIC_IRR]);
> >>  }
> >>  
> >> -static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
> >> +static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
> > Having to use ilog2() in the callers is kind of ugly.  I would rather
> > keep the same function parameter (a mask), and then either assert that
> > it only has one bit set, or iterate over all possible set bits on the
> > mask.
> 
> It can't stay as a mask, or we can't convert the logic to be lockless. 
> There's no such thing as test_and_set_mask()  (until we get into next
> years processors).

The test_and_set_bit() will also need to be changed if you agree with
my comment on patch 1, as the interrupt should only be injected when
vlapic->hw.pending_esr == 0 rather than whether the specific error is
set in ESR.

> If you really don't like ilog2(), then we need a parallel set of
> APIC_ESR_*_BIT constants, but I considered ilog2() to be the lesser of
> these two evils.
> 
> > I assume you had a preference for doing it at the caller because it
> > would then be done by the preprocessor as the passed values are
> > macros.  Maybe we could add a wrapper about it:
> >
> > static void vlapic_set_error_bit(struct vlapic *vlapic, unsigned int bit)
> > { ... }
> >
> > #define vlapic_error(v, m) ({         \
> >     BUILD_BUG_ON((m) & ((m) - 1));    \
> >     vlapic_set_error_bit(v, ilog2(m));\
> > })
> 
> This is overkill IMO.  There are 3 callers and they're all local to
> apic.c (hopefully soon to gain a 4th, but still).

My recommendation would be a local macro in vlapic.c, but I'm
certainly not going to block the patch hover this.

Thanks, Roger.

