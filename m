Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDBC19C377
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 16:00:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK0OQ-0003aO-Ii; Thu, 02 Apr 2020 14:00:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/k1p=5S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jK0OP-0003aD-OS
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 14:00:25 +0000
X-Inumbo-ID: 4c8363fe-74ea-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c8363fe-74ea-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 14:00:24 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i16so4191814edy.11
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=W2kTrHMHuMppasbECZOZguAiR0e+NxgihS++1XiDv7g=;
 b=TphFknNy6nxLV0xivaaVHo+0Jyhy9kl00RM6L+/7jt3zrflqOMGBzeeZ+Kx6Ihvex1
 Y85Dmx+MR/UkkL34WFHIB9kn7uNxCXDo/GfBVKnGAtW+5/4m4cHNkFBxuWczlj94dB5l
 jPs1dUaMzyRopQBbDp7UWqvU+Qi9Mr+ZVTi61R1RoeDmOpuR4vW4+4Kc+CVrc1IbcZiV
 rfst84bCnqPEe1ALQsMNoQRu6S3qshvWVehLE8huhjM3BN8w/wkEOLUyPcokc06DnUP4
 AGkklANJVJGEjmBf8j/m6rJw8b387GVJyOrxibPg9pA374KugrxetwIpCs4brhm1PNUp
 I4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=W2kTrHMHuMppasbECZOZguAiR0e+NxgihS++1XiDv7g=;
 b=q/MD7pplv0OopJFoHuGXsmM/Gwb2MEez0ExsEAHt5OThhly1ceDzkcZPPd44D11qa0
 CLfdb6WqA80vq628ut/fm1bxfgmOUuN3z0eGjH3Eyg9h3xn7kecj21Cib9WHtslIMTim
 RDLCddNIMINXj+n3ElYTBAAt9GUY4V20QlxG7l2lfAu+mHegraTr6xNzmLOTXrgudyfk
 cfCHCpkLOOfOpEjKem/7+Ac+H1Lq60UpxOtLLGYSQmOOiwiYDm7cDnTjv3GfqMe2FNC5
 IvU+i6qJPzR/jtcdH3KOuOSiP9f23m2AkiCXpWsfNj87FsQuY2SfZz/s2o9xenNK3L/L
 e0EA==
X-Gm-Message-State: AGi0PuYKCP7knBcopjtfHLXVfBK3KokbdTba3ZvY70uXX0d4Vn7gocb1
 1mU1LdeMJQzrc19uP53yECA=
X-Google-Smtp-Source: APiQypL0ra1V+qMPn8oRtc/RPtcl5BX+IL0mAnRHvSf6ehY2c8e2+l9conSVekXn8W3G2f8YDQX/aQ==
X-Received: by 2002:aa7:d781:: with SMTP id s1mr3026465edq.108.1585836023603; 
 Thu, 02 Apr 2020 07:00:23 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id dg9sm957745edb.91.2020.04.02.07.00.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 07:00:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <e9b21d59-3a4a-1498-e5f4-45d1420ddbc4@suse.com>
 <001201d608d5$513a7490$f3af5db0$@xen.org>
 <fc7ffa50-5648-f335-02a4-1819d826c193@suse.com>
