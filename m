Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004348C226B
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719759.1122589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NoS-0007O8-B1; Fri, 10 May 2024 10:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719759.1122589; Fri, 10 May 2024 10:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NoS-0007MP-8H; Fri, 10 May 2024 10:49:16 +0000
Received: by outflank-mailman (input) for mailman id 719759;
 Fri, 10 May 2024 10:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5NoR-0007MJ-1i
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efdb43ed-0eba-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 12:49:13 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41ebcf01013so10491975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:13 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87b2648fsm94463915e9.7.2024.05.10.03.49.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:11 -0700 (PDT)
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
X-Inumbo-ID: efdb43ed-0eba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338152; x=1715942952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZjM77xwKEbJpKmLT3A1NDbHI9hBidp1PDA51BLQSpY=;
        b=J11ViC51vwH2yn9ELK9ECH17l3hKCb7zXO8G4fNIU9qAgdCyafYNGipd68RAfSYE2G
         HtQktOI+6n02NO3nL27VzZ6p9mH8e5Ps7q3RP/Lw5hUf1kGiq308ni4HlOlNKl1hrZOk
         HzoLKUUDuSKLgc0a/BOBnAuEA2uJLJwm3gp0xL4vQqaaaaK8D4ygI1/adpB7AXTwWl/R
         Jqoqy2Ynuh3YPi/51eYcWxX9n73YlCtTuukcS4PicSRJadCpqfn2rAJVDAaQ2aFe7UmT
         8HM5xDMySvtIzI40CE/20psNZIprnCms9O/YqPCh1rpxrCXU4DjDmLloWMxnJqKUdY6U
         F3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338152; x=1715942952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZjM77xwKEbJpKmLT3A1NDbHI9hBidp1PDA51BLQSpY=;
        b=j0qXMTk53Ers1XoQwsFZl3EEoGyhK/upCz3QLsuqMCOhVG1tGxX0WpL4YyEwB8CuDw
         FJFALx19ZnTp/7fY0WCNzuoRYmjmTUAQiMZBRNruFaclCpvVxAcSCC/n9pJ3gBJPuTOv
         1DXqqLwh+4TB9cIa++B4bLF9v9qcYSAOGo7Jd0CMRWr+n2vROSwFXr7PRZVhAeL5KMHB
         VyAUnG2GdkV7wU+P5khuDRuNYoVQZ0bA2kamrkT54Lq1jlY2IEu7AREB8kp0RuyrlyYq
         CdGPS2tBMqxSWSgIw6S3Zye1jQucPQ2OZdbtyF4vTHUVSNkH5TmntGavqi6CkFUiOztm
         Sy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzGhbpZ3cXAKEIv6XBcnvv3In0h9DSPMMADg1ljgR8C4gJXTa5YC+XITjsBpEgg1BYm0Tn3OGV5QWvyUsS7tvnI35JlcAnLp4h1dF35mQ=
X-Gm-Message-State: AOJu0YxD8pEqhsXvmBAi/lVZeu2wlNw5oNw+02EhgNDEuTMsr+jGGEV3
	fnI3AMUo4e1quXhEWvgUVwSrh8WV7a5oxQGNR7SuHQwsGmiy8T2zuyCqhbY/bKw=
X-Google-Smtp-Source: AGHT+IH46uVuTTAQ+BBftsxQmGw9P4+zW2TPR3t6Wdb1Buyly/dSLdeEPF5bm3XgUtGobYA/S4G4qg==
X-Received: by 2002:a05:600c:450b:b0:41a:7c1d:3326 with SMTP id 5b1f17b1804b1-41feaa30479mr20356075e9.8.1715338151876;
        Fri, 10 May 2024 03:49:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] hw/xen: Simplify legacy backends handling
Date: Fri, 10 May 2024 12:49:01 +0200
Message-ID: <20240510104908.76908-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Respin of Paolo's Xen patches from
https://lore.kernel.org/qemu-devel/20240509170044.190795-1-pbonzini@redhat.com/
rebased on one of my cleanup branches making backend
structures const. Treat xenfb as other backends.

Paolo Bonzini (2):
  hw/xen: initialize legacy backends from xen_bus_init()
  hw/xen: register legacy backends via xen_backend_init

Philippe Mathieu-Daudé (5):
  hw/xen: Remove declarations left over in 'xen-legacy-backend.h'
  hw/xen: Constify XenLegacyDevice::XenDevOps
  hw/xen: Constify xenstore_be::XenDevOps
  hw/xen: Make XenDevOps structures const
  hw/xen: Register framebuffer backend via xen_backend_init()

 include/hw/xen/xen-legacy-backend.h | 15 +--------------
 include/hw/xen/xen_pvdev.h          |  3 +--
 hw/9pfs/xen-9p-backend.c            |  8 +++++++-
 hw/display/xenfb.c                  | 15 +++++++++++++--
 hw/i386/pc.c                        |  1 -
 hw/usb/xen-usb.c                    | 14 ++++----------
 hw/xen/xen-bus.c                    |  4 ++++
 hw/xen/xen-hvm-common.c             |  2 --
 hw/xen/xen-legacy-backend.c         | 24 ++++--------------------
 hw/xenpv/xen_machine_pv.c           |  7 +------
 10 files changed, 35 insertions(+), 58 deletions(-)

-- 
2.41.0


