Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EE6B490F6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 16:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115308.1461984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcds-0004DD-P1; Mon, 08 Sep 2025 14:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115308.1461984; Mon, 08 Sep 2025 14:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvcds-0004Bm-MA; Mon, 08 Sep 2025 14:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1115308;
 Mon, 08 Sep 2025 14:14:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PLPY=3T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uvcdr-0004Bg-3E
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 14:14:47 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 269d2fd3-8cbe-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 16:14:36 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so772541566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 07:14:36 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a10sm22747185a12.5.2025.09.08.07.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:14:35 -0700 (PDT)
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
X-Inumbo-ID: 269d2fd3-8cbe-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757340876; x=1757945676; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNegjNmEZ9mXa2wP9a2k2r3tsR6hBXVwLbrDTxk/LG4=;
        b=hMuzW4Lixs5yu9tvDuVeVL3VBud/UuQuMRLogEizt7J6plFbBKf2wqJ/SBgIM4ewvR
         q+2hB3smk5yl0uThLeQNX0WLHO+9cQW6AUZXUIUGiLYIeTxiXRY15YTnOcLu9ngJ08JT
         X3HKCu9I74lz2PH2CeFC/MmxzrQ6ZqMhTdW2AeThEvD5DhlDWDoE4J7fIJC/FHyWiGQz
         EhuZXey3hrNwduDsEBxBQRVnNRjRp7mqWls39n74sOtwoJMKWeRxOPJxBYsbcz5nBXul
         HMcYYx37ZFrDkcGMgkVlIjgiIjEDJSZbRzgvDhr+zMY+qOXhOT7gLoe8WLbbrwWtClQO
         Fz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340876; x=1757945676;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KNegjNmEZ9mXa2wP9a2k2r3tsR6hBXVwLbrDTxk/LG4=;
        b=l1TG4BP5Q7DMpxkVO8azfe06jkN1YmYaXSVf9YBMeFVhMc8TGX4H2e8f0vzKM14PV4
         fvaUKUMObUpjZNFCimAExhcwPNWhxXvi0q1LRfmtJhG+cv9M0ycKW8eIhoIaalI8JTBS
         Rz85M3gaQzCMCEj2X1SLnay6xs1zBKWYiN/De/sKuPjU/iECqC8xo+YAlHmyIWe6NQD7
         Eyh0PRc64Lt9jNW+33G0kjUXmmlPB8iFynVeQMQZr1/Ho/PK+jPr4n9DYFsyL4wWN+tL
         Wma2MLi+hvyGXjrYlAPSymH+9uql0JYuce//T+4IylZvoA04pfVLci+670CEaufWnN4d
         oT2g==
X-Gm-Message-State: AOJu0YzabIKcx7pVNouzezLZmTOUZsfoonQVLen4Cde2mKNDy6mkNFv0
	u8UfMGbhsSJARL43AqM9ph6MQNpC2ieNd/9QUZoelUsy15Z+uU3x/zTE
X-Gm-Gg: ASbGnctkJwQQlCcPqyDMRzToH1fFOj3ycfVkWz9oAbeMi/UnY/0/sNhqe1dLINhQ/fh
	PsliPPToDecSwz5c2fbNARexqNw8hAcrY2QRSeQbTwarLRd0X3vEsiPRqYIME6UXrzAPWwScTWB
	cqKUm5l2CiJxc05TCFe27pMGsCRzAryvpAvNPKhqk0+ZHjopne59fHtOViyDZK6q28YRQnbaxyN
	RTwD4N2ipg/57cbTSamabgyvDUd9GSJkMq9Tbdqj72HzSGEVinkqvu/VeVExbn68vtAeamibejW
	mUPu/DZJwdLiX6h6Hs1eG+FlWUSdvw1nMU6VQaZ0MVFuH1tX+CIZDE2+OyipJhipXkuRcn9k8qe
	NqIE3DUpUGuUlT8hvf/8IgeK6WYUUeBe+yrMvRIE2PPSLKTxRCzy+VLY6LM63sbsbNBYU+eDKfH
	OcTlFe8Ds=
