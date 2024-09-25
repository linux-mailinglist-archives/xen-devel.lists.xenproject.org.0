Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69C9854D6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803519.1214104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stMwE-0004fM-PB; Wed, 25 Sep 2024 07:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803519.1214104; Wed, 25 Sep 2024 07:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stMwE-0004cd-MG; Wed, 25 Sep 2024 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 803519;
 Wed, 25 Sep 2024 07:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stMwD-0004YF-3N
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 07:59:53 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251b5c92-7b14-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 09:59:52 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cde6b5094so59938955e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 00:59:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a54fdesm10272925e9.41.2024.09.25.00.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 00:59:51 -0700 (PDT)
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
X-Inumbo-ID: 251b5c92-7b14-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727251192; x=1727855992; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT8gajalcWoIx52Tt+BD1fi2pNb51KAl4LnmNHruT+k=;
        b=vXru/yvmsnt9Viy5K/WofkZK7l93ppg2aqpjvwUrcnscfExe4Z+0zpKdqjUKkcsY23
         RFooRW6TFZhIc9h6u/pZymdV9zQ+pAOu7O0QWMlK4pChKXSZo9dw25K8f1VVeJ8Em0eR
         fQFSi1o4Lx79D5OMbV7AVeT6qLZtwl7cpuz1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251192; x=1727855992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT8gajalcWoIx52Tt+BD1fi2pNb51KAl4LnmNHruT+k=;
        b=nzeFPAFXkcit9lz9oWD6q3OqoDFIICRq/Sr5rZ8auSjLqpd3xMWzyYIOm/W6qXYoPn
         npmLseeUMfpxfIeZOwb6+1rL+Y3oDuC7noGRv5byEthEWRr2pFsCqu9JRJsLXED4tSL9
         oe4bwlOO6ypUpX/gDf2Nu+kE9ijYvnL1NkuFY14Fef7kU7kxVeGx8tOAqMzuWYCX6Enl
         +eq284Qkl4KkSCkjBjGOnhz1lnHmC4Z8WfaofdQaT2Ofr/X8C7uQNFlbzhILCASqBeQk
         GZiL3saRitdJjYAIOgJGv7UwNI9JYR9YTq/sDU9eAKLbbGe1F913olLc6tnyIbAVUuyC
         abYw==
X-Forwarded-Encrypted: i=1; AJvYcCXuo3D9BAkkbUZWypYXlurLpJlqQwWjToek5dqz5mDwBCaIboOVjJnvdzmXyGcy+mP1mBkgOdRqhhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlPpvcfhpBaZFI2/LBKxJhnb4gpCdLKxD7dHyd6YEaBSoiO5pS
	Jj3Kqf8l4Hx6xVj7QxAez1OpsSm3+5NcTDgMHQiKWOIZghDA+rDm5aHth/Qw2lI=
X-Google-Smtp-Source: AGHT+IFmuNNyoCI7JSGO7T9q+hfr+JSbOmAcwLVc898CYuBNGTwg/nMtJmis5HhU9xyKE57iNkXVdg==
X-Received: by 2002:a05:600c:5106:b0:428:e866:3933 with SMTP id 5b1f17b1804b1-42e961469edmr12552915e9.22.1727251191878;
        Wed, 25 Sep 2024 00:59:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:59:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Barnes <matthew.barnes@cloud.com>
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
Message-ID: <ZvPC9tnqA6ui3YWb@macbook.local>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
 <ZvLWSEwbdL1kpvC6@macbook.local>
 <4b7a2b84-5c5d-40e2-b20e-5c011eac7b4a@citrix.com>
 <ZvLlYp0L3Ac2O_uG@macbook.local>
 <d77b1df7-5b05-4d54-b66e-ed90a296c091@suse.com>
 <ZvLyaSqZegiPyv6B@macbook.local>
 <22a3542c-7eb4-41fe-8c60-d9a71bd9fa4f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22a3542c-7eb4-41fe-8c60-d9a71bd9fa4f@citrix.com>

On Tue, Sep 24, 2024 at 07:20:44PM +0100, Andrew Cooper wrote:
> On 24/09/2024 6:10 pm, Roger Pau Monné wrote:
> > On Tue, Sep 24, 2024 at 06:21:47PM +0200, Jan Beulich wrote:
> >> On 24.09.2024 18:14, Roger Pau Monné wrote:
> >>> On Tue, Sep 24, 2024 at 04:27:36PM +0100, Andrew Cooper wrote:
> >>>> On 24/09/2024 4:10 pm, Roger Pau Monné wrote:
> >>>>> On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
> >>>>>> With the introduction of mixed x2APIC mode (using cluster addressing for
> >>>>>> IPIs and physical for external interrupts) the use of pure cluster mode
> >>>>>> doesn't have any benefit.
> >>>>>>
> >>>>>> Remove the mode itself, leaving only the code required for logical
> >>>>>> addressing when sending IPIs.
> >>>>>>
> >>>>>> Implements: https://gitlab.com/xen-project/xen/-/issues/189
> >>>> We use the Resolves: tag for this.  Can fix on commit.
> >>>>
> >>>>> There's at least one extra bit which I would also like to see removed,
> >>>>> either in this patch, or as following patch.
> >>>>>
> >>>>> In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
> >>>>> pending_mask.  After dropping cluster mode for external interrupts,
> >>>>> those fields could become integers AFACT, as now interrupts can only
> >>>>> target a single CPU opposed to a logical CPU set.
> >>>> A separate patch for sure, but that sounds like a great improvement.
> >>> Oh, there are quite some fields of struct genapic that are not needed
> >>> anymore, since both implementations set it to the same function.  It
> >>> would be helpful to prune them.
> >> Pruning where possible - yes. But "both" won't cover it, as we have 4
> >> instances of the struct (not just the two x2apic ones).
> > Yeah, realized that afterwards, we still have the xAPIC flat mode,
> > which is using logical delivery mode, but target a single CPU.  So
> > getting rid of the cpumask in arch_irq_desc seem possible, however
> > there might be nothing to prune in struct genapic.
> 
> Logical delivery mode for external interrupts in xAPIC is just as
> broken/useless as the code we've just deleted.
> 
> If that's the only thing in the way of more cleanup, we delete it too.

Bah, xAPIC flat delivery mode needs to be adjusted to use physical
delivery for external interrupts, as the vector space is shared
between all CPUs in that mode.  This must be done ahead of turning the
arch_irq_desc cpumasks into integers.

Sorry, this is turning into a more work that I originally expected,
mostly because I wasn't taking into account that xAPIC was still using
logical mode for external interrupts.

Thanks, Roger.

