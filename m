Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F67FA65F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 17:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642341.1001756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eTr-0007b6-RH; Mon, 27 Nov 2023 16:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642341.1001756; Mon, 27 Nov 2023 16:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eTr-0007ZL-OJ; Mon, 27 Nov 2023 16:29:07 +0000
Received: by outflank-mailman (input) for mailman id 642341;
 Mon, 27 Nov 2023 16:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6whs=HI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r7eTq-0007Y2-UX
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 16:29:06 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14682fbf-8d42-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 17:29:04 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so2535665f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 08:29:04 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6c65000000b00332f6202b82sm6916802wrz.9.2023.11.27.08.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 08:29:02 -0800 (PST)
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
X-Inumbo-ID: 14682fbf-8d42-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701102543; x=1701707343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqSjlpQSLY++eIbHc8Ks2mT2vCpbUSFHhdPuPpDAmrk=;
        b=A9FoAYRN/UOOFZgYTcKuH34mgFkVExV1PNRzKXJ+GqQbogu7M5bcxZNSDm6NlqwkKL
         Y651fWmPJPDMYy7hID/WXVCP05aLWYSzazUFDSRiVG4/cpzbiBGl4Nu7uLnutJ5VG4AB
         TZ5Z3qjGY7Tn3nZbpopXQ+/yf9mcm/etSVOhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102543; x=1701707343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqSjlpQSLY++eIbHc8Ks2mT2vCpbUSFHhdPuPpDAmrk=;
        b=Vde6zieBV4i7mHxwcpCf27xCOXOk/zMJkMOINJe06IoIjGH/efnaFZazIaxYkHHAM9
         b94HYKjrjOqZh4cGMALWCINCTwSb5+F92EPhVL3RjMzTU+6q5rfbOMyh90QXxWrLyFLI
         KJovRi+la/6wRG0rHBxN1fJE/CP+tPhMAKvfd1tmOb5aBAmtJvpYTol2dG0ObbwYsH+b
         TU78k7MvotBIb+s3S8f2go6znSWvHPZREcXbPluhSrQgx9jwpClDKsLqvevhKATTKyOm
         hBXK7YZ0uQCsEwo17ybGr+ww/wml0Gbzn64f7VsMd213TtTKMibYBM1UEfvI0rFtyADp
         TI+A==
X-Gm-Message-State: AOJu0Yz2d8YG6Av4IG2rEaNBjZmhDGHwDpf6GQtqc0+hioB5bAEYa5eH
	nrg8oUdtsLoH9Q6SMCsLFS1PACHUG+k7NZvlpn4=
X-Google-Smtp-Source: AGHT+IGoZu3ohze5/D037jKrUxqY2t04BpL0EWNjL8241zqpSdJ/R577lE7UKnuvqr5YF8tOSBAjog==
X-Received: by 2002:a5d:6282:0:b0:332:f97e:f560 with SMTP id k2-20020a5d6282000000b00332f97ef560mr4948930wru.30.1701102543306;
        Mon, 27 Nov 2023 08:29:03 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] preseed_base: Remove reportbug-gtk if present
Date: Mon, 27 Nov 2023 16:28:56 +0000
Message-Id: <20231127162856.35391-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Debian installer have started to install "reportbug-gtk" which
depends on "dconf-service" and "dbus-user-session" and "systemd".

And when we try to install "sysvinit-core" we are met with the
following error message:
>    The following packages have unmet dependencies:
>     dconf-service : Depends: default-dbus-session-bus or
>			       dbus-session-bus

So, remove that new package and its dependencies before moving on.

While here, add `set -x` to help debugging.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I'm pushing that right away.

 Osstest/Debian.pm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index ded7cdfc..9b30a375 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -896,6 +896,9 @@ sub preseed_base ($$$;@) {
     # breaks ts-leak-check.  Fall back to SysV init for now.
     if ( $suite !~ /squeeze|wheezy/ ) {
        preseed_hook_command($ho, 'late_command', $sfx, <<END)
+#!/bin/sh
+set -ex
+in-target apt-get remove --auto-remove -y reportbug-gtk
 in-target apt-get install -y sysvinit-core
 in-target apt-get remove -y systemd
 END
-- 
Anthony PERARD


