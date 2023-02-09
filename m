Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB6690DDC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 17:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492720.762438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9QB-0006Dx-Rb; Thu, 09 Feb 2023 16:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492720.762438; Thu, 09 Feb 2023 16:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9QB-0006AS-Ms; Thu, 09 Feb 2023 16:05:15 +0000
Received: by outflank-mailman (input) for mailman id 492720;
 Thu, 09 Feb 2023 16:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIAB=6F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQ9QA-00067S-Cl
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 16:05:14 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c3e662-a893-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 17:05:09 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id j17so3818972lfr.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 08:05:09 -0800 (PST)
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
X-Inumbo-ID: 86c3e662-a893-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uU5XW1oBviPYVXjF6pnAUE1uhzLd8k2qXYASLluuumw=;
        b=lRk98YwJow6YTwLEXa2koWXSbFNO5LXYaT1AdH0/OuDHfuudolrRxTMnOXrTCALf64
         BvHviFbxfFWDQJcMfsJRKXodcBa+Iv0C2zUELg+tAuZDNk1QI5S3Iy0uUrqGXmUld48C
         6Qq+2oy5zgsz5KDkdESou3LJnqKwEP4obOdVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU5XW1oBviPYVXjF6pnAUE1uhzLd8k2qXYASLluuumw=;
        b=hKszUZ06Kf33GFNrwLsmUqygydrXztr6wp1BQMxPrEzxr1F1hGREgVP67P1B506s/D
         0CHistK65jnCOUwr2fNxLVRpmARmBsMc0WMhC5aikLcmodCOvkjfTcL1//aQNuJ6pmE2
         oZC5BgQ+9/N4ORb9OKfS/Cd/KBNDehIi+2g+JNkEEoX2oDcynG+lWSx3TpRZ/nDNteGE
         yeJ6QrvH4qzX4Wca3wsS8sVJf+HI4WDdxS2ZimTvzLOBv9U/K3KqHjl9kz4jLYbyXNBh
         vPvb/DJR+VkB5H8+D9Wx7kAy6hmj88FqRxCD8fW572PPOIE9d1/QCV2N7luKezvB53z8
         OwwA==
X-Gm-Message-State: AO0yUKW8zEtGi7EIzmlpobRxzWRqfmMyICggpMG/J6TuljcS2vBddbMu
	T4P5LytBEJeYxVauBbSyH2hE2RWOipD2v9okoQfA01iWE6z9zA==
X-Google-Smtp-Source: AK7set8e+D3Y3Vo+sWYXLOkH6j/6C+3fvDGLGu/oPiUTpx4BPdNjK6Va+XwZmmxFPJ7rkJm1Q+TEnvuURhee0Yhchmo=
X-Received: by 2002:ac2:4830:0:b0:4d3:f1f7:9632 with SMTP id
 16-20020ac24830000000b004d3f1f79632mr2322816lft.51.1675958708419; Thu, 09 Feb
 2023 08:05:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com>
 <CA+zSX=a68fwMjAVRYC52894L4VsaHz9KACRVoewAyBTiNKJuYw@mail.gmail.com> <Y+ULqoKAd3qTeA5I@perard.uk.xensource.com>
In-Reply-To: <Y+ULqoKAd3qTeA5I@perard.uk.xensource.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 9 Feb 2023 16:04:57 +0000
Message-ID: <CA+zSX=Zg6FCtB+WcnhZ6+HacxjdgS+_5os=5UKZLwvtNFd7P8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Build system: Replace git:// and http:// with https://
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000795ff905f4468b09"

--000000000000795ff905f4468b09
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 3:05 PM Anthony PERARD <anthony.perard@citrix.com>
wrote:

