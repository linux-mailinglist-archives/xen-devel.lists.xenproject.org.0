Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AAD1EB6A0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 09:38:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg1UB-0002dt-1v; Tue, 02 Jun 2020 07:37:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg1U9-0002do-Kv
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 07:37:21 +0000
X-Inumbo-ID: e41d6884-a4a3-11ea-9947-bc764e2007e4
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e41d6884-a4a3-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 07:37:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e1so2278338wrt.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=smgXUEnbUOqCTa7UdLSxwfWpNtvZxyfJM2S+DjegPqs=;
 b=IP4GX8B78/gZwlNy6ZC9Vc9T7B3ANhEu4HwKGSE+KMxBsbGk6NsvIHaVnK6HNQsBWw
 O1VZBaDFjxJbl27Jn7KEuCyGdZ1tCLsYszgPRj+mYMICIRdLwTbIftgdt+80rKfaHwQ/
 dqMX6ddrM16k/bhOHyW3rAMo8ArBPm+Su1UrF1DRwGI/iOKXKaak7vIWtqqSs0347oOS
 RVSN07W4dzpktcSWdiJQAyK5kbqeZtJkOVTYbxt5y1wQAnSssAdepNWwCunM2xHkOtid
 8pPnplg/ZocqUN2wsReOQwOblMtlMA0k/AzZYEbh6V9ZajqngET5jtrCqcwDDBLB/rhU
 dx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=smgXUEnbUOqCTa7UdLSxwfWpNtvZxyfJM2S+DjegPqs=;
 b=oNMZIyMYnsCauAP3wy834o8ooz7pWVo0rvkFzqs8+8T18Kv9sQI2iYR79aRfPPJzOl
 M2QtGK81bwcEiLcaet60/wJUhx+M3xKqQxogV+/so/14ulpzMC8u9QSSuSdSlqw2tEzQ
 SDyG3XyczTY7lO764yRVheZZojsHq6UTwIeQ25YtoD5gr/KChsBJCADA93vRv0XppdAv
 QPONF2Vh77PvPyU+qqCmcdNVtsGcHcfb9J5/V+2/JjKUUDaxnXwPQP2f8o3y2TW4pICV
 OftlIRcPfv/ArZtUI12jU+HuOIIW9g8Bw6dFoUaYScfiRbzBvcfKRWUrJXtMcAyqckq7
 JV4Q==
X-Gm-Message-State: AOAM531lFARcwzvX9HBVVzgZqYP8JxmEWH6WZVjHayHofup9oBSBdl7r
 Kjz1wLoC1O96sTZfj1gHuZQ=
X-Google-Smtp-Source: ABdhPJxzJE9qZ5cOwQ7LBpa2EkvN7bGPuPAWpHmy8ZSFfUUCSUwZje++z7e/gUg9koICqQ9jb0yIqg==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr24777097wrn.284.1591083439864; 
 Tue, 02 Jun 2020 00:37:19 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id a15sm2413742wra.86.2020.06.02.00.37.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 00:37:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas@tklengyel.com>,
 "'George Dunlap'" <George.Dunlap@citrix.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <000c01d63826$6d125900$47370b00$@xen.org>
 <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
 <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
In-Reply-To: <CABfawh=YHA9Lxbto5Qgf_wkSFAR+JxCdWB99iAhCmBgwSwvmVg@mail.gmail.com>
Subject: RE: [PATCH v19 for-4.14 00/13] VM forking
Date: Tue, 2 Jun 2020 08:37:17 +0100
Message-ID: <002401d638b0$a5460f80$efd22e80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLopxTEy5NbImEQwB/v9n5io2F1+gMP6IwmAaxohFACR164haZn9NSQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Julien Grall' <julien@xen.org>, 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Tamas K Lengyel' <tamas.lengyel@intel.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <Andrew.Cooper3@citrix.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Tamas K Lengyel <tamas@tklengyel.com>
> Sent: 01 June 2020 19:38
> To: George Dunlap <George.Dunlap@citrix.com>
> Cc: paul@xen.org; Tamas K Lengyel <tamas.lengyel@intel.com>; xen-devel =
<xen-
> devel@lists.xenproject.org>; Kevin Tian <kevin.tian@intel.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Jun Nakajima <jun.nakajima@intel.com>; Wei =
Liu <wl@xen.org>; Andrew Cooper
> <Andrew.Cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Jan =
Beulich <jbeulich@suse.com>;
> Anthony Perard <anthony.perard@citrix.com>; Julien Grall =
<julien@xen.org>; Roger Pau Monne
> <roger.pau@citrix.com>
> Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
>=20
> On Mon, Jun 1, 2020 at 11:11 AM George Dunlap =
<George.Dunlap@citrix.com> wrote:
> >
> >
> >
> > > On Jun 1, 2020, at 4:07 PM, Paul Durrant <xadimgnik@gmail.com> =
wrote:
> > >
> > >> -----Original Message-----
> > >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On =
Behalf Of Tamas K Lengyel
> > >> Sent: 01 June 2020 14:22
> > >> To: xen-devel@lists.xenproject.org
> > >> Cc: Kevin Tian <kevin.tian@intel.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Tamas K
> Lengyel
> > >> <tamas.lengyel@intel.com>; Jun Nakajima <jun.nakajima@intel.com>; =
Wei Liu <wl@xen.org>; Andrew
> Cooper
> > >> <andrew.cooper3@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; George Dunlap
> > >> <george.dunlap@citrix.com>; Tamas K Lengyel =
<tamas@tklengyel.com>; Jan Beulich
> <jbeulich@suse.com>;
> > >> Anthony PERARD <anthony.perard@citrix.com>; Julien Grall =
<julien@xen.org>; Roger Pau Monn=C3=A9
> > >> <roger.pau@citrix.com>
> > >> Subject: [PATCH v19 for-4.14 00/13] VM forking
> > >
> > > Hi,
> > >
> > >  This series looks to be largely un-acked so, since we are now =
past the freeze date, I don't
> really think it can go into 4.14. Is there a particular reason that =
you think it should be considered?
> >
> > Tamas=E2=80=99 project itself mainly uses libxc and below, as I =
understand; and so getting patches 1 and 2
> in would be an important milestone; both have had R-b=E2=80=99s before =
the feature freeze.  Arguably patches 1
> and 2 are a bug fix.  Patch 1 is missing VMX (or a general x86).
>=20
> Correct. The first two patches going in would decide whether we will
> be able to use the 4.14 release without having to carry out-of-tree
> patches. Although as things stand at the moment regarding all the bugs
> being discovered in 4.13 and 4.14 we will likely still have to
> backport all of these patches to 4.12 by hand.

That sounds like a reasonable justification.

Maintainers/committers, can we please get those patches in a.s.a.p.?

  Paul


