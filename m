Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024B486AEF8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 13:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686530.1068705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfItk-0007Vs-E0; Wed, 28 Feb 2024 12:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686530.1068705; Wed, 28 Feb 2024 12:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfItk-0007UC-B9; Wed, 28 Feb 2024 12:18:56 +0000
Received: by outflank-mailman (input) for mailman id 686530;
 Wed, 28 Feb 2024 12:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Epip=KF=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rfIti-0007TS-74
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 12:18:54 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f70205-d633-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 13:18:52 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3f4464c48dso649149566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 04:18:52 -0800 (PST)
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
X-Inumbo-ID: 88f70205-d633-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709122731; x=1709727531; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4taUMyx+sVUhovAipqeBrqCwHbuFWWOytz2rfh5lTew=;
        b=VTz4RXzPO7fKFvz2hBd9nWRLiEccSYxb9uivOdhKvs0Ba4vCTjGMAFhy1ayAo0A2IH
         LJMh03PBbTi0s+jGjTaLe7S/AeRAlFrvVD6ZJVfVpjMt4OfUEZF5NQlugxmzKsuqEY/3
         6ckWW0ePTnNvpn3HbHZcYrpBommx4J5veQVGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709122731; x=1709727531;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4taUMyx+sVUhovAipqeBrqCwHbuFWWOytz2rfh5lTew=;
        b=dm1C/JroBqN7c07de/d16mTb2+pvxzNKTKxBHJnfbQHTBdQBUrd3kIFiqTgJIsp/b3
         8Eft7mYAP2xeNbs0HxLl0+XdT3YEyU715ckMJCuOtuLDTw9egyUIO+rr7VGZR24VxyYi
         mCCs7GB/n6EiMmESZB+s76nv+toxpIk6pYZ2dEnqS6h3ZVbs/NCy27jkK417rrlKx5/N
         MolpYQxgDCwjbw7GXFUo1eaOPbmevLYDjtZcCTbrfUeR4oCZqTpySrOglOu/gf5fu/rb
         L+8mw1iFTAxIX/ZCc2yoo8eUTQ0269iwfeoUxAK6pOJLrAC0Gni2hhj4+DSo+lIBNgsW
         2kjg==
X-Gm-Message-State: AOJu0YyY7YAE6jq2o/Scc94B9nOzSiFU24nFT8e+qChaTcP83k+FK+G2
	KYMBKkjg4L2SivSZHpCdYmwtNROpNEI2ieenzFlMoTzNu4Prjn9wgRs3UT/yVqDURTvNPn4RXxQ
	eENhMy/AWQcaZIkXq7MWG16IEBK/I9G1R7sXLCn1jXnoxqbSI
X-Google-Smtp-Source: AGHT+IGDvjOVbM4/z/sUM5gtt+xtbdqOdtx9QNtkSKsbbDqHVDD0O7XabBJ5GUWocwKH8h72OAXEPK7rdf8neJkqfHQ=
X-Received: by 2002:a17:906:3683:b0:a3e:7f54:12c1 with SMTP id
 a3-20020a170906368300b00a3e7f5412c1mr9188021ejc.72.1709122731589; Wed, 28 Feb
 2024 04:18:51 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 28 Feb 2024 12:18:15 +0000
Message-ID: <CAO-mL=y60vBUtrWrYQeVpiR79MeMR8SkgAtt5MZdt9msNB+mXA@mail.gmail.com>
Subject: Xen Survey Results
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org, advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004b616a06127025e2"

--0000000000004b616a06127025e2
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Thank you for contributing your feedback to the recent survey.

A lot of you wrote detailed responses and gave specific feedback as to what
the community was doing well on, and what we could improve.

I've spent a significant amount of time collating these responses and would
like to present to you the results. I aim to run this annually to track our
community health, so I encourage you all to participate.

*VIEW SURVEY RESULTS HERE*
<https://cryptpad.fr/file/#/2/file/nvDsPv6i+ojtA7UKXiFm8i2R/>

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000004b616a06127025e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,=C2=A0<div><br></div><div>Thank you for contri=
buting your feedback to the recent survey.=C2=A0</div><div><br></div><div>A=
 lot of you wrote detailed responses and gave specific feedback as to what =
the community was doing well on, and what we could improve.=C2=A0</div><div=
><br></div><div>I&#39;ve spent a significant amount of time collating these=
 responses and=C2=A0would like to present to you the results. I aim to run =
this annually to track our community health, so I encourage you all to part=
icipate.=C2=A0</div><div><br></div><div><a href=3D"https://cryptpad.fr/file=
/#/2/file/nvDsPv6i+ojtA7UKXiFm8i2R/"><b>VIEW SURVEY RESULTS HERE</b></a></d=
iv><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><=
div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136=
)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div></div></div>

--0000000000004b616a06127025e2--