X-Google-Smtp-Source: AGHT+IHoGK3ZsoIvRUjqB3AsjdnaDoM9jc9iXpQx1Ow7S4JzpLGgCcEyML8vZ5rae6BpjxnOdbnhpA==
X-Received: by 2002:a17:906:fe0c:b0:b04:7708:ee36 with SMTP id a640c23a62f3a-b04b13c8c2dmr803511366b.9.1757340875958;
        Mon, 08 Sep 2025 07:14:35 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------HlzBhsLQrd1xKNgWvngjZygp"
Message-ID: <5cb8fdc8-9ea9-471b-bb07-ede3d27c575b@gmail.com>
Date: Mon, 8 Sep 2025 16:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] Introduce eSPI support
To: Stefano Stabellini <sstabellini@kernel.org>,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Community Manager <community.manager@xenproject.org>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <alpine.DEB.2.22.394.2509051717530.1405870@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2509051717530.1405870@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------HlzBhsLQrd1xKNgWvngjZygp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/6/25 2:17 AM, Stefano Stabellini wrote:
> Hi Leonid,
>
> I was about to commit this but unfortunately it is introducing MISRA
> regressions. See:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/ppp6?ref_type=heads
>
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11265005118
>
> Compared this result:
> https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp6/ARM64/11265005118/PROJECT.ecd;/by_service.html#service&kind
>
> Against upstream staging:
> https://eclair-analysis-logs.xenproject.org/fs/space/XEN.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/ARM64/11264772605/PROJECT.ecd;/by_service.html#service&kind
>
> It is introducing a couple of easy-to-fix 16.3 issues and also a couple
> of new 16.4 issues. They should be all easy to fix. It is also
> introducing three new 13.2 issues and one 18.1 but I haven't looked
> closely into those. Please address them.
>
>
> Oleksii,
>
> Technically, the series is fully acked and ready to be committed. From a
> risk perspective, I would be comfortable committing it now with the
> outstanding MISRA regressions, leaving Leonid to fix them over the next
> few days. However, I have not done so because it would make it harder to
> spot the MISRA regressions due to the way the scanner works (it
> compares against the previous version).
>
> I suggest we allow this series to be committed in the next couple of
> days, once Leonid addresses the regressions, even though it would
> technically be past the feature freeze.

If there is no any strong objects, it sounds good to me to give couple
of days to fix the regressions and then commit this patch series.

~ Oleksii

