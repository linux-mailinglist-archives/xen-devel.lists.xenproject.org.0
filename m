Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8C92D092
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756813.1165585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVNF-0001Rf-0j; Wed, 10 Jul 2024 11:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756813.1165585; Wed, 10 Jul 2024 11:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVNE-0001QH-TB; Wed, 10 Jul 2024 11:20:36 +0000
Received: by outflank-mailman (input) for mailman id 756813;
 Wed, 10 Jul 2024 11:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urFr=OK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sRVND-00011k-Cx
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:20:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0c5252-3eae-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 13:20:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77c080b521so712481166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 04:20:33 -0700 (PDT)
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
X-Inumbo-ID: 6c0c5252-3eae-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720610432; x=1721215232; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b8upkYVI4dI/+WqZV7y4nTl32BHI4mAXUryiNdpHTQk=;
        b=L9Xm5y4lDaYP9TwQ2bvfE7BA+M4pyYSY5XJv6RWkPyOSu17WuAzDiCshjYBcRJORYX
         qwqV/Ah/S/rgqcKpd9DWd/w5Jmssy0n/PiJE11s+ZlgK0T/Dxshwk1R+gQan6Xcxyqjz
         rI/G2y4x4rsBLir4q9YbGtTKb+RHJkkKtGrWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720610432; x=1721215232;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8upkYVI4dI/+WqZV7y4nTl32BHI4mAXUryiNdpHTQk=;
        b=gMZBGeRhJux+CkCYtnInNHfnysOICQzzqxCThGzaIK0I9rlSlg8/L4rT3UkXWSJxp1
         e7aY/HR6PK+osROkvb/a4ndKiDffwycsgJILzIwzbPgq8hyRPDVIOiLR1HBGzbN8sQVE
         WDK9/y+fRYNjPDWqBU/chpfwMQz+byHROlXFlEalN5ksl4YkuRy1DOkBz2parsFEtP4h
         g2jiY0jxCgtumMuF9zYmgu/7EarFMueOjmw8v9C8tL1wrGqANrtfr+5Dc7Ji4oUBj35D
         f8OszNQ0YKAEIUBPFc9SXqvaz6lqXAAZo3cX/dColSZ1NbigWzPiw3t1/I5EGke988Gn
         j5Eg==
X-Gm-Message-State: AOJu0Yx6m5XgqBVb2chATHsNVla2dD3tcH9TM3WchIAR83PlGE3BK14t
	UL3WNnfT+JeEvFBjcRRGeJSJlE7U8ZgzvFSyK7LfMli9Ra8Gsga4NjlwGiWzzNLj0wtVWcwn6wU
	DhAZxwbTY1QlHx2IBbe1A020cSeZJ84nSq9ChdwWghYqoir73IQPu6Q==
X-Google-Smtp-Source: AGHT+IGxsUJ5AGjDOzR1eO+XxuJYIm2+UVb8MODVYPmglXSjYgw/XXjC+atnKxthspqcXDkmPt1DA6EIk6nUw9H2nJU=
X-Received: by 2002:a17:906:f8db:b0:a6f:309d:ec23 with SMTP id
 a640c23a62f3a-a780b89ca05mr325814766b.72.1720610431904; Wed, 10 Jul 2024
 04:20:31 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 10 Jul 2024 12:19:56 +0100
Message-ID: <CAO-mL=zJQVKBZp26Saj6TMBnDqRChBkhMEQudqTk84DPiUkC-w@mail.gmail.com>
Subject: [Announcement] Upcoming Closure of Xen Project Colo Facility
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org, advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000975796061ce2d510"

--000000000000975796061ce2d510
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Xen Community,

We regret to inform you that the Xen Project is currently experiencing
unexpected changes due to the sudden shutdown of our colocated (colo) data
center facility by Synoptek. This incident is beyond our control and will
impact the continuity of OSSTest (the gating Xen Project CI loop), which we
heavily rely on as a project. We understand the inconvenience this may
cause to our users and stakeholders, and we are working diligently to
consider different solutions as swiftly as possible.

What Happened?

We received a notification from our colo facility provider Synoptek
indicating the shutdown of their services in Marlborough, where our current
facility is located. As a result, the OSSTest instance hosted at this
facility will likely be disrupted with an anticipated shutdown date of
October 31st, 2024.

Potential Impact

The potential consequence of this shutdown may mean availability of OSSTest
will be impacted, therefore affecting the number of bugs being caught.
Contributors may experience quality issues with code, or face slower
response times as our technical community spends more time resolving
issues. We are aware of the critical nature of the services we provide and
the significant impact this downtime may have.

