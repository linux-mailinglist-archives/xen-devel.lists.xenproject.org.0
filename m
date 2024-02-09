Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707B84F3B4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 11:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678634.1056083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYOOL-0001bs-B2; Fri, 09 Feb 2024 10:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678634.1056083; Fri, 09 Feb 2024 10:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYOOL-0001Za-7a; Fri, 09 Feb 2024 10:45:57 +0000
Received: by outflank-mailman (input) for mailman id 678634;
 Fri, 09 Feb 2024 10:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYOOJ-0001ZU-7M
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 10:45:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 656706bb-c738-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 11:45:53 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33adec41b55so274989f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 02:45:53 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bt2-20020a056000080200b0033b4db744e5sm1500245wrb.12.2024.02.09.02.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 02:45:52 -0800 (PST)
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
X-Inumbo-ID: 656706bb-c738-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707475552; x=1708080352; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw8I61+V3ko8S2OozdYFKiO1k+Am7u32/BltW5Y0w3s=;
        b=HfoklA2cNpGlqSmn/3DZMLWKYy+WFy/nl5hwt0RQBKTH1R92uufjaCQ1CWLRCwnco8
         hJqTm0/8rT6FYMoEeZi8Gi6tWc5zmoIFAvc0mHHeVvEAZfqKiR6v2GAw3/rP++jwjqR4
         uZ0fWHp1XVUfOAi4cXkXsFoNjjYHLT1I1O+ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707475552; x=1708080352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw8I61+V3ko8S2OozdYFKiO1k+Am7u32/BltW5Y0w3s=;
        b=MQLhiCKWIiqRKWfM5jm8T9OzivIZA8nV7qHf5xXFFadVNUZxnUNiZpCKf2D9TsTiuk
         Yq8LVrl3gRUGsRRoNqob5Nm+6CEANmt/5U9Q/vG+oUCVzoOSQK9cwrYdjJpuRXoZfTaj
         Z0M4u5TOHIQ7Tpcg3eWDsFoYxmQu2zuGhGqgTaOhyDLtvaDm3NGzweUQr6lNKA288pMt
         7mCmpvmg0z91MZg7fLRxKIv9mRK49CSDjJmPndVAoJtp++7TBwstN+aKC5wYQphH//b9
         7UIK/Q13xmBlZTV4z7P/G/urTj5CcK+TvE1tNn+KTl0s0/Kgp/5fFGBlZLrsZUNTq1sN
         Mf1w==
X-Gm-Message-State: AOJu0YzOSJn3xIL/xDy9Rqth+YQ0qAX3ciSeymwamIhMObPHc3x0J0Gn
	T4qQyaGfMx8W8k2mxI71CV5qqsAcfwEJoo8klsSB79Bj5lswOH+UOadkK2bXbD8=
X-Google-Smtp-Source: AGHT+IHdwuWu+yU+Hg22tV6XSuSR4iPdVWj841mjdjldKM/cfP8a+J2NSacP9Od1RqLsKp22DeJHgw==
X-Received: by 2002:adf:b1d7:0:b0:33a:ea26:6a91 with SMTP id r23-20020adfb1d7000000b0033aea266a91mr833540wra.0.1707475552330;
        Fri, 09 Feb 2024 02:45:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWI4bwmJOjY0Gdkt/bCrPBk2/sbLSWa4p3OfWmTCxkDbPNXoh8vHe/dcMymFnMQm8Y6zZcxjHkoXhVZlYOQUsK2sMqmIdWQEpXbYkJUcU806l37TUfPKSlJ9madGiKVDIkMOUVd8F+yhZkERS1SgZ18QLHOWFVgNQkc3HJUI+ekTIeDlOPIOptfbkKh
Date: Fri, 9 Feb 2024 11:45:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/vmx: add support for virtualize SPEC_CTRL
Message-ID: <ZcYCXrEaOyxZUb2I@macbook>
References: <20240206142507.81985-1-roger.pau@citrix.com>
 <91e3fd09-8325-49b0-9d7b-43aacf2acd81@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91e3fd09-8325-49b0-9d7b-43aacf2acd81@suse.com>

