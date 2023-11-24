Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D862C7F727C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640556.998966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6U6j-0003O4-0G; Fri, 24 Nov 2023 11:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640556.998966; Fri, 24 Nov 2023 11:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6U6i-0003M9-Ta; Fri, 24 Nov 2023 11:12:24 +0000
Received: by outflank-mailman (input) for mailman id 640556;
 Fri, 24 Nov 2023 11:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FB0S=HF=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1r6U6h-0003Kr-QB
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:12:23 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ec6652-8aba-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 12:12:22 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c876f1e44dso21880791fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 03:12:22 -0800 (PST)
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
X-Inumbo-ID: 56ec6652-8aba-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700824342; x=1701429142; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5QH45vW59qUd5Qf093h6nMMsEHl/cfx2GTKHjZ+lwc=;
        b=UTaiBfZEnQNDayFvrnVXZuRFNo2atLbG0goFZLiWAxGhHhT7vQy4LFKMawWLV2WzsP
         E31ryBAzIY8VF+0HM7oeeoR1MCaLz95ODQrE7aNt87Zyd2QaIoQhWwytuGuw2ge3mHyZ
         +GRQJz90QG9uuhkm/gtEffLOy2azMEiQLPuLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700824342; x=1701429142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5QH45vW59qUd5Qf093h6nMMsEHl/cfx2GTKHjZ+lwc=;
        b=nIH5JvXL1Wo/nrvtv8fgOTCpNGsTJpuHRQnL6MqVGF/SMXrXQx+OC0u6RBg+t4rbtq
         NErV1JYz4eJRlWEiJa+8W3NwGwd8Z31E+USRYJe+f4gcAw/++dpurMWHEjgBmmwGw+mT
         w4cFAaXVy57xNyDNqnLdgf3MxVrZaa87P9m6bOF/wTKn0ID4umjmYsKx8XJW1XIZBcxC
         zHkSObxgD1B7gNQ1mbTRle3ORz0o+21UpMCWCByX4ILJ97EV+i30aDZH9Cl2aqDhfniH
         7dUbCBRICB69t7X27ckmglOL2EJm+Egoxdp/r39bGWFAFPnDEdgPhfdu73RufnUzynXD
         ZpiQ==
X-Gm-Message-State: AOJu0YyOh8b/vD0zMIolFHfS8FyjGBLElxsRC3jcaoBkLq4PJt4jqqxp
	nqmFr9GSh1hf7UoaGspzH0ggIxWvP/6q5o1dJhalew==
X-Google-Smtp-Source: AGHT+IFn825DJsDJmEB8a6XCt16yuffErPy27/MJ4t+lhOUaPwfNLyVXq3Vb24CbTzCEUmVap+Tz1oTsuSQIQKbXpLI=
X-Received: by 2002:a2e:9e09:0:b0:2bc:e330:660b with SMTP id
 e9-20020a2e9e09000000b002bce330660bmr1726406ljk.9.1700824341778; Fri, 24 Nov
 2023 03:12:21 -0800 (PST)
MIME-Version: 1.0
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
In-Reply-To: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 24 Nov 2023 11:12:10 +0000
Message-ID: <CA+zSX=YL0fjM+ZTEoXNpzQ9iFKFwzdZRR-QsyQAZCQVeOGdj6A@mail.gmail.com>
Subject: Re: Clang-format configuration discussion - pt 2
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 2:48=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
> AlignConsecutiveAssignments: None
>
> ---
> This one is disabled because of feedbacks from Stefano and Alejandro abou=
t some weird behaviour on our
> codebase.
>
> This one could be phased along this line: =E2=80=9CConsecutive assignment=
s don't need to be aligned.=E2=80=9D, the issue is
> that in this way it seems that it=E2=80=99s optional, but clang-format is=
 going to remove the alignment anyway for
> assignment that are consecutive and aligned.

It's hard to agree on this one without seeing some of the examples of
what it does, some examples of the "weird behavior" Stefano &
Allejandro found, and some examples of places where it's going to
remove the alignment.

I had tried to apply your series before and didn't get very far with
it for some reason ISTR.  One way to see the effect of individual
features would be:

1. Make a branch with one big patch applying clang-format for a given style

2. Change just one style line, re-run clang format, and create a new
patch from that

Then it would be easy to see the difference between the two.  It might
actually be easier for individual reviewers to do that on their own
trees, rather than to ask you to try to generate and post such patches
somewhere.

 -George

