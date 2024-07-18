Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D08934DAC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 15:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760494.1170354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQm1-0000We-5S; Thu, 18 Jul 2024 13:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760494.1170354; Thu, 18 Jul 2024 13:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQm1-0000V3-28; Thu, 18 Jul 2024 13:02:17 +0000
Received: by outflank-mailman (input) for mailman id 760494;
 Thu, 18 Jul 2024 13:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7lN=OS=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sUQlz-0000Ux-L4
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 13:02:15 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f35ed256-4505-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 15:02:13 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77c4309fc8so84090466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 06:02:13 -0700 (PDT)
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
X-Inumbo-ID: f35ed256-4505-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721307732; x=1721912532; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NVHa2JnghbRYbpaxpAAcpkttU2xbOumQSlLP7c17yk0=;
        b=ZyAT764Z6zQDWNi9pixvZR7f+qj1cUceCUJIizNJ7WTanyQh91TB2j/cxkk4oGXKWo
         FqRsVugEIcnHb8H1M9iHr7ZGTwiqbxy9v9VPyMU1BAMSlCljrXat0LOWDkWuqg9n0ERe
         1YAAEXxWNCF3nFvdSevThTCkLNQ7DjfvgsCZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307732; x=1721912532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVHa2JnghbRYbpaxpAAcpkttU2xbOumQSlLP7c17yk0=;
        b=bUmhBNzZsILT1g4R7FQG04YgbdmGuaGQkLUI9aH/LZbsGS42j9iwi7QlP3Bi6T6/O8
         EH4RiBK7FsDpKSG9usoAAJUtpFWVpH/OqYp1x1jWS+k6afjLo+6Lwx0GTX1Q4Wr4oSfe
         9I7q4INyRPzNZdmR8tkFm0GZn3+bS+iAofr274sTry4BUmmAd/z2kdN4RcHW+Je0l+Y1
         rHRVKMNX4l+7cAE6VXrzfaeAfMkmu1WMPF7vRh2RvIRh2Du56bcZ0jR4pNY8ZydtGv7E
         DNhvriWGrFoIUQ0PAfKi10NhTkaVFRByGHUy/xAZ9z5e1bihBNpfBdSn37E2VK+pmoAw
         FvXg==
X-Gm-Message-State: AOJu0Yye62JmHEVfMRmak0FGAOmsnqxivoDhY6uK8niG0AapwhTlh4KR
	X/R4ibYOhL80KhHUWTajG0VgCXKfvCr1qsJnYn+MEtrRcpCjFnjEU/uz3Q5GJVtlzoYNgI21NPR
	6NCRuFMJ33UOq+uBqhpKFWKkshklth8d42+XWgsu5UuNHINLdhVk=
X-Google-Smtp-Source: AGHT+IGQ8Av3d208PY879q2h+YbY5zu9dNo6N59J79xnxEB1qvqJUV3Zpm/TDIDbJ4wOX4faajTaiSCFgFuw2ny/sPU=
X-Received: by 2002:a17:906:d9c8:b0:a77:eb34:3b4b with SMTP id
 a640c23a62f3a-a7a011208f2mr324293966b.11.1721307731994; Thu, 18 Jul 2024
 06:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <lyq04kvx.1319r6evnjim8@vates.tech> <lyq1lxoh.2bbb1hy8vxji8@vates.tech>
In-Reply-To: <lyq1lxoh.2bbb1hy8vxji8@vates.tech>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 18 Jul 2024 14:01:35 +0100
Message-ID: <CAO-mL=xPy=piun0L6u-pe6RvC70BectJGQiODiXnDCVMjs088g@mail.gmail.com>
Subject: Re: Pre-register now for the Xen Project Winter Meetup 2024!
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Olivier Lambert <olivier.lambert@vates.tech>
Content-Type: multipart/related; boundary="000000000000ea6e43061d852f7c"

--000000000000ea6e43061d852f7c
Content-Type: multipart/alternative; boundary="000000000000ea6e42061d852f7b"

--000000000000ea6e42061d852f7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Olivier, this will be a great trial for the Xen Project and we
are grateful for Vates' support.

*Some FAQs for the community:*

   - Will there be a virtual element?
      - For this specific event, we will not have a virtual element so that
      the meetup can focus on in-person collaboration and scoping out
how to run
      smoothly.
   - Does this replace Xen Summit?
      - No. This event is a separate meetup to help bring together our
      community and enhance collaboration and knowledge sharing. We will st=
