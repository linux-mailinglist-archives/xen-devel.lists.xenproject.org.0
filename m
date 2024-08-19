Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E5956E53
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 17:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779803.1189488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg41o-0006ul-Aw; Mon, 19 Aug 2024 15:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779803.1189488; Mon, 19 Aug 2024 15:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg41o-0006ra-80; Mon, 19 Aug 2024 15:10:40 +0000
Received: by outflank-mailman (input) for mailman id 779803;
 Mon, 19 Aug 2024 15:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg41m-0006rU-RD
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 15:10:38 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c475c7-5e3d-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 17:10:37 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8384008482so462802666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 08:10:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838eeedasm650650466b.94.2024.08.19.08.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:10:36 -0700 (PDT)
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
X-Inumbo-ID: 30c475c7-5e3d-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724080237; x=1724685037; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VMFuda9zSuvIUDUpw+NC7ITh36ow+1ODv7nhP9JG8q8=;
        b=Gy0avxay2kMaxjZSFl+Xd+sGDkxMbsaerxCaBGubVLZciLquDsux840bPHpYcQRGyv
         b0E0TpWsN0mZhx0KX/j+VzI8Ka6/ETiJjN8QnYwy1z244Wg3vSTJFcAqjkSEMcrkiVuM
         r+oJLVgc3xP7sBFx5oqk+9lsK3QZN2OwdoV2Io48TnxTGmuDXZRviqj9ji36aj8NHkR5
         qdtpou+1EiVNWOYXFf8/SQwMw3QpbZya2GYnUqaRLAFKgVki3r5A7kYFkUIjALF0hLED
         glFJGw0bjeWLvosV0yuHgl//iDBN6pns3bJ6QsRjdZGIoYaTWAPe1lTO7R9p4zAzAtUv
         vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080237; x=1724685037;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMFuda9zSuvIUDUpw+NC7ITh36ow+1ODv7nhP9JG8q8=;
        b=Jq6jsP+oE+4Tx0QY+nQKc/9rriZuqsVmAW7QHrrLdCMCYtl+J36xLFJrd7frg9Pcxk
         WWWef1Rv3RYLibBlqKT9J/59n0113D0ZvuSS1dvOgwHoEYuCz86eQrn5Jwx0KMbkU0T/
         Eymg8/HXIx/3TljlVU3cLGcijeDUyL9DU0nXmyZ9o6gwV7NiOti2lLMesOGxjzJfwHsc
         sDN/KnJtnpMqzBiITUz+ecd3OJLMAKN4Sn7F/IpJGmXa5UBgDUG0otpzR3VmvLjU6X3+
         /ZcyW4BU02vGhgj9h2ysY3IB+P9k7mnDHdBxZkPa9bxTSgVs8wx54K6rvqjSpcFzNLNZ
         jtlQ==
X-Gm-Message-State: AOJu0Yyc1Peb1audgvuZSTt43g/J7umgdBTjrz6YRRXoHZqrkxIqpQ69
	phhFewvVzMoWp8yszazbYYM+SiDTYkvZE6pH/kADDfFDysahetY8XtOiRyPV9BnA+xmZk5huXKA
	=
X-Google-Smtp-Source: AGHT+IGq5P4uTORkQU0SG5IiFMwLYIdqcDtbRb5Ak3ghjTIY+p3C1uQoIr9RuSP1H/Ru5GOTk+oJ6w==
X-Received: by 2002:a17:907:2d26:b0:a72:5f9a:159a with SMTP id a640c23a62f3a-a83a9fbd306mr589972766b.2.1724080237041;
        Mon, 19 Aug 2024 08:10:37 -0700 (PDT)
Message-ID: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
Date: Mon, 19 Aug 2024 17:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] mktarball: only archive Xen
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony@xenproject.org>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As was basically decided already a while ago, remove - in the simplest
possible way - the archiving of both qemu-s and mini-os from tarball
generation.

With this the subtree-force-update-all prereq isn't needed anymore in
the top level Makefile. That goal, including the respective ones
underneath tools/, then also are unreferenced and hence are being
dropped, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the simplistic approach; I'm sure this could now be done quite a
bit more efficiently. I also expect there's no longer a need to run
./configure ahead of the invocation of this script, but since I have no
idea why it was needed earlier on, I'm not removing that here from the
doc. IOW all cleanup that's probably better done separately, by someone
actually using all of that machinery.
---
v3: Drop subtree-force-update-all rules from underneath tools/.
v2: Drop subtree-force-update-all prereqs from ./Makefile.

