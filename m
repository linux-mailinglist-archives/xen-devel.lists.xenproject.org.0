Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF5F122E8F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:24:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDkF-0002zY-5F; Tue, 17 Dec 2019 14:22:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rE6t=2H=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ihDkD-0002zO-QP
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:22:37 +0000
X-Inumbo-ID: ac83e5f0-20d8-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac83e5f0-20d8-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 14:22:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so3381374wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 06:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=kfCcRCnkSbYF4W6gJKBy7gF0R8qP9d8Rki21RKQnkMo=;
 b=YD+6lMXQ/8DMHook+2wAZLCLv4w5r3fKP04+CkwiVhOM3omEm9krWE4yauNgthnvQQ
 pQU9cDFN2wDa0eSvy7+eyDMSam+2wsO3FESATARO/+k+fcgHkg07qxibaJlwEO8F3izD
 6BuTgC50J2A2jdSyUtrFQK8evnOODgZusDPeEItyf1hT6htGNQwV1PgYzYS8IB4wWosQ
 2JEwuFCWYbiG/sOV2VYCVHE1zbgmmuhtXRlDcEcx/VSUeWGCVqIL6K60BkxnKZsPokEl
 g7sWHBTEmKU+HNKNafWf2oWwSSAXvKLV+5xFmAzOQ+dJKAXpbaJWEYsBQ2Qe3tPUzf/w
 WBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=kfCcRCnkSbYF4W6gJKBy7gF0R8qP9d8Rki21RKQnkMo=;
 b=MHZRLmbJ5oMqRl3w3JB9sVb3qpka1okP0AxODM4QYfngt6pJOsQ/bQxKsuI6yxpqT/
 dyLKW3bTv+3uuDsM0TkNh7RTsPq0r9uHcTlKM+cxKNnoiRvIXzutpxhqYMoDxJDK7gc5
 Ff6YmlnMbuYNYA6RNRJ+fWaTMz0yb78laO1FYb4JXAfnetRrpWgO7/oTrFOdiiI9DGIn
 AoBL9Yx4e0Dt+Z7T5UgkouhtpCbV9D19Ffzlnd3s1LV7yqxGVmECvy7GMZK9sMwtDwPP
 hmIWWWK9SmZKWn3ARIzdnHZezIUq02g+zo5UFWrVeSd6RYPv8SXMMdSFU7KOrkx2vdOl
 BZeQ==
X-Gm-Message-State: APjAAAVwvPDEDQ5kfzFEleB8/IUkhwDrZjrU1fuaYU09kZyvWI7UfM7k
 LJFs7xeA9CvBumBFZX7M4Yg=
X-Google-Smtp-Source: APXvYqyfIxlUloNTWFSk1Zl27qKoKnFlV/ukHCYSiQMfeYpSrE8GODIQ4G0Xjz0S/5r/5HkeZVXvGg==
X-Received: by 2002:a1c:c919:: with SMTP id f25mr5706384wmb.49.1576592555837; 
 Tue, 17 Dec 2019 06:22:35 -0800 (PST)
Received: from ?IPv6:2a02:c7f:ac18:da00:a492:d051:c733:8c84?
 ([2a02:c7f:ac18:da00:a492:d051:c733:8c84])
 by smtp.gmail.com with ESMTPSA id z6sm27041403wrw.36.2019.12.17.06.22.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 06:22:35 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <F9D465E6-ECA6-4071-8A7B-02C56556AA97@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Tue, 17 Dec 2019 14:22:34 +0000
In-Reply-To: <20191217141843.7016-1-ian.jackson@eu.citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
References: <20191217141843.7016-1-ian.jackson@eu.citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH] 4.13.0: Update SUPPORT.md
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4174174182802234035=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4174174182802234035==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_04342F51-F535-4E21-89ED-79CE8D83A26F"


--Apple-Mail=_04342F51-F535-4E21-89ED-79CE8D83A26F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 17 Dec 2019, at 14:18, Ian Jackson <ian.jackson@eu.citrix.com> =
wrote:
>=20
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
> SUPPORT.md | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index f7a7a56c29..b24649ef2d 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,13 +9,13 @@ for the definitions of the support status levels =
etc.
>=20
> # Release Support
>=20
> -    Xen-Version: 4.13-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.13
> +    Initial-Release: 2019-12-18
> +    Supported-Until: 2021-06-18
That looks good to me: 18 months

> +    Security-Support-Until: 2022-12-18
That looks good to me: 36 months

Reviewed-by: Lars Kurth <lars.kurth@citrix.com =
<mailto:lars.kurth@citrix.com>>

Regards
Lars=

--Apple-Mail=_04342F51-F535-4E21-89ED-79CE8D83A26F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 17 Dec 2019, at 14:18, Ian Jackson &lt;<a =
href=3D"mailto:ian.jackson@eu.citrix.com" =
class=3D"">ian.jackson@eu.citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Signed-off-by: Ian Jackson &lt;<a =
href=3D"mailto:ian.jackson@eu.citrix.com" =
class=3D"">ian.jackson@eu.citrix.com</a>&gt;<br class=3D"">---<br =
class=3D""> SUPPORT.md | 10 +++++-----<br class=3D""> 1 file changed, 5 =
insertions(+), 5 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/SUPPORT.md b/SUPPORT.md<br class=3D"">index f7a7a56c29..b24649ef2d =
100644<br class=3D"">--- a/SUPPORT.md<br class=3D"">+++ b/SUPPORT.md<br =
class=3D"">@@ -9,13 +9,13 @@ for the definitions of the support status =
levels etc.<br class=3D""><br class=3D""> # Release Support<br =
class=3D""><br class=3D"">- &nbsp;&nbsp;&nbsp;Xen-Version: 4.13-rc<br =
class=3D"">- &nbsp;&nbsp;&nbsp;Initial-Release: n/a<br class=3D"">- =
&nbsp;&nbsp;&nbsp;Supported-Until: TBD<br class=3D"">- =
&nbsp;&nbsp;&nbsp;Security-Support-Until: Unreleased - not yet =
security-supported<br class=3D"">+ &nbsp;&nbsp;&nbsp;Xen-Version: =
4.13<br class=3D"">+ &nbsp;&nbsp;&nbsp;Initial-Release: 2019-12-18<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;Supported-Until: 2021-06-18<br =
class=3D""></div></div></blockquote>That looks good to me: 18 =
months</div><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"">+ &nbsp;&nbsp;&nbsp;Security-Support-Until: =
2022-12-18<br class=3D""></div></div></blockquote><div>That looks good =
to me: 36 months</div><br class=3D""></div><div>Reviewed-by: Lars Kurth =
&lt;<a href=3D"mailto:lars.kurth@citrix.com" =
class=3D"">lars.kurth@citrix.com</a>&gt;</div><div><br =
class=3D""></div><div>Regards</div><div>Lars</div></body></html>=

--Apple-Mail=_04342F51-F535-4E21-89ED-79CE8D83A26F--


--===============4174174182802234035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4174174182802234035==--

