Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC9976665
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797234.1207122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogjk-0006Op-4z; Thu, 12 Sep 2024 10:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797234.1207122; Thu, 12 Sep 2024 10:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogjk-0006NK-27; Thu, 12 Sep 2024 10:07:40 +0000
Received: by outflank-mailman (input) for mailman id 797234;
 Thu, 12 Sep 2024 10:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qq1e=QK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sogji-0006NA-UE
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:07:38 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d58469e7-70ee-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:07:36 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e6649so793171a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:07:36 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm6400453a12.51.2024.09.12.03.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:07:34 -0700 (PDT)
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
X-Inumbo-ID: d58469e7-70ee-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726135655; x=1726740455; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d3A0XcuZR+Kr4UTB/woysrvLcyY9sCf5q8ArcElOn8=;
        b=as44wvMC8s+A76yDFKk7AoxN8gL59Ne3XH46Y0Cu5jCgcfzZXjFoMPdv0/7LMVLyFS
         VRoqOW6RIp62UH4GGR7dnkJa/r0Xlj41keY15HITGJkqaEkSCHKI4QfKrKovulU5mNHT
         xEAZLAOEFIEiDMRdgBzYffcMSeRwnOO5a6eTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135655; x=1726740455;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/d3A0XcuZR+Kr4UTB/woysrvLcyY9sCf5q8ArcElOn8=;
        b=dImpwdj8lOG72H8oznbDu7UZe6VoY+oSfjrsACqPH8sQGP91js5zgggt8JwIYFlnBZ
         OIKAJrS4S5oNoTOclV70ZjidYDQl2SXd6wqdR7HBDD8+t0CIUrB4GYVhgehO1Ao8+8ba
         UpezXP0zBmvlKiV/TCMGvKQ5yaveNC3UxZwz7/3vIVvQKRvvt2NBORrVbtwx/hvmpBK4
         KMV9cUYdhUwtZVWOudZKwWc5eq/9+EpF2u4fbOHbpKk5cffvmgPmcuMO0S4RIzF6Umnv
         m/w5wFxVrGTtof8GaAKndVFprUhCbLuFOwL6amYesBJ8wBlFIWJ3C7Ig0AQxJ2UNhAye
         FOLA==
X-Forwarded-Encrypted: i=1; AJvYcCWJh2ZIFxTeKqlWOXJVWWDhd9/QEj+x7RG99b+aSC8YcjODe0RZFJNfpQNu04A0arEVI2ENN/iXQQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4vygqoKDTWEKERcy6//gt5fBXsvphfvyd4kgSNRTuP/pLBcM/
	pH695E9ujrS0cBwFJ1XoZhj/IJ+h9GodlzosCc8ZF7fs5/4IkmoLwpKjNcNh/fs=
X-Google-Smtp-Source: AGHT+IF9Ndnh1ithb90586zinPEyjbmmgZkGQu8/4GmwlcPmeYHEqoizF5MaS8vb3GADCeij+buLXw==
X-Received: by 2002:a05:6402:158a:b0:5be:f3ae:b9ce with SMTP id 4fb4d7f45d1cf-5c413e4d6b1mr1548217a12.27.1726135655256;
        Thu, 12 Sep 2024 03:07:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Sep 2024 11:07:34 +0100
Message-Id: <D4480SHG3YQE.BF44DSHOV7GI@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/traps: Re-enable IRQs after reading cr2 in the #PF
 handler
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20240911145823.12066-1-alejandro.vallejo@cloud.com>
 <f1ee8998-52c1-4c12-9e21-88bdec67f08a@citrix.com>
In-Reply-To: <f1ee8998-52c1-4c12-9e21-88bdec67f08a@citrix.com>

On Thu Sep 12, 2024 at 10:49 AM BST, Andrew Cooper wrote:
> On 11/09/2024 3:58 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> > index b8482de8ee..ef803f6288 100644
> > --- a/xen/arch/x86/x86_64/entry.S
> > +++ b/xen/arch/x86/x86_64/entry.S
> > @@ -844,8 +844,7 @@ handle_exception_saved:
> >  #elif !defined(CONFIG_PV)
> >          ASSERT_CONTEXT_IS_XEN
> >  #endif /* CONFIG_PV */
> > -        sti
> > -1:      movq  %rsp,%rdi
> > +1:      mov   %rsp,%rdi
> >          movzbl UREGS_entry_vector(%rsp),%eax
> >  #ifdef CONFIG_PERF_COUNTERS
> >          lea   per_cpu__perfcounters(%rip), %rcx
>
> I'm afraid this isn't correctly.=C2=A0 The STI is only on one of two path=
s to
> the dispatch logic.
>
> Right now, you're re-enabling interrupts even if #PF hits an irqs-off
> region in Xen.
>
> You must not enabled IRQs if going via the exception_with_ints_disabled
> path, which is the user of that 1: label immediately after STI.
>
> ~Andrew

Well, darn. That's a well-hidden Waldo.

I'll send a v2 with conditional enables on C and assembly, and a change of =
that
label from "1" to ".Lfoo" to clearly imply the control flow might take a
backflip from several miles down the file.

Cheers,
Alejandro

