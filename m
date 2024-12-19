Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534B9F8331
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 19:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861464.1273412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOLBi-0002HN-4p; Thu, 19 Dec 2024 18:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861464.1273412; Thu, 19 Dec 2024 18:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOLBi-0002F7-1J; Thu, 19 Dec 2024 18:23:54 +0000
Received: by outflank-mailman (input) for mailman id 861464;
 Thu, 19 Dec 2024 18:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOLBg-0002F1-RZ
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 18:23:52 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ba395a-be36-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 19:23:52 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 19:23:51 +0100
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
X-Inumbo-ID: 65ba395a-be36-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734632632; x=1766168632;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=0MMCRQQgQP0hcUZdIoSvKURLWTborcRPf60ZUkozNo4=;
  b=RaqRRgWMSbXa/Z7vMZgkkzcu0D6Fh96PTfrqumyCPThVkfLHMAoTLUEv
   5WRz5L5jZvLtu0aWaiYZbAb6F5I6a2an+Qs5OPHJP2TeRhKoAaQJirfQu
   FH7bPK2L0aVTT7ht+r/KdLJ24etg+eZkysp1eH5SPDm32MsFTDvUsB4hR
   o=;
X-CSE-ConnectionGUID: Qrt+G3QqTWe3Bg/aDeuLdg==
X-CSE-MsgGUID: dEr/JcmFRwm6jI5f44ETEQ==
X-IronPort-AV: E=Sophos;i="6.12,248,1728943200"; 
   d="scan'208";a="28260046"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <20241219181352.709315-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241219181352.709315-1-Ariel.Otilibili-Anieli@eurecom.fr> <20241219181352.709315-2-Ariel.Otilibili-Anieli@eurecom.fr>
Date: Thu, 19 Dec 2024 19:23:51 +0100
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Luca Fancellu" <luca.fancellu@arm.com>
To: "Ariel Otilibili" <Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Message-ID: <2f7a83-67646480-a2b5-5cf12280@53972861>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/1] =?utf-8?q?xen/scripts=3A?= Fix regex syntax 
 warnings with Python =?utf-8?q?3=2E12?=
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

CCing Luca Fancellu.

On Thursday, December 19, 2024 19:10 CET, Ariel Otilibili <Ariel.Otilib=
ili-Anieli@eurecom.fr> wrote:

> Same fix than commit 826a9eb072 (tools: Fix regex syntax warnings wit=
h Python 3.12).
>=20
> It clears out the warning:
>=20
> ```
> $ xen/scripts/xen-analysis.py
> xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py:94: SyntaxWarning: =
invalid escape sequence '\*'
>   comment=5Fline=5Fstarts =3D re.match('^[ \t]*/\*.*$', line)
> ```
>=20
> The  warning appears only the first time the command is run, then it =
disappears.
>=20
> Fixes: 02b26c02c7 (xen/scripts: add cppcheck tool to the xen-analysis=
.py script)
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> --
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py b/xen/=
scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py
> index ce7bda91b6..532a14b0ad 100644
> --- a/xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py
> +++ b/xen/scripts/xen=5Fanalysis/cppcheck=5Fanalysis.py
> @@ -91,7 +91,7 @@ def =5F=5Fgenerate=5Fsuppression=5Flist(out=5Ffile)=
:
>                          line =3D header=5Fcontent[tmp=5Fline]
>                          # Matches a line with just optional spaces/t=
abs and the
>                          # start of a comment '/*'
> -                        comment=5Fline=5Fstarts =3D re.match('^[ \t]=
*/\*.*$', line)
> +                        comment=5Fline=5Fstarts =3D re.match(r'^[ \t=
]*/\*.*$', line)
>                          # Matches a line with text and the end of a =
comment '*/'
>                          comment=5Fline=5Fstops =3D re.match(r'^.*\*/=
$', line)
>                          if (not comment=5Fsection) and comment=5Flin=
e=5Fstarts:
> --=20
> 2.47.1
>


