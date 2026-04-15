Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCvsIkp732nFTgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:49:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7B404052
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282343.1564951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyk1-0007FA-2m; Wed, 15 Apr 2026 11:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282343.1564951; Wed, 15 Apr 2026 11:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyk0-0007Cc-W4; Wed, 15 Apr 2026 11:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1282343;
 Wed, 15 Apr 2026 11:49:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wlsrbwjd7232@gmail.com>) id 1wCyjz-0007CW-LF
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:49:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyjz-00CsKN-1u
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:49:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <wlsrbwjd7232@gmail.com>)
 id 69df7b28-2eae-0a2a0a5409dd-0a2a450ba75a-32
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:49:07 +0200
Received: from [74.125.82.52] (helo=mail-dl1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <wlsrbwjd7232@gmail.com>)
 id 69df7b31-bca8-0a2a450b0019-4a7d52349400-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:49:06 +0200
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-12734af2cdcso566794c88.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 04:49:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776253745; cv=none;
        d=google.com; s=arc-20240605;
        b=hoX1EA4eaN1rbw6hAXbaL7aKN4xYv6vnfcObrAY8zOb0Zqs4kwLNJXsTzRgHWe8wkY
         a4SYQUKTHKWT7Q6KhMBuQieh0Tidoxm2qcCJJLkMdIff742NOMZxQoYiaNy71Zl9uE7i
         84PxOmsFQ/meT6zhatBF1jcqk3WECkz7KsH/aJMDmrJZQSYw/FY5vT4oWygI70M+0ssA
         n4EfbRLq1TsyjGfPoLlzuDpGLB/y3hl/BBie33fkGOb9UM3AxQx9uzlLYOTkK1JNMtjf
         3yUk+Zs3Ce7IdpJJD5c5CqDHd0poKq6djMyi/n+CKJEgJcCeNpquArY6KtqoITUSSS1P
         WmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fF0EDgYzvalXVplasDURxrz1JbxTcNnbbzGMmI0mBAw=;
        fh=55tUfj1WwP7DhKmsv27FhfRdeMgov7mEKJwUGhbYoYE=;
        b=WMKFdwMTqqa7AZKXDkdHR87vMke0rOrN8nOVXURzU1ttr4b6QDsB1+U28lEi/uUZhW
         Q0hR5OONG1TQSwGidv2qgdvI5iz6uZZDkc4h6W1Qi7T7/m4JWidFGpP/r3cuZeTZwtyy
         akDYctfkPMqO5Iq/u+8aqXJay3xI0DS7Dtjf1Wt4l/3zcBGrPcCaSHvTtUOjwbShTs6R
         AZZK/C38kNYJOQH1BRh6MSUjUNXJ4ohZi7obP9ghC/bjkPofhdSEh41emh1xisKYvfxR
         B+BlLq04HzT87BnJHWcRHnQ0GQUYUon34Z+IR5NK+XTl/cuZr9Z7s0zW7RD4lT6AV4r7
         zZ9g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776253745; x=1776858545; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fF0EDgYzvalXVplasDURxrz1JbxTcNnbbzGMmI0mBAw=;
        b=jU+DDmVJ/I9t6Wz/ltxFyPWS2s6sD8tb522lV0r/4Pv8U0KUxjID1PJIYILdMrLAOF
         0onwJOt40UnAnno66cZiXsbsaTBojOf6pwb2LCVf/JGXF+U+AlxMkwTt/hes+46waqBt
         c3ZKjWm02moYPWkjL9DDtfEKXm8PouPHeevOXpxOMTv/TwiJFYWsALPwv6SFDGYikhXs
         dKUzqUiBIRzKKc9SpDmE0rrFBgX8LX2GQwK+7pfDFmmRRzP+RV3nH41KuSryjnKp7u4F
         TcsSJvepX3kQWe/KdLPVJ6idVpmD6WU+KB88WM48DQ7vRpiUu6M1YkN6jteYpbDMKGDZ
         V32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253745; x=1776858545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF0EDgYzvalXVplasDURxrz1JbxTcNnbbzGMmI0mBAw=;
        b=kamg5K3z8kRTgrl6NrXpLQ+zdjwNyPS5wqgTQLY2mGl9Pv9JljLfo8LQH37/3QwSb5
         zm8VKr6bB7q6aEx+VT3oDTUVfUBBsFW9TotP2PVPRXJ2GmxWASk7pqjTAEEMsrhwjjBO
         rEBrtf3J6Yqx4ia3nS04qfRdrJO4dzYgRrdhVF87YiKu0/FkseshpoILp0px66yJZNaD
         7g4iMiJ0lxeRctLulllO+rYs/XWtqjToM7l3P3aA6+GXUlhX8j6KhJawG4rD1gpMYqzp
         SqNVPCPQLvNAWNF62rp8Ej8mIUtXL8ejPivLCY4XiyreiybygasYYj4ec7p3kMsx86TK
         LOoQ==
X-Gm-Message-State: AOJu0Yw+BFL7bWTkbBEwXzh3eoT9ZfJ7nxKEyRK1iQQOutBw1F0YY5MX
	6aEbkenySaeIU2oomcIXuECMaeQevNkUL56KNlQ9Jzl4s+Bio7kwNSt9BV0d/VadIGrtYuAy6+5
	G6b0OzdLBJLOAER0JDjFUT/fQP+QNASM=
