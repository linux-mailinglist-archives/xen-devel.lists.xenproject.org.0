Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B8C8000A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170263.1495331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUBi-0006i2-Jn; Mon, 24 Nov 2025 10:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170263.1495331; Mon, 24 Nov 2025 10:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUBi-0006fZ-Gq; Mon, 24 Nov 2025 10:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1170263;
 Mon, 24 Nov 2025 10:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Io9E=6A=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1vNUBg-0006fT-SV
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:52:52 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8d2ddcd-c923-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 11:52:51 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b387483bbso3051167f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 02:52:51 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7ec454csm26687694f8f.0.2025.11.24.02.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 02:52:49 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DC43A5F83A;
 Mon, 24 Nov 2025 10:52:48 +0000 (GMT)
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
X-Inumbo-ID: b8d2ddcd-c923-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763981570; x=1764586370; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK/lamIa2GP8d2MmAgVK21zQ9jh5z0bwbWrJlAfHUxI=;
        b=qP3wzciNGuCMqxl8ch7C2Si76OPQx7EzVFcNjFUz/1wIixPs2upQO4TZUqLO4kFgtg
         PeJwkACXjfj7Ov2yJSkIsSzGrya8SB7U2ll27x7HZSdVgRJdISNkPCu5d50FqmlIjoR3
         /gViJGWaJs1P/I7lqjaT/6nBztQot45I+VkFU5QpnC/MBA/vfCsI7o/0B6ZYKzH59U2j
         /Mpxh2D5VyVX8xzLMLANc2r9Y/6EbCGoJbdOtmSqOmwbXEsUvSBsHmKK6A76XM9JP6oZ
         C3mvqWHvaFWK5ngrb4QjC9Oqib1Avez58olZXmBCGf30MtUYz6dl6MZ559SRSmE6+e/Z
         OzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763981570; x=1764586370;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iK/lamIa2GP8d2MmAgVK21zQ9jh5z0bwbWrJlAfHUxI=;
        b=RKvqZggMJAt05K1IL7iEEnAH1hUxOY+xPZzSs9GuelAhFt/5+mMF3N501kB54yM4zC
         v1nNBQEDxkYKhuhiZx6anyFIJJb2BcdHkTuitHipbqtK4nqkckOLILKCtYlY0j3kEI1Q
         nyYBm+jkt97NyL41BwuriBV607dvTAbJ4CHEzWmIuTaOzr5se7eWSaUtR8ddBuz2Sc9J
         kEBulIpxlrjNzoCq64V+wYJOKSN6rKCSG5Z18Qyhw/s42PS2iVO1dvOs/UIdMP6rRkoS
         2pK1xelK4VjZkQV2CYX0ve/hz9JDQgAdhC3PIy5tkrQQNu8R8cMUBNKgyrh02yI4EH6R
         HrSg==
X-Forwarded-Encrypted: i=1; AJvYcCX3gaCUiL+NsHWi80IPyuPM7GgqiPixTJQSN0mx+Ek67jE7/tKgvAdLuXR8p7YwacC2bfCJdNQbw6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzJu5hoKAAviWnlqSomf0crPEhQkS0P/fDxZDWwM8+4qOqTEL4
	jNHOnJpziR/qX4fTbgmuW/DxsAxLwU2arSAUAj7zkYeFLJO7JG1uNHXKBEC8Vm3wbXk=
X-Gm-Gg: ASbGnct/jDQXC34sQqPnSnfwiHBwKPdFvjKiOv/J5PExTlo3D7AP3gzsYqhQbrRG5Yc
	i5lYFhXdsqN9oqmVBGSzHMDhHjMAynhkA7shn6Svwn0kgV0E0Ln6983DhuJKEt7sIAOA7o/9cQm
	VZ7HN1KkwG25knvfmTEu/LLSMKJffx9NNSnhuP2S00OvXcUqXiueHCP6+OKIUxRSCER46eTP45u
	kEaM5qazZVy3jzeLHj40tMYIftpzKSrdyEvokByHDMpvcLh8QHxaBD1kUG/3B4v4DT1jZzSK6OZ
	yIif/e2FAG9f1GucWRt5GLHGd4xsfMADtY1z1xxUfAWtve+f+OOqIMedMpbn+PoTnMlaWKCE/ez
	zXutVmgJWMp1WaYXXDrc0hQBGRfbm7pqIgN8cQDVJLh5Z1NF7AQCSCg4XBCIKSpAqTTEVkKOu2X
	utfSjGOFvXanI=
