Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16871A08C0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 09:57:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLj6x-0008GO-8T; Tue, 07 Apr 2020 07:57:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xamf=5X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLj6v-0008GJ-Ih
 for xen-devel@lists.xen.org; Tue, 07 Apr 2020 07:57:29 +0000
X-Inumbo-ID: 6cfd839e-78a5-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cfd839e-78a5-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 07:57:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id bd14so2837302edb.10
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2020 00:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Z7YRSb4yLjZs81UPY/uAg5rHoSzHk+7pDkG4BTJpYdw=;
 b=HtdIcLr0ShEMyyTU5DzMnimrhfjHxudent5A2IpjW+WiJbtTwDDPEYPpxtZYZM/yLE
 ivET7vU6doYmqm8VwKni851ibBg6btzi/y3TzVlRPy0tTgiOFvzeysECMxfewIniUbOR
 4OHFV5fn770HzTiwrDBJAJWnZriyP6Za996Xc0aT7gRk32hxPYL8UkAIiVerHWgtj7Zn
 KN1ORToW03VWv8/Ov6UnIjXBdYRs4hO6JHJulNaxfwT1F7DL3ka60GfmoUBfzGt0xOU9
 zMnMUagrm59e33cAAPkO22W3s5iNFNRFQ8Si0jzwDDtFwdcAikMdmNPlPrh+iA2B5XfI
 idFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Z7YRSb4yLjZs81UPY/uAg5rHoSzHk+7pDkG4BTJpYdw=;
 b=JleZq/GDyRCe3s7SBMn6sN4qSMeGMB+5K9A0/aCE/d2OITZmAbdCiOau8AeRgzccvm
 bCXB9n19pSNzgx6msPS8O8YPVLts6RMNGFZg216NItQYMRlu9GuOl5F1TPo3N0ZtxzyY
 z0gOyiyS+LS0w5IoAiXa+8Hgu/bXkeFcN6XxK8ZNKJKcjzAFYcBSNX8X8HmMiPXmpby/
 sJHzNtUt20z4OtPvaH6bJOGlclcrLfPptll+sYfddJ6yhz4EwesAQWnOYBsYiyPDEVYZ
 d0VvjR47QaMfgPSqJq/fklsd5w9YGTa+9UJ+29rvxwj7nUz/r5HLi/Qxc+7GOxZVdk1M
 berw==
X-Gm-Message-State: AGi0PuY0zFyO1xPJG8TuPaj1Ww9WhhOR0Si0wNKaVKUy7/ntZmfK5pgO
 SG+aZha4J3BtHMlPP0ZJlhs=
X-Google-Smtp-Source: APiQypL94iRtfr+RPm3FB+rUuthS5tgF/qEmQ1bC2Jh7dpPTQVTQTUlhSVh9Cpwbm215iPr3O6DcWA==
X-Received: by 2002:a17:907:2148:: with SMTP id
 rk8mr822305ejb.121.1586246247730; 
 Tue, 07 Apr 2020 00:57:27 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id o15sm3172337ejb.71.2020.04.07.00.57.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 00:57:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas.k.lengyel@gmail.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
 <CABfawhn_hw=o5j+G9VfqPK6opytqt=q2-cz4GjNgCTA5zBvNrA@mail.gmail.com>
 <6bb7eb58-01c6-00e4-672e-83d5fcb87ea0@citrix.com>
 <CABfawh=6z-pxgrj1M3JbG-9H=iR78rTwt8+MUf_6-Sd5kqyhdA@mail.gmail.com>
In-Reply-To: <CABfawh=6z-pxgrj1M3JbG-9H=iR78rTwt8+MUf_6-Sd5kqyhdA@mail.gmail.com>
Subject: RE: Live migration and PV device handling
Date: Tue, 7 Apr 2020 08:57:24 +0100
Message-ID: <001701d60cb2$2e1b2050$8a5160f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ9hFEeoa99jEIZ37IjX6uiVjJ3WQHz1sx0Aou5H5YBoD4wYAHAlangpt9WlvA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Anastassios Nanos' <anastassios.nanos@sunlight.io>,
 'Xen-devel' <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Tamas K Lengyel
> Sent: 06 April 2020 18:31
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xen.org>; Anastassios Nanos =
<anastassios.nanos@sunlight.io>
> Subject: Re: Live migration and PV device handling
>=20
> On Mon, Apr 6, 2020 at 11:24 AM Andrew Cooper =
<andrew.cooper3@citrix.com> wrote:
> >
> > On 06/04/2020 18:16, Tamas K Lengyel wrote:
> > > On Fri, Apr 3, 2020 at 6:44 AM Andrew Cooper =
<andrew.cooper3@citrix.com> wrote:
> > >> On 03/04/2020 13:32, Anastassios Nanos wrote:
> > >>> Hi all,
> > >>>
> > >>> I am trying to understand how live-migration happens in xen. I =
am
> > >>> looking in the HVM guest case and I have dug into the relevant =
parts
> > >>> of the toolstack and the hypervisor regarding memory, vCPU =
context
> > >>> etc.
> > >>>
> > >>> In particular, I am interested in how PV device migration =
happens. I
> > >>> assume that the guest is not aware of any suspend/resume =
operations
> > >>> being done
> > >> Sadly, this assumption is not correct.  HVM guests with PV =
drivers
> > >> currently have to be aware in exactly the same way as PV guests.
> > >>
> > >> Work is in progress to try and address this.  See
> > >> =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D775a02452d=
df3a6889690de90b1a94eb29c3c732
> > >> (sorry - for some reason that doc isn't being rendered properly =
in
> > >> https://xenbits.xen.org/docs/ )
> > > That proposal is very interesting - first time it came across my =
radar
> > > - but I dislike the idea that domain IDs need to be preserved for
> > > uncooperative migration to work.
> >
> > The above restriction is necessary to work with existing guests, =
which
> > is an implementation requirement of the folks driving the work.
> >
> > > Ideally I would be able to take
> > > advantage of the same plumbing to perform forking of VMs with PV
> > > drivers where preserving the domain id is impossible since its =
still
> > > in use.
> >
> > We would of course like to make changes to remove the above =
restriction
> > in the longterm.  The problem is that it is not a trivial thing to =
fix.
> > Various things were discussed in Chicago, but I don't recall if any =
of
> > the plans made their way onto xen-devel.
>=20
> Yea I imagine trying to get this to work with existing PV drivers is
> not possible in any other way.

No, as the doc says, the domid forms part of the protocol, hence being =
visible to the guest, and the guest may sample and use the value when =
making certain hypercalls (only some enforce use of DOMID_SELF). Thus =
faking it without risking a guest crash is going to be difficult.

> But if we can update the PV driver code
> such that in the longterm it can work without preserving the domain
> ID, that would be worthwhile.
>=20

I think that ship has sailed. It would probably be simpler and cheaper =
to just get virtio working with Xen.

  Paul



