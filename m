Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB190D639
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 16:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743164.1150066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaEx-0000U9-MS; Tue, 18 Jun 2024 14:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743164.1150066; Tue, 18 Jun 2024 14:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaEx-0000SB-JF; Tue, 18 Jun 2024 14:55:19 +0000
Received: by outflank-mailman (input) for mailman id 743164;
 Tue, 18 Jun 2024 14:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14Hy=NU=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sJaEv-0000S0-VV
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 14:55:18 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c572b778-2d82-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 16:55:15 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cdbso38630031fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 07:55:15 -0700 (PDT)
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
X-Inumbo-ID: c572b778-2d82-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718722515; x=1719327315; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcypt+L8Iba4SmY3eU311zAlxCRR2frtdOHy8LxL6r8=;
        b=Ajh4NxOAPbAsLPrtaoxWhusAiMplyqy+Im3lrDs1LEHuMHMsRfZK9R9YHRDSsrxakl
         Hr0YnSO1W8gXoqjiSWNzCWJsr66hVZJiCGnuNMki3vJHgU4UEliYM3+r1Q3Ed5WsJSt0
         Q7CTEZSYazaS6pfLcCgO8G+YhN50GUnyaUXFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722515; x=1719327315;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcypt+L8Iba4SmY3eU311zAlxCRR2frtdOHy8LxL6r8=;
        b=IwxJqztBTiBOXnktnwLiZAx4Xxb5E7NHwlDDX/vx+bkeIv7LTnfCvsXUEuNETMUJsw
         vbXAu2xLzoDaVGY7BTnDgpa5RfeWGqLY25pJ9yi6kicYNu+9Nw2PwD3B4XcA7R6h0YwX
         tk9mrbpMFaUP8vYzmlk4o3kJn28DBR3V+MvHtV2o58YkL12TPy83jKvS4Zr2dBtZiwro
         zuN9WqP/Ft9xJLi6Z9G83DW5nt/g2SE987ox0Zxr6eoacBr53dpDlu84YKT7K/DBCWal
         ZE1o9cuF8rZO+3I1oiVvTFHX9lccjJxYBhJUmY/VhHkozG0t0VeF9RKGlZad4d/TwLtR
         OEhw==
X-Gm-Message-State: AOJu0YwZP1iavI9zTCZ/3rKJtwcczwXkjJwAELPvHLGlhLK+905mdqIG
	ZjMtIKKke6N/EmeRTuUwquMp/u7AiEdhcUp0NAgFJSMukoTIlfft1q9rp0FQt3++K+nWG4DeCgA
	jR4zdvoTHcf4sZjVpfeqDTgb+4z3giKwNiHptb9z/ezbV0P1D
X-Google-Smtp-Source: AGHT+IGzopj7oemB//TivOoZF912xlaDY5ennoTWHjo8YTk+Kka4rMdhBBsC+IlVCBuJTxnLLYPNcZn3tJ2JSkXVl6o=
X-Received: by 2002:a2e:b0d5:0:b0:2eb:f31e:9e7b with SMTP id
 38308e7fff4ca-2ec3ceb7cdfmr678021fa.14.1718722514254; Tue, 18 Jun 2024
 07:55:14 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 18 Jun 2024 15:54:38 +0100
Message-ID: <CAO-mL=wNrPZOBmbEHRg2y=LA0G0Ge-+pnfF65pn3qXKGMdwdGg@mail.gmail.com>
Subject: Community call recording - June 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ee18c7061b2b4497"

--000000000000ee18c7061b2b4497
Content-Type: text/plain; charset="UTF-8"

Hi all,

The June community call recording has been uploaded:
https://youtu.be/cJyX6FLK4iU

This has also been saved in the Cryptpad file.
https://cryptpad.fr/pad/#/2/pad/view/bFelqwYToFejOhnu1bInhJ7sJwPGqW55gOpWx+VJ0GU/

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000ee18c7061b2b4497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<div><br></div><div>The June community=C2=A0ca=
ll=C2=A0<span>recording</span>=C2=A0has been uploaded:<br><a href=3D"https:=
//youtu.be/cJyX6FLK4iU" target=3D"_blank">https://youtu.be/cJyX6FLK4iU</a>=
=C2=A0<br></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>This has also been saved in the Cryptpad =
file.</div><div><a href=3D"https://cryptpad.fr/pad/#/2/pad/view/bFelqwYToFe=
jOhnu1bInhJ7sJwPGqW55gOpWx+VJ0GU/" target=3D"_blank">https://cryptpad.fr/pa=
d/#/2/pad/view/bFelqwYToFejOhnu1bInhJ7sJwPGqW55gOpWx+VJ0GU/</a><br></div><d=
iv><br></div></div></div></div></div><div><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many tha=
nks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(=
136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">=
Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--000000000000ee18c7061b2b4497--

