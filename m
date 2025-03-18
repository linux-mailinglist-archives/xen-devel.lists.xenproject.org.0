Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A369FA66E3F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918619.1323271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSLt-00059r-Vi; Tue, 18 Mar 2025 08:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918619.1323271; Tue, 18 Mar 2025 08:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSLt-00057e-SV; Tue, 18 Mar 2025 08:31:09 +0000
Received: by outflank-mailman (input) for mailman id 918619;
 Tue, 18 Mar 2025 08:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuSLs-00057U-88
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:31:08 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55cf680d-03d3-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 09:31:06 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so18353935e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:31:06 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb7ea197sm17143277f8f.84.2025.03.18.01.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 01:31:05 -0700 (PDT)
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
X-Inumbo-ID: 55cf680d-03d3-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742286666; x=1742891466; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NLpP2r/uvNW9nsoEmTyyyAQzGv3bxY+Sf1ncfRw2iKc=;
        b=U1VzILVJzj8oNdgTHp+QHJwkBb0qdG+93hcIGxkTLdotDsCZdUQgrRKs+ehLPQCxbI
         kzccL4HGNameAdOwWxaJLS1jcavV3zZIC4mTDTkxvrVJuja0hT6uOh2bamiGMHATaK7r
         JVQU2mhWyuUax3zEZVv4c89Gca9qZ8CB+iBXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742286666; x=1742891466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLpP2r/uvNW9nsoEmTyyyAQzGv3bxY+Sf1ncfRw2iKc=;
        b=K+/yAtgAv1sJxShViJj2K1bfu0TnahKwvgehNQLUb3B1GKRLrAl94kLRgccTbaUoPD
         hF172XLypnK1mHbuMjU/2Qrae8NhyNnb1yRVxhV8NfHfthDUttKoXwxSErCGzmD/JYON
         EpnMlPWDYZqUeq3LIb52yDDTtkdmODb/th6fdpLk+KcQijpimQhVYWqr+m+WnQJbNbsy
         butQMMRFqW4kfSwbj2cJUW5ZHrZBwgqGNxwhInxOcRMscOw2vvs+uSsBCRsbhgvvSTUA
         lDkip0fOJqVTUOcmbs66syyI250Q9Z3LrNYqQe3Ib2PKbH2FCP4MMwEY7TxCH11lk/ug
         nIyw==
X-Forwarded-Encrypted: i=1; AJvYcCUCnR17TdggQpzq7la7Xf2zChvvy46que+RqEka0lEWbHqs3y50RAzs4liwju84J+lisaPkrOyVPP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxinEU1R77kP6IKV7HnKOGIo2BWkX9ZEti+rhg4n8NpJ+P2YDRr
	JfXLSUuKy4/zgvW90DbVTA/SJ36Ay13AkEqgKvnYvdErhIHdbhSr0xxJRynf8qE=
X-Gm-Gg: ASbGncvQHX9Gk8+aJEWiBZlPAJsA19hIoj9QSR4SIYnd5awhJUCLIbMVDy5PobbCpYn
	SOUtOT0bIYfY/JtLHCFovDw8ipAFP7/KLYODXCRtOqGUIT3nsjgsBmZdFFc7HpLQYxAWawDRcpu
	i+safdrmiMH0m4bRqFvPMBoZpQP0m7k2LfrglYp4almFMSMvl1+C2wGagfJ/0WHuNrjVP/Unm+X
	zinuaxqJcFe3z48AFb0M+bDB0b1oP9Wq5/zRE+ajirqrJVjwaJk1zcaXAWCmbaEa2p/TJIzVWdW
	LRp5SDbHoHieOHIJls4zHH3K4G+bJNYKlhCJL4aKeVk+RCqRhHMv8+k=
X-Google-Smtp-Source: AGHT+IFpU5YueQJvFDQozRk4d2Lzzs+jbp8vSfiEkKJbFUt0/aHe+/n3HztzhBiXo4Roke7pU1/guw==
X-Received: by 2002:a5d:47cc:0:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-3996bb456a5mr2020789f8f.9.1742286665593;
        Tue, 18 Mar 2025 01:31:05 -0700 (PDT)
Date: Tue, 18 Mar 2025 09:31:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: Re: S3 regression on AMD in 4.20
Message-ID: <Z9kvSGhXxFFXDElP@macbook.local>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
 <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
 <Z9hGH0GLq-I1cKzt@macbook.local>
 <Z9hPaLVVhqAK5H0K@mail-itl>
 <Z9hdTCMKxF98wHJw@macbook.local>
 <Z9hhvr7p13RGcNCY@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9hhvr7p13RGcNCY@mail-itl>

