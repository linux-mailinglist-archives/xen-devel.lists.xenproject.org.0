Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9456F1310
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527210.819557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJFP-0007zY-6Y; Fri, 28 Apr 2023 08:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527210.819557; Fri, 28 Apr 2023 08:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJFP-0007xL-3l; Fri, 28 Apr 2023 08:14:31 +0000
Received: by outflank-mailman (input) for mailman id 527210;
 Fri, 28 Apr 2023 08:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJFO-0007xF-1c
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:14:30 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b25781ad-e59c-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 10:14:28 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ab25e8a4a7so44492501fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:14:28 -0700 (PDT)
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
X-Inumbo-ID: b25781ad-e59c-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669668; x=1685261668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13tg2gqJpPSUUt+GS2Udyinv/zQw/hIp7g6Znr4hpVM=;
        b=PB4ytY+7btAoE6pQuA0sJgXRigzsCafJhI9grcr9yYL/UPF5pBYVJl6ePwW+55qvfj
         Y1el6oI2T0EaArkOIc//5ty2P3rv7lO3oDLOJoGgynHNQjd90E1hecojiraGyg7nacga
         NBEZtCWgJylqP9mmbGVkoVcxh8uukt/Q3AjHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669668; x=1685261668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13tg2gqJpPSUUt+GS2Udyinv/zQw/hIp7g6Znr4hpVM=;
        b=OJHsPL8Tdun9W+qzfLRCrrV8yxBLmKS1D1t9CqoDVXopD4CRpgKBBYAFgiM6k4fWf3
         /CChFu5TNhcEPPPWESIrct3zhd0f5djBBNw6pF8Hm97FiFTPZMvRT2uzu5gV312Yn9Uw
         rEsIel6Q0EUTfUlRVyF9pOK5rcAX2d/7A4SCn6RqxlqODdQgwPYEUhrKen/QW/8Jd3DK
         MkgChiirrSN2iZYLE7g06yFGHjoOTArQfPOnZIfWA5tL75z70wCfvp1KPL23J0GsDfGH
         ZQeb/mFTSAGeFF+/8RjBbFV8bIxqVTJ0SflaN73jchlvx/WjIRhZSEkTJNLfvEFPCHbo
         ThMw==
X-Gm-Message-State: AC+VfDyXWFo1ymCcwFFV9zX0cycR2zXJ4WIhQZvhMM9lSoGoY5CiEQcH
	gjrUifrKAgWBHXKCaSl/nBQIUc/3+CIAUiaq0B3dD11hV60auCFtapA=
X-Google-Smtp-Source: ACHHUZ7GhRBxQA/iuw8YkhGm1MR1HeRBYnEyMA2gCTDWZbg4UesQfCZYzdOGnINUHgXeIvEqOKNv29TRlRHNhAzaI0U=
X-Received: by 2002:a2e:b2c7:0:b0:2a8:bc05:1d6e with SMTP id
 7-20020a2eb2c7000000b002a8bc051d6emr1287157ljz.37.1682669668215; Fri, 28 Apr
 2023 01:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230428081231.2464275-1-george.dunlap@cloud.com>
In-Reply-To: <20230428081231.2464275-1-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Apr 2023 09:14:17 +0100
Message-ID: <CA+zSX=Z3Sr+OOoM3V-oVG6ooGFG7zmpqnAEdBC4q8pnmgfx7JA@mail.gmail.com>
Subject: Re: [PATCH RFC] SUPPORT.md: Make all security support explicit
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper@cloud.com>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@cloud.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000d9473505fa610f38"

--000000000000d9473505fa610f38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 9:12=E2=80=AFAM George Dunlap <george.dunlap@cloud.=
com>
wrote:

> The initial goal of SUPPORT.md was to help both users, and the Xen
> Project Security Team, determine what functionality was security
> supported; i.e., what kinds of security bugs would trigger an XSA.
>
> Our proposal is that as of 4.18, all functionality not explicitly
> listed as security supported will be considered not security
> supported.  Add some text to that effect.
>
> The patch as written cannot be applied, since specifying "xl.cfg core
> functionality" is a TODO; but it should do to start a discussion.
>
> Signed-off-by: Georg Dunlap <george.dunlap@cloud.com>
>
One of the interesting outcomes of this thought process is that
"supported" is really about the configuration of the system (including
guests):

1. Where it came from
2. How it was build configured
3. Xen command-line parameters
4. Configuration of Xen-related kernel drivers
5. Configuration of support infrastructure; namely xenstore
6. Configuration of guests

That means that in particular, we need to somehow make it clear which
of the hundreds of Xen command-line parameters are OK to modify and
how.

It occurred to me that in many (most? all?) cases it would be more
effective to define the security support parameters in the
documentation itself.

e.g.:

```pandoc
### invpcid (x86)
> `=3D <boolean>`

> Default: `true`

> Supported values: all

By default, Xen will use the INVPCID instruction for TLB management if
it is available.  This option can be used to cause Xen to fall back to
older mechanisms, which are generally slower.
```

or (for example):

