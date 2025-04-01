Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4900A77BBE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934116.1335969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMV-0001hJ-Dg; Tue, 01 Apr 2025 13:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934116.1335969; Tue, 01 Apr 2025 13:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMV-0001be-70; Tue, 01 Apr 2025 13:09:03 +0000
Received: by outflank-mailman (input) for mailman id 934116;
 Tue, 01 Apr 2025 13:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMT-0000Od-9s
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a8e624-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:08:59 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so982517566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:59 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac71961f0e9sm766309366b.101.2025.04.01.06.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:58 -0700 (PDT)
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
X-Inumbo-ID: 79a8e624-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512939; x=1744117739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eaji7nWfNm9j69tZV5bRL2oO0fL1lVBczAnwU7AW6j8=;
        b=Ty5wJy1ey/X8Hh+lhVbhCdO2jqlU4i2iinCjw0NVNgGwLDPJ02YNG/afzjuJFNbJ28
         Cv9ab+fkbKA7/iV4S6Vvo2XwYZLszMwl++KBwZjp3zq+j56sFi1g7w+VnaXgfWql0HiE
         dcW2Ft5h2T6vPSnQ8eZCiYlRGc02yhKSWQebI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512939; x=1744117739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eaji7nWfNm9j69tZV5bRL2oO0fL1lVBczAnwU7AW6j8=;
        b=J7far2vTxLEKL/4GujufO6JGwl9b97RE7XHaYmQBgZVs5ZFeXNuT72xfaEHcDnajz3
         QXHMX2L3n+/tXo+LsENF1+U5yVs/AHQnz39xMz6/fMD78kgxHAalxm8VMYrH4t36CrC6
         gy7+MX6JPMK0MzTxrsTaqxrG2MEm0pVLj9LORdMwymEA5aoTLKsOxnAW2wH9REnCmXTg
         n4PfaqGA6oe2GecBoNd9vKGREU71tL7/j+5J4Dmux+5uKa8fu02pf5hd+GYpC/0KVuG5
         qD/Ijr9gMRGDFVu1pYZK+VHRm8mQbAxPV03EubBjKCvfRsknxKbd75AkRRN5ktTt+JaO
         t+og==
X-Gm-Message-State: AOJu0YyYn4bTnUu6+WfVMTL6QWoF7AZmWG3MdOYfzR+tcuXB3CqWIhUX
	IbM/FScS4/Jut3W4OiWTZHRdROxWQArTMkK/LkNSZ25U9cf6FJSmnAhXhRlEOLsbPCY08tL8UCz
	8
X-Gm-Gg: ASbGncuCPFIo1HwtLjgL/X/ifS2kuW/TujW6cE5zvVAtydX54Sp1GFBg4QYT+ArdLGH
	FJlnNxjX992BMoCaiVlikhI2nJTLsZE1eDQxJ7OLj8RNdU/tZNQ9o0vILFdrfIpJe3dOd7LfGgy
	M2Usc1W0jySuiJtnRuxXC8ATy5xwrqHq4o+vIHhb/JMoPy5kNp0flEoTX9tDnXuArBfKN/lKd3M
	KF776EGeQFJNVusYyWX6C6JH0vw74X8y3VLUYvUEryr52Z3a+5oB33elQGgPpMBgIisz3NEKHdT
	7ZJhTdVasAI14136NAacj6n0q3eOeV5iVCA+l9uis2HI5KEGVTmWcRFlc+M9
X-Google-Smtp-Source: AGHT+IFEAYGnrYThDPAMGzjbZHMr1I7RawUz/d9U/DPxyEPsI8rXQHzi8rJZZziXUhur4LUgDCyORg==
X-Received: by 2002:a17:907:3f09:b0:ac3:ec70:18ae with SMTP id a640c23a62f3a-ac73897605dmr1150923666b.3.1743512938462;
        Tue, 01 Apr 2025 06:08:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 06/11] x86/efi: discard .text.header for PE binary
Date: Tue,  1 Apr 2025 15:08:35 +0200
Message-ID: <20250401130840.72119-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The multiboot headers are not consumed in the PE binary, hence discard them
in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the usage of the
start and __efi64_mb2_start symbols in the multiboot2 header.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
We could also place the multiboot header in it's own isolated section and
skip such section for relocations generation in mkreloc, but it seems best
to just remove the code if it's unused.
---
 xen/arch/x86/xen.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d4dd6434c466..ad908539f38a 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -61,6 +61,9 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+  }
 #endif
 
 #if 0
-- 
2.48.1