--- a/Makefile
+++ b/Makefile
@@ -200,10 +200,6 @@ rpmball: dist
 subtree-force-update: mini-os-dir-force-update
 	$(MAKE) -C tools subtree-force-update
 
-.PHONY: subtree-force-update-all
-subtree-force-update-all: mini-os-dir-force-update
-	$(MAKE) -C tools subtree-force-update-all
-
 # Make a source tarball, including qemu sub-trees.
 #
 # src-tarball will use "git describe" for the version number.  This
@@ -214,11 +210,11 @@ subtree-force-update-all: mini-os-dir-fo
 # src-tarball-release will use "make xenversion" as the version
 # number.  This is suitable for release tarballs.
 .PHONY: src-tarball-release
-src-tarball-release: subtree-force-update-all
+src-tarball-release:
 	bash ./tools/misc/mktarball $(XEN_ROOT) $$($(MAKE) -C xen xenversion --no-print-directory)
 
 .PHONY: src-tarball
-src-tarball: subtree-force-update-all
+src-tarball:
 	bash ./tools/misc/mktarball $(XEN_ROOT) $$(git describe)
 
 .PHONY: clean
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -282,8 +282,3 @@ endif
 ifeq ($(CONFIG_X86),y)
 	$(MAKE) -C firmware subtree-force-update
 endif
-
-subtree-force-update-all:
-	$(MAKE) qemu-xen-dir-force-update
-	$(MAKE) qemu-xen-traditional-dir-force-update
-	$(MAKE) -C firmware subtree-force-update-all
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -206,7 +206,7 @@ subdir-all-% subdir-clean-% subdir-insta
 subdir-distclean-%: .phony
 	$(MAKE) -C $* distclean
 
-no-configure-targets := distclean subdir-distclean% clean subdir-clean% subtree-force-update-all %-dir-force-update
+no-configure-targets := distclean subdir-distclean% clean subdir-clean% %-dir-force-update
 ifeq (,$(filter $(no-configure-targets),$(MAKECMDGOALS)))
 $(XEN_ROOT)/config/Tools.mk:
 	$(error You have to run ./configure before building or installing the tools)
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -127,9 +127,5 @@ ifeq ($(CONFIG_OVMF),y)
 	$(MAKE) ovmf-dir-force-update
 endif
 
-subtree-force-update-all:
-	$(MAKE) seabios-dir-force-update
-	$(MAKE) ovmf-dir-force-update
-
 subdir-all-seabios-dir: seabios-dir
 	$(MAKE) -C $< CC=$(SEABIOSCC) LD=$(SEABIOSLD) PYTHON=$(PYTHON) EXTRAVERSION=$(SEABIOS_EXTRAVERSION) all;
--- a/tools/misc/mktarball
+++ b/tools/misc/mktarball
@@ -1,6 +1,6 @@
 #!/bin/bash
 #
-# mktarball: Make a release tarball (including xen, qemu, and qemu-traditional)
+# mktarball: Make a release tarball (including just xen)
 #
 # Takes 2 arguments, the path to the dist directory and the version
 set -ex
@@ -29,26 +29,6 @@ mkdir -p $tdir
 
 git_archive_into $xen_root $tdir/xen-$desc
 
-# We can't use git_archive_into with qemu upstream because it uses
-# git-submodules.  git-submodules are an inherently broken git feature
-# which should never be used in any circumstance.  Unfortunately, qemu
-# upstream uses them.  Relevantly for us, git archive does not work
-# properly when there are submodules.
-(
-    cd $xen_root/tools/qemu-xen-dir-remote
-    # if it's not clean, the qemu script will call `git stash' !
-    git --no-pager diff --stat HEAD
-    scripts/archive-source.sh $tdir/xen-$desc/tools/qemu-xen.tar
-    cd $tdir/xen-$desc/tools
-    mkdir qemu-xen
-    tar <qemu-xen.tar Cxf qemu-xen -
-    rm qemu-xen.tar
-)
-
-git_archive_into $xen_root/tools/qemu-xen-traditional-dir-remote $tdir/xen-$desc/tools/qemu-xen-traditional
-
-git_archive_into $xen_root/extras/mini-os-remote $tdir/xen-$desc/extras/mini-os
-
 GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
 
 echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"

