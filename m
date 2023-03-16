Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA876BD243
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510644.788699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcoVI-0004Qd-VT; Thu, 16 Mar 2023 14:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510644.788699; Thu, 16 Mar 2023 14:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcoVI-0004OU-RF; Thu, 16 Mar 2023 14:22:52 +0000
Received: by outflank-mailman (input) for mailman id 510644;
 Thu, 16 Mar 2023 14:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9DP6=7I=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pcoVH-0004OM-0p
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:22:51 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0724fa1c-c406-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 15:22:48 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id b10so1906629ljr.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:22:48 -0700 (PDT)
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
X-Inumbo-ID: 0724fa1c-c406-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678976568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lKb/+pb9bjoimOuRe3ZtKUo81LKWT5Zgm2YSS91Y/ew=;
        b=hTZDmjBjVdv18KU+EjAHPJpjBpofDafIZDlvzgJBEeZF1+x9UdWhlL3IuZ4SwguvJG
         tJBnY9h3WCwNGFV8Lu/N7PHDml5dl1mFB/SB1/sU4F/PejFmZBCtXTF1VeQy4sUtWhbW
         Co+25+xgn1zGcC+pxbBV5ivy8WenVKCB3oSFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678976568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKb/+pb9bjoimOuRe3ZtKUo81LKWT5Zgm2YSS91Y/ew=;
        b=tSrSE5kQ/Zzco9h+bJnP28q5SIXWnisGkCgH0sg8ccpWraNwRG/q1dxTY0rV7hIl/F
         6WVCDUa1+ZvedLbf7tV/VAqSa11M3/A9TLxOQf/FvjMqDdhb0P/S+W/sKqbV++4ujiU9
         qKy0GzSqUxmcGvh5Y0t0CyygI8aR3KTiBlFWhQKbRXGf5DngN1CSXoERkOBcJPPbvyDd
         FS+KeTOJPdEMcxzWiseLqrnc6EmqdhTde0as6mvkV+Rf0bZcvvo/kKlH+wf0XBnWPGSe
         SDRt5P/YVCN4eDG1HUkerYcmHZOzPmyGnJ/JA+zwQZq+yuJXI3s3B4r0AcdIRzt73jMP
         vi5Q==
X-Gm-Message-State: AO0yUKXXt6zNvP42/kvGvq/VmA/KKa/6ea32KjYcRTskzC+YmWvlWQQv
	kzYwdTm4L2xUVWuGAxZ6BaGAktR0QxNMlIrk/c6yrw==
X-Google-Smtp-Source: AK7set80psIKX2xtSzam6vVB9ttwJQ6M6SIfxdiGPWykpN6yjykcn6tOz+8jMxiTNye680JB9znw4rQ6wBBkU/Grc8E=
X-Received: by 2002:a2e:2419:0:b0:299:7665:7e61 with SMTP id
 k25-20020a2e2419000000b0029976657e61mr933571ljk.6.1678976568328; Thu, 16 Mar
 2023 07:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230316102635.6497-1-michal.orzel@amd.com> <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
 <2cfc0751-4360-5899-c93a-56ef952a6b2b@amd.com>
In-Reply-To: <2cfc0751-4360-5899-c93a-56ef952a6b2b@amd.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 16 Mar 2023 14:22:37 +0000
Message-ID: <CA+zSX=ZPO6jknRVXgAreu65CHQA_3LvVc0FYbFues1==PV7mvA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
To: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000f117b005f70531cd"

--000000000000f117b005f70531cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 2:15=E2=80=AFPM Michal Orzel <michal.orzel@amd.com>=
 wrote:

