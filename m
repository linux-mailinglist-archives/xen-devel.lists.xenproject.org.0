Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578BDAFE43A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037986.1410523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZREe-000780-RR; Wed, 09 Jul 2025 09:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037986.1410523; Wed, 09 Jul 2025 09:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZREe-000765-Os; Wed, 09 Jul 2025 09:37:04 +0000
Received: by outflank-mailman (input) for mailman id 1037986;
 Wed, 09 Jul 2025 09:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODik=ZW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uZREd-00075z-A1
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:37:03 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 443afb17-5ca8-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 11:37:02 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6fb1be9ba89so54337496d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 02:37:02 -0700 (PDT)
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
X-Inumbo-ID: 443afb17-5ca8-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752053821; x=1752658621; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8rbAT2zYmScWsNdpAs4AtgBv+jWL75Ew5nH47gEBJEM=;
        b=D9m1paNO+r6QrcjvLPK9OMnHmWoL6fsa2/ayrdwRx0oug6wRYkW8VSuNAF0zDy9zIn
         2GlNeLjuplmysj5jBVet44pArXOpuRcnrmO3Y6ibv2J0Qg1ZAsSHbQIpy4vsbXUCMbQP
         X0sNjgCSkhjnEMzIuUk89PcbwrcqhAlbej1gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752053821; x=1752658621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rbAT2zYmScWsNdpAs4AtgBv+jWL75Ew5nH47gEBJEM=;
        b=Z2g4+sw4Jv6lcczxyMiFNZD15kaNWdCOE7GV2Ydxotib17TTymSj76NPuhyVu/i1LP
         /ijyiOguI5pxM2JLg/4kcSBPnPHwO6EmnJIAfTnJbldepZ+h37z8dWVvK9DJ2eoGTaUB
         1mGxgpDZdqVW4/Y5VI8EymQexSW6zpn/7boVe5gbo+1sikKhVXgs83VPsmNnz2oorh3t
         6aGSfy64x/FP5uPPgtbG9C5gJpAOiBbsGXgY6Wz+CmkTp7Zo7MasQzFZLzRQYSCm3n0h
         hQbJW3O0WKssnhnmXrawW7tQRI06VecJsqIkQGDCJLSxkfIp44sgnijz8IGHruZSVPIb
         fu2w==
X-Gm-Message-State: AOJu0YxSRbkywXrYApU+c6rde3xeuwLYHMOUZ09Hv0dSEZhnuZkxMWkP
	n4SmopX+IUrdqOsNUsRX0JECIxUa1ebULfGO9Lqha5mfqlgpryyqUxwEUDYPJ4JDRUsFfYyEmEt
	0mSooKcdm9GCmj/cv/fRh5DjpwfuTivCPcbixZS+PHQFtc3+jwH1DsoHzog==
X-Gm-Gg: ASbGncvpKIYqA3m2WN990x7QJNd7k/6IqqKOR+2TjNq/bGx4hbmKIdhdxy5byTxnkIJ
	2BjFIYn+IoCexrK0nCnAYGtYo/AKE7zqlWa+k0AzqvtpTUJPoBiRqOQlebBnSDSxle5PCFY4a+r
	GuE6Kro49tdwYnpq2m8xI0cjtO2UU5PWoeA+AROM4B5g==
X-Google-Smtp-Source: AGHT+IG92k9HTRwhzvcl63NzWCRhScGciBh17lAkJVmp5ZhYY3+ukPs/cZlZhe7cZI8CxDtQUAJjpskksCrZUQxuXFU=
X-Received: by 2002:a05:6214:c6b:b0:702:d87a:60a0 with SMTP id
 6a1803df08f44-7048ba571eemr21932466d6.44.1752053820972; Wed, 09 Jul 2025
 02:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <34052150-b851-417a-b08f-7d8916bc5b29@suse.com>
In-Reply-To: <34052150-b851-417a-b08f-7d8916bc5b29@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Wed, 9 Jul 2025 11:36:52 +0200
X-Gm-Features: Ac12FXyRu6ns4-SxK5TBQjOWk-ZkXcmEtBSCD4E22Kka6v3tH_eHAy2iDP-1m5E
Message-ID: <CACBT2OscmJE=j1nywi7ZvveW-_h387n=PxHM6v+WgUyFa+FpfQ@mail.gmail.com>
Subject: Re: [PATCH for-4.{20,19,18,17}] x86/idle: undo use of MONITOR/MWAIT mnemonics
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000a07eb006397bd1c1"

