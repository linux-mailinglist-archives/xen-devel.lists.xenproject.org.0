Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5E9B355B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826685.1241044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0K-0000Ck-Vn; Mon, 28 Oct 2024 15:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826685.1241044; Mon, 28 Oct 2024 15:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0K-00005H-R2; Mon, 28 Oct 2024 15:50:04 +0000
Received: by outflank-mailman (input) for mailman id 826685;
 Mon, 28 Oct 2024 15:50:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0J-0008FV-Bx
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:03 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4527a6-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:00 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a99f629a7aaso711148666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:00 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:49:59 -0700 (PDT)
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
X-Inumbo-ID: 4a4527a6-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130600; x=1730735400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=czbuFAPZSDRqGdAkOsiYgLR3DREhnvnkdIK4ff9uSdE=;
        b=XRDbTsyhMX8Qdk8qIV64prBU5LXICbCHhY6Q+WmKPTWIR7HeBWn18/TAqhjXvJyYEV
         4HYF2IpjnEERvUiZviWC8NHZlNbYQVJF/ipaVMN9oMU5fcyuTLmYkaiAekzOv8mX4jmq
         5l6/JwldWXSB43caWeVrn5C4qwPyNcZNEPxCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130600; x=1730735400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czbuFAPZSDRqGdAkOsiYgLR3DREhnvnkdIK4ff9uSdE=;
        b=lD7mdNjgyiOMvjNdS3DhGkTxgS3fs2KxFjEka59qTmFA5xW9Avlu0FjtThyuJvMAqp
         N7s05ay/iGuVFgQ7RVPtazeN5eGgD/YJEcoUnEEq/rrrAp/XQrK4Qr6OCt+z0N6Yy9h+
         rN0RTGGC+fBd/XnVAmsFo2kS1Yu1n8KKX+AIwQlzb69+nddGGLeSDVljBkjKN5YH/o9B
         MOulLxrvNpG9kJ7WkZHV9GQu84M7TVQew1Mg647UdPNLgaS52tZ87CCGSEzdjDR1PomC
         Y0WCbqRKG9QcVkWLfXH8hP9rDSM+SzLtzGQwm8RwtXHz9JZpxsjkM+/Y/RoDOhB491Y4
         Cqfw==
X-Gm-Message-State: AOJu0YyiRmSV2QY66xxc5Mt2RJqZygkyhUFGEayDkVA+N9guQZI0iq/l
	nYzcHQ4W0CzVQN8qQCVLLHmJsquI7GeZ0j9f6PdI0rqGZyzGyIk5Y5qU6fM6rL1Z+JKNtd1lqT2
	L
X-Google-Smtp-Source: AGHT+IFGIdHAltL2XtMni+KJgXHV9/KCZ+WGVeJ9Y/UGlpHDeZfbzt3Wo7J2VZoi5e8szL+LzaFZAA==
X-Received: by 2002:a17:907:ea3:b0:a99:f9fa:5c01 with SMTP id a640c23a62f3a-a9e22b3b53amr3734166b.32.1730130599962;
        Mon, 28 Oct 2024 08:49:59 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Elias El Yandouzi" <eliasely@amazon.com>,
	"Julien Grall" <julien@xen.org>
Subject: [PATCH 00/14] x86: Address Space Isolation FPU preparations
Date: Mon, 28 Oct 2024 15:49:18 +0000
Message-ID: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a Xen build with Address Space Isolation the FPU state cannot come from the
xenheap, as that means the FPU state of vCPU_A may be speculatively accesible
from any pCPU running a hypercall on behalf of vCPU_B. This series prepares
code that manipulates the FPU state to use wrappers that fetch said state from
"elsewhere"[1]. Those wrappers will crystalise into something more than dummy
accesors after existing ASI efforts are merged. So far, they are:

  a) Remove the directmap (Elias El Yadouzi):
  https://lore.kernel.org/xen-devel/20240513134046.82605-1-eliasely@amazon.com/

    Removes all confidential data pages from the directmap and sets up the
    infrastructure to access them. Its trust boundary is the domain and builds
    the foundations of the secret hiding API around {un,}map_domain_page().

  b) x86: adventures in Address Space Isolation (Roger Pau Monne):
  https://lore.kernel.org/xen-devel/20240726152206.28411-1-roger.pau@citrix.com/

    Extends (a) to put the trust boundary at the vCPU instead so the threat
    model covers mutually distrustful vCPUs of the same domain. Extends the
    API for secret hiding to provide private pCPU-local resources. And an
    efficient means of accessing resources of the "current" vCPU.

