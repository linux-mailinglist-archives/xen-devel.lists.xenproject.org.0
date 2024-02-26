Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DAC866DB8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685355.1065917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWzN-00075X-53; Mon, 26 Feb 2024 09:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685355.1065917; Mon, 26 Feb 2024 09:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWzN-000731-2O; Mon, 26 Feb 2024 09:09:33 +0000
Received: by outflank-mailman (input) for mailman id 685355;
 Mon, 26 Feb 2024 09:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reWzL-00072v-N5
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:09:31 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf4d85b2-d486-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 10:09:29 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51197ca63f5so4261206e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 01:09:29 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac8744b000000b0042e5e5795a7sm2249644qtr.51.2024.02.26.01.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 01:09:28 -0800 (PST)
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
X-Inumbo-ID: bf4d85b2-d486-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708938569; x=1709543369; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ig/CUKmBIDvrweHGRl9Xe1rMFoZ+kaM5fAYRsxMzWU=;
        b=XkW14n5KhfOTJVP+MY3zfEqWb90vecd1G7pK5cykpQS6mJM10jQ/jQt/5tYQAd2H6V
         ci5zQ6UQnwP3HbG9cVVtXMpU+irDpP7ukQ5kd6VkgtSe42NnxnCSVH3Vptu8BbgdbQpf
         KGyquKro5S/DHBGo97AlYiaJ0aXiSVxCaKNAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708938569; x=1709543369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ig/CUKmBIDvrweHGRl9Xe1rMFoZ+kaM5fAYRsxMzWU=;
        b=Yy3nolLwvbwnQyZUX5fOSjBtHKPDgFPAiLmv1d2dxlj01hXkA+/oQb262cIe5gmzit
         juzeFpbn1wO7ir+BqU0ffk9DETrlLynOLnUaLdsDOq2DXCNnK2g8C0/mJxQwormMpRw8
         WqzxrLDCwL0PyOr4oq1kG6R5wlNdFNyw4pffRiIXb5KjVZjHQwJiXmkI23BHdkwiYDUK
         Urrw3rhSnGRUkFsSajulJrcNxBMVNaF0+D4WUPwF3AF22sAxuFOqJO/LNjz3vel1GBHW
         05Uf1/SQIPEVAr3BsfffBL2lIhNIFlAjWcJFqwavtcQuQkoGZTu0u9QFBxTjeHu6wDRh
         fgeg==
X-Forwarded-Encrypted: i=1; AJvYcCXDbmUl4Ejg0TsiCtCYxmbGIelRu/6Ec70505qGFDOjwmJHS+47mBY1FjoJz9a2JgW0hvRA+XjxgfOJ2sg6NtXjrFXBKUkuCN5Pnzy+yZ4=
X-Gm-Message-State: AOJu0YxH23t9+WyQt8Mqx9m74DyY8k3IGs4dzjydyH66rNrKjjRIubZ4
	YokHUgHy5hZtxh0TSY+CXaaZ9/kb3IGs1cfRo70nkL+n+eMK35ZztlhdZoVpLho=
X-Google-Smtp-Source: AGHT+IHE5f9Kb6QXEV4K5Cf0DgQt5lHgPnS7mv5PDNrIK42ZcAz18bI9AOOlAkRnya67oXJDsg64Ow==
X-Received: by 2002:a05:6512:3c9e:b0:512:fe5c:4bae with SMTP id h30-20020a0565123c9e00b00512fe5c4baemr1358705lfv.31.1708938569151;
        Mon, 26 Feb 2024 01:09:29 -0800 (PST)
Date: Mon, 26 Feb 2024 10:09:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
Message-ID: <ZdxVQRMRyQOEc581@macbook>
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-3-roger.pau@citrix.com>
 <3dcb9afe-7f3f-495c-b182-b4242b4cb337@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dcb9afe-7f3f-495c-b182-b4242b4cb337@suse.com>

On Mon, Feb 26, 2024 at 09:42:58AM +0100, Jan Beulich wrote:
> On 23.02.2024 13:06, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
> >  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
> >  int8_t __read_mostly opt_eager_fpu = -1;
> >  int8_t __read_mostly opt_l1d_flush = -1;
> > -static bool __initdata opt_branch_harden = true;
> > +static bool __initdata opt_branch_harden =
> > +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
> >  
> >  bool __initdata bsp_delay_spec_ctrl;
> >  uint8_t __read_mostly default_xen_spec_ctrl;
> > @@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
> >              opt_l1d_flush = val;
> >          else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> > +        {
> > +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
> >              opt_branch_harden = val;
> > +#else
> > +            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
> > +            rc = -EINVAL;
> > +#endif
> > +        }
> >          else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
> >              opt_srb_lock = val;
> >          else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )
> 
> While looking at patch 3 I noticed another inconsistency: Wouldn't
> "Compiled-in support:" better also enumerate HARDEN_BRANCH then, just
> like for thunks both CONFIG_* state and actual runtime choice are
> logged?

Yes, I guess we would also need to expand "Compiled-in support:" to
include HARDEN_ARRAY and HARDEN_GUEST_ACCESS.

> Or alternatively, should logging of thunk runtime choice be
> suppressed when the Kconfig setting is off?

Hm, I think printing "BTI-Thunk N/A" is good enough when the thunk has
been built time disabled.

Thanks, Roger.