Our Response

We are in constant communication with the colo facility provider, our IT
contractors, and our Board Members to understand the scope of the problem
and the estimated time for resolution. Additionally, we are exploring
alternative solutions to restore our services as quickly as possible. These
measures include:

Engaging with the Colo Facility Provider (Synoptek): We are working with
the provider to negotiate costs and the likelihood of us moving to another
facility as this was an unforeseen change.

Engaging with third parties: We have initiated discussions with our IT
contractors and third-party providers to find potential alternatives,
including other location facilities and donations of funds to support this
move.

Options we are considering:

   -

   Move our current hardware to a different co-location.
   -

      This could be another provider, a member of the Advisory Board, a
      University, or a similar organization that offers services for
Open Source
      projects.
      -

      This could include moving all the infrastructure, or just part of it,
      depending on costs and space available at the destination.
      -

   Abandon our hardware, and either re-create OSSTest from scratch at a
   different location or switch to a different test system (Gitlab CI).


All options have risks associated.

Further Considerations:

Moving the current hardware is expensive, even to a location provided for
free.  It is unknown whether our hardware will survive the move, or if we
will be able to recreate the setup at the new location. Furthermore, our
current IT contractors who help us manage the facility can only serve the
Boston area which means we will need to factor this in when choosing a new
location.

Our technical leadership team has considered abandoning our infrastructure
and creating a new OSSTest instance, however, as it involves acquiring new
hardware there is no guarantee we will be able to set up the new instance
successfully.

An option to mitigate this risk could be to deploy on a metal-as-a-service
provider, but that would require changes to OSSTest.

As a last resort, abandoning OSSTest has been discussed.  The project has
no replacement for a test coverage similar to what OSSTest provides.  Even
if Gitlab CI expanded test coverage similar to what OSSTest currently
covers, some features are unlikely to be replicated: automatic bisections
on regressions and testing of external projects (Linux kernel, QEMU, OVMF=
=E2=80=A6).

Input from the community

While we work on identifying different options, there are a few steps you
can take to stay informed.

Stay Updated: Keep an eye on our official communication channels for
real-time updates and information about the status of our services.

Get involved: We appreciate you may have feedback and questions, which is
why you are welcome to join the next monthly community call (Thursday 11th
July 2024) to provide your input.

Assistance: We welcome members of our community to provide resources or
suggest ideas that may help our project.

Looking Ahead

Our goal is to identify and implement measures that will minimize the
impact on our project. We will carefully consider the feasibility of
solutions, budget constraints, and the long-term needs of the Xen Project.

We apologize for the inconvenience caused by this unexpected announcement
and appreciate your understanding and patience as we navigate this
challenging situation. Your trust and continued support are invaluable to
us, and we remain committed to developing a powerful and reliable
open-source hypervisor.

Sincerely,

Kelly Choi


Community Manager
Xen Project

--000000000000975796061ce2d510
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-5172359f-7fff-b254-77=
59-22851cee11ab"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:16pt"><span style=3D"background-color:transparent;color:rgb(0,0=
,0);font-family:Arial,sans-serif;font-size:11pt">Dear Xen Community,</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:1=
6pt"><span style=3D"background-color:transparent;color:rgb(0,0,0);font-fami=
ly:Arial,sans-serif;font-size:11pt">We regret to inform you that the Xen Pr=
oject is currently experiencing unexpected changes due to the sudden shutdo=
wn of our colocated (colo) data center facility by Synoptek. This incident =
is beyond our control and will impact the continuity of OSSTest (the gating=
 Xen Project CI loop), which we heavily rely on as a project. We understand=
 the inconvenience this may cause to our users and stakeholders, and we are=
 working diligently to consider different solutions as swiftly as possible.=
</span><br></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:16pt"><span style=3D"font-size:15pt;font-family:Arial,sans-se=
rif;color:rgb(102,102,102);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">What Happened?</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline">We received a notification from ou=
r colo facility provider Synoptek indicating the shutdown of their services=
 in Marlborough, where our current facility is located. As a result, the OS=
STest instance hosted at this facility will likely be disrupted with an ant=
icipated shutdown date of October 31st, 2024.</span></p><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:16pt"><span style=3D=
"font-size:15pt;font-family:Arial,sans-serif;color:rgb(102,102,102);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">Potential Imp=
act</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">The potential consequence of this shutdown may mean availability o=
f OSSTest will be impacted, therefore affecting the number of bugs being ca=
ught. Contributors may experience quality issues with code, or face slower =
response times as our technical community spends more time resolving issues=
. We are aware of the critical nature of the services we provide and the si=
gnificant impact this downtime may have.</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:16pt"><span style=3D"font=
-size:15pt;font-family:Arial,sans-serif;color:rgb(102,102,102);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">Our Response</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
We are in constant communication with the colo facility provider, our IT co=
ntractors, and our Board Members to understand the scope of the problem and=
 the estimated time for resolution. Additionally, we are exploring alternat=
