Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D09886FB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 16:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806318.1217638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suBql-0007Mu-LW; Fri, 27 Sep 2024 14:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806318.1217638; Fri, 27 Sep 2024 14:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suBql-0007LR-I2; Fri, 27 Sep 2024 14:21:39 +0000
Received: by outflank-mailman (input) for mailman id 806318;
 Fri, 27 Sep 2024 14:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwNM=QZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1suBqk-0007LK-C3
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 14:21:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd975e8-7cdb-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 16:21:36 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso314393066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 07:21:36 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5c73sm139909966b.64.2024.09.27.07.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 07:21:35 -0700 (PDT)
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
X-Inumbo-ID: cdd975e8-7cdb-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727446896; x=1728051696; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iE6HZRFMwLwpWvwnQ+3RfYJjs+k5dx+ma14LUH97LNQ=;
        b=I6tVi0fgz0mp4W6gQsM1cWOSp6cHQVz8maXeT3XB9SjZvkiuwnPi533jrnMAc54Bmz
         x9GGYMUuamCuMiECAPqvYITIzIC7ALI2ID5xL/qPh6zWVlbs7UKmT+pKeM4ZV6DW11ok
         1s6Pu+IBPw99npBOMYsvM6kPrXKnDW2hLbLLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727446896; x=1728051696;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iE6HZRFMwLwpWvwnQ+3RfYJjs+k5dx+ma14LUH97LNQ=;
        b=kHkvYRJnko3owLewe3QVYz0zi3WzrP3iZkHGK2QSURlGvcbQ/mGdPruiy8FuBlgq65
         lCoSoYLFNmlZDxGwUNGBeTlSQr9PDzZBOGp1vNos6WzjvU0d5AWUf1htJAt9A8Y7NzlN
         Faf/eloRVLHjVY3W4SmzU3jSVBFzDGRjEAHinfv2e3Y3Ul3XpZzunRv24AhjZPFCZPqB
         nX6GHsc/67HRUht/cDBHDZtFFLEHFbC9ksPcpYnbnWPY0HSTs5xvcCT/YsfRaQyVLydu
         GqsvLPUqVNeCndSQ5hTXedFCJ7FIQ+RiPsPShvRQ8Wq0JrU86alKsXoeFSt4/ba9bRNe
         7NCg==
X-Gm-Message-State: AOJu0YzQHAyfzjb/sJ7QNzwATgivB06t3ZRm/RCIq5Yqs3ZYWWuowJ3p
	6D9LG+tZcXKafmZH5K1RdAwBXMcKjCiOnQjPT/GTCqyYcasngig6oCfiM8NAobk=
X-Google-Smtp-Source: AGHT+IE8wyVYZKHDfqfahpSu0/s+lYiSMNcptNeHYFOYHUfx9Nrl2CJkyHj0ycPok4foM0NKLa7bAQ==
X-Received: by 2002:a17:907:2685:b0:a86:9107:4c2f with SMTP id a640c23a62f3a-a93c4a60c43mr281776166b.41.1727446895995;
        Fri, 27 Sep 2024 07:21:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Sep 2024 15:21:35 +0100
Message-Id: <D4H4TG3ER5U7.3JP6GUHTDXOHM@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
 <Zu2Cyan46VVs2oef@macbook.local> <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
 <4fbfcaf2-f317-4b4f-9655-0f0c9e1e453b@suse.com>
 <30c4303c-81a3-4507-80b5-08b1dbda6104@citrix.com>
 <208589d3-aff2-414b-8bbd-89d0753f346a@suse.com>
In-Reply-To: <208589d3-aff2-414b-8bbd-89d0753f346a@suse.com>

On Wed Sep 25, 2024 at 7:35 AM BST, Jan Beulich wrote:
> On 24.09.2024 20:36, Andrew Cooper wrote:
> > On 23/09/2024 2:03 pm, Jan Beulich wrote:
> >> On 23.09.2024 12:14, Alejandro Vallejo wrote:
> >>> On Fri Sep 20, 2024 at 3:12 PM BST, Roger Pau Monn=C3=A9 wrote:
> >>>> On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
> >>>>> Moves sti directly after the cr2 read and immediately after the #PF
> >>>>> handler.
> >>>> I think you need to add some context about why this is needed, iow:
> >>>> avoid corrupting %cr2 if a nested 3PF happens.
> >>> I can send a v3 with:
> >>>
> >>> ```
> >>>   Hitting a page fault clobbers %cr2, so if a page fault is handled w=
hile
> >>>   handling a previous page fault then %cr2 will hold the address of t=
he latter
> >>>   fault rather than the former. This patch makes the page fault path =
delay
> >>>   re-enabling IRQs until %cr2 has been read in order to ensure it sta=
ys
> >>>   consistent.
> >> And under what conditions would we experience #PF while already proces=
sing
> >> an earlier #PF? If an interrupt kicks in, that's not supposed to by ra=
ising
> >> any #PF itself. Which isn't to say that the change isn't worthwhile to=
 make,
> >> but it would be nice if it was explicit whether there are active issue=
s, or
> >> whether this is merely to be on the safe side going forward.
> >=20
> > My understanding is that this came from code inspection, not an active
> > issue.
> >=20
> > The same is true for %dr6 and #DB, and MSR_XFD_ERR and #NM.
> >=20
> > I think we can safely agree to veto the use of AMX in the #NM handler,
> > and IST exceptions don't re-enable interrupts[1], so #PF is the only
> > problem case.
> >=20
> > Debug keys happen off the back of plain IRQs, and we can get #PF when
> > interrogating guest stacks.
>
> Hmm, yes, this looks like a case that is actively being fixed here. Wants
> mentioning, likely wants a respective Fixes: tag, and then also wants
> backporting.

Sure.

>
> >=C2=A0 Also, I'm far from certain we're safe to
> > spurious #PF's from updating Xen mappings, so I think there are a bunch
> > of risky corner cases that we might be exposed to.
>
> Spurious #PF are possible, but __page_fault_type() explicitly excludes
> the in_irq() case.
>
> Jan

Cheers,
Alejandro

