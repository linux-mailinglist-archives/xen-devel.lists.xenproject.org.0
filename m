Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21D9D2B13
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 17:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840695.1256191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDRCt-0006MX-5A; Tue, 19 Nov 2024 16:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840695.1256191; Tue, 19 Nov 2024 16:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDRCt-0006Jd-2C; Tue, 19 Nov 2024 16:36:03 +0000
Received: by outflank-mailman (input) for mailman id 840695;
 Tue, 19 Nov 2024 16:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDRCr-0006JX-8z
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 16:36:01 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a3b59ed-a694-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 17:35:57 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so5696288e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 08:35:57 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df50a97sm674638866b.61.2024.11.19.08.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 08:35:56 -0800 (PST)
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
X-Inumbo-ID: 5a3b59ed-a694-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVhM2I1OWVkLWE2OTQtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDM0MTU3LjI0MjE1NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732034156; x=1732638956; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysVWFhommthHijw5t3FYm9q+ziPEYzY7OHekTeCaiv0=;
        b=rhuHvDVP9rWEjyXp368u8oHudxSgzNNo1KI8HqndWDCwUz0kg96hxiR5/v8lowe3L9
         Sk/ajfx58j/SDVgXSzdEfP5JKVv68nN+DqcC1gARGwZFHvFB1VN0MZAnS20i0TZNX0eA
         Yx0uJF6btfmmWcUGzB1YIAnZzNuZtkIJBeO2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732034156; x=1732638956;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysVWFhommthHijw5t3FYm9q+ziPEYzY7OHekTeCaiv0=;
        b=Wf+aTFYXu0eEsZYenuskOcltuerwijeDix0Jr8kQ359KoQemKL4FjinWh0FJCzhQzG
         zGhYlKxRcq7VWexFsZj5x4VzV74D+qBSVLtPr7gD6If20oOf6vBln6Wnzd/kebb+Ola8
         DShGI/1quDFbAajUXXbbDudMWpsJJYqHqXBTzXLiS5hTlJN6PO7IfhSNPsf8w+J3iQeP
         S8N48/693Y+bVzkCjWwsA9fqaoaTDMQJy+kR+NUEORa1V3E28OwAU0wTEhEMMhlspqBz
         JmwZ8yHHkzNmDKUfoFVKwpYRdBliE+9tNpr6anafJpgWsHWoIqGDUxYuE7jQcr/9BsP0
         YXWw==
X-Gm-Message-State: AOJu0Yz5reQuc8/m44IN+2B7phbnsDCkH54wCSpmNYIpA6EAPMVVlCUt
	o/r3c6C1EJ1K8kMPtMz2vq392urYiEwNrakj9JM6NFjZbhRlDfVxRHi3UWqvvQVH210/UEGbDWK
	A
X-Google-Smtp-Source: AGHT+IFPwEOQKRAnrMVjoNlDR94BbHP/tZRXL1e3y/Q9yLIMbdElQj1HP6QNRsq39nu9mlTyV3HLWg==
X-Received: by 2002:a05:6512:b1e:b0:53d:a504:9334 with SMTP id 2adb3069b0e04-53dab3b1718mr9326493e87.44.1732034156547;
        Tue, 19 Nov 2024 08:35:56 -0800 (PST)
Date: Tue, 19 Nov 2024 17:35:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 3/4] x86/uaccess: rework user access speculative harden
 guards
Message-ID: <Zzy-az2gE2PP3zSD@macbook>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-4-roger.pau@citrix.com>
 <9cf6ea3e-b6b5-4fc8-a0f1-53c1b2f7ab31@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cf6ea3e-b6b5-4fc8-a0f1-53c1b2f7ab31@citrix.com>

On Tue, Nov 19, 2024 at 03:31:34PM +0000, Andrew Cooper wrote:
> On 19/11/2024 10:34 am, Roger Pau Monne wrote:
> > The current guards to select whether user accesses should be speculative
> > hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> > parenthesize the 'args' argument.
> >
> > Change the logic so the guard is implemented inside the assembly block using
> > the .if assembly directive.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > The guard check could be moved inside of the guest_access_mask_ptr macro, but
> > given it's limited usages it's clearer to keep the check in the callers IMO.
> 
> Overall this is far more legible, and I'm tempted to take it on that
> justification alone.  But this is Jan's pile of magic.
> 
> There is a weird effect from this change:
> 
> add/remove: 2/0 grow/shrink: 2/2 up/down: 740/-739 (1)
> Function                                     old     new   delta
> build_symbol_table                             -     686    +686
> build_symbol_table.cold                        -      48     +48
> pv_map_ldt_shadow_page                       641     644      +3
> pv_emulate_gate_op                          2919    2922      +3
> livepatch_op.cold                            557     509     -48
> livepatch_op                                5952    5261    -691

So build_symbol_table() is no longer inlined in load_payload_data()
and thus livepatch_op().

> which is clearly changing inlining decisions.  I suspect it's related to...
> 
> > diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
> > index 7ab2009efe4c..d66beecc5507 100644
> > --- a/xen/arch/x86/usercopy.c
> > +++ b/xen/arch/x86/usercopy.c
> > @@ -11,23 +11,23 @@
> >  #include <asm/uaccess.h>
> >  
> >  #ifndef GUARD
> > -# define GUARD UA_KEEP
> > +# define GUARD 1
> >  #endif
> >  
> >  unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
> >  {
> > -    GUARD(unsigned dummy);
> > +    unsigned __maybe_unused dummy;
> 
> ... this.  This doesn't need to be __maybe_unused, because ...

This is a leftover from when I attempted to use preprocessor #if GUARD
below, and the compiler would then complain about dummy being
unused.

I can fix if there's agreement on the basis of the change.

> >  
> >      stac();
> >      asm volatile (
> > -        GUARD(
> > +        ".if " STR(GUARD) "\n"
> >          "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
> > -        )
> > +        ".endif\n"
> >          "1:  rep movsb\n"
> >          "2:\n"
> >          _ASM_EXTABLE(1b, 2b)
> > -        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
> > -          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
> > +        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
> > +          [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy)
> 
> ... these parameters are referenced unconditionally.
> 
> However, it does mean the compiler is spilling the scratch registers
> even when guard is 0.  I expect this is what is affecting the inlining
> decisions.

That's my understanding yes, the registers will be spilled.

Thanks, Roger.

