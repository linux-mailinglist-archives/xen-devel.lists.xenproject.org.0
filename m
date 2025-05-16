Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3621AB9E89
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 16:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987247.1372661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvvT-0001Pj-MI; Fri, 16 May 2025 14:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987247.1372661; Fri, 16 May 2025 14:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvvT-0001NS-JY; Fri, 16 May 2025 14:20:39 +0000
Received: by outflank-mailman (input) for mailman id 987247;
 Fri, 16 May 2025 14:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFvvS-0001NM-A5
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 14:20:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efcca057-3260-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 16:20:37 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a363d15c64so230155f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 07:20:37 -0700 (PDT)
Received: from andrew-laptop.. ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a04csm2938274f8f.23.2025.05.16.07.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 07:20:35 -0700 (PDT)
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
X-Inumbo-ID: efcca057-3260-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747405236; x=1748010036; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AXw0RKJ1u/9DoUFHhT/Kra6yYROZo8iN46o0ZEu/z0=;
        b=bhApMIk//9gppn2sSJ+2deHOlErLq0htF/d0gv4MoUKVPvljs1owYjCxNKgLG0WraI
         dstraxpYqtb772u/9Gg1gxvTZ1DUe1BU0l3vw/+OHe0ZvF9vUU8DdCAtMQYbucyMMmTK
         sBfsZicLGu9UtVmiiVmx52z7AvgVpr/rcCEiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747405236; x=1748010036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AXw0RKJ1u/9DoUFHhT/Kra6yYROZo8iN46o0ZEu/z0=;
        b=gwidjAXf0XK0/QZUIaUZWTrwNMl07o/2we0uNPn1G9BPRXidC8lLBFb+YUjXY9e1gm
         FQKCUCybV6V006nr/Wyn/IUhoPlcIrVwY2hXETTSfK5+7x5FnaraPE1tK//qj+KpSikb
         +otLux1b0XzU8P/7Jj4tVscQF5oK+UvQ52lU/AgR2F/oBD5Cg7nFg8HmmSYg2N2+4tQD
         NF14/mONfrXwTCszuHzcppoqV7jVZu3L4DvcS+sBwNuj9y+qyETbo9hgxvCAiDL96H8r
         Ke9JASJEwZsedqSn4YzmVW8b/qfPasyE2ntFlqGrOgyDel598XSDL7qBEO4cPgsDwY/B
         82lw==
X-Gm-Message-State: AOJu0Ywl4urC4pZe3UVddw5KVz7rb1rE7fYru7WZjsvj+tNnSqzVO52c
	8cKszq9E6FYr9hjt/xQvJfrTBSvkn3YDMAvT+bdAHK+LDSkbIpUECpkUK7r8V8JNRP/MIu+5O3k
	ZHJhs
X-Gm-Gg: ASbGncux1uKsUZevY/Q56L082HHJffxP+h+qZOgPqXUfDM4X/EHeiOXXjwu7kjSEGm6
	qvXTkZkcrR6vxAcXSN6j1ecshE63xPspG9Ejkw2ewl3n38V8c4NKihWyhtzm7Wbbhip++fX659N
	Ekpag/8jOvFWDqXY+zUGhcbFErRNrwt8GruzW77iocQYXORJZ++BURp8QE546cVEbrs0a9MKdIc
	h0wbtyOntof6U8ZbhybolUfwQH79EjfGKWx6/V8An+0MuOAL1ejhSisPdSkXwdc9hrcCoxghRaR
	l3EpL5YbBZLjoU+6jrCnknl6z1ZxqIPF9XzSKADfvIh1lzlyLiwLfOj5SpgF1IE=
X-Google-Smtp-Source: AGHT+IEmf57B7rUn7ctquoKcCyMZQ/BuWf6Oj0WZzw1I62ESaI/EP7aa9S4jfbnOZudKM/G7E7mZgw==
X-Received: by 2002:a05:6000:2ce:b0:3a0:8c45:d30e with SMTP id ffacd0b85a97d-3a35c82ec75mr4033116f8f.35.1747405236320;
        Fri, 16 May 2025 07:20:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CODING_STYLE: Updated header guard recommendations
Date: Fri, 16 May 2025 15:20:31 +0100
Message-Id: <20250516142031.58693-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Despite the best intentions at the time, the current recommendation
lead to very long identifiers, bordering on the max limit we've chosen
for certification.

One observation is that we do have static analysis which will
highlight if duplicate guards are created accidentally.

Therefore, relax the recommendations and in particular remove the
specific tie to the directory structure.  This has the other advantage
of being more similar to other projects.

This will hopefully mean there's less churn getting the tree in shape,
and a random contributor is more likely to pick an appropriate guard
given no specific knowledge of Xen.

As always, it's something reviewers and maintainers should be aware
of, and to advise on.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 CODING_STYLE | 49 ++++++++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/CODING_STYLE b/CODING_STYLE
index e3b1da604802..5644f1697fc7 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -157,43 +157,30 @@ Header inclusion guards
 -----------------------
 
 Unless otherwise specified, all header files should include proper
-guards to prevent multiple inclusions. The following naming conventions
-apply:
-
-- Guard names are derived from directory path underneath xen/ and the
-  actual file name.  Path components are separated by double
-  underscores.  Alphabetic characters are converted to upper case.  Non-
-  alphanumeric characters are replaced by single underscores.
-- Certain directory components are omitted, to keep identifier length
-  bounded:
-  - the top level include/,
-  - architecture-specific private files' arch/,
-  - any architecture's arch/<arch>/include/asm/ collapses to
-    ASM__<ARCH>__.
+guards to prevent multiple inclusions.  Guards need to be unique, and
+this property is checked by static analysis.
 
-For example:
+Guards should be chosen based on the logical area, with enough
+disambiguation when the same filename exits in multiple locations in
+the source tree.  Commonly there should be a XEN or <arch> prefix.
+The guard should be spelt in ALL CAPITALS, ending with _H.
 
-- Xen headers: XEN__<filename>_H
-  - include/xen/something.h -> XEN__SOMETHING_H
+For example:
 
-- asm-generic headers: ASM_GENERIC__<filename>_H
-  - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
+- Xen headers: XEN_<something>_H
+  - include/xen/something.h -> XEN_SOMETHING_H
 
-- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
-  - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
+- arch-specific headers: <arch>_<something>_H
+  - arch/x86/include/asm/something.h -> X86_SOMETHING_H
+  - arch/x86/include/asm/hvm/something.h -> X86_HVM_SOMETHING_H
+  - arch/x86/include/asm/pv/something.h -> X86_PV_SOMETHING_H
 
-- Private headers: <dir>__<filename>_H
-  - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
-  - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
-  - common/something.h -> COMMON__SOMETHING_H
+- Private headers: <something>_PRIVATE_H
+  - common/something/private.h -> <SOMETHING>_PRIVATE_H
+  - drivers/foo/something.h -> <SOMETHING>_H
 
-Note that this requires some discipline on the naming of future new
-sub-directories: There shouldn't be any other asm/ one anywhere, for
-example.  Nor should any new ports be named the same as top-level
-(within xen/) directories.  Which may in turn require some care if any
-new top-level directories were to be added.  Rule of thumb: Whenever
-adding a new subdirectory, check the rules to prevent any potential
-collisions.
+A good choice of guard is one that wont become stale if the
+driver/subsystem/etc is shuffled around the source tree.
 
 Emacs local variables
 ---------------------
-- 
2.34.1


