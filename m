Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E0379AA5B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599648.935154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk8u-0005iU-2h; Mon, 11 Sep 2023 16:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599648.935154; Mon, 11 Sep 2023 16:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk8t-0005g6-Vh; Mon, 11 Sep 2023 16:52:07 +0000
Received: by outflank-mailman (input) for mailman id 599648;
 Mon, 11 Sep 2023 16:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfk8s-0005g0-EC
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:52:06 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895a8164-50c3-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 18:52:05 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso29738545e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 09:52:05 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c11cd00b003fefcbe7fa8sm10578124wmi.28.2023.09.11.09.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:52:03 -0700 (PDT)
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
X-Inumbo-ID: 895a8164-50c3-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694451124; x=1695055924; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2oThcUQEm2o0fOsAVZ8LsEhKrwQN2d2RddYXBJjXfc=;
        b=fIhBB9Fn8FM7KytDi1yaqj9nVbmyOc2I0HAC8EJ6GE3hnVUtGd8j7IYeseZ2vbXOOh
         gmiUEhGhQD75KVQ+941UGfxJd2+fowIWyNKylDgOmIojjSDHHnx/EYEbXhtMe6W88MNU
         6dAmvaygXEdEK6VQrhtmBXcGvjms3ewXmhvC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451124; x=1695055924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2oThcUQEm2o0fOsAVZ8LsEhKrwQN2d2RddYXBJjXfc=;
        b=N2euSHu89L+MbdtHljnstdhix1nU/hL8wlxElBoWQ9emomukR/fqDK0VHdi9CCLVn/
         +xlaeurF00Ww09cuRPRZq7pn2Gx+/RB7D8fBwkKooPwTksFmcjZQjjOaf4jBquOHNN7R
         GHp6AUzgnSZSQZZvMLs22jgDtivaFyxvix9YHHIa0vFnelWTwCKtl9oEL4h7w0w4jS8X
         jS50FjTA0k/lRwhJA87ds/Ko0bVQwreVeUKiawlUb0G0bGAi3vcIpWGZV2Ii+wBmCDPW
         /vK1DDcSyqSknzB+lVVWPvsMStCBwEc4K+S9cADAvmB62GAbhZ3OgU8goVQWxg8s5Ul7
         fz2Q==
X-Gm-Message-State: AOJu0YyS73FXUO9Of2m5GrErQhG4Wg1LyhTTUi326LG6QbsnGqUdbtG3
	4gpYuCG63fJVvQJuM7hD2Ix1nl/azAPmkFCSOgg=
X-Google-Smtp-Source: AGHT+IHLw5vhaa/ES9r21e9rQvKRVqeFoXM8XxogClRoKWsS7l9ZDPEZ+dC7y1iKBU04kXNAHMB8+A==
X-Received: by 2002:a05:600c:4449:b0:401:b92f:eec5 with SMTP id v9-20020a05600c444900b00401b92feec5mr131871wmn.9.1694451123998;
        Mon, 11 Sep 2023 09:52:03 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>
Subject: [XEN PATCH v2 0/5] python: Use setuptools instead of the deprecated distutils
Date: Mon, 11 Sep 2023 17:50:59 +0100
Message-ID: <cover.1694450145.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series picks up Marek's v1 from
https://lore.kernel.org/xen-devel/20230316171634.320626-1-marmarek@invisiblethingslab.com/
Changes since v1:
  - Update all containers to have setuptools, as python 3.12 depecrates distutils in favour of setuptools
  - Keep python2's support by falling back to distutils if setuptools is not installed
  - Drop the commit about raising the baseline requirement for python, as we keep supporting python2

Javi Merino (2):
  automation: add python3's setuptools to containers
  README: update to remove old note about the build system's python
    expectation

Marek Marczykowski-Górecki (3):
  tools: convert setup.py to use setuptools
  tools: don't use distutils in configure nor Makefile
  tools: regenerate configure

 README                                        |    7 -
 automation/build/alpine/3.18.dockerfile       |    1 +
 automation/build/archlinux/current.dockerfile |    1 +
 automation/build/centos/7.dockerfile          |    3 +-
 automation/build/debian/bookworm.dockerfile   |    1 +
 automation/build/debian/stretch.dockerfile    |   11 +-
 .../build/suse/opensuse-leap.dockerfile       |    1 +
 automation/build/ubuntu/bionic.dockerfile     |    1 +
 automation/build/ubuntu/focal.dockerfile      |    1 +
 automation/build/ubuntu/trusty.dockerfile     |    1 +
 automation/build/ubuntu/xenial.dockerfile     |    1 +
 m4/python_devel.m4                            |   28 +-
 tools/configure                               | 6551 +++++++++--------
 tools/libs/stat/Makefile                      |    4 +-
 tools/pygrub/setup.py                         |    8 +-
 tools/python/setup.py                         |    8 +-
 16 files changed, 3678 insertions(+), 2950 deletions(-)

-- 
2.41.0


