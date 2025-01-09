Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C0A07C23
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868813.1280324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVudK-0002Ym-9M; Thu, 09 Jan 2025 15:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868813.1280324; Thu, 09 Jan 2025 15:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVudK-0002XJ-6C; Thu, 09 Jan 2025 15:39:42 +0000
Received: by outflank-mailman (input) for mailman id 868813;
 Thu, 09 Jan 2025 15:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rr8/=UB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVudI-0002JF-9W
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:39:40 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id effc5b1d-ce9f-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:39:39 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-aab925654d9so223668066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:39:39 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95aede8sm82723366b.136.2025.01.09.07.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:39:37 -0800 (PST)
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
X-Inumbo-ID: effc5b1d-ce9f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736437179; x=1737041979; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBELJMfcQLbPtCCptLilrfSS47bvE3E/Zw4kGGrBEv0=;
        b=pqOaBmckgw4XfVenNeUNgITcl3Nr6PdP7Aj2coBsQhW21TmsCEaDTlM6bwIcfzbYRX
         szPIcz0anSKzf6H53Jc4FURdflrZgmbTTYgT8p0rXqpm050Z3/phojCHunPUatEcR3zu
         Wni3coUuJOBBXV65JPRa5bf6DunvjuJuIeVrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437179; x=1737041979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBELJMfcQLbPtCCptLilrfSS47bvE3E/Zw4kGGrBEv0=;
        b=YKveGjN0cFl6Gy210NzS7FR/W+JmQ21Ax5yC1kjXuXJ72N8T+X30i4yyylJFuPd0i+
         oZM2rF91CWL4E/GAmjSJbx+LwN4l2AOXMkZgANsuVZ2nyP/pXhz1wjqawsxgYzp/9gNP
         ZCTbQ0l9xA6VzniRziaxbWB2llk5MZgBN75i4lbfVy4KriyhyZt1IUsxzv6prYGnB89L
         UNHyJXmdxnvDYSy0jN81Ja5AbJXs5mDTfca0AYszZoiwk72ZsS6uFoi6oJQvvfNyNP8y
         cHZzBiXYBVqK4lMjfaS2eFdIluc+PdB6uwYXDe38SypsHMKjjkkVbyqL0e1+ccXu+Gw5
         0IEw==
X-Gm-Message-State: AOJu0YxgOqScROU6ypdPtTQK3hitH2lJs5TF10oFnCJgjXioC4NpjcFc
	chLPFheSuVnu+uOKU6ddVO7/QG021PrC+3zz+dtElgidPdpvXcwIciv8TE5sXslAuyZYO/mfhc+
	yhQ0zzY1G
X-Gm-Gg: ASbGncvTSxqp4bY3kyaZdnrOSAQKtmIDH0uBRZZNg2hrm+d0WglUEpvFJVojFWPCVEP
	IzCDYSNvhXAI1AGFdrqtFdKLB6pGT8f5Oeh75S3OMgYdP7xw6mhidvrnMLvWDbfb1q8T70x2D4d
	ljQUSxF5XDx1Bzz87aG/+z40l4b/yoBBfH+LM8bh3703UJk/vaFu8XE/8Qkaw0vhokA7ldq1cG6
	6W/Ofyaz53TQTZ0aiS75oZkCg+lEcIU/Oo5al714w+FElQEbQQf8Wu+rcurXRDT4b5HUgRq91f7
	ArBdWw==
X-Google-Smtp-Source: AGHT+IHtP4FOlBZjpbvvefs9nxJn0Hn8juf6phznlEVYdIEpbER1mVFllXQ6UD0UNUGCHrgsTnfjZA==
X-Received: by 2002:a17:907:3d93:b0:aa6:66bc:8788 with SMTP id a640c23a62f3a-ab2abcab45emr684090166b.45.1736437177552;
        Thu, 09 Jan 2025 07:39:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] Config.mk: Pin QEMU_UPSTREAM_REVISION
Date: Thu,  9 Jan 2025 15:39:20 +0000
Message-Id: <20250109153921.43610-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250109153921.43610-1-andrew.cooper3@citrix.com>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index fa0414055b93..13aa6ce3ab26 100644
--- a/Config.mk
+++ b/Config.mk
@@ -221,7 +221,7 @@ OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
 QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_REVISION ?= 3fdb3cd3a27a22a050c7d27126a24807a7a45745
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= 6d5159e8410be16a47433bac1627e63f8adc7cd9

base-commit: 40f35d07aa14bde44d7baafad171f7c92b053017
-- 
2.39.5


