Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C087661A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 15:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690319.1076221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riaz2-000421-Iw; Fri, 08 Mar 2024 14:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690319.1076221; Fri, 08 Mar 2024 14:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riaz2-0003ze-EN; Fri, 08 Mar 2024 14:14:00 +0000
Received: by outflank-mailman (input) for mailman id 690319;
 Fri, 08 Mar 2024 14:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0woU=KO=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1riaz1-0003xm-0L
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 14:13:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0b060b-dd56-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 15:13:57 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso2285340a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 06:13:57 -0800 (PST)
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
X-Inumbo-ID: 1a0b060b-dd56-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709907236; x=1710512036; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=05gSGMW5+/FEQxjOa7nPRDuwgAU8PNa0oI5umgHVvaA=;
        b=CrLst/0T1JJAZNX+G0YQrM2kdUzcSU8c8Yqpj44Pi7/bU3JtdlOT+X06ALcySNCU5G
         zSHGsCYq+JVuGH+9PflJ3qKLZ7b1Eg9j+NbQehk7ILDiFYhlxVa3nUtOwW86tua04pet
         nrIabGAqrV8YyoPxZzPv2WJACiPeP1/O4Lf5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709907236; x=1710512036;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05gSGMW5+/FEQxjOa7nPRDuwgAU8PNa0oI5umgHVvaA=;
        b=h3SjZu2ghDT30vzX/AkEWLvwg1QgPa+pg5aOgqs+QFnkz1tpss2IYeC+hIP2z+jQyD
         INJ7dfH0DoiCPAGgBZNJUee0j20jr+/JzGXbEVm07TJCnFUCMtDjONMAitI9itZz1ETl
         GMS6nkxVLMB/J1GXGaeQmNUdpttiv1JXH8N3QwJW4CmWqADjwQPnnxxxIdma0WOweQAf
         0jKr7/DIEok+VUL1y7wJYEQKjdj0V4bu0+fdUP6WDSW6qjzjrOOeLN9aip5i4JkvqG4A
         hH68D22xGflOGuakcEGJyoAZwxQfpDFSVZUwsd2g2heBWWY25zYYsHgbDhsBKWSbr4y0
         HAPw==
X-Gm-Message-State: AOJu0YxKJQwFZSZNxnp7QLBDutQ1ZcNd60xzDoGzVRX3rddqrThrYpeF
	2FoRAAocC3KXwqVZOiVIyi78CowqEmWE8CRtDahCBcZF6wW9+4YUsv1xVmZ07A2I2CnDCQisvvZ
	fw3r1LyRQrKnabt42fvwe1jqKSRoMZXqxetCKyQDIL0fyS46UN+s=
X-Google-Smtp-Source: AGHT+IFBZuMIBZ2JDLXUCEPXwGPzLtMtOZWsXrT95Ig+kYeC0Q+w7SyoMmtxdcLVeuCUxB+/7YpxqRSXoCkcdqWV3Xc=
X-Received: by 2002:a50:c314:0:b0:565:7116:d533 with SMTP id
 a20-20020a50c314000000b005657116d533mr2304117edb.6.1709907235980; Fri, 08 Mar
 2024 06:13:55 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 8 Mar 2024 14:13:19 +0000
Message-ID: <CAO-mL=x=boq41C8zzdaEdyJAUxpNSiDaUFP8k9xxeFKOHo-BGQ@mail.gmail.com>
Subject: March - Community call recording
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000666aba061326cd4b"

--000000000000666aba061326cd4b
Content-Type: text/plain; charset="UTF-8"

Hi all,

The March community call recording has been uploaded:
https://youtu.be/IBKUEy5ZSrQ
This has also been saved in the Cryptpad file.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000666aba061326cd4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>The March community call record=
ing has been uploaded:=C2=A0<a href=3D"https://youtu.be/IBKUEy5ZSrQ">https:=
//youtu.be/IBKUEy5ZSrQ</a><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>T=
his has also been saved in the Cryptpad file.</div><div><br></div><div>Many=
 thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:=
rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,13=
6)">Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--000000000000666aba061326cd4b--