ill
      look to run annual Xen Summits, but this event may change the way how
      things are run in the future in a bid to save costs and increase the
      frequency of meetups.
   - What other locations have been considered? and why Grenoble?
      - Multiple locations are considered. We have community members based
      worldwide, and we want to ensure that everyone has a chance to meet.
      Grenoble has been selected as we have support from Vates hosting at t=
he
      location and also acts as a first trial. The location means we
can host for
      free, which we pass on to attendees. In the future, we are also
looking at
      hosting events in the US.
   - I want to help host an event, what should I do?
      - Reach out to me! We love to see our community engaged and running
      local events so any support here is welcomed. We might also have a sm=
all
      budget to help you get started.

If you have any other questions, Olivier and I will be on hand to help!

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Wed, Jul 17, 2024 at 6:19=E2=80=AFPM Olivier Lambert <olivier.lambert@va=
tes.tech>
wrote:

> Well, I guess that's what happens when you write emails at the end of an
> exhausting day! =F0=9F=98=85 Let's get those dates right:
>
>    - The Xen Project Winter Meetup is *in 2025*.
>    - The event will take place over *two days, Thursday and Friday,
>    January 30 and 31, 2025*.
>
> Thank you for bearing with me on this.
>
> All the details on the website are accurate from the start.
>
>
>
>
>
>
> * Olivier Lambert | Vates CEO*
> *XCP-ng & Xen Orchestra - *Vates solutions
> Book a meeting with me <https://cal.vates.tech/olivier-lambert>
> *web:* https://vates.tech
>
> On Wednesday, 07/17/2024, 17:33, Olivier Lambert
> <olivier.lambert@vates.tech> wrote:
>
> Hello everyone,
>
> As discussed during our previous Xen Summit in the first design session,
> "The Future of Xen Events," we aim to create an event that is:
>
>    - Financially neutral for the Xen Project (0 cost, entirely supported
>    by Vates and sponsors)
>    - 100% branded as a Xen Event, similar to a regular Summit
>    - Featuring content akin to a normal summit (talks & design sessions)
>    - Attracting new contributors to the Xen dev community
>    - Utilizing our own tools to reduce costs and be free from the Linux
>    Foundation
>    - Serving as a test bed for future Xen meetings, proving we can manage
>    without the LF
>
>
> That's exactly what we are doing with the Xen Project Winter Meetup 2024!
> More details are available at
> https://campaign.vates.tech/xen-project-winter-meetup.
>
> *Save the Date:* The event will take place on January 30-31, 2024
> (Tuesday to Friday) in Grenoble. Consider using the weekend to enjoy near=
by
> ski resorts! =F0=9F=98=87
> Action Needed: Pre-register Now =F0=9F=8E=AF
>
> We need to gather a selection committee for the CFP, but first, we need
> your help: please pre-register if you plan to attend. The event is capped
> at 50 participants, and we already have 15 pre-registrations from the
> academic world (researchers, students, PhDs).
>
> The sooner you pre-register, the better we can organize. The
> pre-registration form is available on the event website: Pre-register her=
e
> <https://campaign.vates.tech/xen-project-winter-meetup>.
>
> By pre-registering, you'll stay informed about official registration,
> being part of the selection committee, venue details, and everything you
> need to attend.
>
> *Note:* your data is secure; all our tools (CFP tool, registration tool,
> etc.) are self-hosted on our servers in France, running on Xen. No
> third-party tools are used.
>
> Looking forward to your participation!
>
> Best regards,
>
>

--000000000000ea6e42061d852f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, Olivier, this will be a great trial for the Xen=
 Project and we are grateful for Vates&#39; support.=C2=A0<div><br><div><u>=
Some FAQs for the community:</u></div><div><ul><li>Will there be a virtual =
element?=C2=A0</li><ul><li>For this specific event, we will not have a virt=
ual element so that the meetup can focus on in-person collaboration and sco=
ping out how to run smoothly.=C2=A0</li></ul><li>Does this replace Xen Summ=
it?=C2=A0</li><ul><li>No. This event is a separate meetup to help bring tog=
ether our community and enhance collaboration and knowledge=C2=A0sharing. W=
e will still look to run annual Xen Summits, but this event may change the =
way how things are run in the future in a bid to save costs and increase th=
e frequency of meetups.=C2=A0</li></ul><li>What other locations have been c=
onsidered? and why Grenoble?</li><ul><li>Multiple locations are considered.=
 We have community members based worldwide, and we want to ensure that ever=
yone has a chance to meet. Grenoble has been selected as we have support fr=
om Vates hosting at the location and also acts as a first trial. The locati=
on means we can host=C2=A0for free, which we pass on to attendees. In the f=
uture, we are also looking at hosting events in the US.=C2=A0</li></ul><li>=
I want to help host an event, what should I do?=C2=A0</li><ul><li>Reach out=
 to me! We love to see our community engaged and running local events so an=
