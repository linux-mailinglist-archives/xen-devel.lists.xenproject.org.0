Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB37F64AE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 18:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639948.997631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D6K-0005L2-82; Thu, 23 Nov 2023 17:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639948.997631; Thu, 23 Nov 2023 17:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D6K-0005I2-5M; Thu, 23 Nov 2023 17:02:52 +0000
Received: by outflank-mailman (input) for mailman id 639948;
 Thu, 23 Nov 2023 17:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62Wd=HE=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1r6D6J-0005Hw-3D
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 17:02:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217ae831-8a22-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 18:02:49 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso8490525e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 09:02:49 -0800 (PST)
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
X-Inumbo-ID: 217ae831-8a22-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700758968; x=1701363768; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGpih/t2ptadL5poc2XKN9QF6BSY5MXqwzQg+PdEYeg=;
        b=KPQKL+Qc8hT1DfqqmL+QVygwTAjUkWQTZPpmhTz82klMwdPUNdycboI/l4WEi/1pV4
         UKyC6DSYSos9erWoQT4QhFVXYtQ9YKBBXII1lUKYFzMK/f0OxFn194u9+l5sUGhuLgIE
         cAVqvNlXrm62lBbrT2IfXwaC6qrCmxLZ1SN/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758968; x=1701363768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGpih/t2ptadL5poc2XKN9QF6BSY5MXqwzQg+PdEYeg=;
        b=VMtYwvxE34T5HH5hx5WyGLSoWvDw2FryUk5kmrmiPzmK/p1i4tYwX1KYPkEawkwK2V
         Gq12ylA+Eyh+VS6PM+gztvW/mlEmBnb7/CD/kOuWEa26hOFX76ku31+NZSaSO+oJaMgJ
         fdfrs0DwR2g8+hsnQ4a8ZRTPioOn11yyafxXszgRal7hGkIADUv7ckzPko/1d1Mrn7oo
         eNcNu72Ik6to8rlhEXNXPkmJ16mxa5AsnpPjeISXjIaqz4f3Uvhg2Ah+9t5ZOC/GdE/C
         Lxvp2bjbhK3EWGsjlHusOHLnBeht0ZTqdmXN8+H+V80xJgjkqhlf9+6lZWgvvsF1hOVb
         5wKw==
X-Gm-Message-State: AOJu0YyXa6Knrwrj+9BEWcKVvlQ8jXK+z2QmQc9xpYbxNMkHlnVEhnff
	FwlOhCQmEuEAR5UF9yUjL77b4D3E22UAyV/aoR3H
X-Google-Smtp-Source: AGHT+IHEp4wZ8jPWf5BofhyNA+lvNUuNWC3m0+SdM49+VfvuVuXC7wAGgPsYqcbATsHLxPdCnrk+fYOP4kN4vuNJ1zI=
X-Received: by 2002:a05:600c:4752:b0:409:637b:88e2 with SMTP id
 w18-20020a05600c475200b00409637b88e2mr224383wmo.0.1700758968567; Thu, 23 Nov
 2023 09:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20231123095224.13720-1-roger.pau@citrix.com>
In-Reply-To: <20231123095224.13720-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Thu, 23 Nov 2023 17:02:37 +0000
Message-ID: <CAG7k0ErkxUBj0Kk-m8=vY3tbFKdmQUyqOB4n92z1SH767dNq+g@mail.gmail.com>
Subject: Re: [PATCH v2] livepatch: do not use .livepatch.funcs section to
 store internal state
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 9:52=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Currently the livepatch logic inside of Xen will use fields of struct
> livepatch_func in order to cache internal state of patched functions.  No=
te
> this is a field that is part of the payload, and is loaded as an ELF sect=
ion
> (.livepatch.funcs), taking into account the SHF_* flags in the section
> header.
>
> The flags for the .livepatch.funcs section, as set by livepatch-build-too=
ls,
> are SHF_ALLOC, which leads to its contents (the array of livepatch_func
> structures) being placed in read-only memory:
>
> Section Headers:
>   [Nr] Name              Type             Address           Offset
>        Size              EntSize          Flags  Link  Info  Align
> [...]
>   [ 4] .livepatch.funcs  PROGBITS         0000000000000000  00000080
>        0000000000000068  0000000000000000   A       0     0     8
>
> This previously went unnoticed, as all writes to the fields of livepatch_=
func
> happen in the critical region that had WP disabled in CR0.  After 8676092=
a0f16
> however WP is no longer toggled in CR0 for patch application, and only th=
e
> hypervisor .text mappings are made write-accessible.  That leads to the
> following page fault when attempting to apply a livepatch:
>
> ----[ Xen-4.19-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> CPU:    4
> RIP:    e008:[<ffff82d040221e81>] common/livepatch.c#apply_payload+0x45/0=
x1e1
> [...]
> Xen call trace:
>    [<ffff82d040221e81>] R common/livepatch.c#apply_payload+0x45/0x1e1
>    [<ffff82d0402235b2>] F check_for_livepatch_work+0x385/0xaa5
>    [<ffff82d04032508f>] F arch/x86/domain.c#idle_loop+0x92/0xee
>
> Pagetable walk from ffff82d040625079:
>  L4[0x105] =3D 000000008c6c9063 ffffffffffffffff
>  L3[0x141] =3D 000000008c6c6063 ffffffffffffffff
>  L2[0x003] =3D 000000086a1e7063 ffffffffffffffff
>  L1[0x025] =3D 800000086ca5d121 ffffffffffffffff
>
> ****************************************
> Panic on CPU 4:
> FATAL PAGE FAULT
> [error_code=3D0003]
> Faulting linear address: ffff82d040625079
> ****************************************
>
> Fix this by moving the internal Xen function patching state out of
> livepatch_func into an area not allocated as part of the ELF payload.  Wh=
ile
> there also constify the array of livepatch_func structures in order to pr=
event
> further surprises.
>
> Note there's still one field (old_addr) that gets set during livepatch lo=
ad.  I
> consider this fine since the field is read-only after load, and at the po=
int
> the field gets set the underlying mapping hasn't been made read-only yet.
>
> Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET i=
s active')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks,
Ross

