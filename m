Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59B6AF691
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 21:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507894.782063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZdng-00089P-Jb; Tue, 07 Mar 2023 20:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507894.782063; Tue, 07 Mar 2023 20:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZdng-00086s-G1; Tue, 07 Mar 2023 20:20:44 +0000
Received: by outflank-mailman (input) for mailman id 507894;
 Tue, 07 Mar 2023 20:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NnZl=67=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pZdne-00086m-OK
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 20:20:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8797a776-bd25-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 21:20:41 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso11230105wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 12:20:40 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c33aa00b003e215a796fasm13566660wmp.34.2023.03.07.12.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:20:39 -0800 (PST)
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
X-Inumbo-ID: 8797a776-bd25-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678220440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//KTGqo1ZbuvwkeVCqTamRYcpCZggzKkeREBxxg498A=;
        b=ZcjdPGGFbiU+FQEvZm/+Ra9cB4jMByi+fSjS17RGnN0pX3/JjeBjEmTXeE9tWvlRNm
         +xiAqhshb9ZnJxgTn2mk6gr6gf1HHD0e/JGRM5LvY5BFnBoANAbP7zZId0TUNmiov3JA
         cq2fnyUO82aBdwEc9skq/DPossrB5DU7QJj1pJeEW0RdeaFPSgk4DkL64ywSyiDoSD7u
         a5VPRtWNkBu9dFBTb5Of0EwURgyMvTrP3IxqxNrZsK4CRBQNhsgw1x7PdC4TVV6iHO6p
         mrS30etFQn3vluKuTQE6GJMlLP7s0jkBdNgmZNliVOsJGsIYuCcM5Y+1LgbwgQTCQ1RW
         MeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678220440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//KTGqo1ZbuvwkeVCqTamRYcpCZggzKkeREBxxg498A=;
        b=U7Dq0SMf6X9P5ytogg2Jdc1WdOoQh8LQkdOV2wq59jhwa9mvTgK76+BVxi5F1bvYr8
         RydGNEkPQRobB9At1C7Vk4u5xPHvLmEN5mdi+pAhhzbDpqA+UtP4VoHEsMOt2vDyHQaN
         7hiQABvVjovsVBYbGUf4o6N9hi0s68q31OySzgNPUHxwG3r0NLYq5ABdy4zmM+vziesp
         toZXqfeW2DX5P0HVK9fpygj0LbF7Gi6GPeAy3E1YYxsHc1qNUmrQTBp1oCZWNBsCeYeb
         VxKMy72G7FZmzlWxzpUa9jGkIdk3sqpcMVwivOuYHm2UxPCw+z6uyj57pVeBF8kD4t/7
         HSiw==
X-Gm-Message-State: AO0yUKUIsYOqqb0mc+zhMPBoGv8HXKzk96K1Dryvzg8qgtthkUyKh10t
	28DkjaZchPmhmmaujp29mrmDZg==
X-Google-Smtp-Source: AK7set+3DpOcP7xHfRowsfuVV2o2eM9Iw1P8Yp9l56Ty1WWUasOSFy0fQ9J+M8AoONGrOrdA4Yksww==
X-Received: by 2002:a05:600c:3c85:b0:3ea:f05b:50cc with SMTP id bg5-20020a05600c3c8500b003eaf05b50ccmr14928023wmb.8.1678220440099;
        Tue, 07 Mar 2023 12:20:40 -0800 (PST)
Message-ID: <c53bca89-53d3-11ca-a768-dc7e9143e7b1@linaro.org>
Date: Tue, 7 Mar 2023 21:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/27] Enable PV backends with Xen/KVM emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 7/3/23 19:26, David Woodhouse wrote:
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
> 
>    Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
> 
> are available in the Git repository at:
> 
>    git://git.infradead.org/users/dwmw2/qemu.git refs/tags/xenfv-2
> 
> for you to fetch changes up to 154eac37190c4d80d29b09c226abd899e397530f:
> 
>    docs: Update Xen-on-KVM documentation for PV disk support (2023-03-07 17:04:30 +0000)
> 
> 
> Tested-by: Paul Durrant <paul@xen.org>
> ... on real Xen (master branch, 4.18) with a Debian guest.

This tag only appears in the cover letter, and is missing in each patch.
It would have been acceptable if it were in the PR tag, but
the tag (which for some reason isn't displayed in your cover letter)
is simply "PV back end support for emulated Xen".

You can fetch a series with tag applied with b4:
https://github.com/mricon/b4

You can post signed PR with easily with git-publish:
https://github.com/stefanha/git-publish

> ----------------------------------------------------------------
> David Woodhouse (23):
>        hw/xen: Add xenstore wire implementation and implementation stubs
>        hw/xen: Add basic XenStore tree walk and write/read/directory support
>        hw/xen: Implement XenStore watches
>        hw/xen: Implement XenStore transactions
>        hw/xen: Watches on XenStore transactions
>        hw/xen: Implement core serialize/deserialize methods for xenstore_impl
>        hw/xen: Add evtchn operations to allow redirection to internal emulation
>        hw/xen: Add gnttab operations to allow redirection to internal emulation
>        hw/xen: Pass grant ref to gnttab unmap operation
>        hw/xen: Add foreignmem operations to allow redirection to internal emulation
>        hw/xen: Move xenstore_store_pv_console_info to xen_console.c
>        hw/xen: Use XEN_PAGE_SIZE in PV backend drivers
>        hw/xen: Rename xen_common.h to xen_native.h
>        hw/xen: Build PV backend drivers for CONFIG_XEN_BUS
>        hw/xen: Only advertise ring-page-order for xen-block if gnttab supports it
>        hw/xen: Hook up emulated implementation for event channel operations
>        hw/xen: Add emulated implementation of grant table operations
>        hw/xen: Add emulated implementation of XenStore operations
>        hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
>        hw/xen: Implement soft reset for emulated gnttab
>        i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation
>        MAINTAINERS: Add entry for Xen on KVM emulation
>        docs: Update Xen-on-KVM documentation for PV disk support
> 
> Paul Durrant (4):
>        hw/xen: Implement XenStore permissions
>        hw/xen: Create initial XenStore nodes
>        hw/xen: Add xenstore operations to allow redirection to internal emulation
>        hw/xen: Avoid crash when backend watch fires too early


