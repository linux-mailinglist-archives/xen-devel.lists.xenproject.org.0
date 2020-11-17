Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876162B68AF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 16:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29096.58343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2ut-0006sG-T5; Tue, 17 Nov 2020 15:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29096.58343; Tue, 17 Nov 2020 15:29:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2ut-0006rr-PW; Tue, 17 Nov 2020 15:29:11 +0000
Received: by outflank-mailman (input) for mailman id 29096;
 Tue, 17 Nov 2020 15:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lsz4=EX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kf2us-0006rm-Fv
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:29:10 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad4a12b0-990c-4f87-b80e-ad3f99f52387;
 Tue, 17 Nov 2020 15:29:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 23so23561499wrc.8
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 07:29:09 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id v19sm4122033wmj.31.2020.11.17.07.29.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 07:29:07 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lsz4=EX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kf2us-0006rm-Fv
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:29:10 +0000
X-Inumbo-ID: ad4a12b0-990c-4f87-b80e-ad3f99f52387
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ad4a12b0-990c-4f87-b80e-ad3f99f52387;
	Tue, 17 Nov 2020 15:29:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 23so23561499wrc.8
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=yioG4elPx+SggR71YG0KF7MvFUWAj6yyGjSEmCGQ83E=;
        b=oywscOk5oZIBnuX4EaIZV3WBDfwwnjNueXtHJEo6x1TfH3AUMJFES9Ll6ygpJPCKeP
         AIHMqie2XT8NU4TFpPULs0WmzS2KXcBbSMiFKBH+Nnb/Wz+8N+gAkSuKV0pKE5e9PbmB
         uzZzrEYgIrDL6c5M5AhU8WNFBmqJGMiN+JX2YmPvokRBgVzqVymg/RJEyQvzehRqNXAm
         Si7zlZM07wF1wdLy2rXPu/VijmTgafvCGggrHQABT1HwX/7rWqepUY1R1v8uAkI9Xxud
         7DbXIZxih5URybF+6y0jkFafmA/bV9BcOwbXr0+Ivoqk+QZtJlg2oA1f9dHYZ7egNyNv
         tPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=yioG4elPx+SggR71YG0KF7MvFUWAj6yyGjSEmCGQ83E=;
        b=O78sy0DGrSY05ZHaM/fP1CJ52zjiMn+wUgenNFmQ+TykSyfTNQbjNadzgMkYGCj0BQ
         QAReEuhHSYdkdBypu2i1hEbeWAm6IVVPWkwGoJNJH0ciNUv7qO8CMCmAQOnkZVvUhQTN
         4SqHo6XJrdwneJwlvqhs36sx53q0A1yWUu781Kj5J3eHdhvoJm66LgGUP9AYHpbDIBdO
         8SWEqne/r/ihRx7t6nxDPkndz/jkxCFdFhABCwb86YW3JK1FG/1PlyAFlplxRTxUMPOg
         AUjeQFfsfy236/miu4BWsBdDn43gl3+cieeOMzQ7vfblqV+DGmmfFaebrOuyUrKuGIFk
         C9tg==
X-Gm-Message-State: AOAM533YWQSSZDTx2jhFy+tiFdSg4hXc9BWLyoV49cd05f61ymkt/Lvy
	snG2eiFnEqW0GdeZNbdrmzU=
X-Google-Smtp-Source: ABdhPJxziRvO2CxdyVrOBfIHF9KcKpmjwJv00ACoNsPMfK/hKtUN0mb4Vbog2vVPX14W88FjB3RASw==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr33094wrv.87.1605626948528;
        Tue, 17 Nov 2020 07:29:08 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id v19sm4122033wmj.31.2020.11.17.07.29.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 07:29:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-3-git-send-email-olekstysh@gmail.com> <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org> <436143ea-609f-f6c3-4952-19fcf410fe8f@gmail.com> <34133df1-bff2-f4df-00a5-674a2af867fc@gmail.com>
In-Reply-To: <34133df1-bff2-f4df-00a5-674a2af867fc@gmail.com>
Subject: RE: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
Date: Tue, 17 Nov 2020 15:29:06 -0000
Message-ID: <007401d6bcf6$63d3f420$2b7bdc60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAJRJ+K5AatvYagBUPuZ1AIVomhYqmmB2JA=

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 17 November 2020 14:48
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Oleksandr Tyshchenko' =
<oleksandr_tyshchenko@epam.com>; 'Andrew
> Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian Jackson'
> <iwj@xenproject.org>; 'Jan Beulich' <jbeulich@suse.com>; 'Julien =
Grall' <julien@xen.org>; 'Stefano
> Stabellini' <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>; 'Roger =
Pau Monn=C3=A9'
> <roger.pau@citrix.com>; 'Tim Deegan' <tim@xen.org>; 'Julien Grall' =
<julien.grall@arm.com>
> Subject: Re: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature =
common
>=20
>=20
> Hi Paul
>=20

Hi Oleksandr,

> >
> >> The 'legacy' mechanism of mapping magic pages for ioreq servers
> >> should remain x86 specific I think that aspect of the code needs to
> >> remain behind and not get moved into common code. You could do that
> >> in arch specific calls in hvm_ioreq_server_enable/disable() and
> >> hvm_get_ioreq_server_info().
> > Well, if legacy mechanism is not going to be used for other arch and
> > should remain x86 specific, I will try to investigate what should be
> > left in x86 code and rework the series.
> > As a side note, I am afraid, we won't get a 100% code movement =
(which
> > I managed to achieve here) for the next version of this patch as we
> > need arch/x86/hvm/ioreq.c.
>=20
> I am investigating how to split the code in order to leave the =
'legacy'
> mechanism x86 specific and have a few questions. Could you please
> clarify the following:
>=20
> 1. The split of hvm_ioreq_server_enable/disable() is obvious to me, I
> would like to clarify regarding hvm_get_ioreq_server_info().
> Is it close to what you had in mind when suggesting the split of
> hvm_get_ioreq_server_info() or I just need to abstract
> hvm_ioreq_server_map_pages() call only?

