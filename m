Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE58855E24
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 10:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681432.1060197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raY4k-0007lu-2b; Thu, 15 Feb 2024 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681432.1060197; Thu, 15 Feb 2024 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raY4j-0007id-Vf; Thu, 15 Feb 2024 09:30:37 +0000
Received: by outflank-mailman (input) for mailman id 681432;
 Thu, 15 Feb 2024 09:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raY4i-0007iX-AK
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 09:30:36 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df411e21-cbe4-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 10:30:35 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so8429781fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 01:30:35 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a125700b007815c25b32bsm448192qkl.35.2024.02.15.01.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:30:33 -0800 (PST)
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
X-Inumbo-ID: df411e21-cbe4-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707989434; x=1708594234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwAnFuF7y1xH9XbRd7r9Y77OMIBU9GS3GWd0lx+S+mg=;
        b=ZDRC4qxEooOOPaLRCRVoBHkXR/DbRiEV7uuIULi6pRH7G1KaqWAUxdOpTO8szndo48
         0EOwUaDepWIH0pdyLjZZ1LbiWsqBZ+5EQnO7Jdq4Cdwk6aVfHRu4ids7O7kKDeAlvxBm
         /qRXBlajVji8OfQwx++CxhmqTCs7/kre+3Y+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989434; x=1708594234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwAnFuF7y1xH9XbRd7r9Y77OMIBU9GS3GWd0lx+S+mg=;
        b=mr2rNvN53jAIwDZtmjOA3mLP/VTP5RPe0+gd7Quoxg9qyxVgBpWge+esmS3VpJ3/Je
         7U400MJNwnhY9UKmDAv9qFIvpf0mDdJM3VgUcdcGD9jJzuqolSU+G2Dr6JiZNIHIz2wY
         ocENINswPSvWUJ2eHq0Gna0uRPI/F9DJd4GkarqS/+q4xcqwMaeF7i/Zblfom4nLef+/
         81At6DnMWnHZkJxrnCHzLMHwbcObaCj9zloiIPfQ3qLcOM0fZ+D+43QxZo3TBoaPBhu2
         MAN/VP2fFFxt3vCqD8/wOJbmHHBEKbDLBLQcokA0V7/hskVn4nnTWHWfxZ2RNFXPRJhA
         t09Q==
X-Gm-Message-State: AOJu0YzXuQxqRPziHEtnbo0bV0DBv3jubgHcGOh30QEquqlva+yN4zvl
	88j2HE2iWys+4/iWOxUdSxJvemvWP6bNQwOf1sSG8onwOpWchflZVxi1cpQO7oK08OgRslUegbK
	r
X-Google-Smtp-Source: AGHT+IFErRneX9Wd5izZFxOx+B7r/2/HoSPI1fndZR8FtA6QVuKvlO3Nt3VsbR2QUOTZn3REYuzrHQ==
X-Received: by 2002:a2e:b6d1:0:b0:2d0:b6fc:addf with SMTP id m17-20020a2eb6d1000000b002d0b6fcaddfmr810088ljo.3.1707989434304;
        Thu, 15 Feb 2024 01:30:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] build/xen: fail to rebuild if Kconfig fails
Date: Thu, 15 Feb 2024 10:30:02 +0100
Message-ID: <20240215093002.23527-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When doing a rebuild with an xen/include/config/auto.conf already present in
the tree, failures from Kconfig are ignored since the target is present:

gmake -C xen install
gmake[1]: Entering directory '/root/src/xen/xen'
tools/kconfig/conf  --syncconfig Kconfig
common/Kconfig:2: syntax error
common/Kconfig:1: invalid statement
gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
  UPD     include/xen/compile.h
 Xen 4.19-unstable
gmake[3]: Nothing to be done for 'all'.
gmake[2]: 'arch/x86/include/asm/asm-offsets.h' is up to date.

Ultimately leading to a successful build despite the Kconfig error.

Fix this by first removing xen/include/config/auto.conf before attempting to
regenerate, and then also make xen/include/config/auto.conf a hard dependency
of the build process (ie: drop the leading '-') and reordering so the .cmd
target is executed before including the configuration file.

This leads to the build properly failing if the config file cannot be
re-generated:

gmake -C xen install
gmake[1]: Entering directory '/root/src/xen/xen'
rm -rf include/config/auto.conf
tools/kconfig/conf  --syncconfig Kconfig
common/Kconfig:2: syntax error
common/Kconfig:1: invalid statement
gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
gmake[1]: *** [Makefile:379: include/config/auto.conf] Error 2
gmake[1]: Leaving directory '/root/src/xen/xen'
gmake: *** [Makefile:143: install-xen] Error 2

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Maybe there's a better way for dealing with all this, my makefile foo is very
limited.
---
 xen/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 21832d640225..7e6860a58a1d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -358,10 +358,10 @@ config: tools_fixdep outputmakefile FORCE
 else # !config-build
 
 ifeq ($(need-config),y)
--include include/config/auto.conf
 # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
 # changes are detected.
 -include include/config/auto.conf.cmd
+include include/config/auto.conf
 
 # Allow people to just run `make` as before and not force them to configure
 # Only run defconfig if $(KCONFIG_CONFIG) is missing
@@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
+	rm -rf include/config/$*.conf
 	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
-- 
2.43.0


