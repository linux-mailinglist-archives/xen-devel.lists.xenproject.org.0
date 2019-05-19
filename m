Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E322871
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2019 20:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSQpc-0005wH-7F; Sun, 19 May 2019 18:46:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zSi7=TT=columbia.edu=ek2928@srs-us1.protection.inumbo.net>)
 id 1hSQpb-0005wC-1B
 for xen-devel@lists.xenproject.org; Sun, 19 May 2019 18:46:47 +0000
X-Inumbo-ID: 720fab02-7a66-11e9-bc4b-8f48409e50f6
Received: from outprodmail01.cc.columbia.edu (unknown [128.59.72.39])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 720fab02-7a66-11e9-bc4b-8f48409e50f6;
 Sun, 19 May 2019 18:46:43 +0000 (UTC)
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
 by outprodmail01.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id x4JIh5Ii007948
 for <xen-devel@lists.xenproject.org>; Sun, 19 May 2019 14:46:42 -0400
Received: from hazelnut (localhost.localdomain [127.0.0.1])
 by hazelnut (Postfix) with ESMTP id BD0D56D
 for <xen-devel@lists.xenproject.org>; Sun, 19 May 2019 14:46:42 -0400 (EDT)
Received: from sendprodmail01.cc.columbia.edu (sendprodmail01.cc.columbia.edu
 [128.59.72.13]) by hazelnut (Postfix) with ESMTP id 9EE616D
 for <xen-devel@lists.xenproject.org>; Sun, 19 May 2019 14:46:42 -0400 (EDT)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by sendprodmail01.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id x4JIkg2w033272
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 19 May 2019 14:46:42 -0400
Received: by mail-qt1-f200.google.com with SMTP id n21so12165477qtp.15
 for <xen-devel@lists.xenproject.org>; Sun, 19 May 2019 11:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=/YiQsmEmnLZgGLyRRvk1G+y3e2uoAAJS2hPegpHiq+0=;
 b=ht+PA8LziFd+SVYvcHZWkQiV+W7eq7TptvYdUtSRbB6b0A2A12oTYLU5d68CSKpRsM
 sFhNxSu3hLpbao5NWgpsohXcgatU2fC6SYeHU9EhG0qFf/7GRMSkVLnRXlWiHmYBerOS
 3+rCVNK3VRQclAg+LewHXkzi0gTc3iB1pBKj5SCUo4WyhP83WktfbKJKGKy4DAn3QKio
 Xjy16ntyLwsolXsdIpVFVdzLDpMR4VY6oFMaWn+LQH+cL0vcmU/El1yJ6ufCeQaAyu2l
 VSV1c5OWgt0vi+3dYhqvXrLFkN/fGWkxNzyJKis1SnBRPDDYvd6n4LK/RuZl2LhS4ILt
 MiCA==
X-Gm-Message-State: APjAAAW5cnBTBqB3BS/7aI7CYNoP9OYApOuJo3IUsqX7sXDR9mmRPkKn
 fRtrnBwT2S7VsljR01VqQA73n4GQk7tI/mmbZpzPp0LfBkNSdqbsgUTU9pK0JT3e8eQTJY6awja
 8ER4nMwIFlybzDUXieTrJjhCcld923m9xc2AuPiA160nG6nTTA+E=
X-Received: by 2002:a05:620a:1085:: with SMTP id
 g5mr38953527qkk.182.1558291601884; 
 Sun, 19 May 2019 11:46:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz65PhXrhzapdLQntz2J0YAUCRsPTTnKeh95RvI7eBZOcHYGlvzjTZg1cMMnCpKdBmZwyP0X3nE7yeviDXHUDo=
X-Received: by 2002:a05:620a:1085:: with SMTP id
 g5mr38953508qkk.182.1558291601376; 
 Sun, 19 May 2019 11:46:41 -0700 (PDT)
MIME-Version: 1.0
From: Eitan Kaplan <e.kaplan@columbia.edu>
Date: Sun, 19 May 2019 14:46:30 -0400
Message-ID: <CAMctL7UVJm-5fhkX8oHvkUXUK5LsF0BPY44Y3HmuMx6MJXqVMA@mail.gmail.com>
To: xen-devel@lists.xenproject.org
X-No-Spam-Score: Local
X-Scanned-By: MIMEDefang 2.84 on 128.59.72.13
Subject: [Xen-devel] Registering interrupt handler for performance counter
 overflow
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
Reply-To: e.kaplan@columbia.edu
Content-Type: multipart/mixed; boundary="===============4514441424258129037=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4514441424258129037==
Content-Type: multipart/alternative; boundary="0000000000005b5878058942093f"

--0000000000005b5878058942093f
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am a computer engineering student at Columbia University. This is my
first time writing to this list (please let me know if this isn't the place
for this type of question!).

I am working with a professor on a project to mitigate Spectre and Meltdown
(and other similar cache timing side-channel attacks).  We are using Xen
and modifying its source as a way of modeling the affect certain potential
hardware changes. As part of that project, we need to use the performance
counters to generate interrupts at certain microarchitectural events.  I
have successfully added into xen/arch/x86/setup.c a few lines to setup the
(Intel Sandy Bridge) performance counter control MSRs and set the counter
itself to a few below overflow.  All that's missing is a simple interrupt
handler that will reset the counter to a few below overflow (and perhaps do
some logging).

I am having trouble figuring out how to register my handler in Xen.  I
assume that I have to call request_irq(), but I am not sure how to set all
the arguments for that call.  Would anyone be able to give me any
pointers?  Suggestions or pointers to resources/examples for registering
interrupt handlers in Xen would be really helpful!

Alternatively, is there an existing interrupt handler that is already setup
for PMC overflow interrupts that I might be able to tweak?

Thank you!
Eitan Kaplan

--0000000000005b5878058942093f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I am a computer engineering stu=
dent at Columbia University. This is my first time writing to this list (pl=
ease let me know if this isn&#39;t the place for this type of question!).</=
div><div><br></div><div>I am working with a professor on a project to mitig=
ate Spectre and Meltdown (and other similar cache timing side-channel attac=
ks).=C2=A0 We are using Xen and modifying its source as a way of modeling t=
he affect certain potential hardware changes. As part of that project, we n=
eed to use the performance counters to generate interrupts at certain micro=
architectural events.=C2=A0 I have successfully added into xen/arch/x86/set=
up.c a few lines to setup the (Intel Sandy Bridge) performance counter cont=
rol MSRs and set the counter itself to a few below overflow.=C2=A0 All that=
&#39;s missing is a simple interrupt handler that will reset the counter to=
 a few below overflow (and perhaps do some logging).</div><div><br></div><d=
iv>I am having trouble figuring out how to register my handler in Xen.=C2=
=A0 I assume that I have to call request_irq(), but I am not sure how to se=
t all the arguments for that call.=C2=A0 Would anyone be able to give me an=
y pointers?=C2=A0 Suggestions or pointers to resources/examples for registe=
ring interrupt handlers in Xen would be really helpful!</div><div><br></div=
><div>Alternatively, is there an existing interrupt handler that is already=
 setup for PMC overflow interrupts that I might be able to tweak?</div><div=
><br></div><div>Thank you!</div><div>Eitan Kaplan</div></div>

--0000000000005b5878058942093f--



--===============4514441424258129037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4514441424258129037==--


