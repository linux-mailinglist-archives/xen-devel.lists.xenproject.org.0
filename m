Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218141B5CD2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 15:45:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRc9e-0002rQ-Gj; Thu, 23 Apr 2020 13:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TH3x=6H=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1jRc9d-0002rL-Oy
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 13:44:37 +0000
X-Inumbo-ID: 922e06dc-8568-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 922e06dc-8568-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 13:44:36 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t12so4365067edw.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjcSj1p5l+/+OGkQMA0dkSJgB7UakZeOre6qdXFcV8s=;
 b=TBTay94cIfyvww2f+UarYOUOhDUOiv78LggmfuZh+AFsYe6GlVzu6pQAjFNd8qXKe8
 /Rlk50Ez2v3lTe+yg6bTDxi80OhT2Oz9V7rI7/wtr/MMjuSJlQM9R7b5j0BTIEL0vDno
 uYNHzIbUKPPX0IhLtDhxrmSg9KxTvE6UVQlMxohdBIf0WQqh8ENTeoSQSzBk0dEKqOES
 twRKbQqPwEsz6oBjB2AevyO/IYtesQpl3piYkwtP/3cdiQjvEI5dllSmCgMncGwDe6FJ
 gAXozXxrT4IFgsFuLuTK8CXcstIXbQSzW8DUPFnhF1wNZ7lLtoknQJmNjKB6e87zZda5
 na4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjcSj1p5l+/+OGkQMA0dkSJgB7UakZeOre6qdXFcV8s=;
 b=kp0qHE+PAE1EXG4E+SBI2WTqNrDbfbq+e4+DpkR5J/wdQPXtBwIHAsEDz+AnXDGujJ
 m2t5wktxQIXFIDBNJ9hyLLDL5CxZLrt4Tampl/S6+1I0N5cwfM00rHMGX6RVTqeCi0fo
 SPMwB73PF8SOf+SMN0sPY0Art5ob1bVikwBUqOXbBsBYX5VDXv/T+RPWQJ8ceBgpMOJ3
 bZAR0eTN1Tlm6am4113UFHeJepIPcU0jzh2JMxdIqgHmg3PWKVcCd3It1TZLAsexemHj
 /uDMqhNoYAXKpFd6eRk4v6RJV+A34WEjDA/RkiLxJKetgMsvuvFrLZ4lQ6jcB9JLck9x
 hLaw==
X-Gm-Message-State: AGi0PuaLFxvWQxg0l9rmgu1VAir54Stlmnwd1xRFO6CpzmaMUE42oZ/J
 qNZCXWbsbfMTtQfOu/Y4UIjYugAzaeZpjzl3RaE=
X-Google-Smtp-Source: APiQypJgnAXT2lstzIo19dygyd39im1hYbRTFDWenARY3of77Ut+HlWJW8y/FgN71EQbhzLu/9UlnHU/eoJTO5zHeuI=
X-Received: by 2002:a50:f74c:: with SMTP id j12mr1922508edn.197.1587649476037; 
 Thu, 23 Apr 2020 06:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
In-Reply-To: <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 23 Apr 2020 14:44:24 +0100
Message-ID: <CAFLBxZaKiuqpmVvP2ww9YbuTkCm9wdBKGdMJOrT=sTaJSaycqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
To: Nick Rosbrook <rosbrookn@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000000c104305a3f57370"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000000c104305a3f57370
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 23, 2020 at 1:51 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:

> By default, if the go compiler is found by the configure script, build
> the golang tools. If the compiler is not found, and
> --enable-golang_tools was not explicitly set, do not build to the golang
> tools.
>
> The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove
> CONFIG_GOLANG from tools/Rules.mk since the new variable is set by
> configure.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  config/Tools.mk.in |   1 +
>  m4/golang.m4       |   4 ++
>  tools/Makefile     |   2 +-
>  tools/Rules.mk     |   2 -
>  tools/configure    | 138 +++++++++++++++++++++++++++++++++++++++++++++
>  tools/configure.ac |  12 ++++
>  6 files changed, 156 insertions(+), 3 deletions(-)
>  create mode 100644 m4/golang.m4
>
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index 189fda1596..2c219f5477 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -55,6 +55,7 @@ CONFIG_QEMU_TRAD    := @qemu_traditional@
>  CONFIG_QEMU_XEN     := @qemu_xen@
>  CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
>  CONFIG_LIBNL        := @libnl@
> +CONFIG_GOLANG_TOOLS := @golang_tools@
>
>  CONFIG_SYSTEMD      := @systemd@
>  SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
> diff --git a/m4/golang.m4 b/m4/golang.m4
> new file mode 100644
> index 0000000000..0b4bd54ce0
> --- /dev/null
> +++ b/m4/golang.m4
> @@ -0,0 +1,4 @@
> +AC_DEFUN([AC_PROG_GO], [
> +    dnl Check for the go compiler
> +    AC_CHECK_TOOL([GO],[go],[no])
> +])
>