>
> Cheers,
>
> Stefano
>
> P.S.
>
> Leonid, you might want to check my commits because I fixed a couple of
> things on commit, in addition to adding the various acked-by tags.
>
>
> On Thu, 4 Sep 2025, Leonid Komarianskyi wrote:
>> Hello everyone!
>>
>> V6 contains an issue for debug builds with CONFIG_GICV3_ESPI=n due to a
>> mistake in the ASSERT() condition in the is_espi() function. This patch
>> series fixes the issue and also includes minor fixes according to the
>> review of V6.
>>
>> Summarized description:
>> This patch series adds support for the extended shared peripheral
>> interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
>> and guest domains. The implementation uses a generic approach to handle
>> eSPIs, similar to regular SPIs, while maintaining compatibility with the
>> existing SPI range. Functionality remains unchanged for setups that do
>> not require eSPIs.
>>
>> The series includes:
>> 1) General refactoring of common IRQ operations with GIC registers to
>> improve code readability, simplify further maintenance and prepare the
>> key functions for eSPI implementation.
>> 2) Introducing a new Kconfig option (default n) to enable or disable
>> eSPI support. Disabling this option prevents unnecessary resource
>> allocation for setups that do not require eSPIs.
>> 3) Adding additional resources to store required information and operate
>> with up to 1024 interrupts from eSPI range.
>> 4) Adjusting assertions and checks to pass verification for INTIDs in
>> the eSPI range.
>> 5) Configuration of eSPI-specific registers during GIC initialization
>> for systems with GICv3.1+ hardware.
>> 6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
>> access and operate within the eSPI's INTIDs.
>> 7) Updating documentation and CHANGELOG to reflect the changes made for eSPI
>> support.
>>
>> Also, to simplify reviewing, please find below link to unsquashed patches, that
>> are on top of every patch, that is changed in the series, compared to V6:
>> https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7-unsquashed/
>>
>> Github branch with patch series:
>> https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7/
>>
>> Changes in V7:
>> - individual changes in patches
>>
>> Link on V6:
>> -https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.html
>>
>> Changes in V6:
>> - individual changes in patches
>>
>> Link on V5:
>> -https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.html
>>
>> Changes in V5:
>> - individual changes in patches
>>
>> Link on V4:
>> -https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.html
>>
>> Changes in V4:
>> - added a patch for documentation
>> - individual changes in patches
>>
>> Link on V3:
>> -https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.html
>>
>> Changes in V3:
>> - added a patch to update CHANGELOG.md
>> - individual changes in patches
>>
>> Link on V2:
>> -https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.html
>>
>> Changes in V2:
>> - added 2 more patches to implement helper
>>    functions for gic/vgic:
>>    xen/arm: gic: implement helper functions for INTID checks
>>    xen/arm: vgic: implement helper functions for virq checks
>> - removed 2 patches:
>>    xen/arm/irq: allow assignment/releasing of eSPI interrupts
>>    xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
>>    since their functionality can be moved to appropriate patches after
>>    introducing patches with helper functions
>> - individual changes in patches
>>
>> Link on V1:
>> -https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.html
>>
>> Leonid Komarianskyi (12):
>>    xen/arm: gicv3: refactor obtaining GIC addresses for common operations
>>    xen/arm: gic: implement helper functions for INTID checks
>>    xen/arm: vgic: implement helper functions for virq checks
>>    xen/arm/irq: add handling for IRQs in the eSPI range
>>    xen/arm: gicv3: implement handling of GICv3.1 eSPI
>>    xen/arm/irq: allow eSPI processing in the gic_interrupt function
>>    xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
>>    xen/arm: vgic: add resource management for extended SPIs
>>    xen/arm: domain_build/dom0less-build: adjust domains config to support
>>      eSPIs
>>    xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
>>    doc/man: update description for nr_spis with eSPI
>>    CHANGELOG.md: add mention of GICv3.1 eSPI support
>>
>>   CHANGELOG.md                           |   2 +
>>   docs/man/xl.cfg.5.pod.in               |  13 +-
>>   xen/arch/arm/Kconfig                   |   8 +
>>   xen/arch/arm/dom0less-build.c          |   2 +-
>>   xen/arch/arm/domain_build.c            |   2 +-
>>   xen/arch/arm/gic-v3.c                  | 195 +++++++++++++++++++----
>>   xen/arch/arm/gic.c                     |   8 +-
>>   xen/arch/arm/include/asm/gic.h         |  28 ++++
>>   xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
>>   xen/arch/arm/include/asm/irq.h         |  38 +++++
>>   xen/arch/arm/include/asm/vgic.h        |  56 ++++++-
>>   xen/arch/arm/irq.c                     |  62 +++++++-
>>   xen/arch/arm/vgic-v3.c                 | 203 ++++++++++++++++++-----
>>   xen/arch/arm/vgic.c                    | 212 +++++++++++++++++++++++--
>>   xen/arch/arm/vgic/vgic.c               |   5 +
>>   15 files changed, 762 insertions(+), 112 deletions(-)
>>
>> -- 
>> 2.34.1
>>
--------------HlzBhsLQrd1xKNgWvngjZygp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/6/25 2:17 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2509051717530.1405870@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">Hi Leonid,

I was about to commit this but unfortunately it is introducing MISRA
regressions. See:
<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/ppp6?ref_type=heads">https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/ppp6?ref_type=heads</a>

<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11265005118">https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11265005118</a>

Compared this result:
<a class="moz-txt-link-freetext" href="https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp6/ARM64/11265005118/PROJECT.ecd;/by_service.html#service&amp;kind">https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp6/ARM64/11265005118/PROJECT.ecd;/by_service.html#service&amp;kind</a>

Against upstream staging:
<a class="moz-txt-link-freetext" href="https://eclair-analysis-logs.xenproject.org/fs/space/XEN.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/ARM64/11264772605/PROJECT.ecd;/by_service.html#service&amp;kind">https://eclair-analysis-logs.xenproject.org/fs/space/XEN.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/ARM64/11264772605/PROJECT.ecd;/by_service.html#service&amp;kind</a>

