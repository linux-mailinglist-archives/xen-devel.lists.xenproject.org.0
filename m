Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603A55B0E4
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 11:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356070.584072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5Orn-0008Da-8n; Sun, 26 Jun 2022 09:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356070.584072; Sun, 26 Jun 2022 09:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5Orn-0008AP-5r; Sun, 26 Jun 2022 09:47:43 +0000
Received: by outflank-mailman (input) for mailman id 356070;
 Sun, 26 Jun 2022 09:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cB6r=XB=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1o5Orm-0008AI-LH
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 09:47:42 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05257ae5-f535-11ec-bd2d-47488cf2e6aa;
 Sun, 26 Jun 2022 11:47:41 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id z19so9140889edb.11
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 02:47:41 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-055-174-013.78.55.pool.telefonica.de. [78.55.174.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm3504752ejt.212.2022.06.26.02.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:47:40 -0700 (PDT)
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
X-Inumbo-ID: 05257ae5-f535-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/18Wn59mCVUcj5sOf0xFz2mH+5FELr59xslfCm8MOAc=;
        b=KQFT2epSHelgMWfg3dPUpwaqRsz0pA/6e5/iNbH31U8kKSk7PILo/zpeyNLhXSDyXY
         ksboRyLpVAxrJRZjtAxwI3LHi4Wev6eMXmfCmklaVS9jL5Z0KdOvXRm8kckW8cQo37FC
         YxXRil6dPmLObGen9MY5oVQjsCSzQpEAo2wWpnmmO4mbiRNQBYOWldMYZSjEPl0225FR
         bEtKL5nACHbm2OBsnHlqafqzkrPAhIn/1zznkFdgYP0bcXQdy3zrgOkXKwbBqj6/7JAa
         sV981rtXpApP/c92nYXlgVMSFrNCgMY6+ei3LwETElwYuEt2S19vSnyRJs3hiw/3EKzy
         utPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/18Wn59mCVUcj5sOf0xFz2mH+5FELr59xslfCm8MOAc=;
        b=IyVyajdPmZHjwfPcKluIrJKuGXjh0JkIPbjnqazA3DytNaKSSaq69IapUjBMjNX3QJ
         iBok9DaNfeher9mPvCA9UzQuXOMczsWDmnEm0lYgdrmHktd9mL6f6irT4XCx8CTQNN0D
         08Je75y1lj330mItFW6oPgtaHaUk0mn2KwBDUrXDDz1bZDYfCR8+TTQVVXTSkRgf2ENo
         /KcbhbAMxb+oijxdNVGVoz9X/G5HXl0DG4UNbtKSm9JP9Naa1vV20IO1vL2ipta8cOJv
         vSfhEoSlLUpp+9y7FqA60RcOxEpEnGPxjVraR1njfmuWt4gNaNCeQBYSz5PtJNtz7qAq
         krew==
X-Gm-Message-State: AJIora912OnXEOuxmRPfaG91QjgUEYYSeDr6qEYESGURqMM5Em1f8DmV
	vu5vFThFTmXat/TU0C8hm8I=
X-Google-Smtp-Source: AGRyM1v/lS+4NjVferS6kUoLylyCQHZ+ljz7kEWCPuWjTusvwodjvL0yfMAzSACL+nodY1l45DSCNg==
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id x21-20020a05640226d500b00435aba29495mr9923552edd.133.1656236860604;
        Sun, 26 Jun 2022 02:47:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/2] Decouple Xen-HVM from PIIX
Date: Sun, 26 Jun 2022 11:46:54 +0200
Message-Id: <20220626094656.15673-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hw/i386/xen/xen-hvm.c contains logic which is PIIX-specific. This makes xen=
-hvm.c depend on PIIX which can be avoided if PIIX logic was isolated in PI=
IX itself.=0D
=0D
Bernhard Beschow (2):=0D
  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()=0D
  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and=0D
    remove it=0D
=0D
 hw/i386/xen/xen-hvm.c       | 17 ++---------------=0D
 hw/isa/piix3.c              | 15 ++++++++++++++-=0D
 include/hw/xen/xen.h        |  2 +-=0D
 include/hw/xen/xen_common.h |  6 ------=0D
 stubs/xen-hw-stub.c         |  3 ++-=0D
 5 files changed, 19 insertions(+), 24 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

