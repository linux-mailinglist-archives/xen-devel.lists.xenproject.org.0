Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71314840B1C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673026.1047139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUJM-0006IK-IZ; Mon, 29 Jan 2024 16:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673026.1047139; Mon, 29 Jan 2024 16:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUJM-0006FS-FA; Mon, 29 Jan 2024 16:16:40 +0000
Received: by outflank-mailman (input) for mailman id 673026;
 Mon, 29 Jan 2024 16:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kvg3=JH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rUUJK-0006EQ-Od
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:16:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6e9dba9-bec1-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 17:16:37 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so328003266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:16:37 -0800 (PST)
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
X-Inumbo-ID: c6e9dba9-bec1-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706544996; x=1707149796; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2NzyRxHlldbgBO3UmVYhU2RM410eQJ9s2pkp0wC/8J4=;
        b=T4b9wbKSB+3Pmrb6ppKtTEmatXTZL7q5YqIjmmpgJS7qVix5eOpaQvuXRN5xPAEILV
         EFvzsyJmHWujmxeO+wBTmF6W7+HNvXDZ0MWbf4mNqOLyIUd1NXZ+2Q1LrOA2hjtEGqtG
         KUhi0hokcePjKxfNhVyMh0mnIDy9+Segv6q8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544996; x=1707149796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NzyRxHlldbgBO3UmVYhU2RM410eQJ9s2pkp0wC/8J4=;
        b=AKQe/CW0gJiPjO/dmOjfDhXJJT0PGfHUZaQZoz47Pc1ICgS+JaYaMcQQU/nPcZAc6l
         AdqIACW9CtWb5KcZrHVYEWXHmkXtVYc+i4sFA63i093Gcza8rYiuaIkr+SQlJjMr8Y+J
         0BVfiAHXGAmKQofNFTWgSDMLpG1YxS6b0tr1qVUfK/AnHvyBq3fLrQFq43f1gMJ+L3Fv
         nrl4XxcJ2ergM3BSNaiw0o+hTIbuQ4Xz5kMZS0DEACxq+iQnhIh3GfMD57dLiciUpKyK
         OziIED3fJf39Wqw+F+Jncx8KluKL5DcD1n7bzc++s8vFIhwpiUTY1A69S8mYG6weTIVR
         qL0w==
X-Gm-Message-State: AOJu0YykqUtPK2KwMXyAvqe/VCjNnAIHvwZxtfPttf4n9mk/Up4FpqcY
	xsN2rgq0GCNdusSMzBUuGCgUkvEuL0zQRPhi+DoWlfRsjvhy2hY1XRqpNmav4x70Y4byJdqJUqM
	OhUQW7bqa9i2+yIQ/3PGjeteJsIJRZwOEKjrNPwyZjQ1NoPKMsoGQsQ==
X-Google-Smtp-Source: AGHT+IHAROMy/cB3HOu3w6A6JLbOWfYSJqmn6uKnFfZuqgvQOEtL5FV4rtpnJW172/FyHwehv25+add8CdgRSyI6T4w=
X-Received: by 2002:a17:906:1406:b0:a2f:b9bf:3955 with SMTP id
 p6-20020a170906140600b00a2fb9bf3955mr4586301ejc.21.1706544996610; Mon, 29 Jan
 2024 08:16:36 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
 <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com> <alpine.DEB.2.22.394.2401221434440.2287888@ubuntu-linux-20-04-desktop>
 <ecddb385-fc87-412b-a956-0a08237cc120@suse.com> <9ef401a61cce3ceffb000697fe671339b4492e20.camel@infradead.org>
In-Reply-To: <9ef401a61cce3ceffb000697fe671339b4492e20.camel@infradead.org>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 29 Jan 2024 16:16:00 +0000
Message-ID: <CAO-mL=yP5j_G3fvGLEgWwajy_Vdt=yDnLR8gw52mu3+4=BY+2A@mail.gmail.com>
Subject: Re: Community Process Group - Proposal
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, committers@xenproject.org, 
	advisory-board@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000510e2c061017f858"

--000000000000510e2c061017f858
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you everyone for your feedback so far.

I will be sending out a formal vote to committers this week on this
proposal.

Once I receive the results I will announce to xen-devel the next steps or
if any further changes are needed.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Wed, Jan 24, 2024 at 1:21=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:

> On Tue, 2024-01-23 at 08:34 +0100, Jan Beulich wrote:
> > On 22.01.2024 23:47, Stefano Stabellini wrote:
> > > On Mon, 22 Jan 2024, Jan Beulich wrote:
> > > > What definitely needs clarifying is what "review" is: Are R-b tags
> > > > counted, or is it the number of replies sent commenting on patches?
> > >
> > > Yes, I think this needs to be clarified. I would say Reviewed-by tags=
.
> >
> > Which may end up unfair. It's not uncommon for one person to do a lot
> > of review on a patch, and for someone else to then ack the final
> > version that goes in. In the end this is then no different from basing
> > the decision on simple numbers, without regard to actual (potentially
> > heavily differing) effort behind each individual instance.
>
>
> Perhaps that isn't such a bad thing. It would mean that a hypothetical
> reviewer who only ever nitpicks and is holding up progress of a patch
> which others find acceptable does not get 'credit' for reviewing that
> particular patch.
>

--000000000000510e2c061017f858
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you everyone for your feedback so far.=C2=A0<div><br=
></div><div>I will be sending out a formal vote to committers this week on =
this proposal.=C2=A0</div><div><br></div><div>Once I receive the results I =
will announce to xen-devel the next steps or if any further changes are nee=
ded.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many t=
hanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rg=
b(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)=
">Xen Project=C2=A0<br></div></div></div></div></div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan =
24, 2024 at 1:21=E2=80=AFPM David Woodhouse &lt;<a href=3D"mailto:dwmw2@inf=
radead.org" target=3D"_blank">dwmw2@infradead.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2024-01-23 at 08:3=
4 +0100, Jan Beulich wrote:<br>
&gt; On 22.01.2024 23:47, Stefano Stabellini wrote:<br>
&gt; &gt; On Mon, 22 Jan 2024, Jan Beulich wrote:<br>
&gt; &gt; &gt; What definitely needs clarifying is what &quot;review&quot; =
is: Are R-b tags<br>
&gt; &gt; &gt; counted, or is it the number of replies sent commenting on p=
atches?<br>
&gt; &gt; <br>
&gt; &gt; Yes, I think this needs to be clarified. I would say Reviewed-by =
tags.<br>
&gt; <br>
&gt; Which may end up unfair. It&#39;s not uncommon for one person to do a =
lot<br>
&gt; of review on a patch, and for someone else to then ack the final<br>
&gt; version that goes in. In the end this is then no different from basing=
<br>
&gt; the decision on simple numbers, without regard to actual (potentially<=
br>
&gt; heavily differing) effort behind each individual instance.<br>
<br>
<br>
Perhaps that isn&#39;t such a bad thing. It would mean that a hypothetical<=
br>
reviewer who only ever nitpicks and is holding up progress of a patch<br>
which others find acceptable does not get &#39;credit&#39; for reviewing th=
at<br>
particular patch.<br>
</blockquote></div>

--000000000000510e2c061017f858--

