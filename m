Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EF67B507
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 15:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484338.750913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKh11-0008Mg-OS; Wed, 25 Jan 2023 14:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484338.750913; Wed, 25 Jan 2023 14:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKh11-0008Jt-KN; Wed, 25 Jan 2023 14:44:43 +0000
Received: by outflank-mailman (input) for mailman id 484338;
 Wed, 25 Jan 2023 14:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pKh10-0008IQ-2G
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 14:44:42 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb325fcb-9cbe-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 15:44:38 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id h12so13292694wrv.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 06:44:38 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 x18-20020a5d4912000000b002be099f78c0sm4767318wrq.69.2023.01.25.06.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 06:44:37 -0800 (PST)
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
X-Inumbo-ID: cb325fcb-9cbe-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AGfYi2dLWPro9fJQ4wRS2nm01X4dtE6uH7MTB6rpS58=;
        b=SpgEdUNwxeim+2QQYdEZBwvnPnXBOy7B477oN2KlSlThWxspuY33Mxw0cto+sh3jaA
         eYmI2FUv2jJdMFdZiPQXi1UK3NE0knIX/x4kHSGxs7XZfR5qPlrSNi+v2mCxdYWTIA8C
         le0tn+vk7cezqXnnygUHjA6i0KiFFFgyBBx/Ko65Uvw+jd2ORD/f5IRjNb/G0/p0zFH0
         IPjAl3auwDwwqZP/nTfoPuNZxRzZC30v1isGOZPZj5o0rCJqI4psgyO7UUsZPY7WoqqT
         m2u2V7whGQIL8+W2hH8GXGrf7KqDIB+dhH7RWWDCh+cDkaGQvei1GivRWm9s+JhZKN6z
         7VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGfYi2dLWPro9fJQ4wRS2nm01X4dtE6uH7MTB6rpS58=;
        b=UpnfNtd8nX69U6yra6UVLguWYCarn4mJBMxm5WcCn+88r6+QuUkKnjENXoUBTMSQua
         zsGCP614aCKVTSsyFx9b6MxqMpDXRc6wvj1FS1PKDujFRpRHzGZd/qgjl/ih0NpIsVkl
         Vhfh+Gofa7kutazY3OaGEODy5KoBRM0EasMFZ1r2w4ZKyJxH9Q24RLXpafo5AhOmyaGI
         uIxOtW34tM+GC+XSY8pLk6ZO+VorkX0It7234itBbasHhG1J+EsCTzDwHEAxhCyCjMP0
         XdYNXPIrPhV0Bm79NDe0VqzXdLOLsKcoArwX+8qktZs+3NUXNoUjum11fI8jwBp8Ak7B
         6dIQ==
X-Gm-Message-State: AO0yUKW9oLl8LrUc7RnLbAI6NgTW+6aD3Nz1vBoCJBPJ89AK7YqmuKbu
	4w4LlFDOY1AbUJ0AOvg//Kw=
X-Google-Smtp-Source: AK7set+YS47CcAsqUF8VmcHUi5yS5X5sIwTaIP2GU3XU2VVKCW/ipZ1Ta/fSpoyl+mx697UTt03oxw==
X-Received: by 2002:adf:f705:0:b0:2bf:bb0a:e486 with SMTP id r5-20020adff705000000b002bfbb0ae486mr2005953wrp.30.1674657878055;
        Wed, 25 Jan 2023 06:44:38 -0800 (PST)
Message-ID: <ca20e076ae8af5ae0924a19e73352ac9d7e7a202.camel@gmail.com>
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Wed, 25 Jan 2023 16:44:36 +0200
In-Reply-To: <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
	 <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 11:50 +0000, Andrew Cooper wrote:
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Save context to stack */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 sp, (RISC=
V_CPU_USER_REGS_OFFSET(sp) -
> > RISCV_CPU_USER_REGS_SIZE) (sp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 sp, =
sp, -RISCV_CPU_USER_REGS_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 t0, RISCV=
_CPU_USER_REGS_OFFSET(t0)(sp)
>=20
> Exceptions on RISC-V don't adjust the stack pointer.=C2=A0 This logic
> depends
> on interrupting Xen code, and Xen not having suffered a stack
> overflow
> (and actually, that the space on the stack for all registers also
> doesn't overflow).
>=20
Probably I missed something but an idea of the code above was to
reserve memory on a stack to save the registers which can be changed
in __handler_expception() as the line of code where exception occurs
will expect that registers value weren't changed.
Otherwise if we won't reserve memory on stack it will be corrupted by
REG_S which basically is SD instruction.



