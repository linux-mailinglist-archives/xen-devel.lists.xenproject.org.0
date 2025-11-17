Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDDC666D1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 23:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164261.1491258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bD-0002PH-6C; Mon, 17 Nov 2025 22:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164261.1491258; Mon, 17 Nov 2025 22:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bD-0002Nq-1t; Mon, 17 Nov 2025 22:21:27 +0000
Received: by outflank-mailman (input) for mailman id 1164261;
 Mon, 17 Nov 2025 22:21:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FLbM=5Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vL7bB-0002Nh-Rk
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 22:21:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0575012-c403-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 23:21:24 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so26276465e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 14:21:24 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c9628ebacsm15223789f8f.30.2025.11.17.14.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 14:21:22 -0800 (PST)
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
X-Inumbo-ID: c0575012-c403-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763418083; x=1764022883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAssDXxe9d1SYR0UCm/UeqgJSXMhl1SsVae+18Hf8aU=;
        b=iotsTt1sp1YoS8TjKubZ6rowXqD/wqvBMYh92cyuaxunT6bxdpiUSNEoimGnrEQT8T
         cJOfReNrCiESwlb2d7VkWlDcUBqEbx1ySstZr7eBPdkm1qqbiTVCTFGj+g9iJX8baQNK
         6rBekrnoztdc4kklQjQof5f/jYFmx3FpmoAH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763418083; x=1764022883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAssDXxe9d1SYR0UCm/UeqgJSXMhl1SsVae+18Hf8aU=;
        b=r3gH5I4aUxuIZpcc3EjX1tcDOkMVyTY4jHymNu58cTYoY5KxxO7V1m1MV3Kg1WHEKo
         UgKgM+4hIrkty3v0FkG57ACPLLhMSeVIDHCvLnMOPPkwRBif9gHNo5iCdIcsO0J7cmlI
         bpE9ztnLOmMpmHacH++SeanhYQrVaic1gYeARpdn5yO16YUtuNHK8b3lnT43XJ0w6X9C
         CGJ0Eve2hAxeXe9D8AMKcDH99kp9+77mCzEsBVkm8TD32LcGWSrR6l+aNGEPQ8/ClT5+
         lus5NCs4r4nKEcKV5fiDmxW2k/qY/tz5HhA2QhwSgVZXGJxFQ0m6g2ksTBW4WHYd9XBi
         sR+Q==
X-Gm-Message-State: AOJu0YyiutVwyMxnPGXwVBOxAdtKmNM9nrrVscK1NEy0FvjGpqwmiWOF
	o0RVC9SjfXpeyGCWOHoTKuJHfsMx6JXMYmkBLEuiqXWy0J8GXIDL0lne3fMRF0K8XsI18q1f6vR
	VCmlJl3w=
X-Gm-Gg: ASbGncuOct2hZGyfVvWGv5zHoczkpelnyu3ZkkwldpPvOMqC2UozVtc5p7JWrzIKfWC
	MoTmYYnF/C9rkfeNH9h87FsDPRt4w1lRsn3fqdDUf6HlKtg9yvmFptDrANvIUXBkxxvNeny5byy
	rggfAeew9yd2xtHXLkk6HJUnt5ujqqFMr2EAm4QuKMCIo3a4OOrA4Q0O0zariNhk9R5JpOAE+4O
	86uKIuOWYJDh00lqXMdegZOM1IPiu4JrBGMgZSvqVNmPLiV+D8RRoaU0DuXeDJi8ddRo3LK+dYu
	4i0UUWw448U6DAWU2FZUNp0+nZp4F5D9t1UR69XHey0oCvbbZft/tZwn9KHiaCctjnGZZbVNelg
	joOTylEgXQqNuVhP+gEWWgXBFPbP39k0704SoWpIQH1w/x4kK7SvuKxK8MsqBB+nDIM7/9GS282
	D3NgE3L78aEmTVRSLvoEH0SqqkuosFzPHUcevAMlLbj/EBBsNTsDs=
X-Google-Smtp-Source: AGHT+IH6pINDv8Idyh/RMoeRHXErQQHDJWfr0K6rWZFB9EurlOtp+s/zFaceIlGiqVI7eGZZg/DBOg==
X-Received: by 2002:a05:600c:450f:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4778fe4a05emr149992655e9.16.1763418083248;
        Mon, 17 Nov 2025 14:21:23 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/ucode: Parallel loading fixes
Date: Mon, 17 Nov 2025 22:21:17 +0000
Message-Id: <20251117222120.473451-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At least patch 1 wants backporting.  Commit e0bb712a28a9 ("x86/ucode: Abort
parallel load early on any control thread error") made the problem easier to
hit, but the bug has been present since the introduction of parallel loading.

Another potential fix would be to have stop_machine_run()'s error value filled
in using cmpxchg.

Andrew Cooper (3):
  x86/ucode: Fix error handling during parallel ucode load
  x86/ucode: Drop structurally unreachable ASSERT()s
  x86/ucode: Create a real type for loading_state

 xen/arch/x86/cpu/microcode/core.c | 37 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

-- 
2.39.5


