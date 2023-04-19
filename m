Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6723D6E77EB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 13:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523350.813322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5YI-000218-M4; Wed, 19 Apr 2023 11:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523350.813322; Wed, 19 Apr 2023 11:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5YI-0001ye-IX; Wed, 19 Apr 2023 11:00:42 +0000
Received: by outflank-mailman (input) for mailman id 523350;
 Wed, 19 Apr 2023 11:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iFQL=AK=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pp5YH-0001yY-DZ
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 11:00:41 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b791d32-dea1-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 13:00:39 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3JB0Ts80
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 19 Apr 2023 13:00:29 +0200 (CEST)
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
X-Inumbo-ID: 6b791d32-dea1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1681902030; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qLn7eJ/SBtQxncBY5F2ADI24CAHM/wdJl74j/yoVkCa3QvYrJVa4URBUuEgHiSZZ1h
    /xxp1BPOPeRFp0H6mS8Q3esewq17RAdaihh2Jq3XT3GFMMhEj5t2CC2evXL55jZT0rm6
    7tF1WLW67Z081XP5Vbh/ewSdtw4uZPRvSW92bXokSWm/lwQPQIVu9R1uzsR7yfz1B1QT
    b/nHpyzBg5g6RTvAeDV52dT/mfPm5ky+uNT1ffISBpgdYIy66v5H5w2n3TRryAsAVf+o
    akfFqfJ0LDSdvRAly4L6r1iMZFmO9r0zNfvIoRop9qF1Wnskjo5e1ruAOHgF4e2Vl9oF
    NWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681902030;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OObpQ2qPdIBjpIQyaVqcTd8ZC+MfyA043X1uQ6czbLM=;
    b=NtjQvrz0w7v7t+Ct9jjD/TRBWBS9JKioUdAqBQ+FXwVcXdtOBLyCuJKHR6vov6vObL
    /hoRquQjyuP0lecqoaXUKSBvhwcAwt1aUByQh6leIlIfJZ+NyHTBIbBKVqbal+SztCtg
    0gR+jkeyED8zHc+8TXy6oiwTSEMpnEqej0b1QYkyN15rAXgX+HP2SNprF/BhEVrqQHtM
    DjC5SQn01pmSW2ZE4+pyYDbAC7FHuQFkAMMtSiMorb3K3m/1t3ZbsOEbakoG78uqMHet
    VRLXXZ5DXlpV35ypGwX485uHcYgpJrFr7JBE1ZqzDBzhrq3RB4Yx7O/cYanf78OlOKsB
    bL0g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681902030;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OObpQ2qPdIBjpIQyaVqcTd8ZC+MfyA043X1uQ6czbLM=;
    b=mFmMjjLIQtYFvQzzwuGkfohNOjS4nXQhIN9bPqORzfP/bRh+73qr5FkhMCh9JINb2l
    SXfO3trnn/5rA0+eYVrMGjz1yRu4L46UkZRe0lC41A1CW/f+SdgIfYuwiIqbmls2c2OQ
    oU3N8KS+4F/jhP0gIJadl2MY/aSwLLRplWwfGS0GGJ3tjW01j94DU8eNNXane/5zXEjg
    TpErBpr2/SM8Qq8et9UnAUOthWLddqFgQEih2DCKvESY+zt99GtSn5/zmPsT/ajzTniD
    ILndD0bQPfQzi6PL7a3/aBWxLrbcMWr2P9pQyie24Rg9N5dpCUCDdleG22FqdscHXP7C
    EzeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681902030;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=OObpQ2qPdIBjpIQyaVqcTd8ZC+MfyA043X1uQ6czbLM=;
    b=rLiOJ3JrpCDt2v2F4irOOjx15mBCxMzhTZzLBvyeM1QV9qm3uRMcP8/i0MpF6JW1Wp
    S7i1gq88Wd+xZZPR1mBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqlr7GpgtSxIX+ZWs95M7PYKTHoBaxED20qrwFA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: ipxe: update for fixing build with GCC12
Date: Wed, 19 Apr 2023 11:00:26 +0000
Message-Id: <20230419110026.25429-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Use a snapshot which includes commit
b0ded89e917b48b73097d3b8b88dfa3afb264ed0 ("[build] Disable dangling
pointer checking for GCC"), which fixes build with gcc12.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/firmware/etherboot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index 6ab9e5bc6b..884ba35692 100644
--- a/tools/firmware/etherboot/Makefile
+++ b/tools/firmware/etherboot/Makefile
@@ -7,7 +7,7 @@ include Config
 IPXE_GIT_URL ?= https://github.com/ipxe/ipxe.git
 
 # put an updated tar.gz on xenbits after changes to this variable
-IPXE_GIT_TAG := 3c040ad387099483102708bb1839110bc788cefb
+IPXE_GIT_TAG := 1d1cf74a5e58811822bee4b3da3cff7282fcdfca
 
 IPXE_TARBALL_URL ?= $(XEN_EXTFILES_URL)/ipxe-git-$(IPXE_GIT_TAG).tar.gz
 

