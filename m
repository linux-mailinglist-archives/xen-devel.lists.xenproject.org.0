Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBAC80CC0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 14:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171049.1496074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWkK-0006UJ-2f; Mon, 24 Nov 2025 13:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171049.1496074; Mon, 24 Nov 2025 13:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWkJ-0006Rd-Vz; Mon, 24 Nov 2025 13:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1171049;
 Mon, 24 Nov 2025 13:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Io9E=6A=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1vNWkJ-0006RX-1M
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 13:36:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ec70a1c-c93a-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 14:36:45 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so44813755e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 05:36:45 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9de4631sm150284365e9.7.2025.11.24.05.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 05:36:44 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B54585F83A;
 Mon, 24 Nov 2025 13:36:42 +0000 (GMT)
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
X-Inumbo-ID: 9ec70a1c-c93a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763991405; x=1764596205; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4xz24Wztw7HTdPYy7ecg89+rhyVWxJPlTjrMGFkQrQ=;
        b=LLKKt8dmIeXRZWcU4FXPpdtVRbiQIp15aoj6OYV/tG8UpLwfQtmgH0d0wiNf8rpBhc
         UfW7zIV1+eTtxK7e3n6dIILnQVB9FsqfxFeZe1gSX+WZ/bw7HCeI+rdeL94OlvZjBx2/
         IudJDcy5NtHeQC5jOEDyuhPhxwJdI9dFWC2i5S8+iQiwjA1cyugdoSYRTZXVPxRdHfd7
         n6R7VXusUfyF/CNvElPKIWjHRTTcZx950wIkPZkeSPCbwYBJ42oTZ4ZfjEdEwJjDNRba
         0UCibhGqbgWiZkB9iT0u4uMvJK2BSbGDQLKfQtCKxqueyte9rds6edXlpJ9EIpkEEUlm
         cyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991405; x=1764596205;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4xz24Wztw7HTdPYy7ecg89+rhyVWxJPlTjrMGFkQrQ=;
        b=SxlvUo2l+4VL7UNxYSCiQtoaNzsmremqpbdrptm6VyGtKQyV37qqC4auP4+/nsXD5O
         U2YDG/o71lUF8a7u8h5OIMSTeFt7H6JzfzCFUSZdwP3EgfXvFhy6DY6elX3FTOUj5RhX
         j+m5Iej7w1MWwBSoUYwq9KEDiOtT+OqlqxH2EmX+8Y6nUZoRxlppqRMFx+jpEeygiBeO
         07kwBrK3mQ/jDnV62U6iDLeWZAts25wUU3WWhrMmmWlBEze0DU4fZXVHXpV1qZ3wbvzh
         m96mfwXQMKHAVtEUF/MpucWlNI06ObKXqeuBJSHrtNjhqD6t4pNJnfhE264UDRWgGfQM
         jQrw==
X-Forwarded-Encrypted: i=1; AJvYcCWIm44PXRAvX+RWf3KFL+Zn/r34i6AgaXaU7fCtCdReE0lLj/s70Gw8954JdUcZODKz6ilelnWzMjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrO0Q1K6ehKKmExlmV4ds8rMHr7922gw6mJ8HQSwkkUf1CJcaa
	buX4Wq42gW7der3o8mPyqetrN2QGJfBgsfOFmNGc7EkrzWKSjUCPcXiGKR1aaL0AdpA=
X-Gm-Gg: ASbGncu/U5+rauNFE7dATQlZgynzg3E9UmdCDxsiMu8OdfPDfdo9ynwJWghmJC9Z7Ba
	v56Nhx+3iKUEjEtdfFFATZbNk3lOcvVnXSk+fGdGSfJ/TFrCvlqABA+maQ3r2DEIYM7efH3p9fq
	/tyzEbFlxkzsP6ZCBElWYoOafgUJAlzjB71uoUhdt/leM2pZQCNxAoM1RTpTWIWBFy+/6UrowDT
	OmrNX2ZmIGZ2bDYfGnvGmvNOx9u+2EzXzKYxYd4K2Pqx4xlyqIJCJrED/nM27FgxzhEa9y8egvA
	c9si9mBtvc1VCfn7KmVcgASavZ+af5i7rivuzbAQPr2u396Pg13cFnU5zJecj/nuokN8rs5idMU
	kUhaQpu1Mg1Rvj/Sz2AJLUzV28HndBhyaDtdsXcEgN/FrAeIWXkP2ijeNioRcviOPS/sC31J6dC
	UmZ6M9mnBk7Ko=
