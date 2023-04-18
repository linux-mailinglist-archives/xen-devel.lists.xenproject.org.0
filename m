Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D66E6097
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522795.812386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pok60-0003Om-VW; Tue, 18 Apr 2023 12:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522795.812386; Tue, 18 Apr 2023 12:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pok60-0003Mr-SY; Tue, 18 Apr 2023 12:06:04 +0000
Received: by outflank-mailman (input) for mailman id 522795;
 Tue, 18 Apr 2023 12:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bo8Z=AJ=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pok60-0003Ml-0N
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:06:04 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 631b9427-dde1-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:06:02 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24704a7bf34so1888080a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Apr 2023 05:06:03 -0700 (PDT)
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
X-Inumbo-ID: 631b9427-dde1-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681819561; x=1684411561;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jp1fDN0xITU9jamTbgoD5sc14TDJeM5ZVQEegcXjAgo=;
        b=P9Sl2GH1O9Fx3pci9j0KLcyrNHBcqy1fV0s/HLiFI0oYjRI2QImQF04V9SHVCyK29U
         AZu82Y0AS4CgrPdfUI9s4K5mneZy+Hx0+YlNVvNgzMowMoK/oqWBgmr6MW1Ccg06RkdI
         sJP/8ec9BFi7q72rsSxJushmQ+Z2cBw1aOVdvIifJffo3DqkZOqDmKu4Ebi2x0nH7k5J
         LRUYrfwcMhW+5+wwo//ixUW+uMQmqCuyH0q2JEDYZSIHv+N/9owQxHhlT7SpT44EucF+
         Anssf5gntn+vaxQYP+0kynq4TB5wSMFBtbiX0gp89WLG7zon0RlSHs6NPvNs+dMAKg7e
         c5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819561; x=1684411561;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jp1fDN0xITU9jamTbgoD5sc14TDJeM5ZVQEegcXjAgo=;
        b=WNwy4MWJ+6lbEYkv6BXMoIv+Lh2RAargCfWevvkjNbWECEkpr0Lmp3lOMwHOWSRPoC
         0FoWiYCJwEWicfVGgNbiSitd8KAcLIdYkQ6PxqY4qL9mR9NmqLcoEm4at9ZV3ommFpXi
         s3rywApVqjL/pF3fXucfFL+QoYE8cS5CV5R/6yc2C1ObV3pVLz6y+tZeYAunmu6Ggdsr
         n0d6reIyOWTEnBnjqhqueTnr2cA81JyslzeoEvhfzI9lAzvVSiQ5+U8HeQMYUNr19BdS
         eXWz62Aw0wmLbaD6V/QlXEYaRP00mhOJS3izNZF6+SjNv2EiAaDEaTob3PW/pnISV5LQ
         g6Pg==
X-Gm-Message-State: AAQBX9fgfNwAYUGn5XSTMD7f9BCj408v9nBWS3HB626slIeyG1JOjBMF
	I1PZdOyuuzIr2rCtWizS1U5B+nMmm53FWqSH5C0=
X-Google-Smtp-Source: AKy350Z6RwQfPyHMXSuCCfEVriC5Yp+5OaFmCLK9PNOvyUayIdDJnffuDuIIdOOfKvHdv7Xq56UAMzm/hFxchSUJ0bI=
X-Received: by 2002:a17:90a:4e4a:b0:247:2ff9:1cff with SMTP id
 t10-20020a17090a4e4a00b002472ff91cffmr1766307pjl.25.1681819561440; Tue, 18
 Apr 2023 05:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <a83e1891-99d2-2503-3675-e5c6573a9b69@xen.org> <CA+SAi2sZnrLzQoBn-e0GDy5De6PcGzxDCuJ3MSKicB_wB7o+Nw@mail.gmail.com>
In-Reply-To: <CA+SAi2sZnrLzQoBn-e0GDy5De6PcGzxDCuJ3MSKicB_wB7o+Nw@mail.gmail.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Tue, 18 Apr 2023 15:12:04 +0300
Message-ID: <CA+SAi2tsd6j-iriefD6nXbvd4Z1qjK1curTw7ZrCTjmX35fz7w@mail.gmail.com>
Subject: Fwd: xen cache colors in ARM
To: xen-devel@lists.xen.org, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="000000000000893d0b05f99b2134"

--000000000000893d0b05f99b2134
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
=D0=9E=D1=82: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 15:0=
5
Subject: Re: xen cache colors in ARM
To: Julien Grall <julien@xen.org>


Hi Julien,

We are speaking differently.
You have applied your own terminology.
I applied on my own.
So we did not catch each other.

I should download the repository from xenbits.org.
I should switch to the ML branch then.

Is it correct ?

Regards,
Oleg

=D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 14:29, Jul=
ien Grall <julien@xen.org>:

>
>
> On 18/04/2023 12:26, Oleg Nikitenko wrote:
> > Hi Julien,
>
> Hi Oleg,
>
> >
> >>> This feature has not been merged in Xen upstream yet
> >
> >> would assume that upstream + the series on the ML [1] work
> >
> > Please clarify this point.
> > Because the two thoughts are controversial.
>
> It is not clear to me how what I wrote is controversial. A series was
> sent on the ML for cache coloring support and this was tested on Xilinx
> ZynqMP (see cover letter).
>
> This work was sponsored by Xilinx/AMD. So my assumption is they have
> done the same amount of testing as they did for their own branch.
>
> Cheers,
>
> --
> Julien Grall
>

--000000000000893d0b05f99b2134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>=D0=9E=D1=82: <b =
class=3D"gmail_sendername" dir=3D"auto">Oleg Nikitenko</b> <span dir=3D"aut=
o">&lt;<a href=3D"mailto:oleshiiwood@gmail.com">oleshiiwood@gmail.com</a>&g=
t;</span><br>Date: =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3=
. =D0=B2 15:05<br>Subject: Re: xen cache colors in ARM<br>To: Julien Grall =
&lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt;<br></div><br><=
br><div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div>We are speakin=
g differently.</div><div>You have applied your own terminology.</div><div>I=
 applied on my own.</div><div>So we did not catch each other.</div><div><br=
></div><div>I should download the repository from <a href=3D"http://xenbits=
.org" target=3D"_blank">xenbits.org</a>.<br></div><div>I should switch to t=
he ML branch then.</div><div><br></div><div>Is it correct ?</div><div><br><=
/div><div>Regards,</div><div>Oleg<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=
=80. 2023=E2=80=AF=D0=B3. =D0=B2 14:29, Julien Grall &lt;<a href=3D"mailto:=
julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 18/04/2023 12:26, Oleg Nikitenko wrote:<br>
&gt; Hi Julien,<br>
<br>
Hi Oleg,<br>
<br>
&gt; <br>
&gt;&gt;&gt; This feature has not been merged in Xen upstream yet<br>
&gt; <br>
&gt;&gt; would assume that upstream + the series on the ML [1] work<br>
&gt; <br>
&gt; Please clarify this point.<br>
&gt; Because the two thoughts are controversial.<br>
<br>
It is not clear to me how what I wrote is controversial. A series was <br>
sent on the ML for cache coloring support and this was tested on Xilinx <br=
>
ZynqMP (see cover letter).<br>
<br>
This work was sponsored by Xilinx/AMD. So my assumption is they have <br>
done the same amount of testing as they did for their own branch.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>
</div></div>

--000000000000893d0b05f99b2134--

