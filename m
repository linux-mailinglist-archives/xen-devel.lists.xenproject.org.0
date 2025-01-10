Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC1A08A23
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 09:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869319.1280786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWAOY-00043M-AB; Fri, 10 Jan 2025 08:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869319.1280786; Fri, 10 Jan 2025 08:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWAOY-00040o-6v; Fri, 10 Jan 2025 08:29:30 +0000
Received: by outflank-mailman (input) for mailman id 869319;
 Fri, 10 Jan 2025 08:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWAOX-00040d-1B
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 08:29:29 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01afb03f-cf2d-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 09:29:28 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d437235769so2796969a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 00:29:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c2d7sm1430082a12.3.2025.01.10.00.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 00:29:27 -0800 (PST)
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
X-Inumbo-ID: 01afb03f-cf2d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736497767; x=1737102567; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4ICae/veHvifgIXZmGBCTFTE2MaB92Q6Qd4tbvpzjY=;
        b=BNcfzqjREy6BnJzJssFUzX790xmP2igYjJ5UUvTzOkr6XgHLS6rNOpOMrMJG/UeBOp
         K6wk1lyZe4KLMgtZ0rHzYww7r/AGVICEh+IID6uztP2EHHh6vWYlL/h7LO5CjQVCtY0t
         /zoQtBpDJeUdGpSI9zIw6FL0XO6822GvxTrAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497767; x=1737102567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4ICae/veHvifgIXZmGBCTFTE2MaB92Q6Qd4tbvpzjY=;
        b=oT2r3jddwJd4tURvagGxFw9PamG9oHp6a8Sn02jhlf61FPd2BCqqpwEb4bVeJKP6xi
         wwB+wc2Pdw3Sx0v21jRBMCPkQrKUiYdKXiMGhGZdK1xYYIzM9cSx24sAPwJv8wR/YM+2
         S0S5S9/8gFic+s3pzLWvjb2L5qwQYfyDEFUGOLL3UkaICGtWOMkUGo6Kbbvjed32h4rf
         jZl9rxYPVu+noi+dT7TBPbzNRbSzyXteqNc9+xKZrCU0b4JAkosEOOB5lLh7MU9ZXNUS
         vvFsL8Yj5s8EoK4iKVLJZ0GPnfkiKiZpqGhAQbaZQ+aBdbH96cgbWW4ujyd70cZmhUfJ
         k2yg==
X-Forwarded-Encrypted: i=1; AJvYcCW98PnLHOCNBCiew8C6IAMVSGDL9tHC1W2jLPReHdhVKDmi7bRLjVU1FWy8zyHAljlBzmqbfJ1FY5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2A5I5Mmqjt9Du2rcDO7bZDOICkk/l7oPf3MiDoozYciIYPsPk
	wMFUobNnr4MSk5Gvm9m0GeA6RJTzFfYUl8o+lnsevHYI2ERp6097sERt5I34NGs=
X-Gm-Gg: ASbGncsNIdjEKpvBhbnx90qytAJK/mchxdeg/3yi605v9EGvgQR6r/EPUtHRxdFp9Cs
	8uvSTQh/5JWDZCPb27BEQrQHtfO/biBmU7kPT7d/Ze6tIKErKGLNnHwLa7Ld+mFjpHzfcya9eLx
	beZ/voxk73bOKPw+DkqHJ6khl0yThio4LMn7dYkgDad9tnNzkgZKSaUWL1U/UnnOBJugOYK8IZS
	mUEcL5BjIWiqTvhidKKCrGL94mxnDv1ypW5lHloxEsSdm6vYZWii8M+5BB6yw==
X-Google-Smtp-Source: AGHT+IGICDCLF7EqLsMeKfdZ3QDCFUtrhTkUmxRZZTYKVsqaXBGBv66eyDQXC5EtBvMGtnHpK1K/dw==
X-Received: by 2002:a05:6402:254d:b0:5d0:81dc:f20e with SMTP id 4fb4d7f45d1cf-5d972e1c5cfmr8993118a12.17.1736497767592;
        Fri, 10 Jan 2025 00:29:27 -0800 (PST)
