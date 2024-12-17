Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C49F4F06
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859300.1271440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZGE-0007A9-1e; Tue, 17 Dec 2024 15:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859300.1271440; Tue, 17 Dec 2024 15:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZGD-00078J-VR; Tue, 17 Dec 2024 15:13:21 +0000
Received: by outflank-mailman (input) for mailman id 859300;
 Tue, 17 Dec 2024 15:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ1q=TK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tNZGC-0006c0-6P
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:13:20 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7246274f-bc89-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 16:13:18 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436202dd730so39118465e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:13:18 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8049facsm11612456f8f.79.2024.12.17.07.13.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Dec 2024 07:13:17 -0800 (PST)
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
X-Inumbo-ID: 7246274f-bc89-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734448398; x=1735053198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6S2xlttjp4VhpiTH5RBxnctIn3RW53HPZ3WyhXqjYw=;
        b=HvsB7Q21FpA0Tz9szeDYNBM0tG1RvTH18bFEc7AuLhOHD97bSLgK34nQEInpguMPps
         9WK2twMxq6CuLmScEh6j82LmtNsgyIPBOXtyAPsdngM0SrU/jBsQYWz/xBKS3M9T3NRb
         mSl1+XltjiQI6c7sw71WRH+mScsh6OB5xdDpzLDyRbSptXVZCZiJIbeqj/gGhuu4VOtw
         kWI8ESrnMB6yEMxk66OvRS3gzeAZ4NZKChYdRwq9DoZ6xZMrIXM1AMqkH1UXta1xLnB0
         dl4+yRXclOBUEKeRspyB/5L1xTr9qq8oHLoayBL0CriytF7wM37vclew6ir2rzAQ1Wfr
         sF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448398; x=1735053198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6S2xlttjp4VhpiTH5RBxnctIn3RW53HPZ3WyhXqjYw=;
        b=CFNJTAW32Ph3q8GJQ3v8YNbNb3fayJ77zYhprG9No4B9ImbbOr4kV1kVQBRWEZtaje
         vCimro9MnDCoOSfHXm8LnZBJa03SCyQuRT8DS0DzXO2ogd8UUrl9y84wGZ8nh1DijOLX
         1tKptKApU72DLRG9CSoCmyDi07VQSe112yNh94Zy4QuASAgTZYGUW/6osXvXE4HE54Z/
         fZnCXLBRICvpkY6PmfYYZngruCJm2bi16FkAx5Z9j2YO3jntgL4Cu2kOAHVEZoxLyRvV
         qqL49n2cOBS5aiKVndZU2b75zZbOSHGWBtRAZ7td7Q48alQlMomejQidt6a6YnAZgksP
         Y2KA==
X-Forwarded-Encrypted: i=1; AJvYcCWR3wXhMSYtWilJ8pKF6r+b5JRYdFjxejeYevwReVmDNw5nnrr3QZ4nqRT4Cs8906+kOHLSwPt7TxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+TQKkGV9PeebeAUQDxxp2eKEXmbq9qA/IqP5Ob5d1x6uJifHA
	R+bRTL7lEOt7551l7+Ij8eFE0H/mtM1/tmkGohzIadpf7BX+fkN3IplRSW+dKPI=
X-Gm-Gg: ASbGncsM4+r4VgMJ9/jQmvVPbxa5OqVeodcZwCvblRu698O9Rl92WzKU48mTsz/NiA8
	g4rOaQAlgVowwi0+KC7oM0jAE0c1Q+O1kyOxPrY7PEbnqGpHbZ3rgNXt+rUH9GhknqknIk3MjT9
	vXadW2vG2MuPq7PeRWdcXgnMvRGvf0buwhhPput77uPJGF8seIoP97ZR88Z0UPDBLeX4nfNyfwV
	AxJwkCGz+JL7rVS2wHUSCrb5cubKfL3qzR4/Vuf9ETBH3PkyN5x5R79mcAa/09ZMqF8+uDu7/my
	ZY+P
X-Google-Smtp-Source: AGHT+IGcIc9C+9xF7u7hW0QxoRTcmmxZgIQEQHrG2A+QXqPWKTn7jmn5F5uLxS1c0rghk9D+Onu6dA==
X-Received: by 2002:a05:6000:4012:b0:385:f220:f788 with SMTP id ffacd0b85a97d-3888e0c0656mr14540012f8f.48.1734448397845;
        Tue, 17 Dec 2024 07:13:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] system/numa: Remove unnecessary 'exec/cpu-common.h' header
Date: Tue, 17 Dec 2024 16:13:04 +0100
Message-ID: <20241217151305.29196-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217151305.29196-1-philmd@linaro.org>
References: <20241217151305.29196-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nothing requires definitions from "exec/cpu-common.h",
do not include this header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/numa.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 04676141470..1338db9502d 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -3,7 +3,6 @@
 
 #include "qemu/bitmap.h"
 #include "qapi/qapi-types-machine.h"
-#include "exec/cpu-common.h"
 
 struct CPUArchId;
 
-- 
2.45.2


