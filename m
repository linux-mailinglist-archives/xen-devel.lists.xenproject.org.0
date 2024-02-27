Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836C868D6F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 11:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685947.1067437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reucC-0001xh-QU; Tue, 27 Feb 2024 10:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685947.1067437; Tue, 27 Feb 2024 10:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reucC-0001vD-NB; Tue, 27 Feb 2024 10:23:12 +0000
Received: by outflank-mailman (input) for mailman id 685947;
 Tue, 27 Feb 2024 10:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avpg=KE=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1reucA-0001uu-Jj
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 10:23:10 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c0813c-d55a-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 11:23:08 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so4109817a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 02:23:08 -0800 (PST)
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
X-Inumbo-ID: 33c0813c-d55a-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709029388; x=1709634188; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gs1bJQGyFtyT9dDiE+4oMh1B/DXPh7iVC2jtxolcNZ4=;
        b=QsMHoHotgYd2z+6mA6sRWFdqtXlNFehMroNdXlKiYkuHYTrNq1QAA3EOPYtpkdkQdR
         OpQV6NlGZI3BcMgrYiDffQGhYWLhJPTaesR6xI6zf7vDDD6yuycktNBvxRvpcEOKDTtp
         unm6kA+dkVVrBNsh17Rn2evC/jSfD0vMIydUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709029388; x=1709634188;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gs1bJQGyFtyT9dDiE+4oMh1B/DXPh7iVC2jtxolcNZ4=;
        b=GopuQuGxnJnssjtRibdBhO9KTyp/cF5lmwVDkTep99l9J4CJeg0XfrIqjKQFrNoiuc
         EMwsmVaxpl/vSf+U893iRVUO32e/uGMZI8DbWQwGp7ojyabGCj6uJJZCP3S13WoL/LMg
         bbH6sIfJPij5dUUsgfX3wuE6JIYFEaxwdL1g54GA5DwPCsCZVXTVFOpdqgdS7RqVisuS
         2N5T8Vzmk4hYwx8h1fnhVNFwU/fRnV84O1fqU0lVbA4B39xnRvo0izzBL+ikmxUFU/T5
         Dpr+7IsCVspAu6HJfwFVwpfqUdeP7Oj8n6QQ2qm2jLkxbByYhDsZBUkzigTQxxVvkQWY
         XF3g==
X-Gm-Message-State: AOJu0YxoCugl1yxAi/ivhJ8tmYb0qQvBjIdyGUETH9zRSeA0GMz9dq74
	YeeD/5FCGnOwftIYmaNOXUbrWMZgW/Kao9h/c7rCuzeZnP5BM8cg4U1ZMelPyRgvsG9aOyCo42G
	nBOLTjPHSbl09xYMave0ZkWW2J7Mmj6Rn8KKfZPKhXXFAPhZF+/k=
X-Google-Smtp-Source: AGHT+IECtribn+1k2KDdX1D+PWMwwsLUXlAjrwvib0bNLfuDzqO1SZmdodQ7GhZY2sp0Rm+V3USV/AmPs3PuXHhA3pE=
X-Received: by 2002:a05:6402:530c:b0:561:3b53:d0af with SMTP id
 eo12-20020a056402530c00b005613b53d0afmr8766028edb.12.1709029387829; Tue, 27
 Feb 2024 02:23:07 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 27 Feb 2024 10:22:31 +0000
Message-ID: <CAO-mL=zCVa+bbp3ft9GrnaJ0nVHa-9NbjJP_0uR7c4xGjAkn=A@mail.gmail.com>
Subject: XEN SUMMIT CFP DEADLINE - END OF THIS WEEK!
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000092a4ac06125a6928"

--00000000000092a4ac06125a6928
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

*Just a reminder that our CFP for Xen Summit 2024 is at the end of this
week! *

Please submit your talks before then:
https://events.linuxfoundation.org/xen-project-summit/program/cfp/

We look forward to seeing you.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000092a4ac06125a6928
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div><b><font color=3D"#ff0000"=
>Just a reminder that our CFP for Xen Summit 2024 is at the end of this wee=
k!=C2=A0</font></b></div><div><b><font color=3D"#ff0000"><br></font></b></d=
iv><div>Please submit your talks before then:</div><div><a href=3D"https://=
events.linuxfoundation.org/xen-project-summit/program/cfp/">https://events.=
linuxfoundation.org/xen-project-summit/program/cfp/</a><br></div><div><br><=
/div><div>We look=C2=A0forward to seeing you.</div><div><br></div><div><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br><=
/div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><div=
 style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></=
div></div></div></div>

--00000000000092a4ac06125a6928--

