Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF53720845
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 19:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543225.848018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q58Qq-00078X-Q1; Fri, 02 Jun 2023 17:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543225.848018; Fri, 02 Jun 2023 17:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q58Qq-000768-N4; Fri, 02 Jun 2023 17:19:20 +0000
Received: by outflank-mailman (input) for mailman id 543225;
 Fri, 02 Jun 2023 17:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxtN=BW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q58Qp-000762-Jo
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 17:19:19 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aee8ee6-0169-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 19:19:17 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4bdcde899so3113704e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jun 2023 10:19:17 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a056512050100b004edc9da63bdsm219319lfb.160.2023.06.02.10.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 10:19:16 -0700 (PDT)
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
X-Inumbo-ID: 9aee8ee6-0169-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685726357; x=1688318357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vP+AEFpOHnyReN6Oku+9frL6l44685/u3lVQ3cCAhuo=;
        b=jItP1fD/TR5ZYzgHe8DKfP+zkSUVx79wYZIvDrfmqEd+n31fLlAuPuHWl4OGDHM5lA
         38pS6Fhi0nUHiilGHBzWnjMQYtn3JqDqQy+hNwEoUk8B24UnacTGz65XzFrQc7/pGeOc
         CeeOEMiCffFSqKjTkrqppdoUyalUMX75uHaW4HxPDUlh2vEkucE4f2+sDscpzwqPwsMz
         sQYSwGoYNXAtlhxYUijrjPfa54j3qVyqrWdknNUoQltf/hg2SjZSDBCA1PmP6AAX7DBf
         JbROTRJIvB8sEoEVgicutzYPqPvFqr0rdOa3JcU2IN9+gtMnOmL3KBWN9ygrITx/lgz1
         VSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685726357; x=1688318357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vP+AEFpOHnyReN6Oku+9frL6l44685/u3lVQ3cCAhuo=;
        b=kHG5yOiPKEcyaJ9bZORDzWVcradCFnrCrA2ZQUGf5IMsBMJZ0C9ph/6UoFJFpQ3gkd
         guokqquyhMxPlXp7K8EVpyHtgEn98kA6dt75kLJ2EXhMcKm6QKbmaYli5X8/ikKrqIG1
         sf8drTRLulAgFH8s5GdkMBreJGYmy99mpD3lWMefqHmUA3z1FFB4AmXXMMIS83xlTQoO
         JVuwNwIT/fe0ZooGhAqe/PkKBe9qmAjyANvo5d6YXXuIzOBbADNAZ6/XZ1ZkOYz21+M+
         2stML26+uneckSULJu9eICnIbXnZo6/FH5gp97HucY9mqEWeE6mjWw+VPOiniUqmctZA
         WoLA==
X-Gm-Message-State: AC+VfDxTI6Z0vED3JMlUp82WW6p/IFwIIZp/YTG2iicGC6V4gTCHJov6
	o8UZgAoLn7GMPx95gKhcnNI=
X-Google-Smtp-Source: ACHHUZ7S43xH6p7KgMv1JPEgGAVQ9Bf4McBrvKBG+90mcIj2rk9wUXi0PnRisi2GdNsVHjIooA7mCQ==
X-Received: by 2002:ac2:596f:0:b0:4e9:c627:195d with SMTP id h15-20020ac2596f000000b004e9c627195dmr2201217lfp.57.1685726356934;
        Fri, 02 Jun 2023 10:19:16 -0700 (PDT)
Message-ID: <f56b4e6485cddab9515753d70789c605eb55c80d.camel@gmail.com>
Subject: Re: [BROKEN] Re: [PATCH v9 0/5] enable MMU for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Fri, 02 Jun 2023 20:19:15 +0300
In-Reply-To: <4e336121-fc0c-b007-bf7b-430352563d55@citrix.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
	 <4e336121-fc0c-b007-bf7b-430352563d55@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-05-31 at 12:45 +0100, Andrew Cooper wrote:
> On 25/05/2023 4:28 pm, Oleksii Kurochko wrote:
> > Oleksii Kurochko (5):
> > =C2=A0 xen/riscv: add VM space layout
> > =C2=A0 xen/riscv: introduce setup_initial_pages
> > =C2=A0 xen/riscv: align __bss_start
> > =C2=A0 xen/riscv: setup initial pagetables
> > =C2=A0 xen/riscv: remove dummy_bss variable
>=20
> These have just been committed.
>=20
> But as I fed back to early drafts of this series, patch 2 is
> sufficiently fragile and unwise as to be unacceptable in this form.
>=20
> enable_mmu() is unsafe in multiple ways, from the compiler reordering
> statements (the label needs to be in the asm statement for that to
> work
> correctly), and because it * depends* on hooking all exceptions and
> pagefault.
>=20
> Any exception other than pagefault, or not taking a pagefault causes
> it
> to malfunction, which means you will fail to boot depending on where
> Xen
> was loaded into memory.=C2=A0 It may not explode inside Qemu right now,
> but
> it will not function reliably in the general case.
Linux RISC-V has the similar approach and it doesn't explode but if it
will be better to use identity map then I'll re-write it.

>=20
> Furthermore, a combination of patch 2 and 4 breaks the CI integration
> of
> looking for "All set up" at the end of start_xen().=C2=A0 It's not ok,
> from a
> code quality point of view, to defer 99% of start_xen()'s
> functionality
> into unrelated function.
>=20
>=20
> Please do not do anything else until you've addressed these issues.=C2=A0
> enable_mmu() needs to return normally, cont_after_mmu_is_enabled()
> needs
> deleting entirely, and there needs to be an identity page for Xen to
> land on so it isn't jumping into the void and praying not to explode.
In this case enable_mmu() should be called before start_xen() function
because if start_xen() has local variables then after jumping to VA and
removing identity page we will have an issue with stack pointer as it
will contain addresses where Xen was loaded.
One more enable_mmu() can't have local variable too ( as stack pointer=20
can be somewhere outside one page used for identity mapping ) and it
will cause an issue when execute epilogue of enable_mmu() function.

Or am I missing something?

>=20
> Other minor issues include page.h not having __ASSEMBLY__ guards,
> mm.c
> locally externing cpu0_boot_stack[] from setup.c when the declaration
> needs to be in a header file somewhere, and SPDX tags.
Thanks. I'll take it into account.

~ Oleksii

