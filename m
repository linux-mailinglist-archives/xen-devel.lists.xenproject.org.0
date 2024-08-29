Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9530964710
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 15:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785898.1195424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfQX-0000i2-1Q; Thu, 29 Aug 2024 13:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785898.1195424; Thu, 29 Aug 2024 13:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfQW-0000gX-V5; Thu, 29 Aug 2024 13:43:04 +0000
Received: by outflank-mailman (input) for mailman id 785898;
 Thu, 29 Aug 2024 13:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlBE=P4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sjfQV-0000gR-SU
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 13:43:03 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7f335b-660c-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 15:43:01 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5df998d7a44so385052eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 06:43:01 -0700 (PDT)
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
X-Inumbo-ID: 9b7f335b-660c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724938980; x=1725543780; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9a5vcWm5an8nEcn6WsqlhOT0b47Xfg8gWU0il8eCCTE=;
        b=T2X/9sN6kLDPmFio0wCmtgUy1i1uf16lvsVgCr5+7QeyEZfT6vGGsRSjqlaftNdvUb
         AMKLAW9qEKu97ko6L4ICkiStjJgq9qblU8I56wSzDf571crunQa85wXdAwfgUEkaWvBi
         pxDmQd1CKj7d8bkeLuup3upbaoZTJoYGlXBgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938980; x=1725543780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a5vcWm5an8nEcn6WsqlhOT0b47Xfg8gWU0il8eCCTE=;
        b=Z6gLGcNGI25QyHpybdmPRM5YURz26sLXUGvxKrNH+wqos7HS6/OdxiCHyZNg/+bFVJ
         y/xr1RxzQzNAuShR2Qkn/kjpR3KyszQZXaYI6hYHaTx/0orASiP8yCNPsRnmJFn6uqxc
         YC9PoRVC8bWJaD5aIo+md4AB09AjS174GaqZ7hK/ACoWikO4I7VH63MzoiGud6b9yaXu
         haGXvEE0kkJPdddACXdKYHFOQLtpAO07S2/X7jCHlBYUOJm52Z3dRx/r6RhU0wbv38Gv
         2yszzGUyUxLwPrEfnjC8GZ90paGuUXDg7hmLp/BGWUaFZKr34tWtEi4nsuB4Lf0XG6nD
         aydQ==
X-Gm-Message-State: AOJu0YxPJjwcDY7DbigfVZCVA1GVTVXpUCzW4URtzL8M/bHQerEiR6/h
	EzCX9YP6MwPRDE3F3P+w5ovNqHcSmaL6OM/j6aqhEuQET0C5xFjIQNV8aBAzuW3Yu9w9ajVvu7y
	zDp7VaXpuCfhzIz71OgsuHWFOEaHzOI5K7JmdNA==
X-Google-Smtp-Source: AGHT+IGU8/YsbUCa7lD/roEvB6YnJZfJiXZdyTdf7WKEaoWmjDfYhvpSQYkbrp0D2sjqKqLbh4b/A1q3+Ysk4LTm0QU=
X-Received: by 2002:a05:6808:1302:b0:3dc:299d:c505 with SMTP id
 5614622812f47-3df05e22505mr2539841b6e.37.1724938980053; Thu, 29 Aug 2024
 06:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240829115247.168608-1-frediano.ziglio@cloud.com> <594b5ad4-0b86-4397-a261-0e98515e3abe@citrix.com>
In-Reply-To: <594b5ad4-0b86-4397-a261-0e98515e3abe@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 29 Aug 2024 14:42:49 +0100
Message-ID: <CACHz=Zj3Mw+7EbbB3vdndu5bzhXEN3p1JV4Dzm12Xt2EE1AV+Q@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Use C99 types for integers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 1:07=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 29/08/2024 12:52 pm, Frediano Ziglio wrote:
> > diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
> > index 239b9f8716..ee1a4da6af 100644
> > --- a/xen/arch/x86/boot/defs.h
> > +++ b/xen/arch/x86/boot/defs.h
> > @@ -57,7 +57,7 @@ typedef u16 uint16_t;
> >  typedef u32 uint32_t;
> >  typedef u64 uint64_t;
> >
> > -#define U16_MAX              ((u16)(~0U))
> > +#define UINT16_MAX   ((uint16_t)(~0U))
> >  #define UINT_MAX     (~0U)
> >
> >  #endif /* __BOOT_DEFS_H__ */
>
> I'm happy with the change in principle, but could we see about dropping
> defs.h entirely?  For example, we've already got both of these UINT
> constants in types.h
>
> Since this was written, we've got rather better about cleaning up
> xen/types.h, and extracting macros into xen/macros.h
>
> I think there's a good chance that the regular headers can now be used
> directly, or with minor tweaking.
>

I tried, it gave a huge bunch of errors.
I think it can be done in a later follow-up.

Frediano

