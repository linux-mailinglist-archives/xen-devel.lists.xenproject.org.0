Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4A6A5AB2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 15:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503394.775661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0od-0006ET-QH; Tue, 28 Feb 2023 14:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503394.775661; Tue, 28 Feb 2023 14:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0od-0006Cl-NU; Tue, 28 Feb 2023 14:18:51 +0000
Received: by outflank-mailman (input) for mailman id 503394;
 Tue, 28 Feb 2023 14:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+N/=6Y=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pX0oc-0006Cb-Ch
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 14:18:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12818b2-b772-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 15:18:48 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so5974308wmq.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 06:18:48 -0800 (PST)
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
X-Inumbo-ID: d12818b2-b772-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+ekqBER0OZIQJK/rifnO8+K5Gv3JnO/QqzguiwJQR8=;
        b=vCc3ypjBwpKyt+odXIrAHGY9Z74C63Ld7q+XZDT9Ye1gpK73glFZcBRKhYIV2QGWsB
         y1kMqdY87+Sgin3paMBWp/5/wGZ8lDpiEV18kBMIIKN3oTxjCYHhI4lczWDfeKGfQ2hx
         vz5G1DwMHVkVvTmVaRo8IflAtPu6WGdlZhm2NalGnFrjRp9UAbZt9Qsa39MwdELWsv9q
         pMWHIK7nNH5RgxXqR7asvpqLKwqZk4zT+svy3fjxFyb2H4xdcxoEhRswBhPsHR1AB2px
         pJegrBUzZQkQfe6vCHwkprDX7B4MzPtTep6NUjYCetFcUAX4TqgHTuGl6fKo0Vo8yXlu
         Ft0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+ekqBER0OZIQJK/rifnO8+K5Gv3JnO/QqzguiwJQR8=;
        b=NFpWO1vN8OXLEDgmeyo/mEw0fj6DjVfZno+q+GpgSZkAjh/BI4w66ri9qZzTrEFyG7
         SVddMN0uNSZVurgoioQQFWIbS1QhZPI2UnFs9359giayFJ+MX4awvctM0hVrwyOb+NeL
         cZwkpE1GIOE8Hp+iuJMayDVjw543dStGFQvaYdtFH0Y87lVqmxP9XV2aYqmdNPuv8z8g
         RNSJ6P3zkZLpUcfP7m/yLX8ln0FBL1gzTGYAixsuR2qbgiAn1PsgDmZll2+WZrT0bEFM
         hgX+XEL9oVO8OLSSgxG6lzTXN13mpiBNTEOqOrM22hCn6Q0hfK3NV4ZOJLbRXW+wQyPp
         wyaw==
X-Gm-Message-State: AO0yUKU9PMxbOSoCuPKn8NZS2/fuZeB5k0tV+UlzSfeeEYx+Q8dP9ng6
	w1ABbVq7X14eLauHUNywT9genWpr5oIOcRXJUxUzoQ==
X-Google-Smtp-Source: AK7set8XMJT5Qvonbc4oLViypw+cMqo6N4makMAu0K8a07GWP3VC4dr+60EcI7v3OyV1Apg8vuoMseAzr/2L50IbTYw=
X-Received: by 2002:a05:600c:4f4d:b0:3df:97a1:75e2 with SMTP id
 m13-20020a05600c4f4d00b003df97a175e2mr823357wmq.4.1677593927792; Tue, 28 Feb
 2023 06:18:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <82e4e0c3ac1614822fddd90336c22e6fad5b485e.1677079672.git.jens.wiklander@linaro.org>
 <FF2BBB34-102C-425F-9A9A-2D6FA1BEB2D4@arm.com> <42827e14-8daa-66ed-328a-92940dc98a95@xen.org>
In-Reply-To: <42827e14-8daa-66ed-328a-92940dc98a95@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 28 Feb 2023 15:18:37 +0100
Message-ID: <CAHUa44GmSdKwOToQHm3dWQ5stkdy+4Wxm9wdKyQMyTeHgn3kaQ@mail.gmail.com>
Subject: Re: [XEN PATCH v7 09/20] xen/arm: ffa: add support for FFA_ID_GET
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Feb 27, 2023 at 4:00 PM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 27/02/2023 14:48, Bertrand Marquis wrote:
> >> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >>
> >> Adds support for the FF-A function FFA_ID_GET to return the ID of the
> >> calling client.
> >>
> >> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >> ---
> >> xen/arch/arm/tee/ffa.c | 21 ++++++++++++++++++++-
> >> 1 file changed, 20 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 8b0b80ce1ff5..463fd7730573 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -167,6 +167,12 @@ static bool ffa_get_version(uint32_t *vers)
> >>      return true;
> >> }
> >>
> >> +static uint16_t get_vm_id(const struct domain *d)
> >> +{
> >> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> >> +    return d->domain_id + 1;
> >> +}
> >> +
> >> static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> >>                       register_t v2, register_t v3, register_t v4, register_t v5,
> >>                       register_t v6, register_t v7)
> >> @@ -181,6 +187,12 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> >>          set_user_reg(regs, 7, v7);
> >> }
> >>
> >> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> >> +                             uint32_t w3)
> >> +{
> >> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> >> +}
> >> +
> >> static void handle_version(struct cpu_user_regs *regs)
> >> {
> >>      struct domain *d = current->domain;
> >> @@ -210,6 +222,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
> >>      case FFA_VERSION:
> >>          handle_version(regs);
> >>          return true;
> >> +    case FFA_ID_GET:
> >> +        set_regs_success(regs, get_vm_id(d), 0);
> >> +        return true;
> >>
> >>      default:
> >>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> >> @@ -221,7 +236,11 @@ static int ffa_domain_init(struct domain *d)
> >> {
> >>      struct ffa_ctx *ctx;
> >>
> >> -    if ( !ffa_version )
> >> +     /*
> >> +      * We can't use that last possible domain ID or get_vm_id() would cause
> >> +      * an overflow.
> >> +      */
> >> +    if ( !ffa_version || d->domain_id == UINT16_MAX)
> >>          return -ENODEV;
> >
> > In reality the overflow could only happen if this is called by the IDLE domain right now.
> > Anyway this could change and this is making the code more robust at no real cost.
> >
> > I would just suggest here to return a different error code like ERANGE for example to
> > prevent missing ENODEV with other cases not related to FFA not being available.
>
> +1. I would also like to suggest to use >= rather than == in case we
> decide to support more than 16-bit domid.

Makes sense, I'll fix it.

Thanks,
Jens

>
> Cheers,
>
> --
> Julien Grall

