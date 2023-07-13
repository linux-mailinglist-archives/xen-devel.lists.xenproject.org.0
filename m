Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD5752A07
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 19:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563338.880525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK0Rv-0001iw-KA; Thu, 13 Jul 2023 17:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563338.880525; Thu, 13 Jul 2023 17:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK0Rv-0001hE-HH; Thu, 13 Jul 2023 17:49:55 +0000
Received: by outflank-mailman (input) for mailman id 563338;
 Thu, 13 Jul 2023 17:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In0U=C7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qK0Ru-0001h8-Dh
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 17:49:54 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab745fb6-21a5-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 19:49:52 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso1797331e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 10:49:52 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a056512015100b004f858249931sm1200091lfo.93.2023.07.13.10.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:49:51 -0700 (PDT)
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
X-Inumbo-ID: ab745fb6-21a5-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689270592; x=1691862592;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkAJ95bWITjQMArIuV8XW+ADF1vl6AjTeXxHvoUW+6o=;
        b=DQe23IVYip4+hUV9RVfYMopeHJtuSymTvwj4iHT3I6VwFW2cpi/6ccZAAyhSAb9O22
         81RtKCyoHq/a5YAKM8tapRRpKz8ufvPhBSG5YGxPGelzL91oXHcMYTeJCw3oyoIIVmUK
         kiL5Q/0FMwerNw4pizdRyrVEA/jVJFiQPkpKC+g7NEb9uOng8OI+uLHdJXjjLdv2d4eN
         5kV4JwPNS/u5BS4ybYoGyMOGomNjr0a8MtiZtkJmhsW647T1EMgfXO5E1hJLNJO7goV8
         1Q59AG/Jul9Mi3rIQY9GL78Oc1uzRQUeXpzcSiWHy5KSUDkyVR/ahDwatdFvtYZVcz1G
         nejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689270592; x=1691862592;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkAJ95bWITjQMArIuV8XW+ADF1vl6AjTeXxHvoUW+6o=;
        b=I7HTnVw/JvvW8DPwPxaTLzjjAhaFE/AECfaUPiEppsLhfGIgrvtLrO2wePUzz9YDLf
         lK2Qyc77Xxs83LE6ZeRVgMAtH+8B8lnQhge6T7f91FEUXjfcIDFz/4+J8VrGaXbtpLQX
         IY9ofpXS3w+RyIwjWp8cPiSPTwn1Hv/piv8eA1gc8aODHQzV6Ey7YoiklqCOaYabf6ye
         /Xp4CVbAderY3MZz6Vv/kzL/etwo5dqb1BEjDLbddamc0SmE8RS/s6vgNpfcTzFhH+oZ
         802cKIlHuH1KRVGnc71N26JvBAr5cAqBSrTm6ptd917Zallbvcr9dgAlRFw32mgRH2El
         pcJw==
X-Gm-Message-State: ABy/qLYeM63qsax+MMd11mIpkjrY3nUGyHBuCf8VQorGq0RVYQfcPB1y
	SaEjSfPQY/zl1obGXeu0/e8=
X-Google-Smtp-Source: APBJJlE4iIixE04N+uFeZYFhfUHi+rJmQRq248BG/D+sRpK1LZuoNlqdR8zJ4ujVJHabf4eCZ0R9AA==
X-Received: by 2002:ac2:5f01:0:b0:4f9:567a:7a62 with SMTP id 1-20020ac25f01000000b004f9567a7a62mr1529986lfq.21.1689270592044;
        Thu, 13 Jul 2023 10:49:52 -0700 (PDT)
Message-ID: <9415dc2fe8c8ca0325ba6dfe41fdf72cb0f2ea0a.camel@gmail.com>
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, Julien Grall
 <julien@xen.org>
Date: Thu, 13 Jul 2023 20:49:51 +0300
In-Reply-To: <200693a2-267d-16c8-61f3-3047dc8967da@suse.com>
References: 
	<cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
	 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
	 <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
	 <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
	 <83f67337cb69fb8cf2aa5d56b8a711384cdaa5f0.camel@gmail.com>
	 <200693a2-267d-16c8-61f3-3047dc8967da@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-13 at 16:26 +0200, Jan Beulich wrote:
> On 13.07.2023 15:36, Oleksii wrote:
> > On Thu, 2023-07-13 at 15:27 +0200, Jan Beulich wrote:
> > > I don't understand. My earlier comment was affecting all checks
> > > of
> > > uart->irq alike, as I'm unconvinced IRQ0 may not possibly be
> > > usable
> > > on some architecture / platform. IOW I don't see why the check in
> > > ns16550_init_postirq() would allow us any leeway.
> > It looks like I misunderstood you.
> >=20
> > Do you mean that on some architecture IRQ0 may be used for ns16550?
>=20
> Yes, I don't see why this shouldn't be possible in principle. As
> Julien
> said it can't happen on Arm, so if it also can't happen on RISC-V and
> PPC, we could elect to continue to ignore that aspect.
>=20
Then for RISC-V ( at least, for PLIC interrupt controller ) it is
reserved:
https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interr=
upt-identifiers-ids

What about to have 'define NO_IRQ_POLL 0' ( mentioned by Julien )+
assert(irq_from_device_tree !=3D NO_IRQ_POLL) ?

~ Oleksii

