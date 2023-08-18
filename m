Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45870780A8E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585963.917188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWx9J-0005GO-Tj; Fri, 18 Aug 2023 10:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585963.917188; Fri, 18 Aug 2023 10:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWx9J-0005Ei-Qx; Fri, 18 Aug 2023 10:56:13 +0000
Received: by outflank-mailman (input) for mailman id 585963;
 Fri, 18 Aug 2023 10:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvKd=ED=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qWx9J-0005Ec-0H
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:56:13 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8233a9b-3db5-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 12:56:12 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ba1e9b1fa9so10940661fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 03:56:11 -0700 (PDT)
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
X-Inumbo-ID: d8233a9b-3db5-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692356171; x=1692960971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lF878kPbEYrepP3yOhDN+gEMc0lik68ISOG608MGEec=;
        b=QI3obLS57TogkHLR/1X6wLBRkh0kEm9STg0FNQLquhcbVzGnBVK0Tj6wvKEDNjegB0
         9KSL9SSFxCg15TK3OfVacNt2+lUL/01dM5xCX/wUPPzeBA27WdZdlBp4O9ARl6wbS5n0
         49cu3Ovbe4pxy0PnhbY6OtZqpj3sXjHnnX7Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356171; x=1692960971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lF878kPbEYrepP3yOhDN+gEMc0lik68ISOG608MGEec=;
        b=jMJJv88MvwZqP1hHGWAQQPe7yySIhjLG/zcn3BHktp57+2cmeOUJDG5WDE9PmTfLna
         +q9Nt4YzbVE0xEY/qBPnSlh3mr4N4Kdars3WTwtzP4LyOEysm22K+13lp+4IkM3Qie9z
         aGmSn2U6ysugJ5GcOSUGlWjDEg/PUa5LIuBpUTHNCeZ/5JnhS6lXhOL5higSiaavH6hg
         9h+pneAZTnT8tUsDyZymZKT+/1PDr1zu9Azhog1WMf0CeaOznW+OOgfAlx2Vb4O1Z7Nb
         ANrb1xucCWZn7JXSOr3ExP2h7/LtuDK3KH2297SMNo3cyv3oF/FHiVbxXwoiitJFWhts
         vPDQ==
X-Gm-Message-State: AOJu0YwBIGw7clj08DK0CMt5RRqJm+lpQgapjpTJjuykX1DwA5ibjVVe
	XaPKZVn7z0/hP9WyCy0M9UEGYMG4VTw82wfhBRmuVg==
X-Google-Smtp-Source: AGHT+IE8GvybSjHqL9g+Z+TFvyTXkQYD573UniCXVG/FApYjFMUaWAqwHDPj4x/auVk2iNVi3sbkvVJJ34otCuOiJ5I=
X-Received: by 2002:a19:8c0f:0:b0:4fc:3755:37d9 with SMTP id
 o15-20020a198c0f000000b004fc375537d9mr1325941lfd.68.1692356171454; Fri, 18
 Aug 2023 03:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230818103236.51696-1-george.dunlap@cloud.com>
 <CA+zSX=a2Z14uumar+V2VjY6nLCt41CxZ833YpfyGP3NYG5hH8A@mail.gmail.com> <f820d459-395a-4170-1b3a-df069b734bfa@citrix.com>
In-Reply-To: <f820d459-395a-4170-1b3a-df069b734bfa@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 18 Aug 2023 11:56:00 +0100
Message-ID: <CA+zSX=Z45C7kbZ+daqAtry1inkS8teVjcnVfkN3CHVUdx=18pA@mail.gmail.com>
Subject: Re: [PATCH 1/2] code-of-conduct.rst: Remove Ian Jackson as a team member
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, kelly.choi@cloud.com
Content-Type: multipart/alternative; boundary="0000000000006ef9dd0603306069"

--0000000000006ef9dd0603306069
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 11:45=E2=80=AFAM Andrew Cooper <andrew.cooper3@citr=
ix.com>
wrote:

> On 18/08/2023 11:33 am, George Dunlap wrote:
>
>
> On Fri, Aug 18, 2023 at 11:32=E2=80=AFAM George Dunlap <george.dunlap@clo=
ud.com>
> wrote:
>
>> Ian Jackson is no longer involved with the Xen Project.
>>
>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>>
>
> NB that I don't consider these changes as needing a full vote; I'll check
> them in on Monday unless someone wants to argue otherwise.
>
>
> FWIW, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> <andrew.cooper3@citrix.com>
>

Thanks.


> I don't see any reason to delay these at all.  No amount of community
> voting is going to get Ian back, or change the email address your employe=
r
> has given you...
>

Bitter experience has taught me that just because I can't *think* of any
objection doesn't mean there aren't any.  My low estimation of probability
is why I'm only giving one business day to object. :-)

 -George

--0000000000006ef9dd0603306069
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 18, 2023 at 11:45=E2=80=
=AFAM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew=
.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">

 =20
  <div>
    <div>On 18/08/2023 11:33 am, George Dunlap
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 18, 2023 at
            11:32=E2=80=AFAM George Dunlap &lt;<a href=3D"mailto:george.dun=
lap@cloud.com" target=3D"_blank">george.dunlap@cloud.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ian Jackson is =
no longer
            involved with the Xen Project.<br>
            <br>
            Signed-off-by: George Dunlap &lt;<a href=3D"mailto:george.dunla=
p@cloud.com" target=3D"_blank">george.dunlap@cloud.com</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>NB that I don&#39;t consider these changes as needing a full
            vote; I&#39;ll check them in on Monday unless someone wants to
            argue otherwise.</div>
        </div>
      </div>
    </blockquote>
    <br>
    FWIW, Acked-by: Andrew Cooper <a href=3D"mailto:andrew.cooper3@citrix.c=
om" target=3D"_blank">&lt;andrew.cooper3@citrix.com&gt;</a></div></blockquo=
te><div><br></div><div>Thanks.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div>I don&#39;t see any reason to delay these =
at all.=C2=A0 No amount of
    community voting is going to get Ian back, or change the email
    address your employer has given you...<br></div></blockquote><div><br><=
/div><div>Bitter experience has taught me that just because I can&#39;t *th=
ink* of any objection doesn&#39;t mean there aren&#39;t any.=C2=A0 My low e=
stimation of probability is why I&#39;m only giving one business day to obj=
ect. :-)=C2=A0=C2=A0</div><div><br></div><div>=C2=A0-George</div></div></di=
v>

--0000000000006ef9dd0603306069--

