Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A2B45D97
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 18:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112123.1460538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuZ2s-00024S-Eh; Fri, 05 Sep 2025 16:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112123.1460538; Fri, 05 Sep 2025 16:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuZ2s-00021k-Bs; Fri, 05 Sep 2025 16:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1112123;
 Fri, 05 Sep 2025 16:12:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uuZ2r-00021e-0L
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 16:12:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uuZ2q-0081Om-1Q
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 16:12:12 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uuZ2q-00HCbg-1y
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 16:12:12 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-544ad727e87so1834916e0c.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 09:12:12 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=DI5JWH5qM1LPNZ0VXiqV4VaX9KCnlMFHYnnAJNngHHU=; b=JAngV4S
	eMLQP28imoaKyrS8815may6kgEKufkIqH+RMD6vmcRSXYM1iJlc7RggCi8V86yyGp1TttgL+Y9nlS
	4NCe4sp3d5QXwuy/mBJ7Z2BA3zs1IA0STSW9fbTyUQ3Hr24X6Pz6DrSteCKidkNqMIivDtNoI8DAX
	vDJVOPxANw=;
X-Gm-Message-State: AOJu0Yxmzg7fxWcODI9go5DfQac9WihkVYbsJM02H8zKr+frOCp1QKt8
	lh5D+GWSqK5X3ilhQ1q0Snh1cVtaREvHGywJO880Ip/l+DP9RDn0lt/j0S4qCOUko9sDkJ1wagG
	bjm5z7C46Wz7qLMhoZmrz41BT+pIGFs0=
X-Google-Smtp-Source: AGHT+IGyxo9LHvXQSpSuAIBx6nQiCl/ewyYMuSdjJ26/fkJQfWMZOTO61RcFN1QOPfxKRDX9CdSPwiTaMKQjDux1Yig=
X-Received: by 2002:a05:6122:4f82:b0:531:236f:1283 with SMTP id
 71dfb90a1353d-544a024826cmr8562956e0c.10.1757088732182; Fri, 05 Sep 2025
 09:12:12 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Fri, 5 Sep 2025 18:12:00 +0200
X-Gmail-Original-Message-ID: <CAJbE=KxuKM32Hq_6uXnc-tYATN2b9vEBXpBc3C5nwQJ4khPL=A@mail.gmail.com>
X-Gm-Features: Ac12FXyB3PnexJ6si2VCYqOGyRD-BYzwcUAHS7mSMdygDGE4XfxRqK4JNtkfQ-o
Message-ID: <CAJbE=KxuKM32Hq_6uXnc-tYATN2b9vEBXpBc3C5nwQJ4khPL=A@mail.gmail.com>
Subject: [REMINDER] Avoid automatic warning banners in xen-devel emails
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b8809d063e101905"

--000000000000b8809d063e101905
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Emails to this list *should not include* automatic warning banners like:

WARNING: This message originated outside of [Company Name]=E2=80=A6


We understand these are added automatically by some corporate systems and
aren=E2=80=99t the sender=E2=80=99s intention. However, since *messages are=
 publicly
archived*, these warnings are inaccurate and can be distracting or
misleading. They also clutter replies and make threads harder to follow.

If possible, we encourage contributors to:

   - Request an exception for FOSS mailing lists,
   - Use a company-provided developer address (if available),
   - Or send from a personal address that avoids these banners.


You can find more community guidance here:

   - https://subspace.kernel.org/etiquette.html
   - https://wiki.xenproject.org/wiki/Xen_Users_Netiquette


Thanks everyone for helping keep our discussions clean, readable, and for
being a member of the community!

Best regards,


Cody Zuschlag
Xen Project - Community Manager

--000000000000b8809d063e101905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br>Emails to this list <b>sho=
uld not include</b> automatic warning banners like:<br><br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">WARNING: This message originated outside =
of [Company Name]=E2=80=A6</blockquote><br>We understand these are added au=
tomatically by some corporate systems and aren=E2=80=99t the sender=E2=80=
=99s intention. However, since <b>messages are publicly archived</b>, these=
 warnings are inaccurate and can be distracting or misleading. They also cl=
utter replies and make threads harder to follow.<br><br>If possible, we enc=
ourage contributors to:<br><ul><li>Request an exception for FOSS mailing li=
sts,</li><li>Use a company-provided developer address (if available),</li><=
li>Or send from a personal address that avoids these banners.</li></ul><br>=
You can find more community guidance here:<br><ul><li><a href=3D"https://su=
bspace.kernel.org/etiquette.html">https://subspace.kernel.org/etiquette.htm=
l</a></li><li><a href=3D"https://wiki.xenproject.org/wiki/Xen_Users_Netique=
tte">https://wiki.xenproject.org/wiki/Xen_Users_Netiquette</a></li></ul><br=
>Thanks everyone for helping keep our discussions clean, readable, and for =
being a member of the community!<br><br>Best regards,</div><div><br></div><=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature"><div dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-=
sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oB=
OqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Project - Community Man=
ager</div></div></div></div></div>

--000000000000b8809d063e101905--

