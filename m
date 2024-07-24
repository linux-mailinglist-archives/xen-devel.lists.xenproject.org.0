Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A788993AE61
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 11:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764010.1174278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWY3f-0000U5-K0; Wed, 24 Jul 2024 09:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764010.1174278; Wed, 24 Jul 2024 09:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWY3f-0000S9-HS; Wed, 24 Jul 2024 09:13:15 +0000
Received: by outflank-mailman (input) for mailman id 764010;
 Wed, 24 Jul 2024 09:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23fT=OY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWY3e-0000S3-EQ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 09:13:14 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3c14130-499c-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 11:13:13 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-44caaf77c7eso31808811cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 02:13:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cbf236esm52243651cf.13.2024.07.24.02.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 02:13:11 -0700 (PDT)
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
X-Inumbo-ID: f3c14130-499c-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721812392; x=1722417192; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+zP+aolFE9PrZh9txc7o8wHE311lPsj9k+y87+L9mso=;
        b=Yja888H2TBgsWT8ME7f8/NGg8EiNrrUfCvOL/wO0B3RMmpjXQYG0rQuFlTaIjbV0cd
         6BJu937nvrBsp7Ey53N0xJyaoSdOGoJPzPcbj3uOHDyNqwXnh2EDlqflmZEWxqOe1y5B
         e4h7JgUvF1YgmzeBH6MWxDO2XVdODPfbddf7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721812392; x=1722417192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zP+aolFE9PrZh9txc7o8wHE311lPsj9k+y87+L9mso=;
        b=shC40krwJcno/MOwhpKMN+hkPH6NWWkQ60UZ4eIxICL/l0s2HvJgakoDyJis7Nfzeo
         MruGlYt+W5hTWQ+YmVQUHlPoWwWqAOS8wmG80aCnaB/2s152xe4YtvH7nZyrVeuXx7M2
         lpuVQaa7Y4gCuBYE8Ms0mpkcBLkpgifGM4tPIlICb6jmndljN8D8tlhpvPofeHNNL1hh
         o6OfTgZx6ZfC12F6GumDzxTFYoEBOmcrb4tTJ3D8U+xn39xT04u5oNwdU0e0jdYR4A0V
         xErbCkn8DoNQcLkhyTn7djUroWUwecD5Vj6z3cnKd0P9gHwaDXoplPj76xZ10jecRR1L
         KKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmkbvaZkCz2sEsQDUQSjjNE15G1E4SBE5SWGDbeQrvZBeGtd3xrzXMPQJdzCsmjmIOmxinL/N2kwY/betBCO8Sf31FLYRrPDrwLHKF9s0=
X-Gm-Message-State: AOJu0YzNSbhOwpNqy4UlO5d+NqkSplFa3INBtcVwaWGG9lYJ9y8EMBik
	oQZgtZ6/B1djqPIp+UyUCV/aigWfwSKOWhOVGFyqPkegGtFT08lLDhqkyECikBA=
X-Google-Smtp-Source: AGHT+IGahE//qQ1KiTJo44P2R5jCreP3H8C2yjv86vocSiCTdM9nuhyWpMujpoGBcNFUaktXSYKMag==
X-Received: by 2002:a05:622a:1a99:b0:447:e14a:20a3 with SMTP id d75a77b69052e-44fd6903981mr18059921cf.55.1721812391948;
        Wed, 24 Jul 2024 02:13:11 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:13:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
Message-ID: <ZqDFpLbGe_HmTrTF@macbook>
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com>
 <Zp_VuwxqH3Mii8_W@macbook>
 <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
 <7a5da6ce-0ef0-4666-a5c4-44383469f67e@suse.com>
 <ZqC7Hn8R6Mkyqtpl@macbook>
 <4a1bae1e-16d2-4536-b69a-1fff8179ee86@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a1bae1e-16d2-4536-b69a-1fff8179ee86@suse.com>

On Wed, Jul 24, 2024 at 10:41:43AM +0200, Jan Beulich wrote:
> On 24.07.2024 10:28, Roger Pau Monné wrote:
> > The only way I've found to cope with this is to use something like:
> > 
> > #define ALT_CALL_ARG(arg, n)                                            \
> >     union {                                                             \
> >         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
> >         unsigned long r;                                                \
> >     } a ## n ## __  = {                                                 \
> >         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> >     };                                                                  \
> >     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
> >         a ## n ## __.r
> > 
> > An oversized array that ensures all the space of the long is covered
> > by the array, but then we need an extra variable, as we would
> > otherwise require modifying ALT_CALL{0..6}_OUT to use aX_.r instead of
> > aX_.
> 
> I don't think we need to over-size the array. It just gets yet a little
> more complex then:
> 
> #define ALT_CALL_ARG(arg, n)                                            \
>     register union {                                                    \
>         struct {                                                        \
>             typeof(arg) e;                                              \
>             char pad[sizeof(long) - sizeof(arg)];                       \
>         } s;                                                            \
>         unsigned long r;                                                \
>     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
>         .s.e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); }) \
>     }

We could even simplify this, there's no need for the union anymore,
since struct size == sizeof(long) already:

#define ALT_CALL_ARG(arg, n)                                            \
    register struct {                                                   \
        typeof(arg) e;                                                  \
        char pad[sizeof(long) - sizeof(arg)];                           \
    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
        .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
    }

The above seems to work for both the original issue and the new one.

Thanks, Roger.

