Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D3D916D84
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 17:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747937.1155455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8T2-0007nB-IP; Tue, 25 Jun 2024 15:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747937.1155455; Tue, 25 Jun 2024 15:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8T2-0007kt-Ep; Tue, 25 Jun 2024 15:52:24 +0000
Received: by outflank-mailman (input) for mailman id 747937;
 Tue, 25 Jun 2024 15:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GB9f=N3=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sM8T0-0007je-M9
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 15:52:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7eb4fb5-330a-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 17:52:20 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a724cd0e9c2so307465466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 08:52:20 -0700 (PDT)
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
X-Inumbo-ID: e7eb4fb5-330a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719330740; x=1719935540; darn=lists.xenproject.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iMfgPVTpYpWf/KLeazN26NpVkDP/oLtxcqvESr87WVc=;
        b=Z2lp/MPk4fj0wcM5CEc5CoKL1PCQlj9qrhYn6PFY0x5zaMhxKBK7TEBn8rk5cqu9jo
         Jgp3TEYT7p8Q6Xa5nDtYsqPK5WaRDknt5J/TF2b95GUfCFoPF+PK/c6xs3zphSl/LUAG
         eALwMM7slbGil9KRceAyLW2+Bne6E22YlX0Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719330740; x=1719935540;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMfgPVTpYpWf/KLeazN26NpVkDP/oLtxcqvESr87WVc=;
        b=Nlk5Z69BiuHjFAZ7fZHMBWqybaquDGAb1PJ0t9XJ0H0idf+XrLGuXo93TJdGqVafwI
         NabMs7MQc4oNUXmAkXvSBP1Z2Qkqki7KDFyS2fPA1yhZrO4qHmd71OskvOsQpKfuVXt3
         B1JqirbHgss68wokPa52VTj4X3sIpjL0llnOuX86hAugv7J1/GZ99sH6uzjxSQ2YJOb6
         a3UlHGbruFzYNniHh+YRjDHAYZUPw4x1p+tTWdEsrs3AnlfUWc+7q833W6toMngdEmkD
         ijH4pJPYUCTXjAiTfOjwRQaHf5hIIvOqSDiUh+QDouC3Q8qjtZjxRj+CNqKtGTr/VthV
         tTKw==
X-Gm-Message-State: AOJu0YyHH0eGQFY104VnOPuIDeTo0KJcrOKKa29xBjPsUgOFqPsk3pLr
	kijIUlmfw66NxInWXe53GrTj1W6MqDzTmKLgLfzwZ0q4IRM6KmZQDOMgdDGdPGNhW+k7eczkszC
	9wTEtw9fJog0sz3yoJTaGjGXaTB3riSobQY8ZnvE6c8S7vk23
X-Received: by 2002:a17:907:c24d:b0:a72:5f9a:159b with SMTP id
 a640c23a62f3a-a725f9a199bmt342895066b.56.1719330739730; Tue, 25 Jun 2024
 08:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
 <ZnWee2hUmG42n/W7@l14> <667ae6e4.050a0220.21f03.212f@mx.google.com>
In-Reply-To: <667ae6e4.050a0220.21f03.212f@mx.google.com>
From: Matthew Barnes <matthew.barnes@cloud.com>
Date: Tue, 25 Jun 2024 16:51:58 +0100
Message-ID: <CAO_hw7wS3mROzA4Q1QYtNuz7iG25A_6F4UE-zrLiZaPQ17dNVw@mail.gmail.com>
Subject: [XEN PATCH] tools/misc: xen-hvmcrash: Inject #DF instead of
 overwriting RIP
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000fec3cb061bb8e107"

--000000000000fec3cb061bb8e107
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 21, 2024 at 03:38:36PM +0000, Anthony PERARD wrote:
> On Mon, Jun 03, 2024 at 03:59:18PM +0100, Matthew Barnes wrote:
> > diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
> > index 1d058fa40a47..8ef1beb388f8 100644
> > --- a/tools/misc/xen-hvmcrash.c
> > +++ b/tools/misc/xen-hvmcrash.c
> > @@ -38,22 +38,21 @@
> >  #include <sys/stat.h>
> >  #include <arpa/inet.h>
> >
> > +#define XC_WANT_COMPAT_DEVICEMODEL_API
> >  #include <xenctrl.h>
> >  #include <xen/xen.h>
> >  #include <xen/domctl.h>
> >  #include <xen/hvm/save.h>
>
> There's lots of headers that aren't used by the new codes and can be
> removed. (They were probably way too many headers included when this
> utility was introduced.)

I will remove the unnecessary headers in patch v2.

