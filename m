Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9082D24FA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 08:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47181.83566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmXnJ-0005CP-HY; Tue, 08 Dec 2020 07:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47181.83566; Tue, 08 Dec 2020 07:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmXnJ-0005C0-EC; Tue, 08 Dec 2020 07:52:21 +0000
Received: by outflank-mailman (input) for mailman id 47181;
 Tue, 08 Dec 2020 07:52:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pB08=FM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kmXnH-0005Bs-Dq
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 07:52:19 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dde8698-dc85-4e0c-964f-960ab3f90309;
 Tue, 08 Dec 2020 07:52:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id x6so11321239wro.11
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 23:52:17 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id b12sm3445244wmj.2.2020.12.07.23.52.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 23:52:16 -0800 (PST)
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
X-Inumbo-ID: 6dde8698-dc85-4e0c-964f-960ab3f90309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=c0UBFw5yYMNiX5sN2M3lE3YG+qyYb4qxjzf2Lw0KATw=;
        b=RuyoaXVF9uIQr0BQs9DGzBxAUTRdmtdQcpko8893W3S9BdEGcTQ3cIywAMZVXVjUNC
         GR8yQ7tZMC5dIoragpOYa5S0kAvaU54fgQGh55+6sinFmqMO2ab4CbUufy6V9fvJqtHr
         FGxwcad0ssgvOoGv/Adnq0wc/7Sz1wONTQRIMfbaOnSoLORVzLKUliWzZTVAB6s10G6F
         lEpgTgImhrI8rECNmpqntK9HwufuUJBZr5H/dnvNyJCa8UW7s6sItDLu34iIxkEL/eCc
         Vv/V9F6bw+0NKXlSS6QLBULPnq/B1CTRSeOnpgNpx2/UZhkzhFC0UhPmI4j/MOB+OzFb
         688Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=c0UBFw5yYMNiX5sN2M3lE3YG+qyYb4qxjzf2Lw0KATw=;
        b=l9GL/TBgbn0LhmxoCUIGSRuh8arSuDD6fSM2J36MQQ9R4MPOYB7K4KMqtfoUpYZx9f
         CJFMKo3ZPWhXskWBhOEeXDToeZ3CuTB9F/00qtQd1Q9L8r1IqD1SjI1niryLQtO4vTGk
         6JwYcNPFhG3n+rD7fHKcSSnQYLCssto26UPz6SZqei4kpJa1XnmDGZoFxtEz6lRok13p
         DfhAIiXKlEBn3uu7V7Z+n9tzyenaQz6YhHGOQZe6Y8Kb6FJ7ekIr4jibCyZN2WDqwokk
         pCAsa9z7tTJ6lSN04q4gDob9m150pkat6EtgcdS4HC8ugK8YM2nXMqYZjaRgcx3AxptY
         zf3A==
X-Gm-Message-State: AOAM530jvYJxUb++zdmGx0ytedlFR0kQqefHHHSc9s/o7dvn/pDcKECK
	g8OdiPxlHc1otCIiyTv/LBk=
X-Google-Smtp-Source: ABdhPJx/g6x0Wvsa4GypNyMWeU+56RTGUsb31eR8SX6yqK2dQH4+la9P1ThHIdbFRZ3MnCEC0UW8NQ==
X-Received: by 2002:a5d:4c8d:: with SMTP id z13mr24840385wrs.248.1607413936874;
        Mon, 07 Dec 2020 23:52:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-12-git-send-email-olekstysh@gmail.com> <742899b6-964b-be75-affc-31342c07133a@suse.com> <d7d867d3-b508-0c6c-191f-264e1e08bf39@gmail.com>
