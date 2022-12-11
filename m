Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC26496DA
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 23:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459003.716686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4VAF-0004vx-KL; Sun, 11 Dec 2022 22:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459003.716686; Sun, 11 Dec 2022 22:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4VAF-0004tv-GS; Sun, 11 Dec 2022 22:51:19 +0000
Received: by outflank-mailman (input) for mailman id 459003;
 Sun, 11 Dec 2022 22:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LXCR=4J=google.com=elver@srs-se1.protection.inumbo.net>)
 id 1p4VAE-0004tp-3F
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 22:51:18 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 519f32e4-79a6-11ed-91b6-6bf2151ebd3b;
 Sun, 11 Dec 2022 23:51:16 +0100 (CET)
Received: by mail-yb1-xb2b.google.com with SMTP id d131so11692129ybh.4
 for <xen-devel@lists.xenproject.org>; Sun, 11 Dec 2022 14:51:16 -0800 (PST)
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
X-Inumbo-ID: 519f32e4-79a6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku9FczodgVi7IuURoZl4bCpnlwjQxOtO2oc27QuDGyE=;
        b=ACD0EiTEhuBswlt+yiGgP3k7Ttadxr8sqXiPlGCoREiQuz45asKJ573lLI6JtQv3cM
         lx7KUh/XgDcjACi5ftUs4vIkWwJUV9COdkZefxkHF/mxpdy51U3eCl5FVe4AYrUilhMV
         YQ/k9u7vQk8SO84K3vfA7Yx2R5J37M9cWkZ1NFY7szeMOeaDSkbBeGFua8GOzK8Szj4a
         eYyf6a+9L6t3BEsUNbs0hqEXy/oCEDbU0DKkIxGZ4on5rvPo12HfsILrajgIBS3Xhir2
         MkLpk53mM2xUuayOqWHwMglTAkJ8M8bA8vkmFkQnkK7lJE2Rj1tMWSZmVjf99Ens0D+P
         0N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku9FczodgVi7IuURoZl4bCpnlwjQxOtO2oc27QuDGyE=;
        b=v17cEDtQCRkVPOrSIO7tdqz7CfxMpCSUkZ6ofto1Lp0ED2f/JIpqOBSYsR9TBYmfdy
         KY3lryyyDxNbaYDGg3kaYFy7DFjovBwjTf89+dCIIpiXqePPoqNg0QtoOx7S3KhhWqku
         wHzAZ0utIaO54JYDXwxNzAleuQf7Zmf68Fvg8p8rzvDC09om8Ky7Q++ojDqd1eyJr7Pc
         BkVre2knAoLDjOYgxscSjcdcELOvR6Hw89kvU+QZiMcR8ciYL2jeEOHUXDK48+7SNQs/
         ABW/DeISxy2kACf4ox20qnbI3kdFmBymOmwBVPddiDllvwrP9F5xuPx0/kK3ASkx2S9D
         qjNA==
X-Gm-Message-State: ANoB5pmF7ZVmXWrJO7fY63CSwdBHmJ1RnenbxTlKzKTiUV5LrOZkXFti
	N7EDlBJbSQnhSut78YyTMhk1RBoSbkT4L3l3saH/Yw==
X-Google-Smtp-Source: AA0mqf5+LGx2dq1qboz7bkbiTwtT3jf85VwB2cJHC3EPqhsIyPTYSs/7r2T10sR9nduWt+8CM1NdJNIcrrN8XkCIXcs=
X-Received: by 2002:a25:2b41:0:b0:70b:87d5:4a73 with SMTP id
 r62-20020a252b41000000b0070b87d54a73mr4987665ybr.584.1670799075296; Sun, 11
 Dec 2022 14:51:15 -0800 (PST)
MIME-Version: 1.0
References: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com> <Y5ZM3HCnTcLvP2vy@itl-email>
In-Reply-To: <Y5ZM3HCnTcLvP2vy@itl-email>
From: Marco Elver <elver@google.com>
Date: Sun, 11 Dec 2022 23:50:39 +0100
Message-ID: <CANpmjNPZwtmMvAOk7rn9U=sWTre7+o93yB_0idkVCvJky6mptA@mail.gmail.com>
Subject: Re: kfence_protect_page() writing L1TF vulnerable PTE
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Alexander Potapenko <glider@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Dec 2022 at 22:34, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
> On Sun, Dec 11, 2022 at 01:15:06PM +0100, Juergen Gross wrote:
> > During tests with QubesOS a problem was found which seemed to be related
> > to kfence_protect_page() writing a L1TF vulnerable page table entry [1].
> >
> > Looking into the function I'm seeing:
> >
> >       set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> >
> > I don't think this can be correct, as keeping the PFN unmodified and
> > just removing the _PAGE_PRESENT bit is wrong regarding L1TF.
> >
> > There should be at least the highest PFN bit set in order to be L1TF
> > safe.

Could you elaborate what we want to be safe from?

KFENCE is only for kernel memory, i.e. slab allocations. The
page-protection mechanism is used to detect memory safety bugs in the
Linux kernel. The page protection does not prevent or mitigate any
such bugs because KFENCE only samples sl[au]b allocations. Normal slab
allocations never change the page protection bits; KFENCE merely uses
them to receive a page fault, upon which we determine either a
use-after-free or out-of-bounds access. After a bug is detected,
KFENCE unprotects the page so that the kernel can proceed "as normal"
given that's the state of things if it had been a normal sl[au]b
allocation.

https://docs.kernel.org/dev-tools/kfence.html

From [1] I see: "If an instruction accesses a virtual address for
which the relevant page table entry (PTE) has the Present bit cleared
or other reserved bits set, then speculative execution ignores the
invalid PTE and loads the referenced data if it is present in the
Level 1 Data Cache, as if the page referenced by the address bits in
the PTE was still present and accessible."

[1] https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/l1tf.html

This is perfectly fine in the context of KFENCE, as stated above, the
page protection is merely used to detect out-of-bounds and
use-after-free bugs of sampled slab allocations. KFENCE does not
mitigate nor prevent such bugs, because it samples allocations, i.e.
most allocations are still serviced by sl[au]b.

How can we teach whatever is complaining about L1TF on that KFENCE PTE
modification that KFENCE does not use page protection to stop anyone
from accessing that memory?

> >
> > Juergen
> >
> > [1]: https://github.com/QubesOS/qubes-issues/issues/7935
>
> Does that mean that Linux with kfence enabled is vulnerable to L1TF?  Or
> are these pages ones that are not in any userspace page tables?  If the
> former, then this is a security vulnerability in Linux and must be
> fixed.  If the latter, then the two options I can think of are to revert
> whatever change caused kfence to produce L1TF-vulnerable PTEs, or to
> disable kfence when running paravirtualized under Xen.

See above - it's for kernel memory only, and the page protection is
only to detect bugs of _sampled_ slab allocations.

Thanks,
-- Marco

