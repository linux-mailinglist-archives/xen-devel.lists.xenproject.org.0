Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD49350E3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760591.1170472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJH-0007SK-Fh; Thu, 18 Jul 2024 16:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760591.1170472; Thu, 18 Jul 2024 16:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJH-0007Pq-CO; Thu, 18 Jul 2024 16:48:51 +0000
Received: by outflank-mailman (input) for mailman id 760591;
 Thu, 18 Jul 2024 16:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJF-0007PV-7f
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a1babd5-4525-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 18:48:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso113695866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:45 -0700 (PDT)
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
X-Inumbo-ID: 9a1babd5-4525-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321326; x=1721926126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIr0QAQQjMGCQVJBakpMNTlyW+1VIRzuGPRQ1OCYCHg=;
        b=aevB3nwgpspRfVms4q/sqrlsvzh1UdFYUqPXvgiWcZTtIKlh37cBVmmZdHn+npeZy0
         3kWsLcRzsAoHyoDi37ECQZEICkIfTlgu+1BHMJXXYyi8kGFLwYBd2oF+27NTgVrMo3L2
         KFL+ds1Ts3zLer8W25CLKzxZMAMvy2MnGG1nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321326; x=1721926126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIr0QAQQjMGCQVJBakpMNTlyW+1VIRzuGPRQ1OCYCHg=;
        b=St7C4W8I1unQhX4PCsidLslQDygInUNag0aKjWpNleF6QPPT897J9+XvnW4itNCu2b
         U9k+3mCBJ1VlWGrR2V/g2pvxfrnU0OKJJ5r0MDhYz3OL0a+Qu72iQMbx8QBlRnQbm9Ao
         nd384E+7LkzczsDYkQgWW36CC3OyaR5L55fJDDWG047BWakJvpzV5JNWPLYf627F0Ro+
         l9r5P3xIBVGvL4VOJ/x89srAahKLvMdb11a1CNx6hgGtmu9e7TRsRTa1aEGdPPoGQqTN
         2U6cK/DXoPmROjD9xPAtrwJ490nVSYqVfY/MEhTn8ikDbrzNWrrinaxu0DA1j06rraB6
         C8kg==
X-Gm-Message-State: AOJu0Ywr7rD45g42SCI6s319WtpEGTyn1JY6li3pOYffCZxiPUOZnQ/l
	R7JRjmraR4rOh8InaS3LlTjeH1AMekZvwKHwKVDCMiwJWAbjtL31TxDkQwByGg3emIER8ZPvt1w
	g
X-Google-Smtp-Source: AGHT+IE6o7cTB76TwpxII8+evhCCoHMLrcbh5dT1Rm3Ut5qmw9wjkhZBD8MdcJlifpnVBRmDZXIl3A==
X-Received: by 2002:a17:906:71c6:b0:a72:b4c9:2be8 with SMTP id a640c23a62f3a-a7a013597abmr342575166b.72.1721321326125;
        Thu, 18 Jul 2024 09:48:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/6] tools/libxs: Fix SIGPIPE handling issues
Date: Thu, 18 Jul 2024 17:48:36 +0100
Message-Id: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the purpose of this series is patch 6, it has a side effect of reducing
the number of system calls substantally.

Using a strace of test-xenstore as an example, we go from this:

  rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, 8) = 0
  write(3, "\v\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", 16) = 16
  write(3, "xenstore-test/502673/a\0", 23) = 23
  write(3, "a", 1)                        = 1
  read(3, "\v\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0", 16) = 16
  read(3, "OK\0", 3)                      = 3
  rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fda8278e2f0}, NULL, 8) = 0

down to this:

  sendmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\v\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", iov_len=16}, {iov_base="xenstore-test/504021/a\0", iov_len=23}, {iov_base="a", iov_len=1}], msg_iovlen=3, msg_controllen=0, msg_flags=0}, MSG_NOSIGNAL) = 40
  read(3, "\v\0\0\0\0\0\0\0\0\0\0\0\3\0\0\0", 16) = 16
  read(3, "OK\0", 3)                      = 3


I.e., it removes 2x rt_sigaction(), and turns all write()'s into a single
writev() or sendmsg().


Reads are a little more problematic to deal with.  Xenstored will produce a
full package basically in one go, but libxenstore's reading is horrbly
complicated by virtue of it being completely different depending on whether
xs_watch() has created a secondary read thread or not.

Andrew Cooper (6):
  tools/libxs: Fix length check in xs_talkv()
  tools/libxs: Rework xs_talkv() to take xsd_sockmsg within the iovec
  tools/libxs: Rationalise the definition of struct xs_handle
  tools/libxs: Track whether we're using a socket or file
  tools/libxs: Use writev()/sendmsg() instead of write()
  tools/libxs: Stop playing with SIGPIPE

 tools/libs/store/xs.c | 394 +++++++++++++++++++++++++++---------------
 1 file changed, 258 insertions(+), 136 deletions(-)

-- 
2.39.2


