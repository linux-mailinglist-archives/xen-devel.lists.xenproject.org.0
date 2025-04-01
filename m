Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3141A77BCE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934201.1336009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPb-0007jm-LX; Tue, 01 Apr 2025 13:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934201.1336009; Tue, 01 Apr 2025 13:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPb-0007gq-Ha; Tue, 01 Apr 2025 13:12:15 +0000
Received: by outflank-mailman (input) for mailman id 934201;
 Tue, 01 Apr 2025 13:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMY-0008KU-L5
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:06 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d87fe32-0efa-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:09:06 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso5614074a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:09:06 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edc16d5077sm7044407a12.32.2025.04.01.06.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:09:00 -0700 (PDT)
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
X-Inumbo-ID: 7d87fe32-0efa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512945; x=1744117745; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZxBOQSFyBxeOjrMoPK4/0WOsmdYg4n3s13OFZoBbPU=;
        b=YiCO8ulVsFFFvFuU6WtuBxTveEgQd1mmsQ7Hll5Tag/ki+HU/HC/WNSUfAkf2rMr7w
         ID1LngUaHVfoYuuel6vFaOyk+J3L9ZowlBcnDjWgo/ds+yeyKcYQdzGOPUWX6VpVkn7t
         9rpNOkyDBya8ixHmoC2N3VxgmrpKyrKPrOMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512945; x=1744117745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZxBOQSFyBxeOjrMoPK4/0WOsmdYg4n3s13OFZoBbPU=;
        b=Ix1qikTl+TAp15IxTHfCXJiChcaPweQwtml083pOjHjURqdIGjvizw316E38r8JqBa
         xMzlC08Dwh+9EU3FUuVM7tE0+0FkqIALSxlFQFI+rV4vFu5NRriBWQR6rlXXmtyLJwjQ
         sWe58UZsMavZaqO/UK/4EATF20JDYodPNmzIs8tavEcLesgoyu8PJOJFhMyy+4H4tOmo
         J/f7gep9oSMFUDmu8L1qbg78I2KJLJsEfk0r557v19L0oPKak9NccP8+HPZbVNWBQgbN
         M3+GHc93iivTguLGIt5LNexzqVJcw4Ux9Jym5PO+W+VBllVILY/ih3cZV3dm7OiAZPi0
         DAoA==
X-Gm-Message-State: AOJu0Yze5qh7NP083mgsmRpTAysleNpiNP5/jJJCG6LKWe2IBU9mCumG
	l2CzPfac4+7kKy7WA2z/wg9Nhv1rpFPtaBsvkNkgmrYT+nQL31ztSr0uSZUqXw5sYbfmn2Y90om
	X
X-Gm-Gg: ASbGncurXRwsOHt+EE/NrpteXEIIZKndn6OWLC1jSuJtqKfMLIV80nNSUytLyPhWfmB
	I/B/Mr6sED+fcH5gqAvaJNTE3yL3ceiskyrIHo1g8A9QW851Gr8Ekx6ssdZW8F7G+Kug4E/vc/r
	S52PUNW2LZMYefeQ2voe8f+CY8+WJENwGRFoxZC+hoQAf5MNFv42g2+Gew+PP2r8XVmrWIAZQUg
	40NWNJcM/mbxVoZL7P/WhYsiv+wq5Q8bViwlVmaWpl/1QBCpNGzmMvWbuXsnG1UvUrzsEukmLm2
	P+FNXTgx1hvENKJOHn2lOZREVuAxHrWRnOFoICM6eL3WkihyNA==
X-Google-Smtp-Source: AGHT+IE/BKGYvhgZRW5pouc3MtVys3s9WDTS+gmscGkaRwz0gTdBrRfVUs0dYAvq+MEuHWARTmvC6g==
X-Received: by 2002:a05:6402:2b8b:b0:5ed:994c:7e75 with SMTP id 4fb4d7f45d1cf-5edfd9f7c9emr10260312a12.24.1743512940814;
        Tue, 01 Apr 2025 06:09:00 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 08/11] x86/boot: place trampoline code in a non-execute section
Date: Tue,  1 Apr 2025 15:08:37 +0200
Message-ID: <20250401130840.72119-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The trampoline code is never executed in the position placed by the
loader.  It's first copied to the low 1MB, and always executed from
there.

Move the trampoline code from being in .init.text section into
.init.data, so it's not in an executable section.  This allows applying
the relocations safely against a non-executable (and thus non-read only)
section, and then copy the relocated trampoline to the low 1MB.  Note
that the trampoline code is placed on an .init section, so zapped after
boot has finished.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
An alternative approach is to apply the relocations after having copied the
trampoline to the low 1MB, but that still generates relocations in mkreloc,
which is not helpful for the goal of having no relocations applied to
read-execute code sections.  This approach however places code in a data
section, which might cause issues when debugging it.
---
 xen/arch/x86/boot/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 774894954e44..f5a2d08d0d0e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -709,7 +709,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
-        .section .init.text, "ax", @progbits
+        .section .init.data, "aw", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
-- 
2.48.1


