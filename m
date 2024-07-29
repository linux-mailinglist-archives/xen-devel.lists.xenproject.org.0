Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E493F3B8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766603.1177103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOIw-0003gL-56; Mon, 29 Jul 2024 11:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766603.1177103; Mon, 29 Jul 2024 11:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOIw-0003dy-2X; Mon, 29 Jul 2024 11:12:38 +0000
Received: by outflank-mailman (input) for mailman id 766603;
 Mon, 29 Jul 2024 11:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vj3p=O5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sYOIu-0003ds-QY
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:12:36 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75678f6b-4d9b-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 13:12:35 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so6968995a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:12:35 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b046fsm5621463a12.18.2024.07.29.04.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:12:34 -0700 (PDT)
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
X-Inumbo-ID: 75678f6b-4d9b-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722251555; x=1722856355; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwobmWn9iHkOe0+zh6FeaE5pEcL8ZlX2W1yrPwOtvx8=;
        b=A0YNUxSFQQciaa5m0nqy95Y7SUHGJoCZvTnipSVZ+zS9uEHp4G9sXnihpJOUMPiFqS
         UWfmsluGqw/NVXZN7zM5AG5Dg61+chhvFldDa3MxUg1sqpCEKqzk5szQ7ydFIk3ghn+u
         UlvnmQYwdvvyZE9VbbkfcApyFA+lqoeLmZqBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251555; x=1722856355;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PwobmWn9iHkOe0+zh6FeaE5pEcL8ZlX2W1yrPwOtvx8=;
        b=J73rxGj9laCfvIAxSi40ZtUM4v6xkjvMbXioFSmkLUugZExeEpDledEzAy7YpDHD0s
         9GrNTZV97GC5dwRm5WdkMSqXDzitl6u4N5vh4BBdCITYMgP/94D+Cb//brdCaZoOkVI+
         ce2wWZZOWZ3NbtuCManpIFsUISdqcag1/3Z/nn/NJrGkD7MCQYJUlPUkNXHKD7y2V2is
         3Vjp3bOGnCw/zya6ruKAgHxHqHumkh3n3RQogDDAtJKapaAqictxH50HalegJKGxTwuX
         tjx8JMEsScf0vdeiCx6qjDUchggr5Kpe12WZR2FakvjwSyozxZ6f+M/PldI2HSYD+dcN
         UrWg==
X-Forwarded-Encrypted: i=1; AJvYcCUOHg8cMd8IHeE1+6zuo9vQrZuGeHkWniVs4t61C1abm7xefbR9nmTYBH6BKtQ4+dlZ2Zks6+v2kcSa8p6nI3upRspA6Kbflmy2LeeyXEE=
X-Gm-Message-State: AOJu0Yzg0bignEfB5/hxEOPahjBqMmaI3HcvyT4pZ0btJ6DLemB8g2/n
	4RrBTWqPnNGjZLai11aCZSxSz84VxJsbvBk0VbIRs6z9i/zsPTG9ouowAQ1mOQY=
X-Google-Smtp-Source: AGHT+IEbWeA2HbXNhQEWgUNNmstbFm3NUWgLivKlWscR3vSfeRqzBHNxvD/vvnViTOB+98j8u1hORA==
X-Received: by 2002:a50:9b5b:0:b0:5a1:4f76:1a25 with SMTP id 4fb4d7f45d1cf-5b0192a5ab6mr6858392a12.17.1722251555239;
        Mon, 29 Jul 2024 04:12:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jul 2024 12:12:32 +0100
Message-Id: <D31Z80PQAXQ8.3CHMUYH6AQJOL@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/altcall: further refine clang workaround
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Roger Pau Monne"
 <roger.pau@citrix.com>
X-Mailer: aerc 0.17.0
References: <20240729103050.38401-1-roger.pau@citrix.com>
 <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com>
In-Reply-To: <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com>

On Mon Jul 29, 2024 at 11:47 AM BST, Jan Beulich wrote:
> On 29.07.2024 12:30, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -183,13 +183,13 @@ extern void alternative_branches(void);
> >   * https://github.com/llvm/llvm-project/issues/12579
> >   * https://github.com/llvm/llvm-project/issues/82598
> >   */
> > -#define ALT_CALL_ARG(arg, n)                                          =
  \
> > -    register union {                                                  =
  \
> > -        typeof(arg) e[sizeof(long) / sizeof(arg)];                    =
  \
> > -        unsigned long r;                                              =
  \
> > -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D {                     =
    \
> > -        .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg)=
; })\
> > -    }
> > +#define ALT_CALL_ARG(arg, n)                                          =
   \
> > +     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D =
({   \
> > +         unsigned long tmp =3D 0;                                     =
     \
> > +         *(typeof(arg) *)&tmp =3D (arg);                              =
     \
> > +         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                  =
   \
>
> With this, even more so than before, I think the type of tmp would better
> be void * (or the BUILD_BUG_ON() be made use unsigned long, yet I conside=
r
> that less desirable). As a nit, I also don't think the backslashes need
> moving out by one position. Finally I'm afraid you're leaving stale the
> comment ahead of this construct.
>
> Jan

I wouldn't be thrilled to create a temp variable of yet another type that i=
s
potentially neither "typeof(arg)" nor "unsigned long". No need to create a =
3
body problem, where 2 is enough. Adjusting BUILD_BUG_ON() to use the same t=
emp
type seems sensible, but I don't mind very much.

With the stale comment adjusted:

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

