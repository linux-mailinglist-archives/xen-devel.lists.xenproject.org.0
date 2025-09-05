Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A485DB45755
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111863.1460418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVGy-0001Yv-JT; Fri, 05 Sep 2025 12:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111863.1460418; Fri, 05 Sep 2025 12:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVGy-0001XP-GG; Fri, 05 Sep 2025 12:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1111863;
 Fri, 05 Sep 2025 12:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuVGx-0001XF-1D
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:10:31 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d8651c-8a51-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 14:10:30 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b0454d63802so346344066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 05:10:30 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047a90387esm449572366b.0.2025.09.05.05.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
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
X-Inumbo-ID: 50d8651c-8a51-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757074229; x=1757679029; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8crF7tA8X8rS5SsOrxDZg6mAqCFfsL8KpASg5b0qYF4=;
        b=iIuTUu3jNAS5Qb8M33IDFKL1ozST3IQOIxPxgL5wO3IZqXqW5ByGvthclG3MqqEr4X
         UxKOT6/sRTWG44IQzmMOWkpS71LHvftjefYSVWGeyW7F9u58MttIBuTDT3l/S3Mv5jsh
         heiJPsx9/8QhRr0EyE5oozX2OsMLDh4d+joKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074229; x=1757679029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8crF7tA8X8rS5SsOrxDZg6mAqCFfsL8KpASg5b0qYF4=;
        b=KxUM+m7OMB/nyjUyU/K1QqkaxxfnZ76VlnPexe82yblQqtIe7+2nEfmAwXwT4kbGCk
         mE1/DSw8XTRsq9UymQvqtB+zu7F+IW6BiWTrmW5gnww8lLBw+bPf9TdSZPn3lkD59pyi
         CrpurlBCFge9JaXFuEZB+AkF3T46jMPws7Q0NvQ2KX186AGRgDuwaIKx4v2jFFJFJi7o
         cNPdPVfSwwbVsMCoCCCaBn6CMgiX+3kraVJ9p/E1sQmoad7ueUhDTsT4vwUsI+cW8NUX
         UYeHAs3nOYIbAQAkFzUnaZdD83CkpIVjJb6WCtomR3/Bzm8J9/v1ESQCIz6npA2lkeNl
         NMqA==
X-Gm-Message-State: AOJu0YxWNWj1fGaMKEFFDZLsEbtgKY0lIEycSJn0AMOMw8y245wFvRhP
	eru3hpeJrxxMF8TLfbiSj/tTpWgp4PooUHJI8w5x2D92jmMIRXuGKzHw4cAzGqhAm9xhscASAgI
	BAttY8iY=
X-Gm-Gg: ASbGncu38JiKd8/GNRZnbCH7510Mzs6UcwfCMjSVbHCuBTdr9iSo4fJLCjrG7lCb/RE
	eaoy5S26dnEltWkkPv+waaTJ5EPHLWeN3AqSdBTncHrvVBTvoFQ4qoKyfgo8aoNE+yD8VLS4Z17
	ypfcpIVXkHZXZtkc9dZFFNNEgNOfN7rMZnEehj1cZCFepW7VosNcdVqBDoBdahWzjPAaIbGT0ht
	8ATP9vlDB0qxLFAb93WB9KUpZTYyYSGXK3Vz6ab7P6OnPNZcbRwImkIjGFp93Ol4zKvHjBxniSn
	DCARvfZhIB8VNXBk1KuyqfJjYMMT3guxSwx8m4QM868wkLEKa375wsxVnd3G26fA/HKOwGBMKRt
	eRup7kOy/pe1v+KTwTY6U3BNjPZo4ltnfYNPdjDRbujfiKTDa8pOU2dUq
X-Google-Smtp-Source: AGHT+IEeKMxfRq7U488RdLBJJu/9JCSt+X6cbrSK6sM8m9YlWylMRCGg7LNRKpgvm9xPt8Jkvqxa+Q==
X-Received: by 2002:a17:907:7f8d:b0:b04:4147:9f81 with SMTP id a640c23a62f3a-b044147a275mr1482781166b.21.1757074229402;
        Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/2] efi: Support Shim LoadImage
Date: Fri,  5 Sep 2025 12:10:16 +0000
Message-ID: <cover.1757066332.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Support Shim LoadImage protocol but keep Shim Lock for compatibility

https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2023841743

Gerald Elder-Vass (1):
  efi: Support using Shim's LoadImage protocol

Ross Lagerwall (1):
  efi: Add a function to check if Secure Boot mode is enabled

 xen/common/efi/boot.c    | 83 ++++++++++++++++++++++++++++++++++++----
 xen/common/efi/runtime.c |  1 +
 xen/include/xen/efi.h    |  2 +
 3 files changed, 78 insertions(+), 8 deletions(-)

-- 
2.47.3


