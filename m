Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B88064F3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 03:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648774.1012723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhii-0002Yk-2m; Wed, 06 Dec 2023 02:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648774.1012723; Wed, 06 Dec 2023 02:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhih-0002VT-WE; Wed, 06 Dec 2023 02:33:04 +0000
Received: by outflank-mailman (input) for mailman id 648774;
 Wed, 06 Dec 2023 02:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeUv=HR=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rAhih-0002VN-7n
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 02:33:03 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6c15835-93df-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 03:33:02 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9f9db9567so39535161fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 18:33:02 -0800 (PST)
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
X-Inumbo-ID: c6c15835-93df-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701829981; x=1702434781; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yFY/CoJsVvO4dWfO2zYeWYx277175jFjqd7A9WCGV8=;
        b=E9evVqeBScQBZGJ1MCExxXRJFE4ghc58yrDHJkbqqkA/Sck+vhVJE920A+uV2/9Sbe
         DXl4ZSqgf3x8ecVPu+w+3yc63RBLT+EzYQ6q+iv+nFh2NiybTM1hO50i9ylTscYe87Az
         IPE/LUUYgLxhNVg/AlFYsQeY2TerFfs5flDBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701829981; x=1702434781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yFY/CoJsVvO4dWfO2zYeWYx277175jFjqd7A9WCGV8=;
        b=SBaa9IMIxE96fjV4/6tCXquJu+0eLddWkh9Y4ozeT6pTqS0fMvu1Tg1TXkKYVk4tdB
         hyFVG+CTiALXhQSUsInz/KZp1+gK2aOPsCKtJUWHj6lYqWL8/klusUsjOHDAT3OTaPM0
         3LSuNFvcTU1ucqME5s892aun2IImaTmACh2O6OnenK3vIiqBl4/76OYqpM2TdXRcGdBj
         V8yHF6oFK7C5YMKBrpyI8qxLvPp8DUDN7IaDoT4N1kwf/rm06utGIE6tw1QDtsJG6WuL
         JUluMHg3ZZ7oSUkv1QN3T6sIue26T+mXcBENPKVVGKN2v1tcwTenVeHCVWemVYkyHYX+
         z3bQ==
X-Gm-Message-State: AOJu0YyShWR6+aVgpvzOyulTqMf9LL2I7+fq3bX2XuhXp9alngCQInmu
	eDqh03mXLfNBr2IRl2Q1qiOXk5btlI9Y/UAFiAhchQ==
X-Google-Smtp-Source: AGHT+IEuUo2nM/7UVm4wMVD2vx+tnhajh2TVehjejHF6mKHY/vaY3O/UCovXRZXRKvWUwW1TmQBMKs4VuTsSk8JZh6Y=
X-Received: by 2002:a2e:9f46:0:b0:2c9:ffe8:4c55 with SMTP id
 v6-20020a2e9f46000000b002c9ffe84c55mr114121ljk.24.1701829981238; Tue, 05 Dec
 2023 18:33:01 -0800 (PST)
MIME-Version: 1.0
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com> <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
 <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
In-Reply-To: <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 6 Dec 2023 02:32:50 +0000
Message-ID: <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
Subject: Re: Clang-format configuration discussion - pt 2
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:07=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.12.2023 14:46, Luca Fancellu wrote:
> > In my opinion, I don=E2=80=99t know of any tool that can address all th=
e flexibility the Xen codestyle allows, yet the use of automatic
> > checkers would improve the review time, allow more new contributors to =
approach the community without being put down by
> > the amount of code-style comments,
>
> Since this argument is being repeated: I find it odd. No-one needs to eve=
n
> fear any amount of style comments if they simply follow the written down
> policy plus a tiny bit of common sense. According to my observation, (som=
e)
> newcomers don't even care to look at what is being said about our style.
> It's not like you and I haven't been through this. When I started working
> with GNU toolchain, I had to adopt to their style. When I later started t=
o
> work with Linux, I had to also adopt there. And then for Xen. And all of
> that already past closed source projects I had been working on before.

Most modern languages, including golang (and I think rust) have
built-in style correctors (`go fmt` is go's official one).  If you
haven't worked with an automatic style checker / fixer, you don't know
how much time, hassle, and emotional energy you're saving.  I don't
think I know anyone who, after using one, wants to go back to not
using one any more.

In general, I'm in favor of making changes to our style such that we
can make clang's style checker official.  The only reason I would vote
against it is if one of the style requirements was really intolerable;
but I find that pretty unlikely.

And as I've said before, the main reservation I have going forward
with this discussion is that I can't see clearly what it is that I'm
agreeing to.

 -George

