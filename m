Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94773767591
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 20:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571538.895624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPSLw-0006Sg-GA; Fri, 28 Jul 2023 18:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571538.895624; Fri, 28 Jul 2023 18:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPSLw-0006QS-Cg; Fri, 28 Jul 2023 18:38:16 +0000
Received: by outflank-mailman (input) for mailman id 571538;
 Fri, 28 Jul 2023 18:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4km=DO=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1qPSLu-0006QM-6W
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 18:38:14 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e80da097-2d75-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 20:38:13 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bbf8cb694aso354045ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 11:38:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 ix13-20020a170902f80d00b001b9d7c8f44dsm3907903plb.182.2023.07.28.11.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 11:38:11 -0700 (PDT)
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
X-Inumbo-ID: e80da097-2d75-11ee-b24e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690569491; x=1691174291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33rFVY7OX9UkeWBGFwT8EclqMxrl4R8dedNz9bKvxDQ=;
        b=By+5JMuD4M/lflc4z2fRv1vZzoxOUZYjHnQN4K1rkcJbvqH88LjT5IBYClmIAOanaS
         VYATJHuG9lgKZPivIIP6bJwMkVB6vPz1kXw2NHGNdapwyCGyNqIiIuT7eX6J88XUW0UB
         umgkL6WUPWkNC1tS98P9ChR7CE4/J/0ksMXiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690569491; x=1691174291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33rFVY7OX9UkeWBGFwT8EclqMxrl4R8dedNz9bKvxDQ=;
        b=Mq9OqnU0WsXVl+wr4ZfvHD0vtyq1pY0ibYkAAOjpnrHHOE7i0826vmo2aXNRCNV+mh
         rPqeWv/dzuUHoHrtlIzGrkW9Z1NF+AGYSJvc0UY6aCLn8XJWv65KcC0TQ0IqxPf5SmKH
         F+UYrV0UxGHhvOxy3qs4dOJG9FBuI1p0bYTotsMcyi7bMYDvtcfJokHFb2ce+1bcd2dj
         Isx/w0/IdsHkwvOWJ6HtRLcH69dvL+wR5bMYmiDPtpkckjh5RQHrc2zdPcpTSskES+aI
         DO7aqOZmkpvNej9IBZXcoaXIUft4eOZF0sWM7tHf0R9oy7wzxQmCSjtQuf5FFzFnX36p
         LWcQ==
X-Gm-Message-State: ABy/qLayuwtJwNJCp6ChjR6WbfxgMGjgcb/7pcvZEWE25UPXjqlFHVFM
	cVO/Uj3kMF4sh3L9k/Ouo1uYug==
X-Google-Smtp-Source: APBJJlGs+KiAjovc4Ff5bXdv+1247KNp4pAQW/e6jaoOH3v88JUN99m0BT5bc653vOVDiJeYTmDZgA==
X-Received: by 2002:a17:903:248:b0:1b9:cf52:2bcf with SMTP id j8-20020a170903024800b001b9cf522bcfmr2621118plh.0.1690569491651;
        Fri, 28 Jul 2023 11:38:11 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:38:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Justin Stitt <justinstitt@google.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: xen-front: refactor deprecated strncpy
Message-ID: <202307281133.16D4305@keescook>
References: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
 <ZMNILDgqHEGf8fNF@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMNILDgqHEGf8fNF@mattapan.m5p.com>

On Thu, Jul 27, 2023 at 09:46:36PM -0700, Elliott Mitchell wrote:
> On Thu, Jul 27, 2023 at 09:53:24PM +0000, Justin Stitt wrote:
> > Technically, my patch yields subtly different behavior. The original
> > implementation with `strncpy` would fill the entire destination buffer
> > with null bytes [3] while `strscpy` will leave the junk, uninitialized
> > bytes trailing after the _mandatory_ NUL-termination. So, if somehow
> > `pcm->name` or `card->driver/shortname/longname` require this
> > NUL-padding behavior then `strscpy_pad` should be used. My
> > interpretation, though, is that the aforementioned fields are just fine
> > as NUL-terminated strings. Please correct my assumptions if needed and
> > I'll send in a v2.
> 
> "uninitialized bytes" => "leak of sensitive information" => "security hole"

For xen_snd_front_alsa_init(), "card" is already zero-initialized in
snd_card_new().

For new_pcm_instance(), "pcm" is already zero-initialized in
_snd_pcm_new().

So things look good to me!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

