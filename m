Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936B1C089B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:54:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUGBx-000571-Cc; Thu, 30 Apr 2020 20:53:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHFy=6O=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jUGBw-00056q-Bs
 for xen-devel@lists.xen.org; Thu, 30 Apr 2020 20:53:56 +0000
X-Inumbo-ID: b4446862-8b24-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4446862-8b24-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 20:53:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j14so2408586lfg.9
 for <xen-devel@lists.xen.org>; Thu, 30 Apr 2020 13:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKC1Ubs64feoGoEAHeoVOPMHU64p71MzA+JDLl+lbLc=;
 b=J/fSsYMM8my3Td7IWI5u/N4Ujzb0AsdFYbPi1ODROzWXiaQwcM0d00f+b7pNZCzux5
 WEHz7QtJNQR8CnlDZ+HG19oy/bmwE33IcvyQcDrS6T3bIVSGUql2v+N4cJAqTLZjTc+o
 E0y3LV/9qRHC3MZ2WLDF0vEQ7ld1/RiD4uJKz33oPVb0pihyzPnBg/PVIpuJWvA1/k59
 AmcYQjaclbWrgmSbzuzRs9kVVs2xJHBl7A6kNjPUEW+lNFjW8JWjfpNVySZhyREBMESF
 Zo78AE8Pl8LNTu4HPOhC9Cvi2vux5ml+1+055qlslYL68yNapineAKttKyoCI+RzVXi+
 s/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKC1Ubs64feoGoEAHeoVOPMHU64p71MzA+JDLl+lbLc=;
 b=Xa2KI90tW+CwYOoxtfV5uQRcLV0ASIir/Ozstw4MzHGrEQzn5AZww/KjWac2HD9hGk
 dt9myBP8ioOuOC092oMMOSpXNpAPgfbkCZRgQ3pP4OtXV04cOHEW+WR0+yORd5Ex9f5O
 MtPLtxld1dyxqO3mgOXlh/nQtLHiElqjLj7cUzJ1nS3Fmsnm02cQDPT8sMKT+b8O6Yh3
 kQ9Fxo3x8vOmOFAu1vMhs2hEy1mcXR2WTsX6jBwYDiMd9UTPp3oFif54t0vCKiq3erU/
 riUWg69pNe+Qla3qkN5vv0x8k2fdsAGtfsgNIPzpsXKENBs3GInP/aDj5riMXjDVQscn
 2bXw==
X-Gm-Message-State: AGi0PubeXrfkPNB55burOP130X/MOP13Mu1ncA+/IoPhihKbQF9YZ5kB
 ARV7wAERlQI49vejcCsxmS1tax7+ci8VCqqQLuA=
X-Google-Smtp-Source: APiQypK8ZUgAbkay/BA3dA1dtaANoskPU01mbUAjWFCgZNDTK5Lxny3armTJO92C2IRDKe4amick9pAFWODInFAfw3E=
X-Received: by 2002:a19:3848:: with SMTP id d8mr342982lfj.44.1588280034139;
 Thu, 30 Apr 2020 13:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOCxVi0s5X+=Hug2_M-AyXvYpiwqfkf7G2Y66kp44MQ-xgO+KA@mail.gmail.com>
 <e92bb8ab-3dd2-bb19-d524-d78279f9508a@citrix.com>
 <CAOCxVi1PWM_9t03f=_qn0PXkKB1gN4504h+ijMpwqGU9VpR48g@mail.gmail.com>
 <CAOCxVi0=iKzeJ0gfZ8XoMTXYrZaHbok=F30pw1rNdsUhkQcXjw@mail.gmail.com>
In-Reply-To: <CAOCxVi0=iKzeJ0gfZ8XoMTXYrZaHbok=F30pw1rNdsUhkQcXjw@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 30 Apr 2020 16:53:42 -0400
Message-ID: <CAKf6xptZyZPGL34SKMcEyMyHzqvMpqoY4fdMFaabUb45dnC4bg@mail.gmail.com>
Subject: Re: Xen Compilation Error on Ubuntu 20.04
To: Ayush Dosaj <ayushdosaj2313@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 4:18 AM Ayush Dosaj <ayushdosaj2313@gmail.com> wrote:
>
> Hi Andrew, Xen Development team.
>
> I compiled and installed Xen by appending -fcf-protection=none to CFLAGS on Ubuntu 20.04 but it still crashes on startup.

Ayush, try the patch below.  EMBEDDED_EXTRA_CFLAGS ensures it is set
down in xen/arch/x86/boot/build32.mk

-Jason

diff --git a/Config.mk b/Config.mk
index 0f303c79b2..efb3d42bc4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))

 EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions
+EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none

 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
index 4b7ab78467..c3cbae69d2 100644
--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -69,6 +69,7 @@ CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 ifeq ($(CONFIG_INDIRECT_THUNK),y)
 CFLAGS += -mindirect-branch=thunk-extern -mindirect-branch-register
 CFLAGS += -fno-jump-tables
+$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 endif

 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow

