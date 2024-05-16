Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2523D8C7A46
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723531.1128475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dtf-0007eB-TI; Thu, 16 May 2024 16:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723531.1128475; Thu, 16 May 2024 16:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dtf-0007cf-QD; Thu, 16 May 2024 16:23:59 +0000
Received: by outflank-mailman (input) for mailman id 723531;
 Thu, 16 May 2024 16:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7dte-0007cW-DQ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:23:58 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1986313-13a0-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 18:23:57 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-43e415ae282so2494881cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:23:57 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54d866csm98141201cf.26.2024.05.16.09.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 09:23:55 -0700 (PDT)
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
X-Inumbo-ID: b1986313-13a0-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715876636; x=1716481436; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uy4zgb499BsINYGIPPQXmZMX26VnMsPc9ouE/cxZoHw=;
        b=h563zotVsxFm+RsvXA2QJrCkrTV14MJ6QRulxWumfwcOiMB+jNdX0XawFxZUCHwKj2
         G8TqRioOvRy37iDPl218vKMfDY9I9sDeZ27jtbuWG1F1a7mWUFUaIL2rWGN5C0X6g5bu
         84Ywi5X4j8KIoKwMu0Aa4CucmZtGzV9MGtDTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876636; x=1716481436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uy4zgb499BsINYGIPPQXmZMX26VnMsPc9ouE/cxZoHw=;
        b=KiyPgwqfcwbtuOxnlj4voIr1L5CAygVvyKe0VPOrmCXvFun8fDvlqAOxwQEGrtMIh0
         5zdbk4Vz8qSdOdImLOieR9iLIAEs2PaUb/Bl4XshCxIthRRnQGqzsiDczM7sC8WKTaHq
         evr8lHyOtKYXS2uFs6O19JWLsFk+/nfAOVq16FOHfKlDO1m5OTTuh0zU+RHckFensGSH
         5CQ2wMDZeNURP/fkqdWVTqWwJijxDdjkM7yJm67tX2hRFVHa1Byas5L0nvg859Z2n3HX
         I6PGSxopOUmtyh57fslHYyfoe23pVzbL5nv7RXW8bFLR2iIswIuVn5vORnCUe14vektl
         aZRg==
X-Forwarded-Encrypted: i=1; AJvYcCW5Dm6t6b+kqDvndet5gROCRYluHZQrh4S0IyKbvuF8MF7S2mYDvMJIAKqJCu23DGSz++7+sDx5z6YR5EpAFpf2U0tysigOeDPIT1GDcug=
X-Gm-Message-State: AOJu0YxRNuhpfWF5jS9eIqcxjJMyDnqjFPqoXMhvf+G4+WaRTx8mjV2I
	CJVz1erxQsYPAauiW+7lB7EexhpyLAb3x076iTUJ3iCqm8LlS50d4sNruyhkTsEYgzWvWcEsV8E
	H
X-Google-Smtp-Source: AGHT+IH44hfJDMCo7AaENTgWo/BQ/QhwUJT4IJP/V0BW6/yIKuD8H9VuEfw/SpYXEwS6GWz4IvBF1Q==
X-Received: by 2002:ac8:5fcd:0:b0:43b:a7c:3ee2 with SMTP id d75a77b69052e-43dfda8ceeamr260019421cf.11.1715876636074;
        Thu, 16 May 2024 09:23:56 -0700 (PDT)
Date: Thu, 16 May 2024 18:23:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19] xen/x86: limit interrupt movement done by
 fixup_irqs()
Message-ID: <ZkYzGZ3tDg9dRbnF@macbook>
References: <20240516132224.86005-1-roger.pau@citrix.com>
 <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com>
 <ZkYstvGkdffWMn2z@macbook>
 <b77790c6-a5b5-40d9-9387-5101ace14a4c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b77790c6-a5b5-40d9-9387-5101ace14a4c@suse.com>

On Thu, May 16, 2024 at 06:04:22PM +0200, Jan Beulich wrote:
> On 16.05.2024 17:56, Roger Pau Monné wrote:
> > On Thu, May 16, 2024 at 05:00:54PM +0200, Jan Beulich wrote:
> >> On 16.05.2024 15:22, Roger Pau Monne wrote:
> >>> @@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >>>                  release_old_vec(desc);
> >>>          }
> >>>  
> >>> -        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
> >>> +        /*
> >>> +         * Avoid shuffling the interrupt around if it's assigned to a CPU set
> >>> +         * that's all covered by the requested affinity mask.
> >>> +         */
> >>> +        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
> >>> +        if ( !desc->action || cpumask_subset(affinity, mask) )
> >>>          {
> >>>              spin_unlock(&desc->lock);
> >>>              continue;
> >>[...]
> >> In
> >> which case cpumask_subset() is going to always return true with your
> >> change in place, if I'm not mistaken. That seems to make your change
> >> questionable. Yet with that I guess I'm overlooking something.)
> > 
> > I might we wrong, but I think you are missing that the to be offlined
> > CPU has been removed from cpu_online_map by the time it gets passed
> > to fixup_irqs().
> 
> Just on this part (I'll need to take more time to reply to other parts):
> No, I've specifically paid attention to that fact. Yet for this particular
> observation of mine is doesn't matter. If mask == &cpu_online_map, then
> no matter what is in cpu_online_map
> 
>         cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
> 
> will mask things down to a subset of cpu_online_map, and hence
> 
>         if ( !desc->action || cpumask_subset(affinity, mask) )
> 
> (effectively being
> 
>         if ( !desc->action || cpumask_subset(affinity, &cpu_online_map) )
> 
> ) is nothing else than
> 
>         if ( !desc->action || true )
> 
> . Yet that doesn't feel quite right.

Oh, I get it now.  Ideally we would use cpu_online_map with the to be
removed CPU set, but that's complicated in this context.

For the purposes here we might as well avoid the AND of
->arch.cpu_mask with cpu_online_map and just check:

if ( !desc->action || cpumask_subset(desc->arch.cpu_mask, mask) )

As even if ->arch.cpu_mask has non-online CPUs set aside from the to
be offlined CPU, it would just mean that we might be shuffling more
than strictly necessary.  Note this will only be an issue with cluster
mode, physical mode must always have a single online CPU set in
->arch.cpu_mask.

Thanks, Roger.

