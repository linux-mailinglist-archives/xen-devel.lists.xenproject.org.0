Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828146A5AB0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 15:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503389.775651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0nc-0005fe-DZ; Tue, 28 Feb 2023 14:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503389.775651; Tue, 28 Feb 2023 14:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0nc-0005cI-Ac; Tue, 28 Feb 2023 14:17:48 +0000
Received: by outflank-mailman (input) for mailman id 503389;
 Tue, 28 Feb 2023 14:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+N/=6Y=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pX0na-0005bu-Pd
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 14:17:46 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab1acedc-b772-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 15:17:44 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id e37so7444513wri.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 06:17:44 -0800 (PST)
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
X-Inumbo-ID: ab1acedc-b772-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh7KWnQCnU0Xy11ERAph7q0T0htYbN4VPL78n+lioss=;
        b=XINu/uhsOJAR39CS67rUqmJs/rhFSfkCX8HqvT63CTx6mHONjE9le76h8tDNBoE8XP
         QfWKinWYzqxkHUe8jjDTBx+ER48Z+9RH4TEIbG3bpR1omN+vgaCMR5fDLfpFIcuDgBme
         +Ub9xwPgmZVhYJxCdwDLde5/4rl5y2SAA9f1ueHxLFp4NPNvsa+I9V15fT+vO/rBE/K5
         sUlXjuqCPy8vPRqKRKp9AJxqvr3iKHiIkdKYXKnkfKHs899uG6BagQa3cjLQSkxhv7TQ
         zY59pg8/s7WXBlq4OFoyQyLkxiiILhlOG1LyBLXd9XvkY/FhHGILTB94brBSupekT6vw
         3gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lh7KWnQCnU0Xy11ERAph7q0T0htYbN4VPL78n+lioss=;
        b=TpPFLBvsmdCVqyxTk+w+VRaNXUrKUsX07TDTYB3apehTLaMaThq/Qj5hkjCJCJtIwZ
         wPAvx063pfm/Ctau7npmgqQJ65l6InLVNthWSxx3igIlGdGdGiL8tF08nF/UXNAW3CDz
         kYsn8oPNs/86ghRGqAHdWJ+7jljAGjidIUH+bztBh0ARZA/psVUvJ3K8eAL/Vn56AXqU
         O6GGJGwaw2IHvn8rOusAOO6qnWnBVZrEIysRgez4y3PTfZHl+Nk0gHsZNPmLZ/pbb1GQ
         gLC81veJ2CIJU9hlZ++RtKHAwL46IwcFiNAgXiLA2zfI6xY2NuFX0CxYFWlblbxT22Mk
         ml7Q==
X-Gm-Message-State: AO0yUKX7aS9X3pa2oG0RkDEOFO62v7UImOPs+4kwzvfVLfFkFiY8vGFF
	mk5hDsaS+pU2UC2VXdRJveEkFUJLDcXhh+rzSzk/3g==
X-Google-Smtp-Source: AK7set9ALWNnTzuE5yynXOxHXNX7V1XLJWiXHtwYThD2yDLqXza4mUi6fIfw5+bRR+gu6z25mV7pZMUVLrZVnIoNlFI=
X-Received: by 2002:a5d:63c6:0:b0:2c9:bd6e:83c0 with SMTP id
 c6-20020a5d63c6000000b002c9bd6e83c0mr534828wrw.3.1677593863893; Tue, 28 Feb
 2023 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <6c0ef5d2174bfa8c25aeb94395160ab9d863b63a.1677079672.git.jens.wiklander@linaro.org>
 <EE2EF6DF-0BBB-4F55-A34B-321795F7821B@arm.com>
In-Reply-To: <EE2EF6DF-0BBB-4F55-A34B-321795F7821B@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 28 Feb 2023 15:17:33 +0100
Message-ID: <CAHUa44HimPR8-JQtbq46AebCTOnjarzQ1sRYE2QxwDQOKs-EMw@mail.gmail.com>
Subject: Re: [XEN PATCH v7 08/20] xen/arm: ffa: note dependency on 4k pages
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Fri, Feb 24, 2023 at 4:27 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> HI Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
> > mediator.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> NIT: I would s/note/enforce/ in the title:
> xen/arm: ffa: enforce 4k pages

OK, I'll fix it.

Thanks,
Jens

>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Cheers
> Bertrand
>
> > ---
> > xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
> > 1 file changed, 21 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index d04bac9cc47f..8b0b80ce1ff5 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -56,6 +56,16 @@
> > #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> >                                                  FFA_MY_VERSION_MINOR)
> >
> > +/*
> > + * The FF-A specification explicitly works with 4K pages as a measure of
> > + * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX page
> > + * count" which is the number of contiguous 4K pages allocated. Xen may use
> > + * a different page size depending on the configuration to avoid confusion
> > + * with PAGE_SIZE use a special define when it's a page size as in the FF-A
> > + * specification.
> > + */
> > +#define FFA_PAGE_SIZE                   SZ_4K
> > +
> > /* Framework direct request/response */
> > #define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> > #define FFA_MSG_TYPE_MASK               0xFFU;
> > @@ -242,6 +252,17 @@ static bool ffa_probe(void)
> >     unsigned int major_vers;
> >     unsigned int minor_vers;
> >
> > +    /*
> > +     * FF-A often works in units of 4K pages and currently it's assumed
> > +     * that we can map memory using that granularity. See also the comment
> > +     * above the FFA_PAGE_SIZE define.
> > +     *
> > +     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
> > +     * until that is fully handled in this code make sure that we only use
> > +     * 4K page sizes.
> > +     */
> > +    BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
> > +
> >     /*
> >      * psci_init_smccc() updates this value with what's reported by EL-3
> >      * or secure world.
> > --
> > 2.34.1
> >
>

