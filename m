Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9F489686
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 11:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255279.437415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6s4L-0001X8-4W; Mon, 10 Jan 2022 10:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255279.437415; Mon, 10 Jan 2022 10:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6s4L-0001UX-1P; Mon, 10 Jan 2022 10:38:29 +0000
Received: by outflank-mailman (input) for mailman id 255279;
 Mon, 10 Jan 2022 10:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMJ8=R2=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1n6s4I-0001UP-KN
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 10:38:26 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ff67d63-7201-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 11:38:24 +0100 (CET)
Received: by mail-yb1-xb33.google.com with SMTP id 127so20469736ybb.4
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jan 2022 02:38:24 -0800 (PST)
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
X-Inumbo-ID: 6ff67d63-7201-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dcXMmeVHAB1ihFPo/vRXg+VHbRUEYPCk1gHE6WtCIU=;
        b=VZ40y05+OZTSjgeqthAF/ACZWFONlT3eGFwtxctoUriGGYJcCrUIyulQMobRLbsxfG
         beIzu8XhP+zyijtqReLoxkDcBp5CtDpj/VFs3M5YZE7XboQSFvf8dhpxCFGLFCs9lYze
         7eAhvIxVIibm2pRopVawQs5UzyZBipQID151YJ0nteuY8wc6rLViQoe0ETzfQfGOEE2n
         hJzUTKw38jAEn/LJWZc9iwWrc2uT5p+kXVRoi+5g6brh8B2KPsT9RfOrXwCXgtTegVHW
         g7VvoN8bZQ443XNdXUNCi9e32DOC5veMoQ91v0k/yUl7mjqfPee8SaVLMRowKTGAcbQe
         9nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dcXMmeVHAB1ihFPo/vRXg+VHbRUEYPCk1gHE6WtCIU=;
        b=Oa0RbHtIVgTJNuo4xhhk7eVs9WyvwzSfJef9buhDD/vQJ2qfeyKnM6gkJpzBoljCLd
         JrYdETMRHKBZRISvJWQ4nPUD3gEBzW66kty1jli6tpHfuzv5MmP50tsh0Z4fOBzpaCJe
         yadHNg08EKk+aw0O5EjMU+A4CRlCpEyHZIbBWMQIvpyC5EvfYvKweBBlLbfJDBVVu+xN
         oBq0YYJUaUVfMvILt8IqXrTqszJk3m5d1H4lafPv7DprgeEaMHv5oZ5shxQrzzjCT6tK
         CBcO+s1ofdWe37YblzC1u7vYpBn5JSJU8xyPQcwVAx528y88WaZ3KyktHwNLq3ANJSEp
         iW/w==
X-Gm-Message-State: AOAM532tRP6zcbdX4fpShLS1pTzFbBIElrsyUo5txsuD2GHguQY28Yll
	NUNu6o3cRky/8uF6JDy//2ksKVjc949yeNjV4as=
X-Google-Smtp-Source: ABdhPJwUHJk/qOzsu4GOuriRdyHf2T3CS/FPBh9tiq6xL1am4XXRmPdy6GlONH/IshRMeA7Y+EhZPZDR3EW9C4wgKyQ=
X-Received: by 2002:a25:42:: with SMTP id 63mr80389295yba.110.1641811103669;
 Mon, 10 Jan 2022 02:38:23 -0800 (PST)
MIME-Version: 1.0
References: <CAN2gxUQmsa=ONQqj0-3PZ2oxp-QVMgsm0BQ+q=-LWwmWTqwMZg@mail.gmail.com>
 <CAFLBxZazbQUF5bXw=yxM7+48KVVz_rJoi8UWrH83Ln-j40u9PA@mail.gmail.com>
 <CAN2gxUQ_h79Sy006NBcRkFzj9PDAjn8JA3UjQo4L81xo7ShgbA@mail.gmail.com>
 <CAFLBxZZX9escoCP92dLMCqQGv1-CHaEOzX7NAzvHs_heXYxfhg@mail.gmail.com> <CAN2gxUSL8f=osqSn89CGfMgdwcoosj9Cwk=rQjycOt_z95S_Mg@mail.gmail.com>
In-Reply-To: <CAN2gxUSL8f=osqSn89CGfMgdwcoosj9Cwk=rQjycOt_z95S_Mg@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 10 Jan 2022 10:38:12 +0000
Message-ID: <CAFLBxZboC7jL31gObjRtpCL9ESX2n8nUx_BP0eZKRzBvNY2YLg@mail.gmail.com>
Subject: Re: scheduler credit capture
To: amir masoud noohi <highlimner@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000009f636b05d537ef11"

--0000000000009f636b05d537ef11
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 6, 2022 at 9:05 PM amir masoud noohi <highlimner@gmail.com>
wrote:

> It looks like you can get the info you want for credit2
>
>
> How?
>

We're happy to help point you in the right direction, but I'm afraid you
will have to actually do some work on your own.  Did you google
"xentrace"?  Did you try running it on your system, and then running
xenalyze to see what it spat out?  Did you look at the TRACE calls in
credit2.c?

 -George

--0000000000009f636b05d537ef11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 6, 2022 at 9:05 PM amir m=
asoud noohi &lt;<a href=3D"mailto:highlimner@gmail.com">highlimner@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span s=
tyle=3D"color:rgb(51,51,51);font-family:Arial,sans-serif;font-size:12px;bac=
kground-color:rgb(233,234,234)">It looks like you can get the info you want=
 for credit2</span></blockquote><div><br></div><div style=3D"font-family:&q=
uot;trebuchet ms&quot;,sans-serif">How?</div></div></blockquote><div><br></=
div><div>We&#39;re happy to help point you in the right direction, but I&#3=
9;m afraid you will have to actually do some work on your own.=C2=A0 Did yo=
u google &quot;xentrace&quot;?=C2=A0 Did you try running it on your system,=
 and then running xenalyze to see what it spat out?=C2=A0 Did you look at t=
he TRACE calls in credit2.c?<br></div><div><br></div><div>=C2=A0-George<br>=
</div><div>=C2=A0</div></div></div>

--0000000000009f636b05d537ef11--

