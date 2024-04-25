Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A03A8B1CF9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 10:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711914.1112255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzugI-0001YX-UX; Thu, 25 Apr 2024 08:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711914.1112255; Thu, 25 Apr 2024 08:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzugI-0001Wx-Rg; Thu, 25 Apr 2024 08:42:14 +0000
Received: by outflank-mailman (input) for mailman id 711914;
 Thu, 25 Apr 2024 08:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d+ZV=L6=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzugH-0001Wr-AY
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 08:42:13 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b4f414-02df-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 10:42:11 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ea2f95ec67so336819a34.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 01:42:11 -0700 (PDT)
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
X-Inumbo-ID: b4b4f414-02df-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714034530; x=1714639330; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mB0J38hqDfCFVd2/ZijR8LCsm/ERCZ/tb60H+uq0TvM=;
        b=cRlxQ6ZDwa2ua/NWFK4o64VEQ2AO91+mAbsub6K6/JQ0m92/6jVmRYCt4NWt6I/gQP
         pcgY9y4jO8nyBR0Jmr1h9iMzlOasbkihX8F1rSCS7MBU+IIBKctX65WXIPkW6zY82y95
         G9TVFT363ARVBqujInNF7HRRmtv50jKbYGRrdHs+2KwqQWXApGKfo2GdVYI46fBfqFuJ
         VZVZKzhK59KDnWpkCUoDAZn8g2NBHh+BmHYuHMPB3XHsVxFLU95KG0FYQarJoTObhGg/
         hFAPQFyVoI3+zYxONtM4OxfWq3YzYBsXKrgwKfgnWslBnq4QTJ/Q0/zWxQ8U+wb27oHt
         OS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714034530; x=1714639330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mB0J38hqDfCFVd2/ZijR8LCsm/ERCZ/tb60H+uq0TvM=;
        b=fw0HhyI6MD7PbAovaFqdjKR4R6gA+c8RjbzBra2QzRdhEOAI15ujxKbLj2SV1thAAj
         Ce0PYexxTjBJN/10dM2pisBtsG9uL/gAF6eYulhpgsGMv3xx20e07EWP9SjvVbpWwqH1
         cXpkiXav7U3SZ0kj5rOLBhXoWPrHKSmE1pp+DdVGqk4+rNBwEardO7Dr+rq1CGzHzb16
         6Ech06ATETg445BSaLwZEO6jhfMafiQXbSuo1WXzduV5G4XkF7Sj+o2SvyAYjl11p/wk
         fWSXjjTn3fXt1ZTst1JbwNu1M1BC6XhIageowa6hG/AfGYCJbrmaZMNsr9vmeufAa+eC
         qWjA==
X-Forwarded-Encrypted: i=1; AJvYcCXBKx1s0VR29926KFYiWsPH2n9qbTiut17kATwhzzV5SYeLhdRGgpN+KOdQswieSQnhpE6nAjXknqZ0cPjXQQ8ezdewOemP2KUmLUtbQZ4=
X-Gm-Message-State: AOJu0Yz14g15w87gL9pb1ol9oCWwURvvgYd9vx0RS2EAb77G/5BEYB+z
	mo9WhXUumDQ32SoV5XXmKyVtUTEqE032IoTMtwhAFMP2lDXZmXMaNYQZVt1MWe5w2DNg/ogrtIg
	5z2rV+dV2FmJZn1pKa7Uz9o1lNPv8zge35lRzhU5X
X-Google-Smtp-Source: AGHT+IGzxB1NBFaEgF4ziIKseLgPeSvts0Zu4mzVUOHqhXBg+RblJXHBIHnYvLFDk5I4smgI6ReOycAFb97UOHe7xjQ=
X-Received: by 2002:a05:6870:28d:b0:238:f93f:66b6 with SMTP id
 q13-20020a056870028d00b00238f93f66b6mr6675293oaf.29.1714034529644; Thu, 25
 Apr 2024 01:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713990376.git.w1benny@gmail.com> <2e6e4f07b9e8f50ae65697c8644995aa4851cdac.1713990376.git.w1benny@gmail.com>
 <470e0d7a-918b-4df6-a7b2-e8ee2d98dbde@suse.com>
In-Reply-To: <470e0d7a-918b-4df6-a7b2-e8ee2d98dbde@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 25 Apr 2024 10:41:58 +0200
Message-ID: <CAKBKdXgBLqZa41uaXWCOSPo1bDftYtwmx75Z6kRmpOeuwmZgNw@mail.gmail.com>
Subject: Re: [PATCH 1/7] x86/p2m: Add braces for better code clarity
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 8:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.04.2024 22:41, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > No functional change.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Hmm. I don't really mind the extra braces, but I also don't really see a =
need.
> IOW this is not an objection, but it'll want to be someone else (if anyon=
e) to
> ack this.
>
> Jan
>
> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -106,6 +106,7 @@ void p2m_change_entry_type_global(struct domain *d,
> >          unsigned int i;
> >
> >          for ( i =3D 0; i < MAX_ALTP2M; i++ )
> > +        {
> >              if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
> >              {
> >                  struct p2m_domain *altp2m =3D d->arch.altp2m_p2m[i];
> > @@ -114,6 +115,7 @@ void p2m_change_entry_type_global(struct domain *d,
> >                  change_entry_type_global(altp2m, ot, nt);
> >                  p2m_unlock(altp2m);
> >              }
> > +        }
> >      }
> >
> >      p2m_unlock(hostp2m);
> > @@ -139,6 +141,7 @@ void p2m_memory_type_changed(struct domain *d)
> >          unsigned int i;
> >
> >          for ( i =3D 0; i < MAX_ALTP2M; i++ )
> > +        {
> >              if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
> >              {
> >                  struct p2m_domain *altp2m =3D d->arch.altp2m_p2m[i];
> > @@ -147,6 +150,7 @@ void p2m_memory_type_changed(struct domain *d)
> >                  _memory_type_changed(altp2m);
> >                  p2m_unlock(altp2m);
> >              }
> > +        }
> >      }
> >
> >      p2m_unlock(hostp2m);
>

I should have specified that it builds on commit
5205bda5f11cc03ca62ad2bb6c34bf738bbb3247, which did some coding style
cleanup and added braces to several places too, but missed these two.

