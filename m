Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5CA617CC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915026.1320672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8uI-0007a0-S4; Fri, 14 Mar 2025 17:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915026.1320672; Fri, 14 Mar 2025 17:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8uI-0007YU-PM; Fri, 14 Mar 2025 17:33:14 +0000
Received: by outflank-mailman (input) for mailman id 915026;
 Fri, 14 Mar 2025 17:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8uH-0007Xx-HF
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:33:13 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 665c857c-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:33:11 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2239aa5da08so48501355ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:33:11 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbe4c5sm31163235ad.192.2025.03.14.10.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 10:33:09 -0700 (PDT)
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
X-Inumbo-ID: 665c857c-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973590; x=1742578390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfJn8ylcc7bIMXo6FULC7ghWGBlTsQARiadKWN33xhk=;
        b=SDc2UXTjEAUrLrzhAJzyQzsU/CcjraXPb/Uar1RCiPe2MnMw/UXNC+D3MOKbtHTRZE
         bolk63SoNVrDtY9tWqSgFuFhxBDObpI4gblVOpBjwyeQCyL79ES+eG6BYTttiI7kcBNA
         cbGdrZOjYtU2I87T/56wwoc/iZ6R07ZykTldxhPM6eoVngI6QpDHV9BZ+soSBjTWUfGA
         zCa1lXaR6Z40XxvLLqGaH1Zc8k5jRIxlMV2k9aGmdIEvyF4DkE6ZzDdoc8Qp4kxeBSKF
         P8Y3n6EuDsVjdahsDjzi99vGgAcL8yPqwLYAzexj3bUM3718SZQ9Gium+ch7Tclbe4nX
         CNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973590; x=1742578390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfJn8ylcc7bIMXo6FULC7ghWGBlTsQARiadKWN33xhk=;
        b=F1h2wv8JNk9vSn+M2+uG0wM8MwGZwI5JvH0gbIGPXbrmtl1r2wI5ZVOh0Z4elC652X
         y3noHgvlVQ6OvLcB2pjQC8ZQxjjNj/5vwK9OSSvlpdSVWfIBr0gBfC2FsLOlEoW2RPGJ
         eurme9lTNKVvFRmN55frxikgx8TJfXY2YzyTc+/OpXF0rPTayeyvQCkFjD/A3L+Y3uZi
         QRwHPFcDFjYJNoD4jvVWSndnedNpCx/AJ79wZPKWGyRYXCas6sPSDQHVfYV3BiiIUOq0
         90tyoedJoMaPTli7ImJhj6x4AjfS5xxg+nKuvNJ8s4tsY20Bt8/Ea/l2hFCnGcjra35a
         0CRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS+wLefziU8W22Kabanp/h5D2sSPFP3ummJYZMELgG1Tx7UzN7tW6efdyLZm8utHeNwPQgR1Uhvqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5taUoueh+kvS6ILhg5SpD78CYLz0pXM57okfriZCQdkKboApv
	LWUDmRRpDPvvFcHnBv617fxYZCxOKPgyjJLpR8iZj/zls92RIlpS3iJVYt2eBRI=
X-Gm-Gg: ASbGncs+qE4mofqgKz71vEtYrTPUrwTUbgqU+JrowNhDo4MPiBWaamVLMSIU3Oyy4DF
	/BpKWylBQ4OUrovlwdtxBL2BqkWVzXdXQAu1RDgiYc5u6csouSEmP3jfYJEdHclTWRsq+HHIuPB
	vPArFL6eU2PFpMznYEz2D8cNjTslMGB6K7uTCi6n8/a0pyaLoJeeYx7fsscMEwykkou1T7jPQ1C
	pWUdlWeuJUbxsGkan9MD8WlsZa/EfvJFBwWPrENIIF3V19yZZMJ+dl7N32LymH0nWkZpy6xpUO4
	3QGut8NvHSYa47Z94i63rqcIWhWViG/oUavmhYhH/6g7eGMoaCyJAa2NdA==
X-Google-Smtp-Source: AGHT+IGn7+0AN3fVzzoc32npzDlWCxdUi65DSAZ1hRH63zOg5rpmzCsnUJT+UaYhzI2QTzM024e55A==
X-Received: by 2002:a17:902:da90:b0:21f:2ded:76ea with SMTP id d9443c01a7336-225e0afa014mr36590685ad.36.1741973590244;
        Fri, 14 Mar 2025 10:33:10 -0700 (PDT)
