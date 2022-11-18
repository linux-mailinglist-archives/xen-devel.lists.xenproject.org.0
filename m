Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D1362FF2E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 22:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445916.701341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow8dg-0004L5-IL; Fri, 18 Nov 2022 21:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445916.701341; Fri, 18 Nov 2022 21:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow8dg-0004J6-F6; Fri, 18 Nov 2022 21:11:08 +0000
Received: by outflank-mailman (input) for mailman id 445916;
 Fri, 18 Nov 2022 21:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g77P=3S=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ow8de-0004J0-EX
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 21:11:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83641e3d-6785-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 22:11:05 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id s5so8787436edc.12
 for <xen-devel@lists.xenproject.org>; Fri, 18 Nov 2022 13:11:05 -0800 (PST)
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
X-Inumbo-ID: 83641e3d-6785-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxcv2nm3tG3Z0vhlABJP9BKuaFPvcny/CHCF+xgivEo=;
        b=EQNRksUcissCQfWp3uUCSBPpc84XrnRzLQrYVMzCPILzwF0WyUtsGQwFje4Ff44V3i
         fvPeeyi9f2nArlCS9x9Wq+AkuJEDKDXA1yaBMpHW5INw4li9BWv8sdH8kqdbVWKcD4Yy
         gYgvQdP0cZjRWhan0dgIUjBlYpkaIjslxn6b4uARHM3GyOV63ZCXSd3h5SFBP/1ksRpu
         lT0NPUwK20UMtD/on2qUOXjLojgNb4wf/0YPPYq2gJxr2GyqQXFtr+LrtC7yQtwwem7W
         UIywRFX1iin4VgUU8b6WOJIQ85ohiBb7Z/NEG3XdPlzDTPhvuz7YRthacJn2CgausC/1
         Mgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxcv2nm3tG3Z0vhlABJP9BKuaFPvcny/CHCF+xgivEo=;
        b=O+2z0IPLGsX6InCAF9XSe/exyvaQweytUxFnQo9w8Ix9NywRiOc7i+DiIlva3Gw+pu
         G0mJBKi+QhouQgqqIn8izIx+mHgqM9hfRD4VAY49Xt3EPkFaN0zifzLUnV4LhMjUp+uc
         1bao9hu71EKKVqduVo7CB5EanpgYdJD/rwEWH/xUWCheKUXSxNudfw3JD5PnUTkyDB0i
         t61U7Qa4aauZsqR0pQ4iXU52Dd4XMxUEzCAwICjyjz1aWcpLDqMcb6zP71GTAIyCUCtG
         ES8I2RYS4ht4Tok1cXdOVrKO22/SwGGylrXwUvlwMTf/O808WzqXs9l3YjGleKzG32Es
         v5KQ==
X-Gm-Message-State: ANoB5pl+SflDFZ9pMnd17roh2jhaU0udo8mYn4hB12ap7V+8OQUC1FOG
	3wVKMuXUrkKfyQjmMXm+r8FB6iw464MkFY+QzjP1bQbd
X-Google-Smtp-Source: AA0mqf7HP8NVU94cZsKl8GsLsvV6qUNqiZT2IJZYbjR6N4V8rePa08CDrfvwedq99SGcYxzDnzBOw/y5CkNPEEDEPVg=
X-Received: by 2002:a05:6402:2d6:b0:461:8efb:3f84 with SMTP id
 b22-20020a05640202d600b004618efb3f84mr7676426edx.210.1668805864709; Fri, 18
 Nov 2022 13:11:04 -0800 (PST)
MIME-Version: 1.0
References: <osstest-174809-mainreport@xen.org> <Y3eZOcmOYkNLdeGe@Air-de-Roger>
 <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
In-Reply-To: <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 18 Nov 2022 16:10:52 -0500
Message-ID: <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
Subject: Re: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
	Anthony Perard <anthony.perard@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 12:22 PM Andrew Cooper