>
>
> On 16/03/2023 12:11, Jan Beulich wrote:
> > Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
> >
> >
> > On 16.03.2023 11:26, Michal Orzel wrote:
> >> --- a/xen/drivers/char/console.c
> >> +++ b/xen/drivers/char/console.c
> >> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
> >>      }
> >>      else
> >>      {
> >> -        console_rx++;
> >> +        unsigned int next_rx =3D console_rx + 1;
> >> +
> >> +        /* Skip switching serial input to non existing domains */
> >> +        while ( next_rx < max_init_domid + 1 )
> >> +        {
> >> +            struct domain *d =3D rcu_lock_domain_by_id(next_rx - 1);
> >> +
> >> +            if ( d )
> >> +            {
> >> +                rcu_unlock_domain(d);
> >> +                break;
> >> +            }
> >> +
> >> +            next_rx++;
> >> +        }
> >> +
> >> +        console_rx =3D next_rx;
> >> +
> >>          printk("*** Serial input to DOM%d", console_rx - 1);
> >>      }
> >
> > While at the first glance (when you sent it in reply to v1) it looked
> okay,
> > I'm afraid it really isn't: Please consider what happens when the last =
of
> > the DomU-s doesn't exist anymore. (You don't really check whether it
> still
> > exists, because the range check comes ahead of the existence one.) In
> that
> > case you want to move from second-to-last to Xen. I expect the entire
> > if/else construct wants to be inside the loop.
> I did this deliberately because I do not think the situation you describe
> is possible
> (i.e. no domains at all - Xen still usable). With hardware domain in
> place, we can e.g. destroy the domain
> which would invoke domain_kill() -> domain_destroy() that would free
> domain struct.
> Without hwdom, the domain cannot kill/destroy itself. It can do the
> shutdown but it will not
> destroy it (at least this is what I tested). So I do not think there can
> be a scenario where
> there is not a single domain while Xen running and be usable.


We've actually been discussing something like this.  Consider if someone
wanted to use Xen as part of a system architected like Amazon's Nitro: You
could have a DPU that ran the "toolstack", and gave Xen commands to create
or destroy domains.  It could dynamically create SRIOV PCI devices to be
passed directly through to guests.  In this case, you might run into a
situation where no VMs existed, and yet the system was not dead.

 -George

--000000000000f117b005f70531cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 16, 2023 at 2:15=E2=80=AF=
PM Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@am=
d.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On 16/03/2023 12:11, Jan Beulich wrote:<br>
&gt; Caution: This message originated from an External Source. Use proper c=
aution when opening attachments, clicking links, or responding.<br>
&gt; <br>
&gt; <br>
&gt; On 16.03.2023 11:26, Michal Orzel wrote:<br>
&gt;&gt; --- a/xen/drivers/char/console.c<br>
&gt;&gt; +++ b/xen/drivers/char/console.c<br>
&gt;&gt; @@ -490,7 +490,24 @@ static void switch_serial_input(void)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 console_rx++;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int next_rx =3D console_rx +=
 1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip switching serial input to non=
 existing domains */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ( next_rx &lt; max_init_domid +=
 1 )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct domain *d =3D rc=
u_lock_domain_by_id(next_rx - 1);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( d )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_unloc=
k_domain(d);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_rx++;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 console_rx =3D next_rx;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;*** Serial input to=
 DOM%d&quot;, console_rx - 1);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; While at the first glance (when you sent it in reply to v1) it looked =
okay,<br>
&gt; I&#39;m afraid it really isn&#39;t: Please consider what happens when =
the last of<br>
&gt; the DomU-s doesn&#39;t exist anymore. (You don&#39;t really check whet=
her it still<br>
&gt; exists, because the range check comes ahead of the existence one.) In =
that<br>
&gt; case you want to move from second-to-last to Xen. I expect the entire<=
br>
&gt; if/else construct wants to be inside the loop.<br>
I did this deliberately because I do not think the situation you describe i=
s possible<br>
(i.e. no domains at all - Xen still usable). With hardware domain in place,=
 we can e.g. destroy the domain<br>
which would invoke domain_kill() -&gt; domain_destroy() that would free dom=
ain struct.<br>
Without hwdom, the domain cannot kill/destroy itself. It can do the shutdow=
n but it will not<br>
destroy it (at least this is what I tested). So I do not think there can be=
 a scenario where<br>
there is not a single domain while Xen running and be usable.</blockquote><=
div><br></div><div>We&#39;ve actually been discussing something like this.=
=C2=A0 Consider if someone wanted to use Xen as part of a system architecte=
d like Amazon&#39;s Nitro: You could have a DPU that ran the &quot;toolstac=
k&quot;, and gave Xen commands to create or destroy domains.=C2=A0 It could=
 dynamically create SRIOV PCI devices to be passed directly through to gues=
ts.=C2=A0 In this case, you might run into a situation where no VMs existed=
, and yet the system was not dead.</div><div><br></div><div>=C2=A0-George</=
div></div></div>

--000000000000f117b005f70531cd--

