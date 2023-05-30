Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A47162DB
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541185.843653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsM-0003f1-6W; Tue, 30 May 2023 13:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541185.843653; Tue, 30 May 2023 13:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsM-0003dK-1Q; Tue, 30 May 2023 13:59:02 +0000
Received: by outflank-mailman (input) for mailman id 541185;
 Tue, 30 May 2023 13:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ox2=BT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q3zsK-0003cy-04
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:59:00 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f7e19cc-fef2-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 15:58:58 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30ae95c4e75so2550047f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 06:58:58 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfe984000000b002fe96f0b3acsm3442008wrm.63.2023.05.30.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:58:57 -0700 (PDT)
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
X-Inumbo-ID: 1f7e19cc-fef2-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685455137; x=1688047137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdYBBTE6aup7a7P5Imkc8FJlVgU6ce1DM4IkbamFAwc=;
        b=E71rr4N12y40l1ZlDvelC/iIjU5eY3/0EGKlLF+ialltzdrmStDdRTDf7MIxMW9V0X
         Uuk51XFe2RJzHalHbLG1Y59q3qdL1RA/VTj+LHb5DnPFTTLjRTexUYjr5rQ94W6F+dpg
         fQFqObmk8VYVxWB1QeGoeKQ1KNg5MzM34HJHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455137; x=1688047137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdYBBTE6aup7a7P5Imkc8FJlVgU6ce1DM4IkbamFAwc=;
        b=JsIT134KS84sYgQur2u9jHnXoSxuYv6152KWnD6uLeu7rQoc+Pn+rlnuan906mjoQ0
         wubB0JXS/EB/a50NghTUIDHYVIRPKVpQrJvebjmfI9FxqOUOctiijYUjBESoTzGYfa44
         IdyqRqio7ogGUervrWozZbHYZwR3cNxisHk+Uv2RFlBdPBh32pta3DTjYag39GEGSivn
         Klh1YQs9esNilQnHbKZgxmlu24jE++Sq+dJ38qo3fnJ7MDu8RgT8Js4oIfCFq/YW5SfP
         MbmYPp65omliBZd5GUTMU7jg38P3BXAk7igTeydtMuZJLL4OG1nnN7n2HT2YGviETydw
         3Ccw==
X-Gm-Message-State: AC+VfDzpOJnm9fbmH6k8diiQW6BFD10lXbGMFslDcOlvRZHxnHUlCNoa
	vrIzgoNg74Ns6Vr+Yz1tgjxgjEPtiZkz4IlbtdA=
X-Google-Smtp-Source: ACHHUZ5DanzzcMNbP8IBYA8wnwOMx6StTtfculEVRukpl7meM/CCnJOhgcfiwICHMJbNCc32Hcaf4A==
X-Received: by 2002:adf:dd84:0:b0:306:4273:9efc with SMTP id x4-20020adfdd84000000b0030642739efcmr1686022wrl.40.1685455137583;
        Tue, 30 May 2023 06:58:57 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] Add Automatic IBRS support
Date: Tue, 30 May 2023 14:58:51 +0100
Message-Id: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
  * Renamed AUTOMATIC to AUTO
  * Style change in xen-cpuid.c
  * Swapped patches 2 and 3
  * Modified trampoline_efer from the BSP so APs use it during boot and S3
    wakeups pick it up.
  * Avoid the delay setting AutoIBRS

Adds support for AMD's Automatic IBRS. It's a set-and-forget feature that
prevents lower privileged executions from affecting speculations of higher
privileged executions, so retpolines are not required. Furthermore, it
clears the RSB upon VMEXIT, so we can avoid doing it if the feature is
present.

Patch 1 adds the relevant bit definitions for CPUID and EFER.

Patch 2 exposes the feature to HVM guests.

Patch 3 Hooks up AutoIBRS to spec_ctrl. so it's used when IBRS is picked.
        It also tweaks the heuristics so AutoIBRS is preferred over
        retpolines as BTI mitigation. This is enough to protect Xen.

Alejandro Vallejo (3):
  x86: Add bit definitions for Automatic IBRS
  x86: Expose Automatic IBRS to guests
  x86: Add support for AMD's Automatic IBRS

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/hvm/hvm.c                      |  3 ++
 xen/arch/x86/include/asm/cpufeature.h       |  1 +
 xen/arch/x86/include/asm/msr-index.h        |  4 +-
 xen/arch/x86/pv/emul-priv-op.c              |  4 +-
 xen/arch/x86/spec_ctrl.c                    | 45 ++++++++++++++++-----
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 8 files changed, 46 insertions(+), 14 deletions(-)

-- 
2.34.1


