Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688E1BBCBE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:45:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOfg-0006pL-Aq; Tue, 28 Apr 2020 11:45:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTOff-0006pG-P1
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:45:03 +0000
X-Inumbo-ID: b2630ade-8945-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2630ade-8945-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 11:45:02 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id 59so8068808qva.13;
 Tue, 28 Apr 2020 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:to:cc:subject:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fd/M3Ffs7OwceegYsMYGTqbAvT1dTQERp72SccZnPBY=;
 b=JYPyhmIYgn8bTgIM0SaWBtvgEIJKI+Bpac4lm1AzE4bMxnjcc8+SGaOTlLbhU/Chkq
 hBUq326SK/Su6heJlXHBdUJp4ddB0PBZnbSNlUcyIw39KOvLayr1nmfRr7I/q50vtZdS
 cBdLP+icy9Z5ALxHub/yq9S6AbIqt3ffUk93G5RxvqlH41UtvIi1CcpIioel5VeQ31FO
 +MWm7mOoLG9jzOEXodi7+0cynz4b5Y10o8u4r11kpL5K6O3lMSvPVbvNnfs+pePUoJ0J
 je5trHddards1xLVs2+vlZhduttcoWuKFeB/5uJ+1AekQe+WRkX2sb52pTNwUUzIQdW3
 Xanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fd/M3Ffs7OwceegYsMYGTqbAvT1dTQERp72SccZnPBY=;
 b=aRHERUPBBlkcjGAsuTQ1TVm4lgAmySWUFawlwSM/cdSB/r7mjtLbBAIggwvNDZlGyu
 pO1Bt9W47QvNt0DSLfzSqG7VMvNDUxoISRyD6vmvJGBBqgmUtm3C5jQfrJUdVgwhuMhr
 MQvmt2PGVrYi2LVnHNIjISJdZ+xYThXRhXcRdS6VnfdN26+bL2maG/krm7y/24gnqhKS
 Y1tebl/F7si8kek8aKJrx2fXLtnVbfGCAkeGdFlV7xKLajocQoGAs5s3j5uTKO+RmjTN
 lqyQxg0Ob5Md7XgNWJ2YcWbleUUsa1j0SZ2XXBcYr296v+tYFJLzEeG1jzKlWKGODx97
 bOLQ==
X-Gm-Message-State: AGi0PuaHVY+LeLAk1TNa72KXQnZ4AuOTWqOlzGTTc/A5pWNcAmqxg4j5
 fxJx3cCCJXHfvfXdz2Lfz2w=
X-Google-Smtp-Source: APiQypJ7BqPEg+ekb3cUEqbx6s21kP9AG6R4IzIL1zPHxr4AcZKRRps4r/ApG4naung0Pjzx+NKdkA==
X-Received: by 2002:a0c:f1d0:: with SMTP id u16mr27874790qvl.160.1588074302277; 
 Tue, 28 Apr 2020 04:45:02 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:15d1:d31e:91aa:b702])
 by smtp.gmail.com with ESMTPSA id 205sm13055464qkj.1.2020.04.28.04.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 04:45:01 -0700 (PDT)
Message-ID: <5ea8173d.1c69fb81.915ba.8400@mx.google.com>
X-Google-Original-Message-ID: <3ed7eb87-070c-28ea-4f8a-aa4421cea93a@citrix.com> (raw)
From: Jason Andryuk <jandryuk@gmail.com>
To: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
Date: Tue, 28 Apr 2020 07:44:07 -0400
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428111645.pa6xfs6t6rifu6fu@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <3ed7eb87-070c-28ea-4f8a-aa4421cea93a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: minios-devel@lists.xenproject.org, samuel.thibault@ens-lyon.org,
 Stefan Bader <stefan.bader@canonical.com>, JBeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Andrew Cooper <andrew.cooper3@citrix.com>

Andrew Cooper wrote:
>On 28/04/2020 12:16, Wei Liu wrote:
>>>>> ---
>>>>> I can't get ioemu-stubdom to start without this.  With this, the guest
>>>>> just reboots immediately, but it does that with a non-stubdom
>>>>> device_model_version="qemu-xen-traditional" .  The same guest disk image
>>>>> (cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
>>>>> qemu-system-x86_64.
>>> Ubuntu gcc-9 adds -fcf-protection by default.  Somehow that flag
>>> caused rombios (I think) to restart.  Setting -fcf-protection=none
>>> like below (probably just the EMBEDDED_EXTRA_CFLAGS part) lets rombios
>>> start properly.
>
>All it does is insert ENDBR{32,64} instructions, which are nops on older
>processors.
>
>I suspect that it is not the -fcf-protection= directly, but some change
>in alignment of a critical function.
>
>>>   The hypervisor needs it as well via
>>> EXTRA_CFLAGS_XEN_CORE=-fcf-protection=none and maybe also added to
>>> xen/arch/x86/boot/build32.mk .
>> Are you able to turn this into a proper patch? I suspect you will need
>> to test the availability of this new (?) flag.
>>
>> Also Cc Jan and Andrew because it affects hypervisor build too.
>
>I need to chase this up.  It is a GCC bug breaking the hypervisor build,
>and I'm moderately disinclined to hack around it, seeing as
>-fcf-protection is something we want in due course.
>
>The bug is that GCC falsely declares that -fcf-protection is
>incompatible with -mindirect-thunk=extern, despite me spending a week
>during the Spectre embargo period specifically arranging for the two to
>be compatible, because we knew we'd want to build retpoline-safe
>binaries which could also use CET on newer hardware.

The gcc manual states:
  "Note that -mindirect-branch=thunk-extern is incompatible with
   -fcf-protection=branch since the external thunk cannot be modified
   to disable control-flow check."

https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

Below is what I was preparing to submit as a patch.  So, yes it hacks around
it, but it isn't messy.

---
Disable fcf-protection to build working binaries

Ubuntu gcc-9 enables -fcf-protection by default, which conflicts with
-mindirect-branch=extern and prevents building the hypervisor with
CONFIG_INDIRECT_THUNK:
xmalloc.h:81:1: error: ‘-mindirect-branch’ and ‘-fcf-protection’ are not
compatible

Stefan Bader also noticed that build32.mk requires -fcf-protection=none
or else the hypervisor will not boot.
https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260  Similarly,
rombios reboots almost immediately without -fcf-protection=none.  Both
of those can be handled by setting it in EMBEDDED_EXTRA_CFLAGS.

CC: Stefan Bader <stefan.bader@canonical.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 Config.mk             | 1 +
 xen/arch/x86/Rules.mk | 1 +
 2 files changed, 2 insertions(+)

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
-- 
2.20.1