In essence, the idea is to stop directly accessing a pointer in the vCPU
structure and instead collect it indirectly via a macro invocation. The
proposed API is a map/unmap pair in order to tame the complexity involved in
the various cases uniformly (Does the domain run with ASI enabled? Is the vCPU
"current"? Are we lazy-switching?).

The series is somewhat long, but each patch is fairly trivial. If need be, I
can fold back a lot of these onto single commits to make it shorter.

  * Patch 1 refreshes of a couple of asserts back into something helpful. Can
    be folded onto patches 12 and 13 if deemed too silly for a Fixes tag.

  * Patch 2 is the introduction of the wrappers in isolation.

  * Patches 3 - 10 are split for ease of review, but are conceptually the same
    thing over and over (to stop using direct v->arch.xsave_area and to use
    wrappers instead).

  * Patch 11 cleans the idle vcpu state after using it as dumping groung. It's
    not strictly required for this series, but I'm bound to forget to do it
    later after we _do_ care and does no harm to do it now. It's otherwise
    independent of the other patches (it clashes with 10, but only due to both
    modifying the same code; it's conceptually independent).

  * Patches 12 and 13 bite the bullet and enlightens the (f)xsave and (f)xrstor
    abstractions to use the wrappers rather than direct access.

  * Patches 14 is the last remaining direct use xsave area. It's too tricky to
    introduce ahead of patches 12 and 13 because they need state passed not
    available until those have gone in.

[1] That "elsewhere" will be with high likelihood either the directmap (on
non-ASI), some perma-mapped vCPU-local area (see series (b) at the top) or
implemented as a transient mapping in the style of {un,}map_domain_page() for
glacially cold accesses to non-current vCPUs. Importantly, writing the final
macros involve the other series going in.

Alejandro Vallejo (14):
  x86/xstate: Update stale assertions in fpu_x{rstor,save}()
  x86/xstate: Create map/unmap primitives for xsave areas
  x86/hvm: Map/unmap xsave area in hvm_save_cpu_ctxt()
  x86/fpu: Map/umap xsave area in vcpu_{reset,setup}_fpu()
  x86/xstate: Map/unmap xsave area in xstate_set_init() and
    handle_setbv()
  x86/hvm: Map/unmap xsave area in hvmemul_{get,put}_fpu()
  x86/domctl: Map/unmap xsave area in arch_get_info_guest()
  x86/xstate: Map/unmap xsave area in {compress,expand}_xsave_states()
  x86/emulator: Refactor FXSAVE_AREA to use wrappers
  x86/mpx: Map/unmap xsave area in in read_bndcfgu()
  x86/mpx: Adjust read_bndcfgu() to clean after itself
  x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
  x86/xstate: Make xstate_all() and vcpu_xsave_mask() take explicit
    xstate

 xen/arch/x86/domctl.c             |  9 +++--
 xen/arch/x86/hvm/emulate.c        | 10 ++++-
 xen/arch/x86/hvm/hvm.c            |  8 ++--
 xen/arch/x86/i387.c               | 67 ++++++++++++++++++++-----------
 xen/arch/x86/include/asm/xstate.h | 29 +++++++++++--
 xen/arch/x86/x86_emulate/blk.c    | 10 ++++-
 xen/arch/x86/xstate.c             | 51 ++++++++++++++++-------
 7 files changed, 130 insertions(+), 54 deletions(-)

-- 
2.47.0


