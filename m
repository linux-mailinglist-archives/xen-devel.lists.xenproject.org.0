Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6EB63D4C2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 12:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449823.706797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0LQQ-0007dM-Gc; Wed, 30 Nov 2022 11:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449823.706797; Wed, 30 Nov 2022 11:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0LQQ-0007b9-DQ; Wed, 30 Nov 2022 11:38:50 +0000
Received: by outflank-mailman (input) for mailman id 449823;
 Wed, 30 Nov 2022 11:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yg5Q=36=gmail.com=degakiran05@srs-se1.protection.inumbo.net>)
 id 1p0LQP-0007b3-Oo
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 11:38:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e1c6afc-70a3-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 12:38:48 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id m14so2676146wrh.7
 for <xen-devel@lists.xenproject.org>; Wed, 30 Nov 2022 03:38:48 -0800 (PST)
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
X-Inumbo-ID: 8e1c6afc-70a3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0JOkjIEjkYcQCxG5mqdn9pw+dCfwIS62pE4v/xVB4bQ=;
        b=JDFGu9dMz6Fd+DD1gbS38i9mSAPKOnpMluE2pafIpTIXrd8DQ5hZpa30vxDS1JzWl9
         r+wQrxv1IPkO2whh4X+wu4XBV8sJ3hl8IIIv7bfXgHvfC7WkuqvMrm3gkMMl/RQwRR0I
         8uiFT3H6mD9EXuE979dZcDynl0+TKKXAGvGMq25hPD594hFvGSvi3Z9N66bLVfBJVh6B
         KPpLWM9i4+OvorjHP5t+xpdJDb9MnBjRZf12SqrQUyWI7GNdDatU42MoWmHl/LjE8GE6
         oLbROU5DnZFpgZm1+qS7xF7rrcU/oyUNbn3JCB43nyMjreTvvFQ98CMHk3ktvODoLXQP
         KMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JOkjIEjkYcQCxG5mqdn9pw+dCfwIS62pE4v/xVB4bQ=;
        b=ehMWF40k1k9yx4vnYJGMsbU5AR+Cs0j7Px14hIyJcEjUW9ImsXFuguwyHdkkL7i0cd
         SWDYgbEv4Xq1v8vP56HMXCG8FGusIgjYf3v2b/R63oKqr2iBMhw1/dRyQUIbGv3pABgD
         jF74dm9jir58s0Rakrn5dU9LZcAxBPxtjhFqdS82RHdNtsk9HyTq7iZaQkvfe4k81ihg
         uAyD4VMYEYPOHyXW7BCDqcYX+KfFfM3HeMLuH9VFXM9u0ZK8BLSCIODHg4uqEguiWeJn
         aHZdfOWT3L4GuOZnJRUi/fC+J24QWLTFVNWguUh/HtsinAVOtuGv49q800FUz7dJ3tpX
         5Z1A==
X-Gm-Message-State: ANoB5pnBRg8DbYgIWU7EQfk5ajejyoasVXVQdjP3Ed0Y3q7H3/tcX5IN
	et+ZZ+IELGus2QhejjlHirCX1+2T/WrOdptgUniat3i+yxI=
X-Google-Smtp-Source: AA0mqf5P/WDPUMYA398x6f9AKyYCjuaRzllO6lkdagWlqPE+7lDs+05H1QVtRYBkvGrRocnFmESGrGliysS8QwGeI8w=
X-Received: by 2002:a5d:5387:0:b0:236:86f2:b444 with SMTP id
 d7-20020a5d5387000000b0023686f2b444mr37791801wrv.58.1669808327735; Wed, 30
 Nov 2022 03:38:47 -0800 (PST)
MIME-Version: 1.0
From: dega kiran <degakiran05@gmail.com>
Date: Wed, 30 Nov 2022 17:08:26 +0530
Message-ID: <CADY+DPKBcMMHP9ZKCjviwagEf2KTRKV9NwOhZkk=AqKGqKXSdw@mail.gmail.com>
Subject: Guest Display issue on Xen
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, ulien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="00000000000037bce905eeae8cb2"

--00000000000037bce905eeae8cb2
Content-Type: text/plain; charset="UTF-8"

Hi,

I am porting Xen Hypervisor on raspberry pi4. I could port xen minimal
image as host & wayland based GUI image as guest. Now I am trying to bring
up guest Display (using vncviewer) which is not coming up, even I could see
xen-fbfront driver on guest and Debugged

xen-fbfront.c

Xenbusprobe_backend.c

Xenbusprobe_frontend.c

But not sure where is the actual issue.

Let me know which part of code will help us more  for better understanding
the issue.

--00000000000037bce905eeae8cb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-he=
ight:107%;font-size:11pt;font-family:Calibri,sans-serif"><span class=3D"gma=
il-MsoHyperlink" style=3D"color:rgb(5,99,193);text-decoration-line:underlin=
e"><span style=3D"text-decoration-line:none">Hi,</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" =
style=3D"color:rgb(5,99,193);text-decoration-line:underline"><span style=3D=
"text-decoration-line:none">I am porting Xen Hypervisor on raspberry pi4. I=
 could port
xen minimal image as host &amp; wayland based GUI image as guest. Now I am =
trying
to bring up guest Display (using vncviewer) which is not coming up, even I =
could
see xen-fbfront driver on guest and Debugged </span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" =
style=3D"color:rgb(5,99,193);text-decoration-line:underline"><span style=3D=
"text-decoration-line:none">xen-fbfront.c</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" =
style=3D"color:rgb(5,99,193);text-decoration-line:underline"><span style=3D=
"text-decoration-line:none">Xenbusprobe_backend.c</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" =
style=3D"color:rgb(5,99,193);text-decoration-line:underline"><span style=3D=
"text-decoration-line:none">Xenbusprobe_frontend.c</span></span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" =
style=3D"color:rgb(5,99,193);text-decoration-line:underline"><span style=3D=
"text-decoration-line:none">But not sure where is the actual issue.</span><=
/span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 8pt;line-height:107%;font-si=
ze:11pt;font-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" =
style=3D"color:rgb(5,99,193);text-decoration-line:underline"><span style=3D=
"text-decoration-line:none">Let me know which part of code will help us mor=
e =C2=A0for better understanding the issue.</span></span></p></div>

--00000000000037bce905eeae8cb2--

