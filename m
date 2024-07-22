Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F6A938F55
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761899.1171951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsTB-0007Nu-T5; Mon, 22 Jul 2024 12:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761899.1171951; Mon, 22 Jul 2024 12:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsTB-0007Ks-Q4; Mon, 22 Jul 2024 12:48:49 +0000
Received: by outflank-mailman (input) for mailman id 761899;
 Mon, 22 Jul 2024 12:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVsTA-0007Km-DJ
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:48:48 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbf6ff21-4828-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 14:48:46 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77e2f51496so431863566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:48:46 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7bda1dsm419337366b.63.2024.07.22.05.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 05:48:44 -0700 (PDT)
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
X-Inumbo-ID: bbf6ff21-4828-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721652525; x=1722257325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IVvMuKY54fmNQoBGumDjtVtDu5OeDg/8aXNZuHjhyA=;
        b=VQXSj4D119kheunqdSdOwZ7Z58S4haTij8ysii4ULP29NGxe28tupTJJAlIc4qXQhK
         EQWaiwpRNJY6MGF4FSe0+iypF8jRDOmmbV8KqoPHhhnGaGL+MKmx9RIJlkkECbhEWFUN
         b1cDci/MwfXv1DVPV7FvIcVzAMk9Fm+YbEg2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721652525; x=1722257325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IVvMuKY54fmNQoBGumDjtVtDu5OeDg/8aXNZuHjhyA=;
        b=srE11ekwg8yR+9Prqh01f3kb9xM7+5YF8GGEiPtlGQIYqszPQMK7vH1K2LZ/inluBn
         UrBYEBRAJ4ffq9jLznVM2SH9HDQ0Z5r8Qb4IpQmvb3O5U20Boz+hh/fDMUM3iS6cLJaz
         gNNuIXCjbIBai5GZSiN4Fn255VhPoeM6XljC+kRMd89qBekyYJvuWqWy/flEEiOAdJ/o
         yC6+BZfm7f3/wqBdvXab7vEK8RoV6BHxtCC1bqxcMcTcIjXL/eLAdw+FnHro9tsXZlsH
         7Bam7i3uJDbZ0YorE6rmptDR+et6OKALMoSgEwwRq3KJnxhGDj6/7LfBBiOU3TGaMHiD
         Mh9A==
X-Gm-Message-State: AOJu0YwfAD5vUWtWc9+pYerdiMAQyPJD9R9yGr7zjlob7787iy5FoAV3
	5Nkvt/KR/2YywQqgKRmhfC8SePjQcrfOl5Dz5bHWl2M0sUXhUrScXIXf/L5nVG/JZV/dtorE0C2
	1
X-Google-Smtp-Source: AGHT+IEwbsiQ4lwVaxjT+mjNSj3kl0UCcYZ91Ak7hXxJrCeYzlBhK+zGClYeCh6cORGJjHHwYlGonQ==
X-Received: by 2002:a17:907:94c9:b0:a77:b052:877e with SMTP id a640c23a62f3a-a7a4c011377mr485576266b.19.1721652525190;
        Mon, 22 Jul 2024 05:48:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen: Fix the figlet banner
Date: Mon, 22 Jul 2024 13:48:42 +0100
Message-Id: <20240722124842.4039445-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

4.20 is just wide enough to cause figlet to split the banner onto two lines:

   __  __
   \ \/ /___ _ __
    \  // _ \ '_ \
    /  \  __/ | | |
   /_/\_\___|_| |_|

   _  _    ____   ___                     _        _     _
  | || |  |___ \ / _ \    _   _ _ __  ___| |_ __ _| |__ | | ___
  | || |_   __) | | | |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
  |__   _| / __/| |_| |__| |_| | | | \__ \ || (_| | |_) | |  __/
     |_|(_)_____|\___/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|

Instruct figlet to use 100 column width, rather than 80, resulting in:

   __  __            _  _    ____   ___                     _        _     _
   \ \/ /___ _ __   | || |  |___ \ / _ \    _   _ _ __  ___| |_ __ _| |__ | | ___
    \  // _ \ '_ \  | || |_   __) | | | |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
    /  \  __/ | | | |__   _| / __/| |_| |__| |_| | | | \__ \ || (_| | |_) | |  __/
   /_/\_\___|_| |_|    |_|(_)_____|\___/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|

While fixing this, also fix a rendering error in the non-figlet case; while a
leading space looks better for figlet, it looks very wrong for the simple
one-line case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/build.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/build.mk b/xen/build.mk
index 0f490ca71be1..942ff3867fdb 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -1,9 +1,9 @@
 quiet_cmd_banner = BANNER  $@
 define cmd_banner
     if command -v figlet >/dev/null 2>&1 ; then \
-	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
+	echo " Xen $(XEN_FULLVERSION)" | figlet -w 100 -f $< > $@.tmp; \
     else \
-	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
+	echo "Xen $(XEN_FULLVERSION)" > $@.tmp; \
     fi; \
     mv -f $@.tmp $@
 endef

base-commit: ff652ed5dcd797a46c84258255dfd429ae68a2d6
-- 
2.39.2


