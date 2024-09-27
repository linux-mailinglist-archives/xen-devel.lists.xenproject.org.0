Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4EA988674
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 15:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806308.1217627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suBET-0007jk-1E; Fri, 27 Sep 2024 13:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806308.1217627; Fri, 27 Sep 2024 13:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suBES-0007iq-Tw; Fri, 27 Sep 2024 13:42:04 +0000
Received: by outflank-mailman (input) for mailman id 806308;
 Fri, 27 Sep 2024 13:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwNM=QZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1suBER-0007iO-AO
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 13:42:03 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4606b2b3-7cd6-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 15:42:01 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso3435466e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 06:42:01 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b597sm135337966b.182.2024.09.27.06.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 06:42:00 -0700 (PDT)
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
X-Inumbo-ID: 4606b2b3-7cd6-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727444521; x=1728049321; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f26XmJj9gML/SYEjX6ZIUr+GPPae7URZGC5PMxdlxAA=;
        b=F6Ljt2uIauY8SmwxSwXN8MkcMiWUJB8NC+g2ekO7Etk1tWGmoRo0DOVC91LcF6vTDL
         6iJ3au9ga4FsH052W3txTaR1pJboVhBHVxCO/4hbDs1KLenmXt6JjapkT/XfspY45mL8
         3qrDfsidkmjMnVB/2GlccVvqQiASfXxNVKOYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444521; x=1728049321;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f26XmJj9gML/SYEjX6ZIUr+GPPae7URZGC5PMxdlxAA=;
        b=javSWJMyYUTyyBxAvZdvK15fNmKReQHLkyKAq33z225lTWvoGo2BVKmjJCjNu5ZZiz
         Y8OJVePVp4OLpF1h+OWsPkO+IDjWtBrdf2kc0VDCGBaDcFi/TDjPA9tGlXTWGgue2oYg
         sHY39R1er9TIGWWVIf4EEd3r53wMTgbZyXP2xpscKvXyMpfCH6a9EV3HtbOO1QqV2Nho
         QLzfANafoRBTpQtCjOVgoCrZIbULFtaJlHILmyXgWfUOG/vFy6GVNkvc4Od31K8uc31x
         Sq2tEBrwAwquWpzJYDFKlUG8gL3GjTVxThyck6yZs6zPVN0at8g+EnDHTwWXE5nqwkFE
         72GQ==
X-Gm-Message-State: AOJu0Yw5smx2TUYyWNGWCa91kUK21cJXGfvfn9n1GWje7XEerXpRTSZb
	nNBG8MrXjIu0xYG526aUYrW61PqbfS4XdSz9Z0a7gE0KVf6lfs0ClTXLg8e9Kh0=
X-Google-Smtp-Source: AGHT+IFQ7T8HHvfs1W70TUxSram9SHUHC6FsR1eF/kPC6Njnw8FlQRWdvyEyDbHzQWGVyhxqIySG5Q==
X-Received: by 2002:a05:6512:3d93:b0:533:4620:ebec with SMTP id 2adb3069b0e04-5389fc343aamr3518201e87.3.1727444520596;
        Fri, 27 Sep 2024 06:42:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Sep 2024 14:41:59 +0100
Message-Id: <D4H3Z4UMFKJC.1EGSCJI855I5X@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
 <Zu2Cyan46VVs2oef@macbook.local> <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
 <4fbfcaf2-f317-4b4f-9655-0f0c9e1e453b@suse.com>
 <30c4303c-81a3-4507-80b5-08b1dbda6104@citrix.com>
In-Reply-To: <30c4303c-81a3-4507-80b5-08b1dbda6104@citrix.com>

Hi,

On Tue Sep 24, 2024 at 7:36 PM BST, Andrew Cooper wrote:
> On 23/09/2024 2:03 pm, Jan Beulich wrote:
> > On 23.09.2024 12:14, Alejandro Vallejo wrote:
> >> On Fri Sep 20, 2024 at 3:12 PM BST, Roger Pau Monn=C3=A9 wrote:
> >>> On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
> >>>> Moves sti directly after the cr2 read and immediately after the #PF
> >>>> handler.
> >>> I think you need to add some context about why this is needed, iow:
> >>> avoid corrupting %cr2 if a nested 3PF happens.
> >> I can send a v3 with:
> >>
> >> ```
> >>   Hitting a page fault clobbers %cr2, so if a page fault is handled wh=
ile
> >>   handling a previous page fault then %cr2 will hold the address of th=
e latter
> >>   fault rather than the former. This patch makes the page fault path d=
elay
> >>   re-enabling IRQs until %cr2 has been read in order to ensure it stay=
s
> >>   consistent.
> > And under what conditions would we experience #PF while already process=
ing
> > an earlier #PF? If an interrupt kicks in, that's not supposed to by rai=
sing
> > any #PF itself. Which isn't to say that the change isn't worthwhile to =
make,
> > but it would be nice if it was explicit whether there are active issues=
, or
> > whether this is merely to be on the safe side going forward.
>
> My understanding is that this came from code inspection, not an active
> issue.

That's right. I merely eyeballed it while going through the interrupt dispa=
tch
sequence. This is not a bugfix as much as simply being cautious.

>
> The same is true for %dr6 and #DB, and MSR_XFD_ERR and #NM.
>
> I think we can safely agree to veto the use of AMX in the #NM handler,

Agree.

> and IST exceptions don't re-enable interrupts[1], so #PF is the only
> problem case.
>
> Debug keys happen off the back of plain IRQs, and we can get #PF when

Could you elaborate here on debug keys? Not sure I understand what you mean=
.

> interrogating guest stacks.=C2=A0 Also, I'm far from certain we're safe t=
o
> spurious #PF's from updating Xen mappings, so I think there are a bunch
> of risky corner cases that we might be exposed to.
>
> And I really need to find some time to get FRED working...
>
> ~Andrew
>
> [1] We do re-enable interrupts in order to IPI cpu0 for "clean"
> shutdown, and this explodes in our faces if kexec isn't active and we
> crashed in the middle of context switch.=C2=A0 We really need to not need
> irqs-on in order to shut down.

Why do we need them currently in that path? Regardless, shutdowns would be =
the
response to aborts (#MC or #DF) rather than #DB, right?

Cheers,
Alejandro

