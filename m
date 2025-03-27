Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8AA72CBD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928839.1331493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjsw-0007df-Re; Thu, 27 Mar 2025 09:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928839.1331493; Thu, 27 Mar 2025 09:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjsw-0007by-OW; Thu, 27 Mar 2025 09:50:50 +0000
Received: by outflank-mailman (input) for mailman id 928839;
 Thu, 27 Mar 2025 09:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txjsv-0007PE-Hl
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:50:49 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5155b28-0af0-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 10:50:47 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22403cbb47fso17088465ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:50:47 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22780f39763sm125075565ad.10.2025.03.27.02.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 02:50:45 -0700 (PDT)
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
X-Inumbo-ID: f5155b28-0af0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743069046; x=1743673846; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62R4Thfwk/slnHCpPaDFFM5GYBbA/tG5qE0frhplIqA=;
        b=BJBR2Giy5nu5D+h6B3LnswKGow+xO7Y2KFguyQC/1XyBueiILLrhHtU3pd3TSP2slm
         YlPni62VWSLsIBO3BrI9EyT032OlLmuzTyIGfE9t7co0MJ9radJy3Wy78ChZelPOqjFx
         +MadKenW54vPING2SRUF4XvgQMjWTe17APyJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069046; x=1743673846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62R4Thfwk/slnHCpPaDFFM5GYBbA/tG5qE0frhplIqA=;
        b=eam695WDca+/KxzTMEy8Ldb1Nzvx9dffeGw0hNPomDo6tOmnMji8LJhJH58TauJ9e1
         I3lwJ9BrBH9uOquwEb5VF7aXpJoNYcHkXEd0kvVQwYm1qc+dai+yddw9XJBYzPpUVP6j
         hjSgvqgBBYVO/ta93f5FLIQlY4Sn44K25K5YLLBi84pbUWp4Pr03+10teHMNrM1HoE8g
         pUW7fTeXpql42ZLo4fGOQu+FSiL7tVWc3DLNY2yMhV8SBUDRu5TJ+0uYtjl7ZUuQBEX1
         ABH+94B9FfXNZEhkY5VD5byNtmbkuQ7c8Nyl9GphUjpuNwTBB3ccLNeNv1Lq2at964aB
         Rpdw==
X-Gm-Message-State: AOJu0Yy/pKQLbfhRJxSTW8UMsrTFEki8TYWNn1dO5e+5NCaVoXV7f2Yg
	mU5ics9x+vi3cjKcOoqQukXb5MJ2oU/xNjOMomopZNXFX5x7CgII0b1tD9LBjRE=
X-Gm-Gg: ASbGnctpZx883xiaXOUM0XNh0qHsSsp4KtZWgYo5ZhtNxvx3GRmMmcsI/REP0O/l3ku
	1hrOlHVLachDsfnME0rPrEPnGfcwRaga1oqSisT50cZ4y1pNmzmsSba9CSp2xMJXSQmhEWY4T6G
	5BaYfQ9Ya+DJlTTNdW9vpA9/2uAB7KYp2WpUPscwIOVdeqIPna1M1ooe+FUtxVOcj6NDPaC0QSk
	Ioyxd04UyUzzsIu7lJbiNhBnkYLPQk9NijFo2HvsjGZUIFveqzN9ozZCIqF47JQl8J1+jZyaxTI
	Uef5ljtm5OEE/Yud6m5TeAgC96zCG7rK0yvzDvrVMqPZD9AkUA==
X-Google-Smtp-Source: AGHT+IFGVTuNe0E6D2IFJmKpJ83MTUuUhBOIVsV2kv20NzcJSzXPdmOWuy6koKts0+vEk/ubT4vpBw==
X-Received: by 2002:a17:902:d4c5:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-22804874707mr53259835ad.24.1743069046039;
        Thu, 27 Mar 2025 02:50:46 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:50:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
Message-ID: <Z-UfcHfHys6c0HZb@macbook.local>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
 <Z-UKm6D9pmAEaE_9@macbook.local>
 <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>

On Thu, Mar 27, 2025 at 10:15:03AM +0100, Jan Beulich wrote:
> On 27.03.2025 09:21, Roger Pau Monné wrote:
> > On Tue, Mar 25, 2025 at 08:18:11AM +0100, Jan Beulich wrote:
> >> In particular if we're running virtualized, the underlying hypervisor
> >> (which may be another Xen) may not surface MTRRs, and offer PAT only.
> > 
> > At least for Xen, I think we offer MTRR uniformly, even on PVH
> > guests?
> 
> By default we do, but we discussed the option of offering PAT-only environments
> beyond leaving it open whether people disabling MTRR support in their guest
> config are outside of supported terrain.
> 
> >> Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > My main concern is whether the !mtrr path is still functional.  Have
> > you tried booting the resulting hypervisor with MTRR masked on CPUID?
> > 
> > (or alternatively short-circuiting cpu_has_mtrr == 0?)
> 
> I didn't think this would be a prereq here. If we boot in an environment truly
> lacking MTRR, we'll crash on the first MTRR MSR access - none of those accesses
> use the safe accessors.

Right, hopefully we don't have unprotected MTRR MSR accesses, so
cpu_has_mtrr == 0 should prevent those.

> Since you asked, I tried booting with "cpuid=no-mtrr".
> As I'm doing this on a system with console, all I can say is that it takes
> minutes to reach the point where we'd start setting up Dom0 (which itself then
> takes so long that I timed out waiting for it to make progress), due to all
> screen output becoming unbelievably slow after AP bringup. Surely something's
> screwed somewhere, as VRAM accesses being slow (or fast) shouldn't depend on AP
> bringup having completed. I actually suspect it's not just VRAM accesses which
> are slow, but that we're left running in uncachable mode altogether for whatever
> reason.
> 
> What this maybe useful for is to figure out the reason of "Platform timer
> appears to have unexpectedly wrapped <N> times", which I saw appear once.
> 
> Given this, I'm actually uncertain whether it is legitimate then to take your
> ack.

I think it might be best if we can figure out what causes those issues
(and possibly fix them) before taking this patch?

Albeit you could argue that running excruciatingly slow is better than
just crashing of an unhandled #GP from a rdmsr.

Thanks, Roger.

