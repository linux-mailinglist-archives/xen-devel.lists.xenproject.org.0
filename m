Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F6E800831
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 11:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645423.1007608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90ki-0005IE-Re; Fri, 01 Dec 2023 10:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645423.1007608; Fri, 01 Dec 2023 10:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90ki-0005F6-Ov; Fri, 01 Dec 2023 10:28:08 +0000
Received: by outflank-mailman (input) for mailman id 645423;
 Fri, 01 Dec 2023 10:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utmH=HM=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1r90kg-0005F0-RS
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 10:28:06 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5068ea98-9034-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 11:28:05 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50aab20e828so2663142e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 02:28:05 -0800 (PST)
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
X-Inumbo-ID: 5068ea98-9034-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701426485; x=1702031285; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOi/IZlhtuMOLW2rHivITZeySZ7C8HA3I2qnegsFBcg=;
        b=Ni8FraLF6WNHqSwYqd30rzPzV5q2/mqhYglGbUbkzui4eLNfC/7B5lJWwKcduFA3xx
         R95w/s9yUlICeVCrxkFqhYVT7FgPcFQttxYIm+/07iW10vAwyqx7vA9kX868Uasu2uWN
         RvRZHLS5qK/xaTzG/mtO5zcb5gvo1Eo1iOvQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426485; x=1702031285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOi/IZlhtuMOLW2rHivITZeySZ7C8HA3I2qnegsFBcg=;
        b=gJQXTf6i8YD4esF8TemxusXbGmwmBYR7XT6S+7fmKjHOXt0sGBG0evzPZxXL4KAtjy
         4IhJQElEARJ4TmoUhaGOz+PRjn23a+J0O7yXQluZicPySSOYKhp6QIyLla8B1F0S8Xux
         IElQDdd1b8r8uL6cJbQIgV9SKlIOJ2EpgdySkcG+TVRlskr5EinznbkcxI2gQ9oASKi1
         7nfPli2hkKnN5fXm1Fiuca9NwzO6HjC57yThDCS1VFzJmUke0Pa9zh/0TOTvmMK1gbAI
         gn6d9R1aQIin9aB813lsSKaGlrJp7UQ+G+0NMSBsAGclWIgrM4TaqILQTC0HwXMO+Gbp
         ioPg==
X-Gm-Message-State: AOJu0YxMze4mhmVt43vkS9tGcbC2N72yUDNGOCLZfUvKHam/AVLdMMOY
	ERGwVDsm8S1+rWbArKJgMcpSu7oSbH/KzZqx75RSng==
X-Google-Smtp-Source: AGHT+IEAd1y5gitDsOCYPCP9HJZ/isWP2k7acIeMKAjAvnQcV7pYF+N4YRENUrM96l8EDkWL36tRl0CW1Db1Nk60NVo=
X-Received: by 2002:a19:8c50:0:b0:50b:cf58:af16 with SMTP id
 i16-20020a198c50000000b0050bcf58af16mr493876lfj.1.1701426485148; Fri, 01 Dec
 2023 02:28:05 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 1 Dec 2023 10:27:53 +0000
Message-ID: <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:28=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Hi all,
>
> This vote is in the context of this thread:
> https://marc.info/?l=3Dxen-devel&m=3D169213351810075

To add slightly more context.

The issue here is more than a simple "should we use the word broken or
not".  We already have a mechanism for resolving this, which is that
the maintainers of the code in question (in this case THE REST), can
vote.  In any case, on that thread, four of THE REST were opposed to
using the word "broken" in technical documentation, and one in favor.

However -- and I hope I'm not misrepresenting Andy here -- Andy thinks
that position is preposterous, and that this kind of request is a
clear example of a kind of a pattern of unreasonable review which is
damaging to the project and driving away contributors.  Daniel Smith
at least supported the use of the word "broken" in that thread as
well; and (hoping I'm not reading too much into it), the tone of
writing also suggests a level of exasperation.  Andy seems to think
there are others who agree with him as well. This specific issue has
been sort of simmering in the background since August, and we're
trying to get it resolved.

In my discussions with Andy, trying to understand his point of view,
we always reach a sort of impasse, where Andy thinks the majority of
contributors would agree with him, that insisting on removing "broken"
is a completely unreasonable request; and I think that the majority of
contributors would agree with me, that insisting on removing "broken"
is a simple enforcement of long-established norms about how technical
documentation is written.

Everyone would agree, I think, that community norms should be upheld;
everyone agrees that unreasonable nitpicking or imposition of personal
idiosyncratic preferences should be avoided; but in this case we
disagree about whether "don't use broken in technical documentation"
is a "community norm" or "personal idiosyncratic preference".

So the idea was to run a test and find out.  If most people in the
community really do think that "broken" is suitable for the
documentation in our project, then of course the maintainers should
stop objecting to that kind of language.  If most of the people in the
community think that "broken" is *not* suitable for technical
documentation, then of course this isn't an example of unreasonable
review (although other instances may be).

Fundamentally a lot of these sorts of issues come up because different
parts of the community are not "on the same page".  The question is,
how do we *get* on the same page?  I don't want to have a vote or poll
over every little issue; but if we really have a deep 2(+) / 4 split,
it's probably worth having some sort of a discussion to figure out
where we are.  Hence the poll.

I would have worded it differently; but nonetheless, it's a sort of
single data point.  What do you as the community think?  Is "this
hypercall is broken" the sort of thing you'd like us to prevent, or is
that being unreasonable?

FWIW I think a "five-point survey" would probably have been somewhat better=
:

Regarding the review insisting that the word "broken" be removed from
the updated documentation to the old hypercall:

( ) I think this sort of enforcement is right, and would argue that we
continue doing it
( ) I'm happy with this sort of enforcement, but I wouldn't argue for it
( ) I'm not particularly happy with this sort of enforcement, but I
wouldn't argue against it
( ) I think this sort of enforcement is unreasonable and is harming
the community
( ) I have no idea why we're talking about this, it's really not a big deal=
.

 -George

