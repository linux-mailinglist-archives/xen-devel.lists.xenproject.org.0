Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF486102A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 12:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684796.1064915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdTT3-00061J-1D; Fri, 23 Feb 2024 11:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684796.1064915; Fri, 23 Feb 2024 11:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdTT2-0005yj-TK; Fri, 23 Feb 2024 11:11:48 +0000
Received: by outflank-mailman (input) for mailman id 684796;
 Fri, 23 Feb 2024 11:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdTT1-0005yd-I1
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 11:11:47 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 552bae5c-d23c-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 12:11:46 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so1003536e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 03:11:46 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 on12-20020a056214448c00b0068f51bfb6c8sm7346215qvb.132.2024.02.23.03.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 03:11:45 -0800 (PST)
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
X-Inumbo-ID: 552bae5c-d23c-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708686706; x=1709291506; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F9fH0kJ9IeL3G35Vgyq2Tqf5MGK5iAc0aBgni/nudck=;
        b=RqXXF85VkZ4cR56xXVOJRczRXQk2KZpgQUjwl1crxJ/n5rUWxyij+E90qgRu+V/MS/
         z0uoYJrtLonIfLKR0Fu0hBJTZ/8RnrRfKwRyLnBXUh7ZjOlas/b1eW+yVeGm3QHiruUM
         JxZkf5gUWa6NNWAjglM4gOXYC/COlVchJJD5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686706; x=1709291506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9fH0kJ9IeL3G35Vgyq2Tqf5MGK5iAc0aBgni/nudck=;
        b=SZHYhMxF6cLMHtE/vZWcAa9cUXOUbHpv3wd7lqHefmkFekSx8emwOFK7Bn+ufSc7Hu
         KPk1OWtsqokA2S+C+o0GXMpZrOWS4ZC0uM2tDfxzzzRhe8fr/Krhj5XBmX44+y4DJdm4
         nCvSJWz1JERNV2YbTcljhjHa+3dZs+iMvDI2nVpkpP96DZqUofxO3ZIi47t1iH0WB+nR
         UJa4YdyDt0RyYx6oZR8+W6CDuqYiYvTH5rUW9mSIjadS6FpOmatn6r9c06zPFlyfnpMX
         r5vi7PTcIj2KMTrtyMNisngG5Zw/NnPiw3W7NqEDHcZgDWlLaM/gMXSn3b4sQgowefnZ
         YjMg==
X-Gm-Message-State: AOJu0Yzy6TKfAasMRbUIGS9JQ/uE7kQ3r4F5LE2a9IVq787BupwcHc9X
	U4z9tFjfcoTJgHyyuf1lvO8AcNBYA6MrBM7jGOOMhcLeMjMMStHyXGHUhLFBdx8=
X-Google-Smtp-Source: AGHT+IFic857UkGzEfMM8UHD2ptpj2AXvv92ERn5KaOJ2Bp2F33GxVE48aOzF9Z8Ftpdk++Hic3b/w==
X-Received: by 2002:a05:6512:e9f:b0:512:e5bf:f342 with SMTP id bi31-20020a0565120e9f00b00512e5bff342mr1417708lfb.37.1708686705990;
        Fri, 23 Feb 2024 03:11:45 -0800 (PST)
Date: Fri, 23 Feb 2024 12:11:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/spec: fix BRANCH_HARDEN option to only be set when
 build-enabled
Message-ID: <Zdh9b4vNHfJnFXPR@macbook>
References: <20240223094215.71889-1-roger.pau@citrix.com>
 <b5696664-0e85-414b-8360-242349a87a7e@citrix.com>
 <Zdhwve9-YQekWb0B@macbook>
 <cf60c604-5a4a-46be-badf-1f55a760e421@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf60c604-5a4a-46be-badf-1f55a760e421@citrix.com>

On Fri, Feb 23, 2024 at 10:26:15AM +0000, Andrew Cooper wrote:
> On 23/02/2024 10:17 am, Roger Pau Monné wrote:
> > On Fri, Feb 23, 2024 at 09:46:27AM +0000, Andrew Cooper wrote:
> >> On 23/02/2024 9:42 am, Roger Pau Monne wrote:
> >>> The current logic to handle the BRANCH_HARDEN option will report it as enabled
> >>> even when build-time disabled. Fix this by only allowing the option to be set
> >>> when support for it is built into Xen.
> >>>
> >>> Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>>  xen/arch/x86/spec_ctrl.c | 6 ++++--
> >>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> >>> index 421fe3f640df..e634c6b559b4 100644
> >>> --- a/xen/arch/x86/spec_ctrl.c
> >>> +++ b/xen/arch/x86/spec_ctrl.c
> >>> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
> >>>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
> >>>  int8_t __read_mostly opt_eager_fpu = -1;
> >>>  int8_t __read_mostly opt_l1d_flush = -1;
> >>> -static bool __initdata opt_branch_harden = true;
> >>> +static bool __initdata opt_branch_harden =
> >>> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
> >>>  
> >>>  bool __initdata bsp_delay_spec_ctrl;
> >>>  uint8_t __read_mostly default_xen_spec_ctrl;
> >>> @@ -267,7 +268,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >>>              opt_eager_fpu = val;
> >>>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
> >>>              opt_l1d_flush = val;
> >>> -        else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> >>> +        else if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
> >>> +                  (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> >>>              opt_branch_harden = val;
> >> Yeah, we should definitely fix this, but could we use no_config_param()
> >> here for the compiled-out case ?
> >>
> >> See cet= for an example.  If we're going to ignore what the user asks,
> >> we should tell them why.
> > Maybe I'm missing something: I've looked into using no_config_param(),
> > but there's no difference really, because cmdline_parse() is called
> > before the console is initialized, so those messages seem to be
> > lost.
> 
> Look at `xl dmesg` rather than the console.  They also do appear on vga
> in some configurations.

Oh, my internal buffer was too small on those also got truncated, had
to bump it.

> There's a separate todo to get these out in a slightly nicer way, but
> they at least exist in logs.

I've created:

https://gitlab.com/xen-project/xen/-/issues/184

Thanks, Roger.

