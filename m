Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635117ADBD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 18:59:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9ujH-00051S-5j; Thu, 05 Mar 2020 17:56:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pkLT=4W=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1j9ujF-00051N-Vq
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 17:56:14 +0000
X-Inumbo-ID: 99d66a84-5f0a-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99d66a84-5f0a-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 17:56:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m25so7875708edq.8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhVvFeAPXnde3i4p9PQSutZxSiwhKvYxMDXT8ObLmbc=;
 b=sUUOoajnWDK2rkcbD6qbc3LoUfa5iPqpS4QUQJ0fSs1BPX5kpq/qDU/3FO36cbAS2S
 +n5+PGam9ILVxs4CfxMmUsKcqV9chwuLzRK/tybxEjXx6kxta+Yn/0nn2lngQn+Ue87R
 wDtaWhh9Q2o88yGfyhwdKNpN36W7N9uUxYklSG+gGnozFLj8WQTkRfBvTqM8wjWAG/Rw
 S6xrmQ7g1lfxjrbsPI4XFR6oOJz0RG7/EXRDgDz/gxsAxizQJNkwJEtVc7PQ0BQ0W6TG
 y8/oS+14MIGVjaG5i27IXVQ8OmlJmDNS8Zydskfg4wU9GZn46Y6R122JaJy3XfXbg3GD
 XdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhVvFeAPXnde3i4p9PQSutZxSiwhKvYxMDXT8ObLmbc=;
 b=m26hsQbFrcPYXhDmU0toLbjrSjPlzUH8yuvEDw770Sy4s9DGCperHztxVuOGiPBmAL
 1DsAwDj7PUX85qTdHATG+TxY1TsFACIQyyckpvqD0ZVEpEVCoQe6sZDzsM0Pnv5myBUf
 +l56I6i6XEnW5uds6/vHS3DIA1Kwmhlz1Sk9rb5Sg33cxoLcNbLn9PQAXsInh6d48106
 actBrBdcVPTaDcaN/BU9xQn5vE9BKnEZkd8+846+gyMHUFZyUFg7rsRMT+7hH6Enj1Sr
 D4JGWoT6UksOyzoYGk5g+CuKFIYM/ck090YXjS3efPSjgT3X7ZQYVvmbjRm+L0G2qzQf
 Q5Aw==
X-Gm-Message-State: ANhLgQ1ay84qrh9+C8YeNQPLzm3eEcrNiIfg0GYaOizW4iqgyttoRi+U
 zyNqmsMg5ZhAF3+dstBOJ5IFHw4oRy9ZZvbq6wUN+aO1
X-Google-Smtp-Source: ADFU+vvdtlzmCF8Udyhd6Qx4lGvBKsFak7arH8pfjbYaj57OdycpqRnurXAKcnaZNtDw6Jv6EiTqVfW0qIL5CueufgM=
X-Received: by 2002:a17:906:1e12:: with SMTP id
 g18mr8092725ejj.309.1583430971972; 
 Thu, 05 Mar 2020 09:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20200226152013.12200-1-jandryuk@gmail.com>
 <20200226152013.12200-2-jandryuk@gmail.com>
 <24150.37734.588539.567057@mariner.uk.xensource.com>
In-Reply-To: <24150.37734.588539.567057@mariner.uk.xensource.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 5 Mar 2020 17:56:00 +0000
Message-ID: <CAFLBxZYLOEpfZQp0enaAU-N1r5N33p1BuhGESuZnvmXc=ZHk2w@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce
 cmp-fd-file-inode utility
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: multipart/mixed; boundary="===============1197288003865285838=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1197288003865285838==
Content-Type: multipart/alternative; boundary="0000000000009c608a05a01f400c"

--0000000000009c608a05a01f400c
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 3:49 PM Ian Jackson <ian.jackson@citrix.com> wrote:

> Jason Andryuk writes ("[PATCH 1/2] tools/helpers: Introduce
> cmp-fd-file-inode utility"):
> > This is a C implementation of the perl code inside of locking.sh to
> > check that the locked file descriptor and lock file share the same inode
> > and therefore match.  One change from the perl version is replacing
> > printing "y" on success with exit values of 0 (shell True) and 1 (shell
> > False).
>
> Maybe it would be better to use stat(1) ?  On Linux
>    stat -L -c%D.%i /dev/stdin blah.lock
> or some such, and then compare the two numbers.
>
> I'm reluctant to host a general-purpose shell utility in xen.git, no
> matter how useful...
>

Do you have any other suggestions?

I agree it's not great to have loads of little helper programs lying
around.  But it's a lot better than pulling in a full perl installation for
a single line.

I sort of feel like part of the issue is that this is written in shell at
all.  The necessity to fall back to perl seems to me to indicate that bash
is the wrong language for what needs to happen here.  If locking.sh were
locking.c instead, this entire series probably wouldn't be necessary.

If no better options are forthcoming, I think we should accept something
like this until something better comes along.

 -George

--0000000000009c608a05a01f400c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 26, 2020 at 3:49 PM Ian Jacks=
on &lt;<a href=3D"mailto:ian.jackson@citrix.com">ian.jackson@citrix.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Jason Andryuk writes (&quot;[PATCH 1/2] tools/helper=
s: Introduce cmp-fd-file-inode utility&quot;):<br>
&gt; This is a C implementation of the perl code inside of locking.sh to<br=
>
&gt; check that the locked file descriptor and lock file share the same ino=
de<br>
&gt; and therefore match.=C2=A0 One change from the perl version is replaci=
ng<br>
&gt; printing &quot;y&quot; on success with exit values of 0 (shell True) a=
nd 1 (shell<br>
&gt; False).<br>
<br>
Maybe it would be better to use stat(1) ?=C2=A0 On Linux<br>
=C2=A0 =C2=A0stat -L -c%D.%i /dev/stdin blah.lock<br>
or some such, and then compare the two numbers.<br>
<br>
I&#39;m reluctant to host a general-purpose shell utility in xen.git, no<br=
>
matter how useful...<br></blockquote></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Do you have any other suggestions?</div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I agree it&#39=
;s not great to have loads of little helper programs lying around.=C2=A0 Bu=
t it&#39;s a lot better than pulling in a full perl installation for a sing=
le line.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">I sort of feel like part of the issue is that this is written in shell a=
t all.=C2=A0 The necessity to fall back to perl seems to me to indicate tha=
t bash is the wrong language for what needs to happen here.=C2=A0 If lockin=
g.sh were locking.c instead, this entire series probably wouldn&#39;t be ne=
cessary.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">If no better options are forthcoming, I think we should accept something=
 like this until something better comes along.</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">=C2=A0-George<br></div></div>

--0000000000009c608a05a01f400c--


--===============1197288003865285838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1197288003865285838==--

