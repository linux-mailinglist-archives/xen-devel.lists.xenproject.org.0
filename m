Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4994BEAB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774150.1184639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3PN-0002lK-Tm; Thu, 08 Aug 2024 13:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774150.1184639; Thu, 08 Aug 2024 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3PN-0002jp-P2; Thu, 08 Aug 2024 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 774150;
 Thu, 08 Aug 2024 13:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3PM-0002jZ-7t
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:42:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b6ef68-558c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:42:21 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa63so1102741a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:42:21 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d35172sm676426a12.71.2024.08.08.06.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:20 -0700 (PDT)
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
X-Inumbo-ID: 09b6ef68-558c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124541; x=1723729341; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MlJshlEfP0trY6z6ni4t134T1UGkAtWOQ6+tmU3qqA=;
        b=dB/OLh6VoT+XDc1bJz29jtcH5gIorUceDSMEu1HseGWrGZV5YtoJ26OLh3cIC5RePp
         PPDT6fyrE0TDDGO+tgL+GsdKZpFNahf3QDM/CZLEo9Aa33WQipmL8fuwjQCeAt2qin7Q
         u/beXyP9XNV5qw8CCmZrwiDmPI/mkaII8kiUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124541; x=1723729341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MlJshlEfP0trY6z6ni4t134T1UGkAtWOQ6+tmU3qqA=;
        b=L4wvW7vPNiyZTKM5uq4A9AaKNfrMmR+EsewapMlQ/vB5K2srmnw9f1L6KE0zqvn0Oe
         DEC9PhIXcYMTQie4iT5VjHfXAaB9C5RMwDZDdpuBwh8MtQs6lY7dlatAOn1UySIN/+eH
         6qHricGsl/q59wVnpsYWvd1gjasgkwwY7bsVoMZkuDk7V1JR6lGy13s4YfsUTBC8hFdE
         FwTYnddPiQ0BrbQsU6ZG5mhaTpuj+l0fz0ARVNUDBO1+Fs8cgjtE/hFdW5LbmtfZV3kC
         kKBCEqEpwArR0SWVjD6kT8g4B+fvi/HQam7T9h094hl4JD9DH5LrqEs+pfysIi3TKXB9
         z/yQ==
X-Gm-Message-State: AOJu0Yy7LN1ProotY1ksGxdo6Zmqo/q+723GBIC2bJbEVM6Yps2fTHV0
	5J5b4S2vaRw0ZUIx+TNUA7shggySAnXJO1nSZtmjqKsawTIRdlfE3opV1Y8wiqmoyCZ4XlV2j3V
	r
X-Google-Smtp-Source: AGHT+IHfcqTL90dQMaU3Kx0X0/vpRT9flDokxYDyPhTTIMLffpxe/phPQd6Lfda81irQIKyShmRG3Q==
X-Received: by 2002:a05:6402:3583:b0:5a2:447b:2143 with SMTP id 4fb4d7f45d1cf-5bbb2218f4dmr1504228a12.10.1723124541078;
        Thu, 08 Aug 2024 06:42:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] x86: FPU handling cleanup
Date: Thu,  8 Aug 2024 14:41:48 +0100
Message-ID: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: https://lore.kernel.org/xen-devel/cover.1720538832.git.alejandro.vallejo@cloud.com/T/#t
v1 -> v2: v1/patch1 and v1/patch2 are already in staging.

=============================== Original cover letter =========================
I want to eventually reach a position in which the FPU state can be allocated
from the domheap and hidden via the same core mechanism proposed in Elias'
directmap removal series. Doing so is complicated by the presence of 2 aliased
pointers (v->arch.fpu_ctxt and v->arch.xsave_area) and the rather complicated
semantics of vcpu_setup_fpu(). This series tries to simplify the code so moving
to a "map/modify/unmap" model is more tractable.

Patches 1 and 2 are trivial refactors.

Patch 3 unifies FPU state so an XSAVE area is allocated per vCPU regardless of
the host supporting it or not. The rationale is that the memory savings are
negligible and not worth the extra complexity.

Patch 4 is a non-trivial split of the vcpu_setup_fpu() into 2 separate
functions. One to override x87/SSE state, and another to set a reset state.
===============================================================================

Alejandro Vallejo (2):
  x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
  x86/fpu: Split fpu_setup_fpu() in two

 xen/arch/x86/domain.c             |   7 +-
 xen/arch/x86/domctl.c             |   5 +-
 xen/arch/x86/hvm/emulate.c        |   4 +-
 xen/arch/x86/hvm/hvm.c            |  32 +++++++---
 xen/arch/x86/i387.c               | 103 ++++++++++--------------------
 xen/arch/x86/include/asm/domain.h |   8 +--
 xen/arch/x86/include/asm/i387.h   |  28 ++++++--
 xen/arch/x86/include/asm/xstate.h |   1 +
 xen/arch/x86/x86_emulate/blk.c    |   3 +-
 xen/arch/x86/xstate.c             |  13 +++-
 10 files changed, 108 insertions(+), 96 deletions(-)

-- 
2.45.2