y=C2=A0support here is welcomed. We might also have a small budget to help =
you get started.=C2=A0</li></ul></ul><div><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>If you h=
ave any other questions, Olivier and I will be on hand to help!</div><div><=
br></div><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><d=
iv style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"co=
lor:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><b=
r></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 17, 2024 at 6:19=E2=80=AFPM Olivier Lambert &lt=
;olivier.lambert@vates.tech&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=20
 <div>
  <div id=3D"m_-3904366028155234315bm-composer-content-wrapper">
   <div style=3D"font-family:Verdana,&quot;Verdana Ref&quot;,Corbel,&quot;L=
ucida Grande&quot;,&quot;Lucida Sans Unicode&quot;,&quot;Lucida Sans&quot;,=
&quot;DejaVu Sans&quot;,&quot;Liberation Sans&quot;,sans-serif"></div>
   <p>Well, I guess that&#39;s what happens when you write emails at the en=
d of an exhausting day! =F0=9F=98=85 Let&#39;s get those dates right:</p>
   <ul>
    <li>The Xen Project Winter Meetup is <strong>in 2025</strong>.</li>
    <li>The event will take place over <strong>two days, Thursday and Frida=
y, January 30 and 31, 2025</strong>.</li>
   </ul>
   <p>Thank you for bearing with me on this.</p>
   <p style=3D"font-family:Verdana,&quot;Verdana Ref&quot;,Corbel,&quot;Luc=
ida Grande&quot;,&quot;Lucida Sans Unicode&quot;,&quot;Lucida Sans&quot;,&q=
uot;DejaVu Sans&quot;,&quot;Liberation Sans&quot;,sans-serif">All the detai=
ls on the website are accurate from the start.<br></p>
   <div style=3D"font-family:Verdana,&quot;Verdana Ref&quot;,Corbel,&quot;L=
ucida Grande&quot;,&quot;Lucida Sans Unicode&quot;,&quot;Lucida Sans&quot;,=
&quot;DejaVu Sans&quot;,&quot;Liberation Sans&quot;,sans-serif">
    <div>
     <br>
    </div>=20
   </div>
   <div style=3D"font-family:Verdana,&quot;Verdana Ref&quot;,Corbel,&quot;L=
ucida Grande&quot;,&quot;Lucida Sans Unicode&quot;,&quot;Lucida Sans&quot;,=
&quot;DejaVu Sans&quot;,&quot;Liberation Sans&quot;,sans-serif">
    <br>
   </div>
   <div>
    <div>
      =C2=A0
    </div>
    <div>
      =C2=A0
    </div>
    <div>
     <div>
      <br>
      <table>
       <tbody>
        <tr>
         <td style=3D"font-size:10pt">=C2=A0</td>
         <td style=3D"font-size:10pt;padding-left:20px;border-left:1px soli=
d rgb(180,38,38)">
          <div> <strong> Olivier Lambert | Vates CEO</strong>
          </div>
          <div> <strong></strong>
          </div>
          <div> <strong>XCP-ng &amp; Xen Orchestra - </strong>Vates solutio=
ns
          </div>
          <div> <a href=3D"https://cal.vates.tech/olivier-lambert" target=
=3D"_blank">Book a meeting with me</a><strong><br>web:</strong> <a href=3D"=
https://vates.tech" target=3D"_blank">https://vates.tech</a>
          </div>
          <div>
           <img style=3D"float: left;" src=3D"cid:ii_190c5decb28c204bfcc1" =
alt=3D"" width=3D"174" height=3D"159">
          </div> </td>
        </tr>
       </tbody>
      </table>
     </div>
    </div>
   </div>
   <br>
   <div id=3D"m_-3904366028155234315data-bm-forward-separator">
    <p>On Wednesday, 07/17/2024, 17:33, Olivier Lambert &lt;olivier.lambert=
@vates.tech&gt; wrote:</p>
    <blockquote style=3D"margin-left:1rem;padding-left:1rem;border-left:2px=
 solid black">
     <div id=3D"m_-3904366028155234315bm-composer-content-wrapper">
      <div id=3D"m_-3904366028155234315bm-composer-content-wrapper">
       <div style=3D"font-family:Verdana,&quot;Verdana Ref&quot;,Corbel,&qu=
ot;Lucida Grande&quot;,&quot;Lucida Sans Unicode&quot;,&quot;Lucida Sans&qu=
ot;,&quot;DejaVu Sans&quot;,&quot;Liberation Sans&quot;,sans-serif">
        <p>Hello everyone,</p>
        <p>As discussed during our previous Xen Summit in the first design =
