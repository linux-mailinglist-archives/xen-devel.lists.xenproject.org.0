Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0919E0950
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846879.1262034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9oR-0007ZN-Hh; Mon, 02 Dec 2024 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846879.1262034; Mon, 02 Dec 2024 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9oR-0007XZ-DQ; Mon, 02 Dec 2024 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 846879;
 Mon, 02 Dec 2024 17:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrSh=S3=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tI9oP-0006xH-Cu
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 17:02:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e553771-b0cf-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 18:02:15 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa51bf95ce1so76277866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 09:02:15 -0800 (PST)
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
X-Inumbo-ID: 2e553771-b0cf-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733158935; x=1733763735; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yvUO+Cob+4BPHSlSnE+x5pEdUSplc0l78jq4eGwEYSw=;
        b=HxFNXmgHfqVZ/5XOIvZj32pVqMnNP0DyPFSrJu6yvwGxFZ14MKl6NxVnUEV8C3ZqEk
         ecxkUOPYA/DxXOx+CJosBuZBKGsh1xCTpCEXF1u1snMcp+Vnwp7loRMLMfHs4Az55J8o
         3kCkr0n/QwT6Is98wOb1mTPZTDWnoHTTNy0I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158935; x=1733763735;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvUO+Cob+4BPHSlSnE+x5pEdUSplc0l78jq4eGwEYSw=;
        b=qeCyKg04Z8jA6MOG1PODwb5hBYsqqmnuJXeB/s2SB28clZalh45mvE6Vw91Dc9a0B4
         PMSHwdQUKuwOkJD4IBHtDplKfmJ20kB5Hc3UBD6PAb+quFThRSlDF5xHF8TxR8G7nHie
         UFzX4GGDJDMpkqjb8rDox+cAwy28/BulrpHH4W66D3OQFXv5BqxjMKFAFsMqDqZSAyjI
         kCZDssrP6Ja4o0rwVkei1G+t2chals256wo2iLmgYB7ny65c3U9PyBggRAuXS53VHjcG
         NMvmi6gxqhhWI6c6kRynYUwoZIzNEw3wsvA+lbzNWeJHgyV6BQCJTCeC6njoNpAExLc0
         vr2g==
X-Forwarded-Encrypted: i=1; AJvYcCVh1JvUeHKNp2/B6Ln/pIEQwv7AmS98+udO8IKGT/mBj8indcd74se0kxDI951w9r86iic4/kyMGF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhXeLpXuHcwWhIPywOjQCsYxjuwoSVQE3l5URiRxZInHzbw53h
	NsoBYvfX22XHb3QhT5zn2cTUI2hRoiwuyCW7mEvj/PXEUQr2GAT8Vknqqbxrl/dXp6b7S3qNDNh
	+5HIrhGYd5eNSH3PL+xvkCBnsUEwHcmrrLXeh3g==
X-Gm-Gg: ASbGncu8DjMUwSIBSWc8MfazNkvL2q6movQt/SoSkCUjfzV+1+cthyp6Ow8ZKB3iuOV
	QDQjbq4gml7LXC32Og0/LzuqmzBB2wG3DK0fwIMFwxcz+lUSsaaNT2LRazLb8+ZPSBw==
X-Google-Smtp-Source: AGHT+IGA/yyMxVuh1zjvfEZctTTbU1UJeWezawIMrQd4uH37xw0bXd5kJbfbI4cQk1fMeBFilqXjf11v4Wyjzl82CCQ=
X-Received: by 2002:a17:906:1bb2:b0:aa2:c73:3720 with SMTP id
 a640c23a62f3a-aa58107846bmr2358157166b.58.1733158933157; Mon, 02 Dec 2024
 09:02:13 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 2 Dec 2024 17:01:37 +0000
Message-ID: <CAO-mL=zyghadT2Fvmck9r5+V7URnm6EXnPUFUX9Tq-mxNsXwiw@mail.gmail.com>
Subject: New Xen Project Website
To: Xen Project Advisory Board <advisory-board@lists.xenproject.org>, xen-announce@lists.xenproject.org, 
	xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000008cffb706284c82ef"

--0000000000008cffb706284c82ef
Content-Type: text/plain; charset="UTF-8"

Hello Xen Community,

For the past 12 months, I have been working with our web developer and UX
designer on creating and refreshing our project website. I'm excited to
share that this is now live!
The URL remains the same and you can view this at *https://xenproject.org/
<https://xenproject.org/> *

These new changes are part of an ongoing effort to increase our visibility
and make it easier to find information on pages.

Our documentation will still link to our old wiki for now, as this is where
most of our guides are stored. However, you might remember we are in the
process of moving to Sphinx so we will eventually update the website once
we have more content created. We welcome community members to contribute to
this!

I'd also like to thank our existing board members, whose financial
investment in the Xen Project allows for these changes.

If you do have any feedback or notice errors, please feel free to reach out.

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--0000000000008cffb706284c82ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Xen Community,</div><div><br></div><div>For the=
 past 12 months, I have been working with our web developer and UX designer=
 on creating and refreshing our project website. I&#39;m excited=C2=A0to sh=
are that this=C2=A0is now live!</div><div>The URL remains the same and you =
can view this at=C2=A0<b><a href=3D"https://xenproject.org/">https://xenpro=
ject.org/</a>=C2=A0</b></div><div><br></div><div>These new changes are part=
 of an ongoing effort to increase our visibility and make it easier to find=
 information on pages.=C2=A0</div><div><br></div><div>Our documentation wil=
l still link to our old wiki for now, as this is where most of our guides a=
re stored. However, you might remember we are in the process of moving to S=
phinx so we will eventually update the website once we have more content cr=
eated. We welcome community members to contribute to this!</div><div><br></=
div><div>I&#39;d also like to thank our existing board members, whose finan=
cial investment in the Xen Project allows for these changes.</div><div><br>=
</div><div>If you do have any feedback or notice errors,=C2=A0please feel f=
ree to reach out.</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,=
</div><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">C=
ommunity Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"http=
s://xenproject.org/" target=3D"_blank">Xen Project</a><br></div></div></div=
></div></div></div>

--0000000000008cffb706284c82ef--

