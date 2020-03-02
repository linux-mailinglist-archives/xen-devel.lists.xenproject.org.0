Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E1D176694
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 23:07:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8tBW-00022b-T0; Mon, 02 Mar 2020 22:05:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N5jH=4T=gmail.com=yyankovskyi@srs-us1.protection.inumbo.net>)
 id 1j8tBV-00022W-DZ
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 22:05:09 +0000
X-Inumbo-ID: e14c29d4-5cd1-11ea-af73-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e14c29d4-5cd1-11ea-af73-bc764e2007e4;
 Mon, 02 Mar 2020 22:05:08 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id w9so1172909iob.12
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2020 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59CKgbNUY5IT16fkIWS5PqZWfSETtIHjJbzEog4BH/4=;
 b=t2/gpqpnMSrRrNNpEP9L+UrYgX+4fa0tlTXb6rUN6xYo0VTEsVW6sYw6/576HfFdz0
 N0sjT6O6cDdCyOL9dnuGyedR9pt/2/mOjBQ6FFzZF0YXJhJDhWDp/XaLAfEjSLqSfx3f
 VLX19JN9tMOJiCLJV4GqLdTUhmyii23tVGTf8OQ5P9k53i2j3BC5lgXRvDU2Ehgz0NA/
 xfqP+7Q7FfreVWKrkYpCV0cdxMkEI/xMH+lgfAhYyGXt5HhvGqtMD3zC+w3bICzqrmDq
 aq8BBqTaRZ6yYgb+lmpYdMYCHonN12eLbmEwDAH4uwG/k0b5SrsLUcR9iBa8wYWxTmZT
 NNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59CKgbNUY5IT16fkIWS5PqZWfSETtIHjJbzEog4BH/4=;
 b=J4D3/eCgGoNyhCINPLjEDokW7SIfm2TV2dpHtXapQMq4n0t0guMInqHiA5QI1udxdY
 I4o8J51/r+b/HJzymefJ0EY1RSYGhwe04PmGrvgyb/SWnCaLKAvokoI4eghKR0PGlIzw
 TrepKjYUMMSUlOZAXFQm9Xxxk0xD/+kvWo+73LR9z6BEAmhzRUiwDmThRhzWBR85TpoR
 5MfW2073MZUEEBN7a7fCuw0hWSNutaP5jvARLTpz+WrMJLIq3jPhjecKGDMTCwTKeOZ3
 ND3GVlKawZFXfH97EjladVUiDatbyMO6NOoibHcp0alEEHT7TvmSlH/wa5w/BAeItT7p
 ym8Q==
X-Gm-Message-State: ANhLgQ17hc2Z72knDd618Rz3SseQFlIPzNUz9no7020SRjvazecaW6dG
 uPfyygj51ZJf5Hz2cbZfBHXTgfe2JbbMQV5T25E=
X-Google-Smtp-Source: ADFU+vuV7WuRzepYvbZ08fBksFXmi5LLvpe7p+tdIR7kNomYAxFeh48NzGxfH6dvkUQYO4NSYMZQGh7pZhzhZzcHamE=
X-Received: by 2002:a02:2a05:: with SMTP id w5mr1152563jaw.96.1583186708260;
 Mon, 02 Mar 2020 14:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20200229223035.GA28145@kbp1-lhp-F74019>
 <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
In-Reply-To: <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
From: Yan Yankovskyi <yyankovskyi@gmail.com>
Date: Mon, 2 Mar 2020 23:04:57 +0100
Message-ID: <CAMMwpw3xXkDBfS3tjDsfom8-_Fb68B-Fszqv9ax9Z=fE_ximOw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] xen: Use 'unsigned int' instead of
 'unsigned'
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============6286209314672346375=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6286209314672346375==
Content-Type: multipart/alternative; boundary="0000000000005bea9a059fe6615a"

--0000000000005bea9a059fe6615a
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 2, 2020 at 10:11 AM Jan Beulich <jbeulich@suse.com> wrote:
> ... evtchn_port_t here and elsewhere.

There are some interfaces with signed int as a type for port, e.g.
in include/xen/events.h.
Should I create additional patch to resolve inconsistency with evtchn
interface?
Or you suggest combining these changes into the existing patch?

Also as I understand 'evtchn' and 'port' are essentially the same entities
from perspective of local domain, related to each other roughly like
connection
and file descriptor pair. What do you think about renaming all 'evtchn'
arguments
and variables to 'port'? It will eliminate inconsistencies in the code,
for example
in include/xen/interface/event_channel.h and include/xen/events.h.

Yan

--0000000000005bea9a059fe6615a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 2, 2020 at 10:11 AM Jan Beuli=
ch &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>&gt; ... evtchn_port_t here and elsewhere.</div><div dir=3D"ltr" class=3D"=
gmail_attr"><br></div><div class=3D"gmail_attr">There are some interfaces w=
ith signed int as a type for port, e.g. in=C2=A0include/xen/events.h.</div>=
<div class=3D"gmail_attr">Should I create additional patch to resolve incon=
sistency with evtchn interface?</div><div class=3D"gmail_attr">Or you sugge=
st combining these changes into the existing patch?</div><div class=3D"gmai=
l_attr"><br></div><div class=3D"gmail_attr">Also as I understand &#39;evtch=
n&#39; and &#39;port&#39; are essentially the same entities</div><div class=
=3D"gmail_attr">from perspective of local domain, related to each other rou=
ghly like connection</div><div class=3D"gmail_attr">and file descriptor pai=
r. What do you think about renaming all &#39;evtchn&#39; arguments</div><di=
v class=3D"gmail_attr">and variables to &#39;port&#39;? It will eliminate i=
nconsistencies in the code, for=C2=A0example</div><div class=3D"gmail_attr"=
>in include/xen/interface/event_channel.h and=C2=A0include/xen/events.h.</d=
iv><div class=3D"gmail_attr"><br></div></div><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><font color=3D"#999999"=
 face=3D"arial, sans-serif">Yan</font></div></div></div></div></div>

--0000000000005bea9a059fe6615a--


--===============6286209314672346375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6286209314672346375==--

