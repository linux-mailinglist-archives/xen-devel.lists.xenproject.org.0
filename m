Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979787CF45
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 15:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693898.1082553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8oU-0004vu-Ol; Fri, 15 Mar 2024 14:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693898.1082553; Fri, 15 Mar 2024 14:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl8oU-0004t8-MA; Fri, 15 Mar 2024 14:45:38 +0000
Received: by outflank-mailman (input) for mailman id 693898;
 Fri, 15 Mar 2024 14:45:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A35=KV=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rl8oT-0004t2-BH
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 14:45:37 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad61bee7-e2da-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 15:45:35 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2220a389390so1105099fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 07:45:35 -0700 (PDT)
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
X-Inumbo-ID: ad61bee7-e2da-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710513933; x=1711118733; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u//wIGFq1yQTQLzBR6MSPkedM2eYpzAAUoGuU2PDtA0=;
        b=N72e1oyvLQsuNBZGZCtRBUzj5WblzIf5aLHT6M9VEsB68Yjz/Fh/J/U0JxQJ2QPc+1
         H1TrHurUUP6apDw/v51VN5MaPRfB7FyHlvLsLTcIaiLsoVAxbB8onp5XbM5t3zU9hsnD
         /gJ3sSC94hXRLGl/PEbQ+dBf8gyvDNUTvYl6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710513933; x=1711118733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u//wIGFq1yQTQLzBR6MSPkedM2eYpzAAUoGuU2PDtA0=;
        b=rOG0wBAbiFjKP8Gb7HRWaE8T4ZxXwM5VN0VXGBH8yasAulejujgcIkTS0wgnRDw1C3
         pYWSx3OYr8RHEhnbaHyUOOs3gZAit+HkNccvEz66ThrZxP43ZvZDwHXCf7d8YtsiO68P
         D6qx9lBJQGTwKa6CARigGg9DxbZPOHezDGXtOscfnYkhwJFYhtNxPHB7EmL7aN860zwY
         aiJNkJMOicSL7pwbIuI59TgNV46izBzrft/zCZbuHlhT4HWBF6gRcmenYAQZ+BJNnNv0
         00jKv28lY88MyHZ8x01W1wzCmPoqnfGds4YDXYrtS1DcKzuGBW1YYetSGa5NEXWQOjQG
         1Zwg==
X-Forwarded-Encrypted: i=1; AJvYcCW5tgdAQvpLRRT0El5qqyK3rpB04moA0SGqe7aXzqhrvKXQEB+95/FBxv6KbFdPHcXMCbFC2FnbBLnaIbECUMtRUVEhK0Nh9UozPjgZXEs=
X-Gm-Message-State: AOJu0YxzhoNNDoWD94zds+23n0eJf1B8yDVogSi4Ljv9t0LdLqv/IQDt
	CL3HB1J2LQQqGKgAeu67ekoxx2FzJv75plamZuHHszZ8GFQouhS37c/kIA+/aoHPrsKBdGADuED
	4jXj579OkfMbeE8WOkAMjABZ7PlIeFf3mHu6i1A==
X-Google-Smtp-Source: AGHT+IEslSXPGgfyyimDUiovSqXJsNPowt/4E9lwjWThs37NKWEZDujK+wt/j8PmacQfQUJR6sXH8PcjJq5pbFcZzwI=
X-Received: by 2002:a05:6870:200e:b0:221:9cf3:8ae5 with SMTP id
 o14-20020a056870200e00b002219cf38ae5mr3574390oab.24.1710513932865; Fri, 15
 Mar 2024 07:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org> <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com> <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com> <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
 <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com> <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org>
 <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com>
In-Reply-To: <7109ef7e-040c-4d11-ba4b-d898ed2530ff@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Mar 2024 14:45:21 +0000
Message-ID: <CA+zSX=bGfc+dsZjg4xmW2fgsnFQLSAh1ChOY3jYU_AD5SJw_7w@mail.gmail.com>
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	federico.serafini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org, 
	michal.orzel@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 2:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 14:55, Julien Grall wrote:
> > Hi Jan,
> >
> > On 15/03/2024 13:24, Jan Beulich wrote:
> >> On 15.03.2024 13:17, George Dunlap wrote:
> >>> On Fri, Mar 15, 2024 at 11:57=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>> It sounds like Andy and Stefano feel like this is a situation where=
 "a
> >>>>> fixed width quantity is meant"; absent any further guidance from th=
e
> >>>>> CODING_STYLE about when fixed widths should or should not be used, =
I
> >>>>> don't think this change would be a violation of CODING_STYLE.
[snip]
> >>> Other than "it's in CODING_STYLE", and "it's not really necessary
> >>> because it's ensured in the assembly code", you haven't advanced a
> >>> single reason why "uint32_t" is problematic.
> >>
> >> And it isn't, I never said it would be. But if we set rules for
> >> ourselves, why would we take the first opportunity to not respect them=
?
> >
> > I am a bit confused. Reading through the thread you seem to agree that
> > the written rules are respected here. So what rules are you talking abo=
ut?
>
> What was proposed is use of a fixed width type where according to my
> reading ./CODING_STYLE says it shouldn't be used.

This conversation is starting to get frustrating.  That's simply not
what it says, and I pointed that out just a few messages ago.

To reiterate:The text says fixed-width types are OK when a fixed-width
quantity is "meant"; and that in this case, Stefano and Andy "mean" to
use a fixed-width quantity.  The implied subtext of that sentence
could be, "Don't use fixed width types unless there's a good reason to
use a fixed width", and both Andy and Stefano think there's a good
reason.  This argument you haven't really addressed at all, except
with a specious "slippery slope" argument meant to nullify the
exception; and now you attempt to simply ignore.

I venture to assert that for most people, the rules are a means to an
end: That end being code which is correct, robust, fast, easy to
write, maintain, debug, and review patches for.  What I agreed to,
when I accepted this patch, was that *in general* we would avoid using
fixed-width types; but that there were cases where doing so made
sense.  Some of those were discussed in the thread above.

Andy and Stefano have already put forward reasons why they think a
fixed-width type would be better here, which are related to "end
goals": namely, more robust and easy to maintain code.  When I asked
what "end goals" would be negatively impacted by using a fixed-width
type, you explicitly said that there were none!  That the *only*
reason you're continuing to argue is that we have a document somewhere
that says we should -- a document which explicitly acknowledges that
there will be exceptions!

The ideal response would have been to lay out a reasonably
comprehensive set of criteria for when to use basic types, when to use
fixed-width types, and how each criteria advanced the end goals of a
better codebase.  A sufficient response would have been to lay out
reasons why "better codebase", in this instance, tilts towards using a
basic type rather than a fixed-width type.

Saying "That's what the rules say", without motivating it by
explaining how it connects to a better codebase, is just not a helpful
response; and making that argument after it's been pointed out that
that is *not* what the rules say is even worse.

 -George

