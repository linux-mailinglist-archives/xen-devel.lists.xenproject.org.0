Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EDF9D2860
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840320.1256086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPQu-0007x4-2r; Tue, 19 Nov 2024 14:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840320.1256086; Tue, 19 Nov 2024 14:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPQt-0007u9-Vu; Tue, 19 Nov 2024 14:42:23 +0000
Received: by outflank-mailman (input) for mailman id 840320;
 Tue, 19 Nov 2024 14:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDPQs-0007sn-E5
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:42:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa61723-a684-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:42:19 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so189179366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:42:19 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df265bbsm656457166b.38.2024.11.19.06.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:42:18 -0800 (PST)
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
X-Inumbo-ID: 7aa61723-a684-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdhYTYxNzIzLWE2ODQtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI3MzM5LjcwODY2Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732027339; x=1732632139; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f389CgUQbnI3ljAJVhUSroeSUtVjEeFdvFsma6weh3c=;
        b=s7M7ehMxV6n8IjTIzYd5g0BXxHD3J7amIKCSpIrTwYbAg3seUpR1W0oTlSvzfeKxwu
         WSA1vjnJ7Kojpma/OPWhovjR4WbbC62JZm8Utukt00JTi1Bgc5k7jVo3iQo9y0gjS817
         2MR8KdEtzoivBIZZfRKbev6LBIYPfsF6EA9C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027339; x=1732632139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f389CgUQbnI3ljAJVhUSroeSUtVjEeFdvFsma6weh3c=;
        b=ErH9zTdgKa16qxTLe4ojxTmsWIG4OGKmjwT3wWMBq+v6o9OfvRiAgmXUGsVzfvrfYH
         u52lzd6OhoxZcC5m2vgEu9kKs8wCyeXA+vrknMouFPrxCliaEXBtQ5+pAQgmcAE7aehZ
         NoyebX4YPK+pKu1cs0GVKMPrzNmMPoXrRT1zcvmJMtpqqboQXQM9PkUoNYbyd+SJUESC
         i4V6R6GzjXOs7wmhaz4EeUgMsKzDUAAQtxVI0IPMpeEDtaQTHYOe1jYB+2eqaP/VKnjR
         hzVsB55hKA/23OMvhTx7bW8kV2ciXA9I1dJtkaIxRO/iGWMTVHgN0GdKjLS3iW5mREL+
         5Dsg==
X-Forwarded-Encrypted: i=1; AJvYcCUhc+AY5r2VkPowmCbVc+cRPjq7BHIWagiBWGMs2tkcDh1vImdTDF93od5xznvyrbP68fUAzsYVbQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS9hEdeGj6TIg1t7/ww36WgVMXECMR20AHHlQwnBVL7pByO5fY
	dnkNd/qGcuBrRK9gwq3zN8gHu0g1XV4vbhsTa8O9ain5v23/EXaTl9Et5p60qULOw2pKK0GClUj
	o
X-Google-Smtp-Source: AGHT+IFuhFVNPpwlcad7jfV9jV0WmiXhFFKZ/oSqDrsEIRaCRJ4uGwsBWHpJszp4cw2fqNkNSZtM5g==
X-Received: by 2002:a17:907:3f07:b0:a9d:e01e:ffa9 with SMTP id a640c23a62f3a-aa483482118mr1453777566b.33.1732027339172;
        Tue, 19 Nov 2024 06:42:19 -0800 (PST)
Date: Tue, 19 Nov 2024 15:42:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] x86/uaccess: rework user access speculative harden
 guards
Message-ID: <ZzyjyvxP0CmBJaD4@macbook>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-4-roger.pau@citrix.com>
 <f733e721-f9b8-4fef-8145-176ebcbdaa01@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f733e721-f9b8-4fef-8145-176ebcbdaa01@suse.com>

On Tue, Nov 19, 2024 at 03:29:58PM +0100, Jan Beulich wrote:
> On 19.11.2024 11:34, Roger Pau Monne wrote:
> > The current guards to select whether user accesses should be speculative
> > hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> > parenthesize the 'args' argument.
> > 
> > Change the logic so the guard is implemented inside the assembly block using
> > the .if assembly directive.
> 
> Hmm, interesting idea. I don't overly like emitting stuff to pre-processed
> and even assembly files, but doing so is probably warranted here. Nevertheless:
> Did we consider at all to deviate these macros instead?

I think the proposal is not overly ugly, as I would otherwise simply
suggest to deviate.  I'm assuming the preference is to attempt to fix
when possible rather than deviate.

> > --- a/xen/arch/x86/usercopy.c
> > +++ b/xen/arch/x86/usercopy.c
> > @@ -11,23 +11,23 @@
> >  #include <asm/uaccess.h>
> >  
> >  #ifndef GUARD
> > -# define GUARD UA_KEEP
> > +# define GUARD 1
> >  #endif
> 
> At least in cases like this one I think a comment is necessary, perhaps as
> terse as /* Keep */ (and /* Drop */ further down).

Right, can adjust if we agree this is the way forward.

Thanks, Roger.

