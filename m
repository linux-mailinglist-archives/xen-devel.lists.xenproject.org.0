Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83B8CB2AD
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 19:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727005.1131386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5c-0004YV-T1; Tue, 21 May 2024 17:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727005.1131386; Tue, 21 May 2024 17:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5c-0004Wo-QF; Tue, 21 May 2024 17:15:52 +0000
Received: by outflank-mailman (input) for mailman id 727005;
 Tue, 21 May 2024 17:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryb1=MY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9T5b-0004Wi-NL
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 17:15:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5c0deab-1795-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 19:15:50 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5dcb5a0db4so404610666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 10:15:50 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01a2esm1633701766b.185.2024.05.21.10.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 10:15:49 -0700 (PDT)
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
X-Inumbo-ID: c5c0deab-1795-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716311750; x=1716916550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xre9RWfCvvSejwmBrpN5O2Au/2lcj4lXEzwU2TKx8s=;
        b=NHl8XBNs+NpkbvW2OSivpcXX7oobqX1jIFBj7MtmCEwkfVvaU9JGefIL3S9IYENjIr
         lZ21RBTk6KOygtWUh9i27fTTVE48pQ8m6E7US8LSHcCg3uZsOpA5flbK0USaQIHEKu5J
         WtndthGjRMGzIVMG6bWI72gS0nMnWL1hNGmdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311750; x=1716916550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xre9RWfCvvSejwmBrpN5O2Au/2lcj4lXEzwU2TKx8s=;
        b=Z0MP9U4Xdbfp5f3A5CqrlABc3byh1kOLjL6tKmj4vvRB+CgHlB6BfrTzRy9QKWnj/W
         c05p0nCagOhZVwbhPRF3FPfW+EhgkpLdWiLZVVb5NZ+yYhkBxd01frf+Oi7iTCmciXOs
         xbInfIJuLgXRqp2+t7ZbjEVInzrFsD5Hxir3vjJgGS3V0ThHLe1XJXooHts/HueBaV+h
         q0vrvdkO+C4OUJ+s8mxCxbPOc3ZSU4zOC2bi+GSL6VY8tRNsL4n1pEIPPvn5gznnJKBp
         PyMJ5ARKKmanrL36Ipne46QK7OO9jpWB/gogLPeWF2quB0gsw+B8OtgAGUMWIoB+OZzg
         M5Vg==
X-Gm-Message-State: AOJu0YyBjngGl03hAa/Bttjwsn3CsovQpDLC/+Exgw/EzbU9tfCRsFQO
	eEV0psyJwYn5GcFA76KE7mN8c6cDv82/SkWh2lOdMfHcljPXxRdtTXwUkhVzMmQuPGUQLHyBQgP
	k/6s=
X-Google-Smtp-Source: AGHT+IEhtyMTNMWgnZK6GROuUOFWw3ho9OlQvrwrcHF4ju1TyXX42MZdTruLhkvfEeP74xu7vxz3Lg==
X-Received: by 2002:a17:907:d22:b0:a59:aa9d:3142 with SMTP id a640c23a62f3a-a5a2d5cb794mr2650121966b.37.1716311750021;
        Tue, 21 May 2024 10:15:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 0/3] xen: Misc MISRA changes
Date: Tue, 21 May 2024 18:15:43 +0100
Message-Id: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Misc fixes collected during today's call.

Andrew Cooper (3):
  xen/lzo: Implement COPY{4,8} using memcpy()
  xen/x86: Drop useless non-Kconfig CONFIG_* variables
  xen/x86: Address two misc MISRA 17.7 violations

 xen/arch/x86/alternative.c        |  4 ++--
 xen/arch/x86/include/asm/config.h |  4 ----
 xen/arch/x86/nmi.c                |  5 ++---
 xen/common/lzo.c                  | 11 ++---------
 xen/include/xen/acpi.h            |  9 ---------
 xen/include/xen/watchdog.h        | 13 +------------
 6 files changed, 7 insertions(+), 39 deletions(-)


base-commit: 26b122e3bf8f3921d87312fbf5e7e13872ae92b0
-- 
2.30.2


