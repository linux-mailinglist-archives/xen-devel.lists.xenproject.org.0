Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482E2D3E07
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 10:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48044.84986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmvLo-0006x3-QK; Wed, 09 Dec 2020 09:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48044.84986; Wed, 09 Dec 2020 09:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmvLo-0006we-NB; Wed, 09 Dec 2020 09:01:32 +0000
Received: by outflank-mailman (input) for mailman id 48044;
 Wed, 09 Dec 2020 09:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ulx=FN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kmvLm-0006wY-TN
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 09:01:30 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b2c993e-aec7-4513-b805-723463ff5767;
 Wed, 09 Dec 2020 09:01:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i9so849293wrc.4
 for <xen-devel@lists.xenproject.org>; Wed, 09 Dec 2020 01:01:29 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id c10sm313809wrb.92.2020.12.09.01.01.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 01:01:28 -0800 (PST)
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
X-Inumbo-ID: 4b2c993e-aec7-4513-b805-723463ff5767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=lPHsFue/8A1LiIQByTrkFvGuPpPc+9TVRioxM6O/VAg=;
        b=At0H2eMlJtYuHyiwGRn1V5FJ/KqvkdrT8F2HOndQqcQTq4hGXGFgwVDVzvF+hGAzrx
         boUsYoce/SWJgq9WJr3bavv/lvGpANzo2hvIkgRX+or0g3xsQRMmqbRoE03SzPcFtyic
         Uw/FEMyQtHnWihoHd+QjVrtfYjTZwwxflqWzHxRMu8QNRXBY8RDv9iGJ9E9tHudRBLBj
         18w4C37HACVkUD53RQTwmSR2RkBhtbBpu552FhdVVYIRUSxSrmYV4HKYU+P3JIEt/kKP
         ne3PUMDz4XURmWiTdP03phRp2CTDCVoqcZjm2dOW+Yzt9z8PRQwB8HcOs3jkxJDy1tmD
         x+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=lPHsFue/8A1LiIQByTrkFvGuPpPc+9TVRioxM6O/VAg=;
        b=qBRJkgDRNmcSKzM4NFbU6JXMoSgQv+ODCH3SuZZja3PX3OK2/+H+8m8NBuoT+w20IF
         0VXPXY2SHjmNfLruM2ux43SHqiHGi8Z+TC0IJKLroqSewdhDScymJcRBWDEI40iQxoln
         WPTNqzHPLf5/LSVg/c4LUD4xlwqTqSyfx622RihUTFOeDVaulM/ROFHKJ9ppbZD6GsXy
         GoDBLA5f/TaeDUl96fqYV21n6gLAb3VJGOSBGLwtLSSM5mQF8VyvBLPrWCVBN9QBjUph
         drdUcKpNPkGq/hq9BXfWYAAF4MtAPhsqPoQGUm5vRzkC08KbwkVYhw+vQSPPvHqmKbhB
         CzyQ==
X-Gm-Message-State: AOAM5321btbcNFpcalRJTLMrQDyI8ppaQBbyueET2b4nTFcCFJ+M5l6h
	S83R3+gGXQMsw+gxiWc4DbE=
X-Google-Smtp-Source: ABdhPJyBN3Sy+Tpt0p2o3pXIxEp154Y4tLbSJFjl1TU1q0idH9o0QKXV0L3RmcXPQyhNrdCJYd9mpQ==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr1462599wru.291.1607504488891;
        Wed, 09 Dec 2020 01:01:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-18-git-send-email-olekstysh@gmail.com> <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com> <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com> <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com> <0d6c01d6cd9a$666326c0$33297440$@xen.org> <57bfc007-e400-6777-0075-827daa8acf0e@gmail.com>
In-Reply-To: <57bfc007-e400-6777-0075-827daa8acf0e@gmail.com>
Subject: RE: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Wed, 9 Dec 2020 09:01:27 -0000
Message-ID: <0d7201d6ce09$e13dce80$a3b96b80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKk0D4Qme59XF0a0h96d36zIOxDhQIE/k2jAQvf44kCfV5qfQHp2KBNAqVQolsB+TCoJqfxvSbg

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 08 December 2020 20:17
> To: paul@xen.org
> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr Tyshchenko' =
<oleksandr_tyshchenko@epam.com>;
> 'Stefano Stabellini' <sstabellini@kernel.org>; 'Julien Grall' =
<julien@xen.org>; 'Volodymyr Babchuk'
> <Volodymyr_Babchuk@epam.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George Dunlap'
> <george.dunlap@citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Wei =
Liu' <wl@xen.org>; 'Julien Grall'
> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce =
domain_has_ioreq_server()
>=20
>=20
> On 08.12.20 21:43, Paul Durrant wrote:
>=20
> Hi Paul
>=20
> >> -----Original Message-----
> >> From: Oleksandr <olekstysh@gmail.com>
> >> Sent: 08 December 2020 16:57
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>; Stefano
> >> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; =
Volodymyr Babchuk
> >> <Volodymyr_Babchuk@epam.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> >> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Wei =
Liu <wl@xen.org>; Julien Grall
> >> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
> >> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce =
domain_has_ioreq_server()
> >>
> >>
> >> Hi Paul.
> >>
> >>
> >> On 08.12.20 17:33, Oleksandr wrote:
> >>> On 08.12.20 17:11, Jan Beulich wrote:
> >>>
> >>> Hi Jan
> >>>
> >>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> >>>>> --- a/xen/include/xen/ioreq.h
> >>>>> +++ b/xen/include/xen/ioreq.h
> >>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
> >>>>>        uint8_t                bufioreq_handling;
> >>>>>    };
> >>>>>    +/*
> >>>>> + * This should only be used when d =3D=3D current->domain and =
it's not
> >>>>> paused,
> >>>> Is the "not paused" part really relevant here? Besides it being =
rare
> >>>> that the current domain would be paused (if so, it's in the =
process
> >>>> of having all its vCPU-s scheduled out), does this matter at =
all?do
> >>>> any extra actionsdo any extra actions
> >>> No, it isn't relevant, I will drop it.
> >>>
> >>>
> >>>> Apart from this the patch looks okay to me, but I'm not sure it
> >>>> addresses Paul's concerns. Iirc he had suggested to switch back =
to
> >>>> a list if doing a swipe over the entire array is too expensive in
> >>>> this specific case.
> >>> We would like to avoid to do any extra actions in
> >>> leave_hypervisor_to_guest() if possible.
> >>> But not only there, the logic whether we check/set
> >>> mapcache_invalidation variable could be avoided if a domain =
doesn't
> >>> use IOREQ server...
> >>
> >> Are you OK with this patch (common part of it)?
> > How much of a performance benefit is this? The array is small to =
simply counting the non-NULL
> entries should be pretty quick.
> I didn't perform performance measurements on how much this call =
consumes.
> In our system we run three domains. The emulator is in DomD only, so I
> would like to avoid to call vcpu_ioreq_handle_completion() for every
> Dom0/DomU's vCPUs
> if there is no real need to do it.

This is not relevant to the domain that the emulator is running in; it's =
concerning the domains which the emulator is servicing. How many of =
those are there?

> On Arm vcpu_ioreq_handle_completion()
> is called with IRQ enabled, so the call is accompanied with
> corresponding irq_enable/irq_disable.
> These unneeded actions could be avoided by using this simple one-line
> helper...
>=20

The helper may be one line but there is more to the patch than that. I =
still think you could just walk the array in the helper rather than =
keeping a running occupancy count.

  Paul



