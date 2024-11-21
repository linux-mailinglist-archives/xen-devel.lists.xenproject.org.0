Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC19D4C3B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841444.1256931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5gR-0004KL-Iw; Thu, 21 Nov 2024 11:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841444.1256931; Thu, 21 Nov 2024 11:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5gR-0004I2-GN; Thu, 21 Nov 2024 11:49:15 +0000
Received: by outflank-mailman (input) for mailman id 841444;
 Thu, 21 Nov 2024 11:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/nFy=SQ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tE5gP-0004Hw-HJ
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:49:13 +0000
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [2607:f8b0:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de1a8f4-a7fe-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 12:49:09 +0100 (CET)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a761a622dcso2841275ab.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:49:09 -0800 (PST)
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
X-Inumbo-ID: 9de1a8f4-a7fe-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1pbDEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkZTFhOGY0LWE3ZmUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg5NzQ5LjM3Njg0Mywic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732189748; x=1732794548; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipCwza2qpCe31GGwzVZrk29THAAWEinyR8NnYO4Dmxc=;
        b=MO95ZruSHgtbz0Z6CJsL2TQD2mitvqmd92wKphIbwq3VhhEztwRxgITxCeFMuVOSxQ
         en4fvGOBM2bS+v84TVrb0ukhSE+kC/p5NjMS/axTXy2kWh5224p+jlkQwrRDfWoTFCux
         Qkyj66rzsAMckKR58x+h4lxg6cwsDGQrC5t9wqHNfQQwlxQFeTZvQa3SWh4R1Z2WWWCJ
         xSgk7n2ojgZMZOu7XgiFARWeaIjk43eABK5qfUpTD/6b9JMC2uhHucD5Qx5auWDRx1eL
         XYOvCZKEYGiB99sHRKKIshtAyiRa3jyTe0nwmFSYmBjMQP+zUhKBYoIm7qAVT4k9w/Pz
         HtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732189748; x=1732794548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipCwza2qpCe31GGwzVZrk29THAAWEinyR8NnYO4Dmxc=;
        b=EodjN3zNNTeo64PGIzfiIcRNV5Dml98qlzurTcrV5juIgFrzY9+5eleljktRjNLIU6
         fdjq2RUwzG4CdvMFeiZpCNG2ZEimGTZUvt1titDO2C7E/6k0Kg2stjXr9MX1LmJQ+V7m
         TRqBl9IUnM3krO9zyFj6lOGog9r32B4hBQxQSeOqnZH+jZtVd9AsVdE75nNU9fDXv4nG
         I/TPoSgXZqGRTdeYTTfrwDg32ysATVSwpnPF278Z3ylvU4wpThzQeOjRFMf9QoW2Jpi4
         PqyD2cFpSmw+ws3KHJ+Q/STligs2shqoTBZjLIccMxfa+O6Pnm3oDdt1V14h7bJdgBsK
         nKGg==
X-Gm-Message-State: AOJu0YwjkaUjqOCdGgKqhtiEQKFBeeanTB2BD+2xMDsx3hplVHS++nEd
	FblM1WUajmtB677q9HTQW2Y2kd6y9O+XGUCLugWnt8E/MC2c5+zp93tghzu3yvfzyUWzYNH5it0
	qPdeONBuse+V+TTrY6SIX+vrho87FO0lSvU9wtPowzL2pzdTXjvI=
X-Google-Smtp-Source: AGHT+IE2HvsIccc5b6QfpoJ1zxeNHfDiLtHmVBC/xsBgnBkpVtZ7uwQGgK+JwJEE+LkuAq+oYGeZDKbgR4ka8rZ3how=
X-Received: by 2002:a05:6602:3c5:b0:82c:e4e1:2e99 with SMTP id
 ca18e2360f4ac-83eb6043957mr706380339f.11.1732189748266; Thu, 21 Nov 2024
 03:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-7-carlo.nonato@minervasys.tech> <Zz4NdBcbMLx3HywA@l14>
In-Reply-To: <Zz4NdBcbMLx3HywA@l14>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Nov 2024 12:48:56 +0100
Message-ID: <CAG+AhRVUr=8ZjAM98RSoDxeu15GktsykJoE2rmyCM7-s5yL5hA@mail.gmail.com>
Subject: Re: [PATCH v10 06/12] tools: add support for cache coloring configuration
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anthony,

On Wed, Nov 20, 2024 at 5:25=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> Hi Carlo,
>
> On Tue, Nov 19, 2024 at 03:13:23PM +0100, Carlo Nonato wrote:
> > diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> > index e3538ec0ba..4ed339e6e4 100644
> > --- a/tools/libs/ctrl/xc_domain.c
> > +++ b/tools/libs/ctrl/xc_domain.c
> > @@ -2195,6 +2195,41 @@ int xc_domain_soft_reset(xc_interface *xch,
> >      domctl.domain =3D domid;
> >      return do_domctl(xch, &domctl);
> >  }
> > +
> > +int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
> > +                             const unsigned int *llc_colors,
>
> The hypercall seems to take a buffer of `uint32_t` for `llc_colors`, but
> the parameter of the function is `unsigned int` instead, is there any
> reason for them to be different?

I don't remember anymore, but I think it should be uint32_t also for the
parameter.

> > +                             unsigned int num_llc_colors)
> > +{
> > +    struct xen_domctl domctl =3D {};
> > +    DECLARE_HYPERCALL_BUFFER(uint32_t, local);
> > +    int ret =3D -1;
> > +
> > +    if ( num_llc_colors )
> > +    {
> > +        size_t bytes =3D sizeof(uint32_t) * num_llc_colors;
> > +
> > +        local =3D xc_hypercall_buffer_alloc(xch, local, bytes);
> > +        if ( local =3D=3D NULL )
> > +        {
> > +            PERROR("Could not allocate LLC colors for set_llc_colors")=
;
> > +            ret =3D -ENOMEM;
>
> I think we are supposed to return -1 in case of error, see:
>     https://elixir.bootlin.com/xen/v4.19.0/source/tools/include/xenctrl.h=
#L101
>
> And there's nothing else to do, xc_hypercall_buffer_alloc() should
> already have set `errno`, and PERROR() preserves it.

You're right.

>> > +            goto out;
> > +        }
>
> Thanks,
>
> --
>
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
> web: https://vates.tech

(answering the other mail)

On Wed, Nov 20, 2024 at 5:48=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Tue, Nov 19, 2024 at 03:13:23PM +0100, Carlo Nonato wrote:
> >  tools/libs/light/libxl_types.idl |  1 +
>
> An other thing I've completely forgot, with this IDL changed there will
> be a need to regen some other files in the repo, namely:
>     tools/golang/xenlight/helpers.gen.go
>     tools/golang/xenlight/types.gen.go
>
> Running this following command should be enough, even if you don't have
> golang installed.
>
>     make -C tools/golang/xenlight helpers.gen.go types.gen.go
>
> If you send an update of the patch series, it would be nice to include
> the regenerated files.

Yes, will do that.

> Cheers,
>
> --
>
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

 Thanks.

- Carlo

