Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B726A17FE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500809.772311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTUg-0005rV-QP; Fri, 24 Feb 2023 08:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500809.772311; Fri, 24 Feb 2023 08:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTUg-0005q1-Ml; Fri, 24 Feb 2023 08:31:54 +0000
Received: by outflank-mailman (input) for mailman id 500809;
 Fri, 24 Feb 2023 08:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq+K=6U=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pVTUe-0005pm-Kt
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:31:52 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afcc66af-b41d-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 09:31:51 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so1570144wms.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 00:31:51 -0800 (PST)
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
X-Inumbo-ID: afcc66af-b41d-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JBmpnjj4rNTZ0urZSdi19az6pvgGABZhQaXoA4ajSl0=;
        b=Ltla/u21ObHYP6kIwr62NaRpbvqYmV9SfWYrIfHy54hUOo/Je7AwsyQLxdZUXpx3XD
         88T+TlUlFXzOhM/fE3Ixcfjc8QXivH8JCysKt0ll8HULaxu2CSU2HT4VR0isR4qAlciG
         xvaq+2VT4iLI/UtjVb5KYwilX6yLM/0YNXaXU4YMBNvr8bM3J9iDU2wJMyo+TXhMPK+t
         K46D0pzTjzFcsoaANfaoyu1XtQ5SBDHH61zFOhcJYfQh5NjJ36wcbwcqmkKrqo6P9tYG
         O5HCxRim5vl52ddQUWw4lSg4tf1GQnJgs/kHE5KRkucwdlILtnw5BrwtHl1gUZSg4F6C
         hZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBmpnjj4rNTZ0urZSdi19az6pvgGABZhQaXoA4ajSl0=;
        b=4aOaKysbhtZNmonJQW0qgfvz6idaNNQM21S7UAgkrCSf81KR3XPtUhDBkwWiST4Cvg
         FGlec239oJ5EGq3hNMv/Edpf8/+zxg56pS6DAeVMuRauGa99ZSsVaLJwdMPwVvCImJC4
         uhNzgk46ojYMvxnA0AeDZq6+8grzwpUgZ2uAV0LmSzjaIOWvPar2vPHLlZZsQDWWU6B0
         O+YZrEtjGY07aciYTy+7j6tGTs0/KxtI4L/Q/B+8/5lmY3X8qtK70u9vyWf2itl68afo
         N0bgEBajOnUCG8T/cbMOfQT0TaQPE16aQWVH7wQP4vD5qifeQzQHW9GUAMqZmP2Dm3e7
         dSeg==
X-Gm-Message-State: AO0yUKU/yPReX7Hxqc8nV3u3GCyS4yqn8v/VPrB6nuewoD6Uj/51f9Um
	qjPSrYhib5+hREBD1s2+lS0hKIMFR6fJan4Oq/OuGg==
X-Google-Smtp-Source: AK7set+P/4z31TaI23B1nVI2F5OvQ2p+CilhVC2JpKlPSUYNcrbUnb9BzyiIaOuq1HkzR8ozIj9xGLXEo0Hk39iZucU=
X-Received: by 2002:a05:600c:600d:b0:3df:97a1:75e2 with SMTP id
 az13-20020a05600c600d00b003df97a175e2mr1037112wmb.4.1677227511097; Fri, 24
 Feb 2023 00:31:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5c588d92cdf23a7355a79bf4b91c7214e5ced197.1677079672.git.jens.wiklander@linaro.org>
 <A87AAA80-9167-4DE5-91FD-BC00068AE83C@arm.com>
In-Reply-To: <A87AAA80-9167-4DE5-91FD-BC00068AE83C@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 24 Feb 2023 09:31:40 +0100
Message-ID: <CAHUa44F1HCz5Jo0G_TLdfWpy6Hc+8FBcv6FPDWbXjdn1fmYJ4A@mail.gmail.com>
Subject: Re: [XEN PATCH v7 04/20] docs: add Arm FF-A mediator
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Thu, Feb 23, 2023 at 4:10 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> It is a little bit hard to check what is said here as the limitations
> are probably due to some things done after this patch.
>
> I would suggest to move this patch later in the serie.

OK, I'll put it last then.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > ---
> > SUPPORT.md               |  7 +++++++
> > docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
> > 2 files changed, 22 insertions(+)
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index aa1940e55f09..5e0595419684 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -818,6 +818,13 @@ that covers the DMA of the device to be passed through.
> >
> > No support for QEMU backends in a 16K or 64K domain.
> >
> > +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> > +
> > +    Status, Arm64: Tech Preview
> > +
> > +There are still some code paths where a vCPU may hog a pCPU longer than
> > +necessary. The FF-A mediator is not yet implemented for Arm32.
> > +
> > ### ARM: Guest Device Tree support
> >
> >     Status: Supported
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 024bceeb61b2..ca4fc3e67b0c 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1645,6 +1645,21 @@ in OP-TEE.
> >
> > This feature is a B<technology preview>.
> >
> > +=item B<ffa>
> > +
> > +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
> > +(SP), default false.
> > +
> > +Currently is only a small subset of the FF-A specification supported. Just
> > +enough to communicate with OP-TEE. In general only direct messaging and
> > +sharing memory with one SP. More advanced use cases where memory might be
> > +shared or donated to multple SPs is not supported.
> > +
> > +See L<https://developer.arm.com/documentation/den0077/latest> for more
> > +informantion about FF-A.
> > +
> > +This feature is a B<technology preview>.
> > +
> > =back
> >
> > =back
> > --
> > 2.34.1
> >
>