In-Reply-To: <d7d867d3-b508-0c6c-191f-264e1e08bf39@gmail.com>
Subject: RE: [PATCH V3 11/23] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
Date: Tue, 8 Dec 2020 07:52:14 -0000
Message-ID: <0d3c01d6cd37$0c013770$2403a650$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKk0D4Qme59XF0a0h96d36zIOxDhQFXwruAAXaZVD8BqIA2UKgtE7NA

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 07 December 2020 21:00
> To: Jan Beulich <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; =
George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien =
Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian
> <kevin.tian@intel.com>; Julien Grall <julien.grall@arm.com>; =
xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V3 11/23] xen/ioreq: Move x86's =
io_completion/io_req fields to struct vcpu
>=20
>=20
> On 07.12.20 14:32, Jan Beulich wrote:
>=20
> Hi Jan, Paul.
>=20
> > On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> >> --- a/xen/arch/x86/hvm/emulate.c
> >> +++ b/xen/arch/x86/hvm/emulate.c
> >> @@ -142,8 +142,8 @@ void hvmemul_cancel(struct vcpu *v)
> >>   {
> >>       struct hvm_vcpu_io *vio =3D &v->arch.hvm.hvm_io;
> >>
> >> -    vio->io_req.state =3D STATE_IOREQ_NONE;
> >> -    vio->io_completion =3D HVMIO_no_completion;
> >> +    v->io.req.state =3D STATE_IOREQ_NONE;
> >> +    v->io.completion =3D IO_no_completion;
> >>       vio->mmio_cache_count =3D 0;
> >>       vio->mmio_insn_bytes =3D 0;
> >>       vio->mmio_access =3D (struct npfec){};
> >> @@ -159,7 +159,7 @@ static int hvmemul_do_io(
> >>   {
> >>       struct vcpu *curr =3D current;
> >>       struct domain *currd =3D curr->domain;
> >> -    struct hvm_vcpu_io *vio =3D &curr->arch.hvm.hvm_io;
> >> +    struct vcpu_io *vio =3D &curr->io;
> > Taking just these two hunks: "vio" would now stand for two entirely
> > different things. I realize the name is applicable to both, but I
> > wonder if such naming isn't going to risk confusion.Despite being
> > relatively familiar with the involved code, I've been repeatedly
> > unsure what exactly "vio" covers, and needed to go back to the
>=20
>   Good comment... Agree that with the naming scheme in current patch =
the
> code became a little bit confusing to read.
>=20
>=20
> > header. So together with the name possible adjustment mentioned
> > further down, maybe "vcpu_io" also wants it name changed, such that
> > the variable then also could sensibly be named (slightly)
> > differently? struct vcpu_io_state maybe? Or alternatively rename
> > variables of type struct hvm_vcpu_io * to hvio or hio? Otoh the
> > savings aren't very big for just ->io, so maybe better to stick to
> > the prior name with the prior type, and not introduce local
> > variables at all for the new field, like you already have it in the
> > former case?
> I would much prefer the last suggestion which is "not introduce local
> variables at all for the new field" (I admit I was thinking almost the
> same, but haven't chosen this direction).
> But I am OK with any suggestions here. Paul what do you think?
>=20

I personally don't think there is that much risk of confusion. If there =
is a desire to disambiguate though, I would go the route of naming =
hvm_vcpu_io locals 'hvio'.

>=20
> >
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -145,6 +145,21 @@ void evtchn_destroy_final(struct domain *d); =
/* from complete_domain_destroy
> */
> >>
> >>   struct waitqueue_vcpu;
> >>
> >> +enum io_completion {
> >> +    IO_no_completion,
> >> +    IO_mmio_completion,
> >> +    IO_pio_completion,
> >> +#ifdef CONFIG_X86
> >> +    IO_realmode_completion,
> >> +#endif
> >> +};
> > I'm not entirely happy with io_ / IO_ here - they seem a little
> > too generic. How about ioreq_ / IOREQ_ respectively?
>=20
> I am OK, would like to hear Paul's opinion on both questions.
>=20

No, I think the 'IO_' prefix is better. They relate to a field in the =
vcpu_io struct. An alternative might be 'VIO_'...

>=20
> >
> >> +struct vcpu_io {
> >> +    /* I/O request in flight to device model. */
> >> +    enum io_completion   completion;

... in which case, you could also name the enum 'vio_completion'.

  Paul

> >> +    ioreq_t              req;
> >> +};
> >> +