X-Google-Smtp-Source: AGHT+IFbgBMF20woWNeceW2OLZW9UzKbeZOc7MdUEAQ6zkpQk/eNWuZtBmInvriEfIgjQNxZzNGZ7w==
X-Received: by 2002:a05:6000:2893:b0:42b:31a5:f032 with SMTP id ffacd0b85a97d-42cc1d2d586mr13073922f8f.28.1763981570422;
        Mon, 24 Nov 2025 02:52:50 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  David
 Woodhouse <dwmw2@infradead.org>,  Paul Durrant <paul@xen.org>,  Eduardo
 Habkost <eduardo@habkost.net>,  xen-devel@lists.xenproject.org,  Anthony
 PERARD <anthony@xenproject.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Mark Cave-Ayland <mark.caveayland@nutanix.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/i386/isapc: Remove dead Xen code
In-Reply-To: <20251123185832.53802-1-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 23 Nov 2025 19:58:32
 +0100")
References: <20251123185832.53802-1-philmd@linaro.org>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Mon, 24 Nov 2025 10:52:48 +0000
Message-ID: <87bjkraein.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> We don't use Xen on the isapc machine: let's remove
> pointless code.

Are you sure about this? The older Xen config did support:

  isa
      Simulate an ISA only system

  isa (Default=3D0; Value=3D'no|yes')=20

I don't know why anyone would want a ISA capable HVM machine these days
but I would at least want to know when Xen dropped this as an option in
the commit message.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/isapc.c | 27 ++++-----------------------
>  1 file changed, 4 insertions(+), 23 deletions(-)
>
> diff --git a/hw/i386/isapc.c b/hw/i386/isapc.c
> index 1ba9ae22cc3..1e13a30c505 100644
> --- a/hw/i386/isapc.c
> +++ b/hw/i386/isapc.c
> @@ -17,8 +17,6 @@
>  #include "hw/ide/ide-bus.h"
>  #include "system/kvm.h"
>  #include "hw/i386/kvm/clock.h"
> -#include "hw/xen/xen-x86.h"
> -#include "system/xen.h"
>  #include "hw/rtc/mc146818rtc.h"
>  #include "target/i386/cpu.h"
>=20=20
> @@ -37,7 +35,6 @@ static void pc_init_isa(MachineState *machine)
>      ISABus *isa_bus;
>      uint32_t irq;
>      GSIState *gsi_state;
> -    MemoryRegion *ram_memory;
>      DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>      int i;
>=20=20
> @@ -77,15 +74,9 @@ static void pc_init_isa(MachineState *machine)
>      /*
>       * There is no RAM split for the isapc machine
>       */
> -    if (xen_enabled()) {
> -        xen_hvm_init_pc(pcms, &ram_memory);
> -    } else {
> -        ram_memory =3D machine->ram;
> -
> -        pcms->max_ram_below_4g =3D 3.5 * GiB;
> -        x86ms->above_4g_mem_size =3D 0;
> -        x86ms->below_4g_mem_size =3D machine->ram_size;
> -    }
> +    pcms->max_ram_below_4g =3D 3.5 * GiB;
> +    x86ms->above_4g_mem_size =3D 0;
> +    x86ms->below_4g_mem_size =3D machine->ram_size;
>=20=20
>      x86_cpus_init(x86ms, pcmc->default_cpu_version);
>=20=20
> @@ -94,17 +85,7 @@ static void pc_init_isa(MachineState *machine)
>      }
>=20=20
>      /* allocate ram and load rom/bios */
> -    if (!xen_enabled()) {
> -        pc_memory_init(pcms, system_memory, system_memory, 0);
> -    } else {
> -        assert(machine->ram_size =3D=3D x86ms->below_4g_mem_size +
> -                                    x86ms->above_4g_mem_size);
> -
> -        if (machine->kernel_filename !=3D NULL) {
> -            /* For xen HVM direct kernel boot, load linux here */
> -            xen_load_linux(pcms);
> -        }
> -    }
> +    pc_memory_init(pcms, system_memory, system_memory, 0);
>=20=20
>      gsi_state =3D pc_gsi_create(&x86ms->gsi, false);

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

