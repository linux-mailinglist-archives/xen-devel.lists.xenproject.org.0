Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833EB82DDD3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667526.1038883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQ5w-0007Qs-FU; Mon, 15 Jan 2024 16:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667526.1038883; Mon, 15 Jan 2024 16:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQ5w-0007PI-CG; Mon, 15 Jan 2024 16:45:52 +0000
Received: by outflank-mailman (input) for mailman id 667526;
 Mon, 15 Jan 2024 16:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l31x=IZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rPQ5v-0007P8-6g
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:45:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89fa10b9-b3c5-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 17:45:50 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso7477199f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:45:50 -0800 (PST)
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
X-Inumbo-ID: 89fa10b9-b3c5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705337149; x=1705941949; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEiX1tVp++KNJqEp36QmBHK7ZPeg84st5mWxpqSV4sg=;
        b=I1USLeghdMVyATYbGPiHXkWwlfISP1t7+8LeRw4wgcz5Gvu9Le+24bEobwT1xcWkCP
         qHAoiBWVQkSEwnrAkxMTjlf7gcyGGFBX+RoNmwoQrbma+zXfKZ4s1lZJ5hofRzD2VNbI
         ymShCf6hcYVnvJW67KG7LT6XjJNUWtl4S7hZkXyMgv4W6B9qP8REcyfYKJ7QyrhA0pES
         SPRcWtKN6YIv87Zg+i6XKR2eCsnwtnJrUVWXIgnuzfU7kV1rZSGZDLgPsX6JbQMvh5iK
         j5x/XCWwcDly7xv9QOxtFSlzFxPeIF5rMoIO2TexpbUi7m431kCbnEPsHeJUDZ17Dyq6
         +LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337149; x=1705941949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEiX1tVp++KNJqEp36QmBHK7ZPeg84st5mWxpqSV4sg=;
        b=s6+QzO3FsSc/OBZJaQC+rqentXVuyfeNgXcyWp8ObTEltm8DtKl9h5XLnR8xj8cFtm
         89aVT7Z7nCHpYZ6zsOxfE/6z5TKvP+j3mFfNguawf0+IMCQ9EevG3hU9GHrFmQGS2KeP
         9asXnDTQbqna+zZxes3+KVJIwLzS05aB/4GvaY0wehN+ejbTnqGKB9OjGGcZpe3739D8
         V6CIheDao3h0+orcLRuPxG1hi1bH2ALV5hU5BbC8nYDVsGaDxacWeukVF6cHJNGtWtQM
         Jx/Kjc+aT8Y6u6iH+HtQ3/LtW0vbOpvHyfXbuUq6z50oqRGTtFC8S+fEH+CJMwjlpNi0
         mpDg==
X-Gm-Message-State: AOJu0YxWYAa08G5tRmIJfzRg69i6311zYop/WgBM/6FzngMh4db3Vgf3
	5MVdMldd7xMUwG6Ug7E3aw+AhmmpGgOODA7oeRFhrvlTKKg=
X-Google-Smtp-Source: AGHT+IHrCYAaH7Kp7EBwec5XDnXB/o/MuuhHWEz8eU5rJCPWEMxuQjMkbpYBesozdmYWHXp5L/vkLeP6K4v3AOTIPrM=
X-Received: by 2002:a7b:c3d3:0:b0:40e:3b1c:d3a2 with SMTP id
 t19-20020a7bc3d3000000b0040e3b1cd3a2mr3119562wmj.126.1705337149393; Mon, 15
 Jan 2024 08:45:49 -0800 (PST)
MIME-Version: 1.0
References: <e2e66d36-5545-40e4-847d-be3b3a523944@suse.com>
In-Reply-To: <e2e66d36-5545-40e4-847d-be3b3a523944@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 15 Jan 2024 11:45:37 -0500
Message-ID: <CAKf6xpsdtUZ8ugO3rtdU1ZMSR=UzhxpGhe4XSef9odnVhofz0w@mail.gmail.com>
Subject: Re: HWP vs "xenpm get-cpufreq-..."
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Jan 15, 2024 at 11:04=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> Jason,
>
> I thought I'd try hwp on a SapphireRapids system, and of course - short
> of easy other ways of seeing whether it actually has any apparent
> effect - I've looked at "xenpm get-cpufreq-states" output. Just to find
> that according to this, the system never enters any of the designated
> Pn states (all CPUs are always claimed to be in P0), while at the same
> time the P0 residencies remain in the hundreds of milliseconds. The
> latter suggests CPUs do leave P0, yet it's then unclear what state they
> are in during such time periods.

The `xenpm get-cpufreq-states` output may be stale under HWP.  If
normally the acpi-cpufreq driver is updating them, they won't be
updated under HWP.  I'll have to look into that more, but I guess they
shouldn't be returned under HWP.

> I was also a little puzzled when comparing "xenpm get-cpufreq-para"
> output with hwp against that with acpi-cpufreq: The latter lists a range
> of 800MHz ... 2501MHz, while with hwp base is 2500MHz and max is 4800MHz.
>
> Do you have any explanation for these apparent anomalies?

The 1 in 2501 indicates the ACPI entry for the turbo frequencies.
It's a limitation of the ACPI tables, AFAIU.  The tables weren't
designed for turbo mode where the thermal constraints dynamically
limit the maximum speed.  On systems I've looked at, there would also
be a 2500MHz ACPI entry, which matches the HWP base.

The HWP 2500MHz & 4800MHz values are taken from cpuid output - I feel
confident they are correct.  The output of `xenpm get-cpufreq-average`
under HWP looks reasonable for scaling all the way up to 4800MHz
(which can only be hit briefly before throttling down) - I think I've
only seen ~4700MHz as a maximum in my use, and they it may drop to
~4200MHz for extended preiods.  Maybe try that command on your test
system?

I introduced struct cpufreq_cpuinfo .perf_freq to correct the reported
cpu frequency under HWP.  I wonder if that should also be used for
ACPI to get correct aperf/mperf output under acpi-cpufreq.  There have
been a fair number of reports from users being confused by the
reported cpu frequency.  The presence of 2501 is similarly confusing
to users since that is a made up value and doesn't match the CPU
specs.

Regards,
Jason

