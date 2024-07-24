Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35793AEF2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 11:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764023.1174299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYDm-0002jU-PQ; Wed, 24 Jul 2024 09:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764023.1174299; Wed, 24 Jul 2024 09:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYDm-0002he-LQ; Wed, 24 Jul 2024 09:23:42 +0000
Received: by outflank-mailman (input) for mailman id 764023;
 Wed, 24 Jul 2024 09:23:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23fT=OY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWYDl-0002hY-1z
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 09:23:41 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ce418a-499e-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 11:23:39 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-44f6700addcso35937921cf.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 02:23:38 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cd37290sm53182271cf.50.2024.07.24.02.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 02:23:37 -0700 (PDT)
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
X-Inumbo-ID: 68ce418a-499e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721813018; x=1722417818; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42lULhR2Mk+N1S+M0ToChTU/LjrnZTV+wWXNzNs5YO4=;
        b=RUl+jcoJEQ4vCWj84ZKbzcCqZaMz0fJVRa0HGtkhX6QpzNOL6RRkIprO+E1RE7rDKt
         kFhqeQB37gcOWW7x9kkPIyNqErX0nuaF+EwkDOUcZ6rvCANizwNh5E4HJhOM3tWmUtpG
         lnbg04Xkj75T1ZuyIzkzHZUXH7mH5eyC37GMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721813018; x=1722417818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42lULhR2Mk+N1S+M0ToChTU/LjrnZTV+wWXNzNs5YO4=;
        b=Afk3OUHejlE8DF/pSuZt8r316i1+a6ERF+8MCzphcrIjJGYcpcU+ffK3eMD9zL4UkW
         pNvfUIcQec95tyCru6xgrtQgreBWzMAf5+b4sJmaJHUF8CnJR0mQ+YTEwqgG3QblgVsi
         Gfrw6mrnk5nYu2ILyZLHR0lsQnrZli5JK6UJQtV/wHEjIoeJZ+u+XjY8Ecv1bBsOfS6L
         eiO7aWarVf9AMvKDTSQaAtjgE9Sa9ot10OTQL1v01xxkH0iw56S7XmMqgsJ60m/4hNWE
         yRLyZ+qpOP3/AKI1bJSYtLPRCNhenrf6R/xT662G12Cvob+60HJrj2KDYFLpHX0qzLNa
         muOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsoDEzLNiWfOnKFZBLOA71yrIKicmxwTXhbT4LA55gaW3lv8pJGWM/rQV+1V5+I5khDWNq9fTWcKNlAp1rBJOErLKtehSESK8jmyl+gds=
X-Gm-Message-State: AOJu0YxYTCP3pNTZFk1YvdWd5iE0xuqqSddvK2x1ecXQ8OlsyBNTFvZ4
	t7EBPFNM7Og8QlGATS97l7Hfarj33CGEG7JXjUzVJgXImn4YEd/ppbrXo4BsdCc=
X-Google-Smtp-Source: AGHT+IE096mv8mPEhezE4xiFsZy7K/nSPoXwJbYxj0MIqtXek7eI/o00/jHkUziVDVHbTX3B6k6/zA==
X-Received: by 2002:ac8:5d4f:0:b0:447:ea03:4546 with SMTP id d75a77b69052e-44fd685306bmr13096781cf.15.1721813017552;
        Wed, 24 Jul 2024 02:23:37 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:23:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
Message-ID: <ZqDIB4DSI03OBs2Z@macbook>
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com>
 <Zp_VuwxqH3Mii8_W@macbook>
 <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
 <7a5da6ce-0ef0-4666-a5c4-44383469f67e@suse.com>
 <ZqC7Hn8R6Mkyqtpl@macbook>
 <4a1bae1e-16d2-4536-b69a-1fff8179ee86@suse.com>
 <ZqDFpLbGe_HmTrTF@macbook>
 <bda9b241-ce89-4e69-939a-e6e9d7259eb4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bda9b241-ce89-4e69-939a-e6e9d7259eb4@suse.com>

On Wed, Jul 24, 2024 at 11:16:52AM +0200, Jan Beulich wrote:
> On 24.07.2024 11:13, Roger Pau Monné wrote:
> > On Wed, Jul 24, 2024 at 10:41:43AM +0200, Jan Beulich wrote:
> >> On 24.07.2024 10:28, Roger Pau Monné wrote:
> >>> The only way I've found to cope with this is to use something like:
> >>>
> >>> #define ALT_CALL_ARG(arg, n)                                            \
> >>>     union {                                                             \
> >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
> >>>         unsigned long r;                                                \
> >>>     } a ## n ## __  = {                                                 \
> >>>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> >>>     };                                                                  \
> >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
> >>>         a ## n ## __.r
> >>>
> >>> An oversized array that ensures all the space of the long is covered
> >>> by the array, but then we need an extra variable, as we would
> >>> otherwise require modifying ALT_CALL{0..6}_OUT to use aX_.r instead of
> >>> aX_.
> >>
> >> I don't think we need to over-size the array. It just gets yet a little
> >> more complex then:
> >>
> >> #define ALT_CALL_ARG(arg, n)                                            \
> >>     register union {                                                    \
> >>         struct {                                                        \
> >>             typeof(arg) e;                                              \
> >>             char pad[sizeof(long) - sizeof(arg)];                       \
> >>         } s;                                                            \
> >>         unsigned long r;                                                \
> >>     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> >>         .s.e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); }) \
> >>     }
> > 
> > We could even simplify this, there's no need for the union anymore,
> > since struct size == sizeof(long) already:
> > 
> > #define ALT_CALL_ARG(arg, n)                                            \
> >     register struct {                                                   \
> >         typeof(arg) e;                                                  \
> >         char pad[sizeof(long) - sizeof(arg)];                           \
> >     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
> >         .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
> >     }
> > 
> > The above seems to work for both the original issue and the new one.
> 
> Oh, good. If the compiler's happy with not being dealt an unsigned long,
> even better. Maybe for consistency we want to use sizeof(void *) also in
> pad's definition then.

I have to test this on Gitlab, it seems to be fine with clang version
18.1.6, not sure about older releases.

I can switch to void *, that would be fine, will attempt to prepare a
followup patch.

Thanks, Roger.

