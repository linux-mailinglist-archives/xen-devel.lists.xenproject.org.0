Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653876F7050
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 19:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529852.824732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pucJl-0004ET-Lv; Thu, 04 May 2023 17:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529852.824732; Thu, 04 May 2023 17:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pucJl-0004CZ-J6; Thu, 04 May 2023 17:00:33 +0000
Received: by outflank-mailman (input) for mailman id 529852;
 Thu, 04 May 2023 17:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YwFE=AZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pucJj-0004CS-T7
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 17:00:31 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d583e48-ea9d-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 19:00:31 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-95369921f8eso124766166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 May 2023 10:00:31 -0700 (PDT)
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
X-Inumbo-ID: 2d583e48-ea9d-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683219630; x=1685811630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf+akuAetUw5mPpaoTEl1gz7jnjlPFnuMgfEJt3WehQ=;
        b=Uvl1QsdyaTc70GUeTJPP3JIMIajiRrYckvtyXmpKr67WX29WXIeaMsl4j+pxDr4zKD
         e5cPgolphQTQ/3vIyQQjQbfrvCB1XEpJk8QZ7/9b9VvMzwUpNFqZCVxJIOaTc6tsxxLo
         ISD22iYuSqCasw1QC9eV71ZQMSQIq8b5AiYWFkrKpY9KGDqQkJ7tS/aZaNDiiL2sACdK
         j8lC3By3qzwyoigV/xh49IWRG9e0eGN9B+FMp8j9ow7T3DTnqxBsVgiQ12P/gNUE0gX9
         Xs8mc0tAw4ME69ppQ1NzObb8ajPJT3K5520U26gyeImEDfvRKvV+KriTtJ20LP8zorTf
         ugLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683219630; x=1685811630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf+akuAetUw5mPpaoTEl1gz7jnjlPFnuMgfEJt3WehQ=;
        b=Izip/uew1OeTMPYsEU47tBaHVAcIMR0JZpHP97hkp60bp/xlbN46G2AVJrIp4oIGyN
         bsCkd38pUddpo5nAsnVcw8ksm7Ikm1T5sM0peddy4hpPK9/OQl+ZzNOKV3OOZ+0cHmq7
         AiGKa+zaW3aoY0nnVJvO1wR3bY1FwWmZMrOj+jXRdZjlO/UWShmr2KMnX2FNC0TqRXl+
         odWUr5XSWAGFbpTv1YCHrDXz900nuFmBHH1dDj8QHEqQ5GieYgEkDm4d6tWZ508+ii6y
         zdzjCMjFqOm0BuY6WiL2aaPRFUFcSpQc3yIes4TLySzkm4+O2JDr8fWZIrHLqk/X/TLK
         pIcA==
X-Gm-Message-State: AC+VfDz4PT7NcUWelkHiga2hHOk56mV7k+Iwmpq/Lj+GjYGDu3znBHyV
	b5HnqGe3sYlLff7RMbED3KAzIcP6jtd4DVObsN7keTT7
X-Google-Smtp-Source: ACHHUZ4EApKmy01ns7eRj4sQhVdkyd7+J6e/u+KRupmFVYz/e9IBl0/BGrOR/3Xi7dunPYOSCzA874bIj837NQPpHgo=
X-Received: by 2002:a17:907:26c5:b0:953:4775:baa7 with SMTP id
 bp5-20020a17090726c500b009534775baa7mr7703348ejc.52.1683219630364; Thu, 04
 May 2023 10:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-6-jandryuk@gmail.com>
 <2864bf57-88cd-6fce-2d38-6f3a31abb440@suse.com>
In-Reply-To: <2864bf57-88cd-6fce-2d38-6f3a31abb440@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 4 May 2023 13:00:18 -0400
Message-ID: <CAKf6xpshQ=6kPHtjpWqNUiaBym2uEXt=reY0Kd0VoZgxuE=LxA@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] xenpm: Change get-cpufreq-para output for internal
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 10:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > When using HWP, some of the returned data is not applicable.  In that
> > case, we should just omit it to avoid confusing the user.  So switch to
> > printing the base and turbo frequencies since those are relevant to HWP=
.
> > Similarly, stop printing the CPU frequencies since those do not apply.
>
> It vaguely feels like I have asked this before: Can you point me at a
> place in the SDM where it is said that CPUID 0x16's "Maximum Frequency"
> is the turbo frequency? Without such a reference I feel a little uneasy
> with ...

I don't have a reference, but I found it empirically to match the
"turbo" frequency.

For an Intel=C2=AE Core=E2=84=A2 i7-10810U,
https://ark.intel.com/content/www/us/en/ark/products/201888/intel-core-i710=
810u-processor-12m-cache-up-to-4-90-ghz.html

Max Turbo Frequency 4.90 GHz

# xenpm get-cpufreq-para
cpu id               : 0
affected_cpus        : 0
cpuinfo frequency    : base [1600000] turbo [4900000]

Turbo has to be enabled to reach (close to) that frequency.

From my cover letter:
This is for a 10th gen 6-core 1600 MHz base 4900 MHZ max cpu.  In the
default balance mode, Turbo Boost doesn't exceed 4GHz.  Tweaking the
energy_perf preference with `xenpm set-cpufreq-hwp balance ene:64`,
I've seen the CPU hit 4.7GHz before throttling down and bouncing around
between 4.3 and 4.5 GHz.  Curiously the other cores read ~4GHz when
turbo boost takes affect.  This was done after pinning all dom0 cores,
and using taskset to pin to vCPU/pCPU 11 and running a bash tightloop.

> > @@ -720,10 +721,15 @@ static void print_cpufreq_para(int cpuid, struct =
xc_get_cpufreq_para *p_cpufreq)
> >          printf(" %d", p_cpufreq->affected_cpus[i]);
> >      printf("\n");
> >
> > -    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
> > -           p_cpufreq->cpuinfo_max_freq,
> > -           p_cpufreq->cpuinfo_min_freq,
> > -           p_cpufreq->cpuinfo_cur_freq);
> > +    if ( internal )
> > +        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
> > +               p_cpufreq->cpuinfo_min_freq,
> > +               p_cpufreq->cpuinfo_max_freq);
>
> ... calling it "turbo" (and not "max") here.

I'm fine with "max".  I think I went with turbo since it's a value you
cannot sustain but can only hit in short bursts.

Regards,
Jason

