Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A333397C57D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 10:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800546.1210469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5a-0008C3-50; Thu, 19 Sep 2024 08:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800546.1210469; Thu, 19 Sep 2024 08:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5a-00089i-0T; Thu, 19 Sep 2024 08:00:34 +0000
Received: by outflank-mailman (input) for mailman id 800546;
 Thu, 19 Sep 2024 08:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1exg=QR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1srC5Y-00089b-8Y
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 08:00:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d9f5c96-765d-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 10:00:31 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so762180a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 01:00:31 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3833sm686196966b.128.2024.09.19.01.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 01:00:29 -0700 (PDT)
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
X-Inumbo-ID: 3d9f5c96-765d-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726732830; x=1727337630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1FbDknA9lbObrFs7qn0qTLfQY0W1+zhKQBUYjaEGSM4=;
        b=fY1RYCaRLIsBVQpnVxWEUV4ez/BbcP7NyAqNWwv9ixk5ujquMhh7FaMnASxLQVfSX9
         1NpIiUqJjZkJaBT83YRLStRT4DUcPrvwWhxWa0L9s4zV7MMLYfqMtUBBnI7pTi2ekDPc
         yHUbJ30K2hdXxtCHd/1ncwV14REEEVMelc6mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732830; x=1727337630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FbDknA9lbObrFs7qn0qTLfQY0W1+zhKQBUYjaEGSM4=;
        b=NcW44ee2/TFSpENoY6eIyiMYDTBdgR55Z3G9Esb+ZqDUhKquf2cfKJQnf+IRCfFwNN
         9StcTqv94L7USy/tROsflgxnYjEeb4OGfY5G6VfsFm6If/kMEaEVBab728TouDOuu88s
         BC5pHJDtCx7KHSMrq3XG6OS4T+ksWmPGMLFA7CQ7vpmFUm/t38NIKICdqeVITKSsSxSj
         y+Ns/Q6hPKRxVpkkQqkupPYPyelKalT+JhYWqVbeFNYD9DeXnEZ7QH853o+cnO1FDZtd
         HK9TxpymcSWReK6R37JesbXTu2N2hYR6AYJei6o/iUBTjPmJImXlW0Y4q2Qm72cGYbL9
         zNGw==
X-Gm-Message-State: AOJu0YxDMvcdHluP7vcx24Fs8LIUF7gjsFs3YDuhfXWHW1vn7Gt2mJaN
	bkqKrGykdusrp4ZDEdzcLs4HbkhAtCr+229gqicmxWUencXMgCP9CuVQu8YwTZShL63O+Y9E8xq
	x
X-Google-Smtp-Source: AGHT+IFZwkWdQmKUkUzgPZICX0lycZC0C5egqsja36C0BefmG3pkVXmgCJC6I/ODoOEYZY3Miystbw==
X-Received: by 2002:a17:907:9446:b0:a86:894e:cd09 with SMTP id a640c23a62f3a-a90293c4fe5mr2735318366b.9.1726732830112;
        Thu, 19 Sep 2024 01:00:30 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/3] x86: Satisfy requirements for UEFI CA memory mitigation requirements
Date: Thu, 19 Sep 2024 09:00:18 +0100
Message-Id: <20240919080021.20155-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split code and data to satisfy W^X requirement.
Align all sections to at least page size.

Frediano Ziglio (3):
  x86: Put trampoline in separate .init.trampoline section
  x86: Split output sections for UEFI CA memory mitigation requirements
  x86: Align output sections for UEFI CA memory mitigation requirements

 xen/arch/x86/boot/head.S |  5 +++--
 xen/arch/x86/xen.lds.S   | 21 +++++++++++++--------
 2 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.34.1


