Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BEC84DA34
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 07:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677991.1054974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXxy8-0007Kh-5q; Thu, 08 Feb 2024 06:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677991.1054974; Thu, 08 Feb 2024 06:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXxy8-0007J9-37; Thu, 08 Feb 2024 06:33:08 +0000
Received: by outflank-mailman (input) for mailman id 677991;
 Thu, 08 Feb 2024 06:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T15F=JR=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1rXxy6-0007J3-R8
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 06:33:06 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94f0fab-c64b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 07:33:03 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4103be6e938so1397235e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 22:33:03 -0800 (PST)
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
X-Inumbo-ID: e94f0fab-c64b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707373983; x=1707978783; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RfUmzfcC+F+NtcyZx7qulQ0OpdfLAcQzOcDyTiRj2YM=;
        b=JDTreakDaWdPxhnZAjWJDugTBjfYWyo5tst3xWGv8+LHVB2IDlrS55JMVUKxiPH+Hw
         ekYtipGl9BjIB0CoqeLMqwFgvBagVA2s2nvaOpPq3KgGyfIyvamyk0godAVSlVjwrZ5o
         Ts7Lyuuo64qOGB0VwpC7100iH56nI/1bNyQ02fc2f6xxbaMPuZdiADp6uTp6y4f3nMD9
         rscwZyn5WbRyKwUiqQyRLvT27sgti9PtKBY8J6cFOuQKxhBkEHi/lwzxXCBnKSZsZ0hA
         vot++vVun5puFXfJuhMfDBFHXI+/+QKipdsFFDYUsx9sns/FuocAAVsBRyuZjlHHwRZt
         QYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707373983; x=1707978783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfUmzfcC+F+NtcyZx7qulQ0OpdfLAcQzOcDyTiRj2YM=;
        b=eenJhOm2jFxadfqi4CbsqTgWVXoBJqIO4xBUtczgnyH7kaFU9FPZ/aiEcE8Ckev6H8
         0E6lHbnjDnauMC2SqV7ZUYZWR6iVFUXG0ykKHeuK5/TdLzuq1ho2XN/9OahMsJEJwSbK
         KDuQzZTdLkesFj6gR6RqbUyjUhXgkq/Hwul5OahmLdGwUvgTTCSLtmW8cRlglXZGy4s8
         oAxap1LpKUyS1zpaQSoaYylXoV/ME7U5Rhos4HZfiaLE9n8yHlfa1nGaUCfRqipPurzj
         MgNr530BHKdIqxVzWHam51hQPW0GPC4M+tafwZ/PQh/WZH+OY61E2IOXFZTN0GSlJzU8
         f3xw==
X-Gm-Message-State: AOJu0YzpJYPD2+9PUl7K2BchqwNC+ZedJPMtGF3aJ0VSAJYaaqNv1RFJ
	YjsbAZL8DbStKYtY9iWXs3EriE7mQgDKiRno6scMrXTbIVr7E19FdT3c49iet7Sg+T6knSro6vk
	gH7KDAFJf5Kye/Ft49yFlW0LVahM=
X-Google-Smtp-Source: AGHT+IF+LezDZx8vNVaQN9DjDCYTb+tzJSx96Hcxd97dModPN7CtIpRcUJPAZSEOhdtfcE7UkggdLTgw33pek2JILs4=
X-Received: by 2002:a5d:674f:0:b0:33a:e791:d8ad with SMTP id
 l15-20020a5d674f000000b0033ae791d8admr4882895wrw.4.1707373982804; Wed, 07 Feb
 2024 22:33:02 -0800 (PST)
MIME-Version: 1.0
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com> <8d5df1f4-74ca-27cc-99f0-7e7a82050de1@suse.com>
In-Reply-To: <8d5df1f4-74ca-27cc-99f0-7e7a82050de1@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 8 Feb 2024 06:32:50 +0000
Message-ID: <CAFLBxZbO2-f3rdgVhu2j_7sRWSeL5oMZt6pit=6nRvhPn=pqoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant
 case correctly
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000be729a0610d8fb0f"

