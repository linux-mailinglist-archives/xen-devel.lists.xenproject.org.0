Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616144DC923
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291639.495125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUrMH-0003rE-54; Thu, 17 Mar 2022 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291639.495125; Thu, 17 Mar 2022 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUrMH-0003oW-1r; Thu, 17 Mar 2022 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 291639;
 Thu, 17 Mar 2022 14:44:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtxi=T4=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nUrME-0003oQ-Un
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:44:07 +0000
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [2607:f8b0:4864:20::d2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b199f1c9-a600-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:44:05 +0100 (CET)
Received: by mail-io1-xd2b.google.com with SMTP id 195so6167536iou.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 07:44:05 -0700 (PDT)
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
X-Inumbo-ID: b199f1c9-a600-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwlHGH829bosnBcnyMhyhPATbMiWYFiW5s97i2e07gc=;
        b=PhBnvPrOAQ7BZNOdgCoYpIQYqmPCbYewN8vX4wueURcgd+I9Wwb1mU14BHU+P3wOs7
         h0gjbiW6rvtEi+ChZfb8kVrVMT36EXhxKSz2SpfavUUKUT1uEhBMxNWN7cyw9qjZzMLO
         NDwFG5RJoS+41AUBY8V5JjXUqnXhJi79VDeDpPOJ9Aip0iqHmz+CoMNWbbSjxYm7qdlA
         pTWyRJ7u82GX3zcie5YOgeZ2tRYCAxk2RUcRnGQpZEn5/k1kwUkIqqqp5AYYH/KWbvg7
         Pr90H1WU0O8Ilj7VphYJoVXs75kzOKoEuoRzJYY2/BZVam+KwayKRM+SEvtpcpwVgf+r
         5hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwlHGH829bosnBcnyMhyhPATbMiWYFiW5s97i2e07gc=;
        b=UOfLeCYnY29SzEFYUDL1UIbE/8HMbiW52kE4zK9zIrAYP1NCVbJFW+f952G83YMJ3U
         UYcXkSeSMm9sT4ut4radgQzRVQGvc79XrY9BtVGKv58L3NViPenj96q22iIgR4WBXQ5r
         w/KGNT9cjudXLcm3EZ3hJLAmZ0GP4D+lXeHXzq6AaFJoXuhia3sJcHCeGJ4ThIN2IoQj
         EW6V++9ERd+tkrwUxOVn5W7V7PZuRVSwLTF4TRGrlrPO1QJys7nYZ7mT5TWqKso32nfa
         SJZIv+GhsSXKp8gZBGREtARHnZAiOjtUo/NAcYknVFYP7cK0FMCqW79Umebry07Pyakm
         st+Q==
X-Gm-Message-State: AOAM533uKN/5mKcWiTTlYmBq6Rxs7veyJXosPkkO37QFDp1p3WndBOJs
	+hh5czelYWQr+R2r6ggAsdPMWw4J9UDRUN19NKw=
X-Google-Smtp-Source: ABdhPJwntdN9Hn8WIpDCIrOzH06JvFigV/JwVVQlMJhjBbkYj8zasMMO0xX9crWJzDNkHIkJLqbpqY3DjtPMv5eVCdU=
X-Received: by 2002:a05:6638:d47:b0:319:e675:dba3 with SMTP id
 d7-20020a0566380d4700b00319e675dba3mr2277893jak.70.1647528244552; Thu, 17 Mar
 2022 07:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com>
In-Reply-To: <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 17 Mar 2022 10:43:28 -0400
Message-ID: <CABfawhnsbqBOuTyB-C4sY23GY-4-AXd38TXqVMemVt_duwSZiQ@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 9:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.03.2022 19:44, Tamas K Lengyel wrote:
> > During VM fork resetting a failed vmentry has been observed when the reset
> > is performed immediately after a STI instruction executed. This is due to
> > the guest interruptibility state in the VMCS being modified by STI but the
> > subsequent reset removes the IF bit from FLAGS, causing the failed vmentry.
>
> I first thought this was backwards, but after re-reading a couple of
> times I think the issue is merely with you stating this as if this
> was what always happens, while it really depends on the state that
> the VM is being reset to. I think it would further be helpful if you
> made clear that other interruptibility state could also cause issues
> when not properly restored. One way to express this would be to
> simply insert "e.g." ahead of "a STI instruction".

Correct, there could be other instances where the interruptibility
state could go out of sync with RFLAGS, executing STI and then
resetting only the register state to the pre-STI parent is just one I
stumbled into.

>
> > @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
> >      v->arch.dr6   = ctxt.dr6;
> >      v->arch.dr7   = ctxt.dr7;
> >
> > +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
>
> Setting reserved bits as well as certain combinations of bits will
> cause VM entry to fail. I think it would be nice to report this as
> an error here rather than waiting for the VM entry failure.

Not sure if this would be the right spot to do that since that's all
VMX specific and this is the common hvm code.

>
> > --- a/xen/arch/x86/include/asm/hvm/hvm.h
> > +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> > @@ -720,6 +720,22 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
> >      return -EOPNOTSUPP;
> >  }
> >
> > +static inline unsigned long hvm_get_interrupt_shadow(struct vcpu *v)
>
> unsigned long here and ...
>
> > +{
> > +    if ( hvm_funcs.get_interrupt_shadow )
> > +        return alternative_call(hvm_funcs.get_interrupt_shadow, v);
> > +
> > +    return -EOPNOTSUPP;
> > +}
> > +
> > +static inline void
> > +hvm_set_interrupt_shadow(struct vcpu *v, unsigned long val)
>
> ... here are not in line with the hooks' types. Same for the stubs
> further down then.
>
> > +{
> > +    if ( hvm_funcs.set_interrupt_shadow )
> > +        alternative_vcall(hvm_funcs.set_interrupt_shadow, v, val);
> > +}
> > +
> > +
> >  /*
>
> Please don't insert multiple successive blank lines.

Ack.

Tamas