> On Thu, Feb 09, 2023 at 02:01:52PM +0000, George Dunlap wrote:
> > On Wed, Feb 8, 2023 at 8:58 PM Demi Marie Obenour <
> > demi@invisiblethingslab.com> wrote:
> >
> > > Obtaining code over an insecure transport is a terrible idea for
> > > blatently obvious reasons.  Even for non-executable data, insecure
> > > transports are considered deprecated.
> > >
> > > This patch enforces the use of secure transports in the build system.
> > >
> > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > >
> >
> > Hey Demi,
> >
> > Thanks for this series -- we definitely want the build system to use
> secure
> > transports when available.  Can you confirm that you've tested the "+s"
> > versions of all the URLs in this patch, and verified that they actually
> > work?
>
> :'(   -> https://gitlab.com/xen-project/patchew/xen/-/pipelines/771746628/
>
> Our GitLab tests are very unhappy with the switch to TLS. Too many
> containers aren't recent enough, and don't have the right certificates
> (Let's encrypt I guess).
>
> I've only looked at two failures:
>     ubuntu-focal-clang:
>         fatal: unable to access '
> https://xenbits.xen.org/git-http/qemu-xen.git/': server certificate
> verification failed. CAfile: none CRLfile: none
>     ubuntu-xenial-gcc:
>         ERROR: cannot verify xenbits.xen.org's certificate, issued by
> 'CN=R3,O=Let\'s Encrypt,C=US':
>
> I'll try to have a look at updating those containers.
>

Just to clarify: This isn't an argument against the patch; only perhaps an
argument to delay it being checked in until we get the containers fixed.

Another advantage of this patch may be that it will naturally prod us to
update the containers whenever the root certificates expire. :-D

 -George

--000000000000795ff905f4468b09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023 at 3:05 PM Anthon=
y PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com">anthony.perard@ci=
trix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Feb 09, 2023 at 02:01:52PM +0000, George Dunlap wrote:<br>
&gt; On Wed, Feb 8, 2023 at 8:58 PM Demi Marie Obenour &lt;<br>
&gt; <a href=3D"mailto:demi@invisiblethingslab.com" target=3D"_blank">demi@=
invisiblethingslab.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Obtaining code over an insecure transport is a terrible idea for<=
br>
&gt; &gt; blatently obvious reasons.=C2=A0 Even for non-executable data, in=
secure<br>
&gt; &gt; transports are considered deprecated.<br>
&gt; &gt;<br>
&gt; &gt; This patch enforces the use of secure transports in the build sys=
tem.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Demi Marie Obenour &lt;<a href=3D"mailto:demi@invi=
siblethingslab.com" target=3D"_blank">demi@invisiblethingslab.com</a>&gt;<b=
r>
&gt; &gt;<br>
&gt; <br>
&gt; Hey Demi,<br>
&gt; <br>
&gt; Thanks for this series -- we definitely want the build system to use s=
ecure<br>
&gt; transports when available.=C2=A0 Can you confirm that you&#39;ve teste=
d the &quot;+s&quot;<br>
&gt; versions of all the URLs in this patch, and verified that they actuall=
y<br>
&gt; work?<br>
<br>
:&#39;(=C2=A0 =C2=A0-&gt; <a href=3D"https://gitlab.com/xen-project/patchew=
/xen/-/pipelines/771746628/" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/xen-project/patchew/xen/-/pipelines/771746628/</a><br>
<br>
Our GitLab tests are very unhappy with the switch to TLS. Too many<br>
containers aren&#39;t recent enough, and don&#39;t have the right certifica=
tes<br>
(Let&#39;s encrypt I guess).<br>
<br>
I&#39;ve only looked at two failures:<br>
=C2=A0 =C2=A0 ubuntu-focal-clang:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fatal: unable to access &#39;<a href=3D"https:/=
/xenbits.xen.org/git-http/qemu-xen.git/" rel=3D"noreferrer" target=3D"_blan=
k">https://xenbits.xen.org/git-http/qemu-xen.git/</a>&#39;: server certific=
ate verification failed. CAfile: none CRLfile: none<br>
=C2=A0 =C2=A0 ubuntu-xenial-gcc:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR: cannot verify <a href=3D"http://xenbits.=
xen.org" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org</a>&#39;s cer=
tificate, issued by &#39;CN=3DR3,O=3DLet\&#39;s Encrypt,C=3DUS&#39;:<br>
<br>
I&#39;ll try to have a look at updating those containers.<br></blockquote><=
div><br></div><div>Just to clarify: This isn&#39;t an argument against the =
patch; only perhaps an argument to delay it being checked in until we get t=
he containers fixed.</div><div><br></div><div>Another advantage of this pat=
ch may be that it will naturally prod us to update the containers whenever =
the root certificates expire. :-D</div><div><br></div><div>=C2=A0-George=C2=
=A0</div></div></div>

--000000000000795ff905f4468b09--

