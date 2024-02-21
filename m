Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2124285D0E4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683817.1063434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgjI-0000wl-D0; Wed, 21 Feb 2024 07:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683817.1063434; Wed, 21 Feb 2024 07:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgjI-0000uL-9u; Wed, 21 Feb 2024 07:09:20 +0000
Received: by outflank-mailman (input) for mailman id 683817;
 Wed, 21 Feb 2024 07:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rcgjH-0000uF-5O
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:09:19 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2051665f-d088-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 08:09:17 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so80618281fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:09:17 -0800 (PST)
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
X-Inumbo-ID: 2051665f-d088-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708499357; x=1709104157; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+KSlJ1bHrB5YosM9lWw6VXzlk/IiNkl3Wa0OgtGAhc=;
        b=LDisUKiQXdVzFPnZfmIJ528cncP8VVucSYjFGm5xQXAWKac8Djzg5PxG/6HzJRKbLz
         40N/Cv5MvZ+Xy138W0OrVE8Us8Vxe8liNcdc3V7iZ5I1WsohXd9aFQN8rvap5THIdoFJ
         qMkqCiND2QzvgLyIfcxPM2+PwhQT5Lezj0hJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499357; x=1709104157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+KSlJ1bHrB5YosM9lWw6VXzlk/IiNkl3Wa0OgtGAhc=;
        b=vZp/OjaZNdSDNJy6xGZrg6F/TxJ9Ep0JRWRFZ/GP0WZfGp5fFQMvI+XHgegmvCnDU7
         2mNrYvrccOvzC4v6yXNqzVWfMS21B7t1qn0iPQTlfcs9pjEM+jpSz+USseqPXfgA+5A0
         ZLzslAu3k3aPzlfIDP7YyGHphwrV3c0Chc/X2jFJWTn0cLqFhCjjXgqpRQ2D2fOi99q8
         MWTM80XSt7eHLfhNSdkNhMFVnpmRMPupqvCZtle46K4wo33As2lPHCX/5BBkPemb1Cg+
         2gz3r3YcL2LmjwmaoSDD/DmPp8iFyirXThnKAxBKvUo8J7Nfotl5y1BNnTRMyoL4iRfd
         Q19Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzaYFQWx5cwweN5Z+UQjDTMo++kRa+p8YL89BVg/+vTDucyhyhB+VWoXNbPoazdK5W0nz+EsLHkcNApRU3al+ahTSLxhyo1ekKmxqyrWw=
X-Gm-Message-State: AOJu0YzSTyScT9Brb15hdHtFqTTRBQWhMpCezy3ct7pR0ZtbS4/2aNeS
	8QUplwPB+WESAbp4+hN1SwjHMPiyE0VaKqbtjipueAzxmEwBUEkGo3Nb+Xp/UY4Aszl2gH9iZ6t
	CvnFJgcYQTkyRnfaa9cYAMjOMrLGP86i3XQP08Q==
X-Google-Smtp-Source: AGHT+IGK7PqP3f+3KPNnrcLSC8JDdjkkLvnkykJy7LMEEPWttvqUwb+pfyS7jGDNhe9aB8kpp65bV6jBMGlPGcrZvY8=
X-Received: by 2002:a2e:9612:0:b0:2d2:4774:7642 with SMTP id
 v18-20020a2e9612000000b002d247747642mr2516813ljh.44.1708499356743; Tue, 20
 Feb 2024 23:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-3-george.dunlap@cloud.com> <ebc81051-765a-424a-9b30-97d6755e84c3@suse.com>
In-Reply-To: <ebc81051-765a-424a-9b30-97d6755e84c3@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 15:09:05 +0800
Message-ID: <CA+zSX=YB3TnBF_fLT_htEtvgzV+1uLpNPE5p1kQgbyMKYDBBAQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] svm: Improve type of cpu_has_svm_feature
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 10:03=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > The "effective type" of the cpu_has_svm_feature macro is effectively
> > an unsigned log with one bit set (or not); at least one place someone
> > felt compelled to do a !! to make sure that they got a boolean out of
> > it.
> >
> > Ideally the whole of this would be folded into the cpufeature.h
> > infrastructure.  But for now, duplicate the more type-safe static
> > inlines in that file, and remove the !!.
> >
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit preferably with ...
>
> > --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> > +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> > @@ -38,7 +38,10 @@ extern u32 svm_feature_flags;
> >  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks *=
/
> >  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation *=
/
> >
> > -#define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
> > +static inline bool cpu_has_svm_feature(unsigned int feat)
> > +{
> > +    return svm_feature_flags & (1u << (feat));
>
> ... the inner pair of parentheses dropped.

Done, thanks.

 -George

