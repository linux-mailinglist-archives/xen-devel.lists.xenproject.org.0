Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FB677E0F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482924.748726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxqW-0000Jk-7E; Mon, 23 Jan 2023 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482924.748726; Mon, 23 Jan 2023 14:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxqW-0000Gl-4R; Mon, 23 Jan 2023 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 482924;
 Mon, 23 Jan 2023 14:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTeM=5U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pJxqU-0000GX-5B
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:30:50 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 871df8bb-9b2a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:30:47 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id tz11so31069467ejc.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 06:30:47 -0800 (PST)
Received: from [192.168.1.93] (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.gmail.com with ESMTPSA id
 g3-20020a1709067c4300b007c0a7286ac8sm22257378ejp.69.2023.01.23.06.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:30:46 -0800 (PST)
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
X-Inumbo-ID: 871df8bb-9b2a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+I4vPncaaWJXfIvQXqNCD0mrnSOzMTWilIJ7jUXKnfU=;
        b=UAldMUsaeLde94z2Df7LKJWrNCKRMHjgmbvBLJmfWrthPtk0a1r1/sUrOalJEYW75s
         G4EIJeaeIGtzhWatOBJQO/8cGmwCl94UvhN1Lfr5Qmh1cS4FhXmEvCQ5rRAipHnvof+e
         U0yR9YqetFZE+JzckyBOErh4wwCINITj9W2eyB5/Flyiz9MzpABzVQlNsCcjn7OD/Dy/
         0xXctPZu1IXroUaB2oy9+cwJ32HeOaIaq6iDdTQwsa+kxeIoDLVvrVTzQN65R/TqlLs2
         YLabJEm4X8PyOyrsQcLX5tYa6M3hXumKzQ0pIwGrUbmrTy1WzBeSFUpqk+BD7B1Paa/Z
         l51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+I4vPncaaWJXfIvQXqNCD0mrnSOzMTWilIJ7jUXKnfU=;
        b=QYqv7jJQ/z9QTL+It3ARAJ2X9fpDKh2kI8tzjuqjLKhZ1Y7MtqmnMjr8anWah3PYA/
         XOfopFHGnqOa1NhykSUug7+1mKc8wCrPAbQ3icr3pM3DBef8A4F9n69dsMDOoRKNXYSi
         Bz5QgpBkCDS3YBqt7xyygbLc51q8mwJ7vnUDp2ko6BKre6L5xnYrKIR4NyP4oDmf4m+7
         XUEMeYdHyQVQO2EWwR904UIrm4Cux1NlZgsKT5GMq91QxPBef3uQ26GaO80zgLM9dbED
         kHE5V7KcMqLyNvnNviES1cocWe3f9Dm/uTasXryO1yC3DnwbzmWX67RkdtKkpFryG14H
         xHSA==
X-Gm-Message-State: AFqh2kqMDUDIqpiOoa9JOxDGLCYYctl3znlXoPcs4SETX8EXNvOFcqKU
	OhkntvPBnYilFUr9izObOeA=
X-Google-Smtp-Source: AMrXdXufQ/MIbJ0GHR2xZ9YngV0OromMOGOL0TlQeMZA8QHUB2/6Ik4k42InsBPiuu05Z7or96cUdA==
X-Received: by 2002:a17:906:6b8f:b0:877:74e6:67a4 with SMTP id l15-20020a1709066b8f00b0087774e667a4mr16195462ejr.47.1674484247132;
        Mon, 23 Jan 2023 06:30:47 -0800 (PST)
Message-ID: <01297097-d8ce-a22c-a616-f98691d3ad4f@gmail.com>
Date: Mon, 23 Jan 2023 16:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] automation: Modify static-mem check in
 qemu-smoke-dom0less-arm64.sh
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, ayankuma@amd.com
References: <20230123131023.9408-1-michal.orzel@amd.com>
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20230123131023.9408-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/23/23 15:10, Michal Orzel wrote:
> At the moment, the static-mem check relies on the way Xen exposes the
> memory banks in device tree. As this might change, the check should be
> modified to be generic and not to rely on device tree. In this case,
> let's use /proc/iomem which exposes the memory ranges in %08x format
> as follows:
> <start_addr>-<end_addr> : <description>
> 
> This way, we can grep in /proc/iomem for an entry containing memory
> region defined by the static-mem configuration with "System RAM"
> description. If it exists, mark the test as passed. Also, take the
> opportunity to add 0x prefix to domu_{base,size} definition rather than
> adding it in front of each occurence.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Also you fixed the hard tab.

> ---
> Patch made as part of the discussion:
> https://lore.kernel.org/xen-devel/ba37ee02-c07c-2803-0867-149c779890b6@amd.com/
> 
> CC: Julien, Ayan
> ---
>   automation/scripts/qemu-smoke-dom0less-arm64.sh | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 2b59346fdcfd..182a4b6c18fc 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -16,14 +16,13 @@ fi
>   
>   if [[ "${test_variant}" == "static-mem" ]]; then
>       # Memory range that is statically allocated to DOM1
> -    domu_base="50000000"
> -    domu_size="10000000"
> +    domu_base="0x50000000"
> +    domu_size="0x10000000"
>       passed="${test_variant} test passed"
>       domU_check="
> -current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
> -expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
> -if [[ \"\${expected}\" == \"\${current}\" ]]; then
> -	echo \"${passed}\"
> +mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
> +if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
> +    echo \"${passed}\"
>   fi
>   "
>   fi
> @@ -126,7 +125,7 @@ UBOOT_SOURCE="boot.source"
>   UBOOT_SCRIPT="boot.scr"' > binaries/config
>   
>   if [[ "${test_variant}" == "static-mem" ]]; then
> -    echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
> +    echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
>   fi
>   
>   if [[ "${test_variant}" == "boot-cpupools" ]]; then

-- 
Xenia

