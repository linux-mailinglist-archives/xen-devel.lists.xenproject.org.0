Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40151745B59
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 13:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558063.871859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGHuV-0003gl-5S; Mon, 03 Jul 2023 11:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558063.871859; Mon, 03 Jul 2023 11:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGHuU-0003dn-WD; Mon, 03 Jul 2023 11:40:03 +0000
Received: by outflank-mailman (input) for mailman id 558063;
 Mon, 03 Jul 2023 11:40:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j+Cz=CV=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qGHuT-0003Ml-Jz
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 11:40:01 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d65f0b-1996-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 13:39:58 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so6460803e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jul 2023 04:39:58 -0700 (PDT)
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
X-Inumbo-ID: 56d65f0b-1996-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688384398; x=1690976398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TaTthgEGqQq8CQcmAUHWGWYwkOxiznWgrpiEPOH7chE=;
        b=EhDDhJOBpdxVKCGdk4YRvkujlGjbvTUd/WpQk0gmbQlBRDCWp4Pr0Z5bOrOUvkEZa0
         UwwMFf2mrWpjGIu/YIJwAeo3g/zRFqY9sXaNewK+GVhczVInKU9ZH2SKcRDyyR94w0qL
         I4FYUt2jbrI/20eGzaAl9x6P643MqoYRV6Vmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384398; x=1690976398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaTthgEGqQq8CQcmAUHWGWYwkOxiznWgrpiEPOH7chE=;
        b=NLOM+pUKYgYwMYTG/HKLjPi+74dX1M3LfTCYVfHgzpBu9ci7c+wmu6a4KxMoVnMeie
         mHR6lvyrKXSyFBmF3OXfZN38lOAV7Ft2JDukBMHiZ9+DTcJ3u6jmQPgpwLmiZa0dwY2W
         RCLxg018r1pry4w8K9FN62UNJYzGv6movYcCO7unvCycA/3KTOc99moqvDpy0Fg8txZs
         s3KB7ihfm2Q5nUSaBp3eFGRNrtUF5PK2SXxbzwstYtPTtJYPk++InA4vNOonBm36i5PM
         Tf5tjQfwvvnBxwUgOvx7aDJhdKOyMa8gqOc7m3VlKxIV30EpKasO4bFz9Mgplmh4bhei
         PeWQ==
X-Gm-Message-State: ABy/qLZsVdFcNT0yzXtf5h6Ie0TqbitV4lsEaAW4hpE4os+FRLRgPBCX
	yyMaU19GrNtNKjqOqaxKt2uLz9VmuRj5OSh/pCMiCw==
X-Google-Smtp-Source: APBJJlEizCxNim1c+KNIlGWUnM/Ni6hYyaMt0ttcO19uFhl3/fFEiKYrKwDwm3Xsa9B7PZY+L1qyuWg6OSr9zxUcJKo=
X-Received: by 2002:a05:6512:3612:b0:4f8:70f8:d424 with SMTP id
 f18-20020a056512361200b004f870f8d424mr5795647lfs.65.1688384398270; Mon, 03
 Jul 2023 04:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230630113756.672607-1-george.dunlap@cloud.com> <42d6cf5e-03ab-a55b-a4d5-54bd063f793d@xen.org>
In-Reply-To: <42d6cf5e-03ab-a55b-a4d5-54bd063f793d@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 3 Jul 2023 12:39:47 +0100
Message-ID: <CA+zSX=bVtNBUpEW1rFuXZAh-mPXXmLKEOwE1e3igSo5RdV+qYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000004db69f05ff93a0c7"

--0000000000004db69f05ff93a0c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 6:48=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:

> Hi George,
>
> On 30/06/2023 12:37, George Dunlap wrote:
> > The credit scheduler tries as hard as it can to ensure that it always
> > runs scheduling units with positive credit (PRI_TS_UNDER) before
> > running those with negative credit (PRI_TS_OVER).  If the next
> > runnable scheduling unit is of priority OVER, it will always run the
> > load balancer, which will scour the system looking for another
> > scheduling unit of the UNDER priority.
> >
> > Unfortunately, as the number of cores on a system has grown, the cost
> > of the work-stealing algorithm has dramatically increased; a recent
> > trace on a system with 128 cores showed this taking over 50
> > microseconds.
> >
> > Add a parameter, load_balance_ratelimit, to limit the frequency of
> > load balance operations on a given pcpu.  Default this to 1
> > millisecond.
> >
> > Invert the load balancing conditional to make it more clear, and line
> > up more closely with the comment above it.
> >
> > Overall it might be cleaner to have the last_load_balance checking
> > happen inside csched_load_balance(), but that would require either
> > passing both now and spc into the function, or looking them up again;
> > both of which seemed to be worse than simply checking and setting the
> > values before calling it.
> >
> > Without this patch, on a system with a vcpu:pcpu ratio of 2:1, running
> > Windows guests (which will end up calling YIELD during spinlock
> > contention), this patch increased performance significantly.
>
> I don't understand this sentence. Did you intende to write
>
> "Without this patch, ..., the performance are significantly worse"?
>

Hmm, yes this was bad editing.  The first clause was written when I was
expecting to include actual numbers; but when I looked at the internal
numbers I had available, they weren't easy to summarize.  The revised
sentence should have simply been:

"On a system with a vcpu:pcpu ratio of 2:1, running Windows guests (which
will end up calling YIELD during spinlock contention), this patch increased
performance significantly."



> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instruction
> for TLB management if
> >   it is available.  This option can be used to cause Xen to fall back t=
o
> >   older mechanisms, which are generally slower.
> >
> > +### load-balance-ratelimit
> > +> `=3D <integer>`
> > +
> > +The minimum interval between load balancing events on a given pcpu.
> > +At the moment only credit honors this parameter.
>
> I would suggest to mention the default value. So a reader don't have to
> look up in the code to find out.
>
> Also, AFAICT, there is max value. I would mention it here too.
>

