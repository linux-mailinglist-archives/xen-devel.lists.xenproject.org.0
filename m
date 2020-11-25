Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2C2C3ECE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 12:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37575.70005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khshK-00014R-KP; Wed, 25 Nov 2020 11:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37575.70005; Wed, 25 Nov 2020 11:10:54 +0000
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
	id 1khshK-000142-Gi; Wed, 25 Nov 2020 11:10:54 +0000
Received: by outflank-mailman (input) for mailman id 37575;
 Wed, 25 Nov 2020 11:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avq/=E7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1khshI-00013x-RS
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:10:52 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39ff70a9-428c-4d15-800d-96041cc453f7;
 Wed, 25 Nov 2020 11:10:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 64so1482267wra.11
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 03:10:51 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id o21sm4222767wra.40.2020.11.25.03.10.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 03:10:50 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=avq/=E7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1khshI-00013x-RS
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:10:52 +0000
X-Inumbo-ID: 39ff70a9-428c-4d15-800d-96041cc453f7
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39ff70a9-428c-4d15-800d-96041cc453f7;
	Wed, 25 Nov 2020 11:10:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 64so1482267wra.11
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 03:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=dmKA2RThu7LtriVr5PAHJm5iP85nmZOL0pm5muTUb/o=;
        b=SRI70cMGjkYFN7ZDdrlIkeQVwzsSCpC6530HkFenkPTNqDvIPWOPGtvA40nOmjGVpY
         uThNmrmMqL4GPasHZAe2fElGXAoGXQODNiDp+epEPn4j5m6SmdNeuwJ9y5Ze61LM+wRO
         VjsexIzhKmtY2QFJB6wzWlDeZ6/xHVaP3wJFZcrKz75Q/6ejWI8J3uoRpN98tW/RQwgA
         qYzQkbG/tPUxRYK5/TZyS0UDItufUlx08ieGK7rgE7tnlsCXZ64FWKVFwTxTwmDzOvdb
         EwGDrfmg6GArTjSScypR+D9iauycjioeb4B4qGDw5sSMxZ9hCAROMOVm7C3452jZG5S2
         qx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=dmKA2RThu7LtriVr5PAHJm5iP85nmZOL0pm5muTUb/o=;
        b=fNwbtaiLJfp9t+JHO0bs5Hp8koDzcTBaNCiM9ti/k475764I/MbuqVMAufM3e/5UWs
         fPkddTl8Lwj8tGvNuV/JALe9WGDHomEquSE4wBGmya59UrHqBELtfZDcXUOIgk0Siy7n
         COgeJXk9XsLMkGhIW9XQT2fmm0o6qeYqAQwO+XhZGEEqe0AgHlSv0bkOQOJNk1EiSizY
         VVLJl994xX6Pq8J3IQeLgHk0Z7MJuVqbKt3dTWOLpv0y/wAsNGVUkyS4y0YGhVPy2rNc
         wPxd7kuKeW+55jrQ+JAoEFGhBy2IbTa0KHndlY3so1/f6Jh0sZL61YiEzqXHxqm5lESc
         BpMg==
X-Gm-Message-State: AOAM530T6G0D2o4ZJEm5GFOepJYNC5d8IIvq4w/viw4mq5w+846V1jeG
	u4Uu+8FECEdU1PRCnD1M9yQ=
X-Google-Smtp-Source: ABdhPJyuW+D2Qrq/NrFARgKrP5vv9wjX+86e/yUKNZyqwiucT7ptOHa8jz3Cujhb5mux7hA23PaxJQ==
X-Received: by 2002:a5d:44c1:: with SMTP id z1mr3381539wrr.375.1606302650763;
        Wed, 25 Nov 2020 03:10:50 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com. [86.183.162.145])
        by smtp.gmail.com with ESMTPSA id o21sm4222767wra.40.2020.11.25.03.10.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 03:10:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Eslam Elnikety'" <elnikety@amazon.com>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'David Scott'" <dave@recoil.org>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20201124191751.11472-1-paul@xen.org> <20201124191751.11472-2-paul@xen.org> <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
