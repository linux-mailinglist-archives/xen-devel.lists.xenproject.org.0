Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394DC491EC4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 06:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258240.444599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ggw-0003P3-1V; Tue, 18 Jan 2022 05:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258240.444599; Tue, 18 Jan 2022 05:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ggv-0003NG-Sy; Tue, 18 Jan 2022 05:05:57 +0000
Received: by outflank-mailman (input) for mailman id 258240;
 Mon, 17 Jan 2022 19:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eBGH=SB=gmail.com=oddh879@srs-se1.protection.inumbo.net>)
 id 1n9XiK-000581-3W
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 19:30:48 +0000
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [2607:f8b0:4864:20::d2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7f90131-77cb-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 20:30:47 +0100 (CET)
Received: by mail-io1-xd2f.google.com with SMTP id a12so17928533iod.9
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jan 2022 11:30:47 -0800 (PST)
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
X-Inumbo-ID: f7f90131-77cb-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tyY1WJ+7yRPNL+WSjEtITtzSqdJZTKCq1loUCelNbv4=;
        b=nvBryLkKxpFZF/v82Ljm+xZWMExtiTPH/9zpxFEFdlrKQ74x779SDF+7VzdyI3PONz
         DSWFhx5+VxJrtDnCpsWJutnkrLbFWP7GcegSQ8GyJP4MRKXduFWY/wxGcXc0Avsg3ksi
         8LrZUValAVtRbTBLSbnjmZGC1S5Cls3oxHHAYnLp+gCjlp6ygHNYU0hqltTyogfrY8Rr
         /TzmronQDAWlx3ibvOiE9sLcppP0Q9Nai4GlEIJKq+R3N/JYZhMcUgfOe1LgkZ02o52w
         QPeh7nQ6wgdbBOEH/DLUr6RpfXuyTRsXRTeDVxJjv9k9KHIOKwh+Sq6hMa3AeOW5i0W2
         QSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tyY1WJ+7yRPNL+WSjEtITtzSqdJZTKCq1loUCelNbv4=;
        b=K8P2o+Pd2kA3s20jk9vF5zQduXtUTn1V3HMtLZJ2RFou22QweZsLIKrEX0Hm3XKayQ
         nnJhzX1Df2bMPGGA6EUdJ9N3SCY9It2iHie5ug9fZz4xY3BLnNlkxRUGH+165j9rcdyx
         iLE2L/eifZIs365AnT073b958culC26vxJmRu3h57hUpz3NisKRYGbEvPkmsuB4aoQDO
         zZfWGY50bQvEwV3soAzW/5X3B/VaqBQZprWqYW0fDOEtYQuIIc8feC5U1I/wM18KUqwM
         7FHu+tBJmLfO1Y6wfnpugniMQR015dsHxv15ikSvkqSU1CJpU7o0qBvSMNXXiQBcI8BB
         iJqA==
X-Gm-Message-State: AOAM533/M0fLuPKJVNXP66++qiH3tdLIEJ0xuR5cd9KxUgYJz4IRtF/G
	pt6ziU60zBsehlfJUakJ7ElK6S1kMEwwQU0ej9vUovKR
X-Google-Smtp-Source: ABdhPJxeFaLG6unTYIZnNSuuX0rABQV1B4AKmHIG7J3QWh2rVxHlWqvoGx+bm/hhe/NFSRjzHHjFdeSVIX/9tW2vJoQ=
X-Received: by 2002:a02:5dc5:: with SMTP id w188mr9343387jaa.158.1642447845883;
 Mon, 17 Jan 2022 11:30:45 -0800 (PST)
MIME-Version: 1.0
References: <CAATqfqB5=mTtbnm1+mXR2U=G0pjjtX7z-brNCE_4us3LzNEojg@mail.gmail.com>
 <E658EC8C-3C13-4EFE-B5C9-6E91D30ED2F4@citrix.com>
In-Reply-To: <E658EC8C-3C13-4EFE-B5C9-6E91D30ED2F4@citrix.com>
From: The Person <oddh879@gmail.com>
Date: Mon, 17 Jan 2022 14:30:35 -0500
Message-ID: <CAATqfqD70LtuCUMVAcAG7yeZNU99P7a_3y007d-M+q3i0p1VPQ@mail.gmail.com>
Subject: Fwd: Reboot hangs on blank screen
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006a847405d5cc3056"

--0000000000006a847405d5cc3056
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: George Dunlap <George.Dunlap@citrix.com>
Date: Mon, Jan 17, 2022, 6:32 AM
Subject: Re: Reboot hangs on blank screen
To: The Person <oddh879@gmail.com>
Cc: community.manager@xenproject.org <community.manager@xenproject.org>



> On Nov 29, 2021, at 6:51 PM, The Person <oddh879@gmail.com> wrote:
>
> I am using Qubes 4.1rc1 and i have a dell 7520 mobile workstation with a
xeon processor. The Qubes team believes that this reboot problem is
upstream with Xen. I would like to know whether the Xen development team is
aware of this issue and how it can be fixed. Qubes is the ONLY linux os
that won't gracefully reboot. I never had the problem with fedora
workstation or ubuntu. Is there a way to edit the boot file?

Hello,

Sorry for not responding to this earlier; I=E2=80=99ve just gotten back fro=
m
parental leave.

If you=E2=80=99re still having issues, please submit this report to
xen-devel@lists.xenproject.org .

Thanks,
 -George

--0000000000006a847405d5cc3056
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong c=
lass=3D"gmail_sendername" dir=3D"auto">George Dunlap</strong> <span dir=3D"=
auto">&lt;<a href=3D"mailto:George.Dunlap@citrix.com">George.Dunlap@citrix.=
com</a>&gt;</span><br>Date: Mon, Jan 17, 2022, 6:32 AM<br>Subject: Re: Rebo=
ot hangs on blank screen<br>To: The Person &lt;<a href=3D"mailto:oddh879@gm=
ail.com">oddh879@gmail.com</a>&gt;<br>Cc: <a href=3D"mailto:community.manag=
er@xenproject.org">community.manager@xenproject.org</a> &lt;<a href=3D"mail=
to:community.manager@xenproject.org">community.manager@xenproject.org</a>&g=
t;<br></div><br><br><br>
&gt; On Nov 29, 2021, at 6:51 PM, The Person &lt;<a href=3D"mailto:oddh879@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">oddh879@gmail.com</a>&gt; w=
rote:<br>
&gt; <br>
&gt; I am using Qubes 4.1rc1 and i have a dell 7520 mobile workstation with=
 a xeon processor. The Qubes team believes that this reboot problem is upst=
ream with Xen. I would like to know whether the Xen development team is awa=
re of this issue and how it can be fixed. Qubes is the ONLY linux os that w=
on&#39;t gracefully reboot. I never had the problem with fedora workstation=
 or ubuntu. Is there a way to edit the boot file?<br>
<br>
Hello,<br>
<br>
Sorry for not responding to this earlier; I=E2=80=99ve just gotten back fro=
m parental leave.<br>
<br>
If you=E2=80=99re still having issues, please submit this report to <a href=
=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"norefer=
rer">xen-devel@lists.xenproject.org</a> .<br>
<br>
Thanks,<br>
=C2=A0-George</div>

--0000000000006a847405d5cc3056--

