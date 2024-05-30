Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0158D5005
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 18:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732828.1138845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCisx-0003oM-Sr; Thu, 30 May 2024 16:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732828.1138845; Thu, 30 May 2024 16:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCisx-0003lO-Pg; Thu, 30 May 2024 16:44:15 +0000
Received: by outflank-mailman (input) for mailman id 732828;
 Thu, 30 May 2024 16:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCisw-0003lI-Do
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 16:44:14 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8093f9d-1ea3-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 18:44:13 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-794ab20699cso7061785a.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 09:44:13 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd32207sm565507585a.112.2024.05.30.09.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 09:44:11 -0700 (PDT)
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
X-Inumbo-ID: d8093f9d-1ea3-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717087452; x=1717692252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vT2fk1rgF/oHjVjPLloIashUDDheN/bTYNz4G/vtus0=;
        b=ILJMUUC0h3ShcnQvub0rnOx/vR2dD2KaMkf5r8qIrKBHdN2y/3doy5Pe3Xw6TGR6d/
         Q6aj6ND7retn+JHvJ5AIpED8R0d74Rx1tJHAwwK8CRnKCptd9a6Mfn3Ed3+/nTVxpN26
         J6UEyoIk0sTPTgpk7nq6EEpN1JE/I9NgQ9aoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087452; x=1717692252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT2fk1rgF/oHjVjPLloIashUDDheN/bTYNz4G/vtus0=;
        b=gqy//wo+MdsG3HuMw5kGcNC/OcXDnF7RqypDVW/NU+11b+VUZ0DqKbU9uKP9SM6AKY
         aai4VlRRve85/O7spN7zKDhbuQiSu0wwGlmdtBuufo14l16btuwHltO+0748HkzfAjyc
         h02OWWpcDGxIj7I21UeK3j3PkwY9LjErg3kahgGX83jRv+L7ATDXtij8Izma0L+JvGSs
         Du+o5RAoQ/LEJDGHc4BzPjQsJUYOhdrqAjQC0ju41pw4faavVwJzaQ7i6LegO0J1XfiP
         iXyhA/OivkFV+t7Q5MWH6SyQO+vKCHzFxktfxZUF3SVevy5EapHbnA1oB7yKP4hWeUbi
         hvMA==
X-Forwarded-Encrypted: i=1; AJvYcCWtR0R7jC2hTW0QG5cXnnt9FSO3+8vnThlbRWnPE2y8w2f/KkEsIrajqH2haJF2moBs6OR0iekGzCOwlFGBK/Lp7AvrWIJpQd+h7JVobGM=
X-Gm-Message-State: AOJu0Yz1DESxIG50nm7pT3wbM1giyqKDwGIv72sQlykkUs49Pp+8h7Dt
	BSSGtobxu0VJShacZsKIMP7Qk+zSsEhH/col/yjn7Z8eSOLQ5GgyVkj/TuKvtOY=
X-Google-Smtp-Source: AGHT+IHo3hmRL/CFEP2hQrB5W1//G4XauQ0LntrUNwnRnDZulWc/lTZLPy2AdXcuCQW/M6IvRCNL6Q==
X-Received: by 2002:a05:620a:1a1f:b0:794:c275:c9a1 with SMTP id af79cd13be357-794e9d95ce0mr326934085a.1.1717087451827;
        Thu, 30 May 2024 09:44:11 -0700 (PDT)
Message-ID: <0f12ce69-b139-4d97-8e36-23dd7c6bea41@citrix.com>
Date: Thu, 30 May 2024 17:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/8] xen/riscv: disable unnecessary configs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <35cf9d52e538aab964a3ecc050260abb3f27c60d.1717008161.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <35cf9d52e538aab964a3ecc050260abb3f27c60d.1717008161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The subject should say "update Kconfig", because you're not (only)
disabling.

I'd suggest "xen/riscv: Update Kconfig in preparation for a full Xen build".

On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> Disables unnecessary configs for two cases:
> 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds (GitLab CI jobs).
> 2. By using tiny64_defconfig for non-randconfig builds.
>
> Only configs which lead to compilation issues were disabled.
>
> Remove lines related to disablement of configs which aren't affected
> compilation:
>  -# CONFIG_SCHED_CREDIT is not set
>  -# CONFIG_SCHED_RTDS is not set
>  -# CONFIG_SCHED_NULL is not set
>  -# CONFIG_SCHED_ARINC653 is not set
>  -# CONFIG_TRACEBUFFER is not set
>  -# CONFIG_HYPFS is not set
>  -# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
>
> To allow CONFIG_ARGO build happy it was included <asm/p2m.h> to <asm/domain.h>
> as ARGO requires p2m_type_t ( p2m_ram_rw ) and declaration of
> check_get_page_from_gfn() from xen/p2m-common.h.
>
> Also, it was included <xen/errno.h> to asm/p2m.h as after the latter was
> included to <asm/domain.h> the compilation error that EINVAL, EOPNOTSUPP
> aren't declared started to occur.
>
> CONFIG_XSM=n as it requires an introduction of:
> * boot_module_find_by_kind()
> * BOOTMOD_XSM
> * struct bootmodule
> * copy_from_paddr()
> The mentioned things aren't introduced now.
>
> CPU_BOOT_TIME_CPUPOOLS requires an introduction of cpu_physical_id() and
> acpi_disabled, so it is disabled for now.

CONFIG_BOOT_TIME_CPUPOOLS

Also the "depends on DT" isn't good enough as a restriction IMO.  It's
very ARM-dom0less specific.

> PERF_COUNTERS requires asm/perf.h and asm/perfc-defn.h, so it is
> also disabled for now, as RISC-V hasn't introduced this headers yet.
> LIVEPATCH isn't ready for RISC-V too and it can be overriden by randconfig,
> so to avoid compilation errors for randconfig it is disabled for now.

PERF_COUNTERS is x86-only, and both LIVEPATCH really should be guarded
by have HAVE_$FOO selected by ARCH.

However, that's not work to get stuck into now.

It's quite unreasonable how much stuff doesn't work in simple builds...

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm happy to fix up the two minor issues on commit.

