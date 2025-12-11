Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01851CB64B9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184230.1506732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiRo-0005WC-Av; Thu, 11 Dec 2025 15:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184230.1506732; Thu, 11 Dec 2025 15:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiRo-0005TT-7a; Thu, 11 Dec 2025 15:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1184230;
 Thu, 11 Dec 2025 15:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTiRm-0005NQ-H5
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:19:14 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf6b0b94-d6a4-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 16:19:13 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-343f52d15efso202322a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:19:13 -0800 (PST)
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
X-Inumbo-ID: bf6b0b94-d6a4-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765466351; x=1766071151; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgnvydHMn/DtDaaMKTGqHvZwSDVEI6+CjInwhGJLJPg=;
        b=cbVmDIeoDn6OWHFpa00+DipeKUHEcU4b98ZUUdqOHPOOaC+GL8Kpfz2hBzKMwYW/Tz
         /kvPXmKNw641sdqigMsHLmOlGdnFHGrnallrBFTwiBOU16/MvxEwyLDC6hD1F7OQQb1b
         tcbfhICs3e2sOk5FsVN1N7EwNtf/rdRrtkcWIaZzVwiapinusduQSi5C48hJ4if/odNZ
         OLJE4sAtBX5OMwHbjW8h8FeQOkGjmFmjNNqc/z7SBzaetl9R+UXMTrCnjMoFaPl+uiDr
         LkCeNwv1tDvQJtIcZ3YM+T25rgnLAD8OWrmpnAC1L2hsF6gmPB8Z+U76jIgZM1wU6YzK
         pM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466351; x=1766071151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgnvydHMn/DtDaaMKTGqHvZwSDVEI6+CjInwhGJLJPg=;
        b=mjp3SsXNmpwwClG+8dXhB7hlaCCXVE+JdJ4BnwGTVGBZDWHveLwvBP/wfJF+sUxKmU
         W1bDhZOuha0hPX0zUDWfDeGioBl5C+8GPGXR3mR4995cbtWGSCWhk17D8kdO13Bswmyd
         7SBnJ1Z1+TF+o0vyPUw/EceniuBy3mhWj5rGVuvRmwFICqcbRWNn1R2hr6gkzgzpYzHe
         ij4YyhVSltEziXHTDXjIYBGflGRzPJtrEBEpCT2GvRwZ2i4TxV9hwxeNRNa5gHqhnE/O
         41oUCjZ1lDNuAWrZOGVxfaPrcyKbswPP3rAtbC7Y6vlhTlJ6tKBhfoC2/2RFQAMR0Wwj
         ALdA==
X-Forwarded-Encrypted: i=1; AJvYcCWpC6r7LTlDxqWa1t4kUQeW7WDd2AkVG4tCYjknD615UfktvPqM4b88KkNkcQZrIcwg+zPne0LT+0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIWNoUJIBef2Glj20lubm8PpAzTB91IZGmpbUl/d2dLA21l1x6
	U/1NbEts7xrNkp0t3ISFl2Yo/S094wfs905gfZhhzX6YYKYC5h5QlLOoAKrSFeHeFDIbJLLc2Ex
	5WGdAxYUbnZ3kX/gq5Jy2TzXq9OdCqBZjrqgGqA==
X-Gm-Gg: AY/fxX7SNVPrPFVR1zwAdCsJ73oV6k0laTVjha8ffxh69DlgtAwsCoji5hxl/oLu+aL
	ROaeWcavfuHSmfyyFZJhr7NUZ1hXOmy8xNgymvvzUmUgHDB/sG2NeqGDlZvf5wZ7wnorUOheawY
	XGmWa1cwCK0sIReAAolvlLikJm/T4k81Jt5RK/2mRFWZOyqkDS5UnVc17/FZOGB0XjENjTgKhxZ
	rms8ls34zAF3qoyldkKzpjrTe6HMfDqmrcnh042rmtl6sYeYCme0msctDGGLpkEsOQemUXEUOPc
	1GGZRHBGFUjd492iPZ1B9Zib
X-Google-Smtp-Source: AGHT+IG/XTbUHh2o2Af4sBPcNHyuONDr2e/z4e4YrqCO1OeGIaQn1FGrZVdXLc4/KxZkUd7HdqBpMTW4VZVKW+iyBkI=
X-Received: by 2002:a17:90b:2e10:b0:33e:30e8:81cb with SMTP id
 98e67ed59e1d1-34a7281a4damr5233835a91.13.1765466351500; Thu, 11 Dec 2025
 07:19:11 -0800 (PST)
MIME-Version: 1.0
References: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
 <fbb12a9b0aede6dcb398a76018c274a5c76ba1fa.1765456914.git.samaan.dehghan@gmail.com>
 <a9428da3-590b-4ca4-a3fe-8eeed5b0969a@suse.com>
In-Reply-To: <a9428da3-590b-4ca4-a3fe-8eeed5b0969a@suse.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Thu, 11 Dec 2025 09:19:00 -0600
X-Gm-Features: AQt7F2qwLs9OmBRezSH_nPrSEL-HvmRPYyvejtm5pI_VyeLcgePSgPfpkZL2H5c
Message-ID: <CAHFNDNizky9Khek7uzbrSAcoZnJcA5SyGA0MbZSDKJbA45_0Zw@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm64: Add support Clang build on arm64
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 7:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 13:57, Saman Dehghan wrote:
> > --- a/xen/arch/arm/arm64/vfp.c
> > +++ b/xen/arch/arm/arm64/vfp.c
> > @@ -6,7 +6,8 @@
> >
> >  static inline void save_state(uint64_t *fpregs)
> >  {
> > -    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> > +    asm volatile(".arch_extension fp\n\t"
>
> This will take effect for the rest of the (generated) assembler file, whi=
ch aiui
> isn't what you want.

Thanks Jan, I also noticed I forgot ".arch_extension nofp" just after
sending the patch. Sorry about that.

~Saman

>
> Jan

