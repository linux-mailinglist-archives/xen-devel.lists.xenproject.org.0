Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B4D757C57
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565201.883154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkHR-0007Yo-2A; Tue, 18 Jul 2023 12:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565201.883154; Tue, 18 Jul 2023 12:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkHQ-0007WR-UK; Tue, 18 Jul 2023 12:58:16 +0000
Received: by outflank-mailman (input) for mailman id 565201;
 Tue, 18 Jul 2023 12:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rqcw=DE=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLkHP-0007WL-5G
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:58:15 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c17826bc-256a-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 14:58:13 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-991da766865so788030766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 05:58:13 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w21-20020a1709064a1500b00982b204678fsm973598eju.207.2023.07.18.05.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 05:58:13 -0700 (PDT)
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
X-Inumbo-ID: c17826bc-256a-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689685093; x=1692277093;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JjHky2ofynad/3sKJ5swr3/zAEiThMFEONb1eagRRkg=;
        b=Wpbk2MtdA8ZQJ0oEp2ZcZDp6jatDT9ufeHIW0cjaPAfgz+c/hyoM1hxATjnUYgJKQx
         QultYNcPW8kDkywP9IYtv565qMFiz/dEPg4ZjqplUn/m3Ec4zRX1iDwMl6gnTAmQArYj
         VIxvUlM3DMPW51PfsC3Iz8Oz+TuLaCD6EGq/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689685093; x=1692277093;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjHky2ofynad/3sKJ5swr3/zAEiThMFEONb1eagRRkg=;
        b=EJWB+ISL+UcER561+gqx8QnrV1Kn2zoRvfkS1e5vmi+ItflDPoVsco35wviY7A4pbG
         MdW1f55EvDEl/Mt2cLDbA6ZwZgi5sU0AZbrRVGU/yQTy+TdK0yCxcvzvLyhFNT/kX3St
         YOiy9a1m6+L/gQLbJHPNWA24OIFjv528CjpPPrMiD9/mpBS2Br/SIEW7ak3kY0XraxKz
         EUAnPga4qA44V+DxtbTGJpo5QSBuOy4xqGs6YSkkVuUVAbJaYAgNnZQHREk2wDU/v8t0
         D0htE5Oen3eEV7DCU+jRjEzRZRpI4bv6o4quqWrNh57P83DKYn2AnsUFjUFrBaLiSMdk
         mx7A==
X-Gm-Message-State: ABy/qLa40IWUqsuIGmHJnmn5GY10mntrGUvXGff+H+FW44Mr8lyEsOV0
	ARxuswt7KS7Q9w16E0xMKmp2XA==
X-Google-Smtp-Source: APBJJlEB23mbt/Fzr3lLJJEr4A86A+YbcOqE4lW5Ww70jlxewjVo43p2BxgH5NhC1F1epDezQ7SLSg==
X-Received: by 2002:a17:906:e285:b0:98e:1156:1a35 with SMTP id gg5-20020a170906e28500b0098e11561a35mr11747716ejb.74.1689685093350;
        Tue, 18 Jul 2023 05:58:13 -0700 (PDT)
Message-ID: <64b68c65.170a0220.b0fe3.40f1@mx.google.com>
X-Google-Original-Message-ID: <ZLaMY0qTA9XqWrdb@EMEAENGAAD19049.>
Date: Tue, 18 Jul 2023 13:58:11 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/8] Make PDX compression optional
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <7ad1dc72-3b1b-fa7f-8ce4-dd7973c8da93@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ad1dc72-3b1b-fa7f-8ce4-dd7973c8da93@suse.com>

On Tue, Jul 18, 2023 at 11:33:03AM +0200, Jan Beulich wrote:
> On 17.07.2023 18:03, Alejandro Vallejo wrote:
> > Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
> > disable it because the whole codebase performs unconditional
> > compression/decompression operations on addresses. This has the
> > unfortunate side effect that systems without a need for compression still
> > have to pay the performance impact of juggling bits on every pfn<->pdx
> > conversion (this requires reading several global variables). This series
> > attempts to:
> > 
> >   * Leave the state of pdx and pdx compression documented
> >   * Factor out compression so it _can_ be removed through Kconfig
> >   * Make it so compression is disabled on x86 and enabled on both Aarch32
> >     and Aarch64 by default.
> 
> I disagree with this choice of default for x86. To avoid surprising
> downstreams, this should at best be a two-step process: Keep the
> default as Y right now, and switch to N a couple of releases later.
I'm not particularly worried about the default, as that's easy to change
locally for our customers. That said, my .02 on the matter is that it would
be easier to accept (leaving it as Y) if there was some documented case of
the feature being triggered at present on x86. I'd rather turn it off
unless we have strong evidence that it's actually used. Forcing Xen users
to pay the cost of a feature they don't benefit from just feels wrong.

> 
> But that's only the simple / mechanical side. Considering my earlier
> effort to reduce / remove the involved overhead dynamically at
> runtime (which you may or may not be aware of; see [2]),
I wasn't. I'll have a look at the end of the day[3]. Regardless, most of this
series is about containment of compression into known helpers and hopefully
that should be undeniably positive irrespective of how the overhead
reduction is achieved.

> I view a
> compile time choice as less desirable. At the very least I would
> expect some justification towards this build time choice being
> acceptable / reasonable despite the earlier effort towards greater
> flexibility. Only such would be likely to have me merely defer to
> other x86 maintainers, rather than outright objecting.
> 
> Jan
> 
> [2] https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01616.html

I believe the burden of proof is reversed. Features bring complexity, and
complexity increases the chances of introducing bugs. It's the presence of
a feature that ought to be backed by a proof-of-requirement, not its
absence.

As far as data goes, we're aware of several ARM systems with compressible
memory banks, but no publicly available x86 ones. I'm purposefully leaving
RISC-V and PPC out of this equation, as they may or may not require this,
it's something the maintainers of those ports will have to assess in due
time.

Alejandro

[3] Note that I send this email before reading carefully your 2018 series.