AFAICT this only checks for the existence of the binary.  Will the bindings
compile with all versions of go?  If not, should we try to check the
version here?

Thanks,
 -George

--0000000000000c104305a3f57370
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2020 at 1:51 AM Nick =
Rosbrook &lt;<a href=3D"mailto:rosbrookn@gmail.com">rosbrookn@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">By d=
efault, if the go compiler is found by the configure script, build<br>
the golang tools. If the compiler is not found, and<br>
--enable-golang_tools was not explicitly set, do not build to the golang<br=
>
tools.<br>
<br>
The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove<br>
CONFIG_GOLANG from tools/Rules.mk since the new variable is set by<br>
configure.<br>
<br>
Signed-off-by: Nick Rosbrook &lt;<a href=3D"mailto:rosbrookn@ainfosec.com" =
target=3D"_blank">rosbrookn@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0config/<a href=3D"http://Tools.mk.in" rel=3D"noreferrer" target=3D"_b=
lank">Tools.mk.in</a> |=C2=A0 =C2=A01 +<br>
=C2=A0m4/golang.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 ++<br>
=C2=A0tools/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0tools/Rules.mk=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0tools/configure=C2=A0 =C2=A0 | 138 ++++++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0tools/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a> |=C2=A0 12 ++++<br>
=C2=A06 files changed, 156 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 m4/golang.m4<br>
<br>
diff --git a/config/<a href=3D"http://Tools.mk.in" rel=3D"noreferrer" targe=
t=3D"_blank">Tools.mk.in</a> b/config/<a href=3D"http://Tools.mk.in" rel=3D=
"noreferrer" target=3D"_blank">Tools.mk.in</a><br>
index 189fda1596..2c219f5477 100644<br>
--- a/config/<a href=3D"http://Tools.mk.in" rel=3D"noreferrer" target=3D"_b=
lank">Tools.mk.in</a><br>
+++ b/config/<a href=3D"http://Tools.mk.in" rel=3D"noreferrer" target=3D"_b=
lank">Tools.mk.in</a><br>
@@ -55,6 +55,7 @@ CONFIG_QEMU_TRAD=C2=A0 =C2=A0 :=3D @qemu_traditional@<br>
=C2=A0CONFIG_QEMU_XEN=C2=A0 =C2=A0 =C2=A0:=3D @qemu_xen@<br>
=C2=A0CONFIG_QEMUU_EXTRA_ARGS:=3D @EXTRA_QEMUU_CONFIGURE_ARGS@<br>
=C2=A0CONFIG_LIBNL=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D @libnl@<br>
+CONFIG_GOLANG_TOOLS :=3D @golang_tools@<br>
<br>
=C2=A0CONFIG_SYSTEMD=C2=A0 =C2=A0 =C2=A0 :=3D @systemd@<br>
=C2=A0SYSTEMD_CFLAGS=C2=A0 =C2=A0 =C2=A0 :=3D @SYSTEMD_CFLAGS@<br>
diff --git a/m4/golang.m4 b/m4/golang.m4<br>
new file mode 100644<br>
index 0000000000..0b4bd54ce0<br>
--- /dev/null<br>
+++ b/m4/golang.m4<br>
@@ -0,0 +1,4 @@<br>
+AC_DEFUN([AC_PROG_GO], [<br>
+=C2=A0 =C2=A0 dnl Check for the go compiler<br>
+=C2=A0 =C2=A0 AC_CHECK_TOOL([GO],[go],[no])<br>
+])<br></blockquote><div><br></div><div>AFAICT this only checks for the exi=
stence of the binary.=C2=A0 Will the bindings compile with all versions of =
go?=C2=A0 If not, should we try to check the version here?</div><div><br></=
div>Thanks,</div><div class=3D"gmail_quote">=C2=A0-George<br></div></div>

--0000000000000c104305a3f57370--

