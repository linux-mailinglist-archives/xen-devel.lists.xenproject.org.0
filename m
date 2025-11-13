Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F1C58AB8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 17:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161880.1489709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJa48-0002yu-VY; Thu, 13 Nov 2025 16:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161880.1489709; Thu, 13 Nov 2025 16:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJa48-0002wD-SR; Thu, 13 Nov 2025 16:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1161880;
 Thu, 13 Nov 2025 16:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kirI=5V=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vJa47-0002w3-Cr
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 16:20:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9de9721-c0ac-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 17:20:53 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso5932975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 08:20:53 -0800 (PST)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778c850ca6sm43497205e9.6.2025.11.13.08.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 08:20:51 -0800 (PST)
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
X-Inumbo-ID: b9de9721-c0ac-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763050853; x=1763655653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6StBYBWA0wUq3GHQ0I/JGvGbzzmtV7dYNhqjYzYFZT8=;
        b=cYsjE6HlBhBQZvmj6/zCT3r7StSx7ZaokeVDkH2sehx+2ZQxWLkJvzSIzCBp6BoQFg
         Wm/QOrxzwoPL8O0a8AI0CHwRU2HwUnLaPRMRgzv4gV02ZQGdOLsry9Yrpaxm0RurQPah
         FUe/9tS1C5iOhTota0etcdwMo8y8ApDrlWAwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763050853; x=1763655653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6StBYBWA0wUq3GHQ0I/JGvGbzzmtV7dYNhqjYzYFZT8=;
        b=iJ0kybtFjXiq+rMMSUq+ClNohVHG/yjdnRoZCfiI/fkkDy15tqIAkt+drPU6mRylQI
         nGS1ACdwkSl73Gf/1TU6kHXB6lzKBjWxT7mUwhP/xLxmB8G8kWA4x8d/ptK/DURGPe2X
         OzSeGFmWZdA4lKkDr+qOpsNsmoi7nrvkmHurbp+LV5BqqusN2UuLaUqbVKMXaEcHbtht
         FL5T91aneYsZNK4MU1+NB91iO0vT6JwhNHjfRUOb7DcolHGva0OS+f9WWVXtkz09jO7b
         Xn8fdayayY/Rd90bzBbEXIWHvJVETsYSL07+WEIuMqJrVL5L3xewi3wT37e1WLv/N+SR
         cwLw==
X-Gm-Message-State: AOJu0YxMUi84rU1jOGIpTr1oQdXsLEEI6hyw8g9CM6tV3yeBWrH6YSPX
	Kef590nHZigfpNga9sCSYPXKPeCwTPMHLVpEY1WBk2OmCk6JJrJYKdFhHALX1hI5DrY+AaIEg0q
	nZ10U6FU=
X-Gm-Gg: ASbGncvf1/C+E2YyApLLAQCxCE6ckEjLVS92IpWhHwSZizppk3H6s0Y+6Sjcei46Szy
	5RNLmL8vsE311LDEMuKJkdFbXvXNQN1LoQa1gA7XV2nJUHaKKJuXYnKrx4SQkBve5qD3gEroACG
	JUWf4VSTkIkOfd1VJuXK4tu9VhxF+nVv5I0a9H+JMK89W4sBdplgYVYgDzIMT+qKq6lrqWvxWbh
	zfyNAX6wMVc4PvJ1PwuQO+p3qNSczhzF92NrqxFELoJyFo9D/RaX/cIFlk3ilDkcxJZzruTvb2X
	iMWCBa1L/8xakGfj2e1BkcNhTY0VGudM6FE0mQIeFqNaEhgu89aHndtX6jHd2FUhSpxTS7Y1RTn
	VT2VaK78RNW5dQLXk62fLKibAh/vDRfq+JJW0fgnG8SPRGqcd1RO2jqanyjpQDWjJU/itn6/4Fj
	vTlOex/dMScyI4lLHlaSYvaCB8RM/ocrur/RCcQZkMLw38J7/C67vo+N/bs7saKA==
X-Google-Smtp-Source: AGHT+IFDLjDnybEN4w59EDgXM632XpZ0+Ep59h85EUSN3s78p16DjBaCHdoed04sLgWGSku8MpTrTA==
X-Received: by 2002:a05:600c:4f54:b0:477:776a:bfa1 with SMTP id 5b1f17b1804b1-4778febba10mr230525e9.38.1763050852562;
        Thu, 13 Nov 2025 08:20:52 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.19] mktarball: Use root/root for internal ownership
Date: Thu, 13 Nov 2025 16:20:48 +0000
Message-Id: <20251113162048.224485-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... rather than leaking whomever created the tarball.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>

And backport to 4.17 as there's still one more release to do there.
---
 tools/misc/mktarball | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/mktarball b/tools/misc/mktarball
index 42d543073cfc..15a4e0bfad62 100755
--- a/tools/misc/mktarball
+++ b/tools/misc/mktarball
@@ -49,6 +49,6 @@ git_archive_into $xen_root/tools/qemu-xen-traditional-dir-remote $tdir/xen-$desc
 
 git_archive_into $xen_root/extras/mini-os-remote $tdir/xen-$desc/extras/mini-os
 
-GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
+GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz --owner 0 --group 0 -C $tdir xen-$desc
 
 echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"

base-commit: 3fb951af741ab2faa5a44d413fe1393cdeea05c4
-- 
2.39.5