X-Google-Smtp-Source: AGHT+IF0dJ+uMYoGxGrKESeuk5j4XBM/pzNa5EuAcMp8he8Y2t4N1T0BAg/Un3bNs5VkrlausSw3DQ==
X-Received: by 2002:a05:600c:4694:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-477c016bbf6mr110840675e9.5.1763991405177;
        Mon, 24 Nov 2025 05:36:45 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>,  qemu-devel@nongnu.org,
  Paolo Bonzini <pbonzini@redhat.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Paul Durrant <paul@xen.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  xen-devel@lists.xenproject.org,  Anthony PERARD
 <anthony@xenproject.org>,  Stefano Stabellini <sstabellini@kernel.org>,
  Richard Henderson <richard.henderson@linaro.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/i386/isapc: Remove dead Xen code
In-Reply-To: <39f5f781-398b-4974-8b1e-e7061ed9194f@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 24 Nov 2025 12:07:08
 +0100")
References: <20251123185832.53802-1-philmd@linaro.org>
	<066cb998-e89a-4cd1-a89b-865f4a6dcbbd@nutanix.com>
	<39f5f781-398b-4974-8b1e-e7061ed9194f@linaro.org>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Mon, 24 Nov 2025 13:36:42 +0000
Message-ID: <87wm3f8sd1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 24/11/25 11:27, Mark Cave-Ayland wrote:
>> On 23/11/2025 18:58, Philippe Mathieu-Daud=C3=A9 wrote:
>>=20
>>> We don't use Xen on the isapc machine: let's remove
>>> pointless code.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>> =C2=A0 hw/i386/isapc.c | 27 ++++-----------------------
>>> =C2=A0 1 file changed, 4 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/hw/i386/isapc.c b/hw/i386/isapc.c
>>> index 1ba9ae22cc3..1e13a30c505 100644
>>> --- a/hw/i386/isapc.c
>>> +++ b/hw/i386/isapc.c
>>> @@ -17,8 +17,6 @@
>>> =C2=A0 #include "hw/ide/ide-bus.h"
>>> =C2=A0 #include "system/kvm.h"
>>> =C2=A0 #include "hw/i386/kvm/clock.h"
>>> -#include "hw/xen/xen-x86.h"
>>> -#include "system/xen.h"
>>> =C2=A0 #include "hw/rtc/mc146818rtc.h"
>>> =C2=A0 #include "target/i386/cpu.h"
>>> @@ -37,7 +35,6 @@ static void pc_init_isa(MachineState *machine)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISABus *isa_bus;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t irq;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GSIState *gsi_state;
>>> -=C2=A0=C2=A0=C2=A0 MemoryRegion *ram_memory;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS=
];
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>> @@ -77,15 +74,9 @@ static void pc_init_isa(MachineState *machine)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * There is no RAM split for the is=
apc machine
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 if (xen_enabled()) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_hvm_init_pc(pcms, &ram_=
memory);
>>> -=C2=A0=C2=A0=C2=A0 } else {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_memory =3D machine->ram;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->max_ram_below_4g =3D =
3.5 * GiB;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86ms->above_4g_mem_size =
=3D 0;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86ms->below_4g_mem_size =
=3D machine->ram_size;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 pcms->max_ram_below_4g =3D 3.5 * GiB;
>>> +=C2=A0=C2=A0=C2=A0 x86ms->above_4g_mem_size =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 x86ms->below_4g_mem_size =3D machine->ram_size;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpus_init(x86ms, pcmc->default_cpu_v=
ersion);
>>> @@ -94,17 +85,7 @@ static void pc_init_isa(MachineState *machine)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* allocate ram and load rom/bios */
>>> -=C2=A0=C2=A0=C2=A0 if (!xen_enabled()) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_memory_init(pcms, system=
_memory, system_memory, 0);
>>> -=C2=A0=C2=A0=C2=A0 } else {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(machine->ram_size =
=3D=3D x86ms->below_4g_mem_size +
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86ms->a=
bove_4g_mem_size);
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (machine->kernel_filenam=
e !=3D NULL) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
For xen HVM direct kernel boot, load linux here */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen=
_load_linux(pcms);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 pc_memory_init(pcms, system_memory, system_memory, =
0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gsi_state =3D pc_gsi_create(&x86ms->gsi,=
 false);
>> FWIW I did contact upstream about this (see https://patchew.org/
>> QEMU/20250618112828.235087-1-
>> mark.caveayland@nutanix.com/20250618112828.235087-13-
>> mark.caveayland@nutanix.com/#91b96b24-af60-4a89-91ec-
>> d0e660a76a0a@nutanix.com) and they mentioned that it should work,
>> which is why I left it in.
>> Unfortunately I don't currently have any way to test it here :/
>
> OK :| IMHO upstream Xen maintainers should provide us a test, otherwise
> we can not make our code base evolve.

Ok how about this:

  As of the xen commit 9e8672f1c36 (tools: remove xend and associated
  python modules) there is no longer the ability to emulate an ISA only
  system. As a result we can drop the code in isapc. We still need to
  support the ISA bus for the -m pc type as Xen doesn't support the q35
  machine model for HVM.

I think the actual support got removed earlier but this was when the
last bits of "Simulate an ISA only system" where removed in 2013.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

