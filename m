Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B44A54E6B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903668.1311635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfW-0003Nv-KK; Thu, 06 Mar 2025 14:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903668.1311635; Thu, 06 Mar 2025 14:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfW-0003Kn-HU; Thu, 06 Mar 2025 14:57:50 +0000
Received: by outflank-mailman (input) for mailman id 903668;
 Thu, 06 Mar 2025 14:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tqCfV-0003Kh-VS
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:57:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e7006ee-fa9b-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 15:57:48 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e5b56fc863so1040226a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 06:57:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e5c766a5bcsm1047165a12.52.2025.03.06.06.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 06:57:47 -0800 (PST)
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
X-Inumbo-ID: 5e7006ee-fa9b-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741273067; x=1741877867; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9okKGy1Ukh5/aWvO8oi8GhhT5BkRrsj5qYA0OFbWio=;
        b=W1YE89Csxx4CnAPuvNwk1aWPLQpIZbe0c29rHAsjnO0olPLrYotlmhS9noZcmxfqgB
         sXd1fkVU3OLhkrfOgGo+m4A1yk16zRQdC7nl5hLX6jlLensP/KQDTzHYJPNDKzvSf/Bz
         nHJUMLBzpdy+1RkMh18H6XIgO0RtOvkqCXcIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273067; x=1741877867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9okKGy1Ukh5/aWvO8oi8GhhT5BkRrsj5qYA0OFbWio=;
        b=bqnygNlG1ELHwcZ6nzhYoIrSMqRFLvkvWzqVsnEnP7ikxBh+nugtN7AbOFFy+b4COJ
         31YSozPDyhZUTcy8/BxGkr9C4geNJlHlcMXK9dAS0azMEJ7yw4bfBXLrqYYQTqCgwKbA
         U0YWNSoSMfP19A/kVNYDR9CCybFWofOa5ZD4UjPygF/xN446NJfSgIbvVMQQafoZP3gy
         YVnpmS4SDaynYHEeUwsyHLYua3qhnoA/bEp2dviz3Es7Cqlg+5Ze2y2bPQ/MJrDdM75s
         k4Jsnq9Z22Ye2WuS8wMg+F02swQ8GmNpe6TSJbTeZwyYXugAdl56LrKz3cxzIEljm4cR
         XCKA==
X-Gm-Message-State: AOJu0YzCbAK6K8KRXni+Leqfw3t+GgvP99EMdmxJvmTRAgagfpnchwn1
	gr+d4k8wITXLT2+ZkoAGJs15XYnCktfToKP0d8MKT5gmKReXzWAFZngKBsyWDTnhgn9DsNi1EiG
	/
X-Gm-Gg: ASbGnctk609D51JzDPjzLBpKzeQF0ttZIvLXrUP+50Ii05rGNFmZLMzyd8zONQFRzAH
	i2HJPnyg1nHmZCSEcLOLCxDkAevrL5iNoNy87Oxgwzel7XPTL/ZOwzPbjubHuozBCs/1ft7FgMr
	BXq9ow4w0iM54c51Zspt+49nBUGzHWadQsh+3czl43NJCaiR+Yf9w5J7N8bd8jV8+MCWGmkZO21
	XSlu/dGRWgQ6B1tuyA8zXkkxUXNPM5oaDxFqetuTM/IUqaB4qJdZnCRanyNIJYaC/9NTgTcccPa
	5Js9hEtUyQvvUmVM0uL9bg4E0z0kS+wmgddZwfH+gP/eVQ4NHw==
X-Google-Smtp-Source: AGHT+IEkz9hMV9atqNruizRKMDeVwQ7L2bHip7C6XoVxwsBwbg9VwJKZy+YkOStro/VgiJnBf6+bVw==
X-Received: by 2002:a05:6402:4405:b0:5e5:bfab:51e with SMTP id 4fb4d7f45d1cf-5e5bfab11aamr4759004a12.0.1741273067589;
        Thu, 06 Mar 2025 06:57:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 0/3] x86/pci: reduce PCI accesses
Date: Thu,  6 Mar 2025 15:57:30 +0100
Message-ID: <20250306145733.99927-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch is not really related, but it's some cleanup I've found
while looking at the other fixes.  Patch 2 switched dump_msi() to not
rely on the cached MSI message, and finally patch 3 changes the logic to
prevent re-writing the same MSI message.

Patches 1 and 2 are new in this version, and have no changelog.

Thanks, Roger.

Roger Pau Monne (3):
  x86/apic: remove delivery and destination mode fields from drivers
  x86/msi: don't use cached address and data fields in msi_desc for
    dump_msi()
  x86/msi: prevent MSI entry re-writes of the same data

 xen/arch/x86/genapic/bigsmp.c       |  2 -
 xen/arch/x86/genapic/default.c      |  2 -
 xen/arch/x86/genapic/x2apic.c       |  4 --
 xen/arch/x86/include/asm/genapic.h  |  5 --
 xen/arch/x86/include/asm/msi.h      |  5 +-
 xen/arch/x86/io_apic.c              | 16 +++----
 xen/arch/x86/msi.c                  | 73 ++++++++++++++++++-----------
 xen/drivers/passthrough/vtd/iommu.c | 11 ++---
 8 files changed, 62 insertions(+), 56 deletions(-)

-- 
2.48.1


