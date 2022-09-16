Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E45BA6BE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 08:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407803.650426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4lr-00053v-LO; Fri, 16 Sep 2022 06:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407803.650426; Fri, 16 Sep 2022 06:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4lr-00050v-If; Fri, 16 Sep 2022 06:24:15 +0000
Received: by outflank-mailman (input) for mailman id 407803;
 Fri, 16 Sep 2022 06:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhLc=ZT=gmail.com=szewcson@srs-se1.protection.inumbo.net>)
 id 1oZ4kd-0004yo-KX
 for xen-devel@lists.xen.org; Fri, 16 Sep 2022 06:22:59 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01164b42-3588-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 08:22:58 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso24692241pjk.0
 for <xen-devel@lists.xen.org>; Thu, 15 Sep 2022 23:22:57 -0700 (PDT)
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
X-Inumbo-ID: 01164b42-3588-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=zKarCidyNQ+Vh9CZRi81EcMokbR1BeWipaXRHA43NV8=;
        b=Toc0LvQ1kxt0Xy0VHmPKQcgIYG7kQhd5sRHfMbF7ZalAStxyAcEtdz1+TrLStapC/T
         Df3fH2nkZtMeYrsD06AwzD2lhee2bgz4JDbvj0Dg4ZGMZJ0CF0UZmJOz1wSqV+taHYBH
         vZUIKgK/I84WfKVY2glNlAVwMozap6KeX32sRa/VNmbjY1/xb6kP2Wa7A4P+QnYWxnN7
         FmksHGY4bHvGy4bgMJYuwydoJUkA3/uwe8EUqIrQs/Kv/h503fNal7PRPXT0wV7WWdSK
         gG5V0fgHN6PddcPl4Qc9KtiIzn7lpaDjJRQCzG7ESU4kna5Szxrgl5FTQU25mXVZYrw/
         EW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=zKarCidyNQ+Vh9CZRi81EcMokbR1BeWipaXRHA43NV8=;
        b=KBjn7j6si+Tm/clPOIryv9s8tqMRki4qRT97uFaqxIFS2jguLAvb/ul6HcY1iD0hvA
         Fq50rp9jKffvPzX2illsMJiH/RlfEk4Sz/BlCEx2YSah6qXb1vrQ9jeiv//eQFLHpFOE
         VGS0W1KU/nPDMUiZhTkTyzHypdwe9NnfaDbL2k/u1Fo6neHOEVGgmU+Yq429XD5G+9wF
         ijhPasNhwriBSAkb+ePSh1AnWZZLIqOC0q2ZG03GjsGwj527AiSfQuvBCAnKlCskVF8V
         UKlg52ho4MZXA+HKEtdk9mlYs2rqkK6sFYJnaY+d7cJN9tJv1eL0WjVRXMd/RadXLfQp
         0KvA==
X-Gm-Message-State: ACrzQf25ZIbKcSQksLg64eEjpswkhpFxD5w590za9V+AH4zngZf2K/Ck
	j2xza5SM0B/ulAHeIwPB+93pdG9629A0LGVdVpTCow0M5Nc=
X-Google-Smtp-Source: AMsMyM5UYkz6cD1pn3caBGAb5cDR2B+F6oxNX4XEz6jSRAlp8zAyfOY6eBCbIrhCP+i71mdVMLytezJ86LiwHbzNWE0=
X-Received: by 2002:a17:90b:4d05:b0:202:ec78:9d73 with SMTP id
 mw5-20020a17090b4d0500b00202ec789d73mr3812795pjb.103.1663309375738; Thu, 15
 Sep 2022 23:22:55 -0700 (PDT)
MIME-Version: 1.0
From: Adam Szewczyk <szewcson@gmail.com>
Date: Fri, 16 Sep 2022 08:22:43 +0200
Message-ID: <CAHsotTjE_n8XcCkVFTbynCYVw_LdM2oyiAAH2KCxh9MELxq-YA@mail.gmail.com>
Subject: [BUG] problems with NICs pass through to OpenBSD guest
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000007e16d005e8c564d8"

--0000000000007e16d005e8c564d8
Content-Type: text/plain; charset="UTF-8"

I have QubesOS 4.1.1 with Xen 4.14.5 hypervisor system on which I want to
install OpenBSD as a HVM and pass through my NICs to it (Intel Wireless
AC-9560 and Realtek 8168 rev 0x15: RTL8168H/8111H). I tested that when
installing OpenBSD on actual hardware both NICs seems to working properly.
But on hvm ethernet spamming me with: re0: watchdog timeout messages and
not working. Wireless causing OpenBSD Panic! first throwing errors like
this: iwm0: fw chunk addr 0x404000 len 712 failed to load.

I previously try to report it on OpenBSD mailing list, with my dmesg when
only eth passad through attached:
https://marc.info/?l=openbsd-bugs&m=166318676430481&w=2
and also on QubesOS issue tracker:
https://github.com/QubesOS/qubes-issues/issues/7765

I found also an similar issue with bhyve (re fw on guest not working when
passed through the same eth NIC to OpenBSD) on FreeBSD mailing list:
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=245392

If You think that error is on the driver side please let me know, I will
try to forced it on Open BSD mailing list or report to the fw vendor.

--0000000000007e16d005e8c564d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have QubesOS 4.1.1 with Xen 4.14.5 hypervisor syste=
m on which I want to install OpenBSD as a HVM and pass through my NICs to i=
t (Intel Wireless AC-9560 and Realtek 8168 rev 0x15: RTL8168H/8111H). I tes=
ted that when installing OpenBSD on actual hardware both NICs seems to work=
ing properly. But on hvm ethernet spamming me with: re0: watchdog timeout m=
essages and not working. Wireless causing OpenBSD Panic! first throwing err=
ors like this: iwm0: fw chunk addr 0x404000 len 712 failed to load. <br></d=
iv><div><br></div><div>I previously try to report it on OpenBSD mailing lis=
t, with my dmesg when only eth passad through attached: <a href=3D"https://=
marc.info/?l=3Dopenbsd-bugs&amp;m=3D166318676430481&amp;w=3D2">https://marc=
.info/?l=3Dopenbsd-bugs&amp;m=3D166318676430481&amp;w=3D2</a></div><div>and=
 also on QubesOS issue tracker: <a href=3D"https://github.com/QubesOS/qubes=
-issues/issues/7765">https://github.com/QubesOS/qubes-issues/issues/7765</a=
></div><div><br></div><div>I found also an similar issue with bhyve (re fw =
on guest not working when passed through the same eth NIC to OpenBSD) on Fr=
eeBSD mailing list: <a href=3D"https://bugs.freebsd.org/bugzilla/show_bug.c=
gi?id=3D245392">https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D245392<=
/a></div><div><br></div><div>If You think that error is on the driver side =
please let me know, I will try to forced it on Open BSD mailing list or rep=
ort to the fw vendor.</div></div>

--0000000000007e16d005e8c564d8--

