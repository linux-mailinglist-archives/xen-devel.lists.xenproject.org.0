Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62A85CE0C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 03:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683761.1063354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccPY-0000dG-Ao; Wed, 21 Feb 2024 02:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683761.1063354; Wed, 21 Feb 2024 02:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccPY-0000aN-7v; Wed, 21 Feb 2024 02:32:40 +0000
Received: by outflank-mailman (input) for mailman id 683761;
 Wed, 21 Feb 2024 02:32:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rccPW-0000aH-Rn
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 02:32:38 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a5dd93f-d061-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 03:32:37 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d244b28b95so21807491fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 18:32:37 -0800 (PST)
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
X-Inumbo-ID: 7a5dd93f-d061-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708482757; x=1709087557; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNsSMd/avjPHTwuybE9n0Q/zH0doxEeoNutnqoCLcTo=;
        b=aAFFaWgFZBAC5J34u+xIPefc/vMazhLhM9wyDE3rkhjcczuzOfrVt2fQw5iLzfEKYU
         LBMLi2VdxF/8hHOwks5qJIbbnzAp2HpDZGMM8rSKeA168338mHhmr7gSoXrs3grJdGiY
         2iZBRnjudRJZOc9jWPijDxnQ5OImXURFYXy3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708482757; x=1709087557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNsSMd/avjPHTwuybE9n0Q/zH0doxEeoNutnqoCLcTo=;
        b=eJLTPV3buM3rvrh/7Ia7f1OgQNvDMhO9VmbHc1RaQLZvQYt5Wy/59dGcpmYXtrprmx
         IgmtPzB6nGdPLDqIrF6H8KnXSchM0z5LX9PuXqVJgpFZen7gW3WCnHexR1irB2oqKPeD
         w6ZgP+uOiQUMHR4Jufa3IGVUbAjfw6mAwBh4KQWN9Rg+xY3gieNCM+SzflmdMJAL3mLh
         S00Py6X61L3iM6YUwHhLwub9U72TogBt8YHQDWFD62nYoDlLX3RB8KMKQwa03EQtTI63
         7eSkqljPXlZp3OqzMSFthzsxmAfK2hxyL1FdXeH7ySEHjzhAEE3Pp4FuDqYNe00Yz2yO
         i2fg==
X-Forwarded-Encrypted: i=1; AJvYcCWeGnxhsgnJwZ3Zd0T9FN1tu6jvIwHCO4+H9g8rrMPltzIfWVqaZ7FEAwSy4JM8Q2OeG9a4+VNvITuLgJphmavAkI08zG3DrMh/2FOBBxY=
X-Gm-Message-State: AOJu0YzgCCrI6sSi2ywUisvMzSRZm4bpy7xg8vD6wIUlUU/0MdjUiBwY
	3f0oiDnuDMicekbs3soXRuUhEpzWT82zzjEJ40rJPjetZB1N3GWY3ZOZfzRLUTHyccSGr7rb4P2
	m+dS2BMs4LdfJ/MQlzOI99iw93zZAEdlXCW75Aw==
X-Google-Smtp-Source: AGHT+IHhu572k5XuC3mikpoqZkrtWjcC8JZaV3R3axhCoNIDzQZCITo8FkH4vDabUK/kVW3eV+yy95zbjO5Rm8nVs1A=
X-Received: by 2002:a2e:a585:0:b0:2d2:4ccb:7449 with SMTP id
 m5-20020a2ea585000000b002d24ccb7449mr2488937ljp.44.1708482757302; Tue, 20 Feb
 2024 18:32:37 -0800 (PST)
MIME-Version: 1.0
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com> <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
In-Reply-To: <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 10:32:26 +0800
Message-ID: <CA+zSX=aJ2mVbGzFj74+DEGZvw=XWTZKAeWfrwMNHaYhsdaytHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 4:26=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> >> +    if ( (cflush->offset | cflush->length) > PAGE_SIZE ||
> >
> > This is confusing. I understand you are trying to force the compiler to
> > optimize. But is it really worth it? After all, the rest of operation
> > will outweight this check (cache flush are quite expensive).
>
> From purely a performance point of view it may not be worth it. From
> code size angle (taken globally) I already view this differently.
> Plus I think that we ought to aim at avoiding undesirable patterns,
> just because people tend to clone existing code when they can. Thing
> is that (as per below) the two of us apparently disagree on what
> "undesirable" is in cases like this one.
>
> > We probably should take a more generic decision (and encode in our
> > policy) because you seem to like this pattern and I dislike it :). Not
> > sure what the others think.

This is similar to the policy question I raised among the x86
committers a few weeks ago: You're manually specifying a more specific
behavior than is required, rather than specifying what you want and
then letting the compiler optimize things.  The problem with this is
twofold:

1. It's harder for humans to read and understand the intent

2. It ties the compiler's hands.  If you write your intent, then the
compiler is free to apply the optimization or not, or apply a
different optimization.  If you specify this optimization, then the
compiler has fewer ways that it's allowed to compile the code.

#1 by itself is probably enough to counterindicate this kind of
behavior.  Add them together, and I'm inclined to say that we should
write a policy against such optimizations, without specific
justifications.

 -George