It is introducing a couple of easy-to-fix 16.3 issues and also a couple
of new 16.4 issues. They should be all easy to fix. It is also
introducing three new 13.2 issues and one 18.1 but I haven't looked
closely into those. Please address them.


Oleksii,

Technically, the series is fully acked and ready to be committed. From a
risk perspective, I would be comfortable committing it now with the
outstanding MISRA regressions, leaving Leonid to fix them over the next
few days. However, I have not done so because it would make it harder to
spot the MISRA regressions due to the way the scanner works (it
compares against the previous version).

I suggest we allow this series to be committed in the next couple of
days, once Leonid addresses the regressions, even though it would
technically be past the feature freeze.</pre>
    </blockquote>
    <pre>If there is no any strong objects, it sounds good to me to give couple
of days to fix the regressions and then commit this patch series.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2509051717530.1405870@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Stefano

P.S.

Leonid, you might want to check my commits because I fixed a couple of
things on commit, in addition to adding the various acked-by tags.


On Thu, 4 Sep 2025, Leonid Komarianskyi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello everyone!

V6 contains an issue for debug builds with CONFIG_GICV3_ESPI=n due to a
mistake in the ASSERT() condition in the is_espi() function. This patch
series fixes the issue and also includes minor fixes according to the
review of V6.

Summarized description:
This patch series adds support for the extended shared peripheral
interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
and guest domains. The implementation uses a generic approach to handle
eSPIs, similar to regular SPIs, while maintaining compatibility with the
existing SPI range. Functionality remains unchanged for setups that do
not require eSPIs.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default n) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.
7) Updating documentation and CHANGELOG to reflect the changes made for eSPI
support.

Also, to simplify reviewing, please find below link to unsquashed patches, that
are on top of every patch, that is changed in the series, compared to V6:
<a class="moz-txt-link-freetext" href="https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7-unsquashed/">https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7-unsquashed/</a>

Github branch with patch series:
<a class="moz-txt-link-freetext" href="https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7/">https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7/</a>

Changes in V7:
- individual changes in patches

Link on V6:
- <a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.html">https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.html</a>

Changes in V6:
- individual changes in patches

Link on V5:
- <a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.html">https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.html</a>

Changes in V5:
- individual changes in patches

Link on V4:
- <a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.html">https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.html</a>

Changes in V4:
- added a patch for documentation
- individual changes in patches

Link on V3:
- <a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.html">https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.html</a>

Changes in V3:
- added a patch to update CHANGELOG.md
- individual changes in patches

Link on V2:
- <a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.html">https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.html</a>

Changes in V2:
- added 2 more patches to implement helper
  functions for gic/vgic:
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
- removed 2 patches:
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  since their functionality can be moved to appropriate patches after
  introducing patches with helper functions
- individual changes in patches

Link on V1:
- <a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.html">https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.html</a>

Leonid Komarianskyi (12):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow eSPI processing in the gic_interrupt function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build/dom0less-build: adjust domains config to support
    eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
  doc/man: update description for nr_spis with eSPI
  CHANGELOG.md: add mention of GICv3.1 eSPI support

 CHANGELOG.md                           |   2 +
 docs/man/xl.cfg.5.pod.in               |  13 +-
 xen/arch/arm/Kconfig                   |   8 +
 xen/arch/arm/dom0less-build.c          |   2 +-
 xen/arch/arm/domain_build.c            |   2 +-
 xen/arch/arm/gic-v3.c                  | 195 +++++++++++++++++++----
 xen/arch/arm/gic.c                     |   8 +-
 xen/arch/arm/include/asm/gic.h         |  28 ++++
 xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
 xen/arch/arm/include/asm/irq.h         |  38 +++++
 xen/arch/arm/include/asm/vgic.h        |  56 ++++++-
 xen/arch/arm/irq.c                     |  62 +++++++-
 xen/arch/arm/vgic-v3.c                 | 203 ++++++++++++++++++-----
 xen/arch/arm/vgic.c                    | 212 +++++++++++++++++++++++--
 xen/arch/arm/vgic/vgic.c               |   5 +
 15 files changed, 762 insertions(+), 112 deletions(-)

-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------HlzBhsLQrd1xKNgWvngjZygp--

