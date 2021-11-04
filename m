Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F34457EC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 18:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221787.383665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1migB4-0003gA-5W; Thu, 04 Nov 2021 17:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221787.383665; Thu, 04 Nov 2021 17:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1migB4-0003ci-2O; Thu, 04 Nov 2021 17:05:26 +0000
Received: by outflank-mailman (input) for mailman id 221787;
 Thu, 04 Nov 2021 17:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YH1c=PX=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1migB2-0003cc-0z
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 17:05:24 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 657fc3fd-3d91-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 18:05:22 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id d3so9669577wrh.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 10:05:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm8889088wml.15.2021.11.04.10.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 10:05:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 291B41FF96;
 Thu,  4 Nov 2021 17:05:20 +0000 (GMT)
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
X-Inumbo-ID: 657fc3fd-3d91-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=uf/69JMRSf6nvg4vi7HqiYdJdQ1piecLXhyNR54I664=;
        b=ZHg6a2NvEWc+jgEYLtdVPsBca/hJ4fFNLotBYVfhS/4SCEJ6HZwHebVxGnJ1ChdybS
         60TL3/B/4fXQ7VMyq0ydqN7e26Iux5ahjghgF7EUEDNtBnjaYq+0F4M9Zdkc6yu+YUlm
         hlJnvYaYxJenw+Bow4Ro81qP5QLXDHTNdnyZB+yiXx2oGyr2rdq71JQ0spN3fT/WaGUp
         YwN2aw37DqGQ+ROFpiO/EI+MAA2hwRdTo1aIrroZ4zDZgq62Vnsa/Ee8gPFqEQCUAzqV
         VzXtdSivJxN6gxo+wSzFEjNJ/kySGJcEPJ3ChPbTJR/NQ5qKTAyW2nt+kZBLtApbhqYB
         Z2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=uf/69JMRSf6nvg4vi7HqiYdJdQ1piecLXhyNR54I664=;
        b=vBuzYQp6jry1+8WVeyLM2K/vc3S+8u1qtZECKIVTRdBCqZ2mBLRnIsoPYD6Nyzvwcz
         1L7GtwwX8gKQEWXltY9C7CEWd+TJ6EW9XSjpfWTQbZIuphE5OZRapHY0QK8tZpaxuo/9
         st6WlSWn6xuSsMoZAhteX7fauqrloqwKvkXvERI6/iHP7eLnP9cZ20BqJ+cRBRjRJ3vF
         hAcZCTV9xIRm9Z/pl0SfvS1jpJLO3P73hiwysAUApvyCDLQGamsp3ckCNm4sdciffJ9j
         s+l+D0XrqcqQH6c7J6KiOHaQvC+Dk2bePq1TZXoTD0c/mIC+FuAV749vUBmRRJOvRuRJ
         t6Ug==
X-Gm-Message-State: AOAM5311zwDz8jiJzSW16p4XNfgGVilAlPAF7YJkR/Aantj8cNyWBWvL
	IPGNplIiLeYBJyjF2h12P5YgIQ==
X-Google-Smtp-Source: ABdhPJw6UUxjbOP6KaaRre3cxTc/H9m+fkuNt/okM7p6s4Wjf1ncL4dX7zALbraAx4E/Z8k9/+/RMg==
X-Received: by 2002:adf:e109:: with SMTP id t9mr33372725wrz.387.1636045522048;
        Thu, 04 Nov 2021 10:05:22 -0700 (PDT)
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <871r3vkiok.fsf@linaro.org> <YYQLoR2ussToQjFV@perard>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Kevin Tian
 <kevin.tian@intel.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Connor Davis <connojdavis@gmail.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Tim Deegan <tim@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Doug
 Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Lukasz Hawrylko
 <lukasz.hawrylko@linux.intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
Date: Thu, 04 Nov 2021 16:59:39 +0000
In-reply-to: <YYQLoR2ussToQjFV@perard>
Message-ID: <87k0hnj1gv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Anthony PERARD <anthony.perard@citrix.com> writes:

> On Thu, Nov 04, 2021 at 03:49:36PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Anthony PERARD <anthony.perard@citrix.com> writes:
>>=20
>> > Patch series available in this git branch:
>> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fxe=
nbits.xen.org%2Fgit-http%2Fpeople%2Faperard%2Fxen-unstable.git&amp;data=3D0=
4%7C01%7Canthony.perard%40citrix.com%7C85bb0d32a72542aa9f6108d99fad9607%7C3=
35836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637716390172120458%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;sdata=3DWWS4yPu9%2BJxBkBiM5SBrH7kDtHkUzMGuKSSdPcgEYII%3D&amp;r=
eserved=3D0
>> > br.build-system-xen-v7
>> >
>> > v7:
>> >     Out-of-tree build!
>> >
>> >     This mean many more patches. Everything after patch 27 is new.
>> >
>> >     There's a few new patch before that, but otherwise are rework of
>> >     v6.
>>=20
>> This is something I've been looking forward to but obviously my QEMU
>> focused mind meant I did it wrong. Generally I create a builds subdir in
>> my tree with subdirs for each build flavour. So with:
>>=20
>>   /home/alex/lsrc/xen/xen.git/builds/native
>>=20
>> And executing:
>>=20
>>   =E2=9E=9C  ../../configure
>
> Thanks for testing, but the patch series only focus on a subset of the
> repository, that is the hypervisor "xen.git/xen/". The rest of xen.git
> isn't ready for out-of-tree build unfortunately. A lot more work is
> needed.
>
>> In "build: adding out-of-tree support to the xen build" you describe the
>> Linux kernel style which works well where the config can be done after
>> the fact but I wonder if the configure approach is better suited to
>> something that needs a bunch of checks running. Is the configure script
>> pure autoconf? This should work out of the box IIRC.
>
> "xen.git/xen/" does use a build system similar to Linux's, we use
> Linux's Kconfig for example.

Ahh makes more sense in that context ;-)

> For the rest of the repository, it is indeed autoconf for the
> configuration phase. So yes running ./configure would be mostly ok, but
> it doesn't take care of Makefiles at the moment and I found one bug in
> our autoconf macros. Beyond that, our Makefiles aren't ready.
>
> xen.git isn't a single build system, they are several (at least one
> foreach of xen/ stubdom/ tools/)

I wonder if there is any millage in thinking about splitting
repositories and having them as subrepos of the main xen.git?

I can imagine building the core hypervisor as a standalone project is
something that is done a lot at least by developers. In a hypothetical
rust-vmm enabled world for example would you only need the hypervisor
itself if you had an alternate userspace to launch things?

>
> Cheers,


--=20
Alex Benn=C3=A9e

