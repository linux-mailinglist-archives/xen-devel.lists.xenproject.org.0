Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD1B1B88F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070744.1434365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaA-0002j4-E6; Tue, 05 Aug 2025 16:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070744.1434365; Tue, 05 Aug 2025 16:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaA-0002hd-BU; Tue, 05 Aug 2025 16:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1070744;
 Tue, 05 Aug 2025 16:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQWd=2R=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ujKa9-0002Yg-7B
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:32:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baf8097d-7219-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 18:32:08 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af949bdf36cso600478566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:32:08 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af928c84154sm842980766b.84.2025.08.05.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:32:07 -0700 (PDT)
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
X-Inumbo-ID: baf8097d-7219-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411528; x=1755016328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw+fp9ijqB07ybQ00T6Z+NAfGs8NSWdqqpiXyp8ErM4=;
        b=bnB4+7tMaTamOulKoclyX1slvn/HLp81j+zr6Fg0ZoooRIwTv8cjG8Fsf6lSCkgtot
         Nc2l739Umaq2bBRT2pEILad+wg0+5JUAF0hQXIU4vdLqubQe8tFLObwUQ/QQYPhHkPtG
         ho/HYnT2BG9lo77j7sLBA3SW69pzNEkkGUsuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411528; x=1755016328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cw+fp9ijqB07ybQ00T6Z+NAfGs8NSWdqqpiXyp8ErM4=;
        b=G95/kkBRiqn1uO3eUy6x3Wq6jKj0ztM9IhNNMO3Q8EeqWX6DSvlIe5CRUmd2sNIv1o
         fm2A34WzsQO3lHAJnuEs0Yt2BUHamKo81DwYvsix6fGM+137iXVjRoKvV6TXaqYjIADx
         ALP9LTMX8UIfhgBcmv2HkemqD9NuxBoMNx/BCKtOLXvaF8VX8W5GynlTsRvD7txpdy7I
         /DjCnqANyAYbmpdSHr0jjXwWDa30A3e7vdzxTw3/Csii7hs0bueNRz9TnJjZMxtCiuLw
         SHGmtrie0dscQmggdS0jkrEx7LC2wzQ11gMYz9aOKGCzEYd2VoFjejmixPPP3nrBa6p1
         GQcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5OMkd+H/UH/Di4RrUvooqazqaBD4nsgs5kvs/4zBsEsYQ04jyX8LgHRrZFYfyRxZnG0emjr7tIH4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwFgJOMbtBFD1O94J5xLODeyCNijShm7K+VnYKp75D3CP68PN/
	eELdQwYtOa8kZvQqW7mkdi2j06fNn776srFGeiXETu82CG6pnMSRXNdGLi6Z0Rurd07z4/ZUDdn
	fXDE=
X-Gm-Gg: ASbGnctRXiWz7Rk5jdOZSBB8SapbOh30ggaWG903nTwRCN817Ko0v6Lhm5UIG+tUIFW
	b1sa3LAQMHNg0fNOqQO/bx7O/swqdJESdnbb7RXfO4zvFdyKVGZa4fk3XF5W/7BLiRCB7hwJt6C
	BWIBmhRCfBtrilguQkt0DRwAhrt7mk2ssvjW5+FQ2OPXEpwTuwe6GYm2WgUQ9xi8WCbUSy+Wpvl
	8lW/CxPKGSvsY7IfmKF+9KRH9bGfObADPlh6bi251mzVzdOLKGj7ecjkhPZOH6U7X2pYf5G4K2d
	3RXqUkDpRch00pA/OJFv5FKCsLgcNbW4vl/SsDI5nkvzuwO8I07AeuxlsYxPhRTtg7bAv8k1uj6
	qRn8G3crrH85QUEuX2E3xuZ1VP41F147IxvvFbNfpHrDpnA==
X-Google-Smtp-Source: AGHT+IGa4GFLCDHDfvOak3r6zeET09jfJFrVEa7qKNQ3LiINiAKvfcR4Wn8Z3ypOhRbpZd4sqlkjAA==
X-Received: by 2002:a17:907:7fa8:b0:ae0:d798:2ebd with SMTP id a640c23a62f3a-af94017fa9amr1402524766b.35.1754411528077;
        Tue, 05 Aug 2025 09:32:08 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>,
	xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] Misc EFI boot fixes
Date: Tue,  5 Aug 2025 17:32:02 +0100
Message-ID: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes for a couple of annoyances when booting Xen using the native EFI
entry point.

Ross Lagerwall (2):
  efi: Call FreePages only if needed
  efi: Stop using StdErr

 xen/common/efi/boot.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.50.1


