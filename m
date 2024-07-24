Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE83893B892
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 23:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764519.1174983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjbg-0003yV-SZ; Wed, 24 Jul 2024 21:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764519.1174983; Wed, 24 Jul 2024 21:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjbg-0003x1-Pt; Wed, 24 Jul 2024 21:33:08 +0000
Received: by outflank-mailman (input) for mailman id 764519;
 Wed, 24 Jul 2024 21:33:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqaG=OY=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1sWjbf-0003wr-7E
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 21:33:07 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e9a4332-4a04-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 23:33:03 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-65f880c56b1so2451397b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 14:33:04 -0700 (PDT)
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
X-Inumbo-ID: 4e9a4332-4a04-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721856783; x=1722461583; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydzBqt0vm7s/yvci8xO3NRbVqU0/wVqlaZcSbaQjepE=;
        b=ahzLI2clBlXcXRWAPJUOaVUBfmMpyN2oXBMFMTenx+fFn06LzijKqMRZYcKla52JFc
         p0guK5ZC1B0NXsxHQUgnxN2nNnQ56gwQhP2aCZBb7HOtqwQWzE9GG9oXnoaWDDb6tYCF
         wp5xa9lhnmiBaw63ch2GYZGiNKn4HaR3cET069E+lYNyMgfYi0DIl5rjGU35Hmot79p5
         JmVbQQtjcnjrwUQ6I6Rdbi8UVnP6GAStTpunVjDCythXnxnZG+6VOY4PushsvYaumN/c
         IGBuQmHXKtClOS82QCIpRjGM+2Mng0VPvvxEp0DTidnzf42Matg46HTEt3R4pgSWiU3x
         FLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721856783; x=1722461583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydzBqt0vm7s/yvci8xO3NRbVqU0/wVqlaZcSbaQjepE=;
        b=kp7BToGyBvdnNs5n6CVpx0WlQ/Ql8752USdyYeEeZZb9NgiUH5MiI5UxGFa/8eYeL2
         srYdcCojSgA/yobUl24kroX3q+dXVvi4MZr7diEvA04W9/uy5kVWPErdFcX/Mlor7Anu
         IWzfH5Nh0gR6ZUXGE6StwyEafNm8G3g4xDHgRa37O9RUhEA2oi4ker2Wv5ie0Jt39+c/
         wrLs6CMIcaoZFj5Kr56aaZvvLqoCJaN8uFYwcnxDGuGwJkaflLEw+GRlbROcW5/OSajY
         /FF9J4pR2Wnx+1IM8G40TlzdD2NXFhkekadJdPO2eTUzwI7jLBj7PEPHP+MgZPzTsSeV
         9gyw==
X-Forwarded-Encrypted: i=1; AJvYcCVwRayOpEE0rrIoInoYNoyMJYsOGLFH3XXvi86vLFS9cdL2gf2AzqmF6FH8nIgEBx/3du4bnZU9vX2roLjrSpLfysNXBYapOg8B0tDKobk=
X-Gm-Message-State: AOJu0Yyr6/hnZ7R4Nr1tc/VgHUs7CowQXyBDWD32AmpRIoT/lZygXKZR
	i6D9awbCNaDtPnWL+F6RWKlU215GS6+wO03nRupbLWg0HMwURL5JXbjsNH2maRIXYJAHAf9CxzH
	hxX9Femp2oSh37LMEyFO0jy8tlxg=
X-Google-Smtp-Source: AGHT+IHtKRXsO48gTyT+z5qLoimt36IxCgWKFWvW0BRsZS6nCUtRWXOSMXuDVZMv+onPHmKMTtJZlHTPWxFeEfdDUrc=
X-Received: by 2002:a05:690c:650b:b0:62c:c696:56fd with SMTP id
 00721157ae682-675156e7e81mr9054127b3.38.1721856782719; Wed, 24 Jul 2024
 14:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
 <4468a02f-4d8c-4b94-8af6-cd1751cd0a89@suse.com> <8fa38784-ba85-4675-9fad-39dd97652bb6@amd.com>
 <9be5b78a-211c-4859-a56e-30ab414c99fb@amd.com>
In-Reply-To: <9be5b78a-211c-4859-a56e-30ab414c99fb@amd.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 24 Jul 2024 22:32:26 +0100
Message-ID: <CAF3u54BYkMryxhr45WfJDZP5VUKJuuo0FxLshGg8xeCLm0D7gg@mail.gmail.com>
Subject: Re: [RFC PATCH] automation: add linker symbol name script
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Lira, Victor M" <VictorM.Lira@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com, 
	consulting@bugseng.com, simone.ballarin@bugseng.com, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 24 juil. 2024 =C3=A0 21:56, Jason Andryuk <jason.andryuk@amd.com> a=
 =C3=A9crit :
>
> On 2024-07-24 13:48, Lira, Victor M wrote:
> >
> > On 7/24/2024 12:44 AM, Jan Beulich wrote:
> >> Nit: In names of new files we prefer - over _.
> >> +script_name=3D`basename "$0"`
> > I have fixed the above comments in v2.
> >
> >>> +#!/bin/bash
> >> Can we rely on bash to be there and at that location? As you using any
> >> bash-isms in the script which cannot be avoided?
> >
> > Are the automation scripts required to be portable? Can you please poin=
t
> > me to a resource where I can learn how to make the script portable?
>
> Hi Victor,
>
> You might want to check out `checkbashisms`:
>
> $ checkbashisms
> Usage: checkbashisms [-n] [-f] [-x] [-e] [-l] script ...
>     or: checkbashisms --help
>     or: checkbashisms --version
> This script performs basic checks for the presence of bashisms
> in /bin/sh scripts and the lack of bashisms in /bin/bash ones.
>
> Since your script has '#!/bin/bash', you'd run it with -f to force the
> bashism checks (or change to /bin/sh first).

Just for completeness, you could also use shellcheck.

https://www.shellcheck.net/

I haven't tried checkbashisms so I can't really provide any comparison
between the two.

Cheers,

--=20
Julien Grall