On Mon, Mar 17, 2025 at 06:54:06PM +0100, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 17, 2025 at 06:35:08PM +0100, Roger Pau Monné wrote:
> > On Mon, Mar 17, 2025 at 05:35:51PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Mon, Mar 17, 2025 at 04:56:15PM +0100, Roger Pau Monné wrote:
> > > > On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
> > > > > On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
> > > > > > On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > >> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> > > > > >>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
> > > > > >>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> > > > > >>>>
> > > > > >>>> This one has working S3, so add a test for it here.
> > > > > >>>>
> > > > > >>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > > > >>>> ---
> > > > > >>>> Cc: Jan Beulich <jbeulich@suse.com>
> > > > > >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > > >>>>
> > > > > >>>> The suspend test added here currently fails on staging[1], but passes on
> > > > > >>>> staging-4.19[2]. So the regression wants fixing before committing this
> > > > > >>>> patch.
> > > > > >>>>
> > > > > >>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> > > > > >>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
> > > > > >>> We could commit the patch now without the s3 test.
> > > > > >>>
> > > > > >>> I don't know what the x86 maintainers think about fixing the suspend
> > > > > >>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> > > > > >> I'm on it already, but it's annoying. Lets convert this thread to
> > > > > >> discussion about the issue:
> > > > > >>
> > > > > >> So, I bisected it between staging-4.19 and master. The breakage is
> > > > > >> somewhere between (inclusive):
> > > > > >> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> > > > > >> and
> > > > > >> 47990ecef286 x86/boot: Improve MBI2 structure check
> > > > > >>
> > > > > >> But, the first one breaks booting on this system and it remains broken
> > > > > >> until the second commit (or its parent) - at which point S3 is already
> > > > > >> broken. So, there is a range of 71 commits that may be responsible...
> > > > > >>
> > > > > >> But then, based on a matrix chat and Jan's observation I've tried
> > > > > >> reverting f75780d26b2f "xen: move per-cpu area management into common
> > > > > >> code" just on top of 47990ecef286, and that fixed suspend.
> > > > > >> Applying "xen/percpu: don't initialize percpu on resume" on top of
> > > > > >> 47990ecef286 fixes suspend too.
> > > > > >> But applying it on top of master
> > > > > >> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
> > > > > >> but the failure mode is different than without the patch - system resets
> > > > > >> on S3 resume, with no crash message on the serial console (even with
> > > > > >> sync_console), instead of hanging.
> > > > > >> And one more data point: reverting f75780d26b2f on top of master is the
> > > > > >> same as applying "xen/percpu: don't initialize percpu on resume" on
> > > > > >> master - system reset on S3 resume.
> > > > > >> So, it looks like there are more issues...
> > > > > > Another bisection round and I have the second culprit:
> > > > > >
> > > > > >     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
> > > > > >
> > > > > > With master+"xen/percpu: don't initialize percpu on resume"+revert of
> > > > > > 8e60d47cf011 suspend works again on this AMD system.
> > > > > 
> > > > > That's not surprising in the slightest.
> > > > > 
> > > > > Caching hardware values in Xen isn't safe across S3, which QubesOS has
> > > > > found time and time again, and for which we still have outstanding bugs.
> > > > > 
> > > > > S3 turns most of the system off.  RAM gets preserved, but devices and
> > > > > plenty of internal registers don't.
> > > > 
> > > > I think I've spotted the issue.  enable_iommu() called on resume
> > > > (ab)uses set_msi_affinity() to force an MSI register write, as it's
> > > > previous behavior was to unconditionally propagate the values.  With
> > > > my change it would no longer perform such writes on resume.
> > > > 
> > > > I think the patch below should help.
> > > 
> > > It doesn't, I still got reboot on resume, with no crash message on
> > > serial (even with sync_console).
> > 
> > There was an error with the previous patch, and it's also a bug in the
> > original patch.  Could you give a try to the updated patch below?
> > 
> > Sorry for bothering you, but ATM I haven't found a way to trigger
> > this myself.
> 
> This one does fix the issue :)

I've now formally sent the patch, could you provide a Tested-by for
it?

https://lore.kernel.org/xen-devel/20250318082945.52019-1-roger.pau@citrix.com/T/#u

Thanks, Roger.