X-Gm-Gg: AeBDieuZdhXM8sCCwWKi10eZ5mhqE7sLxDwPspfw/mzUA2Aglf1yZCeAR1PrVO6oZ1r
	ekhMsLKoUgH6y5ufyheGZvamH9xQQgBoqD8oTin7D7tmm7ZeBS6pQR4f1OG/GUKnQcMZNxRuvMa
	QkqpOU7mqNGQzleC5ncS9wlMido5lBHuj9hbqCnN11k5frHOcAQGMapRaER35B9/dfFqDI5cwqu
	0Q2P7g3skh6K86JPMPgBgN4VFY7JwkqEtmdnh6zVaqHg5PZ4DpoQhLeEt5Kr3k+9F4ZXMTHGJ93
	4eFEIsYK5QxpV9CLVo23I+I4+CIZWb8=
X-Received: by 2002:a05:7022:6182:b0:128:d590:2947 with SMTP id
 a92af1059eb24-12c5d4cb57bmr486048c88.4.1776253744550; Wed, 15 Apr 2026
 04:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-2-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-2-michal.orzel@amd.com>
From: Gyujeong Jin <wlsrbwjd7232@gmail.com>
Date: Wed, 15 Apr 2026 20:48:53 +0900
X-Gm-Features: AQROBzDZ2_suPqDuYVx4ON47qTbGVxvMFSHBd9Ap8npzwo9pDkzE10NRof6f6hE
Message-ID: <CANrF8CEDV5m1Jap0kBoa3sOXD2GV6PAYumfV9rgL2c70nZa=tg@mail.gmail.com>
Subject: Re: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on
 attach failure
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="0000000000007995ca064f7e4d7f"
X-purgate-ID: tlsNG-42698a/1776253746-F43D62A1-F419A566/0/0
X-purgate-type: clean
X-purgate-size: 4671
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[wlsrbwjd7232@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[wlsrbwjd7232@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DDD7B404052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--0000000000007995ca064f7e4d7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your efforts.

I=E2=80=99ve seen some advisories that received cve here.
https://xenbits.xen.org/xsa/

Can I receive a cve for this report?

Thanks.

2026=EB=85=84 4=EC=9B=94 15=EC=9D=BC (=EC=88=98) 20:37, Michal Orzel <micha=
l.orzel@amd.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> handle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on
> failure but leaves the pointers dangling in the tracker entry. A
> subsequent handle_remove_overlay_nodes() for the same overlay will call
> rangeset_consume_ranges() on freed memory followed by a second
> rangeset_destroy(), resulting in use-after-free and double-free.
>
> NULL the pointers after rangeset_destroy() so that remove_nodes() and
> handle_remove_overlay_nodes() skip the stale entries.
>
> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device
> attachment to domains")
> Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/common/device-tree/dt-overlay.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/common/device-tree/dt-overlay.c
> b/xen/common/device-tree/dt-overlay.c
> index d184186c015e..6fa07dbf42a5 100644
> --- a/xen/common/device-tree/dt-overlay.c
> +++ b/xen/common/device-tree/dt-overlay.c
> @@ -910,7 +910,9 @@ static long handle_attach_overlay_nodes(struct domain
> *d,
>      if ( entry )
>      {
>          rangeset_destroy(entry->irq_ranges);
> +        entry->irq_ranges =3D NULL;
>          rangeset_destroy(entry->iomem_ranges);
> +        entry->iomem_ranges =3D NULL;
>      }
>
>      return rc;
> --
> 2.43.0
>
>

--0000000000007995ca064f7e4d7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for your efforts.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I=E2=80=99ve seen some advisories that received cve here=
.</div><div dir=3D"auto"><div style=3D"font-size:inherit"><a href=3D"https:=
//xenbits.xen.org/xsa/" style=3D"font-size:inherit">https://xenbits.xen.org=
/xsa/</a></div><br></div><div dir=3D"auto">Can I receive a cve for this rep=
ort?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks.</div><div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">2026=EB=85=84 4=EC=9B=94 15=EC=9D=BC (=EC=88=98) 20:37, Mic=
hal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com<=
/a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">han=
dle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on<br>
failure but leaves the pointers dangling in the tracker entry. A<br>
subsequent handle_remove_overlay_nodes() for the same overlay will call<br>
rangeset_consume_ranges() on freed memory followed by a second<br>
rangeset_destroy(), resulting in use-after-free and double-free.<br>
<br>
NULL the pointers after rangeset_destroy() so that remove_nodes() and<br>
handle_remove_overlay_nodes() skip the stale entries.<br>
<br>
Fixes: 4c733873b5c2 (&quot;xen/arm: Add XEN_DOMCTL_dt_overlay and device at=
tachment to domains&quot;)<br>
Reported-by: Gyujeong Jin &lt;<a href=3D"mailto:wlsrbwjd7232@gmail.com" tar=
get=3D"_blank">wlsrbwjd7232@gmail.com</a>&gt;<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
---<br>
=C2=A0xen/common/device-tree/dt-overlay.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/d=
t-overlay.c<br>
index d184186c015e..6fa07dbf42a5 100644<br>
--- a/xen/common/device-tree/dt-overlay.c<br>
+++ b/xen/common/device-tree/dt-overlay.c<br>
@@ -910,7 +910,9 @@ static long handle_attach_overlay_nodes(struct domain *=
d,<br>
=C2=A0 =C2=A0 =C2=A0if ( entry )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rangeset_destroy(entry-&gt;irq_ranges);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;irq_ranges =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rangeset_destroy(entry-&gt;iomem_ranges);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;iomem_ranges =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return rc;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--0000000000007995ca064f7e4d7f--

