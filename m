Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB28D4677
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 09:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732498.1138478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCabb-0003jl-Ki; Thu, 30 May 2024 07:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732498.1138478; Thu, 30 May 2024 07:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCabb-0003i6-Hz; Thu, 30 May 2024 07:53:47 +0000
Received: by outflank-mailman (input) for mailman id 732498;
 Thu, 30 May 2024 07:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCabZ-0003hy-Pb
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 07:53:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf37c54-1e59-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 09:53:44 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-354ba5663c9so652058f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 00:53:44 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7db97sm16555229f8f.24.2024.05.30.00.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 00:53:42 -0700 (PDT)
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
X-Inumbo-ID: bcf37c54-1e59-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717055623; x=1717660423; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=li5PB+SVoxtb4ME8F/9PRui3RwKWJvCvwTggjmT/4Xc=;
        b=T8W25XZv0yVjrVjpsHgbM7eKCwedRQWNsemubFoFA/0mU0aWF7g3e6rqzBS3DSZ1kL
         HryDspJ6ZpXHDsLJ6w0Vwc6ejupzG9Mbo/zGkpXYnE6M0kkY9RWHV1VKciyob4kk29eg
         8aj0UBLNGWGhLYtyNXVVbQpUXS3X0foosXoAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717055623; x=1717660423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li5PB+SVoxtb4ME8F/9PRui3RwKWJvCvwTggjmT/4Xc=;
        b=SlQntR7xK9eNaRJ3bXqgX4tlyFXXfgZXAEbb7yOrNJtaqyfUucrU7vEqYujhgb2GOc
         4p7hOvhcu+RF/Tip2mvMbyWmDHqCEC/H4Rz2OuCUxye1l3D53jyUUXuXjIX1e0wt8vC+
         G/vKNDuGOibi3+GyGTI58DwjsERTCSBQjMQqNC9ClYXyh72K2ypccXDb9Mxfk1KM7wOi
         T4Ddm5LyJ87lOTaY03/2UupqUIOJGq/We1UkhVKdbHODqijTwcWNbiBGxyl6YFjJ2MOz
         WpEJUrFLW4xcTvaZRyytQJeOQobULNi2grrrsvX5+YdiTt5aORjIiT0oXFtTosBe6Coi
         174A==
X-Gm-Message-State: AOJu0Ywnrf1ke/XldWHvoqW3zBR3ahssIbvlosjvLo0B9tUdV7L7dnr+
	acm1w6XpUTl8GjlfZz3UjQWdIC0t83XhbeVewih3OxtNmUc5sM1roT7Cy9LhY8LrEVyZdHDTeYl
	p
X-Google-Smtp-Source: AGHT+IEYFUcZuJopx1tsUk/xX1jaKtL8IvQTQ4cwdFMDlC5+LAT/CxxX6AETi7v2js7CfgUTXXSspg==
X-Received: by 2002:a05:6000:1751:b0:354:f622:fc5b with SMTP id ffacd0b85a97d-35dc00908fbmr726685f8f.23.1717055623085;
        Thu, 30 May 2024 00:53:43 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/hvm: allow XENMEM_machine_memory_map
Date: Thu, 30 May 2024 09:53:18 +0200
Message-ID: <20240530075318.67491-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For HVM based control domains XENMEM_machine_memory_map must be available so
that the `e820_host` xl.cfg option can be used.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hypercall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 14679dd82971..7fb3136f0c7c 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -25,7 +25,6 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd & MEMOP_CMD_MASK )
     {
-    case XENMEM_machine_memory_map:
     case XENMEM_machphys_mapping:
         return -ENOSYS;
     }
-- 
2.44.0