Date: Fri, 10 Jan 2025 09:29:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative
 harden guards
Message-ID: <Z4DaZlbEDEjxQ6g-@macbook.local>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-2-roger.pau@citrix.com>
 <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
 <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
 <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
 <8e31daaf77216534c252d371a3251595@bugseng.com>
 <alpine.DEB.2.22.394.2501091556590.133435@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2501091556590.133435@ubuntu-linux-20-04-desktop>

On Thu, Jan 09, 2025 at 03:57:24PM -0800, Stefano Stabellini wrote:
> On Thu, 9 Jan 2025, Nicola Vetrini wrote:
> > On 2025-01-04 01:20, Stefano Stabellini wrote:
> > > Hi Nicola, one question below
> > > 
> > > On Wed, 27 Nov 2024, Nicola Vetrini wrote:
> > > > > #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
> > > > >
> > > > > where we're using the C99 form rather than the GNU extension, and where
> > > > > hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
> > > > > parenthesizing, when it isn't and can't be.
> > > > >
> > > > > Isn't it rather the case that variable argument macros need a more
> > > > general
> > > > > deviation, if not an adjustment to the Misra rule? Extending the Cc list
> > > > > some ...
> > > 
> > > Nicola, if you look at the original patch:
> > > https://marc.info/?l=xen-devel&m=173261356716876
> > > 
> > > "The current guards to select whether user accesses should be speculative
> > > hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> > > parenthesize the 'args' argument."
> > > 
> > > And the very first change in the patch is:
> > > 
> > > diff --git a/xen/arch/x86/include/asm/uaccess.h
> > > b/xen/arch/x86/include/asm/uaccess.h
> > > index 2d01669b96..6b8150ac22 100644
> > > --- a/xen/arch/x86/include/asm/uaccess.h
> > > +++ b/xen/arch/x86/include/asm/uaccess.h
> > > @@ -24,9 +24,6 @@ unsigned int copy_from_unsafe_ll(void *to, const void
> > > *from, unsigned int n);
> > >  void noreturn __get_user_bad(void);
> > >  void noreturn __put_user_bad(void);
> > > 
> > > -#define UA_KEEP(args...) args
> > > -#define UA_DROP(args...)
> > > -
> > >  /**
> > >   * get_guest: - Get a simple variable from guest space.
> > >   * @x:   Variable to store result.
> > > 
> > > 
> > > Do you think there is any way we could configure Eclair, with or without
> > > a deviation, not to detect every use of UA_KEEP as violations?
> > 
> > I narrowed this violation down to a different treatment of the named variadic
> > argument. Since the argument 'args' cannot be parenthesized as a regular
> > argument could, the invocations of the 'UA_KEEP' cannot comply with the rule.
> > Therefore, as an extension to the rule, ECLAIR currently ignores the use of
> > '__VA_ARGS__' in a macro definition, but treats 'args...' as a regular macro
> > parameter name, hence the violation.
> > 
> > To be clear, these two definitions have the same semantics, but one shows a
> > violation and the other doesn't
> > 
> > #define UA_KEEP(args...) args
> > #define UA_KEEP(...) __VA_ARGS__
> > 
> > I will update ECLAIR to treat the two forms as the same, so this patch can be
> > dropped. If you think it's helpful I can send a patch spelling out this -
> > arbitrary, but reasonable in my opinion - extension to the MISRA rule (which
> > does not consider the implications related to the use of GNU exensions) so
> > that contributors have a clear picture of the situation.
> 
> Thank you Nicola! Yes the patch would be appreciated :-)

So unless the proposed adjustment is considered better for code
readability patch 1 can be dropped, and patch 2 could be applied after
the ECLAIR change is in effect?

How long will it take Nicola to get the ECLAIR change propagated into
the Gitlab runner?

Thanks, Roger.