ive solutions to restore our services as quickly as possible. These measure=
s include:</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-weight:700;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;vertical-align:baseline">Engaging with the Colo Facility Provide=
r (Synoptek): </span><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">We are working with the provider to negotiate costs and the=
 likelihood of us moving to another facility as this was an unforeseen chan=
ge.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-weight:700;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">Engaging with third parties:</span><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline"> We have i=
nitiated discussions with our IT contractors and third-party providers to f=
ind potential alternatives, including other location facilities and donatio=
ns of funds to support this move.=C2=A0</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:700;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Options w=
e are considering:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">Move our current hardware to a different co-location.=C2=A0</=
span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr=
" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>This could be another provider, a member of the Advisory Board, a Universi=
ty, or a similar organization that offers services for Open Source projects=
.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline">This could include moving all the infrastru=
cture, or just part of it, depending on costs and space available at the de=
stination.</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">Abandon our hardware, and eithe=
r re-create OSSTest from scratch at a different location or switch to a dif=
ferent test system (Gitlab CI).</span></p></li></ul><br><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:t=
ransparent;font-weight:700;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">All opti=
ons have risks associated.</span></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:16pt"><span style=3D"font-size:15pt;fon=
t-family:Arial,sans-serif;color:rgb(102,102,102);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-=
alternates:normal;vertical-align:baseline">Further Considerations:</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Mov=
ing the current hardware is expensive, even to a location provided for free=
.=C2=A0 It is unknown whether our hardware will survive the move, or if we =
will be able to recreate the setup at the new location. Furthermore, our cu=
rrent IT contractors who help us manage the facility can only serve the Bos=
ton area which means we will need to factor this in when choosing a new loc=
ation.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">Our technical leadership team has considered abandoning our=
 infrastructure and creating a new OSSTest instance, however, as it involve=
s acquiring new hardware there is no guarantee we will be able to set up th=
e new instance successfully.</span></p><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alter=
nates:normal;vertical-align:baseline">An option to mitigate this risk could=
 be to deploy on a metal-as-a-service provider, but that would require chan=
ges to OSSTest.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">As a last resort, abandoning OSSTest has been disc=
ussed.=C2=A0 The project has no replacement for a test coverage similar to =
what OSSTest provides.=C2=A0 Even if Gitlab CI expanded test coverage simil=
ar to what OSSTest currently covers, some features are unlikely to be repli=
cated: automatic bisections on regressions and testing of external projects=
 (Linux kernel, QEMU, OVMF=E2=80=A6).</span></p><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:16pt"><span style=3D"font-si=
ze:15pt;font-family:Arial,sans-serif;color:rgb(102,102,102);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">Input from the commun=
ity</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">While we work on identifying different options, there are a few st=
eps you can take to stay informed.</span></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Stay Updated: <=
/span><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>Keep an eye on our official communication channels for real-time updates a=
nd information about the status of our services.</span></p><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:700;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
Get involved: </span><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">We appreciate you may have feedback and questions, which is=
 why you are welcome to join the next monthly community call (Thursday 11th=
 July 2024) to provide your input.</span></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Assistance:</sp=
an><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline"> W=
e welcome members of our community to provide resources or suggest ideas th=
at may help our project.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:16pt"><span style=3D"font-size:15pt=
;font-family:Arial,sans-serif;color:rgb(102,102,102);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Looking Ahead</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Our goal =
is to identify and implement measures that will minimize the impact on our =
project. We will carefully consider the feasibility of solutions, budget co=
nstraints, and the long-term needs of the Xen Project.</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">We apologiz=
e for the inconvenience caused by this unexpected announcement and apprecia=
te your understanding and patience as we navigate this challenging situatio=
n. Your trust and continued support are invaluable to us, and we remain com=
mitted to developing a powerful and reliable open-source hypervisor.</span>=
</p><br></span><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div><span id=3D"gmail-docs-interna=
l-guid-c80edd15-7fff-eed5-f9a1-de3da802e70c"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline">Sincerely,</span></p><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Kelly=C2=A0Choi=
</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line"><br></span></p></span></div><div><div style=3D"color:rgb(136,136,136)=
">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div></div>

--000000000000975796061ce2d510--

