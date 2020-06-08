Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68D21F267B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 01:43:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiROr-0006Oe-OZ; Mon, 08 Jun 2020 23:41:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YeZs=7V=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jiROq-0006OZ-Dr
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 23:41:52 +0000
X-Inumbo-ID: a02323c4-a9e1-11ea-8496-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a02323c4-a9e1-11ea-8496-bc764e2007e4;
 Mon, 08 Jun 2020 23:41:51 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e12so14874286eds.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0SGT/xqyswMR4HEMWjxUb0fTo55TAfwIiVwxif8Zu+0=;
 b=rNA8+WLhOAWTRCMIA0chx5jqMvaWY6W5/4IGUKOTAM8U0sp5eMCvcNnqwsrkwcmBDA
 fdaetF2roGkSwuKfv1YGXV1mr9pL/15hKuto+wkeJ2Y7e47HOBiXP02VvP+1Utud1FQn
 Xm3VHlxa5vAjI/nt63grfTfKvStpGY5Xk6/jyDpS31doU4YjcrnMlnBQdtrGviDpEhC5
 oFBB0DfdI5Hz1fmOo3q0yup+hTZ05Gzdnl2l/7Q8R2/MFCFKN3d7ydL/Wb18Dz3fXQ+d
 H/SCC0Uz4Tw6u8DhwWSf8JMoUMiph1lcw0MLDHoSVL39yIA59TUTXPgnCotP3ZDGHfpZ
 IheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0SGT/xqyswMR4HEMWjxUb0fTo55TAfwIiVwxif8Zu+0=;
 b=WYD4v+PVmpaqbAswm6nXpYx39ea6YqfoDCxGjh55i1eMBWZnej/xwEXM3xvj6nIKXY
 2m/DSlsSTe5NjpTIu4f7astzQsvuEUM/XsgPpM1cAYJm4cFn8IqZtU0kwODvYMRI/WMB
 95b76x7BksRDpor81DpdYYaROHIvyTHV2mmm1Y+KkdWzMJK86MX3yBL04o05vhxLtEJo
 4wZ0wtzmQBLT0uyIfg2cl9M0rehZ1jgkIY9KNHwFYAZKYv4jaqd4nZbcZVgTEmM7ZfM0
 UbQpr1qw2foqN8QPKJ1GZvUVP5fNZwd/YWyAdzuKwVDhjZNf6cPhK82dGTUtX63lO9Sa
 kxxg==
X-Gm-Message-State: AOAM533mBRaQ2qJJ33eSEEZEKWBCbp6HryZMNRoSs5X+j3fQozploWLT
 Cxqtm543pPYh1FOu8wRToQC1dXOe7pY=
X-Google-Smtp-Source: ABdhPJwqvUYxfCbu/lCjrrmkOCcwPagSyG4Srq6bnZZKR5KLWqjot1/kgDdMRe8fdmCbTgf9c5LxxA==
X-Received: by 2002:a50:f106:: with SMTP id w6mr24462675edl.131.1591659710104; 
 Mon, 08 Jun 2020 16:41:50 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id j31sm13668017edb.12.2020.06.08.16.41.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 16:41:49 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id r7so19315714wro.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 16:41:49 -0700 (PDT)
X-Received: by 2002:a5d:490f:: with SMTP id x15mr1181633wrq.259.1591659708778; 
 Mon, 08 Jun 2020 16:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
 <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
 <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
 <aded2ba0-3a16-bee5-d3e0-98bf5beb068d@bitdefender.com>
 <CABfawh=s6OL54ckemhvjWRQWu_apmV6--L0+bRY9xEQKaPj16Q@mail.gmail.com>
 <fdedc03a-57cf-3899-93d1-db491ecbbc5d@bitdefender.com>
 <CABfawhkU+L0irWg47aoPWW0g6nJSY62Vodwi=mPH7f=tnghKTg@mail.gmail.com>
 <4cd66e91-3c7e-6af6-e789-9cca5109dc18@bitdefender.com>
In-Reply-To: <4cd66e91-3c7e-6af6-e789-9cca5109dc18@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 8 Jun 2020 17:41:12 -0600
X-Gmail-Original-Message-ID: <CABfawhk2tPr93SsP5GzDdduM8eohXP3R-gYUO7JrxM=eY1K26w@mail.gmail.com>
Message-ID: <CABfawhk2tPr93SsP5GzDdduM8eohXP3R-gYUO7JrxM=eY1K26w@mail.gmail.com>
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 5:14 PM Razvan Cojocaru
<rcojocaru@bitdefender.com> wrote:
>
> On 6/9/20 1:50 AM, Tamas K Lengyel wrote:
> > On Mon, Jun 8, 2020 at 3:16 PM Razvan Cojocaru
> > <rcojocaru@bitdefender.com> wrote:
> >> 1. A security application that is unable to _prevent_ things being done
> >> to a system is not doing a very good job, since in that case you can
> >> only collect stats and not veto anything. I would argue that the default
> >> for such a monitoring application should be the current one (all events
> >> should be pre-action).
> >
> > Not all security applications require this though. Malware analysis
> > where stealth is required would absolutely not want this side-effect
> > to be visible to the guest where malware could use it to determine
> > that it's being monitored. So I don't buy into this argument.
>
> Fair enough, in that case having both models supported should be fine.
> I'll leave the rest of that conversation to my colleagues.
>
> >> 2. This is further supported by the fact that that's exactly how the EPT
> >> vm_events work: you get a "I want to write to this page" event _before_
> >> the write occurs. If register writes behave differently, you have _two_
> >> different models: one where you get an event post-action, and one where
> >> you get one pre-action.
> >
> > Whether you get an event before or after the effects of the event have
> > been applied to the system state shouldn't matter as long as you can
> > revert that action. I wouldn't care either way to be the default. But
> > having a default that breaks other use-cases is unacceptable.
>
> You keep saying that as if I disagree. :) But we've already established
> that the potential for a race condition has been found and needs to be
> fixed.
>
> My only (minor) objection has been that a patch fixing the current model
> would have been preferable to one that switches the default as a
> workaround. Still, it's understandable that perhaps there's no time or
> motivation for that.

I've already sent two other patches that make it more manageable to
disable the interface when this feature is used. Your colleagues are
welcome to pick those up or send other fixes that they prefer. As I
don't use this feature I won't be spending more time fixing it then
what I've already spent on it. At this point collectively I probably
spent weeks trying to just track the issue down as it was such an
annoying bug to find.

Tamas

