Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A4944F99
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 17:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769820.1180696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZY0q-0004yG-59; Thu, 01 Aug 2024 15:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769820.1180696; Thu, 01 Aug 2024 15:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZY0q-0004wO-2W; Thu, 01 Aug 2024 15:46:44 +0000
Received: by outflank-mailman (input) for mailman id 769820;
 Thu, 01 Aug 2024 15:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZY0n-0004wI-Ug
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 15:46:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df69f1f-501d-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 17:46:39 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so430464966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 08:46:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acac63795sm922091966b.95.2024.08.01.08.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 08:46:38 -0700 (PDT)
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
X-Inumbo-ID: 3df69f1f-501d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722527199; x=1723131999; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0AdGzIYtGy1+3Ykuc13cBM0Lq0WYYcBrKl57sNtIJM=;
        b=IAqw5APk8mkh2zJdQWEjj0ZUsHn3ctZmzpMEqDAC7nk56WdfQinavBg8dTO6mtSiNB
         Zjp5XWLUPOYiNMiGwY3TArrOgEvWbVu0R/JfSIn4nmpi3Y6obfxKEq65rFm/ACC2/YdD
         gFdmULkuZQ1To9uPnPJenItZeeLUDFgc3wwWMa6czzbTJHxPBA95OXqYtENyXQ3I460v
         q9kFkdBI8QCWbLVwrLKHdGfHSrYMRQWWXLOSOy4Mqxiu6O6kqSGeupTNqgY20CuV+sg4
         qX81IcoxOepHHxUedS0usS10V351DvCWW6kgI0Efa3+PVI7gOjzgGlWhAY4xPDsRZQ3L
         KV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527199; x=1723131999;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0AdGzIYtGy1+3Ykuc13cBM0Lq0WYYcBrKl57sNtIJM=;
        b=rD3t7Ot5wmPd88CQ7PYcDDqDW2fm0j4HlIqcazP1a7nngY4XzAZqd4Ft0rTnrtEp7e
         FujDUx2epw0LVmymUXn/PF8MQ/1v8QFkZeD5+J17y6W/475eGvUKQCf5wORHxkg4/5in
         scaBQSQcrQ8Lt+ImqMhGivRAnlCr6EeFR4+a8p07JcRsktPR3SUpdg9U+IwjXQWRY4Vd
         MuSbmfah39DwV0KFvyyS5U2aNTGs3fxZNh6mFi9id3R4uyiAB4Phcf1SXhSeOGj/6cLF
         o4sxA6I/lOHIZ6arQlu1SNbTgnCfDqMqbO96tiA+AmmYzzMwc5iS+bPD1LTohXarIUzK
         6KdQ==
X-Gm-Message-State: AOJu0YzKesyy4sF6mH/A/ppD2rFb2YCREXFR82WChvryDHY0xT4xr379
	L5JbVBxxYhpX35NksammVe451ANoTXmpWW1FYj92ayFRaZQWWo1wUGncTpUHjev6Y8I5JERufU8
	=
X-Google-Smtp-Source: AGHT+IGn6Fq3QUlyr+OIzWQOkig+HIvNeN5H53n5nCQwhu676hKRt5d7Pyk+TrvHdZUr/EPEQD3j+A==
X-Received: by 2002:a17:906:6a11:b0:a7a:b43e:86e4 with SMTP id a640c23a62f3a-a7dc4e68c0fmr55620166b.27.1722527198874;
        Thu, 01 Aug 2024 08:46:38 -0700 (PDT)
Message-ID: <cf280800-d0d6-4493-933f-f83f418dd91d@suse.com>
Date: Thu, 1 Aug 2024 17:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] mktarball: only archive Xen
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

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the simplistic approach; I'm sure this could now be done quite a
bit more efficiently. I also expect there's no longer a need to run
./configure ahead of the invocation of this script, but since I have no
idea why it was needed earlier on, I'm not removing that here from the
doc. I further expect that the subtree-force-update-all prereq could
also be dropped from the two involved Makefile goals. As that
intermediate goal isn't used for any other purpose, the question there
would be whether there's any reason to retain it. IOW all cleanup that's
probably better done separately, by someone actually using all of that
machinery.

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