Ack


> > +/*
> > + * Minimum delay, in microseconds, between load balance operations.
> > + * This prevents spending too much time doing load balancing,
> particularly
> > + * when the system has a high number of YIELDs due to spinlock priorit=
y
> inversion.
> > + */
> > +static unsigned int __read_mostly load_balance_ratelimit_us =3D
> CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
>
> AFAICT, load_balance_ratelimit_us is not updated after boot. So
> shouldn't the attribute be __ro_after_init?
>

Ack


> +#define XEN_SYSCTL_CSCHED_LB_RATE_MAX_US (1000000)
> > +    uint32_t load_balance_ratelimit_us;
>
> Shouldn't this change bump the sysctl interface version?
>

Er, yes.

v2 on its way.

 -George

--0000000000004db69f05ff93a0c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 30, 2023 at 6:48=E2=80=AF=
PM Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">jul=
ien@xen.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi George,<br>
<br>
On 30/06/2023 12:37, George Dunlap wrote:<br>
&gt; The credit scheduler tries as hard as it can to ensure that it always<=
br>
&gt; runs scheduling units with positive credit (PRI_TS_UNDER) before<br>
&gt; running those with negative credit (PRI_TS_OVER).=C2=A0 If the next<br=
>
&gt; runnable scheduling unit is of priority OVER, it will always run the<b=
r>
&gt; load balancer, which will scour the system looking for another<br>
&gt; scheduling unit of the UNDER priority.<br>
&gt; <br>
&gt; Unfortunately, as the number of cores on a system has grown, the cost<=
br>
&gt; of the work-stealing algorithm has dramatically increased; a recent<br=
>
&gt; trace on a system with 128 cores showed this taking over 50<br>
&gt; microseconds.<br>
&gt; <br>
&gt; Add a parameter, load_balance_ratelimit, to limit the frequency of<br>
&gt; load balance operations on a given pcpu.=C2=A0 Default this to 1<br>
&gt; millisecond.<br>
&gt; <br>
&gt; Invert the load balancing conditional to make it more clear, and line<=
br>
&gt; up more closely with the comment above it.<br>
&gt; <br>
&gt; Overall it might be cleaner to have the last_load_balance checking<br>
&gt; happen inside csched_load_balance(), but that would require either<br>
&gt; passing both now and spc into the function, or looking them up again;<=
br>
&gt; both of which seemed to be worse than simply checking and setting the<=
br>
&gt; values before calling it.<br>
&gt; <br>
&gt; Without this patch, on a system with a vcpu:pcpu ratio of 2:1, running=
<br>
&gt; Windows guests (which will end up calling YIELD during spinlock<br>
&gt; contention), this patch increased performance significantly.<br>
<br>
I don&#39;t understand this sentence. Did you intende to write<br>
<br>
&quot;Without this patch, ..., the performance are significantly worse&quot=
;?<br></blockquote><div><br></div><div>Hmm, yes this was bad editing.=C2=A0=
 The first clause was written when I was expecting to include actual number=
s; but when I looked at the internal numbers I had available, they weren&#3=
9;t easy to summarize.=C2=A0 The revised sentence should have simply been:<=
/div><div><br></div><div>&quot;On a system with a vcpu:pcpu ratio of 2:1, r=
unning Windows guests (which will end up calling YIELD during spinlock cont=
ention), this patch increased performance significantly.&quot;</div><div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; --- a/docs/misc/xen-command-line.pandoc<br>
&gt; +++ b/docs/misc/xen-command-line.pandoc<br>
&gt; @@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instructio=
n for TLB management if<br>
&gt;=C2=A0 =C2=A0it is available.=C2=A0 This option can be used to cause Xe=
n to fall back to<br>
&gt;=C2=A0 =C2=A0older mechanisms, which are generally slower.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +### load-balance-ratelimit<br>
&gt; +&gt; `=3D &lt;integer&gt;`<br>
&gt; +<br>
&gt; +The minimum interval between load balancing events on a given pcpu.<b=
r>
&gt; +At the moment only credit honors this parameter.<br>
<br>
I would suggest to mention the default value. So a reader don&#39;t have to=
 <br>
look up in the code to find out.<br>
<br>
Also, AFAICT, there is max value. I would mention it here too.<br></blockqu=
ote><div><br></div><div>Ack</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; +/*<br>
&gt; + * Minimum delay, in microseconds, between load balance operations.<b=
r>
&gt; + * This prevents spending too much time doing load balancing, particu=
larly<br>
&gt; + * when the system has a high number of YIELDs due to spinlock priori=
ty inversion.<br>
&gt; + */<br>
&gt; +static unsigned int __read_mostly load_balance_ratelimit_us =3D CSCHE=
D_DEFAULT_LOAD_BALANCE_RATELIMIT_US;<br>
<br>
AFAICT, load_balance_ratelimit_us is not updated after boot. So <br>
shouldn&#39;t the attribute be __ro_after_init?<br></blockquote><div><br></=
div><div>Ack</div><div><br></div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; +#define XEN_SYSCTL_CSCHED_LB_RATE_MAX_US (1000000)<br>
&gt; +=C2=A0 =C2=A0 uint32_t load_balance_ratelimit_us;<br>
<br>
Shouldn&#39;t this change bump the sysctl interface version?<br></blockquot=
e><div><br></div><div>Er, yes.</div><div><br></div><div>v2 on its way.</div=
><div><br></div><div>=C2=A0-George</div></div></div>

--0000000000004db69f05ff93a0c7--

