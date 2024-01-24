Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925C83AEAA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 17:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671160.1044362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSgPJ-0006pi-R0; Wed, 24 Jan 2024 16:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671160.1044362; Wed, 24 Jan 2024 16:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSgPJ-0006mS-OL; Wed, 24 Jan 2024 16:47:21 +0000
Received: by outflank-mailman (input) for mailman id 671160;
 Wed, 24 Jan 2024 16:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRLw=JC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rSgPI-0006mG-CJ
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 16:47:20 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36bcbc3f-bad8-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 17:47:09 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ccec119587so73548781fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 08:47:09 -0800 (PST)
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
X-Inumbo-ID: 36bcbc3f-bad8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706114828; x=1706719628; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M27HGgarpmQx+Rw68mVlwB59f0zBCIzGXPprd0IdXmU=;
        b=hcRG19v2COzbl9/Fheto9lwL/XFY7wSWIVv3oYfNCgfZL3fgsFDzv6uROSDZ1gz8px
         BBK6POmRJz0aIdURVXk0t1usstNaEIpv/4w/MV8xNjdQwc9VRcOjqen7ZKFf/aIHFRbz
         6Ty2tSUNaR1T0K8utLB0E7Uzi458/eTrgHGVBCl0rCc7efONqH42KUmEalpPVUnyIS0l
         4X6ZfHgDegEGnJaB1Ue7YauDTmP80JanM9nUk5qAEamNRfpCX1oFxArii9wRKy1XPwzx
         jMx9dZu206OzfimMycYAtNnJEvmkzyLIqqDFqjfLn6ygAhPXRcGOgXR6nPTyXG6mqFLl
         0twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706114828; x=1706719628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M27HGgarpmQx+Rw68mVlwB59f0zBCIzGXPprd0IdXmU=;
        b=DfAICNQfzd6BadP2U2Iek/8ebc+iXV0ukiSZLoKB6Y73CvA4k/KS1J4/pq5rsMKct0
         MFiyxEtKjkQK8k0wF8usuiRml/MFU9SJzCYwbe3lSJJD6WTTGEd5nyYaQ9ll34R1UgDD
         lL77FGO3frQP3mmF755JHRus/ye+ZvzLk2W4pZWEwpbe58qL35wv9UOSBkufkGzYp8x4
         tBavM7d3+6ftDD4JZgSjHneD/A2iGxW3iOlm//m7S7iyRVwPQWfBEWgmP67zSQgrtIXt
         Zio5pnn6KJEuAbrSmHn9tF+v9ChiYgVcAYaxSGlnTdvikk1uL2w0sCPCKhBCvjDT00fi
         bKqA==
X-Gm-Message-State: AOJu0Ywlv8Bii0x2C6Y9ya6umQGwUb9YNI1Ht6ayaGEXjwib/j5PK/ML
	MUTC2rPUsDyMiTwm0LWi+sPZlP8e20iM0YbRq0Wt4WfjGrBGyYTBaAltljLeIJFG01Q1PNGcJrN
	ICUEgISUN6Cn//hRCx8nnSa5VM3E=
X-Google-Smtp-Source: AGHT+IFzjGw8dh/sQjyWnnY66whdokA8QXc7Z9m1SzC0ouPnQGeMkZjlAznYa0G5qSPOwvwvBPsRu0MAn53mR0z1SEE=
X-Received: by 2002:a2e:95c8:0:b0:2cc:6bf6:cdc6 with SMTP id
 y8-20020a2e95c8000000b002cc6bf6cdc6mr952822ljh.7.1706114828138; Wed, 24 Jan
 2024 08:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20240122190934.52080-1-jandryuk@gmail.com> <0a02a53c-9163-428d-a5d9-6cf2234d7b9c@suse.com>
In-Reply-To: <0a02a53c-9163-428d-a5d9-6cf2234d7b9c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 24 Jan 2024 11:46:56 -0500
Message-ID: <CAKf6xps_22hsOtJtr7+DbRO+UDs5sChHr=0Noq3g=Mw6QK7PjQ@mail.gmail.com>
Subject: Re: [PATCH] pmstat: Limit hypercalls under HWP
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 3:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.01.2024 20:09, Jason Andryuk wrote:
> > When HWP is active, the cpufreq P-state information is not updated.  In
> > that case, return -ENODEV instead of bogus, incomplete info.  The xenpm
> > command already supports skipping results when -ENODEV is returned, so
> > it is re-used when -EOPNOTSUPP might be more accurate.
> >
> > Similarly, set_cpufreq_para() is not applicable when HWP is active.
> > Many of the options already checked the governor and were inaccessible,
> > but SCALING_MIN/MAX_FREQ was still accessible (though it would do
> > nothing).  Add an ealier HWP check to handle all cases.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > `xenpm get-cpufreq-states` now doesn't return any output.  It also exit=
s
> > successfully since xenpm doesn't check the returns there.
>
> This isn't very nice. Is there nothing sensible that can be output
> instead in the HWP case? If not, I think it would help if
> inapplicability of the command would be indicated by at least one line
> of output. Or might it make sense to at least fall back to
> get-cpufreq-average in that case?

Sorry, I should have explained more, but, yes, not nice.  "No output
and exits with success" is how xenpm works if -ENODEV is received -
which I guess occurs when cpufreq is disabled (regardless of HWP).  I
found that surprising, but that behaviour is matched under HWP with
this patch.

Yes, `xenpm get-cpufreq-states` can be enhanced.  The re-use of ENODEV
was useful to make `xenpm get-cpufreq-average` output C-states but
skip P-states.  If EOPNOTSUPP is used, then that can differentiate
when HWP is used.  So `xenpm get-cpufreq-states` can print a message
when cpufreq is disabled, and a different one when P-States  are
unavailable.

Regards,
Jason

