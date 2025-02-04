Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B005A27F6B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 00:15:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881903.1292071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfS8c-00044F-SP; Tue, 04 Feb 2025 23:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881903.1292071; Tue, 04 Feb 2025 23:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfS8c-00041t-Pc; Tue, 04 Feb 2025 23:15:26 +0000
Received: by outflank-mailman (input) for mailman id 881903;
 Tue, 04 Feb 2025 23:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cHhZ=U3=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1tfS8b-00041n-N1
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 23:15:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9bdc20a-e34d-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 00:15:24 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso43035175e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 15:15:24 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf004300f426c70552435424.dip0.t-ipconnect.de.
 [2003:fa:af00:4300:f426:c705:5243:5424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933a4bsm2660335e9.6.2025.02.04.15.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 15:15:23 -0800 (PST)
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
X-Inumbo-ID: e9bdc20a-e34d-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738710924; x=1739315724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY51GZXLmI4xq4N5TaYgDOm2suzKwumQ6T0OX8XNwHA=;
        b=V6qvaw8mkAOFjxhTObbSuS0FU2OMD3JOtOcDi8PWeo3DqxML+JcITFjQBoLeeQcYJ7
         R/m7zaLK24E8Y25bTPSEpohh331nyCmYs6W+xmEvD7fvU1oqAP1GqXcj0xCa5V3/pLKB
         s2OSpzr6O1rWCheTj0lPacMr+SXrO5up7VqMezLjP861rCETTf4RKrJqEb0AmufTMwrc
         XD373wxG6LAGO3T+W0yvbj92Jc5aYjntS25HXRTW5y+ZAjxb+SaZNGg7cHDABvF52D3+
         UjTdb90k4G9sBXt1vKX1boCt1PMNfxiJdWCXc3mARHf41v44ImhN4GyIcV+5o67RmNKV
         Khcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738710924; x=1739315724;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY51GZXLmI4xq4N5TaYgDOm2suzKwumQ6T0OX8XNwHA=;
        b=bSBqI8vIimTUjWu4gX5Dx8SoCbwkKdqyE9ESd/Fu0Zsc6ezHdeQEPZEUx3oGtcZG5r
         um6wLPwQJNlRWTI6vJWGDu+QSZB3Lvy4nlGecbpOdmmL/Y4995uO7wkCqbphh8rjIu99
         HyANaJao6XPE6dzEZ7xLlUc16UJvtuEjzL4FCFXBraIQc/jRAP/UI+Qys+2xwAeILsah
         Kmkrcvx3o8UUXQTDifNtq4tdoAEffAzB++lJkQJJ6l1gp0uqDhb/rIVHisn+JWSz7cIF
         USuHQpFls7jWhUvgg/8ywqNUwf89xGqeHUDXsFMH0Xac98AePRwzQSGf5kb7st6utPNu
         LDNw==
X-Forwarded-Encrypted: i=1; AJvYcCUuUSXeNzPH+xT03y5lPG6Q/xowMik5m/ByYXfGr34/tKT3OGA4cnogNxZOnYR3pbPkgu3m3WG6s7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5H3n7IVp8QkdhtX6YiPuxLBPUXS7yje05MkIcvuhhxeNh0Dfp
	PTp/3GVfTqf5c7adlWfj6827IIBcqGMB3aL8q1mjG0C+HN3TpfuX
X-Gm-Gg: ASbGncvspSXdmtSaG05eXfxQfeFVm7J9UDXR4aVGXKP1dt5y+HVQpnFjH/ZH8/LrDZ8
	DRYZq1e1m1SQ2P1bl8esTti2dTR9lY5kzlX8nNntdd2df2RB2ke5Wl1IfbxZLRd8wgtlXAGOn/m
	IUMyJRL64WQCB+NlHJRM+/HrUs1ncCuAgjxo6cryxll1dlfGTV/0gbO4bQujsgSJ79NuFO2t5G6
	UE+3FE29HWYHSf4pa+9IaV8WlBNY2/pdArFs2fh0w7fgAE6SAlWw82mRogEDhZ1XApo4EU7SJ2z
	O7qqzmd2gfZACbo9XUiGEle3qzu/dbxtUckzGYMcy2mjiZwJQrdz5C0E8kMPSt+hipmZpIUdKo4
	=
X-Google-Smtp-Source: AGHT+IGpMQ51OFgiMVxDmzo5k+RyYk8722hSjNZGSU/Fyo9cYDKZoCLdqGRLlww2BONm7+aTZfQUBA==
X-Received: by 2002:a05:6000:4020:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38db490e248mr359511f8f.36.1738710923989;
        Tue, 04 Feb 2025 15:15:23 -0800 (PST)
Date: Tue, 04 Feb 2025 23:12:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>,
 =?ISO-8859-1?Q?Cl=E9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_9/9=5D_hw/xen=3A_Have_legacy_Xen?=
 =?US-ASCII?Q?_backend_inherit_from_DYNAMIC=5FSYS=5FBUS=5FDEVICE?=
In-Reply-To: <02ea4b41-3594-4ead-90d3-0ab06f2be7fa@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org> <20250125181343.59151-10-philmd@linaro.org> <9A2B297A-6270-4482-B1B6-81F518C07C1E@gmail.com> <02ea4b41-3594-4ead-90d3-0ab06f2be7fa@linaro.org>
Message-ID: <685742EB-EDAA-488F-852C-C0AA24BD4721@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 4=2E Februar 2025 21:25:46 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Hi Bernhard,
>
>On 27/1/25 10:46, Bernhard Beschow wrote:
>> Am 25=2E Januar 2025 18:13:43 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>>> Because the legacy Xen backend devices can optionally be plugged on th=
e
>>> TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE=
=2E
>>> Remove the implicit TYPE_XENSYSDEV instance_size=2E
>>>=20
>>> Untested, but I'm surprised the legacy devices work because they
>>> had a broken instance size (QDev instead of Sysbus=2E=2E=2E), so acces=
ses
>>> of XenLegacyDevice fields were overwritting sysbus ones=2E
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>> ---
>>> include/hw/xen/xen_pvdev=2Eh  | 3 ++-
>>> hw/xen/xen-legacy-backend=2Ec | 7 ++-----
>>> 2 files changed, 4 insertions(+), 6 deletions(-)
>>>=20
>>> diff --git a/include/hw/xen/xen_pvdev=2Eh b/include/hw/xen/xen_pvdev=
=2Eh
>>> index 0c984440476=2E=2E48950dc2b57 100644
>>> --- a/include/hw/xen/xen_pvdev=2Eh
>>> +++ b/include/hw/xen/xen_pvdev=2Eh
>>> @@ -32,7 +32,8 @@ struct XenDevOps {
>>> };
>>>=20
>>> struct XenLegacyDevice {
>>> -    DeviceState        qdev;
>>> +    SysBusDevice parent_obj;
>>=20
>> This then needs sysbus=2Eh rather than qdev-core=2Eh include=2E
>>=20
>> Moreover, the patch in the reply needs to be inserted into the series b=
efore this patch=2E
>>=20
>> Both are needed for the patch to compile=2E
>
>Per your reply on patch #7, might I include your
>
>Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Acked-by: Bernhard Beschow <shentey@gmail=2Ecom>
>(or R-b)

I only did a compile test and I'm not a Xen maintainer, so I guess above t=
ags don't apply=2E Right?


>
>squashing:
>
>-- >8 --
>diff --git a/include/hw/xen/xen_pvdev=2Eh b/include/hw/xen/xen_pvdev=2Eh
>index 48950dc2b57=2E=2E629bec90d09 100644
>--- a/include/hw/xen/xen_pvdev=2Eh
>+++ b/include/hw/xen/xen_pvdev=2Eh
>@@ -1,7 +1,7 @@
> #ifndef QEMU_HW_XEN_PVDEV_H
> #define QEMU_HW_XEN_PVDEV_H
>
>-#include "hw/qdev-core=2Eh"
>+#include "hw/sysbus=2Eh"
> #include "hw/xen/xen_backend_ops=2Eh"
>
> /* ------------------------------------------------------------- */
>---
>
>?

With the squash applied:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

