Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBD8D3AD5
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732183.1138064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLDl-0004Iq-Bs; Wed, 29 May 2024 15:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732183.1138064; Wed, 29 May 2024 15:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLDl-0004G5-8U; Wed, 29 May 2024 15:28:09 +0000
Received: by outflank-mailman (input) for mailman id 732183;
 Wed, 29 May 2024 15:28:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCLDj-0003h9-Be
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:28:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b5b4007-1dd0-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 17:28:05 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42108856c33so513935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:28:05 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7dd8esm15013488f8f.10.2024.05.29.08.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:28:04 -0700 (PDT)
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
X-Inumbo-ID: 0b5b4007-1dd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716996485; x=1717601285; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgf6iO5UWB16AaiuEruVh71mcKykYduHrqyGEP27qgQ=;
        b=ek65V3zFx2r5cRVE2J4nOwj1we8yvi9PsYOg+0U4lhf24r50DSNWqeywzPoL5ZX4x4
         1AW71XMZaLOhTxUOMb0AZhu/gLiCe+k48StontqdwF6Kv3d4II9ZK77+QAi4XdzB++4t
         i9wwykdTWVYM4qrZ/6sUCe9OB1w6XFOs2lmYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996485; x=1717601285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgf6iO5UWB16AaiuEruVh71mcKykYduHrqyGEP27qgQ=;
        b=gI3IJN+xZoa6eDOUNVqaC5zXzZSWL9IiSay/4hOQlPzptnEMVwnk5yCjHsNdSpkTbO
         MZnz2Zic5wnqRt1H2RRkN4ZZnuDR/aaBaQPQvduI+YYb+8kIkBlPULTVSCkVcCIKeFuz
         QzNO2qTcPWMxIlbRzTkJFm+XFRS4q36zYeoXcNP30B51lwj4STySmBuY2tPGuWoLFXU+
         FSL/D6/VeYdITtC4zsl50J04kh6b+0vsHRmfQksh9YWOINxKbOdXZcQw3muvVGRYoZPb
         Ilb9nKh5HpFPe8MikUhFecykRtWTKaZseyWGmme+I3M2nhsO3Ctwu8Ef+z7yWDYIVcZs
         EgwA==
X-Forwarded-Encrypted: i=1; AJvYcCURyZcuMnAcSOJjoK0oBmUv1Qs4h5BgyFosdqJ4JWcSAw9RacjEszXhIJv/DJcChZxyCQ3ceRgGfiTFEgMTNnRPzrcG+Mv6aEUMFhZQfxk=
X-Gm-Message-State: AOJu0Yxh/fNmPCtWv0rMmXhB7g5Fbe4Y1Ax05TwxSvts5O2IGsI+12oV
	yvfQgaz/TnyUDVxpAYigg4wo8i2VTlOjyxCGEs65i7+Lo6Hz5sd2SYsZLg4eE1A=
X-Google-Smtp-Source: AGHT+IGRV4rt6jmRJeV7HWcXdePj5WDRmBcz9L5WQ9WZM+MdBl9XEb/Dxss5ZvWRyOfE6pH9kTlGpQ==
X-Received: by 2002:a05:600c:3548:b0:41f:c5c5:c9df with SMTP id 5b1f17b1804b1-42122b00e42mr24253635e9.14.1716996484837;
        Wed, 29 May 2024 08:28:04 -0700 (PDT)
Date: Wed, 29 May 2024 17:28:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 4/9] x86/irq: describe how the interrupt CPU
 movement works
Message-ID: <ZldJgwu2nDGv2HJP@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-5-roger.pau@citrix.com>
 <24201381-2a43-427e-a3e5-1de316d212b8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24201381-2a43-427e-a3e5-1de316d212b8@suse.com>

On Wed, May 29, 2024 at 03:57:19PM +0200, Jan Beulich wrote:
> On 29.05.2024 11:01, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/irq.h
> > +++ b/xen/arch/x86/include/asm/irq.h
> > @@ -28,6 +28,32 @@ typedef struct {
> >  
> >  struct irq_desc;
> >  
> > +/*
> > + * Xen logic for moving interrupts around CPUs allows manipulating interrupts
> > + * that target remote CPUs.  The logic to move an interrupt from CPU(s) is as
> > + * follows:
> > + *
> > + * 1. cpu_mask and vector is copied to old_cpu_mask and old_vector.
> > + * 2. New cpu_mask and vector are set, vector is setup at the new destination.
> > + * 3. move_in_progress is set.
> > + * 4. Interrupt source is updated to target new CPU and vector.
> > + * 5. Interrupts arriving at old_cpu_mask are processed normally.
> > + * 6. When an interrupt is delivered at the new destination (cpu_mask) as part
> > + *    of acking the interrupt move_in_progress is cleared and move_cleanup_count
> 
> Nit: A comma after "interrupt" may help reading.
> 
> > + *    is set to the weight of online CPUs in old_cpu_mask.
> > + *    IRQ_MOVE_CLEANUP_VECTOR is sent to all CPUs in old_cpu_mask.
> 
> These last two steps aren't precise enough, compared to what the code does.
> old_cpu_mask is first reduced to online CPUs therein. If the result is non-
> empty, what you describe is done. If, however, the result is empty, the
> vector is released right away (this code may be there just in case, but I
> think it shouldn't be omitted here).

I've left that out because I got the impression it made the text more
complex to follow (with the extra branch) for no real benefit, but I'm
happy to attempt to add it.

> 
> > + * 7. When receiving IRQ_MOVE_CLEANUP_VECTOR CPUs in old_cpu_mask clean the
> > + *    vector entry and decrease the count in move_cleanup_count.  The CPU that
> > + *    sets move_cleanup_count to 0 releases the vector.
> > + *
> > + * Note that when interrupt movement (either move_in_progress or
> > + * move_cleanup_count set) is in progress it's not possible to move the
> > + * interrupt to yet a different CPU.
> > + *
> > + * By keeping the vector in the old CPU(s) configured until the interrupt is
> > + * acked on the new destination Xen allows draining any pending interrupts at
> > + * the old destinations.
> > + */
> >  struct arch_irq_desc {
> >          s16 vector;                  /* vector itself is only 8 bits, */
> >          s16 old_vector;              /* but we use -1 for unassigned  */
> 
> I take it that it is not a goal to (also) describe under what conditions
> an IRQ move may actually be initiated (IRQ_MOVE_PENDING)? I ask not the
> least because the 2nd from last paragraph lightly touches that area.

Right, I was mostly focused on moves (forcefully) initiated from
fixup_irqs(), which is different from the opportunistic affinity
changes signaled by IRQ_MOVE_PENDING.

Not sure whether I want to mention this ahead of the list in a
paragraph, or just add it as a step.  Do you have any preference?

Thanks, Roger.

