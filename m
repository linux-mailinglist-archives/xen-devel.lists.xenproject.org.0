Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91B4456F7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221704.383544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifN6-00013n-Bo; Thu, 04 Nov 2021 16:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221704.383544; Thu, 04 Nov 2021 16:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifN6-00011V-8Z; Thu, 04 Nov 2021 16:13:48 +0000
Received: by outflank-mailman (input) for mailman id 221704;
 Thu, 04 Nov 2021 16:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YH1c=PX=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1mifN5-00011P-3i
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:13:47 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fde72fe-3d8a-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 17:13:46 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so4636764wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 09:13:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q84sm11381522wme.3.2021.11.04.09.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:13:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E88A41FF96;
 Thu,  4 Nov 2021 16:13:43 +0000 (GMT)
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
X-Inumbo-ID: 2fde72fe-3d8a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=QweRTtvGwADMsXTr1xaN3Kxa62JgHzc3jVnoh96Liqg=;
        b=CqCkuoc+TbTnyzP5LV9xx4zuvUP5vKRvx4+lI0AsrJUADBoiiHImcWZTrhZCJCBLwi
         7pDQ70OkhLRrVATjrrF+Q88zaANuotd1Q4AwM99pqW68kRQzAkTfuGPr/9lCaPlO2T+U
         n9K+W6yD0FMmS9VrPwGhpeViqiCYS3sH69dwc7+hwrwOcmKbGGUkeTC/VrMCbNX8dNsa
         nPhQHrMwXw2nvu2vwPzDjujjOVxc8LWSWKa8z8DMRJYra/QTYZHfwVWYBUbPbCPdMCsd
         yQfAuNd22JCnqp4vxY/QXR7g0Xj8ns447Hcd0xaWJO6YP/dWYOp4XN2rGKr6EQ68D26j
         XXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=QweRTtvGwADMsXTr1xaN3Kxa62JgHzc3jVnoh96Liqg=;
        b=fjbYABDZMOtWT92m13RHgJp41MgM3Ae699WkEsNIgMX4SKB1g8c3UWNWXkxVphEsJl
         SJ81/OhJJbiqysJSHZkij458qo9g2Gh2Jd2ZriKMtfIoZ6kzxZqC9Ec2IMbTEi6EYH58
         OA5Yrn6EoYumK0tna+28YaMdQE/YaEeLTnvwNsAuzHIdLQ6phTWCeTzXE3iWs5+LnU4w
         R2KQ+Er/FnFDspCp/X30uJNtJd/qZBZwCBk5MWQo6Lal92RuIiMWhKjJrrWYjaCi7iu5
         eubaXxd+lp7VoIOSBxt89qtXX4SiwriK8StXSLTxu8u0OAlkpBcUfMo8VFJJcgt03nX8
         OPew==
X-Gm-Message-State: AOAM530h/aod3U9/36xS1WoL8SnUYW82LkQNT8eabWAkm6xWU1ThUTgA
	MKhgOrJaq7ymwlkZm2jo2+ZU/A==
X-Google-Smtp-Source: ABdhPJwe00CHw7UMoKWE6I9J9OGWAhW6QOqL4ETWy6bJnlNiej+OHH1jTwx5z/Ofqk+s49nl7oMbWw==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr24179035wmq.148.1636042425632;
        Thu, 04 Nov 2021 09:13:45 -0700 (PDT)
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <871r3vkiok.fsf@linaro.org>
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
Date: Thu, 04 Nov 2021 16:12:24 +0000
In-reply-to: <871r3vkiok.fsf@linaro.org>
Message-ID: <87wnlnj3uw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Anthony PERARD <anthony.perard@citrix.com> writes:
>
>> Patch series available in this git branch:
>> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.buil=
d-system-xen-v7
>>
>> v7:
>>     Out-of-tree build!
>>
>>     This mean many more patches. Everything after patch 27 is new.
>>
>>     There's a few new patch before that, but otherwise are rework of
>>     v6.
>
> This is something I've been looking forward to but obviously my QEMU
> focused mind meant I did it wrong. Generally I create a builds subdir in
> my tree with subdirs for each build flavour. So with:
>
<snip>
>
> In "build: adding out-of-tree support to the xen build" you describe the
> Linux kernel style which works well where the config can be done after
> the fact but I wonder if the configure approach is better suited to
> something that needs a bunch of checks running. Is the configure script
> pure autoconf? This should work out of the box IIRC.

FWIW doing it the make O way:

  =E2=9E=9C  pwd
  /home/alex/lsrc/xen/xen.git
  =F0=9F=95=9916:12:54 alex@zen:xen.git  on =EE=82=A0 review/build-system-v=
7 (AM) [$?]=20
  =E2=9E=9C  make O=3Dbuilds/native/
  make -C xen install
  make[1]: Entering directory '/home/alex/lsrc/xen/xen.git/xen'
  make[2]: Entering directory '/home/alex/lsrc/xen/xen.git/xen/builds/nativ=
e'
  make -f /home/alex/lsrc/xen/xen.git/xen/Rules.mk obj=3Dtools tools/fixdep
  make[3]: Entering directory '/home/alex/lsrc/xen/xen.git/xen/builds/nativ=
e'
  make[3]: Leaving directory '/home/alex/lsrc/xen/xen.git/xen/builds/native'
    GEN     Makefile
  make -f /home/alex/lsrc/xen/xen.git/xen/Rules.mk obj=3Dtools
  make[3]: Entering directory '/home/alex/lsrc/xen/xen.git/xen/builds/nativ=
e'
  make[3]: Leaving directory '/home/alex/lsrc/xen/xen.git/xen/builds/native'
  make -f /home/alex/lsrc/xen/xen.git/xen/Rules.mk obj=3D. include/xen/comp=
ile.h
  make[3]: Entering directory '/home/alex/lsrc/xen/xen.git/xen/builds/nativ=
e'
    BANNER  .banner
  error: could not load font /home/alex/lsrc/xen/xen.git/xen/tools/xen.flf
  make[3]: *** [/home/alex/lsrc/xen/xen.git/xen/./build.mk:12: .banner] Err=
or 255
  make[3]: Leaving directory '/home/alex/lsrc/xen/xen.git/xen/builds/native'
  make[2]: *** [/home/alex/lsrc/xen/xen.git/xen/Makefile:539: xen] Error 2
  make[2]: Leaving directory '/home/alex/lsrc/xen/xen.git/xen/builds/native'
  make[1]: *** [Makefile:176: __sub-make] Error 2
  make[1]: Leaving directory '/home/alex/lsrc/xen/xen.git/xen'
  make: *** [Makefile:136: install-xen] Error 2

which is odd because I have a "apt build-dep xen" and figlet installed
on this system.

--=20
Alex Benn=C3=A9e