--000000000000a07eb006397bd1c1
Content-Type: text/plain; charset="UTF-8"

Ack.  Sorry for forgetting this

On Wed, 9 Jul 2025, 10:44 Jan Beulich, <jbeulich@suse.com> wrote:

> While the change is fine on staging, where the toolchain baseline was
> moved, we need to remain compatible with older gas on stable branches
> for now.
>
> Fixes: fa254938f00a ("x86/idle: Move monitor()/mwait() wrappers into
> cpu-idle.c")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -70,20 +70,20 @@ static always_inline void monitor(
>       * The memory clobber is a compiler barrier.  Subseqeunt reads from
> the
>       * monitored cacheline must not be reordered over MONITOR.
>       */
> -    asm volatile ( "monitor"
> +    asm volatile ( ".byte 0x0f, 0x01, 0xc8" /* monitor */
>                     :: "a" (addr), "c" (ecx), "d" (edx) : "memory" );
>  }
>
>  static always_inline void mwait(unsigned int eax, unsigned int ecx)
>  {
> -    asm volatile ( "mwait"
> +    asm volatile ( ".byte 0x0f, 0x01, 0xc9" /* mwait */
>                     :: "a" (eax), "c" (ecx) );
>  }
>
>  static always_inline void sti_mwait_cli(unsigned int eax, unsigned int
> ecx)
>  {
>      /* STI shadow covers MWAIT. */
> -    asm volatile ( "sti; mwait; cli"
> +    asm volatile ( "sti; .byte 0x0f, 0x01, 0xc9;" /* mwait */ " cli"
>                     :: "a" (eax), "c" (ecx) );
>  }
>
>

--000000000000a07eb006397bd1c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ack.=C2=A0 Sorry for forgetting this</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, 9 Jul 2025, 10:44 Jan Beulich, &lt;<a href=3D"mailto:jbeulich@sus=
e.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">While the change is fine on staging, where the toolchain baseline was<=
br>
moved, we need to remain compatible with older gas on stable branches<br>
for now.<br>
<br>
Fixes: fa254938f00a (&quot;x86/idle: Move monitor()/mwait() wrappers into c=
pu-idle.c&quot;)<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br>
<br>
--- a/xen/arch/x86/acpi/cpu_idle.c<br>
+++ b/xen/arch/x86/acpi/cpu_idle.c<br>
@@ -70,20 +70,20 @@ static always_inline void monitor(<br>
=C2=A0 =C2=A0 =C2=A0 * The memory clobber is a compiler barrier.=C2=A0 Subs=
eqeunt reads from the<br>
=C2=A0 =C2=A0 =C2=A0 * monitored cacheline must not be reordered over MONIT=
OR.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 asm volatile ( &quot;monitor&quot;<br>
+=C2=A0 =C2=A0 asm volatile ( &quot;.byte 0x0f, 0x01, 0xc8&quot; /* monitor=
 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :: &q=
uot;a&quot; (addr), &quot;c&quot; (ecx), &quot;d&quot; (edx) : &quot;memory=
&quot; );<br>
=C2=A0}<br>
<br>
=C2=A0static always_inline void mwait(unsigned int eax, unsigned int ecx)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 asm volatile ( &quot;mwait&quot;<br>
+=C2=A0 =C2=A0 asm volatile ( &quot;.byte 0x0f, 0x01, 0xc9&quot; /* mwait *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :: &q=
uot;a&quot; (eax), &quot;c&quot; (ecx) );<br>
=C2=A0}<br>
<br>
=C2=A0static always_inline void sti_mwait_cli(unsigned int eax, unsigned in=
t ecx)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* STI shadow covers MWAIT. */<br>
-=C2=A0 =C2=A0 asm volatile ( &quot;sti; mwait; cli&quot;<br>
+=C2=A0 =C2=A0 asm volatile ( &quot;sti; .byte 0x0f, 0x01, 0xc9;&quot; /* m=
wait */ &quot; cli&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :: &q=
uot;a&quot; (eax), &quot;c&quot; (ecx) );<br>
=C2=A0}<br>
<br>
</blockquote></div>

--000000000000a07eb006397bd1c1--

