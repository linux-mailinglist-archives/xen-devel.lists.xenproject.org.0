Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E6904DB6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738926.1145799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJ49-0002aR-BF; Wed, 12 Jun 2024 08:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738926.1145799; Wed, 12 Jun 2024 08:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJ49-0002Xj-8W; Wed, 12 Jun 2024 08:10:45 +0000
Received: by outflank-mailman (input) for mailman id 738926;
 Wed, 12 Jun 2024 08:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHJ47-00017M-HC
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:10:43 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 428e4cf5-2893-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:10:42 +0200 (CEST)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-62a08091c2bso24939937b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:10:42 -0700 (PDT)
Received: from localhost ([46.222.2.38]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795f314fcb5sm260760585a.72.2024.06.12.01.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:10:40 -0700 (PDT)
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
X-Inumbo-ID: 428e4cf5-2893-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718179841; x=1718784641; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ok1fOm0ZQJOWLsqRuLXcwY4KZXnpsaiAj+FUXeRbHrQ=;
        b=srELggTjaH3FTXH1DY5JZ8E3S46C+rkly4CYMJFZt1/4HHKjaovUIFHQZVkYPC3a4c
         f1GBDe+ExwxkDlqf3MIL0TAT0Mwidn9ANtx2RNGGkztfZx+DxbYOJmCWn8Lj0wPmXqwL
         2wbfYSb7+2gnMdx65WaBFGQtl52EThaTqI1AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179841; x=1718784641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ok1fOm0ZQJOWLsqRuLXcwY4KZXnpsaiAj+FUXeRbHrQ=;
        b=m8SkYYuSK6QRkccyQ2MCmXmOZGZkwibjFS2NPEKAdiskc1UzIREKMxZ6kF1X1ZjR6+
         uyP/bzOrlXIcdRXGYV8XrDyhOo4qiWaxq/G/vbdIZtwFCG27X3+qjuCzCd2MVnq6aIed
         fzc0w8y844bp2EtpKLJG8EddRPfiu4vvdTHclj03gKzQ+ojHp/4DM636t6wJc5BQa1S0
         jk4GazAkUuvV93JTBvMNzD0OOMQiIFhRJytuQB3L4bFbvsmyCaV4d6VPQGqAtm7DGzm4
         7afLDA+UyA+fBcPUhqjes2Bq86gtLiIKKNN4eQL9uQ8lfWzMqultUXUt/3DXnqXnmZk1
         lykg==
X-Forwarded-Encrypted: i=1; AJvYcCUQXcCl031obYSFLEuMgumt07K2ypMINbvEaJ/900cg4c0Fp7MOYpFw2IhMwrnJKWIiJDhClsrLAYuHDFZqo3jFBJZMyhx/hVsQTNEa74o=
X-Gm-Message-State: AOJu0Yy+1EjxVMiqWRXkQzchK7DVQ5+mjd7Yz7nmM9/zRhNvwLzQS4Gz
	dGkml5m2BjQ/GttMoz6RYLzS5kWGWPQuQ7EVDT2J5jIzsUoA4HNUoNziHloLsdM2lEXGLZnU6RC
	q
X-Google-Smtp-Source: AGHT+IHn3yWYZkBGFUL1w1Mt4rk4mRmDpYKUkqoEgOCfvwJwbmygVnLlEMplEgM0m5bZnLRMUIc8YQ==
X-Received: by 2002:a0d:d403:0:b0:62d:a29:5384 with SMTP id 00721157ae682-62fbdaaa65cmr10460997b3.43.1718179840830;
        Wed, 12 Jun 2024 01:10:40 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:10:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/7] x86/irq: limit interrupt movement done by
 fixup_irqs()
Message-ID: <ZmlX_cxqJLerZKee@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-4-roger.pau@citrix.com>
 <5660db44-b169-44e3-9439-67d3b55bcac0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5660db44-b169-44e3-9439-67d3b55bcac0@suse.com>

On Tue, Jun 11, 2024 at 11:59:39AM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > The current check used in fixup_irqs() to decide whether to move around
> > interrupts is based on the affinity mask, but such mask can have all bits set,
> > and hence is unlikely to be a subset of the input mask.  For example if an
> > interrupt has an affinity mask of all 1s, any input to fixup_irqs() that's not
> > an all set CPU mask would cause that interrupt to be shuffled around
> > unconditionally.
> > 
> > What fixup_irqs() care about is evacuating interrupts from CPUs not set on the
> > input CPU mask, and for that purpose it should check whether the interrupt is
> > assigned to a CPU not present in the input mask.  Assume that ->arch.cpu_mask
> > is a subset of the ->affinity mask, and keep the current logic that resets the
> > ->affinity mask if the interrupt has to be shuffled around.
> > 
> > Doing the affinity movement based on ->arch.cpu_mask requires removing the
> > special handling to ->arch.cpu_mask done for high priority vectors, otherwise
> > the adjustment done to cpu_mask makes them always skip the CPU interrupt
> > movement.
> > 
> > While there also adjust the comment as to the purpose of fixup_irqs().
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Aiui this is independent of patch 1, so could go in while we still settle on
> how to word things there?

I think so, the issue patch 1 fixes is independent from the rest of the
series.

Thanks, Roger.