<Andrew.Cooper3@citrix.com> wrote:
>
> On 18/11/2022 14:39, Roger Pau Monne wrote:
> > Nov 18 01:55:11.753936 (XEN) arch/x86/mm/hap/hap.c:304: d1 failed to allocate from HAP pool
> > Nov 18 01:55:18.633799 (XEN) Failed to shatter gfn 7ed37: -12
> > Nov 18 01:55:18.633866 (XEN) d1v0 EPT violation 0x19c (--x/rw-) gpa 0x0000007ed373a1 mfn 0x33ed37 type 0
> > Nov 18 01:55:18.645790 (XEN) d1v0 Walking EPT tables for GFN 7ed37:
> > Nov 18 01:55:18.645850 (XEN) d1v0  epte 9c0000047eba3107
> > Nov 18 01:55:18.645893 (XEN) d1v0  epte 9c000003000003f3
> > Nov 18 01:55:18.645935 (XEN) d1v0  --- GLA 0x7ed373a1
> > Nov 18 01:55:18.657783 (XEN) domain_crash called from arch/x86/hvm/vmx/vmx.c:3758
> > Nov 18 01:55:18.657844 (XEN) Domain 1 (vcpu#0) crashed on cpu#8:
> > Nov 18 01:55:18.669781 (XEN) ----[ Xen-4.17-rc  x86_64  debug=y  Not tainted ]----
> > Nov 18 01:55:18.669843 (XEN) CPU:    8
> > Nov 18 01:55:18.669884 (XEN) RIP:    0020:[<000000007ed373a1>]
> > Nov 18 01:55:18.681711 (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d1v0)
> > Nov 18 01:55:18.681772 (XEN) rax: 000000007ed373a1   rbx: 000000007ed3726c   rcx: 0000000000000000
> > Nov 18 01:55:18.693713 (XEN) rdx: 000000007ed2e610   rsi: 0000000000008e38   rdi: 000000007ed37448
> > Nov 18 01:55:18.693775 (XEN) rbp: 0000000001b410a0   rsp: 0000000000320880   r8:  0000000000000000
> > Nov 18 01:55:18.705725 (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> > Nov 18 01:55:18.717733 (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> > Nov 18 01:55:18.717794 (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
> > Nov 18 01:55:18.729713 (XEN) cr3: 0000000000400000   cr2: 0000000000000000
> > Nov 18 01:55:18.729771 (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000002
> > Nov 18 01:55:18.741711 (XEN) ds: 0028   es: 0028   fs: 0000   gs: 0000   ss: 0028   cs: 0020
> >
> > It seems to be related to the paging pool adding Andrew and Henry so
> > that he is aware.
>
> Summary of what I've just given on IRC/Matrix.
>
> This crash is caused by two things.  First
>
>   (XEN) FLASK: Denying unknown domctl: 86.
>
> because I completely forgot to wire up Flask for the new hypercalls.
> But so did the original XSA-409 fix (as SECCLASS_SHADOW is behind
> CONFIG_X86), so I don't feel quite as bad about this.

Broken for ARM, but not for x86, right?

I think SECCLASS_SHADOW is available in the policy bits - it's just
whether or not the hook functions are available?

> And second because libxl ignores the error it gets back, and blindly
> continues onward.  Anthony has posted "libs/light: Propagate
> libxl__arch_domain_create() return code" to fix the libxl half of the
> bug, and I posted a second libxl bugfix to fix an error message.  Both
> are very simple.
>
>
> For Flask, we need new access vectors because this is a common
> hypercall, but I'm unsure how to interlink it with x86's shadow
> control.  This will require a bit of pondering, but it is probably
> easier to just leave them unlinked.

It sort of seems like it could go under domain2 since domain/domain2
have most of the memory stuff, but it is non-PV.  shadow has its own
set of hooks.  It could go in hvm which already has some memory stuff.

> Flask is listed as experimental which means it doesn't technically
> matter if we break it, but it is used by OpenXT so not fixing it for
> 4.17 would be rather rude.

It's definitely nicer to have functional Flask in the release.  OpenXT
can use a backport if necessary, so it doesn't need to be a release
blocker.  Having said that, Flask is a nice feature of Xen, so it
would be good to have it functioning in 4.17.

Regards,
Jason

