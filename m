Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38283CB6653
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184319.1506797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTj2h-0005aK-3H; Thu, 11 Dec 2025 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184319.1506797; Thu, 11 Dec 2025 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTj2h-0005Xx-08; Thu, 11 Dec 2025 15:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1184319;
 Thu, 11 Dec 2025 15:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTj2f-0005Xr-Oh
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:57:21 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 134eba78-d6aa-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 16:57:20 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so217743e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:57:20 -0800 (PST)
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
X-Inumbo-ID: 134eba78-d6aa-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765468640; x=1766073440; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7DxyWosZiBIBf/s9g2GEsaC4y+bKQLm7rfmOQBm8xI=;
        b=OwRQLvUdzob7bNin+KVG4dLfUg+TTeTSTSC8Gk4BC7DJrFtG2xiTqZUFCwUhrWMSZR
         P7d2246kp3pHPhVjxBenzKnGJHd7SZw+aneH1InIvtFp0VkdY5L2PymXc98UWBlRE3pu
         z5w23yyHRcf/37dDNfO+9bA4eJXomeln91EvamMODO9oduh6nEDPwu381BFmS6SbE2gz
         uNCYLTdgcgNzQI8MrFMThuXFBRVY3GmlpErlvZfsyR/a4jod7ATVIPlv23CGgLImLJlM
         A+fOGqIYnGGea5+AgIm8PWd1WbL7Fs+0JRywjACXkRq+xKPAC7cCBiDPKglmweCGPAFj
         9Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765468640; x=1766073440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7DxyWosZiBIBf/s9g2GEsaC4y+bKQLm7rfmOQBm8xI=;
        b=FojHw4OC3TrBuZBns4944nD0ZDNdVhVYZAywzqt9nxC/5eR6C0fC1OVZhJ0HaYPkb3
         iyUXqeodMZdplBlo965ZonXQnPlwzxjxNvQ2d92D3Ye5aqd2Y6xTyXAtHuhDOCYEYyLX
         8RTGC1K4sNkUgOnBdHfrqcJuBcT3DqF0dzmvIDEen8W5K+CP/Y4jU/IirEiyUb5Yq7Xp
         6d4lGjvbXzQ+Exp6bMpSkZz85UHHgK9qJHVoSOmEG69ecOospjcbL/nxW+xcSe2WOqa+
         jqKzF8Vf5iiGbNxvN9vIsc3nCd7GYGnzpXGMY3Yq7PnMza4DVVEZNb3eRjDQSWFoYPvO
         G0lg==
X-Gm-Message-State: AOJu0YyR2QNMB+36y2N+qGJ2XrEv4t8aZPYFUT/QR5GZzAp1iN62TbGM
	Rd5Xbi3OseSeVzDmCsy0hS3Luk9ox0xYwJ/RHhRRn5D7iesJSf4KVzqag8Tg91PpciJbNDINuCK
	VLZYhhj75skuSUJV4PFibogBNPfouFBc=
X-Gm-Gg: AY/fxX7ffWJL2Z/cH+W9TCOD50Yo1r8s4DBbcGlqr8NF2Qk/N105iuY3CHKV4f6ULch
	nTFdAmWz0XBEfkTmkd9Ltb8vUyES0UOsUpCYhxefOuPJQuVExPX2+d2C78PiVAmSX1gW6P1C71+
	+VAaRbR670tF6csb+SKkcqEtJA7v9Ba0WRt3vuGgIYffdtuOKgP4tXzeyOlZ3NkITHzaM46XhiS
	20A1ZEjwGTYFjK3PyyUXK9qMhi4FjoHUAkFCjSnRaRSgM0uyp8tXmH8RHquUadDaUcwBkk=
X-Google-Smtp-Source: AGHT+IGbenj4InEqAbwtQZJUZ36sF5v0IlFWi9n96PncoN1i0BK28YWfSULcrjumRSuYs/TELgTYeq86xZ6l1Axb7Qc=
X-Received: by 2002:a2e:be0f:0:b0:37f:9fdb:9228 with SMTP id
 38308e7fff4ca-37fbfc033e7mr7602001fa.0.1765468639648; Thu, 11 Dec 2025
 07:57:19 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com> <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com> <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
In-Reply-To: <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 11 Dec 2025 17:57:08 +0200
X-Gm-Features: AQt7F2pkdbqgpdcq1U54EXa16vswX2QYrzxM-kIhOKZnW6H2u8kdzEkWzqBlJFg
Message-ID: <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 5:31=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 13:06, Mykola Kvach wrote:
> > On Thu, Dec 11, 2025 at 1:44=E2=80=AFPM Mykola Kvach <xakep.amatop@gmai=
l.com> wrote:
> >> I tested the issue with the provided patch, and it is still reproducib=
le.
> >
> > I also triggered a pipeline with the patch you provided on top of my
> > changes [1],
> > and it failed there as well. In fact, it exposed additional problems
> > in other jobs.
> >
> > [1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/=
2209153728
>
> These are the failures we're trying to hunt down.
>
> Looking at one of the Arm build logs, I can't see any indication that you=
 actually
> extended the patch to Arm's linking rule. Hence my conclusion in the othe=
r reply
> may be wrong - we simply still don't know what the situation is there.

You're right, I missed the necessary changes. Would this diff be sufficient=
?

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4a549a1ac0..8283f13aee 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -100,6 +100,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
                | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
                > $(dot-target).2.S
        $(MAKE) $(build)=3D$(@D) $(dot-target).2.o
+       $(call compare-symbol-tables,$(dot-target).1.o,$(dot-target).2.o)
        $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
            $(dot-target).2.o -o $@
        $(NM) -pa --format=3Dsysv $@ \


>
> Jan

Best regards,
Mykola

