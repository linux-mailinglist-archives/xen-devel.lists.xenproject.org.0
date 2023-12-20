Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A881A1E2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 16:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658126.1027178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFyDq-0001m3-PL; Wed, 20 Dec 2023 15:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658126.1027178; Wed, 20 Dec 2023 15:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFyDq-0001jO-Lr; Wed, 20 Dec 2023 15:10:58 +0000
Received: by outflank-mailman (input) for mailman id 658126;
 Wed, 20 Dec 2023 15:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFyDp-0001i5-43
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 15:10:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f95996ef-9f49-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 16:10:56 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1439008f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 07:10:56 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 g16-20020adfa490000000b00336781b4915sm2546946wrb.43.2023.12.20.07.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 07:10:55 -0800 (PST)
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
X-Inumbo-ID: f95996ef-9f49-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703085055; x=1703689855; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NKMF2oCfOkz1pCZOd+zBNZHXXeuWXATMsPyXAcQv8Wk=;
        b=Paw5iq1n6T/qMupgzpSpYtXMULnFSzpoi6smkSrQlcwMZ4pLI5pJpe7DKFmYtnWFUP
         0l+YStsVE9SQ/Mdp0JOZlT4JnVSY+NNfHTCIJSnG7t+L2e2F0M7Z3rBSpUnn833N30wi
         DYYQAWvGzGLrVMlXqEnppYs1ZTNySffQI6HD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085055; x=1703689855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKMF2oCfOkz1pCZOd+zBNZHXXeuWXATMsPyXAcQv8Wk=;
        b=kSc0WGdocGSRgiPAcOvEdHs1lP6c5CwD2p3V4JP4ujQO/j3UROK2gIznGHGC6otJkI
         OPkew/JMGQbb2ZjHw6E7T0eTbV18KfOHgekEtTpBteBF6LQqMta1bJJxbK0zGPccwGYV
         AdoTONYliWTa/3yrYZJsbioBjGS7L5SK6gNY34mJpR2THveHj8QzY7hZj9rBqpgqs/Yk
         aXzTYomFSb6/J5hzSme4fQg/Jh5eHql1/yoSiuphIBE5lbz77sio3JLQTGEabcKbOR5j
         CyV4o5fpsLIGVnkJ0rZQqKGWipHhwXpZlphk4TrZESCUvsBluNllgQXDtPpyyWY05Vl2
         +P6Q==
X-Gm-Message-State: AOJu0YwrZaTfuCrpCrWX1d6las4rZpGtCgprRzSBpUbOeDZ/5v0hZfNI
	qMrCM6j2GMRHeBgceTQQP0OUXg==
X-Google-Smtp-Source: AGHT+IElg5mvUxHOGnA4gjybu36M8Zz8YKH68w2rVh6VHzX6jfwWtjdOWkSdcsh2+q7jNJOH7zL+6A==
X-Received: by 2002:a05:6000:1208:b0:336:7d6b:de76 with SMTP id e8-20020a056000120800b003367d6bde76mr517832wrx.67.1703085055553;
        Wed, 20 Dec 2023 07:10:55 -0800 (PST)
Date: Wed, 20 Dec 2023 16:10:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/amd: extend CPU errata #1474 affected models
Message-ID: <ZYMD_qukgCutWXRI@macbook>
References: <20231220142218.22850-1-roger.pau@citrix.com>
 <ffb3445f-fd50-4746-9f70-272ea52271ec@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffb3445f-fd50-4746-9f70-272ea52271ec@citrix.com>

On Wed, Dec 20, 2023 at 02:46:43PM +0000, Andrew Cooper wrote:
> On 20/12/2023 2:22 pm, Roger Pau Monne wrote:
> > Errata #1474 does also affect models from family 17h ranges 00-2Fh, so the
> > errata now covers all the models released under Family 17h (Zen, Zen+ and
> > Zen2).
> 
> Perhaps "has now been extended to cover models from ..." ?
> 
> > Additionally extend the workaround to Family 18h (Hygon), since it's based on
> > the Zen architecture and very likely affected.
> >
> > Rename all the zen2 related symbols to plain zen, since the errata doesn't
> > exclusively affect Zen2 anymore.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks for doing this.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I was going to suggest linking to an example revision guide but I see
> the AMD website is still broken.
> 
> > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > index 0f305312ff2a..099646dc3994 100644
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -54,7 +54,7 @@ bool __read_mostly amd_acpi_c1e_quirk;
> >  bool __ro_after_init amd_legacy_ssbd;
> >  bool __initdata amd_virt_spec_ctrl;
> >  
> > -static bool __read_mostly zen2_c6_disabled;
> > +static bool __read_mostly zen_c6_disabled;
> 
> amd_1474_c6_disable ?

Maybe just fam17h_c6_disabled, since the main usage of that variable
is to force calling fam17_disable_c6().

> That's about as general as I can make it, without losing precision.
> 
> 
> >  
> >  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
> >  				 unsigned int *hi)
> > @@ -978,24 +978,24 @@ void amd_check_zenbleed(void)
> >  		       val & chickenbit ? "chickenbit" : "microcode");
> >  }
> >  
> > -static void cf_check zen2_disable_c6(void *arg)
> > +static void cf_check zen_disable_c6(void *arg)
> 
> fam17_disable_c6() ?  I know Hygon is 0x18 but it's also reasonably well
> know to be the same uarch.
> 
> This particular algorithm is good for all Fam17 uarches, irrespective of
> #1474, even if they happen to be the same set of CPUs in practice.

Yeah, I was about to use fam17h prefix, but that wouldn't cover Hygon.
I we are fine with it I can send an adjusted v2 using fam17h prefix.

Thanks, Roger.

