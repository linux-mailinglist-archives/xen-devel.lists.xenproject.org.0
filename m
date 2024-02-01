Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEED08458F3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674423.1049309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXBR-00050X-IE; Thu, 01 Feb 2024 13:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674423.1049309; Thu, 01 Feb 2024 13:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXBR-0004y6-FN; Thu, 01 Feb 2024 13:32:49 +0000
Received: by outflank-mailman (input) for mailman id 674423;
 Thu, 01 Feb 2024 13:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+ZK+=JK=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1rVXBQ-0004k9-06
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:32:48 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b1199c-c106-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 14:32:46 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33b14702adaso414497f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 05:32:46 -0800 (PST)
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
X-Inumbo-ID: 62b1199c-c106-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706794366; x=1707399166; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q1N1WhUa+zlUda6ded9+L5IGCZd1kPELbcb28F33NvM=;
        b=HMXydHZ2OiqMc/911YWyxB09s8pcu5ffQElF66mzj4TPpSp3s821tvkSUPI1W+buHV
         HldUL4wNmjoLMQCWuIVQb1ERazG39qAX3frvnqIxP+IXk+0o5wARLWi8fr9Nvkp7VnuY
         VlEaBYbPsWgpZBgWhczTE+M0iS/0OE9Np/gVERMPKdT8we0m0d26qHVT5FKINhBVnsNp
         VFrk+DXtGp7tZENpGDFSkl/0zYZT86kpi3Jfk6tjS0/pWyrpUgsxICCJmiWgxHG9aupY
         S9TxkJ3m7Od7QKbvY52wAq3n2caaB8JwCFKtfXVmM/3Qc+PFFMo0mDATJ8aFKXQ46GuI
         Gh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794366; x=1707399166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1N1WhUa+zlUda6ded9+L5IGCZd1kPELbcb28F33NvM=;
        b=gVCazNyqwIM74GLQPrxHzdHNIuAtaicuO87DHI/UFpuQ46Gdl5uh/cHdPOsaTKFkzP
         3U9IZ9UJjsuibbOlRsWBHQLvwfg29M8z9KsFtc0axpdIpSdlcJx1uByNGy+3o1kMLgUB
         wWo8+bAU9thrSFVwbYw0bTvG/lN7s8zDtXW2mhmDQEVm7D5c7pI1VAxqu2FfYBWANoro
         Kl9qfNXNeXVOXLlfscArymYoYTpyv6x0FdZAWVkK8F7AtAjA+MQC4ENNCkN9EWoTVE39
         p/SSGQ3QgK76vCsNGqzn6JQVxki2BS8LjzAxhpgVA7OJycboFX0Mhrvgi/AVyspvOt4n
         ueGQ==
X-Gm-Message-State: AOJu0Yy0JPCT9vbbdZExBmv+H55dUXyG2I5EI31wBepyGcJHSWGYSWhp
	EMU+O7Vp18qzEGl1Q8Cr72rtlkKsJvWmuFQ9YW2/rgG+QwQFheAsTMBY5J9+UEKVquCONibuZqQ
	4hDzUk9i+CIuNeTDf5ONAhn9ZtNI=
X-Google-Smtp-Source: AGHT+IHy2GjZWx2D3UbxOtDX7JOyRUDWbtychyj3EAprrf88Hk0njswWMcO7Dgc0SCwAMARJcQsFgQOWPsqvhYV2ejQ=
X-Received: by 2002:a5d:4b04:0:b0:33b:e5f:edec with SMTP id
 v4-20020a5d4b04000000b0033b0e5fedecmr2584518wrq.16.1706794365798; Thu, 01 Feb
 2024 05:32:45 -0800 (PST)
MIME-Version: 1.0
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com> <7cce89f4-962e-bfbe-7d30-18fea7515bed@suse.com>
In-Reply-To: <7cce89f4-962e-bfbe-7d30-18fea7515bed@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 1 Feb 2024 13:32:34 +0000
Message-ID: <CAFLBxZZLJMWpf1fCNN4dhoDpYpW6O=V_C==-sCAZy6t4Df_yBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/p2m: aid the compiler in folding p2m_is_...()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000e0ccbb0610520702"

--000000000000e0ccbb0610520702
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 12:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:

> By using | instead of || or (in the negated form) && chances increase
> for the compiler to recognize that both predicates can actually be
> folded into an expression requiring just a single branch (via OR-ing
> together the respective P2M_*_TYPES constants).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Sorry for the delay.  Git complains that this patch is malformed:

error: `git apply --index`: error: corrupt patch at line 28

Similar complaint from patchew when it was posted:

https://patchew.org/Xen/5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/

 -George

--000000000000e0ccbb0610520702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 12:54=E2=80=
=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>By using | instead of || or (in the negated form) &amp;&amp; chances incre=
ase<br>
for the compiler to recognize that both predicates can actually be<br>
folded into an expression requiring just a single branch (via OR-ing<br>
together the respective P2M_*_TYPES constants).<br>
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br></blockquote><div><br></div><div>S=
orry for the delay.=C2=A0 Git complains that this patch is malformed:</div>=
<div><div><br></div><div>error: `git apply --index`: error: corrupt patch a=
t line 28<br></div><div><br></div><div>Similar complaint from patchew when =
it was posted:</div><div><br></div><div><a href=3D"https://patchew.org/Xen/=
5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/" target=3D"_blank">https://p=
atchew.org/Xen/5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/</a></div><fon=
t color=3D"#888888"><div><br></div><div>=C2=A0-George=C2=A0</div></font></d=
iv><div>=C2=A0</div></div></div>

--000000000000e0ccbb0610520702--