--000000000000be729a0610d8fb0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 7:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> Grant P2M entries, which are covered by p2m_is_any_ram(), wouldn't pass
> the get_page() unless the grant was a local one. These need to take the
> same path as foreign entries. Just the assertion there is not valid for
> local grants, and hence it triggering needs to be avoided.
>

I think I'd say:

---
The 'fast' path of p2m_get_page_from_gfn handles three cases: normal ram,
foreign p2m entries, and grant map entries.  For normal ram and grant table
entries, get_page() is called, but for foreign entries,
page_get_owner_and_reference() is called, since the current domain is
expected not to be the owner.

Unfortunately, grant maps are *also* generally expected to be owned by
foreign domains; so this function will fail for any p2m entry containing a
grant map that doesn't happen to be local.

Have grant maps take the same path as foreign entries.  Since grants may
actually be either foreign or local, adjust the assertion to allow for this=
.
---

One more comment...


> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Using | instead of || helps the compiler fold the two p2m_is_*().
> ---
> v2: The shared case was fine; limit to grant adjustment.
>
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -357,11 +357,11 @@ struct page_info *p2m_get_page_from_gfn(
>               && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
>          {
>              page =3D mfn_to_page(mfn);
> -            if ( unlikely(p2m_is_foreign(*t)) )
> +            if ( unlikely(p2m_is_foreign(*t) | p2m_is_grant(*t)) )
>

I'm not a fan of this.  If you replace it with || you can have my R-b
immediately; otherwise we'll have to wait until we can discuss our general
policy on this sort of thing at the x86 maintainer's call.

 -George

--000000000000be729a0610d8fb0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 7:54=E2=80=AF=
PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Gr=
ant P2M entries, which are covered by p2m_is_any_ram(), wouldn&#39;t pass<b=
r>
the get_page() unless the grant was a local one. These need to take the<br>
same path as foreign entries. Just the assertion there is not valid for<br>
local grants, and hence it triggering needs to be avoided.<br></blockquote>=
<div><br></div><div>I think I&#39;d say:</div><div><br></div><div>---</div>=
<div>The &#39;fast&#39; path of p2m_get_page_from_gfn handles three cases: =
normal ram, foreign p2m entries, and grant map entries.=C2=A0 For normal ra=
m and grant table entries, get_page() is called, but for foreign entries, p=
age_get_owner_and_reference() is called, since the current domain is expect=
ed not to be the owner.</div><div><br></div><div>Unfortunately, grant maps =
are *also* generally expected to be owned by foreign domains; so this funct=
ion will fail for any p2m entry containing a grant map that doesn&#39;t hap=
pen to be local.</div><div><br></div><div>Have grant maps take the same pat=
h as foreign entries.=C2=A0 Since grants may actually be either foreign or =
local, adjust the assertion to allow for this.</div><div>---</div><div>=C2=
=A0</div><div>One more comment...</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
---<br>
Using | instead of || helps the compiler fold the two p2m_is_*().<br>
---<br>
v2: The shared case was fine; limit to grant adjustment.<br>
<br>
--- a/xen/arch/x86/mm/p2m.c<br>
+++ b/xen/arch/x86/mm/p2m.c<br>
@@ -357,11 +357,11 @@ struct page_info *p2m_get_page_from_gfn(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !((q &amp; P2M_=
UNSHARE) &amp;&amp; p2m_is_shared(*t)) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D mfn_to_page(mfn);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( unlikely(p2m_is_foreign(*t)=
) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( unlikely(p2m_is_foreign(*t)=
 | p2m_is_grant(*t)) )<br></blockquote><div><br></div><div>I&#39;m not a fa=
n of this.=C2=A0 If you replace it with || you can have my R-b immediately;=
 otherwise we&#39;ll have to wait until we can discuss our general policy o=
n this sort of thing at the x86 maintainer&#39;s call.</div><div><br></div>=
<div>=C2=A0-George</div></div></div>

--000000000000be729a0610d8fb0f--

