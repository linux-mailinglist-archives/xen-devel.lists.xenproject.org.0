Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE1C9F4C19
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859144.1271289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXaW-0002GL-7X; Tue, 17 Dec 2024 13:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859144.1271289; Tue, 17 Dec 2024 13:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXaW-0002EN-4X; Tue, 17 Dec 2024 13:26:12 +0000
Received: by outflank-mailman (input) for mailman id 859144;
 Tue, 17 Dec 2024 13:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y98y=TK=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNXaV-0002EH-42
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:26:11 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a775f9f-bc7a-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 14:26:10 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 17 Dec 2024 14:26:09 +0100
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
X-Inumbo-ID: 7a775f9f-bc7a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734441970; x=1765977970;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=Njae+Vsl2XA1tfc//Ve7NVHONOq0L0Ei91adjZe8SbI=;
  b=k2Rav9JCeHPEOrJjKzxG2UOBNLPcnQOlWYyW5W8R3K3MJTxmTorePz1S
   Dkhv5Y0caOg7+mWfP7bfoO4F0D5AD19xkOJEkWTD7jIIRrwjLUGNU/PjV
   /adhByegYpYhtzWxWssmmgUqW54b98tV174sO7sS8HniSyC8h/L2UemYY
   k=;
X-CSE-ConnectionGUID: 4bbj8gOQS0aw8yPq5Idi+g==
X-CSE-MsgGUID: OnzP+206QKm1NpThvlUmvg==
X-IronPort-AV: E=Sophos;i="6.12,241,1728943200"; 
   d="scan'208";a="28218467"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <D7603E76-595B-4AD1-BF03-AC5EFD391E1B@arm.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr> <D7603E76-595B-4AD1-BF03-AC5EFD391E1B@arm.com>
Date: Tue, 17 Dec 2024 14:26:09 +0100
Cc: =?utf-8?q?xen-devel=40lists=2Exenproject=2Eorg?= <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>
To: "Luca Fancellu" <Luca.Fancellu@arm.com>
MIME-Version: 1.0
Message-ID: <2f7a88-67617c00-f1a5-208cdcc@55733305>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?tools=2C?=
 =?utf-8?q?_xen/scripts=3A?= clear out Python syntax warnings
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 17, 2024 09:31 CET, Luca Fancellu <Luca.Fancellu@a=
rm.com> wrote:

> Hi Ariel,
>=20
> > On 16 Dec 2024, at 23:07, Ariel Otilibili <Ariel.Otilibili-Anieli@e=
urecom.fr> wrote:
> >=20
> > * since 3.12 invalid escape sequences generate SyntaxWarning
> > * in the future, these invalid sequences will generate SyntaxError
> > * therefore changed syntax to raw string notation.
> >=20
> > Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-c=
hanges
> > Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> > Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new=
 commands in menuentry")
> > Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default e=
ntry in string format")
> > Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> > Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-anal=
ysis.py script")
> > Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppche=
ck version check")
> >=20
> > Cc: Anthony PERARD <anthony.perard@vates.tech>
> > Cc: Luca Fancellu <luca.fancellu@arm.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
>=20
> For the xen=5Fanalysis tool:
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Awesome, Luca; thanks for review.

I am looking forward a feedback on the other hunks.
Ariel
>=20
>


