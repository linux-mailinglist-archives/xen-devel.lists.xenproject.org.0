Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643EB925536
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752786.1161014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvCL-000294-E7; Wed, 03 Jul 2024 08:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752786.1161014; Wed, 03 Jul 2024 08:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvCL-00026q-B9; Wed, 03 Jul 2024 08:18:41 +0000
Received: by outflank-mailman (input) for mailman id 752786;
 Wed, 03 Jul 2024 08:18:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOvCK-00026k-Fe
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:18:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8f9ae42-3914-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 10:18:37 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52e764bb3fbso6838493e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:18:37 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678c379cc6sm2873123f8f.49.2024.07.03.01.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:18:36 -0700 (PDT)
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
X-Inumbo-ID: d8f9ae42-3914-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719994717; x=1720599517; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOZyxlS/Noxst2/gNExI/arop/PCwkaNAvZtpITBPRA=;
        b=Ss/QDBGIXj5HVqasjmyiMX98NvmtrnK5jH8ah3uYLUzgfrcasgwu1fPyBSuwA0RlHD
         BqjiKuUBpWgP0aEWcigbydWnZQ52xpjLzwDWqbiE5SwKmFQXClWZr6rsQ7pnDaKevGNb
         x4rsf281/QAMr6cdQD6ElVgL+Y40No5PfAHZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994717; x=1720599517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOZyxlS/Noxst2/gNExI/arop/PCwkaNAvZtpITBPRA=;
        b=UlpdR0sA/9OVcQ5wviqHWOx12AE34v5+RUpN2sYC/J5gGjd2k/uUJpr3wzRrSuRWW+
         Yh+fv3yEB2RRM5oV84FWqQaxhpSEmOZ/qz0SIgVC6oLBsgf/cMlyJCJWnOjAkIE1N4si
         6GzZgwOcMmS8+4B58NDJy2q2ECU6YITzwDE90XLUrdMvOr6auR7oLp78RKtUB9A+4kad
         rVG8OsZY/LgZoxeiat5QR/LOtgeOnnZpCzmng1KqecSipS44wgm0vricuBtzv5atEIu1
         VlLpR/9WwmWo8KYm/zkSjnWj8uMMvUXruZoHfwSCJQB9TWN8QzxB1g9ixjtBLJVA0FWZ
         UQYQ==
X-Gm-Message-State: AOJu0YzXdHpplW8itQ1o6r/cCKLGUkGWaNs4xZ7nSZNPFAHDiGdeowHx
	5qxUyvTmbNzbejWPWvYqTlfKCh1dTjjzCwWB5cygP0TKOe7BIXCeJgsrJGwu6k8=
X-Google-Smtp-Source: AGHT+IFslHO1Ik6gGQPwnDjGwuE+S/XsP1kdXU21bVE8suOp3XU1LWj29jX0pPQjv8Qo8AVcL2eTRw==
X-Received: by 2002:a05:6512:ac4:b0:52e:7684:a385 with SMTP id 2adb3069b0e04-52e826fc38dmr6576067e87.52.1719994716580;
        Wed, 03 Jul 2024 01:18:36 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:18:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 for-4.19? 2/2] cmdline: "extra_guest_irqs" is
 inapplicable to PVH
Message-ID: <ZoUJW0bUOf-QJFP9@macbook.local>
References: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
 <e95ea1ea-dd11-4994-9d50-308db4c3772e@suse.com>
 <ZoUC_5FuwYLXdfDv@macbook.local>
 <c1e981e2-a8fe-42ed-882a-5a8714ff654c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1e981e2-a8fe-42ed-882a-5a8714ff654c@suse.com>

On Wed, Jul 03, 2024 at 10:00:51AM +0200, Jan Beulich wrote:
> On 03.07.2024 09:51, Roger Pau Monné wrote:
> > On Tue, Jul 02, 2024 at 11:52:38AM +0200, Jan Beulich wrote:
> >> PVH in particular has no (externally visible) notion of pIRQ-s. Mention
> >> that in the description of the respective command line option and have
> >> arch_hwdom_irqs() also reflect this (thus suppressing the log message
> >> there as well, as being pretty meaningless in this case anyway).
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Since the EOI map physdevop-s aren't available to HVM no matter whether
> >> the PVH sub-flavor is meant, the condition could in principle be without
> >> the has_pirq() part. Just that there really isn't any "pure HVM" Dom0.
> >> ---
> >> v4: New.
> >>
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -1178,7 +1178,8 @@ versa.  For example to change dom0 witho
> >>  hardware domain is architecture dependent.  The upper limit for both values on
> >>  x86 is such that the resulting total number of IRQs can't be higher than 32768.
> >>  Note that specifying zero as domU value means zero, while for dom0 it means
> >> -to use the default.
> >> +to use the default.  Note further that the Dom0 setting has no useful meaning
> >> +for the PVH case; use of the option may have an adverse effect there, though.
> > 
> > I would maybe remove the has_pirq() check and just mention in the
> > comment added ahead of the is_hvm_domain() check that PVH/HVM guests
> > never have access to the PHYSDEVOP_pirq_eoi_gmfn_v{1,2} hypercall,
> > regardless of whether XENFEAT_hvm_pirqs is exposed.
> > 
> > Would that be OK with you?
> 
> Okay-ish. That's why I had the post-commit-message remark on this very aspect.

I think adding the has_pirq() check is confusing, as the option is not
available to PVH.  Even if it was available it won't change the fact
that PHYSDEVOP_pirq_eoi_gmfn_v{1,2} hypercall is not reachable.

Thanks, Roger.

