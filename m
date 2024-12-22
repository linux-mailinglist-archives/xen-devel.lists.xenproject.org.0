Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B29FA548
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 11:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862667.1274256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPJLH-0008C0-QO; Sun, 22 Dec 2024 10:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862667.1274256; Sun, 22 Dec 2024 10:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPJLH-000895-NJ; Sun, 22 Dec 2024 10:37:47 +0000
Received: by outflank-mailman (input) for mailman id 862667;
 Sun, 22 Dec 2024 10:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57sU=TP=gmail.com=sedat.dilek@srs-se1.protection.inumbo.net>)
 id 1tPJLG-00088x-Ef
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 10:37:46 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7815c04-c050-11ef-a0da-8be0dac302b0;
 Sun, 22 Dec 2024 11:37:44 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30225b2586cso46633801fa.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Dec 2024 02:37:45 -0800 (PST)
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
X-Inumbo-ID: c7815c04-c050-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734863865; x=1735468665; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAf4XYF+BN/cynPMUouPVnj1TJkDYFatX5sPirx1ssQ=;
        b=ApGwbnsDFe3PFltAqXa6RoJK+tGI1iUFNlixZxVMShaVftxnXh5PXgh23iybWIvCl9
         WnpEPqt+ttGzWZmXYaV2fd36ctnmoW8XY8/AWC+I0p/h/0XgW9d5yPfBVzKKhxKZQzeq
         C7v6Mc4zbRFDiHsLquQ+a1hiynfnSlXZGuVNnZldxj6nUB00sLRKn4nlSIleA7v6RyEe
         mQnh1EKx7G6yemm9X8MNETS6k4BLPEd3dVKechAmd8gTYCBo1LZ7crNaCRSQTl7rYTPM
         uTjZ6g/BOXHU1qRfvc0+BIFLheYKc3CZ7nNo1sTxa8ZIVeesECPD4zHqPS945aYERO2u
         nUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734863865; x=1735468665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAf4XYF+BN/cynPMUouPVnj1TJkDYFatX5sPirx1ssQ=;
        b=OlE6v8eqcGdzkOKIOdi1XAdRLud+200kXf6gbWX5dPW3grjAVOZSSiQhjwbOUB6QUZ
         HFJ3CQkzeb1nRQZwUiwLhMrgy3kgBoKfHDO0NOvm4WM7GBuihr7YPIJfxIhHW6/orEGd
         kVXqu0jxglAGjFkU+ade17ebz08QgzDE1JwGkmJXrYEQp3zvwweVuHccApdJedfdxQWq
         lK54r1cJRYlnlFdMnIX3jM+LE91Ci2IDl4c5BsYgewpyrV8hGG+x3AfC0+fxglF42cSN
         2J9zs32MYSTaAs9aeV5YgQoMF7QVFY7YVoJmNLuUhZfuOIoeHQWpXNvvWuCfnunTfZb/
         voWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+ZN3VaHpRA2O8ACzZh0nPNCY8SKf25tTVwMozUqu5NNsx+v3/D1k7laWW8BJVzGUkiysON2EUUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYXQik/31+6UGf4WQIoYdXK/mNOeXQusuThsQ6FfP2Wf93flOI
	qXlJd/BTPCsvhR7wrzh3Oyg1RY6xRnKfRedRRzjhbfgQA4KoRoxorp+0yYHEqrvloyyK9RGGvq9
	liLdZWfZsKA6mm6429TwQ2ZaIo3g=
X-Gm-Gg: ASbGnctCEmL7uyW8ajh3x3cE2Pj0DFbJWaFebecs1aB364I6rBD3/Bkg0vJYw8MnpnJ
	XJHUWPZx+GVxPakyJASh8HvOiWV2Ft7RUiGELB1K4dR/7Lc76QzkdbzrphVNtwSyDUReF
X-Google-Smtp-Source: AGHT+IGJ4XnG6hPJJ83WUCPU4UF5z2bmt9KoMQ+xXAQfdQtvpcUiv3Qt3tZqeiwj1hLIlyJ3fx6mjYGevzp0orcU4bE=
X-Received: by 2002:a05:6512:3510:b0:542:2952:8848 with SMTP id
 2adb3069b0e04-54229529bb5mr1819462e87.3.1734863864768; Sun, 22 Dec 2024
 02:37:44 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com> <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com> <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com>
In-Reply-To: <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 22 Dec 2024 11:37:08 +0100
Message-ID: <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 10:31=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> > With...
> >
> > dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> > dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../
>
> That's completely bizzare.   There's nothing interestingly different
> with those two tests vs the others.
>
> I take it the crash is repeatable when using either of these?
>
> ~Andrew

This time I stopped SDDM and thus KDE-6/Wayland session.

Tested with Debian's officially 6.12.6-amd64 kernel in VT-3.

test-hvm32pae-xsa-consoleio-write SUCCESS <--- 1st time I tried, never
said this is not OK

test-hvm64-xsa-454 leads to FROZEN system and DATA LOSS (here: ext4).
Reproducibly as told many times.- in Debian and selfmade kernels version 6.=
12.6.

Stolen from the picture I took with my smartphone:

sudo ./xft-runner test-hvm64-xsa-454

Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
Executing 'xl console test-hvm64-xsa-454'
Executing 'xl unpause test-hvm64-xsa-454'

^^ System does NOT react!

I can send you the picture on request.

-Sedat-

