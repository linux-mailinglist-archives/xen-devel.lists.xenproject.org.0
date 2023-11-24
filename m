Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2897F722D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640540.998916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TtM-0003iN-R3; Fri, 24 Nov 2023 10:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640540.998916; Fri, 24 Nov 2023 10:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TtM-0003fJ-O1; Fri, 24 Nov 2023 10:58:36 +0000
Received: by outflank-mailman (input) for mailman id 640540;
 Fri, 24 Nov 2023 10:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/5s=HF=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r6TtL-0003fD-K6
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:58:35 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68fd07c5-8ab8-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:58:33 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso2370227a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:58:33 -0800 (PST)
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
X-Inumbo-ID: 68fd07c5-8ab8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700823513; x=1701428313; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uGxzhhzcV2AnLXQn4nRO8YQ3eq+h+RCV5dmH/oRmM9k=;
        b=R4E9CBnlF0B5XWherKrbvlmzn7KmXcu+TtR/IkixgLdMiDdx1lHMBVBg8jp2JONVf7
         PVl3cgIbMl7LfY8m3WP6GQSQb8C1tT3xfyry6lj12J6QgNEOdNY6QaykWJrA/oYFmOMQ
         bDTzKXGQ4hZOdKL3mj3FfpO2A2s0rnx5DjzG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700823513; x=1701428313;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGxzhhzcV2AnLXQn4nRO8YQ3eq+h+RCV5dmH/oRmM9k=;
        b=I+i6gw+Cu76Gwz8tGJ1ap3p5AKTFd7nDcYqs6YNkv6k9awUytA9CtlRX08utA8RtPi
         f7Or0s3NDstb5ouNLs8u7eOtbKtj73LXDGN8b8O0p1bgklCPugKqv4qwmqas4mNkcuEu
         Nc1ElfRLZ+YbRlLY/LD5D5mwjMY4bPoU/I5+MR038AdGXC9RIiwMpcyhH8dxFsxRdrpU
         KzNCZiOFDnQ/piPv4Ixua+qlgNIqE8EiO8A9nwCQRhF6ucJO9U2tdO6/UZkiwNYjy4UX
         zB1zQOMzkc6Hslwe+gj9WLeV2Aa52kQFAuMv0lBvOSQ0x35kfM2JoIfodc8UBTpjHY7v
         /GVg==
X-Gm-Message-State: AOJu0Yx7+q5JwcIhofDBmU3g7W+TaIMByqFTmo1YJTWT8hwMx9yzsALv
	fy1Vw3EEguwTPic4yq6ID8v1HqosRHUiTbyorTAssSq5LiVjqCk3TBIhDQ==
X-Google-Smtp-Source: AGHT+IHXbUMLvTuYV9RU7WntsXQoq3sF39zhVYZ+pekc07n0a7Qqn+6oRBk1fNnYIDWar3LnkARx5chnZpFTxbfQt70=
X-Received: by 2002:a17:906:3a87:b0:a03:24d9:12ce with SMTP id
 y7-20020a1709063a8700b00a0324d912cemr1782860ejd.63.1700823512752; Fri, 24 Nov
 2023 02:58:32 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 24 Nov 2023 10:57:56 +0000
Message-ID: <CAO-mL=ySni-hUqNjm8c7FMK2RRdGJ8WHqPDBLjXaXhjUBVx68g@mail.gmail.com>
Subject: Governance PR
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004dc168060ae3d513"

--0000000000004dc168060ae3d513
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please see an updated Governance PR on GitLab here:
https://gitlab.com/xen-project/governance/governance/-/merge_requests/1

Comments:

Revise code of conduct for enhanced clarity, inclusivity, and accountability

In response to valuable feedback from community members and in alignment
with our ongoing commitment to creating a safe and welcoming space for
collaboration, this commit refines the code of conduct. The changes focus
on:

   - *Clarity:* Rewording sections to eliminate ambiguity and ensure that
   expectations are clearly communicated.
   - *Inclusivity:* Adding language to emphasize our dedication to
   diversity and inclusion, and providing examples to illustrate the types of
   behavior we encourage.

These updates aim to foster a more positive and collaborative atmosphere
within our community. Please review the changes and don't hesitate to
provide further input or suggestions.

Note that the patches should be read as a whole; I'm still learning git and
using the gitlab UI, which doesn't have a way to do history editing.
Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--0000000000004dc168060ae3d513
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>Please see an updated Gov=
ernance PR on GitLab here:</div><div><a href=3D"https://gitlab.com/xen-proj=
ect/governance/governance/-/merge_requests/1">https://gitlab.com/xen-projec=
t/governance/governance/-/merge_requests/1</a>=C2=A0<br></div><div><p>Comme=
nts:</p><p dir=3D"auto">Revise code of conduct for enhanced clarity, inclus=
ivity, and accountability</p>
<p dir=3D"auto">In response to valuable feedback from community members and=
 in alignment with our ongoing commitment to creating a safe and welcoming =
space for collaboration, this commit refines the code of conduct. The chang=
es focus on:</p>
<ul dir=3D"auto">
<li>
<strong>Clarity:</strong> Rewording sections to eliminate ambiguity and ens=
ure that expectations are clearly communicated.</li>
<li>
<strong>Inclusivity:</strong> Adding language to emphasize our dedication t=
o diversity and inclusion, and providing examples to illustrate the types o=
f behavior we encourage.</li>
</ul>
<p dir=3D"auto">These updates aim to foster a more positive and collaborati=
ve atmosphere within our community. Please review the changes and don&#39;t=
 hesitate to provide further input or suggestions.</p>
<p dir=3D"auto">Note that the patches should be read as a whole; I&#39;m st=
ill learning git and using the gitlab UI, which doesn&#39;t have a way to d=
o history editing.</p></div><div><div><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,=
</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,=
136,136)">Open Source Community Manager</div><div style=3D"color:rgb(136,13=
6,136)">XenServer, Cloud Software Group</div></div></div></div></div></div>=
</div>

--0000000000004dc168060ae3d513--

