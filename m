Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310939D5A8F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 09:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841760.1257256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEObu-0007p3-D9; Fri, 22 Nov 2024 08:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841760.1257256; Fri, 22 Nov 2024 08:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEObu-0007mU-AE; Fri, 22 Nov 2024 08:01:50 +0000
Received: by outflank-mailman (input) for mailman id 841760;
 Fri, 22 Nov 2024 08:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYSV=SR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tEObs-0007mE-TJ
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 08:01:48 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 042b5971-a8a8-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 09:01:45 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cecbddb574so2436709a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 00:01:45 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f5fdesm66436966b.72.2024.11.22.00.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 00:01:44 -0800 (PST)
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
X-Inumbo-ID: 042b5971-a8a8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA0MmI1OTcxLWE4YTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjYyNTA1LjE3NzkwMSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732262504; x=1732867304; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2SNqoc8LwplQFWOejGczCAemWc52Gqe/r3udNnShXk=;
        b=mf8whRDW+Si1jI4IbdYdhIgto5oFZiQ0lQCjUD9SofRIyvYYlFM+MuwuPjvVoqErNx
         46y9FZPaYUWFtH/H2Z8JTOjAmI+yp4Gk0zRv80yMhjiHIJDs5jmdO70q1kscTycNuPTM
         6efdMrvYc2zJstcGY1Kx34WFaHnEs+7GTe8fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262504; x=1732867304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2SNqoc8LwplQFWOejGczCAemWc52Gqe/r3udNnShXk=;
        b=Kezojc/mnN2FUYSoj9YzdBSaROn2jQc/1ROc+V72x6M+V5a8yR47t1i9OVOylgjqaT
         nZQrpvPDc4czbDCUbAlgp3vCvAuAeMma8MvAfm2psbjwn5VLoiqQ41iFQnpHKsJoE1Xn
         q55PtDcwnWyDAWJi4jXH8Ml6mfvriuBMNRC55b3FypUCaMjiZKBI0uBoiTYLkUElkX5C
         CEV+9yln6YYLG0i6Nk0Rtjygt3TgSqy21YlQPAhG4sLSJnq0zuD8vkjgmwff1YnA9lcV
         eGuhClNBNwOz6fyK0MPt5HicCopj+xQSVryekCS8MxP0tKTXCAWd4iC9cydkllDOYIfb
         vOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeJEm9LxLbkDORQwFEpt78ElCdR3zRCvF2pwrghEuko9eobxpUCcp6aMx+Q5Ml3Me5ov+FQGYZj8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywix31gn6G0jcIszBMMvxiLYljhAedgikR++aiRF4mSmGIUxR60
	nIh+7UOWxcMywZ63QSjkD/31Dm2Lb0NwYjzWZ3fF2JjNAUEPCqON8yX1PODZsKQ=
X-Gm-Gg: ASbGncurbICEg7xk71TMoFdUnQ25/owWTgznlzHUKDYBBDgGVpevEyHsrHhANf24sC3
	YT+uM6uKFRgBxv54LbVJQKWwPesDHVZ+N62S5Q/hJsqNB0InD8D3WcK1kKOD+6+Tb1hiotxsX3v
	fQopzKN2JWNkKItGdFMICuhwrvlaJolK5xE//2uff9VEM3tGJd+fYyV1gSzU3ONogWgSo/GfRh+
	rLd/SyDb9JtINexARQ/ok6SyUTId6sQecfCNh9IvCoUr4eYGo/xJqhOak4=
X-Google-Smtp-Source: AGHT+IH5wK+l444JZTJAKi1BGJoAcgSCoWa+YFRASkeDj13FtZS0QzkgrjPGZCkA2wGXaw00UnHCtw==
X-Received: by 2002:a05:6402:5109:b0:5cf:e291:6279 with SMTP id 4fb4d7f45d1cf-5d0205a80dbmr1227430a12.1.1732262504391;
        Fri, 22 Nov 2024 00:01:44 -0800 (PST)
Date: Fri, 22 Nov 2024 09:01:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
Message-ID: <Z0A6Zz06bg3l0wju@macbook>
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-2-roger.pau@citrix.com>
 <b849f46d-501a-4083-aecd-fdf0c4319eda@suse.com>
 <Zz8Tugu22NPzAQUo@macbook>
 <f0c0cdca-e6a8-47c9-934a-85a91609e9e7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0c0cdca-e6a8-47c9-934a-85a91609e9e7@suse.com>

On Thu, Nov 21, 2024 at 12:39:06PM +0100, Jan Beulich wrote:
> On 21.11.2024 12:04, Roger Pau Monné wrote:
> > On Thu, Nov 21, 2024 at 11:49:44AM +0100, Jan Beulich wrote:
> >> On 20.11.2024 12:35, Roger Pau Monne wrote:
> >>> The current calculation of PV dom0 pIRQs uses:
> >>>
> >>> n = min(fls(num_present_cpus()), dom0_max_vcpus());
> >>>
> >>> The usage of fls() is wrong, as num_present_cpus() already returns the number
> >>> of present CPUs, not the bitmap mask of CPUs.
> >>
> >> Hmm. Perhaps that use of fls() should have been accompanied by a comment, but
> >> I think it might have been put there intentionally, to avoid linear growth.
> >> Which isn't to say that I mind the adjustment, especially now that we don't
> >> use any clustered modes anymore for I/O interrupts. I'm merely questioning
> >> the Fixes: tag, and with that whether / how far to backport.
> > 
> > Hm, sorry I've assumed the fls() was a typo.  It seems wrong to cap
> > dom0 vCPUs with the fls of the present CPUs number.  For consistency,
> > if the intention was to use fls to limit growth, I would have expected
> > to also be applied to the dom0 number of vCPUs.
> 
> FTR: My vague recollection (it has been nearly 10 years) is that I first had
> it there, too. Until I realized that it hardly ever would have any effect,
> because of the min(). And for Dom0-s with extremely few vCPU-s it seemed
> reasonable to not apply that cap there.

I don't have a strong opinion regarding the fixes tag, but would like
to get this sorted as soon as possible.  If you prefer just drop the
fixes tag.  I think this wants backporting to all supported releases,
because it's an issue XenServer has hit on real servers when dom0 is
sized to use 16 vCPUs at most.

Thanks, Roger.

