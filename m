Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE0DB12147
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058177.1425867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufKei-0002j0-Pr; Fri, 25 Jul 2025 15:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058177.1425867; Fri, 25 Jul 2025 15:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufKei-0002hC-N8; Fri, 25 Jul 2025 15:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1058177;
 Fri, 25 Jul 2025 15:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufKeh-0002h6-Gm
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:48:19 +0000
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a64338-696e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:48:17 +0200 (CEST)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-532f9127978so727880e0c.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:48:17 -0700 (PDT)
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
X-Inumbo-ID: c7a64338-696e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753458496; x=1754063296; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWSYyP+XF3AiBwwOk3+fXmtbuHP+/szjfRTmnysJsf0=;
        b=iez8zfmURiqMArxgq/cMMwViBuyw1aMBxIMgxphg+mIL4F5kdyyiJQEu/riRaKoPWE
         vst5awEomrth0EFfg0dSxcmF3EyPgW8LpXbPPv2zoZSmQmrq/GptyAr8sfgctDBweRy1
         us/5ambfnryw1H47Csi1mtEZ6H1VW9oX+c3KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458496; x=1754063296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWSYyP+XF3AiBwwOk3+fXmtbuHP+/szjfRTmnysJsf0=;
        b=D2ERx0/9OFWn1Jt5s65JTPTV7xtYQN80wQaunhY3UX93aH4aN+6fZ7i2x2JPHhwXUj
         1djoEMWYjt0S/uNx69kPtdgdSN4Uh09TwLGHR8eIbrrYWD6IM23l3WPNiUdRyGEouhOs
         YXkXWz9erSYmTSyHFm9avn6Vj0Yq528HGT8BksiCahdahkAjoIBcttiCnuo5IaIwINoP
         AlejqIkr3Pgh5XAIOQ9hfHArXhHMbLBeOxclV77KBkIjy3N97BNmcmh28VfkipB6Wo8b
         9yipjUEGLh9nkBxq8zQZ/fw0RiDt84YmSQUEravfSdprW1vmvGb9AVu8r04bZbfNRawc
         lKDw==
X-Gm-Message-State: AOJu0YydNQgUCxEThtBUFT31bNVjPs5J3HMGoWjHKwM2jB1zYhm2N3AF
	Qc4bu/dUqIkVmFfSYUbQvRKOSoJYB71YBMhGzQwGGBSkI8s0tnExSXEEEeCiHkJUWHB0yFAm4kx
	fVGQN4Zm1/JhSb2cdBhETf03wK0UtN+OYM9UF2PM6sdaQWz0x9w2Fn0Hrwg==
X-Gm-Gg: ASbGnctQIs7iqe9tXrdcVhH2IzsMAxF2McajyKF1ryZkQQibTCbLDG9MH6VZn8F0TTz
	WPgUDXKH+zrqJy5x4KqK4651oqfhBTgh43CgdU+nEbdkUBjVX6px62xTKRzLgNCtbFuezN1zBe9
	DEJ4RRy1xRTxgfZPcifZnjIAu2h/yRaUxCu6TeG8D6OF0bJV+WEeV4ZxsrNOPIfVL8b4Rp9Na0b
	IzW4OWHPg==
X-Google-Smtp-Source: AGHT+IGZOpuI6COsh/FOcxFkb9jZyvXHMUZR8XW7yVCg7Uiu8Z+bPwb0ub/tEJXR06KZJBfyJ9NHxYoVvH1Vz+Ucwrs=
X-Received: by 2002:a05:6122:46a8:b0:537:3e51:eb98 with SMTP id
 71dfb90a1353d-538db603d93mr963395e0c.12.1753458495853; Fri, 25 Jul 2025
 08:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753372928.git.edwin.torok@cloud.com>
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Fri, 25 Jul 2025 16:48:04 +0100
X-Gm-Features: Ac12FXw6J5sR6VrMMlCKYW8_B6fhfO9zyVkfR2G050l2LpBxbD8KSoc-_HojMDQ
Message-ID: <CAEfZLvm9fQMyVp3eTv-csSbH3_0B9Q0rbZdK4HdhjzDEsN=dMw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/10] Xen flamegraph (hypervisor stacktrace
 profile) support
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	andriy.sultanov@vates.tech, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 4:07=E2=80=AFPM Edwin T=C3=B6r=C3=B6k <edwin.torok@=
cloud.com> wrote:
> [...]
>
> Edwin T=C3=B6r=C3=B6k (10):
>   pmu.h: add a BUILD_BUG_ON to ensure it fits within one page
>   arch-x86/pmu.h: document current memory layout for VPMU
>   arch-x86/pmu.h: convert ascii art drawing to Unicode
>   vpmu.c: factor out register conversion
>   pmu.h: introduce a stacktrace area
>   arch-x86/pmu.h: convert ascii art diagram to Unicode
>   arch-x86/vpmu.c: store guest registers when domain_id =3D=3D DOMID_XEN
>   pmu.h: expose a hypervisor stacktrace feature
>   vpmu.c hypervisor stacktrace support in vPMU
>   xen/tools/pyperf.py: example script to parse perf output
>
>  xen/arch/x86/cpu/vpmu.c           | 130 ++++++++++++++++++++------
>  xen/arch/x86/cpu/vpmu_amd.c       |   2 +-
>  xen/arch/x86/cpu/vpmu_intel.c     |   2 +-
>  xen/arch/x86/include/asm/vpmu.h   |   1 +
>  xen/include/public/arch-arm.h     |   1 +
>  xen/include/public/arch-ppc.h     |   1 +
>  xen/include/public/arch-riscv.h   |   1 +
>  xen/include/public/arch-x86/pmu.h | 101 ++++++++++++++++++++-
>  xen/include/public/pmu.h          |  41 ++++++++-
>  xen/tools/pyperf.py               | 146 ++++++++++++++++++++++++++++++
>  10 files changed, 395 insertions(+), 31 deletions(-)
>  create mode 100644 xen/tools/pyperf.py
>

For convenience this is also available as a git repository here:
https://gitlab.com/xen-project/people/edwintorok/xen/-/commits/pmustack?ref=
_type=3Dheads
https://github.com/edwintorok/linux-stable/commits/pmustack/

Best regards,
--Edwin