On Thu, Feb 08, 2024 at 02:40:53PM +0100, Jan Beulich wrote:
> On 06.02.2024 15:25, Roger Pau Monne wrote:
> > @@ -2086,6 +2091,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
> >      if ( v->arch.hvm.vmx.secondary_exec_control &
> >           SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY )
> >          printk("InterruptStatus = %04x\n", vmr16(GUEST_INTR_STATUS));
> > +    if ( cpu_has_vmx_virt_spec_ctrl )
> > +        printk("SPEC_CTRL mask = %#016lx  shadow = %#016lx\n",
> > +               vmr(SPEC_CTRL_MASK), vmr(SPEC_CTRL_SHADOW));
> 
> #0... doesn't make a lot of sense; only e.g. %#lx does. Seeing context
> there's no 0x prefix there anyway. Having looked at the function the
> other day, I know though that there's a fair mix of 0x-prefixed and
> unprefixed hex numbers that are output.

For consistency with how other MSRs are printed I should use the '0x'
prefix.

> Personally I'd prefer if all
> 0x prefixes were omitted here. If you and Andrew think otherwise, I can
> live with that, so long as we're at least striving towards consistent
> output (I may be able to get to doing a conversion patch, once I know
> which way the conversion should be).

I usually prefer the '0x' to avoid ambiguity.  However this being all
hardware registers, I might be fine with dropping the '0x' on the
grounds that all registers are always printed as hex.

> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -823,18 +823,28 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
> >      {
> >          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
> >  
> > -        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> > -        if ( rc )
> > -            goto out;
> > +        if ( !cpu_has_vmx_virt_spec_ctrl )
> > +        {
> > +            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> > +            if ( rc )
> > +                goto out;
> > +        }
> 
> I'm certainly okay with you doing it this way, but generally I'd prefer
> if code churn was limited whjere possible. Here leveraging that rc is 0
> on entry, a smaller change would be to
> 
>         if ( !cpu_has_vmx_virt_spec_ctrl )
>             rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>         if ( rc )
>             goto out;
> 
> (similarly below then).

That looks odd to me, and is not how I would write that code.  I can
however adjust if you insist.  Given it's just a two line difference I
think it was worth having the more usual form.

> >      else
> >      {
> >          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
> >  
> > -        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
> > -        if ( rc && rc != -ESRCH )
> > -            goto out;
> > -        rc = 0; /* Tolerate -ESRCH */
> > +        /*
> > +         * NB: there's no need to clear the virtualize SPEC_CTRL control, as
> > +         * the MSR intercept takes precedence.
> > +         */
> 
> The two VMCS values are, aiui, unused during guest entry/exit. Maybe
> worth mentioning here as well, as that not being the case would also
> raise correctness questions?

Hm, yes indeed, I've double checked and the value is not loaded, so
will expand the message.

> > --- a/xen/arch/x86/include/asm/msr.h
> > +++ b/xen/arch/x86/include/asm/msr.h
> > @@ -302,8 +302,13 @@ struct vcpu_msrs
> >       * For PV guests, this holds the guest kernel value.  It is accessed on
> >       * every entry/exit path.
> >       *
> > -     * For VT-x guests, the guest value is held in the MSR guest load/save
> > -     * list.
> > +     * For VT-x guests, the guest value is held in the MSR guest load/save list
> > +     * if there's no support for virtualized SPEC_CTRL. If virtualized
> > +     * SPEC_CTRL is enabled the value here signals which bits in SPEC_CTRL the
> > +     * guest is not able to modify.  Note that the value for those bits used in
> > +     * Xen context is also used in the guest context.  Setting a bit here
> > +     * doesn't force such bit to set in the guest context unless also set in
> > +     * Xen selection of SPEC_CTRL.
> 
> Hmm, this mask value is unlikely to be in need of being vCPU-specific.
> I'd not even expect it to be per-domain, but simply global.

This is mostly to keep the logic in-sync with the one used on AMD.

> I also can't spot where you set that field; do we really mean to give
> guests full control now that we have it (rather than e.g. running in
> IBRS-always-on mode at least under certain conditions)? If intended to
> be like this for now, this (to me at least) surprising aspect could
> likely do with mentioning in the description.

Yes, so far I didn't set any bit before the guest back, that should be
done in a separate patch.

Thanks, Roger.

