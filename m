Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280DAB378C
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981405.1367799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESTP-0001zN-6L; Mon, 12 May 2025 12:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981405.1367799; Mon, 12 May 2025 12:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESTP-0001wp-3p; Mon, 12 May 2025 12:41:35 +0000
Received: by outflank-mailman (input) for mailman id 981405;
 Mon, 12 May 2025 12:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwtN=X4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uESTO-0001wj-99
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:41:34 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6de9ea3f-2f2e-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 14:41:31 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3f6aa4b3a7fso1554297b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:41:32 -0700 (PDT)
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
X-Inumbo-ID: 6de9ea3f-2f2e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747053691; x=1747658491; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jowbBovZjboUOeAr5SXVNumRTZ5MQ3jW2MvxnJuwk6A=;
        b=fpRUh14QD5xymGz2/mhBqxX14ArjH6+bY7PX1fRpGQTB0oj/OeiAgX2gSOjG4CyoqT
         OQ/ep/ULeMMSwrPlTMzZ3vQLShKUG87G9NThHm9ESN8oOnypymKFGq6sPpGgunMC2fau
         sK0hw1liZwoJvo8r5rqP85OcskboPhQr/KA5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053691; x=1747658491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jowbBovZjboUOeAr5SXVNumRTZ5MQ3jW2MvxnJuwk6A=;
        b=MGe/TGiJ4+TL3D+BZooWTCjcybmkdbm2aTUnfjOnk89ncQPIcY96Xmq8cAce7Zylxs
         FYHkcQWv/fCqlIqcvM2gYP+wm6Tt1zDXKR6O9e3uHaEAH2ExijPmNwGLDOlev7ZrnW/W
         FiZ8X7rOAlnKoFtFAgVkPgFRsbIaj7g6YBpnfMV46jDl9S6q+iUcllJTPw6qapA+u9CT
         lbk9F5K9a0PAiQwjHO6mxKJCtM905ApexJo8M3Gqf7QNdeK6SsktybAxTDLJYtsuFAGm
         fuVUkwI5h96lZPPURhnPFJvBokvfsvI89ZEqgmAKRzxxtgRhbWu3cLY0q0YHTAMEEuNM
         BcxA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8zhyKdmTTxTi7nAU9rucSa+6BbplD2BzIXa/2QGjTfhmU2+BcypUgMpYgi9N1xkzyLOssRq1egw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHL1xsAWoeF8/5zC8uxVusUTM2MCffsr2V0gnck9IMUe+V/bm4
	yhZvg7IVLYsigpVHDh6K20m4OHER7xIrM2Tu+N7PI2NBR1LeIkPQa+pTjvw02dJF/64gyRXeon/
	1KQ21sZxKeqfsIV9L+xpazkWVuijnVjZq72/Kyg==
X-Gm-Gg: ASbGncubEYtgLd7OSUEuSKhfjxAzIURKfVZLWdsJBpzekR3WDDH4TWN7/FyAcF32GAB
	lzV7GrPCGNTYum9kFjyLo8DPN9U+q0gGMRTQKBzZmvB0a5S4rtmYU7nQJ/ODK3VKHC18MgSUuLI
	LQgPDlO0KyjVLOejxlZMpP4VGbOO4B4ZSo6YwalX+en64=
X-Google-Smtp-Source: AGHT+IHJuYU4GWCYb0esf/RDBWCVFdj0eFAlhr8Gzpxu1dGOL26rzP9t3aMBooxYSYlxDlz93kIVDAfepRiWQYnbfPc=
X-Received: by 2002:a05:6808:1b0a:b0:400:fa6b:5dfb with SMTP id
 5614622812f47-4037fe93b20mr6667972b6e.36.1747053690828; Mon, 12 May 2025
 05:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
 <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com> <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
In-Reply-To: <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 12 May 2025 13:41:20 +0100
X-Gm-Features: AX0GCFu9FlRtyTOMs8PdFQD4NnGWSRpRRo2cJA3HB5U98u5m4CEpFbOkq3QSjn4
Message-ID: <CACHz=ZgeQO4K2kcXiq-dagHiqvtsXpodF9S0YjS6G0t-qpJPdQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Use __auto_type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 1:09=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 12/05/2025 12:59 pm, Jan Beulich wrote:
> > On 05.05.2025 21:44, Stefano Stabellini wrote:
> >> On Mon, 5 May 2025, Andrew Cooper wrote:
> >>> In macros it is common to declare local variables using typeof(param)=
 in order
> >>> to ensure that side effects are only evaluated once.  A consequence o=
f this is
> >>> double textural expansion of the parameter, which can get out of hand=
 very
> >>> quickly with nested macros.
> >>>
> >>> A GCC extension, __auto_type, is now avaialble in the new toolchain b=
aseline
> >>> and avoids the double textural expansion.
> >> I think this is a good change
> > +1
>
> That looks like agreement.
>
> Now for the (new) controversial part.  Since sending this, Linux has
> decided to just #define auto __auto_type for C < 23, in order to start
> writing C23 compatible code from now.  It's more succinct, and has
> better longevity.
>
> We might want to consider the same, although it will introduce a new
> example of defining a keyword, which we'd have to call out in the
> MISRA/Eclair config.
>
> If we're going to do this, we should do it from the outset.
>
> Thoughts?
>
> ~Andrew
>

I vote for avoiding extensions when the same feature is implemented by
standard, so yes for using "auto".

Frediano

