Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FDA5B9BD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907238.1314502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru0j-0005pT-QR; Tue, 11 Mar 2025 07:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907238.1314502; Tue, 11 Mar 2025 07:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru0j-0005nz-N2; Tue, 11 Mar 2025 07:26:45 +0000
Received: by outflank-mailman (input) for mailman id 907238;
 Tue, 11 Mar 2025 07:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+cUl=V6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tru0i-0005Pq-EU
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:26:44 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e0c5bf3-fe4a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 08:26:42 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso23609235e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:26:42 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d025869e7sm19373395e9.7.2025.03.11.00.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:26:41 -0700 (PDT)
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
X-Inumbo-ID: 2e0c5bf3-fe4a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741678002; x=1742282802; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixQm0MWjxG3W9XU5tOCfvUKz5fda/FdNvvBHZqMnUSI=;
        b=W4EYwbmns8SyhMw1kzFqHVzgpWdzN61iOmy67w3nucv0N611aQxCAMHOqmz+/HVxup
         pRVMRWaioZmVM7Msw3GqZhm21SJHNDgmNmYqdtcugNwrAvIByIuRwSiGcwWNRPE1KvIU
         Jksz9C92aXT5O8GjtAJV8PS6+Vs+mezbZWUrDDpsBvdqyNx3aDf1clq1n6TRn5C1Pa+E
         BW4T5+j6XnJi4BrQF2cgneX/iwHh9vJ/3sqbVmCAQ/PiFZXHYNq9tdVMf3Z2lA1nC90c
         IGcd9zLyvXXGGKfG+eun6mqoteMBYyY9oCh4TjrYRbnxA4a8eUDvT+MSo+PcVfykD1yT
         +OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741678002; x=1742282802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixQm0MWjxG3W9XU5tOCfvUKz5fda/FdNvvBHZqMnUSI=;
        b=G/URVADnnus70PEMUm9q72OE8PylcMMKhURztuXqj+nAoWF9AKBflL7YSwu7lk4wGP
         xStOu/+jwLAQWlyfiLDf9fVhKuPSc/lfD1Q9hfYMxH93838myyqk6UJ5a5ZdmJ5hu2Ng
         o59rAnS52VmT0qXC0QdjnVr/1HWENIpS7yzNfW9Uklm178OYGoJhe7+6Aktn1OPlmu3i
         l56Mwpf4xIxMiWUonup4SADvbRhQC1EkHsBGPl5w9elj0ZKXTClNKIYNwsvB3RxFcX2c
         IksN27O9wzL2nnb8ObkQ1G3xgpoJAMiWwd0Tq51ua89GV0+JScQ/Oy6A/9Xr84nV7Wjb
         VfIg==
X-Forwarded-Encrypted: i=1; AJvYcCXy57wgGG4CagVvLHnRVao1lW9YYzOfBOe1ib8cPOK6wP6kro0dyUD63/KzCJBtqiehqJJ+AaKjOJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHeg8BLawKwDbmsS0dECoqoJVb6PeD62fCxMt7lB22QLpcZXUS
	ePPheGvKWeq7yPs72Ll1G/+Gb+VfsdOdskkzkbPoxN0VJXHeYqBOZets5y/kXOI=
X-Gm-Gg: ASbGnct8k3DGOZy3um3N2PfaadFFlMEVngu2sGz5RyvViPJCaFaCogEWtNtVMEE+MUE
	DVvgu7TSWT9wSIrEC81XHSX9EozyTcrmCuBNLmI3z5uCGopGWLa4K3hHOaCNgDjLFXshvjJ4PLs
	42z646cjmLBlT5povqDDVYugVvxqzok3ORyeqyh09ZCfwmk4+Zmht44AE5Rd7CDABLngROUND9w
	MTZxxghIn99zPHISmb52D4tzqoBIw1lFMq6lydNIJFRGIzzCqqEp5AX5yNXBQiNKPkAQMJ+Qysi
	EdpR8j4MJ6SBm6PdJFdWIpuUJJBstKaTKKU/IXsF767LfLuNVniIclWZffSii3zUpZG07pP6K3I
	pX8mn4V+VAfFm
X-Google-Smtp-Source: AGHT+IHkbKwZ85r50y8SupgnjoEiG0z2vsuYpmQ1kXDuNtR/J+NTZlfd2MeQZu55SLcc8fFLvUwdtQ==
X-Received: by 2002:a05:600c:4f16:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43cfd72f2ccmr76596325e9.11.1741678002154;
        Tue, 11 Mar 2025 00:26:42 -0700 (PDT)
Message-ID: <9f92a783-3826-4a06-9944-0e0ec5faccc9@linaro.org>
Date: Tue, 11 Mar 2025 08:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] exec/memory-internal: remove dependency on cpu.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-9-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-9-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/25 05:08, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Missing the "why" justification we couldn't do that before.

> ---
>   include/exec/memory-internal.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
> index 100c1237ac2..b729f3b25ad 100644
> --- a/include/exec/memory-internal.h
> +++ b/include/exec/memory-internal.h
> @@ -20,8 +20,6 @@
>   #ifndef MEMORY_INTERNAL_H
>   #define MEMORY_INTERNAL_H
>   
> -#include "cpu.h"
> -
>   #ifndef CONFIG_USER_ONLY
>   static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
>   {