I think it is sufficient to just abstract hvm_ioreq_server_map_pages() =
(and return -EOPNOTSUPP in the Arm case).
The buf ioreq port should be common.

> (Not completed and non tested)
>=20
> +/* Called with ioreq_server lock held */
> +int arch_ioreq_server_get_info(struct hvm_ioreq_server *s,
> +                               unsigned long *ioreq_gfn,
> +                               unsigned long *bufioreq_gfn,
> +                               evtchn_port_t *bufioreq_port)
> +{
> +    if ( ioreq_gfn || bufioreq_gfn )
> +    {
> +        int rc =3D hvm_ioreq_server_map_pages(s);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    if ( ioreq_gfn )
> +        *ioreq_gfn =3D gfn_x(s->ioreq.gfn);
> +
> +    if ( HANDLE_BUFIOREQ(s) )
> +    {
> +        if ( bufioreq_gfn )
> +            *bufioreq_gfn =3D gfn_x(s->bufioreq.gfn);
> +
> +        if ( bufioreq_port )
> +            *bufioreq_port =3D s->bufioreq_evtchn;
> +    }
> +
> +    return 0;
> +}
> +
>   int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
>                                 unsigned long *ioreq_gfn,
>                                 unsigned long *bufioreq_gfn,
> @@ -916,26 +954,7 @@ int hvm_get_ioreq_server_info(struct domain *d,
> ioservid_t id,
>       if ( s->emulator !=3D current->domain )
>           goto out;
>=20
> -    if ( ioreq_gfn || bufioreq_gfn )
> -    {
> -        rc =3D hvm_ioreq_server_map_pages(s);
> -        if ( rc )
> -            goto out;
> -    }
> -
> -    if ( ioreq_gfn )
> -        *ioreq_gfn =3D gfn_x(s->ioreq.gfn);
> -
> -    if ( HANDLE_BUFIOREQ(s) )
> -    {
> -        if ( bufioreq_gfn )
> -            *bufioreq_gfn =3D gfn_x(s->bufioreq.gfn);
> -
> -        if ( bufioreq_port )
> -            *bufioreq_port =3D s->bufioreq_evtchn;
> -    }
> -
> -    rc =3D 0;
> +    rc =3D arch_ioreq_server_get_info(s, ioreq_gfn, bufioreq_gfn,
> bufioreq_port);
>=20
>    out:
>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>=20
> 2. If I understand the code correctly, besides of the above-mentioned
> functions the arch specific calls should be in hvm_ioreq_server_init()
> and hvm_ioreq_server_deinit() to actually hide
> "hvm_ioreq_server_unmap_pages" usage from the common code.  I noticed
> that the rollback code in hvm_ioreq_server_init() and the whole
> hvm_ioreq_server_deinit() have a lot in common except an extra =
ASSERT()
> and hvm_ioreq_server_free_pages() call in the latter. My question is
> could we just replace the rollback code by hvm_ioreq_server_deinit()? =
I
> assume an extra hvm_ioreq_server_free_pages() call wouldn't be an =
issue
> here, but I am not sure what to do with the ASSERT, I expect it to be
> triggered at such an early stage (so it probably needs moving out of =
the
> hvm_ioreq_server_deinit() (or dropped?) as well as comment needs
> updating). I am asking, because this way we would get *a single* arch
> hook here which would be arch_ioreq_server_deinit() and remove code
> duplication a bit.

I would arch specific init and deinit, even if one of them does =
nothing... but then I like symmetry :-)

>=20
> Something close to this.
> (Not completed and non tested)
>=20
> @@ -761,18 +771,17 @@ static int hvm_ioreq_server_init(struct
> hvm_ioreq_server *s,
>       return 0;
>=20
>    fail_add:
> -    hvm_ioreq_server_remove_all_vcpus(s);
> -    hvm_ioreq_server_unmap_pages(s);
> -
> -    hvm_ioreq_server_free_rangesets(s);
> -
> -    put_domain(s->emulator);
> +    hvm_ioreq_server_deinit(s);
>       return rc;
>   }
>=20
> +void arch_ioreq_server_deinit(struct hvm_ioreq_server *s)
> +{
> +    hvm_ioreq_server_unmap_pages(s);
> +}
> +
>   static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
>   {
> -    ASSERT(!s->enabled);

I assume this is the ASSERT you're referring to... There's no way we =
should be deinit-ing an enabled server so that should remain in common =
code as is.

  Paul

>       hvm_ioreq_server_remove_all_vcpus(s);
>=20
>       /*
> @@ -784,7 +793,7 @@ static void hvm_ioreq_server_deinit(struct
> hvm_ioreq_server *s)
>        *       the page_info pointer to NULL, meaning the latter will =
do
>        *       nothing.
>        */
> -    hvm_ioreq_server_unmap_pages(s);
> +    arch_ioreq_server_deinit(s);
>       hvm_ioreq_server_free_pages(s);
>=20
>       hvm_ioreq_server_free_rangesets(s);
>=20
>       put_domain(s->emulator);
>=20
>=20
> --
>=20
> Regards,
>=20
> Oleksandr Tyshchenko