Message-ID: <5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org>
Date: Fri, 14 Mar 2025 10:33:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] make system memory API available for common code
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

one patch is missing review:
[PATCH v5 12/17] hw/xen: add stubs for various functions.

Regards,
Pierrick

On 3/14/25 10:31, Pierrick Bouvier wrote:
> The main goal of this series is to be able to call any memory ld/st function
> from code that is *not* target dependent. As a positive side effect, we can
> turn related system compilation units into common code.
> 
> The first 5 patches remove dependency of memory API to cpu headers and remove
> dependency to target specific code. This could be a series on its own, but it's
> great to be able to turn system memory compilation units into common code to
> make sure it can't regress, and prove it achieves the desired result.
> 
> The next patches remove more dependencies on cpu headers (exec-all,
> memory-internal, ram_addr).
> Then, we add access to a needed function from kvm, some xen stubs, and we
> finally can turn our compilation units into common code.
> 
> Every commit was tested to build correctly for all targets (on windows, linux,
> macos), and the series was fully tested by running all tests we have (linux,
> x86_64 host).
> 
> v2:
> - reorder first commits (tswap change first, so memory cached functions can use it)
> - move st/ld*_p functions to tswap instead of bswap
> - add define for target_words_bigendian when COMPILING_PER_TARGET, equals to
>    TARGET_BIG_ENDIAN (avoid overhead in target code)
> - rewrite devend_memop
> - remove useless exec-all.h in concerned patch
> - extract devend_big_endian function to reuse in system/memory.c
> - rewrite changes to system/memory.c
> 
> v3:
> - move devend functions to memory_internal.h
> - completed description for commits removing cpu.h dependency
> 
> v4:
> - rebase on top of master
>    * missing include in 'codebase: prepare to remove cpu.h from exec/exec-all.h'
>    * meson build conflict
> 
> v5:
> - remove extra xen stub xen_invalidate_map_cache()
> - edit xen stubs commit message
> 
> Pierrick Bouvier (17):
>    exec/tswap: target code can use TARGET_BIG_ENDIAN instead of
>      target_words_bigendian()
>    exec/tswap: implement {ld,st}.*_p as functions instead of macros
>    exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
>    exec/memory_ldst_phys: extract memory_ldst_phys declarations from
>      cpu-all.h
>    exec/memory.h: make devend_memop "target defines" agnostic
>    codebase: prepare to remove cpu.h from exec/exec-all.h
>    exec/exec-all: remove dependency on cpu.h
>    exec/memory-internal: remove dependency on cpu.h
>    exec/ram_addr: remove dependency on cpu.h
>    system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for
>      common code
>    exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
>    hw/xen: add stubs for various functions
>    system/physmem: compilation unit is now common to all targets
>    include/exec/memory: extract devend_big_endian from devend_memop
>    include/exec/memory: move devend functions to memory-internal.h
>    system/memory: make compilation unit common
>    system/ioport: make compilation unit common
> 
>   include/exec/cpu-all.h              | 66 -----------------------
>   include/exec/exec-all.h             |  1 -
>   include/exec/memory-internal.h      | 21 +++++++-
>   include/exec/memory.h               | 30 ++++-------
>   include/exec/ram_addr.h             | 11 ++--
>   include/exec/tswap.h                | 81 +++++++++++++++++++++++++++--
>   include/system/kvm.h                |  6 +--
>   include/tcg/tcg-op.h                |  1 +
>   target/ppc/helper_regs.h            |  2 +
>   include/exec/memory_ldst.h.inc      |  4 --
>   include/exec/memory_ldst_phys.h.inc |  5 +-
>   cpu-target.c                        |  1 +
>   hw/ppc/spapr_nested.c               |  1 +
>   hw/sh4/sh7750.c                     |  1 +
>   hw/xen/xen_stubs.c                  | 51 ++++++++++++++++++
>   page-vary-target.c                  |  2 +-
>   system/ioport.c                     |  1 -
>   system/memory.c                     | 17 ++----
>   target/ppc/tcg-excp_helper.c        |  1 +
>   target/riscv/bitmanip_helper.c      |  2 +-
>   hw/xen/meson.build                  |  3 ++
>   system/meson.build                  |  6 +--
>   22 files changed, 188 insertions(+), 126 deletions(-)
>   create mode 100644 hw/xen/xen_stubs.c
> 


