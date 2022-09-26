Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F05EA8E3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411900.655021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpNK-0003Ys-5p; Mon, 26 Sep 2022 14:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411900.655021; Mon, 26 Sep 2022 14:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpNK-0003Wf-28; Mon, 26 Sep 2022 14:46:26 +0000
Received: by outflank-mailman (input) for mailman id 411900;
 Mon, 26 Sep 2022 14:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ1t=Z5=stew.dk=stewart@srs-se1.protection.inumbo.net>)
 id 1ocpNI-0003WU-Qm
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:46:24 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd69f82-3da9-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 16:46:22 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id w2so4203214qtv.9
 for <xen-devel@lists.xenproject.org>; Mon, 26 Sep 2022 07:46:22 -0700 (PDT)
Received: from ?IPV6:2001:db8::621d:2a77:62f3:847e?
 ([2607:fb91:1108:ae0:6e73:b13c:9e3e:3750])
 by smtp.gmail.com with ESMTPSA id
 k8-20020ac86048000000b00338ae1f5421sm10885314qtm.0.2022.09.26.07.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 07:46:20 -0700 (PDT)
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
X-Inumbo-ID: fcd69f82-3da9-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stew.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Mon3F4fJzwfLL3aoRJ+rccUzL4cSbAkkiJ94n9wG960=;
        b=QbBv3/uUd7XzT5D6rQrj1kz0NhOCCeLQ6xblAOUnyCeijfim2lxWv1uVSdtXMMKxV9
         xK7joTujrn/pD5lRFPg21JANxJBaBKp1ECqQGq+gMuGoPpaxES9vh7UrwQon0UxX7ywZ
         CDEO/0s/q+7/WDeiDrdvmsbE6actEtUH5PCPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Mon3F4fJzwfLL3aoRJ+rccUzL4cSbAkkiJ94n9wG960=;
        b=d4y9QLDI1vUvJ0QFO2bG/txPM+yAGTb1MNi0cNf2/oBN5Vh5cefL+HgBtLGecwFgIt
         VJzkGExWE5mu8O2+v2F1UcN9o1TfkU/1NPca3JXu5Vbllr7gy9WdRTio1OgZbXgHfwv1
         EBpQYsvPGPoqq6NLd1mP1F7sF9gGb2fA5vOwVM6moEuW085cfitTFsgzpt7vjpbOTKBh
         uD3hs6quX5aGJ8Jb9IWmJHkdeG/JA/sQf1WEhyl6a2Xe9PBrzt7tg7OYy2rzOCwzuXPS
         5jJJLLpmB4JnW+ToOkcAI/bgS9Zu9pPxCgPGwRrtXNE7DdvdSc8qzmX/SUhS36JEUXv0
         v6Ag==
X-Gm-Message-State: ACrzQf23Hp8FzkUNbwt2rr3nuzySOUOrH4iCyccptR9WTT/ygKf2LpPO
	6CWlrNqVcTc7Ez9DQbgbT4aJ9Q==
X-Google-Smtp-Source: AMsMyM74LsZNx5JIEs0m6fH0zQ9qg+B1oP0duQbR05Yq0vXfIj272xdiOmDC+glyVHSdfLMmG0UONA==
X-Received: by 2002:a05:622a:12:b0:35d:10be:c459 with SMTP id x18-20020a05622a001200b0035d10bec459mr17923699qtw.43.1664203581382;
        Mon, 26 Sep 2022 07:46:21 -0700 (PDT)
Message-ID: <2abd4de9-5382-3ca3-5d2e-81ddc79d3b95@stew.dk>
Date: Mon, 26 Sep 2022 10:46:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/10] automation: qemu-smoke-arm32.sh: Modify script
 to use ImageBuilder
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-7-michal.orzel@amd.com>
From: Stewart Hildebrand <stewart@stew.dk>
In-Reply-To: <20220926110423.26030-7-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/22 07:04, Michal Orzel wrote:
> Take an example from arm64 qemu test scripts and use ImageBuilder
> to generate u-boot script automatically. Calculating the addresses
> manually is quite error prone and also we will be able to benefit
> from using ImageBuilder when adding domUs to this test in the future.
> 
> Install and use u-boot from the debian package.
> Modify the script so that binaries are loaded from u-boot via tftp.
> Remove dtuart=/pl011@9000000 because stdout-path in QEMU dtb is always
> set to pl011 node path.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
> - add explanation in commit msg why we remove dtuart path
> ---
>   automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
>   1 file changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> index 530f3892fdd3..765facbe4d66 100755
> --- a/automation/scripts/qemu-smoke-arm32.sh
> +++ b/automation/scripts/qemu-smoke-arm32.sh
> @@ -4,7 +4,9 @@ set -ex
>   
>   export DEBIAN_FRONTENT=noninteractive

While you are here, there's a typo. s/DEBIAN_FRONTENT/DEBIAN_FRONTEND/

