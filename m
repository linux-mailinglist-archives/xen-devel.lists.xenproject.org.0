Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822BFBB33CF
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135391.1472511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtA-0008Id-Ax; Thu, 02 Oct 2025 08:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135391.1472511; Thu, 02 Oct 2025 08:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtA-0008HA-7I; Thu, 02 Oct 2025 08:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1135391;
 Thu, 02 Oct 2025 08:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Et8-000821-Fy
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:10 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af3f1d74-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:42:10 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so434632f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6b40sm2649068f8f.2.2025.10.02.01.42.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:09 -0700 (PDT)
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
X-Inumbo-ID: af3f1d74-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394529; x=1759999329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6r7ywVdtgg6puBO7GNeh9QBn+ePwbPPQeAATrRMKjs=;
        b=HUrg8BLEDewS7+yN7BCvek2xSFof8pnvebsVU7NUsCLdvZHaQwqaCDHRSJns/SHZlO
         3bV9uPFh0icr8VN4/H8QvTeLhZ5Xv5t1S+Jxe5OY4VZNvzEQCsbn7hrRpiSMICtjWWvJ
         S/dO0Z1vPHjD78p5bc1fLVkjpLp3yxxSyo/2xBJEPY2DDlXGdkAJx7fztaPL5gr2dG2F
         o6tYbnHqQlr3/tRWY4dAC6HX4Ws6yyVGgdo+1m3rQ5DX2vh+EHm5qR8WrenwOP8Hjo0s
         usUGOwK/VegyfIS3VzzHkcWkvf/kSDvyBjpP7i+AWZuT+VAoDVhhJUBugluZx8U+PapX
         3SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394529; x=1759999329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6r7ywVdtgg6puBO7GNeh9QBn+ePwbPPQeAATrRMKjs=;
        b=drOcLM5crYpk4AOfRopXmNorXqFhmqTcMKSpqpBIvSMj4CHKomvrbvH0gF5cqtfB/C
         vpRnLtrJzqcgIlBOIfgGoE4dveLLUqrTIGoTaxkVvAXo6dVQX+vrrtq/lj+0xDCwapfN
         u5SAQpxqFXJ/lcVrPQkxecHBNh832aHxKUHtMcTx6tCtjAo2mL3ICaMaaKoYCkiFhotE
         FCa3RcvR/OcbcFa5k+0KaeHXYJe7TWsXWGtoHEHzpTsghOn3EX7wwFy6TGXMGlBk5Uor
         5OONVjiWt16x+nRhL1Vi02JTowIWvHYoDBNp4Hocy+5Sh1TzYsVhRf1nqo22fO4KVhny
         /HWg==
X-Forwarded-Encrypted: i=1; AJvYcCXPI1Eal9hOelf8zgruSeKYQPr7Sal4Oxp+MJJXHbB0Tod93Znlkbvei5tlMDLMpcmohpRH+6dhUq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsA9nF2IQ4MVGkoKeK2TAszj/i0DvyYB5QlbmYOIefJr6k9BKa
	02TjvPwqr8HOXRCSNlgOEBizAZIrdUDSBY4xyAvOvqEvw1K2Ry6TBkh7oSxtvGJDuqQ=
X-Gm-Gg: ASbGnctdbWg/6Sek/mdxZilfecp1oT3CoDWdnU5+FmEA4TxydrYs+VBxfW7lIBwlj5G
	hDvyHdq+1OE0pJdpPraz/XHPAq4cWpW1qeUna9M9RDSaa3PGqt1jvrAZLgggdFXAZ56SEixJH0Q
	wLM/c63OVcj8wjMMCdFWglTtOGE1s0lR0xudsST39sqVI24cxPR9X4iX3mKwHjm/s+3Gkj1wjbw
	o/iA89e+b/eJc83NTHFyLXyVNrABBa1X6f9MGY7l9HZEGLZJI8/DiFRtXtzDpiizdYR7UfFrCYD
	GXG34XOKTTvW/z14WWE1sa170fO0eUHkVOpCbKcFFyc+BMJ1EDNSBD5Znwo8BMnJTo2pPIvAqLr
	r/gGUoyErBMaVCuDLaxpKLDHXRNgzzh0U16yViPgBVZpVB5BLcd0wiJ2sErk0dkopFrt1MSci0g
	CfAA77+tOlUnp6+KJp9iXO6frUck3Nug==
X-Google-Smtp-Source: AGHT+IE1u3COjNq+oE6xio5GRW1A/vqSgcySFumrJ67RNAp4nOAK/5HZJkMzy+g6L+RiVVekcEJmKw==
X-Received: by 2002:a05:6000:400c:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-42557807a65mr5230357f8f.14.1759394529461;
        Thu, 02 Oct 2025 01:42:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 01/17] docs/devel/loads-stores: Stop mentioning cpu_physical_memory_write_rom()
Date: Thu,  2 Oct 2025 10:41:46 +0200
Message-ID: <20251002084203.63899-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the documentation after commit 3c8133f9737 ("Rename
cpu_physical_memory_write_rom() to address_space_write_rom()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/loads-stores.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 9471bac8599..f9b565da57a 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -474,7 +474,7 @@ This function is intended for use by the GDB stub and similar code.
 It takes a virtual address, converts it to a physical address via
 an MMU lookup using the current settings of the specified CPU,
 and then performs the access (using ``address_space_rw`` for
-reads or ``cpu_physical_memory_write_rom`` for writes).
+reads or ``address_space_write_rom`` for writes).
 This means that if the access is a write to a ROM then this
 function will modify the contents (whereas a normal guest CPU access
 would ignore the write attempt).
-- 
2.51.0


