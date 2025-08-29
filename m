Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA3B3C06D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101817.1454746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mv-0006lJ-1o; Fri, 29 Aug 2025 16:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101817.1454746; Fri, 29 Aug 2025 16:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mu-0006j9-TW; Fri, 29 Aug 2025 16:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1101817;
 Fri, 29 Aug 2025 16:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4pU=3J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1us1mt-0006FV-4y
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:17:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fed255f-84f3-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:17:14 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso13836495e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:17:14 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a7691340sm2973328f8f.39.2025.08.29.09.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 09:17:12 -0700 (PDT)
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
X-Inumbo-ID: 9fed255f-84f3-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756484234; x=1757089034; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78bcN961wJy8tt+lDbkthBUgI/cmOgrpjwzbJMR/a/A=;
        b=A2t2N3UoiQNP+IM9ftM7sO4E76DfMS/6qHXsDjo/FIs02kAlnbynFsPbjSG1yb+2dD
         YUZH5/z+MFGqba8kWp4jhp+sUUiOwn1b6Zw+L1Bj7CK3IAGDR9FIvPwncGq3hUkjlyFj
         csgjY3/sT4zJ36pysWbGCX+OPgY69rk8/jaLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484234; x=1757089034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78bcN961wJy8tt+lDbkthBUgI/cmOgrpjwzbJMR/a/A=;
        b=mDueErS7fCvj+BzPc/5eNkNT+zeORZ7f2lNyQtrLJvbs5laASZ3ozIMdwlnOUEKGlI
         eSg8kW6TBX+zukr3y5ZLe3moTfiZaLtBQaaEq2GhCzZ6qSnzoWlVXA5uVBwFKQF7+6Is
         8wDSzfh827iNI+POemVQNGmpgVtkyKgvvXHa7C3iF2FZEblFMVR8AZrQ5K6TdEZfQikB
         zzW4cdPdPjONvt4yJ5zKX0R7aVrxrvSoG3iMccJLavbrgqfh8M6vcrgKmUKA7VEXx1By
         zosJiwrJA0ZzIXaRVabMvg+1652X6UIG/lR0qPweoUs5C8tRUbkUUq3qSnZ+fk2QCgZ3
         QozA==
X-Gm-Message-State: AOJu0Yyxfto4NTN1X3fmf72H/yxyT+0Merqk6BtKYsDSNI9cnHJYoLFf
	cSJF2x553XFpMrggIZnMiR0lHG6tdIy0AjwD8U0KmL3jUvpKtHzbvZtNpW6WdCByacJUFDDVEqa
	Go4qd
X-Gm-Gg: ASbGncswYrZhkypBq5YARqBCCGGyDzfIUuAQ7lNE5Pq0rLxU55Gfb62ghYjyG6o7aVU
	wUB0cYCV8plD3Oq5UA0zggXgRTdi3TpTntwvncgdaGGmd2qDZwKWbn7ML1PFz4HyQ9nxmJvO/Zi
	g6WAqIFvHYhsq3yCD7b0M7BH0IKohCWBv7FNIUQpTNilmzN8vSp/qt2PCbAQA1Wy4gsLzRi82ps
	lKuEJYCX9jMrOjduFl4GEayyOUbFiFqjfHl5bJl5j+AVhP2Y0pX7cTV0l/qgpzoCwuhsoccyVrJ
	Q7Nl64ggfBta8smlwwcx0NzzbRfhElOW2SMDhecYKonxu1W36fqeauS+OiQUVfjE45y45RgnCV/
	dc06wkobgiCGaxwlphlDCmAIkK4h1Cd/vfBQDOENI9qh61VPcPQQDSmlW1LW60qAKp74uzWu8I9
	yq
X-Google-Smtp-Source: AGHT+IHTPdvkdqiingcttMHnONW3rnCPS5tXm+h92NjhcsiE/1b+QXDmamwq2kjCCF9UEwm/bL1scQ==
X-Received: by 2002:a05:6000:2910:b0:3ce:f0a5:d598 with SMTP id ffacd0b85a97d-3cef0a5daa0mr3799262f8f.10.1756484233640;
        Fri, 29 Aug 2025 09:17:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/apic: Drop vestigial pieces (Intel VFM cleanup)
Date: Fri, 29 Aug 2025 17:17:08 +0100
Message-Id: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found while doing the Intel VFM cleanup.  This diffstat seems preforable to
simply dropping the x86_ prefixes on the field name.

Andrew Cooper (2):
  x86/apic: Get rid of get_physical_broadcast()
  x86/apic: Drop sync_Arb_IDs()

 xen/arch/x86/apic.c             | 40 ---------------------------------
 xen/arch/x86/include/asm/apic.h |  3 ---
 xen/arch/x86/io_apic.c          | 18 +++++++--------
 3 files changed, 9 insertions(+), 52 deletions(-)

-- 
2.39.5


