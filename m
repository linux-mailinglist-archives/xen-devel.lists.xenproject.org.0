Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44280939054
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762023.1172114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVthj-0002Fs-TW; Mon, 22 Jul 2024 14:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762023.1172114; Mon, 22 Jul 2024 14:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVthj-0002Cn-Q6; Mon, 22 Jul 2024 14:07:55 +0000
Received: by outflank-mailman (input) for mailman id 762023;
 Mon, 22 Jul 2024 14:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVthh-0002Ch-Q9
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:07:53 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6d60373-4833-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 16:07:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721657266882828.3430265973116;
 Mon, 22 Jul 2024 07:07:46 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-65f7bd30546so31179257b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:07:46 -0700 (PDT)
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
X-Inumbo-ID: c6d60373-4833-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1721657268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IIQiai6P+HMuKKVR5AX/C7TCtd1fASVSNLcUxZft5sh2BR5k9Kylg1o/682zwDjDBm3aBv6KH6bjLj/hx2AUAj5eZDTW2wUz1j5njPOoaa6pUvUdrhiTnIvfL77r2CNKmG9wuxw1dgWIUBhpHyz72zD5gvi9J4hyKvZuhU36Y+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721657268; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ymsslw8WPnqgAd6UT7sCqI7SIkucw0cEeB7ugUBdApM=; 
	b=ApCQno5vcmivAfiD8sXhX4RfzcL77EKkdRU+dz20bAVpSQxP1/ImOxGFvATsXhOz3JJNKPtjXV62CmBg3uX9OHArGlePjGzoavjntiUMYkUN3+T3mMVNcPG9bH/e8fSKTFH7rlS198rNwXVV2Mkul9L5TWzA3guV45yNdy0kwDI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721657268;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ymsslw8WPnqgAd6UT7sCqI7SIkucw0cEeB7ugUBdApM=;
	b=gLov9NtZPvuh66qG5nWg3ZbQWMLszZU6DiP8+bWzN2MwfL5uKjURBYg0GrVqsSMt
	S++N0JO9tw9TEvfiffJqbgEVpF86QqTrMFZkxCVO1PLJ+7LAXj6kJV6F6zrFHdRJRpD
	KpJDxKcdeMTnikkWmZX2pBUeqKYhivuOG/qA5/Ss=
X-Forwarded-Encrypted: i=1; AJvYcCXkIx36ohPxx8KpZsq33yV0BLCG9DAl69xBe8ZZnkL7GQzK71323IwuSgRJCcuyWTedAuLWb5nJyDemmkp748354aI08CU4+V0ZrD5RquE=
X-Gm-Message-State: AOJu0YxxWx60bFI/yr5aWwgp7lOj/f7321FubjlZ2ZquaOYuRkMjoAsZ
	R5/TATyC0vtQ70vqmUg8/5SFSlsIdxed8UwBBHNT0PK78hl3cyK8wEdmjSEWqKSWKrC/XuvbBzL
	QJoRo5KqrVLU062Qrt8ebRjNSwBw=
X-Google-Smtp-Source: AGHT+IFO/SGrOknhxf58enFtsBhDTAqP5/YeeBlHxm/CAr0uCjhgY+POo3Akn93L6ezRo4m6OASjbXwDFJEISGg2ptI=
X-Received: by 2002:a0d:ee41:0:b0:61a:e979:427e with SMTP id
 00721157ae682-666086eabc6mr104980947b3.11.1721657266013; Mon, 22 Jul 2024
 07:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240722112752.4981-1-tamas@tklengyel.com> <9013e512-2710-4492-8e60-8f25ba32bbe6@suse.com>
 <CABfawhmPm18vuqVR6S6K2Rv0nCssUsrY0jgJthVF_y7TuKVx-w@mail.gmail.com> <4d2d38ab-170f-4c98-9908-007adb9da950@suse.com>
In-Reply-To: <4d2d38ab-170f-4c98-9908-007adb9da950@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 22 Jul 2024 10:07:09 -0400
X-Gmail-Original-Message-ID: <CABfawh=pM_6gf7Ad5m_pYhY2JnTW+zOerbGXdtnU6CfbeSrutg@mail.gmail.com>
Message-ID: <CABfawh=pM_6gf7Ad5m_pYhY2JnTW+zOerbGXdtnU6CfbeSrutg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 9:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.07.2024 15:51, Tamas K Lengyel wrote:
> > On Mon, Jul 22, 2024 at 8:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 22.07.2024 13:27, Tamas K Lengyel wrote:
> >>> This target enables integration into oss-fuzz. Changing invalid input=
 return
> >>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also addin=
g the
> >>> missing __wrap_vsnprintf wrapper which is required for successful oss=
-fuzz
> >>> build.
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> ---
> >>> v3: don't include libfuzzer-harness in target 'all' as it requires sp=
ecific cc
> >>
> >> With this, how is it going to be built at all? Only by invoking the sp=
ecial
> >> target "manually" as it seems? Which sets this up for easy bit-rotting=
. I
> >> wonder what others think here ...
> >
> > Yes, by calling make with the specific target. It's not going to
> > bitrot because oss-fuzz will pick up any regression on a daily basis
> > to this target. I assume you would be interested in receiving the
> > fuzzing reports so it would show as a build failure in case something
> > broke it.
>
> Please forgive my lack of knowledge here, but which part of whose
> infrastructure would pick up stuff in a daily basis, and what fuzzing
> reports (I've never seen any, daily or not) are you talking about?
> For now it feels to me as if you're talking of what's possible down
> the road, not what's going to happen from the moment this patch was
> committed in a 2nd try. If so, the gap between both points in time
> may be significant, and hence my bit-rotting concern would still
> apply.

Once these two patches are merged to Xen I'll send my PR to oss-fuzz
to have it pull Xen daily and build this fuzzer and run it on their
infrastructure. It usually takes them less than 24 hours to respond to
PRs, I have added multiple projects there already so the "lag" you
worry about it's not something to worry about.

Having these two patches upstream in Xen is not required by the way, I
could just send these to be upstream to oss-fuzz and have them apply
them after it pulling the xen git repo but it gives more flexibility
to you guys to add additional fuzzers in the future more easily if
these are in your repository because you don't even have to touch
oss-fuzz afterwards.

If you need to learn more about what oss-fuzz is and how it operates
they have a quite nice documentation.

Tamas

