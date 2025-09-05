Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83941B45418
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111580.1460237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKC-0007jT-Nl; Fri, 05 Sep 2025 10:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111580.1460237; Fri, 05 Sep 2025 10:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKC-0007ht-L7; Fri, 05 Sep 2025 10:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1111580;
 Fri, 05 Sep 2025 10:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuTKA-0007UD-H8
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:05:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e14de3ae-8a3f-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 12:05:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0454d63802so327912166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 03:05:41 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046aa92242sm589136366b.59.2025.09.05.03.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:05:40 -0700 (PDT)
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
X-Inumbo-ID: e14de3ae-8a3f-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757066741; x=1757671541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPitMHA0jLlZD3e3Xgx2NPRkFt8Wh9k4Wg+0HJuHEqU=;
        b=bGm0NIwLyFnpLCxUnOPWqDFkOBgmfltuYulANuRMHYEG52EWvFNfu46Th8oNa6x4OV
         lUJLquGKLOR4GoqZfa1Xn+/YrgOrX0bgBLX2MPZbq0LpREi7WaxxTs9PvUia1KmJErAg
         6PMFfPX6z7sraViBoWSbQP0pUL8rmFVfAStpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066741; x=1757671541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPitMHA0jLlZD3e3Xgx2NPRkFt8Wh9k4Wg+0HJuHEqU=;
        b=dtPMd2cBEnL4UTFsJYpbi4W3y3sJJqzR07ZduiSQ+JHMZgoZ00nPiieKE7AK4WOnw+
         ZH158G6fJgtNiLzG5HiI9PPNaQNIRh0eZ2w7wefZEQ84fm4MZB4naJCGv1G5J9Tj+Yi7
         lnaH5pxGxd5jzcT4nWpw0qZsv//r31sul3CZ/yAZjlEjmbb9Rad9phXWZeKOOJF2OQwl
         U7CmDLYq54J4fOIoSW9JWkmIsQM+TSWZcpeOmOl8tqhfqzaNK8bhqv6Z5vfU1aGGuAQd
         lWwEm4yQ8rdvGi8UtqeowBoE/tN49zNjatf965DOfdq+lDJoe1VoyfxiHW3NsN98M7lm
         hhCA==
X-Gm-Message-State: AOJu0YyXkBVRUVF/6+a34j65s9q+17ZjInaucCh4vyojjgT1RBYSbICi
	Y01kEGvNtRHi5NZUffCqvqaFoctA5TSsNVCPcu/noh5wIoo7Tu7hvhxOPIzTM5K2x9jUSm9q1TI
	1QN5iCXs=
X-Gm-Gg: ASbGncvey2oqCghkoiQ1BDT80PmgnLzAxBqiSNw/Rf25n6nib+WhgbiXvwiQoOfNSW5
	X2UUiRVFi2NUwA+xE7snc2YFdR4gJFnZvM9hHIAsozDNIiMxrT1XrakynbJvM27C2a2IKA1IC/K
	ktdBM972icd6Az5eHFYXjL2Ea3rTdF0KYVLq1ei1soR07ndlnaR8qP/FAgv1MA1tYlWkfD9LFEG
	PJDvEjn1m8Cu1QZw7N4q5xGLTqQlL/CBwt2/gAAT9Y7umoAR8vCgixKNXDbOM0kEqxGYt9DG0zG
	K4xoAzwc7VWIuV66yHdSFOIFzglKNwDE75LXbOA/exxBgWE9AIeB86qYPMNxjF3SdzBOfDDYc+m
	V8nE2CrMXAW+gTld3vU+mtQyMsdQFBNtkLhlniea8QihItw==
X-Google-Smtp-Source: AGHT+IG1Mp//cjVox34ogFLm0En43L8JoN3VGqJiPNeWa/nib+CJdPJRUSpYH13i8vQV5m4EM4JLHg==
X-Received: by 2002:a17:907:72d5:b0:afe:a6d3:b4a2 with SMTP id a640c23a62f3a-b01d8a39b3fmr2307105066b.11.1757066740796;
        Fri, 05 Sep 2025 03:05:40 -0700 (PDT)
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
Subject: [PATCH v3 0/2] efi: Support Shim LoadImage
Date: Fri,  5 Sep 2025 10:05:30 +0000
Message-ID: <cover.1757066332.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Support Shim LoadImage protocol but keep Shim Lock for compatibility

https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2023640279

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