In-Reply-To: <fc7ffa50-5648-f335-02a4-1819d826c193@suse.com>
Subject: RE: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Thu, 2 Apr 2020 15:00:21 +0100
Message-ID: <001601d608f7$0d6c1620$28444260$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AC9qttvAjHRb6QCo/AsTAJpm8RVqGO5h0A=
Content-Language: en-gb
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 02 April 2020 12:08
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George Dunlap'
> <george.dunlap@citrix.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; =
'Julien Grall'
> <julien@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei =
Liu' <wl@xen.org>
> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 02.04.2020 11:58, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 01 April 2020 15:51
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> >> <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>;
> >> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> >> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
> >>
> >> On 27.03.2020 19:50, Paul Durrant wrote:
> >>> Domain context is state held in the hypervisor that does not come =
under
> >>> the category of 'HVM state' but is instead 'PV state' that is =
common
> >>> between PV guests and enlightened HVM guests (i.e. those that have =
PV
> >>> drivers) such as event channel state, grant entry state, etc.
> >>
> >> Without looking at the patch details yet, I'm having some =
difficulty
> >> understanding how this is going to work in a safe/correct manner. I
> >> suppose for LU the system is in a frozen enough state that
> >> snapshotting and copying state like this is okay, but ...
> >>
> >>> To allow enlightened HVM guests to be migrated without their =
co-operation
> >>> it will be necessary to transfer such state along with the =
domain's
> >>> memory image, architectural state, etc. This framework is =
introduced for
> >>> that purpose.
> >>>
> >>> This patch adds the new public header and the low level =
implementation,
> >>> entered via the domain_save() or domain_load() functions. =
Subsequent
> >>> patches will introduce other parts of the framwork, and code that =
will
> >>> make use of it within the current version of the libxc migration =
stream.
> >>
> >> ... here you suggest (and patch 5 appears to match this) that this
> >> is going to be used even in "normal" migration streams.
> >
> > Well, 'transparent' (or non-cooperative) migration will only work in =
some cases but it definitely
> does work.
> >
> >> All of the
> >> items named are communication vehicles, and hence there are always
> >> two sides that can influence the state. For event channels, the
> >> other side (which isn't paused) or the hardware (for passed through
> >> devices) might signal them, or it (just the former obviously) could
> >> close their end, resulting in a state change also for the domain
> >> being migrated. If this happens after the snapshot was taken, the
> >> state change is lost.
> >
> > Indeed, which is why we *do* rely on co-operation from the other end
> > of the event channels in the migration case. In the initial case it
> > is likely we'll veto transparent migration unless all event channels
> > are connected to either dom0 or Xen.
>=20
> Co-operation for "normal" migration, iirc, consists of tearing down
> and re-establishing everything. There's simply no risk of losing e.g.
> events this way.

No, indeed, everything basically has to be re-established from scratch =
for normal migration. Transparent migration, as it is implemented at the =
moment, does rely on injecting potentially spurious events on resume. I =
think the alternative would be to have the PV backends send an event =
when they re-connect to a shared ring rather than having Xen do it.

>=20
> >> Otoh I'm sure the case was considered, so perhaps I'm simply =
missing
> >> some crucial aspect (which then could do with spelling out in the
> >> description of the cover letter).
> >>
> >
> > Does that need to be explained for a series that is just
> > infrastructure?
>=20
> I think so, yes - this infrastructure is pointless to introduce if
> it doesn't allow fulfilling all requirements. Pointing at the design
> doc (in the cover letter) may be enough if all aspects are covered
> by what's there. I wouldn't have assumed using this infrastructure
> also for co-operative migration to also be mentioned there.

No, I can mention the plan to use it to replace existing libxc migration =
records in the cover letter even though it is stated in the comment for =
patch #5.

>=20
> Considering the situation with event channels (all closed), doing
> what you do for the shared info page is probably going to be fine;
> large parts of it are in a known state (or need re-filling on the
> destination) anyway. What other plans do you have for non-LU
> migration wrt this new infrastructure?

Well, as discussed above, event channels are one, then there's the grant =
table. The downstream code as a record for the wallclock but I think the =
RTC covers that now that added the code to preserve the offset. We also =
have records for vcpu timers and runstate, but I'm not convinced we =
actually need those.

> If the shared info page is
> all that's going to get migrated with its help, I'd wonder whether
> the infrastructure wasn't better conditional upon a LU config
> option, and the shared info migration was left as it is now.
>=20

The shared info is also migrated for HVM guests so it would have meant =
moving the mapping code around anyway, thus it seems sensible to use the =
new domain context for that for PV guests in their normal migration =
stream anyway.

  Paul