session, &quot;The Future of Xen Events,&quot; we aim to create an event th=
at is:</p>
        <ul>
         <li>Financially neutral for the Xen Project (0 cost, entirely supp=
orted by Vates and sponsors)</li>
         <li>100% branded as a Xen Event, similar to a regular Summit</li>
         <li>Featuring content akin to a normal summit (talks &amp; design =
sessions)</li>
         <li>Attracting new contributors to the Xen dev community</li>
         <li>Utilizing our own tools to reduce costs and be free from the L=
inux Foundation</li>
         <li>Serving as a test bed for future Xen meetings, proving we can =
manage without the LF</li>
        </ul>
        <div>
         <br>
        </div>
        <div>
          That&#39;s exactly what we are doing with the Xen Project Winter =
Meetup 2024! More details are available at <a href=3D"https://campaign.vate=
s.tech/xen-project-winter-meetup" title=3D"https://campaign.vates.tech/xen-=
project-winter-meetup" target=3D"_blank">https://campaign.vates.tech/xen-pr=
oject-winter-meetup</a>.
        </div>
        <div>
         <br>
        </div>
        <div>
         <p><strong>Save the Date:</strong> The event will take place on Ja=
nuary 30-31, 2024 (Tuesday to Friday) in Grenoble. Consider using the weeke=
nd to enjoy nearby ski resorts! =F0=9F=98=87</p>
         <div></div>
         <div>
          <h3>Action Needed: Pre-register Now =F0=9F=8E=AF<br></h3>
          <p>We need to gather a selection committee for the CFP, but first=
, we need your help: please pre-register if you plan to attend. The event i=
s capped at 50 participants, and we already have 15 pre-registrations from =
the academic world (researchers, students, PhDs).</p>
          <p>The sooner you pre-register, the better we can organize. The p=
re-registration form is available on the event website: <a href=3D"https://=
campaign.vates.tech/xen-project-winter-meetup" target=3D"_blank">Pre-regist=
er here</a>.</p>
          <p>By pre-registering, you&#39;ll stay informed about official re=
gistration, being part of the selection committee, venue details, and every=
thing you need to attend.</p>
          <p><strong>Note:</strong> your data is secure; all our tools (CFP=
 tool, registration tool, etc.) are self-hosted on our servers in France, r=
unning on Xen. No third-party tools are used.</p>
          <p>Looking forward to your participation!</p>
          <p>Best regards,</p>
         </div>
        </div>
        <br>
       </div>
      </div>
     </div>
    </blockquote>
   </div>
  =20
  </div>
 <img src=3D"http://bounce.vates.tech/track/open.php?u=3D30504962&amp;id=3D=
ef9d15a4a4fa401aadd08911d7accd02" height=3D"1" width=3D"1" alt=3D""></div>


</blockquote></div>