```pandoc
### loglvl
> `=3D <level>[/<rate-limited level>]` where level is `none | error | warni=
ng
| info | debug | all`

> Default: `loglvl=3Dwarning`

> Supported values: `none, error, warning`

> Can be modified at runtime

Set the logging level for Xen.  Any log message with equal more more
importance will be printed.

The optional `<rate-limited level>` option instructs which severities
should be rate limited.
```

Since people are (at least somewhat) used to documenting their
features, this would prompt people to consider the security
implications explicitly as they're adding features, rather than having
it be in a separate document.

Another option would be to have a section of the doc where we list
supported hypervisor parameters; e.g.:


```markdown
# Xen command-line arguments

...
invpcid
...
loglvl {none, error, warning}
...
```

It's tempting to consider the idea of listing the options that
*aren't* supported; but that puts us back where we are now, where new
features end up supported by default unless we remember to list them
as unsupported.

Finally, what might be particularly useful is a tool which looks at
the Xen Kconfig value from hypfs, the Xen command-line, and a bunch of
other parameters, and tells you if it sees anything running in the
system that's unsupported.  The challenge there is making it reliable
enough that a "clean bill of health" is actually an accurate
indication that nothing unsupported is being run.

 -George

--000000000000d9473505fa610f38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 28, 2023 at 9:12=E2=80=AF=
AM George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunl=
ap@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">The initial goal of SUPPORT.md was to help both users, and the =
Xen<br>
Project Security Team, determine what functionality was security<br>
supported; i.e., what kinds of security bugs would trigger an XSA.<br>
<br>
Our proposal is that as of 4.18, all functionality not explicitly<br>
listed as security supported will be considered not security<br>
supported.=C2=A0 Add some text to that effect.<br>
<br>
The patch as written cannot be applied, since specifying &quot;xl.cfg core<=
br>
functionality&quot; is a TODO; but it should do to start a discussion.<br>
<br>
Signed-off-by: Georg Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com" =
target=3D"_blank">george.dunlap@cloud.com</a>&gt;<br></blockquote>One of th=
e interesting outcomes of this thought process is that<br>&quot;supported&q=
uot; is really about the configuration of the system (including<br>guests):=
<br><br>1. Where it came from<br>2. How it was build configured<br>3. Xen c=
ommand-line parameters<br>4. Configuration of Xen-related kernel drivers<br=
>5. Configuration of support infrastructure; namely xenstore<br>6. Configur=
ation of guests<br><br>That means that in particular, we need to somehow ma=
ke it clear which<br>of the hundreds of Xen command-line parameters are OK =
to modify and<br>how.<br><br>It occurred to me that in many (most? all?) ca=
ses it would be more<br>effective to define the security support parameters=
 in the<br>documentation itself.<br><br>e.g.:<br><br>```pandoc<br>### invpc=
id (x86)<br>&gt; `=3D &lt;boolean&gt;`<br><br>&gt; Default: `true`<br><br>&=
gt; Supported values: all<br><br>By default, Xen will use the INVPCID instr=
uction for TLB management if<br>it is available.=C2=A0 This option can be u=
sed to cause Xen to fall back to<br>older mechanisms, which are generally s=
lower.<br>```<br><br>or (for example):<br><br>```pandoc<br>### loglvl<br>&g=
t; `=3D &lt;level&gt;[/&lt;rate-limited level&gt;]` where level is `none | =
error | warning | info | debug | all`<br><br>&gt; Default: `loglvl=3Dwarnin=
g`<br><br>&gt; Supported values: `none, error, warning`<br><br>&gt; Can be =
modified at runtime<br><br>Set the logging level for Xen.=C2=A0 Any log mes=
sage with equal more more<br>importance will be printed.<br><br>The optiona=
l `&lt;rate-limited level&gt;` option instructs which severities<br>should =
be rate limited.<br>```<br><br>Since people are (at least somewhat) used to=
 documenting their<br>features, this would prompt people to consider the se=
curity<br>implications explicitly as they&#39;re adding features, rather th=
an having<br>it be in a separate document.<br><br>Another option would be t=
o have a section of the doc where we list<br>supported hypervisor parameter=
s; e.g.:<br><br><br>```markdown<br># Xen command-line arguments<br><br>...<=
br>invpcid<br>...<br>loglvl {none, error, warning}<br>...<br><div>```=C2=A0=
<br></div><div><br></div><div>It&#39;s tempting to consider the idea of lis=
ting the options that<br>*aren&#39;t* supported; but that puts us back wher=
e we are now, where new<br>features end up supported by default unless we r=
emember to list them<br>as unsupported.<br><br>Finally, what might be parti=
cularly useful is a tool which looks at<br>the Xen Kconfig value from hypfs=
, the Xen command-line, and a bunch of<br>other parameters, and tells you i=
f it sees anything running in the<br>system that&#39;s unsupported.=C2=A0 T=
he challenge there is making it reliable<br>enough that a &quot;clean bill =
of health&quot; is actually an accurate<br>indication that nothing unsuppor=
ted is being run.<br></div><div><br></div><div>=C2=A0-George</div></div></d=
iv>

--000000000000d9473505fa610f38--

