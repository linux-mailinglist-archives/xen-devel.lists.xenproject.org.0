Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434655E593
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357162.585614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ckq-0000Ia-84; Tue, 28 Jun 2022 15:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357162.585614; Tue, 28 Jun 2022 15:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ckq-0000FT-4a; Tue, 28 Jun 2022 15:03:52 +0000
Received: by outflank-mailman (input) for mailman id 357162;
 Tue, 28 Jun 2022 15:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Ckp-0000FN-2O
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:03:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8449c901-f6f3-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 17:03:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id eq6so17978352edb.6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:03:50 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm9785589edo.77.2022.06.28.08.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:03:48 -0700 (PDT)
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
X-Inumbo-ID: 8449c901-f6f3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hSJtrhUfilQnx5h21KZUt74irrz86sKwXYnsxGTRXgk=;
        b=mGraIyHHNWSGCry3npUmLLDoL6T959Kx2UZvOMuUJYg5IGxABcjqt8jSvK2DbXKBG7
         cqOdKg4ZOUwqSdGo4pf7CbqBneTtrQbX5JM2XkM43ewlWemwve9tEZe53zBkERUFvqX1
         9nFk9ycqVC7i+h8Rm5H6bT8U7Yb6MMseuMwYNgtoGAARmenaQ0CpRUTAiPeepk1fAfii
         2OSbuua1tzfKGeFIb2oBOi+kwgiFxRblMYJJWR9bGLp092PsRcILAfx8v7It9SFxls/q
         IxPT+UN5TVu2VKUf1AayzIBLhCmTrl2iFYQnslrCGIOOn9Z6RIzd8DT/3vOg8taTH1vH
         v2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hSJtrhUfilQnx5h21KZUt74irrz86sKwXYnsxGTRXgk=;
        b=mG662GL+MgORS8eneCwak75KuTh8L4azoNsPnokBJp5fBfTqcDWpacqNStgAm/mS0U
         6jHUhUTHNZXd+yNvMEgtsxjuhuOIcad8630xPH/KH/CqXKNG4ekrKYuwmMfNkc7Jyxsp
         mGh/UbiwmydK5BPDq7zkOJXj883EpiRF8urjYlcDKDTUIl7ZhNw5ysZDSuOKkrOqbpS8
         iA+KMB3wTnz0lePsEJ4NyhAHxD5k1qQJhEFESb/sho+8T8yhU/gJV4CH4blV0XrOiDmm
         gSAMzNV5SdSgaWUTHm4ysmSsWqBkO5XEJ9pHTluV7b23/LQoQslDj30QnWtQ6qfSK26e
         wrBQ==
X-Gm-Message-State: AJIora+afoLXDPHQza/k+w9NDglBM308++hzeX7JA1bAEagxPygd/cAW
	bd3cyyeN6hJsYm1jZHvhYw4ZgtvS6FNwyQ==
X-Google-Smtp-Source: AGRyM1vGiynz/8MYX1qcwwpGeO94p767eEaR2FbJ6+FRN7kSWmnvO6sDs8TuWpPbJI5nDevdTuSV0g==
X-Received: by 2002:a05:6402:31f6:b0:435:5a08:d5e0 with SMTP id dy22-20020a05640231f600b004355a08d5e0mr24026373edb.308.1656428629199;
        Tue, 28 Jun 2022 08:03:49 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/5] Fix MISRA C 2012 violations
Date: Tue, 28 Jun 2022 18:03:32 +0300
Message-Id: <20220628150337.8520-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve MISRA C 2012 Rule 8.4 warnings.

Changes in v2:
- In commit messages of patches 1-4, replace the phrase "This patch aims to
  resolve indirectly a MISRA C 2012 Rule 8.4 violation warning." with
  "Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4
  violation warning."
- Add "Reviewed-by" tags.

Xenia Ragiadakou (5):
  xen/common: page_alloc: Fix MISRA C 2012 Rule 8.7 violation
  xen/common: vm_event: Fix MISRA C 2012 Rule 8.7 violation
  xen/drivers: iommu: Fix MISRA C 2012 Rule 8.7 violation
  xen/sched: credit: Fix MISRA C 2012 Rule 8.7 violation
  xen/arm64: traps: Fix MISRA C 2012 Rule 8.4 violations

 xen/arch/arm/arm64/traps.c             | 1 +
 xen/arch/arm/include/asm/arm64/traps.h | 2 ++
 xen/common/page_alloc.c                | 4 ++--
 xen/common/sched/credit.c              | 2 +-
 xen/common/vm_event.c                  | 2 +-
 xen/drivers/passthrough/iommu.c        | 2 +-
 6 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.34.1


