Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C2F58E692
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 07:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383326.618511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwa-00062A-Lj; Wed, 10 Aug 2022 05:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383326.618511; Wed, 10 Aug 2022 05:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwa-0005yq-IT; Wed, 10 Aug 2022 05:07:48 +0000
Received: by outflank-mailman (input) for mailman id 383326;
 Wed, 10 Aug 2022 05:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CIQX=YO=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oLdwY-0005Qe-Nq
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 05:07:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f10a15b-186a-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 07:07:46 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id gb36so25648268ejc.10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 22:07:46 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826504800504e9aff21bf95aa.dip.versatel-1u1.de.
 [2001:16b8:2650:4800:504e:9aff:21bf:95aa])
 by smtp.gmail.com with ESMTPSA id
 ew12-20020a056402538c00b0043bbbaa323dsm7009781edb.0.2022.08.09.22.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:07:45 -0700 (PDT)
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
X-Inumbo-ID: 5f10a15b-186a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=bCpmS8+/1egQCooQQ3as3vVr8d5Z062qoLdPw2AMxfk=;
        b=Ws0xIKbmOrSvv/GU3aU4TtHDjsGwi+4skIXyJw1BB+aefIIdDylvwl0J33PfZddEEa
         cY7EIfT1zmqNkz600Slda0hXQmBlzKpV4vuYYKTfHpTlxAVm2JJM7+JSNeNeXMcY53WA
         gKyAZsDBJy0O27RxhqyDKd9oEf/UCClgw/3dTvFesuPv/n/lcO4ZbhOzG1+RXc0vcpNM
         qQHVWNT1KDJ3++qnF0AJ9TX5xfO+TZYYoC/jjoAtfF+qxRAYpCpk3EjU+kh8/fiVPXI4
         KQW6MG4hh2wIcyiNYXkP7F8p5wSaXuNYH83KuLRYE0Po0OlLVusocwqAmLD5EHKP/xAZ
         ji2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=bCpmS8+/1egQCooQQ3as3vVr8d5Z062qoLdPw2AMxfk=;
        b=fvW4RvSgrjNr6ZJ0AQSGr16iH7YWYB1jwLIJXo70B0QSWAEWpB7QD3ui4LTfCeLsTB
         DkUp26NUxmT+zulVSv3ORusXTNfIesbNMVsi0wDmgF2OmmfT6v8xiL9M0WrSjfI50pw+
         9j72Fk+LY6cbUGeh1Gu3u69Dzn05NCO94M+uPkEhS+2qM2e6Td44qSOcdq03uTaLF/Ij
         CMJv2VCwZSDemDmQrB4BSr6TGa6deuRCBtz0koLlQZ2JWKhkzpGhecXSs77RmSXPs/fY
         lrELsmgy+MToHVzYQVSEEHwmKc16Rt7EzqGrJwlPGjML2Jha3FBBtxp/BFferAwu1GFU
         M3KQ==
X-Gm-Message-State: ACgBeo1Fbim1mhxGbiRNcd5j8V27qp1LI35/mEqNCoIp+c92dV9xTId2
	/icJvQgICNrV3I5HVFRIPAs=
X-Google-Smtp-Source: AA6agR7A6pJB4+cJg9xZ39GJFciYKDsagwONe95BcFa0P2gL4hJaNt7U60kSZRtiOudoecQhFipbpA==
X-Received: by 2002:a17:907:6da8:b0:730:8ed5:2df8 with SMTP id sb40-20020a1709076da800b007308ed52df8mr19323388ejc.75.1660108065630;
        Tue, 09 Aug 2022 22:07:45 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 3/4] xen: move XEN_BALLOON_MEMORY_HOTPLUG to generic config
Date: Wed, 10 Aug 2022 07:07:11 +0200
Message-Id: <20220810050712.9539-4-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>

While reviewing arch/x86/configs/xen.config, I noticed the following
note in this file:

  '# depends on MEMORY_HOTPLUG, arm64 doesn't enable this yet,
  '# move to generic config if it ever does.
  CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y

Commit 6c6685055a28 ("kconfig: add xenconfig defconfig helper") in June
2015 adds this note. Fortunately, commit 4ab215061554 ("arm64: Add memory
hotplug support") from December 2018 adds the memory hotplug in arm64, so
the precondition of this note above is now met.

Move setting the config XEN_BALLOON_MEMORY_HOTPLUG into the generic
xen.config now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/x86/configs/xen.config | 3 ---
 kernel/configs/xen.config   | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index 8a6c88f48e75..024817bc4f0e 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -23,6 +23,3 @@ CONFIG_XEN_ACPI_PROCESSOR=m
 CONFIG_XEN_PCIDEV_BACKEND=m
 # x86 specific frontend drivers
 CONFIG_XEN_PCIDEV_FRONTEND=m
-# depends on MEMORY_HOTPLUG, arm64 doesn't enable this yet,
-# move to generic config if it ever does.
-CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y
diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
index 436f806aa1ed..ea84d5b3122d 100644
--- a/kernel/configs/xen.config
+++ b/kernel/configs/xen.config
@@ -34,6 +34,7 @@ CONFIG_INPUT_XEN_KBDDEV_FRONTEND=m
 CONFIG_XEN_SCSI_FRONTEND=m
 # others
 CONFIG_XEN_BALLOON=y
+CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y
 CONFIG_XEN_DEV_EVTCHN=m
 CONFIG_XEN_BLKDEV_FRONTEND=m
 CONFIG_XEN_NETDEV_FRONTEND=m
-- 
2.17.1


