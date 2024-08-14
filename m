Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF19515B5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 09:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776774.1186940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se8ei-0007xi-PV; Wed, 14 Aug 2024 07:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776774.1186940; Wed, 14 Aug 2024 07:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se8ei-0007vN-Mq; Wed, 14 Aug 2024 07:42:52 +0000
Received: by outflank-mailman (input) for mailman id 776774;
 Wed, 14 Aug 2024 07:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se8eg-0007vE-RB
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 07:42:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc58bb0d-5a10-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 09:42:46 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so6621850a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 00:42:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f49748sm138175566b.4.2024.08.14.00.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 00:42:47 -0700 (PDT)
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
X-Inumbo-ID: cc58bb0d-5a10-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723621368; x=1724226168; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y/gyX1MM3nNF8bRTN/QZSJAiytvPzO3GDCG2xKUr4Mw=;
        b=ZPjh86OMlYFDwy1/dg8TlyJW+pby38pLcDNTTlSPSy8O0IWsMbm/O0VkwxurOXeuYP
         P2pNo+AlkYfDgkhhYamAa7CwX3/KrYI5Jnc+Uh3aZXBNy6gRllJGets2n7ok+yJfvJDC
         iw+TgV6MUq0WClfSGaqs1FV0jxWnIBmVEbqK0VsQWjK63VyUpjE4UoHctBfYaO/wUyb1
         54CtqhyADc4nRODlDifBiRnunKBzWZDLdsH1lJftC3StsZZ4i0NeF8m3cdoeWjUfYj+z
         JLoPlBofTJCEMoFc/i4Cxn2xCRwO8QethIHJOF3XkCUUQE4DVgiZh1qEn1wsymfDBWbC
         e1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723621368; x=1724226168;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/gyX1MM3nNF8bRTN/QZSJAiytvPzO3GDCG2xKUr4Mw=;
        b=sv41nucyIs/hnAeqClnSHjy6vUwOAGy3ITVZK800XZiFuxLkGSlbCm09RRltiJeO3q
         JignBnA9VoA5kcH21A5q4fa3EoQku1nW+GgqX93FAo9xAXkDHP4f2f+ato9mTYyBaG3b
         3zEw0Tn+PQwj/9naN/mO6zjLVt9xBkMU2nbt5inav7/PFAhPSeVy8f0xUVBGHf1qw3Yp
         hAzF6V50ZjLlV2J2CI0uVDxC+jnpWc+ErCuYlxBdsPHxbEvJOngmbyL+84eo1FUrmvGJ
         PM9bekwu9VcaiIDyAUZk9E6WqXzOX7U3dZ1r0IJpaDbsD/3FtvxY6Ga1GR0E3R7ssUxK
         uoqw==
X-Gm-Message-State: AOJu0YxNpyNV5SITb1bp8MwICS98nUCbIpE44LrZmzzxxxU9YbGH7JRh
	KcR30ivagYoyasO1uUu2KnKjew+ehYW0lv1gjSiqoAzmipmi60EWxDze0oylEoRc0cxxbRNYY6M
	=
X-Google-Smtp-Source: AGHT+IEkTUg7rrTpins5N+V8LrVxYNViyw9829GXS1IMeeKwdbw+qf84rkJVeuF6A0z9KlOnqoXf7A==
X-Received: by 2002:a17:907:1b19:b0:a7a:b9dd:7757 with SMTP id a640c23a62f3a-a8366c1ecb1mr118482666b.12.1723621368079;
        Wed, 14 Aug 2024 00:42:48 -0700 (PDT)
Message-ID: <5d8c1cf6-71cc-4c1b-b2cc-2b9ff4829c04@suse.com>
Date: Wed, 14 Aug 2024 09:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] mktarball: only archive Xen
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
the top level Makefile. That goal the also is unreferenced and hence is
being dropped, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the simplistic approach; I'm sure this could now be done quite a
bit more efficiently. I also expect there's no longer a need to run
./configure ahead of the invocation of this script, but since I have no
idea why it was needed earlier on, I'm not removing that here from the
doc. IOW all cleanup that's probably better done separately, by someone
actually using all of that machinery.
---
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

