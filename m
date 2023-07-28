Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C029E7676B5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571555.895694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTeB-0002N4-OP; Fri, 28 Jul 2023 20:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571555.895694; Fri, 28 Jul 2023 20:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTeB-0002Kt-LM; Fri, 28 Jul 2023 20:01:11 +0000
Received: by outflank-mailman (input) for mailman id 571555;
 Fri, 28 Jul 2023 20:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPTe9-0002Kn-V6
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:01:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c88a9f4-2d81-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:01:05 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so4315502e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:01:05 -0700 (PDT)
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
X-Inumbo-ID: 7c88a9f4-2d81-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690574465; x=1691179265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tb+rhFtTeLpWvf8HEvBKSOaO11rK+YCXEiFP+5yw8fY=;
        b=UTNkohqKIdxdeWWjwMgIqL01pI/sJzUr3NIf+9RmeFmSKPV0mHoJnxSLMxB4xfurmt
         LyIbH6t/ozmJnVEfYopgOREWqf7IbpoOvX1qnRmtM+r6oSwYeHhX+Rhg+E6P+XZIRPRV
         9/Q0wC8NmdWb5lldNNM6kZIMh1/k6ATVwarbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690574465; x=1691179265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb+rhFtTeLpWvf8HEvBKSOaO11rK+YCXEiFP+5yw8fY=;
        b=lDHAuQUJwR7X5Tr0BOwMz2Ue6SrvfOU5fcykyzda2/skf50zKRw1e4k1JhGmAVVQ8H
         Lo6UI07wtaLfOVirhcXDcIF/X8P2MzuWpAEF+GzcgWPNYpV+cyNMy3oGNl/AGDC9YV1m
         CGpMvPYKITUaghIVEy9XuhSofraCBBk4zRG8sHtXSb+7YPRW8yMeK6MSgdHcUTi3l5bE
         KfNVWZxuTbWc22s/N7Q9dI8CoF3lKHpRc9jywDRNZRTP7NMs5SbJbcegIIYs3dqE6vyp
         Xa0acfwiw3oxA7JHPuKVWThh/WNVZeNTCmjSwVwOzOg5Lv88JZ6IeBQKNNCA61jZEJ3G
         YFfQ==
X-Gm-Message-State: ABy/qLaMf/XgPZQL8ypq2xu8oKTNG/n+77IlBnnSpEdl3JEdcFmd7er0
	PvobJRZAQLfqlO0qN7+jptMlyDK8yBbnDtoaD8hZuw==
X-Google-Smtp-Source: APBJJlH3A23Koaokb/+28imStinCtcJJQGS0+r19jaDn3IDUwl5xKYIXQTasFJ/sWewQecq9EOAbVAjxUt7NVqgTgcw=
X-Received: by 2002:a05:6512:210c:b0:4fb:89ad:6651 with SMTP id
 q12-20020a056512210c00b004fb89ad6651mr2368141lfr.28.1690574465297; Fri, 28
 Jul 2023 13:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-3-olaf@aepfle.de>
 <CA+zSX=bZ5zo9cxWTq9s9QOUGZ-9NMEugewR90z1w8C++sruSVw@mail.gmail.com> <20230728195210.66faf194.olaf@aepfle.de>
In-Reply-To: <20230728195210.66faf194.olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:00:54 +0100
Message-ID: <CA+zSX=Yz7yJRCDm6yyOzFbhuSbkt0h9fZCiLbS9r6KjAh3g-ZQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] xentrace: use correct output format for pit and rtc
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000007886db0601918a93"

--0000000000007886db0601918a93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 6:52=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> Fri, 28 Jul 2023 17:47:11 +0100 George Dunlap <george.dunlap@cloud.com>:
>
> > Just a couple of notes on the whole series.  First, you didn't CC me on
> 0/7
> > or 1/7.  Secondly, patch 7 seems to be corrupted (see e.g., Patchew's
> > attempt to apply the series [1]).
>
> The cover letter can not be easily fixed, this is a bug in git send-email=
.
> It should be able to collect all recipients and put them in the cover
> letter.
> I think I already pointed that out a while ago on git-devel...
>
> I think #1 can be fixed by adjusting the MAINTAINERS file.
> Not sure why #7 fails to apply.
>

Running `git am --show-current-patch` reveals a tail that looks like this:

```
+    [EXIT_REASON_NOTIFY]=3D3D"NOTIFY",
 };
=3D20
```

This may again be a known issue with `git am` and base64-encoded files: I
think `mailsplit` knows how to deal with these sorts of line breaks; and
`git am` also knows how to decode base64; but it does them in the wrong
order, so base64-encoded mails don't get handled properly.  I reported it
to them several years ago [1], and nothing happened.

 -George

[1]
https://lore.kernel.org/git/c44c3958-b0eb-22bd-bc35-04982706162f@citrix.com=
/

--0000000000007886db0601918a93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023 at 6:52=E2=80=AF=
PM Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"_blank">olaf=
@aepfle.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Fri, 28 Jul 2023 17:47:11 +0100 George Dunlap &lt;<a href=3D"mai=
lto:george.dunlap@cloud.com" target=3D"_blank">george.dunlap@cloud.com</a>&=
gt;:<br>
<br>
&gt; Just a couple of notes on the whole series.=C2=A0 First, you didn&#39;=
t CC me on 0/7<br>
&gt; or 1/7.=C2=A0 Secondly, patch 7 seems to be corrupted (see e.g., Patch=
ew&#39;s<br>
&gt; attempt to apply the series [1]).<br>
<br>
The cover letter can not be easily fixed, this is a bug in git send-email.<=
br>
It should be able to collect all recipients and put them in the cover lette=
r.<br>
I think I already pointed that out a while ago on git-devel...<br>
<br>
I think #1 can be fixed by adjusting the MAINTAINERS file.<br>
Not sure why #7 fails to apply.<br></blockquote><div><br></div><div>Running=
=C2=A0`git am --show-current-patch` reveals a tail that looks like this:</d=
iv><div><br></div><div>```</div><div>+ =C2=A0 =C2=A0[EXIT_REASON_NOTIFY]=3D=
3D&quot;NOTIFY&quot;,<br>=C2=A0};<br>=3D20<br></div><div>```</div><div><br>=
</div><div>This may again be a known issue with `git am` and base64-encoded=
 files: I think `mailsplit` knows how to deal with these sorts of line brea=
ks; and `git am` also knows how to decode base64; but it does them in the w=
rong order, so base64-encoded mails don&#39;t get handled properly.=C2=A0 I=
 reported it to them several years ago [1], and nothing happened.</div><div=
><br></div><div>=C2=A0-George</div><div><br></div><div>[1]=C2=A0<a href=3D"=
https://lore.kernel.org/git/c44c3958-b0eb-22bd-bc35-04982706162f@citrix.com=
/">https://lore.kernel.org/git/c44c3958-b0eb-22bd-bc35-04982706162f@citrix.=
com/</a></div><div>=C2=A0</div></div></div>

--0000000000007886db0601918a93--

