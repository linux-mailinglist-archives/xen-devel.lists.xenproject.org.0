Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2F670C25
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479931.744048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuo3-0001KT-Op; Tue, 17 Jan 2023 22:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479931.744048; Tue, 17 Jan 2023 22:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuo3-0001IQ-M0; Tue, 17 Jan 2023 22:51:51 +0000
Received: by outflank-mailman (input) for mailman id 479931;
 Tue, 17 Jan 2023 22:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qLe=5O=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pHuo2-0001IH-Ay
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:51:50 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86bf9084-96b9-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 23:51:49 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so79061668ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 14:51:49 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-043-201.77.11.pool.telefonica.de.
 [77.11.43.201]) by smtp.gmail.com with ESMTPSA id
 k15-20020a17090632cf00b0087120324712sm2738569ejk.23.2023.01.17.14.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 14:51:48 -0800 (PST)
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
X-Inumbo-ID: 86bf9084-96b9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbh03W6hVMjCODjzgpmoric/2rTMsA2rWH3ep2nias0=;
        b=GTBzrSwzC0C+TbpKBPASdjFgmPK9MbGvc5t3esQ65Uc/KQOCsm545QihSYOgepEsAx
         rqv7NBrNxsqiw9wLC8PjaY726+IF868Uqcoj1MJRZOA4PJI6MkrYnw81z2bffpWxJHzM
         Z15Wib++E6k1CJqXVVSu0WXiI57WxyfvsbcY+C7GpVDz5Mh1x48lhAUgcWXntXBAOKWz
         hrPRKlnzYBmW5etZlK2IJv/Pmx+QPNK1/OGBDtAd1FrJT698evGYc/mBAwJ0xxncm0CU
         QlSENUD08VRWCnaxpeuwqiIgQ4exc1RAQ5IPg7Y1L9iYNnBN96IiweLC3PDczt4WJBBA
         kQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbh03W6hVMjCODjzgpmoric/2rTMsA2rWH3ep2nias0=;
        b=h8mI+7fVg8B/z5+GL1JquyzFDT62LbYWUkOW1XAOwXzjIVOr8yRlYAtfzpp30J4g1R
         OAJ9bem+RvlllHI3jRN/f4WnVfeBoq+l43wv8EtISGbaKaHZwwg4gNf393YzYivsDrDC
         GUa6V4161KEJ3WEpEq+ntAlk5EagbB33XgJXjAglrVwEGjuGIdLlt0NkM6ZpyY+t6VuC
         ++8Q7crODkXsb9lKOHgHAbNzTRafDTMuIxh0HQz3y1wp0F3l1gYru/sdMHuJmW2yUTTI
         aTsqjHR8Zm5ez6UGS/6KmiY9dfzakNeU3M90F6QPFdLN2GjPOSWsoF6wPyF6emKP/Mbo
         BXRQ==
X-Gm-Message-State: AFqh2kpwYh1ud4BikGPYS+Xw+fnpUSqPt+npSXEK/Egh6EDsAgaQrnMm
	cYwo0RV6WvBZusMCUIkyZzg=
X-Google-Smtp-Source: AMrXdXuViHlaRCcJQwvdFLv4FdIMUTrp63hp3JtXnf0wno9j+1Rox2wLPKLD9Iw0BNao/SOEWyvs+g==
X-Received: by 2002:a17:906:b24c:b0:869:236c:ac41 with SMTP id ce12-20020a170906b24c00b00869236cac41mr4837674ejb.24.1673995908835;
        Tue, 17 Jan 2023 14:51:48 -0800 (PST)
Date: Tue, 17 Jan 2023 22:51:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
Message-ID: <D2349D00-B64B-4197-A62E-A74CB20112FB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 4=2E Januar 2023 14:44:31 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally rem=
oves
>
>it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen i=
n the PC
>
>machine agnostic to the precise southbridge being used=2E 2/ will become
=
>
>particularily interesting once PIIX4 becomes usable in the PC machine, av=
oiding
>
>the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>
>
>
>v2:
>
>- xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuck)
>
>
>
>Testing done:
>
>None, because I don't know how to conduct this properly :(

Ping

Successfully tested by Chuck=2E Patches 2, 4 and 6 still need review=2E

I can rebase to master if that eases review -- please let me know=2E Curre=
ntly this series is based on my "Consolidate PIIX south bridges" series:

>Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>
>          "[PATCH v4 00/30] Consolidate PIIX south bridges"
>
>
>
>Bernhard Beschow (6):
>
>  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>
>  hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>
>  hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>
>  hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>
>  hw/isa/piix: Resolve redundant k->config_write assignments
>
>  hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>
>
>
> hw/i386/pc_piix=2Ec             | 34 ++++++++++++++++--
>
> hw/i386/xen/xen-hvm=2Ec         |  2 +-
>
> hw/isa/piix=2Ec                 | 66 +----------------------------------=

>
> include/hw/southbridge/piix=2Eh |  1 -
>
> include/hw/xen/xen=2Eh          |  2 +-
>
> stubs/xen-hw-stub=2Ec           |  2 +-
>
> 6 files changed, 35 insertions(+), 72 deletions(-)
>
>
>
>-- >
>2=2E39=2E0
>
>
>

