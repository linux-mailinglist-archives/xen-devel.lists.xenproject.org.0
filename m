Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC0860DCD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684700.1064724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRi7-0003Ad-Lf; Fri, 23 Feb 2024 09:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684700.1064724; Fri, 23 Feb 2024 09:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRi7-00038P-IA; Fri, 23 Feb 2024 09:19:15 +0000
Received: by outflank-mailman (input) for mailman id 684700;
 Fri, 23 Feb 2024 09:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdRi6-00035f-4P
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:19:14 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b294b29-d22c-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:19:11 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-512cba0f953so738066e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 01:19:12 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 mu19-20020a056214329300b0068fbd69defesm1871516qvb.87.2024.02.23.01.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 01:19:11 -0800 (PST)
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
X-Inumbo-ID: 9b294b29-d22c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708679951; x=1709284751; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7hQCuUachth0pW2nuQ1/VeIz0I8udEWdG6ieEd+U/o=;
        b=a66ODQlA3E+q5SddnNSLt4OxaHLcSq8miZgRf38shHh7PJvLxsJgGjH5ww4/Q2HK1i
         cmF+N/tU4vHHmZ1ejks09hsfsWAV35aKedZ9rAKzW3jctykeF2GWkPhXkNqqR7tyDUkk
         y1aQfWss+8GnKe7jJx9HmSL2eKgrwQFjpFfg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708679951; x=1709284751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7hQCuUachth0pW2nuQ1/VeIz0I8udEWdG6ieEd+U/o=;
        b=OJi0xv6/7Y9h49ga/x2TqlF94o9sqGXnEix/S/g5qVptNjySemT4KzCXEy3W1Lbady
         BtpguMMfkm+uTJpOD3CdDptseUBjia/kVXIWMEA5agekbSkmUpSGgUSuY+q5AK6Lz4bz
         G9HsBt8TP3k+YfF5bpBEGF9eqoWiG46cnj7/CeL7VIF1JoKp4BNv+F2wJSw3YVBE0lIE
         i4laacsY6shcaYri1c9cH5/UgGTwjzy0M4nngnYSnvycV+dbqIvM/JA/EV94Mg81Hlxi
         ckcQQhOs2Pvrk6tqbSoXs/B2mrsGteiPodMBEDuNuRon9QM1Go2AP4wgqYtHSjYitD1d
         SL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCULmo26i5EGxN7vNMuWOnBtEDe70mBRgJu13BCQZzCqqRjz/ot9GEyh1PqkmOctm0rl6JRu2kdrV2rEXxyt/cuDdhRSM16HqZ+xlArlYSQ=
X-Gm-Message-State: AOJu0YxTBWuHgGx7uNUYHsrEKbXKpVfu2rEbz4AGZ5OyWwrZ/iYglPxq
	QSC5Cvweo1w7hq5sXwFg07EeIG0bYQpSNqJ/3+b5WrYLsimNZWlTNG3E5sgJ5PE=
X-Google-Smtp-Source: AGHT+IFh8sCmJJ0Uj3+IH25ZkymPg0MrwVYtvDLQmvWJVlI7H90HIuaZ8c1jMaezxFY6Gp2/yEZ+Hg==
X-Received: by 2002:ac2:48ab:0:b0:512:cfac:3d81 with SMTP id u11-20020ac248ab000000b00512cfac3d81mr813189lfg.68.1708679951392;
        Fri, 23 Feb 2024 01:19:11 -0800 (PST)
Date: Fri, 23 Feb 2024 10:19:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Matthew Grooms <mgrooms@shrew.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/altcall: use an union as register type for
 function parameters
Message-ID: <ZdhjDBlHRtO4MIhM@macbook>
References: <20240222164455.67248-1-roger.pau@citrix.com>
 <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com>

On Thu, Feb 22, 2024 at 05:55:00PM +0100, Jan Beulich wrote:
> On 22.02.2024 17:44, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -167,9 +167,25 @@ extern void alternative_branches(void);
> >  #define ALT_CALL_arg5 "r8"
> >  #define ALT_CALL_arg6 "r9"
> >  
> > +#ifdef CONFIG_CC_IS_CLANG
> > +/*
> > + * Use an union with an unsigned long in order to prevent clang from skipping a
> > + * possible truncation of the value.  By using the union any truncation is
> > + * carried before the call instruction.
> > + * https://github.com/llvm/llvm-project/issues/82598
> > + */
> 
> I think it needs saying that this is relying on compiler behavior not
> mandated by the standard, thus explaining why it's restricted to
> Clang (down the road we may even want to restrict to old versions,
> assuming they fix the issue at some point). Plus also giving future
> readers a clear understanding that if something breaks with this, it's
> not really a surprise.

What about:

Use a union with an unsigned long in order to prevent clang from
skipping a possible truncation of the value.  By using the union any
truncation is carried before the call instruction.  Note this
behavior is not mandated by the standard, and hence could stop being
a viable workaround, or worse, could cause a different set of
code-generation issues in future clang versions.

This has been reported upstream at:
https://github.com/llvm/llvm-project/issues/82598

> Aiui this bug is only a special case of the other, much older one, so
> referencing that one here too would seem advisable.

My report has been resolved as a duplicate of:

https://github.com/llvm/llvm-project/issues/43573

FWIW, I think for the context the link is used in (altcall) my bug
report is more representative, and readers can always follow the trail
into the other inter-related bugs.

> As a nit: I think it is "a union" (spelling according to pronunciation),
> and I guess the title could now do with saying "optionally" or
> mentioning Clang or some such.

OK.

Thanks, Roger

