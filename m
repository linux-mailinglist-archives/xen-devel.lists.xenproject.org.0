Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF64E413D57
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 00:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191956.342129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSnvQ-0003Hs-Hw; Tue, 21 Sep 2021 22:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191956.342129; Tue, 21 Sep 2021 22:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSnvQ-0003F1-Ei; Tue, 21 Sep 2021 22:07:40 +0000
Received: by outflank-mailman (input) for mailman id 191956;
 Tue, 21 Sep 2021 22:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zi6V=OL=google.com=jwerner@srs-us1.protection.inumbo.net>)
 id 1mSnvP-0003Ev-3w
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 22:07:39 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 517d7eb2-9cc8-4622-8457-8ef37eae907c;
 Tue, 21 Sep 2021 22:07:38 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id bk29so2515013qkb.8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 15:07:38 -0700 (PDT)
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
X-Inumbo-ID: 517d7eb2-9cc8-4622-8457-8ef37eae907c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dmNoREXEsTQk/U8Gj8hxJgkwpIFQVacQIWPFX9WwIhE=;
        b=BmvKqba0wk3fHOJkzodZkWkwcRiEGryCgimWoPwoR/3fuUIA+dSginnReDiVPyee7m
         d0wKi27PG+BRcSjcBjJGq+L+WHKcqjtrvpWTSmYtPhmc8evGnsfH/85hixjGh0cAWjdh
         GtyZsqwLpWRGBoTJ8GV2gLHI8D56ItDf8ldGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmNoREXEsTQk/U8Gj8hxJgkwpIFQVacQIWPFX9WwIhE=;
        b=xQkkRV3+3hOtalMUbcoAbrfECQZcuej9GXNClbrTIShzbkPMM9gQl7juBQ6pcVoRpI
         o+50E0CanfV8jqWuEfTrN5vr7Wb+ZG7gc/KiPNJHhM27/PAES92yOo1L/v1swgeK3CVu
         iIVnptONH/07e0qD96AprKJk55/34bHPiGHWKoE2T2pKm2U3H6t0GPhhMInOolCrtTrp
         cB6S34hhutfeN8tgvta7vVEQLfOqdlrukNVOlcZFucxS/0QN3PV1cyZACc0SiCssLbqZ
         jmqywOAnaJwFit8gEaEETYNRq8akCi3D04HnpO8R+kXFb81x1iH10BgUfBFpAqWeTktG
         QSVw==
X-Gm-Message-State: AOAM533XSghzURlH7AL33BoBXbaFU+FY7f/kdlzSsYl+L5jT7mWTEsr0
	S4IgLZZl91J9uzITw3/9GArgxpIyMT0TdqmmZmHdww==
X-Google-Smtp-Source: ABdhPJyq8q/2GRWoSd9IVWD2qjnKGMJZedg7wb9//OSKY3U1RobmMvJLmjUnkfW/rF/kZo95fKOmy8XVlElLbOkvjc8=
X-Received: by 2002:a25:afcd:: with SMTP id d13mr41652428ybj.504.1632262057588;
 Tue, 21 Sep 2021 15:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
In-Reply-To: <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 21 Sep 2021 15:07:25 -0700
Message-ID: <CAODwPW-bbHp3Nxbr9VRt0hZMX0xRnwbGb07PS=8uysXEKFs61w@mail.gmail.com>
Subject: Re: [SPECIFICATION RFC v3] The firmware and bootloader log specification
To: Alec Brown <alec.r.brown@oracle.com>
Cc: "coreboot@coreboot.org" <coreboot@coreboot.org>, "grub-devel@gnu.org" <grub-devel@gnu.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>, 
	"trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>, 
	"u-boot@lists.denx.de" <u-boot@lists.denx.de>, "x86@kernel.org" <x86@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Aleksandr Burmashev <alexander.burmashev@oracle.com>, 
	"allen.cryptic@gmail.com" <allen.cryptic@gmail.com>, 
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, 
	"btrotter@gmail.com" <btrotter@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>, 
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, Eric DeVolder <eric.devolder@oracle.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, 
	"frowand.list@gmail.com" <frowand.list@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"hun@n-dimensional.de" <hun@n-dimensional.de>, "james.dutton@gmail.com" <james.dutton@gmail.com>, 
	"javierm@redhat.com" <javierm@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	"jwerner@chromium.org" <jwerner@chromium.org>, Kanth Ghatraju <kanth.ghatraju@oracle.com>, 
	Konrad Wilk <konrad.wilk@oracle.com>, 
	"krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>, "leif@nuviainc.com" <leif@nuviainc.com>, 
	"lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>, "luto@amacapital.net" <luto@amacapital.net>, 
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>, "mjg59@google.com" <mjg59@google.com>, 
	"mtottenh@akamai.com" <mtottenh@akamai.com>, "nico.h@gmx.de" <nico.h@gmx.de>, 
	"phcoder@gmail.com" <phcoder@gmail.com>, "piotr.krol@3mdeb.com" <piotr.krol@3mdeb.com>, 
	"pjones@redhat.com" <pjones@redhat.com>, "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, 
	"rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>, 
	"rdunlap@infradead.org" <rdunlap@infradead.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, 
	Ross Philipson <ross.philipson@oracle.com>, "sjg@chromium.org" <sjg@chromium.org>, 
	"trini@konsulko.com" <trini@konsulko.com>, 
	"tyhicks@linux.microsoft.com" <tyhicks@linux.microsoft.com>, 
	"ulrich.windl@rz.uni-regensburg.de" <ulrich.windl@rz.uni-regensburg.de>, 
	"wvervoorn@eltan.com" <wvervoorn@eltan.com>, "xypron.glpk@gmx.de" <xypron.glpk@gmx.de>, 
	"rharwood@redhat.com" <rharwood@redhat.com>
Content-Type: text/plain; charset="UTF-8"

> Since it doesn't seem possible to have each boot component using the same log
> format, we added a log_format and log_phys_addr fields to give flexibility in
> how logs are stored. An example of a different log format that can be used is
> the cbmem_console log format used by coreboot:

I am not exactly sure how you expect this interoperability you seem to
be suggesting here to work. Are you saying that your bf_log_header can
sometimes point to the bf_log_buffer structure you define, and
sometimes to a coreboot CBMEM console buffer? But that's a completely
different format that requires a different reader implementation, how
is that supposed to work? If this proposal is just "we define a
wrapper structure that points to everyone's custom firmware log
implementation", then I don't really see the point (the only benefit
still left then might be discovery of the log buffer, but that's the
part you leave open in your design while all those other
implementations already have working discovery mechanisms of their own
anyway).

For the other structures you have defined, the same feedback that I
think was already mentioned on the last iteration of this thread still
applies: it seems incredibly bloated for a simple firmware logging
mechanism. You have a whooping 24+n bytes of overhead *per line* which
probably comes out to somewhere between 30-50% of total space wasted
on overhead for the average log buffer. I guess there are just
fundamentally different opinions on how featureful a firmware log
mechanism needs to be so we're probably not gonna find a format that
makes everyone happy here, but at least for the coreboot project I see
little reason for us to implement something like this when we already
have a well-working existing solution with tooling and wideranged
support.

