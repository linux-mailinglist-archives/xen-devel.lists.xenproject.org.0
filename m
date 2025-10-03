Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB15BB81F3
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 22:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136860.1473294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4mbN-0006UO-PA; Fri, 03 Oct 2025 20:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136860.1473294; Fri, 03 Oct 2025 20:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4mbN-0006RI-MH; Fri, 03 Oct 2025 20:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1136860;
 Fri, 03 Oct 2025 20:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FzWq=4M=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4mbM-0006RC-G4
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 20:42:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0d2603-a099-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 22:42:02 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so1926085f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 13:42:02 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a25dbcsm155655605e9.19.2025.10.03.13.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 13:42:00 -0700 (PDT)
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
X-Inumbo-ID: 6a0d2603-a099-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759524121; x=1760128921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW5k2zL3fmegA2ZxrF2uAnfp4SXP4L2O5lee8nx3mSc=;
        b=GAhJ+Sglr2yu+QluaFQoc7DA0tjuSVff8O6XQYedTUvr+fG7WophdNI0vu4A9UcQxK
         oOAkpBi88QQcLypdtZCAiHA3NTuACP9l/3PC2FPHm4HUEdKtH2B2txg0+9uj14AnjZVJ
         omak+cQgCxekvfRJ+vh/b76yACCpPuSaLNI+R2eLf1EPQm6MLb7qfzGlLq+/2sIqOcx/
         bSeCw6hCmULiFRRwLoeguVRiyM15Ksq/h0nPB0KV54nBgQUI12MlV5dQNvdjsn+gz7Wv
         2rxvmSMbj85yNCFRhG7qe2Ob+pHAlWvx6qotVD6zdqAeKnS3VPSGNBtk6+XF5SMsOmjO
         e/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759524121; x=1760128921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PW5k2zL3fmegA2ZxrF2uAnfp4SXP4L2O5lee8nx3mSc=;
        b=Hr868lQrKED1R0zpvwvstX68o+PzWtvOn1eqmckNuxS8gjyALOkSr/w4XFd5QIsBNt
         VI5Fkewn8KPzmta15XiUTo/zqyy8p+lI5l9kwkkOorZQ4l4qoN+5pmDzPqLu+tteDM58
         yAFl8Owz/ieLO0Il/U9C/QgT5T1K5VycMzOfe9OarICpJdEcO6CYBKWibded2/3N6tPB
         OHbZiuQknNau88hNwAz2mJg4sS4/QxwxGF6EVwUEVdHHjgzSIuBdFaC3XoQJnVDR4375
         TFNX4rQO9YAlYPAc3isyJweWoNnuX7JEcWHUxtZb1o7oIKTYsaAD7iqtEtuJmc1V6p30
         7VEw==
X-Forwarded-Encrypted: i=1; AJvYcCU5SHeh0YxZ+tLOmviRT0v2c/AloXmpNVlHx5dNZI8+eaygrXSLXsDAQxjXvz+qJXWevx5ntGWljKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVWVRny/vKyw2AGwcv2lL6PYRLEJ+ZBZeb3nwMUkVR3Vjmu5X1
	yB3GplmJj3ldcUV3BCYU7tsTH/JPRlB5T5ZD3eg6Aq4t28PbVmT0Kn6NIM+pmUyzm3o=
X-Gm-Gg: ASbGncvx85CUqkUPD64dtc9GqwkDP+ztq+4CWfbQQnXgsm24ar6f9LphtZO+Vrd1aFU
	BZOgpaFDUMmYEOgfnTgop6A2V8Kx8UydCfuXsLzNt8/haFRItCM2mkT7gKRT5nM+dI4vaDKbJ7G
	9Im0hMVIB5Dv1adArb44xUmRnqXw9Ytt+nAouA3DOAbB6q2dir4xPnaDplhUprhoK3fnM8s52a5
	eMHcKPRsfkwj+IElXai0eS+Xbs2HDytLDUDfnqQarKZk+PB96hIdLlmOchB0d3vZfdkcFoeSoYm
	s8AqBdWkk/NDdOArSIebRxb5Vkti8Yy0w0ZrWJyUyys9AYZ0nSSKeSuoyZkD6iein1GTBnx8JmW
	wMmNYcvUQyw49fA859IOrhXI4z0ojz8KsCLYgyVKcIraxNvYqIc47S0w52g3k5dfKTYIYWtYlGD
	e+MdvJ2/1M/tPC+OP6keo5UlquRU0MeKCzrlzcI10=
X-Google-Smtp-Source: AGHT+IHHpUVAOz/kW4FY5inemqoIDxzaObgtHSvRK94Nk1VfVB9QmYTxm3ZfXZPywnWOkC76eMfSUA==
X-Received: by 2002:a05:6000:3111:b0:402:7afc:1cf5 with SMTP id ffacd0b85a97d-4256719e6cemr2721575f8f.35.1759524121296;
        Fri, 03 Oct 2025 13:42:01 -0700 (PDT)
Message-ID: <c80928c3-0a54-4cdc-858f-b2ac4670e38d@linaro.org>
Date: Fri, 3 Oct 2025 22:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] system/physmem: Remove cpu_physical_memory
 _is_io() and _rw()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20251002084203.63899-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/10/25 10:41, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (17):
>    docs/devel/loads-stores: Stop mentioning
>      cpu_physical_memory_write_rom()
>    system/memory: Factor address_space_is_io() out
>    target/i386/arch_memory_mapping: Use address_space_memory_is_io()
>    hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
>    system/physmem: Remove cpu_physical_memory_is_io()
>    system/physmem: Pass address space argument to
>      cpu_flush_icache_range()
>    hw/s390x/sclp: Replace [cpu_physical_memory -> address_space]_r/w()
>    target/s390x/mmu: Replace [cpu_physical_memory -> address_space]_rw()
>    target/i386/whpx: Replace legacy cpu_physical_memory_rw() call
>    target/i386/kvm: Replace legacy cpu_physical_memory_rw() call
>    target/i386/nvmm: Inline cpu_physical_memory_rw() in nvmm_mem_callback
>    hw/xen/hvm: Inline cpu_physical_memory_rw() in rw_phys_req_item()
>    system/physmem: Un-inline cpu_physical_memory_read/write()
>    system/physmem: Avoid cpu_physical_memory_rw when is_write is constant
>    system/physmem: Remove legacy cpu_physical_memory_rw()
>    hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
>    hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call

Series queued, thanks.

