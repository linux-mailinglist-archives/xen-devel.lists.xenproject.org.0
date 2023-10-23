Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38D97D3350
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621375.967769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qut6v-0000WK-Va; Mon, 23 Oct 2023 11:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621375.967769; Mon, 23 Oct 2023 11:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qut6v-0000UA-Sx; Mon, 23 Oct 2023 11:28:41 +0000
Received: by outflank-mailman (input) for mailman id 621375;
 Mon, 23 Oct 2023 11:28:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qut6u-0000Ty-8u
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:28:40 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd15afd-7197-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 13:28:38 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so4601320a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:28:38 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a50ab54000000b00533e915923asm6348447edc.49.2023.10.23.04.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:28:38 -0700 (PDT)
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
X-Inumbo-ID: 4fd15afd-7197-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698060518; x=1698665318; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FnckTWg3H9X04V9aRItMo0DaqT8Y8fONmSr41n9l0AQ=;
        b=SFxsLR2uBgdevlfkWELnQuoufFBZNm9kOxg5aYiVr5/NvCM1YZGBtYhdLgMzLlkkrU
         TVQV1Ea06Fx5kwbHJ6+Ple77bCBA4Qb9U/+YXswHO3vyJScO+RkTjuWlOLAmeh2121Ta
         peT4YrOt1/Yo5M56oanwBPQss0+e7rW8oKyz5syyBrGWN9lfYyd8PTEGw8zYVPAHqXjf
         E8mpsj+YDsNnk1wrN6ElzR2INOKn6R8yX9cgcdhVrZHaFHEEwodzNMmXIvxxG2D89DS0
         5NXW/lCnbnYl0nueEkxW+vRaUA6HhXpenAYmw8/EfMxSx3tGrWUlpSBY5ohjyIE6r5Zw
         Z0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060518; x=1698665318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnckTWg3H9X04V9aRItMo0DaqT8Y8fONmSr41n9l0AQ=;
        b=PhM8B8CHXoj4gAPWjtMBl64jCPNNG8kuU41YayKrdcjA7we6wb1B3Le3uYK/92Mhne
         Y4OGipO63vEVZ2MC4eEzlns+yTSNVDt2elVIbhUuDOKp0YpowlfPBBkyWe3yiAXLkjeR
         n/bO7RivXjJFR7Jpui+hdFiNuxZoOCWz7sKsNxSQ3xz/YUHUcv6SDoYqDWHPdbYuPxUD
         Is2ccaxOTyvD8c4j7Tx8ZoaNNN6VHuQvWpxBZsAasqKhHki/44xt5EGzdxjvlmawU0x8
         F8DLYYQ4WgJAGx2VpIZsIclaTZPTThEZ8n/eUrdagv6bfPe8fv00a/yO4AajUrBaR6c5
         cS6A==
X-Gm-Message-State: AOJu0YycyqduWhVzcYxu2alS4z0x7Uo3vPy15FTucg+8TIkdjlHRG8ER
	9dHkDYRHToWNM29YF8NC+RA=
X-Google-Smtp-Source: AGHT+IFpRiHPMEO4jEMZkyJkcR48EHz512+aEePcnbObqCXejuaWxBs7CeHTTbP9ia6gI2b8BPgRJQ==
X-Received: by 2002:a50:cd1d:0:b0:530:74ed:fc8a with SMTP id z29-20020a50cd1d000000b0053074edfc8amr6028748edi.41.1698060518308;
        Mon, 23 Oct 2023 04:28:38 -0700 (PDT)
Message-ID: <52e76651f69e9406183e4d38042848793503d47b.camel@gmail.com>
Subject: Re: [PATCH v1 18/29] xen/asm-generic: introduce stub header smp.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:28:37 +0300
In-Reply-To: <3b012ae1-423e-545d-70bb-7265ca6a8ab3@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <e803ff406f9f597bd42242010a219148d387bba6.1694702259.git.oleksii.kurochko@gmail.com>
	 <3b012ae1-423e-545d-70bb-7265ca6a8ab3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 12:58 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > The patch introduces header stub necessry for full Xen build.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Assuming you expect RISC-V to get away without its own smp.h, just
> one remark:
Not really, I've introduced only things necessary for Xen's full build.

It looks like we have a situation as with device.h header ( in this
patch series) . Probably smp.h header should be only in an arch-
specific folder. I'll apply to smp.h the same solution as for device.h
when we get to the same page on it.

Except what I introduced in this patch other functions and macros will
be in smp.h. Such as:

raw_smp_processor_id
smp_processor_id
extern void smp_clear_cpu_maps (void);
extern void smp_init_cpus(void);
extern unsigned int smp_get_max_cpus(void);
void smp_setup_processor_id(unsigned long boot_cpu_id);

/*
 * Mapping between linux logical cpu index and hartid.
 */
extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
#define cpuid_to_hartid_map(cpu) __cpuid_to_hartid_map[cpu]

#define cpu_physical_id(cpu) cpuid_to_hartid_map(cpu)

Mostly all of the header can be generic but again all the mentioned
above functions are used only for RISC-V and ARM. ( probably I missed
something ).

>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/smp.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_SMP_H
> > +#define __ASM_GENERIC_SMP_H
> > +
> > +#ifndef __ASSEMBLY__
> > +#include <xen/cpumask.h>
> > +#include <xen/percpu.h>
> > +#endif
>=20
> This #endif need moving ...
>=20
> > +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> > +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>=20
> ... at least down here, if #includ-ing by assembly files is really
> necessary to permit. Preferably the #ifndef would be dropped, though.
>=20
> Jan

~ Oleksii

