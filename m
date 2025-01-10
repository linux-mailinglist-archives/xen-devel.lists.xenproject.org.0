Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E3A093F9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869753.1281217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGGm-00067Q-QJ; Fri, 10 Jan 2025 14:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869753.1281217; Fri, 10 Jan 2025 14:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGGm-00064Q-Mx; Fri, 10 Jan 2025 14:45:52 +0000
Received: by outflank-mailman (input) for mailman id 869753;
 Fri, 10 Jan 2025 14:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWGGl-00064J-Qw
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:45:51 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96195ccd-cf61-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:45:51 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso3575611a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:45:51 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c3039sm1779610a12.40.2025.01.10.06.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:45:47 -0800 (PST)
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
X-Inumbo-ID: 96195ccd-cf61-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736520350; x=1737125150; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYThS8R1KInT4Ntvc/a1r1aZWXtnO76bugL1FsedsPY=;
        b=cZMPa07ofvWhlgoNqZQYESKh0uEGPlt2RKXJHXdVr7FHqcA5jFSU6l8Nu78xghQWYL
         gRLRakFjHcaBr0ET2Qb0Yz3XX5BONyLsTJ6HU32A8kfyPgbYxoSGjw+KaFT4psTCQALw
         3sGyitHb6094X4hVq+2XO0lBBHitOA3WskM6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736520350; x=1737125150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYThS8R1KInT4Ntvc/a1r1aZWXtnO76bugL1FsedsPY=;
        b=Pk5XNNYnWXpDvuHLjG036qF872RyqFdbdHTA9R3uDaJINoPtBtaH9erLeF45f5CGO1
         lBFsyOvNphrcZbHDOsOCMgyRvGUj1V48HEuw8WUUXtXxR8t0b4z2OgPJQCzBKI7ik6+g
         kefYQNrpjNVcTohQsHcavyUOzU55QdYa3b1umHyBnggPGkukSC16rB+dQzQ93Xiooca6
         PLvNxztd9nDF+VKRYvww1OuaxtTzeS7CsTmva6Qb8mxNeUdu7kZP5c0/gEbwUuFXIDcA
         JwQm6H1oVddGHgC16Pnk1OARbEa1JOfXQivza9TvaIOi2m7+//gwdwjiEm/K54g3Hsht
         5+VA==
X-Gm-Message-State: AOJu0Ywmwv0TTRVNXWo4/Ms0q/RuhTRe53a7JgBagsG8v0QBXCjx107A
	/Qd6wtTy9YGvIm7hZQU7jAyuIXJ0MY2hKvaeJnnGJyMLsm+Qu67+Km40EtQCPaMfK2mDVeRuN6o
	U
X-Gm-Gg: ASbGncsmRdLk+6wkKQCvdJ30hkFpwlbZegDa3AVaduC8B9EPEVBCIMwMkKfqCa9Vt8Y
	IcKAri3FZvqvIVhZtEXb+FTiSh/NzP5K2rKMO53CDfByRRGVrNyE4SNsQZLl2fzpBMxuD2znOrb
	SBGjKXU+Ekl0dk0rQ1+gWHPfJPPOWQasWgviO0pw9DZMunItZ8gRPGfxsTQJ08nSs0oK2DmBUyh
	ks71SjF+bmmjDYdEvAPelHSEHpmaR5fiRTrjKK6vGiqm4qPcoVM8RkMpKqJoRoKIVo=
X-Google-Smtp-Source: AGHT+IFHxPu4BiMuNaXHUAetfAgdv9GoM7Qqq/0d4mQq9WDzGUoWk4GhX6amjW9I3bhg8D8oMqLaDg==
X-Received: by 2002:a05:6402:4414:b0:5d9:a84:d4b6 with SMTP id 4fb4d7f45d1cf-5d972d26ac2mr8951480a12.0.1736520350519;
        Fri, 10 Jan 2025 06:45:50 -0800 (PST)
Date: Fri, 10 Jan 2025 15:45:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 09/18] x86/mm: simplify create_perdomain_mapping()
 interface
Message-ID: <Z4EymsQaGq_cJiPP@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-10-roger.pau@citrix.com>
 <D6XHOJ01P6HV.2IGS7W4SGN07@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D6XHOJ01P6HV.2IGS7W4SGN07@cloud.com>

On Thu, Jan 09, 2025 at 11:01:00AM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> > index 65cd751087dc..0c57442c9593 100644
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -601,8 +601,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> >  #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
> 
> Shouldn't IS_NIL() and NIL (out of context) be removed too?

Indeed, yet more cleanup, thanks!

Roger.

