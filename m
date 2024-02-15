Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA70856893
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 16:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681883.1060870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rae4d-0008SB-BE; Thu, 15 Feb 2024 15:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681883.1060870; Thu, 15 Feb 2024 15:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rae4d-0008Ps-7Q; Thu, 15 Feb 2024 15:54:55 +0000
Received: by outflank-mailman (input) for mailman id 681883;
 Thu, 15 Feb 2024 15:54:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rae4c-0008Pm-4Q
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 15:54:54 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da72251-cc1a-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 16:54:51 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-511898b6c9eso1261574e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 07:54:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 a15-20020a0ce34f000000b0068c8be959a0sm754837qvm.111.2024.02.15.07.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 07:54:50 -0800 (PST)
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
X-Inumbo-ID: 8da72251-cc1a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708012491; x=1708617291; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcGsWgY1QzuM4kw98vczSP/1ZmF/SUD7G9dHQBs6D4Q=;
        b=HLIo8YKc+7Pp81VTJZWpEckTj+6vQA71RCTbRyXqmWLLQsCWqLmktUVLqtzYbvk5Gj
         BMXai5mavuHlx4TM1kn9zjgU5mj6Z+q7fwg0yWKzBmMsSjG9C0TBkgiJcIiC7DFMQVvT
         KBlVlws+eXituYmjVH+pHibJBLQJSqWSJh+WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708012491; x=1708617291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcGsWgY1QzuM4kw98vczSP/1ZmF/SUD7G9dHQBs6D4Q=;
        b=dGE9YNBF9JWijsIECdcsn1Y6lWGtkA2ki6fQYTrwQlqvgUVtTRtf/DA0qG+6kbxd5y
         bGsn379ZElgiVFAGsaZApXpRyZzYWkjsvGkpkO/kMLEuH3U8MNwO75F8KXwmGGFBD3g8
         xCGgy1ZohdbSNhPgTrWMW5guEruvXKHq7ZgSgkfkEAAAxI1dF9L2kKk8udnI0QXyw/+J
         nXvnQ7BdEaGk3XgPtrNhsxHJ+gisyPs/o1HVtwjmxCTMMNGHRPGkHFyWqZcjX3rM/lpC
         2K8T8G17P0BQTU2fXv1AMD74/oInLjloKwmBnnxl0fpKvTOvYtlP5f/xnl9WMmUYCDzq
         JHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTTJuWb63stCBK9jS7Kz9YX7VcA9kk+TsG8EVeSrO6GcIKgGMcQWnAfTRYpGvCWnJGmygJEXOHf/PyUF6EepjGIAlthZ0QB1Z6zcN73yI=
X-Gm-Message-State: AOJu0YzhVNTTE8lvYCt4+q/OAwgr4JwxZmnsCAZzzM6GtY6nRneNo+31
	Q2QHT/OPMY6jNRAeKF6u5giCLe3/xB9L696YR7wlugggncDYH134FgItWE7Mjdo=
X-Google-Smtp-Source: AGHT+IGDma+QqjEPUX1iZm7u+lPP20IgU/erE/04BDihlAa6eXITvsVZcUIqVXHh+n4jv//6ve201Q==
X-Received: by 2002:a05:6512:124c:b0:511:85ae:8985 with SMTP id fb12-20020a056512124c00b0051185ae8985mr1944640lfb.53.1708012490824;
        Thu, 15 Feb 2024 07:54:50 -0800 (PST)
Date: Thu, 15 Feb 2024 16:54:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/vmx: add support for virtualize SPEC_CTRL
Message-ID: <Zc4zyLgM-OUNc6xG@macbook>
References: <20240209114045.97005-1-roger.pau@citrix.com>
 <09cf678e-bdbd-47a9-8c9d-533e7bee9450@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09cf678e-bdbd-47a9-8c9d-533e7bee9450@suse.com>

On Mon, Feb 12, 2024 at 03:09:01PM +0100, Jan Beulich wrote:
> On 09.02.2024 12:40, Roger Pau Monne wrote:
> > @@ -1378,6 +1379,10 @@ static int construct_vmcs(struct vcpu *v)
> >          rc = vmx_add_msr(v, MSR_PRED_CMD, PRED_CMD_IBPB,
> >                           VMX_MSR_HOST);
> >  
> > +    /* Set any bits we don't allow toggling in the mask field. */
> > +    if ( cpu_has_vmx_virt_spec_ctrl && v->arch.msrs->spec_ctrl.raw )
> > +        __vmwrite(SPEC_CTRL_MASK, v->arch.msrs->spec_ctrl.raw);
> 
> The right side of the conditional isn't strictly necessary here, is it?
> Might it be better to omit it, for clarity?

No strong opinion, my thinking was that skipping the vmwrite would be
better performance wise, but we don't care about performance here
anyway.

> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -823,18 +823,29 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
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
> >      }
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
> > +         * the MSR intercept takes precedence.  The SPEC_CTRL shadow VMCS field
> > +         * is also not loaded on guest entry/exit if the intercept is set.
> > +         */
> 
> It wasn't so much the shadow field than the mask one that I was concerned
> might be used in some way. The shadow one clearly is used only during
> guest RDMSR/WRMSR processing. To not focus on "shadow", maybe simple say
> "The SPEC_CTRL shadow VMCS fields are also not ..."?

What about:

"The SPEC_CTRL shadow and mask VMCS fields don't take effect if the
intercept is set."

> > +        if ( !cpu_has_vmx_virt_spec_ctrl )
> > +        {
> > +            rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
> > +            if ( rc && rc != -ESRCH )
> > +                goto out;
> > +            rc = 0; /* Tolerate -ESRCH */
> > +        }
> >      }
> >  
> >      /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
> > @@ -2629,6 +2640,9 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
> >      switch ( reg )
> >      {
> >      case MSR_SPEC_CTRL:
> > +        if ( cpu_has_vmx_virt_spec_ctrl )
> > +            /* Requires remote VMCS loaded - fetched below. */
> 
> I could see what "fetch" refers to here, but ...
> 
> > +            break;
> >          rc = vmx_read_guest_msr(v, reg, &val);
> >          if ( rc )
> >          {
> > @@ -2652,6 +2666,11 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
> >      vmx_vmcs_enter(v);
> >      switch ( reg )
> >      {
> > +    case MSR_SPEC_CTRL:
> > +        ASSERT(cpu_has_vmx_virt_spec_ctrl);
> > +        __vmread(SPEC_CTRL_SHADOW, &val);
> > +        break;
> > +
> >      case MSR_IA32_BNDCFGS:
> >          __vmread(GUEST_BNDCFGS, &val);
> >          break;
> > @@ -2678,6 +2697,9 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> >      switch ( reg )
> >      {
> >      case MSR_SPEC_CTRL:
> > +        if ( cpu_has_vmx_virt_spec_ctrl )
> > +            /* Requires remote VMCS loaded - fetched below. */
> 
> ... since you also use the word here, I'm not sure it's really
> the VMREAD up there.

That one should be 'set below'.

Thanks, Roger.

