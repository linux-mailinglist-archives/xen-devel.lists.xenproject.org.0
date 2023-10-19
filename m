Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB27CF4E5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619083.963690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQ56-0002VP-Uh; Thu, 19 Oct 2023 10:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619083.963690; Thu, 19 Oct 2023 10:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQ56-0002Tg-Qu; Thu, 19 Oct 2023 10:16:44 +0000
Received: by outflank-mailman (input) for mailman id 619083;
 Thu, 19 Oct 2023 10:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTk7=GB=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qtQ55-00025d-QV
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:16:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98978c5a-6e68-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 12:16:41 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so12803155a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 03:16:41 -0700 (PDT)
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
X-Inumbo-ID: 98978c5a-6e68-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697710600; x=1698315400; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6AjigDeSar34ErFT+otJ+m8rjpOHadAzLwS+oaAnvCY=;
        b=HHKmkjsWo80HATRU5e7cMCfiZA53T63HUcKHDLjFbYCzXJGq7m2v4gcnPnyRj269Im
         8nz0HA32Vt88iuSLtrPVk13nVtJLDhfA7R3aaE73LoeRA+uMkLoUr9B5DXGXwuERO+vf
         rEOEhQ0qaLXBRXoqmCiCQe8HOdjTLGt7MBeIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697710600; x=1698315400;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AjigDeSar34ErFT+otJ+m8rjpOHadAzLwS+oaAnvCY=;
        b=VJf7RE6TYOp2O3x2muL6OOXJ/f5L/6YCVSU/hNVrfYr1quNq4ltacJTFdSdBOqqLUT
         8Mt5QBbq2dHQshstnFXgdPDESqJJ4BWviQIrQzrR6sCOW3ohkw/9ZPWjrDW9+eIsKjHM
         V3sy3rJxpZFVAy2TpIywmj3SFt04TvzTyFLagLhGBI/KRqepaKhNvmNtuCX800lp7+dO
         jFGQN+IML3S/6fnl30N8A4GFCoOo4oXDdfO8MQdM/MG4oWGEEx/Fj1XLhvqcE/rkVdFT
         G5N5qp5D05SxdAKPQpOEfwMomOz3AugNJSDIqv0tKzOpB5M8uHzEQPKyQGBoxpHstVmz
         nQ/A==
X-Gm-Message-State: AOJu0YzlBhtRp7y9qPj80Z2HYpyz9VzdbQx9amIJejIJAcd85FmmX8pq
	uOwTs228Hl8rtknekyfiaOjiNPLL/HntrKrgC+nowiNVKFfGBxNhjr4=
X-Google-Smtp-Source: AGHT+IGkhjtGeejJJXMobzWb8aDwbkhmdt0fccQfKjtPA+9Qmy4+eum2npX7W/Nrsu3NEWJ4IK5D9UjOZU83G7f/B6M=
X-Received: by 2002:a05:6402:274f:b0:52c:b469:bafd with SMTP id
 z15-20020a056402274f00b0052cb469bafdmr1333529edd.41.1697710600332; Thu, 19
 Oct 2023 03:16:40 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 19 Oct 2023 11:16:05 +0100
Message-ID: <CAO-mL=zPB6DPC-6mh9u3WSJkirDKLRNDVHWnRvqCaemZfT8Yvg@mail.gmail.com>
Subject: Documentation survey results
To: xen-devel@lists.xenproject.org, xen-announce@lists.xenproject.org, 
	xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000043bdcc06080f0d33"

--00000000000043bdcc06080f0d33
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

First and foremost, thank you for your time in providing valuable feedback
on our current documentation in The Xen Project.

This survey has now concluded, and I am happy to share the results with you.
Please find attached the full survey results here
<https://cryptpad.fr/file/#/2/file/9dhImqlBHovRuYMe-m8Eh3jO/>.

*Summary:*

   - We've received valuable suggestions for enhancing Xen documentation,
   including keeping it up-to-date, adding step-by-step tutorials, providing
   debugging guides, and diving deeper into architectural aspects.
   - Users recommend platforms like Doxygen, Sphinx, and GitLab for
   efficient documentation management. Incorporating visual aids and practical
   guides is emphasized for better user engagement.
   - A total of 35 participants gave feedback, with the majority having at
   least 2 years of experience and 10 who have been in the project for over
   10+ years.
   - The majority of the participants stated they used the Xen project wiki
   as their primary source for documentation, closely followed by Xen bits,
   asking the mailing list, Matrix/IRC, and distro documentation. However, one
   person didn't know we had documentation.
   - Overall it is clear to see there is a demand for clear and accurate
   documentation. Although the existing documentation has some benefits, the
   majority of the community would like to see this improved and changed.

*Next steps:*

There is no single solution that solves all the issues instantaneously.
However, we have identified the key aspects of updating content, especially
how-to guides for new users, and simplifying it for everyone to find the
information they need.

The community manager will be working on identifying different ways to
ensure users' suggestions are acknowledged and implemented. The next steps
will be to collaborate closely with the community on updating the content
and potentially the platform. The improved documentation will likely be
planned to be a part of the new website for The Xen Project.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--00000000000043bdcc06080f0d33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>First and foremost, thank =
you for your time in providing valuable feedback on our current documentati=
on in=C2=A0The Xen Project.</div><div><br></div><div>This survey has now co=
ncluded, and I am happy to share the results with you.</div><div>Please fin=
d attached the <a href=3D"https://cryptpad.fr/file/#/2/file/9dhImqlBHovRuYM=
e-m8Eh3jO/">full survey results here</a>.</div><div><b><br></b></div><div><=
b>Summary:</b></div><ul><li>We&#39;ve received valuable suggestions for enh=
ancing Xen documentation, including keeping it up-to-date, adding step-by-s=
tep tutorials, providing debugging guides, and diving deeper into architect=
ural aspects.=C2=A0</li><li>Users recommend platforms like Doxygen, Sphinx,=
 and GitLab for efficient documentation management. Incorporating visual ai=
ds and practical guides is emphasized for better user engagement.</li><li>A=
 total of 35 participants gave feedback, with the majority having at least =
2 years of experience and 10 who have been in the project for over 10+ year=
s.</li><li>The majority of the participants stated they used the Xen projec=
t wiki as their primary source for documentation, closely followed by Xen b=
its, asking the mailing list, Matrix/IRC, and distro documentation. However=
, one person didn&#39;t know we had documentation.</li><li>Overall it is cl=
ear to see there is a demand for clear and accurate documentation. Although=
 the existing documentation has some benefits, the majority of the communit=
y would like to see this improved and changed.</li></ul><div><b>Next steps:=
</b></div><br>There is no single solution that solves all the issues instan=
taneously. However, we have identified the key aspects of updating content,=
 especially how-to guides for new users, and simplifying it for everyone to=
 find the information they need.=C2=A0<div><br></div><div>The community man=
ager will be working on identifying different ways to ensure users&#39; sug=
gestions are acknowledged and implemented. The next steps will be to collab=
orate closely with the community on updating the content and potentially th=
e platform. The improved documentation will likely be planned to be a part =
of the new website for The Xen Project.<div><br></div><div>Many thanks,<div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Kelly Choi</div><div><br></div><div><div style=3D=
"color:rgb(136,136,136)">Open Source Community Manager</div><div style=3D"c=
olor:rgb(136,136,136)">XenServer, Cloud Software Group</div></div></div></d=
iv></div></div></div></div>

--00000000000043bdcc06080f0d33--