> > +    for (vcpu_id = 0; vcpu_id <= dominfo.max_vcpu_id; vcpu_id++) {
> > +        printf("Injecting #DF to vcpu ID #%d...\n", vcpu_id);
> > +        ret = xc_hvm_inject_trap(xch, domid, vcpu_id,
> > +                                X86_ABORT_DF,
>
> In the definition of xendevicemodel_inject_event(), the comment say to
> look at "enum x86_event_type" for possible event "type", but there's no
> "#DF" type, can we add this new one there before using it? (It's going
> to be something like X86_EVENTTYPE_*)

To my understanding, the event types enum refer to the kind of interrupt
being handled. In this case, it is a hardware exception, which already
exists as an entry in the enum definition.

The `vector` parameter describes the kind of exception. I just found
that exception vector macros are defined in `x86-defns.h`, so I will
include that and instead use `X86_EXC_DF` in patch v2.

The only other usage of `xc_hvm_inject_trap` is in `xen-access.c`, which
defines all the required vectors as macros at the top of the source file.
Hence, I did the same in `xen-hvmcrash.c` for patch v1.

Would it be a good idea to rewrite `xen-access.c` to use `x86-defns.h`
as well, in a later patch?

> > +                                XEN_DMOP_EVENT_hw_exc, 0,
> > +                                NULL, NULL);
>
> The new code doesn't build, "NULL" aren't integers.
>
> > +        if (ret < 0) {
> > +            fprintf(stderr, "Could not inject #DF to vcpu ID #%d\n",
vcpu_id);
> > +            perror("xc_hvm_inject_trap");
>
> Are you meant to print two error lines when there's an error? You can
> also use strerror() to convert an "errno" to a string.

I will use strerror and one print call in patch v2.

> Are you meant to keep inject into other vcpus even if one have failed?

Yes; xen-hvmcrash doesn't have to inject *all* vcpus to cause it to
crash.

> Should `xen-hvmcrash` return success when it failed to inject the double
> fault to all vcpus?

I will make xen-hvmcrash yield an error if no vcpus could be injected in
patch v2.

Matt

--000000000000fec3cb061bb8e107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote">On Fri, Jun 21, 2024 at 03:38:3=
6PM +0000, Anthony PERARD wrote:<br>
&gt; On Mon, Jun 03, 2024 at 03:59:18PM +0100, Matthew Barnes wrote:<br>
&gt; &gt; diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.=
c<br>
&gt; &gt; index 1d058fa40a47..8ef1beb388f8 100644<br>
&gt; &gt; --- a/tools/misc/xen-hvmcrash.c<br>
&gt; &gt; +++ b/tools/misc/xen-hvmcrash.c<br>
&gt; &gt; @@ -38,22 +38,21 @@<br>
&gt; &gt;=C2=A0 #include &lt;sys/stat.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;arpa/inet.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; +#define XC_WANT_COMPAT_DEVICEMODEL_API<br>
&gt; &gt;=C2=A0 #include &lt;xenctrl.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;xen/xen.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;xen/domctl.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;xen/hvm/save.h&gt;<br>
&gt; <br>
&gt; There&#39;s lots of headers that aren&#39;t used by the new codes and =
can be<br>
&gt; removed. (They were probably way too many headers included when this<b=
r>
&gt; utility was introduced.)<br>
<br>
I will remove the unnecessary headers in patch v2.<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 for (vcpu_id =3D 0; vcpu_id &lt;=3D dominfo.max_vc=
pu_id; vcpu_id++) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Injecting #DF to vcpu I=
D #%d...\n&quot;, vcpu_id);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D xc_hvm_inject_trap(xch, domi=
d, vcpu_id,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 X86_ABORT_DF,<br>
&gt; <br>
&gt; In the definition of xendevicemodel_inject_event(), the comment say to=
<br>
&gt; look at &quot;enum x86_event_type&quot; for possible event &quot;type&=
quot;, but there&#39;s no<br>
&gt; &quot;#DF&quot; type, can we add this new one there before using it? (=
It&#39;s going<br>
&gt; to be something like X86_EVENTTYPE_*)<br>
<br>
To my understanding, the event types enum refer to the kind of interrupt<br=
>
being handled. In this case, it is a hardware exception, which already<br>
exists as an entry in the enum definition.<br>
<br>
The `vector` parameter describes the kind of exception. I just found<br>
that exception vector macros are defined in `x86-defns.h`, so I will<br>
include that and instead use `X86_EXC_DF` in patch v2.<br>
<br>
The only other usage of `xc_hvm_inject_trap` is in `xen-access.c`, which<br=
>
defines all the required vectors as macros at the top of the source file.<b=
r>
Hence, I did the same in `xen-hvmcrash.c` for patch v1.<br>
<br>
Would it be a good idea to rewrite `xen-access.c` to use `x86-defns.h`<br>
as well, in a later patch?<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XEN_DMOP_EVENT_hw_exc, 0,<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL);<br>
&gt; <br>
&gt; The new code doesn&#39;t build, &quot;NULL&quot; aren&#39;t integers.<=
br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=
Could not inject #DF to vcpu ID #%d\n&quot;, vcpu_id);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;xc_hvm_in=
ject_trap&quot;);<br>
&gt; <br>
&gt; Are you meant to print two error lines when there&#39;s an error? You =
can<br>
&gt; also use strerror() to convert an &quot;errno&quot; to a string.<br>
<br>
I will use strerror and one print call in patch v2.<br>
<br>
&gt; Are you meant to keep inject into other vcpus even if one have failed?=
<br>
<br>
Yes; xen-hvmcrash doesn&#39;t have to inject *all* vcpus to cause it to<br>
crash.<br>
<br>
&gt; Should `xen-hvmcrash` return success when it failed to inject the doub=
le<br>
&gt; fault to all vcpus?<br>
<br>
I will make xen-hvmcrash yield an error if no vcpus could be injected in<br=
>
patch v2.<br>
<br>
Matt<br>
</div></div>

--000000000000fec3cb061bb8e107--