--000000000000ea6e42061d852f7b--
--000000000000ea6e43061d852f7c
Content-Type: image/png; name=noname
Content-Disposition: inline; filename=noname
Content-Transfer-Encoding: base64
Content-ID: <ii_190c5decb28c204bfcc1>
X-Attachment-Id: ii_190c5decb28c204bfcc1

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
IhUHC4o4ZKhOFqSKOGoVilAh1AqtOphc+iE0aUhSXBwF14KDH4tVBxdnXR1cBUHwA8TRyUnRRUr8
X1JoEePBcT/e3XvcvQOEeplpVsc4oOm2mU4mxGxuRQy9ogsDiCCEuMwsY1aSUvAdX/cI8PUuxrP8
z/05etW8xYCASDzDDNMmXiee2rQNzvvEEVaSVeJz4jGTLkj8yHXF4zfORZcFnhkxM+k54gixWGxj
pY1ZydSIJ4mjqqZTvpD1WOW8xVkrV1nznvyF4by+vMR1msNIYgGLkCBCQRUbKMNGjFadFAtp2k/4
+Idcv0QuhVwbYOSYRwUaZNcP/ge/u7UKE3EvKZwAOl8c52MECO0CjZrjfB87TuMECD4DV3rLX6kD
05+k11pa9Ajo2wYurluasgdc7gCDT4Zsyq4UpCkUCsD7GX1TDui/BXpWvd6a+zh9ADLUVeoGODgE
RouUvebz7u723v490+zvB3gHcqkloKXxAAAN/WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94
cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1w
bWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNC40LjAtRXhp
djIiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJk
Zi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6
eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICB4bWxuczpzdEV2dD0i
aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIgogICAgeG1s
bnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgeG1sbnM6R0lNUD0i
aHR0cDovL3d3dy5naW1wLm9yZy94bXAvIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2Jl
LmNvbS90aWZmLzEuMC8iCiAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC8iCiAgIHhtcE1NOkRvY3VtZW50SUQ9ImdpbXA6ZG9jaWQ6Z2ltcDo5NmE3ZjI0MS1lMjNjLTRi
MWEtOTdjZS1kNmU2NjliOTk4ZTIiCiAgIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MGNlZmJj
NjYtNjFiMy00ZDZkLWExYzgtMTg5M2QwNWFjOTg5IgogICB4bXBNTTpPcmlnaW5hbERvY3VtZW50
SUQ9InhtcC5kaWQ6NDIyZDdlNTItOGE2Ny00NmExLWI5MjYtNTJiOGEzMGIxOGIwIgogICBkYzpG
b3JtYXQ9ImltYWdlL3BuZyIKICAgR0lNUDpBUEk9IjIuMCIKICAgR0lNUDpQbGF0Zm9ybT0iTGlu
dXgiCiAgIEdJTVA6VGltZVN0YW1wPSIxNjU2MDE0ODk0NDU0Mjg5IgogICBHSU1QOlZlcnNpb249
IjIuMTAuMzAiCiAgIHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHhtcDpDcmVhdG9yVG9vbD0iR0lN
UCAyLjEwIj4KICAgPHhtcE1NOkhpc3Rvcnk+CiAgICA8cmRmOlNlcT4KICAgICA8cmRmOmxpCiAg
ICAgIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiCiAgICAgIHN0RXZ0OmNoYW5nZWQ9Ii8iCiAgICAgIHN0
RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YTY0MGI4MmMtMDg0My00MjYwLTk3NmMtYTg1ZjA3MDc5
ZjcwIgogICAgICBzdEV2dDpzb2Z0d2FyZUFnZW50PSJHaW1wIDIuMTAgKExpbnV4KSIKICAgICAg
c3RFdnQ6d2hlbj0iMjAyMi0wNC0yOVQxMzoyMzo1NCswMjowMCIvPgogICAgIDxyZGY6bGkKICAg
ICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RF
dnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDozYTUyMDNkNS04NGRiLTQzNDMtOWZhYy03NjFmZDZmZmFh
YjgiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkdpbXAgMi4xMCAoTGludXgpIgogICAgICBz
dEV2dDp3aGVuPSIyMDIyLTA2LTIzVDIyOjA4OjE0KzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAg
IDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94Onht
cG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAKPD94cGFja2V0IGVuZD0idyI/PlmiVpAAAAAGYktHRADwAKIAftw2PhcAAAAJcEhZcwAALiMA
AC4jAXilP3YAAAAHdElNRQfmBhcUCA56CWQaAAAgAElEQVR42ux9Z5gkV3X2e+6tqk4Td3d2epN2
tUlhJRSQQEKABpFE/ggm2SAMxmBbtjA2/uwPJ2wwGNs8BBuDbTAyOdnYGIEtECMhhISQYIXianOc
2Z3diR2r7j3fj3sqdO/M7Ehik9TneXq3p7u6uvrWe8894T3nEjrymOWnT79UFdaUledrUoFPBADW
AgzYRoio3rTR2CQfuW/UPuPgdu6M2GMX6gzBI5MvAuqiN7+8N9/f1Uta94C5xzbCZQCWE/MSUqoL
zAFZVrAccWRqNoomOTIj1vIBT6uDNjTTptqYmtkxOnHR5ntqnVHtAPe4yAcA9aprX3O231N6ktJ6
E0AbCLyWmc8gYFApBTADlsHWAswgZsAwYC3YMmAsODKwYVSHtXs4srvYmK22GT1ga817p3cdvOei
n9871hntDnAfs4x95DeWB+XBl0S18MW1feMbibEUhD4AgAXADGYGCVhhOXkNNn7YBMDuISCOH5Fp
IjKH2JgDpt78cWOy+vWoEd1y/o/ujDp3oAPcBcn0z79O/uKlJZ6aXG12bX0bwuYvAeiv7DgYmJka
gWXAmMEWABxQs6CNwcqMFKjt/xsHYjY2AbH73xgY2zC18CFTb36Cm9G3olrz0Dk/vqvZuTsd4M4q
tT3f61G54tNA9FoeP/wqs3NLCcagfmgS9f3jIM4CFSBmB073T6phGQDbDHjbtW1sPlhQon3NUSBG
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
--000000000000ea6e43061d852f7c--

