Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F9F8D3A75
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732160.1138022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCL1F-0007ud-Fb; Wed, 29 May 2024 15:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732160.1138022; Wed, 29 May 2024 15:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCL1F-0007sE-Cq; Wed, 29 May 2024 15:15:13 +0000
Received: by outflank-mailman (input) for mailman id 732160;
 Wed, 29 May 2024 15:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCL1D-0007s8-Ga
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:15:11 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c668b34-1dce-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 17:15:08 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-421124a0b37so12366655e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:15:08 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089667fbsm183477005e9.9.2024.05.29.08.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:15:07 -0700 (PDT)
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
X-Inumbo-ID: 3c668b34-1dce-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716995708; x=1717600508; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSy0T2PouEWbwJsRaQlmCKlqzvnnh2V+hB726PPoFjE=;
        b=KfHlz280EFp682AZJ/t6X1lLgr1z28TGSoLAf3KZKieYHBwrKzj9AgJNvcfVfG4yK4
         PR512bOlbC763GsmSGty/tQM3ANfQGk9MQ6E2Kzuc3WgmQWkfKEITFJck0P31Ac2OdEK
         6l20rTdMic6JWWs2w9P+0NeugtoANBoIrY2mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995708; x=1717600508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSy0T2PouEWbwJsRaQlmCKlqzvnnh2V+hB726PPoFjE=;
        b=OMTskQY2/WfXvhjFFI9Sr9/irpOmzk6S86yk8e+aeqOMWcZ/AlAl4frirNKy8JPuTS
         Q7vn5GCP8r8mRyAwRcslPIpTiRc7SyLNBFks61qBuuY4/VZcNXD6mF85OmOf+eWZLjY7
         xk3boxfPqkXDAOzldRAC/lwsySeoJgNBehM96CD2J96+J16w3LLNcUi8l/Jq/evY7/OB
         uzUtThC+qusd4GhxRnZ1Cx1MgpUDzTfk2+sw0bXux33p+QdEYj8UeV7ENljux7p+bYlQ
         DCDfldDP83H3zscpCM7O5xotld6PIN55Cz67RNok2x3g45K1JRff1SL8y9XVzTCOB8Qa
         utKA==
X-Forwarded-Encrypted: i=1; AJvYcCVatwLLsjnG0c+t/vHem9GI7ojKTUZhVY040HoudKEVa1mvIcHvdGQtLwnEta9rJTRvGlqee3xxxGdpCm1qRnmPM4Y+pWJbMFkggv8NBJk=
X-Gm-Message-State: AOJu0YwvM+mBCSe96srhMW+N52zNp9rGUhQAPB39MfxxfF9WNkounXqa
	l7hYJ9jP813qughANSO/kAOIGocjnlljLqrs8dWWSsG6Tr38AAwvrjk958tg6R8=
X-Google-Smtp-Source: AGHT+IGp5hmAE9khhn1k4Gr5pKrXNFzd8/UjnwMq9U1HbYZP8O5xtRk1YqUCLHmZ/LMfaOh+uppQ6Q==
X-Received: by 2002:a7b:cc96:0:b0:41b:9e4f:d2b2 with SMTP id 5b1f17b1804b1-421089d50c1mr152042025e9.2.1716995708119;
        Wed, 29 May 2024 08:15:08 -0700 (PDT)
Date: Wed, 29 May 2024 17:15:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 1/9] x86/irq: remove offline CPUs from old CPU
 mask when adjusting move_cleanup_count
Message-ID: <ZldGe6z70R0CD32Z@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-2-roger.pau@citrix.com>
 <0a2f1f9a-fab1-409c-96f8-399b19077f12@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2f1f9a-fab1-409c-96f8-399b19077f12@suse.com>

On Wed, May 29, 2024 at 02:40:51PM +0200, Jan Beulich wrote:
> On 29.05.2024 11:01, Roger Pau Monne wrote:
> > When adjusting move_cleanup_count to account for CPUs that are offline also
> > adjust old_cpu_mask, otherwise further calls to fixup_irqs() could subtract
> > those again creating and create an imbalance in move_cleanup_count.
> 
> I'm in trouble with "creating"; I can't seem to be able to guess what you may
> have meant.

Oh, sorry, that's a typo.

I was meaning to point out that not removing the already subtracted
CPUs from the mask can lead to further calls to fixup_irqs()
subtracting them again and move_cleanup_count possibly underflowing.

Would you prefer to write it as:

"... could subtract those again and possibly underflow move_cleanup_count."

> > Fixes: 472e0b74c5c4 ('x86/IRQ: deal with move cleanup count state in fixup_irqs()')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> With the above clarified (adjustment can be done while committing)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -2572,6 +2572,14 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >              desc->arch.move_cleanup_count -= cpumask_weight(affinity);
> >              if ( !desc->arch.move_cleanup_count )
> >                  release_old_vec(desc);
> > +            else
> > +                /*
> > +                 * Adjust old_cpu_mask to account for the offline CPUs,
> > +                 * otherwise further calls to fixup_irqs() could subtract those
> > +                 * again and possibly underflow the counter.
> > +                 */
> > +                cpumask_and(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
> > +                            &cpu_online_map);
> >          }
> 
> While functionality-wise okay, imo it would be slightly better to use
> "affinity" here as well, so that even without looking at context beyond
> what's shown here there is a direct connection to the cpumask_weight()
> call. I.e.
> 
>                 cpumask_andnot(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
>                                affinity);
> 
> Thoughts?

It was more straightforward for me to reason that removing the offline
CPUs is OK, but I can see that you might prefer to use 'affinity',
because that's the weight that's subtracted from move_cleanup_count.
Using either should lead to the same result if my understanding is
correct.

Thanks, Roger.

