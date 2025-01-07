Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6AFA03B39
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866218.1277516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5xD-0001jb-BS; Tue, 07 Jan 2025 09:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866218.1277516; Tue, 07 Jan 2025 09:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5xD-0001hu-7r; Tue, 07 Jan 2025 09:32:51 +0000
Received: by outflank-mailman (input) for mailman id 866218;
 Tue, 07 Jan 2025 09:32:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X79W=T7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tV5xC-0001ho-31
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:32:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b50e784-ccda-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:32:48 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361f796586so157438315e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 01:32:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea423sm599220895e9.2.2025.01.07.01.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:32:47 -0800 (PST)
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
X-Inumbo-ID: 5b50e784-ccda-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736242367; x=1736847167; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbNuAPn7hxayP40gKEn2Lsg7pTuI5gIuYSBkaIM8a3g=;
        b=d/dVOdyJjWDzig5NAXgTt1yRuZhmnx1JNQYe0weI8jC+hk6n6KY4dCGQaE4AbrvUuF
         OQiUCF2IwqR9VG0IaaWtko++0ZDar7q9kE3TisehZ0qW1rJv/ucURt7RhlBXOKpqUC1L
         Th8CDm5XmpU8eoyfAaBSRC1f2MUW//FuevJvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242367; x=1736847167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbNuAPn7hxayP40gKEn2Lsg7pTuI5gIuYSBkaIM8a3g=;
        b=fQocfr/MvYfaqU203TMIbluzOumCnmmgzBppT2C4PXx3pY65Ee4XgFYIhiveAjYPP8
         Irk7dD5jQR/wBukUBghIHavmgkB2glmPV5zeoTlWDB3W7uVsmNV906U1o7/Zoc58d+HA
         suCxxGGNXv3wfluwPq99qxdnGbwJBz2hbzIah/wFsM06yZdRiUQ6dJJWTY8nhHFZT3dv
         QLQe5DP8sByY8qUVfa5RfZWYHU85rwGD7J2d+Rect4osARbkD7CMgaYRcw5togCZ4n98
         sEhE8uR/TsLev/hse4tZYfvA4XKQocpOHtdko1qclyNXFCrahwe9j0CRC49BQ220NQgJ
         KX5g==
X-Forwarded-Encrypted: i=1; AJvYcCXPp9vnrNAQ84LYy7wXoCZ78FNA+eflevi3520XwEyKCUuAyWCV5CDtbDXWBrWHohMczu6KVsHq270=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrq9zE9zljl+/o2ghJGTXJ22a71EzPq+dQt56tUq7tlfhHiZmn
	CSNPEwGth0rHBiRec5aSLIcgXzQqGSqs6sR6sQmsNN5GcyWfdI7McdDl8dUrc7k=
X-Gm-Gg: ASbGncvLjUJa7eRS/O2GRVr3hW9FSx4TKAiTe6xHrFlez2YIv1CfZRXROo+169KLnFN
	FD2J30S6n97ntWdHAQ9to8WIFXziOtcCLMLx5lkZpBpGLfI3kExF+8J0xMLc3p2RkWusvH7Pkfy
	je2yFTzhUO53+YGsHd4fEg7fvkAsjBdOa1eTGmiBkWEyR9SIHenE3owEJSsJsV5rxdsV5ikkwl1
	Cso9OakDxWdgHhcoL6e/9PaZC/hA6BOlsOQ9DZGn7+Tgxid3aPUNNnY7tMCMw==
X-Google-Smtp-Source: AGHT+IE77CLLM3YGCd/14pEq5ORK2y/OyiPHY51e0671sdQFMopdoXlRdP4mxzp7KExH+LVBRP3azQ==
X-Received: by 2002:a05:600c:1550:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-43668b5f892mr464048705e9.32.1736242367483;
        Tue, 07 Jan 2025 01:32:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen: error handling and FreeBSD compatibility fixes
Date: Tue,  7 Jan 2025 10:31:38 +0100
Message-ID: <20250107093140.86180-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch fixes some error handling paths that incorrectly used
error_prepend() in the Xen console driver.  Second patch removes usage
of the 'm' character in scanf directives, as it's not supported on
FreeBSD (see usages of "%ms").

Thanks, Roger.

Roger Pau Monné (2):
  xen/console: fix error handling in xen_console_device_create()
  xen: do not use '%ms' scanf specifier

 hw/char/xen_console.c | 15 +++++++++++----
 hw/xen/xen-bus.c      |  7 +++++--
 2 files changed, 16 insertions(+), 6 deletions(-)
-- 
2.46.0