In-Reply-To: <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
Subject: RE: [PATCH v4 1/3] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_disable_fifo, ...
Date: Wed, 25 Nov 2020 11:10:49 -0000
Message-ID: <009001d6c31b$a1eaeef0$e5c0ccd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJXq2EkpgGe9udTl5TsVbT974RgHAIZlAorAcS/UCWot+u0UA==
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 25 November 2020 09:20
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Eslam Elnikety =
<elnikety@amazon.com>; Christian Lindig
> <christian.lindig@citrix.com>; David Scott <dave@recoil.org>; Ian =
Jackson <iwj@xenproject.org>; Wei
> Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George =
Dunlap <george.dunlap@citrix.com>;
> Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; xen-
> devel@lists.xenproject.org
> Subject: Re: [PATCH v4 1/3] domctl: introduce a new domain create =
flag, XEN_DOMCTL_CDF_disable_fifo,
> ...
>=20
> On 24.11.2020 20:17, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ...to control the visibility of the FIFO event channel operations
> > (EVTCHNOP_init_control, EVTCHNOP_expand_array, and =
EVTCHNOP_set_priority) to
> > the guest.
> >
> > These operations were added to the public header in commit =
d2d50c2f308f
> > ("evtchn: add FIFO-based event channel ABI") and the first =
implementation
> > appeared in the two subsequent commits: edc8872aeb4a ("evtchn: =
implement
> > EVTCHNOP_set_priority and add the set_priority hook") and =
88910061ec61
> > ("evtchn: add FIFO-based event channel hypercalls and port ops"). =
Prior to
> > that, a guest issuing those operations would receive a return value =
of
> > -ENOSYS (not implemented) from Xen. Guests aware of the FIFO =
operations but
> > running on an older (pre-4.4) Xen would fall back to using the =
2-level event
> > channel interface upon seeing this return value.
> >
> > Unfortunately the uncontrolable appearance of these new operations =
in Xen 4.4
> > onwards has implications for hibernation of some Linux guests. =
During resume
> > from hibernation, there are two kernels involved: the "boot" kernel =
and the
> > "resume" kernel. The guest boot kernel may default to use FIFO =
operations and
> > instruct Xen via EVTCHNOP_init_control to switch from 2-level to =
FIFO. On the
> > other hand, the resume kernel keeps assuming 2-level, because it was =
hibernated
> > on a version of Xen that did not support the FIFO operations.
>=20
> And the alternative of the boot kernel issuing EVTCHNOP_reset has
> other unwanted consequences. Maybe worth mentioning here, as
> otherwise this would look like the obvious way to return to 2-level
> mode?
>=20
> Also, why can't the boot kernel be instructed to avoid engaging
> FIFO mode?
>=20

Both of those are, of course, viable alternatives if the guest can be =
modified. The problem we need to work around is guest that are already =
out there and cannot be updated.

> > To maintain compatibility it is necessary to make Xen behave as it =
did
> > before the new operations were added and hence the code in this =
patch ensures
> > that, if XEN_DOMCTL_CDF_disable_fifo is set, the FIFO event channel =
operations
> > will again result in -ENOSYS being returned to the guest.
>=20
> Are there indeed dependencies on the precise return value anywhere?
> If so, the generally inappropriate use (do_event_channel_op()'s
> default case really would also need switching) would want a brief
> comment, so it'll be understood by readers that this isn't code to
> derive other code from. If not, -EPERM or -EACCES perhaps?
>=20

The patch, as stated, is reverting behaviour and so the -ENOSYS really =
needs to stay since it is essentially ABI now. I am not aware of guest =
code that will, in fact, die if it sees -EPERM or -EACCES instead but =
there may be such code. The only safe thing to do is to make things look =
like the used to.

> Also, now that we gain a runtime control, do we perhaps also want a
> build time one?

Yes, a Kconfig flag to compile out the code seems like a worthy =
addition. I'll spin up a follow-up patch as soon as I get time.

  Paul

>=20
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
>=20
> Are this order as well as the From: tag above correct? Or
> alternatively, are there actually any pieces left at all from
> Eslam's earlier patch?
>=20
> > v4:
> >  - New in v4
>=20
> (Just as an aside: That's quite interesting for a previously
> standalone patch. I guess that patch was really split, considering
> you've retained Eslam's S-o-b? But perhaps there are different ways
> to look at things ...)
>=20
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
> >  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
> >  #define _XEN_DOMCTL_CDF_nested_virt   6
> >  #define XEN_DOMCTL_CDF_nested_virt    (1U << =
_XEN_DOMCTL_CDF_nested_virt)
> > +#define _XEN_DOMCTL_CDF_disable_fifo  7
> > +#define XEN_DOMCTL_CDF_disable_fifo   (1U << =
_XEN_DOMCTL_CDF_disable_fifo)
>=20
> Despite getting longish, I think this needs "evtchn" somewhere in
> the name. To keep size bounded, maybe XEN_DOMCTL_CDF_no_fifo_evtchn?
>=20
> >  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> > -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> > +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_disable_fifo
>=20
> While not directly related to this patch, I'm puzzled by the
> presence of this constant: I've not been able to find any use of
> it. In particular you did have a need to modify
> sanitise_domain_config().
>=20
> Jan


