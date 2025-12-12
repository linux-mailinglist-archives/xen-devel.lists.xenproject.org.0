Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04ACB99C8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185679.1507704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NT-0001vN-2O; Fri, 12 Dec 2025 19:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185679.1507704; Fri, 12 Dec 2025 19:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NS-0001tx-VL; Fri, 12 Dec 2025 19:00:30 +0000
Received: by outflank-mailman (input) for mailman id 1185679;
 Fri, 12 Dec 2025 19:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU8NQ-0001RM-TG
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:00:28 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d04402f7-d78c-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 20:00:24 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so13564425e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 11:00:23 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4af065sm16863975e9.6.2025.12.12.11.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:00:22 -0800 (PST)
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
X-Inumbo-ID: d04402f7-d78c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765566023; x=1766170823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w511yEjjVrOY9NceOMj6iRd3o8y/UWDDT7EpJJDbvwU=;
        b=YCpfeaDvGsEfMGwmcvAKcGj0BItayP6Sbn/vV5g9dkbkx2Cr6r/P9LSEZl/PFhVPEM
         7EWb7JjDllcz6YQ4sdpMQIqyAod3zypoG+joSlzK5WJCc9F4brD7w8CkkVPFa4LAXXAa
         TK1CI3jLTzYMfLMLacHVzb0S6KKrHAOIR0/Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566023; x=1766170823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w511yEjjVrOY9NceOMj6iRd3o8y/UWDDT7EpJJDbvwU=;
        b=pOzasc3ZZV2zdPHZIKf8HXRTmZzdMhkXH/8WmBtAqWYMv3N94Cj7Enw1JDcdQnPlgO
         ReWRe6TajyDLZPWdwWMBMupPKg10NsNdMgcFDi1HiqwMORs00pacPKxMwM77UELdzXR1
         bUqQYdy7P8+7bdkEr9h70xFJdO/KYYRmf2S8+ZHZGTDupyt9WmKlHGQgcXj2i46OHSxn
         f4K3Z8iciDuGaR5Nsgi9UYB9WqdObpA6bfARNqV2Tb3vGdvCwNruvyxnE4+bprrV+kh8
         cDZVehOEYFzplRtvOwfpnzKHWFZXDoiVsfAwOxNqW+4ekWMXnHhnlYlnPVdjaWY5QPBP
         wL1g==
X-Gm-Message-State: AOJu0Yw6V8qzEg7PFLqF3z+XT9iNHMIkmhCBq/l7+pDOzvJxTndsJz+L
	wtCK24QdrAw74pzQgtBR10AjswI5ZmGtsxCBwl+h9pz5Ap63YjrbrW76VM7oSWv2vx4+KrFOfEu
	p2dUX
X-Gm-Gg: AY/fxX4u1LQLoVjtYRtNazCPce0EcS9XAo/4Ru0c2wlvqBccuItvcUjoihcECHWQUHE
	/hkYK+eTdPkF2QsycWLw0Yzqhe8GCT+bU8YDPeFP2GwlBT3OXDSCwIsMREI7k7bJfewJZvokhDP
	rGookv97jDoDWZlpclQXn0mdg2SikQ3QUGhm64LIJkwqnDLvZoeZ7+vVC+9rqXJ9nBdxn0qUaIR
	Tqmv5fOw17zeeZlWB0lcG34J3usamV22l5P6SzEwsPPVqXzfi/C7uxF2gbngmYfOxNNBDHW/NUk
	drBtXnmw47KjZCrkDqF/iHP45kFxylziOd57P5DS747jSadYZ6FWuXB5/zfk0TviSqEebvTY2Vj
	2KwIEBCUnFSOqQH17dr/9MHZb/dFTLflV3C+gsWvgfKT4YBF28RjEzDcBoBn1KRHsR5qpFVyf0t
	j4y9aLp0Fk+fZKtdIygF6pHGTzbd1RPLj623iAE67PGcde6nFGrguKUkEGUBfzUg==
X-Google-Smtp-Source: AGHT+IGJ0Fp5oDLzFajLYS6RonQsRV9QLA/st6RyYYqIHytlOOpLrwW3ZK1p9DWX/KRqV8jHeHiPjQ==
X-Received: by 2002:a05:600c:46cf:b0:477:a3d1:aafb with SMTP id 5b1f17b1804b1-47a8f90d757mr32908855e9.29.1765566022977;
        Fri, 12 Dec 2025 11:00:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/5] x86/svm: Untangle the remaining global svm/ headers
Date: Fri, 12 Dec 2025 19:00:15 +0000
Message-Id: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This turned out to be a little easier than I was expecting.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2212088192

Andrew Cooper (5):
  x86/svm: Move asm/hvm/svm/svm.h up one directory
  x86/svm: Move svm_intercept_msr() into svm.h
  x86/svm: Introduce svm-types.h
  x86/svm: Merge nestedsvm.h into svm-types.h
  x86/svm: Merge vmcb.h into svm-types.h

 xen/arch/x86/cpu-policy.c                     |  2 +-
 xen/arch/x86/cpu/vpmu_amd.c                   |  5 +-
 xen/arch/x86/domain.c                         |  2 +-
 xen/arch/x86/hvm/svm/asid.c                   |  2 +-
 xen/arch/x86/hvm/svm/emulate.c                |  3 +-
 xen/arch/x86/hvm/svm/intr.c                   |  1 -
 xen/arch/x86/hvm/svm/nestedsvm.c              |  3 +-
 xen/arch/x86/hvm/svm/svm.c                    |  3 +-
 xen/arch/x86/hvm/svm/vmcb.c                   |  3 +-
 xen/arch/x86/include/asm/hvm/domain.h         |  2 +-
 .../asm/hvm/{svm/nestedsvm.h => svm-types.h}  | 76 +++++++++++++------
 xen/arch/x86/include/asm/hvm/{svm => }/svm.h  |  8 ++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h       | 63 ---------------
 xen/arch/x86/include/asm/hvm/vcpu.h           |  3 +-
 xen/arch/x86/spec_ctrl.c                      |  2 +-
 15 files changed, 73 insertions(+), 105 deletions(-)
 rename xen/arch/x86/include/asm/hvm/{svm/nestedsvm.h => svm-types.h} (52%)
 rename xen/arch/x86/include/asm/hvm/{svm => }/svm.h (86%)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/vmcb.h


base-commit: e6836f213f0f9d3aeaf7c89ce1e20716795b37bd
-- 
2.39.5


