Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CEB90C8C8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 13:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743004.1149899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWo2-0005Ev-CW; Tue, 18 Jun 2024 11:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743004.1149899; Tue, 18 Jun 2024 11:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWo2-0005Bv-9n; Tue, 18 Jun 2024 11:15:18 +0000
Received: by outflank-mailman (input) for mailman id 743004;
 Tue, 18 Jun 2024 11:15:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBP2=NU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJWo1-0005Bp-DD
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 11:15:17 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098b7f81-2d64-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 13:15:15 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4421c014b95so30913461cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 04:15:15 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441ef3d88f9sm54879211cf.12.2024.06.18.04.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 04:15:13 -0700 (PDT)
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
X-Inumbo-ID: 098b7f81-2d64-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718709315; x=1719314115; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCWxaXWRj+zULFoQ4vnFkM0t4dQAaomXJTUwJyMFBMM=;
        b=Fyk/Cqp44jJ/Bjuk3p6pzAbVjeI40mN8ApmpCy6IxMWYxC750huUK2RB1gTIPkPn7w
         k2vuWzcYkFLpudiyTPzYdqD6l0qfKLNkslmYQuPDggLGp4SZ83dkr5y5J8L30qu+98PL
         pf8RwBO5EgLl8V+F0YjFNAAMP+jrdmaltE9Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709315; x=1719314115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCWxaXWRj+zULFoQ4vnFkM0t4dQAaomXJTUwJyMFBMM=;
        b=QOsmIYpKgFSWcHGDQ3+gg0HCcQhf1IJIQWKIkoLWMt74Cz6LGSD+eSkGcbxwn0Z3SP
         sCEGjLQrPBAd6p/qkPLpPo8BSAD7J8RfMNHiRAg/nFK0uAt+on8PXSUFnoo2ojC1/+c+
         X5mYZpz9UinHEveVicbv59K5lmd3njc1douUm1mWotMHKw7yQKSk/VEbYScm2IUy+ybB
         5VsQZPKa0tKRZF6pOlMYrCbqj2rnMriUdbnnmXEK0XEo1WKLWlVDHYIsxG/lxDx7Pv1N
         /Ad3Oy2aH/3w0c7Y5cGo3c2oCHNDfQrAqGnTB5JAV4As+nZFpZkF42tGg87sgHkIy2n7
         zA4g==
X-Forwarded-Encrypted: i=1; AJvYcCWgLqzEqe73vuTkC260I8Iy1pYck+fO2Y1DI52/42FEV2q/vy2CpAjej6fkWy3HMqBRG8mhXFTXBF9xbxWTfOcuDjz8k4X+hpY/auNHrig=
X-Gm-Message-State: AOJu0YxT2QodvpqsvQiwnWhQtJG6xuMG9uW89s7LQUfs0loAJIFek/Tk
	86jpq5P1Y6xF3MxNfu4IdEs/Ew3ogYSGWSqXnEYJr2VqHXmZqFqcdTDDqz7is70=
X-Google-Smtp-Source: AGHT+IE9+HMwRLeqBgzYSPw7aYJMXz74PpS4QhlqOkG1uQZnNB/HDKYWZIltdJ1RKhjRU+hnvfk43w==
X-Received: by 2002:ac8:5d02:0:b0:43a:c0c7:a218 with SMTP id d75a77b69052e-4449bc9c025mr40537571cf.33.1718709313678;
        Tue, 18 Jun 2024 04:15:13 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:15:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.19 1/3] x86/irq: deal with old_cpu_mask for
 interrupts in movement in fixup_irqs()
Message-ID: <ZnFsP9Xt4e1cQsCA@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-2-roger.pau@citrix.com>
 <f92fc38b-aba9-4f8f-b95c-4723049523d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f92fc38b-aba9-4f8f-b95c-4723049523d0@suse.com>

On Mon, Jun 17, 2024 at 03:18:42PM +0200, Jan Beulich wrote:
> On 13.06.2024 18:56, Roger Pau Monne wrote:
> > Given the current logic it's possible for ->arch.old_cpu_mask to get out of
> > sync: if a CPU set in old_cpu_mask is offlined and then onlined
> > again without old_cpu_mask having been updated the data in the mask will no
> > longer be accurate, as when brought back online the CPU will no longer have
> > old_vector configured to handle the old interrupt source.
> > 
> > If there's an interrupt movement in progress, and the to be offlined CPU (which
> > is the call context) is in the old_cpu_mask clear it and update the mask, so it
> > doesn't contain stale data.
> 
> Perhaps a comma before "clear" might further help reading. Happy to
> add while committing.

Maybe, I'm trying to think of other ways to word the sentence in order
to make is simpler, but I'm out of ideas.

> > Note that when the system is going down fixup_irqs() will be called by
> > smp_send_stop() from CPU 0 with a mask with only CPU 0 on it, effectively
> > asking to move all interrupts to the current caller (CPU 0) which is the only
> > CPU to remain online.  In that case we don't care to migrate interrupts that
> > are in the process of being moved, as it's likely we won't be able to move all
> > interrupts to CPU 0 due to vector shortage anyway.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

