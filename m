Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B58D332C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731762.1137445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFkb-0003p8-9H; Wed, 29 May 2024 09:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731762.1137445; Wed, 29 May 2024 09:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFkb-0003mZ-6d; Wed, 29 May 2024 09:37:41 +0000
Received: by outflank-mailman (input) for mailman id 731762;
 Wed, 29 May 2024 09:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCFkZ-0003mT-BK
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:37:39 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15b5f5f8-1d9f-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 11:37:37 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso130482466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:37:37 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6590d02e53sm15473266b.119.2024.05.29.02.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:37:36 -0700 (PDT)
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
X-Inumbo-ID: 15b5f5f8-1d9f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716975457; x=1717580257; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XcNnbIHkW/U9vIREQElgqUTXZk5+980LQo63v6C3vg4=;
        b=DNyaLGMg7Bur/X8crHNIVg5LReMTqL4Jug1H3t/OfZeR/fdixSWLJStUMYFPB4+4lL
         KltPNfpaMr7qdX16B2tF0ynBGGPWxFnqZx5PHtuY5jI3p3Y8sZxflLQhmEYuNI1A9wUs
         OOHkSmtEtCyeVwx/n5fkTdJo4zYkyEzWqG1JG7qU+d8H6G36JhIVcepGruKqmdl6hCmJ
         mypdDwkLvYUW52Fm3ffS7SrNINLH83QdNv+Qqz7efPqdOOr2CZzQdn5tVAEJf+cf8+6w
         tN67jvPE4PyGZf5g4mdSlpccD5c5U+hX582FSEN37S3In8BDnVhQex3Qt3Tvk1UhCsOn
         ix9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716975457; x=1717580257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcNnbIHkW/U9vIREQElgqUTXZk5+980LQo63v6C3vg4=;
        b=Iz88xn/H2lCIMui6Zc1uItzNTCCelsMRVvAJBVZlQxjoTAAEImTljtMon3mvAi6NPv
         TpyRf3RPk88XzEmv6RRGiVd0yVChrQaDqJrvPB7MtL7fGWvg+O8kVJFeIUjkCe1A7dXn
         iQYI5DSytEosSOalP3G7GCovrd5qvwubw43T1ni80livez156W+5XhFGQ5JTnK+VXBZk
         ZEkCMuFVUPJmxZIwEDlAGkF+4YPWXDvUzVFizYiKKfyIiEGXTKspuJSZxxfmsZnJX8bY
         wv+C4PWYxGnd7tyO4JSv9ASPnNmm4Hw2bi7zwCjIg4InKZ5oLJcaWDIYtM1hp1xuYshc
         nsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2JsGH/owLJIVdoADmKp0zWWMFuoMnPRr9XtGrfFTVkWzQXk6C0UgZdfy3lUfH5+BdVpyoxnuL0h6BfuOHKWyIPXjQnp6I0HW6dtnGk7o=
X-Gm-Message-State: AOJu0YzsoHbDbImMdgL0+gjRJqLep2ynhnKRkOMQzd/GHWpcuTqtmfN+
	cKhImS5C8t90SD0wT3OMyt1qSprNkERz+WCE7bs5yH3XCa9y3uRS
X-Google-Smtp-Source: AGHT+IG7PHF2zT8oN+tH8Ybs8ivLzyNjYwo0eMhqKUh2ITdHkdmh54XSGmya+06zH4SCeaqQ+FxClQ==
X-Received: by 2002:a17:906:319b:b0:a59:bf27:5f2e with SMTP id a640c23a62f3a-a642d5a384fmr140282466b.20.1716975456668;
        Wed, 29 May 2024 02:37:36 -0700 (PDT)
Message-ID: <96cbb9df754f35d8df805df0138c942466a8f904.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/9] x86/irq: fixes for CPU hot{,un}plug
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 29 May 2024 11:37:35 +0200
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 11:01 +0200, Roger Pau Monne wrote:
> Hello,
>=20
> The following series aim to fix interrupt handling when doing CPU
> plug/unplug operations.=C2=A0 Without this series running:
>=20
> cpus=3D`xl info max_cpu_id`
> while [ 1 ]; do
> =C2=A0=C2=A0=C2=A0 for i in `seq 1 $cpus`; do
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen-hptool cpu-offline $i;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen-hptool cpu-online $i;
> =C2=A0=C2=A0=C2=A0 done
> done
>=20
> Quite quickly results in interrupts getting lost and "No irq handler
> for
> vector" messages on the Xen console.=C2=A0 Drivers in dom0 also start
> getting
> interrupt timeouts and the system becomes unusable.
>=20
> After applying the series running the loop over night still result in
> a
> fully usable system, no=C2=A0 "No irq handler for vector" messages at all=
,
> no
> interrupt loses reported by dom0.=C2=A0 Test with
> x2apic-mode=3D{mixed,cluster}.
>=20
> I'm tagging this for 4.19 as it's IMO bugfixes, but the series has
> grown
> quite bigger than expected, and hence we need to be careful to not
> introduce breakages late in the release cycle.=C2=A0 I've attempted to
> document all code as good as I could, interrupt handling has some
> unexpected corner cases that are hard to diagnose and reason about.
Despite of the fact that it can be considered as bugfixes, it seems to
me that this patch series can be risky. Let's wait for maintainers
opinion...

~ Oleksii
>=20
> I'm currently also doing some extra testing with XenRT in case I've
> missed something.
>=20
> Thanks, Roger.
>=20
> Roger Pau Monne (9):
> =C2=A0 x86/irq: remove offline CPUs from old CPU mask when adjusting
> =C2=A0=C2=A0=C2=A0 move_cleanup_count
> =C2=A0 xen/cpu: do not get the CPU map in stop_machine_run()
> =C2=A0 xen/cpu: ensure get_cpu_maps() returns false if CPU operations are
> =C2=A0=C2=A0=C2=A0 underway
> =C2=A0 x86/irq: describe how the interrupt CPU movement works
> =C2=A0 x86/irq: limit interrupt movement done by fixup_irqs()
> =C2=A0 x86/irq: restrict CPU movement in set_desc_affinity()
> =C2=A0 x86/irq: deal with old_cpu_mask for interrupts in movement in
> =C2=A0=C2=A0=C2=A0 fixup_irqs()
> =C2=A0 x86/irq: handle moving interrupts in _assign_irq_vector()
> =C2=A0 x86/irq: forward pending interrupts to new destination in
> fixup_irqs()
>=20
> =C2=A0xen/arch/x86/apic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0xen/arch/x86/include/asm/apic.h |=C2=A0=C2=A0 3 +
> =C2=A0xen/arch/x86/include/asm/irq.h=C2=A0 |=C2=A0 28 +++++-
> =C2=A0xen/arch/x86/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 172 +++++++++++++++++++++++++-----
> --
> =C2=A0xen/common/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0xen/common/stop_machine.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 15 +--
> =C2=A0xen/include/xen/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/include/xen/rwlock.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 +
> =C2=A08 files changed, 190 insertions(+), 45 deletions(-)
>=20


