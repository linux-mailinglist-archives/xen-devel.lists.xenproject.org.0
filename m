Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823330A7B0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79831.145433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YPS-0002AC-B6; Mon, 01 Feb 2021 12:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79831.145433; Mon, 01 Feb 2021 12:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YPS-00029q-7G; Mon, 01 Feb 2021 12:34:26 +0000
Received: by outflank-mailman (input) for mailman id 79831;
 Mon, 01 Feb 2021 12:34:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LFAu=HD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l6YPQ-00029l-Ht
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:34:24 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f4fcbad-4f40-4472-a42a-51800129a07b;
 Mon, 01 Feb 2021 12:34:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id y14so6725897ljn.8
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 04:34:23 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 196sm2968698lfj.219.2021.02.01.04.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 04:34:21 -0800 (PST)
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
X-Inumbo-ID: 6f4fcbad-4f40-4472-a42a-51800129a07b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XbPw9h0o24mx7IeLb1rrzfnFe0QBg2D5okIs1p7WT1Q=;
        b=EBINm2kyobqcHSJpOMEc/i/ONegS0KpcuwlE+f3bB2HTHP0Fhz7eHmlXTpGv4RNH35
         owa0/eBTlkhKoO2W5jRTS6dmEm4uZnxt6S7/R0H+CWDtDzoY+iYPZYAEDpPISeNiBmr5
         0gKu8EE+StMtsVJrJiVTIVLNeFcaub/CJttHfpvWd0MHeuLGgNSYdq7hxqu6/BEeRvNi
         8GW/SJkCyTsGB/pLM6uuvF95OYLlMEpQaPSVAOBX1QVlccvj2Pvw8k3IxXSf3Wda0ngy
         BEUjzyfC4AIuPhousXGq2QmoOiU0EbE0DDnT9tXJ/Bmv7uPtOwtyEE3mSl0ektwSxmfO
         MABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XbPw9h0o24mx7IeLb1rrzfnFe0QBg2D5okIs1p7WT1Q=;
        b=Hl04N7r3U0LKCWV7eBqEVyHmgvdGikNtoxJcPDqv4mtR8BlgEQHh4Ygg+RkzwJr9Su
         c52Rtq3t9PgDi+FoRFvSHDECHjKhFGGiGFo5LuqkO7pvXMk/WQ4Nb5IQfo9ow/pEahIQ
         x/Xnf3vC+8e5diXHyzEeObn6Lvz5xdfj6kcx0k7s1gZFiUuhLI/p99yhoAfl4mUP2Ntf
         Lt8vJ8uI+FNwEenosxNxEXclmMMQbUi4IBFtG5dsJfJymuDwjILPwZ7fMu7m2cANQwWU
         RSyN/j/1vVa/4aYICyDkWGNAfUVRlsywtOpX9aJaFvBa+1gbQN0pNzIjFvJUzF9+oSZ7
         VawQ==
X-Gm-Message-State: AOAM532caXJ47iowspWbyq0drA689vtQDb36eeBQ00ATnOphbrH6ZG8Z
	VKCMSpzOOU9M0sUBy4cVj+Q=
X-Google-Smtp-Source: ABdhPJxisAotvCzYNiMdMYsVKM5JGdtAKt+ibFSa5ytHrFiLZTi6W5fbxbNSEi/8AiSDIvX9oh/tLw==
X-Received: by 2002:a2e:3e19:: with SMTP id l25mr10226149lja.217.1612182862098;
        Mon, 01 Feb 2021 04:34:22 -0800 (PST)
Subject: Re: [PATCH v8 00/16] acquire_resource size and external IPT
 monitoring
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <911270bf-0077-b70e-c224-712dfa535afa@gmail.com>
Date: Mon, 1 Feb 2021 14:34:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 30.01.21 04:58, Andrew Cooper wrote:

Hi Andrew

> Combined series (as they are dependent).  First, the resource size fixes, and
> then the external IPT monitoring built on top.
>
> Posting in full for reference, but several patches are ready to go in.  Those
> in need of review are patch 6, 8 and 12.
>
> See individual patches for changes.  The major work was rebasing over the
> ARM/IOREQ series which moved a load of code which this series was bugfixing.

Looks like that some of these patches have been already merged. So I 
preliminary tested current staging 
(9dc687f155a57216b83b17f9cde55dd43e06b0cd x86/debug: fix page-overflow 
bug in dbg_rw_guest_mem) on Arm *with* IOREQ enabled.

I didn't notice any regressions with IOREQ on Arm))


>
> Andrew Cooper (7):
>    xen/memory: Reject out-of-range resource 'frame' values
>    xen/gnttab: Rework resource acquisition
>    xen/memory: Fix acquire_resource size semantics
>    xen/memory: Improve compat XENMEM_acquire_resource handling
>    xen/memory: Indent part of acquire_resource()
>    xen/memory: Fix mapping grant tables with XENMEM_acquire_resource
>    xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace
>
> Michał Leszczyński (7):
>    xen/domain: Add vmtrace_size domain creation parameter
>    tools/[lib]xl: Add vmtrace_buf_size parameter
>    xen/memory: Add a vmtrace_buf resource type
>    x86/vmx: Add Intel Processor Trace support
>    xen/domctl: Add XEN_DOMCTL_vmtrace_op
>    tools/libxc: Add xc_vmtrace_* functions
>    tools/misc: Add xen-vmtrace tool
>
> Tamas K Lengyel (2):
>    xen/vmtrace: support for VM forks
>    x86/vm_event: Carry the vmtrace buffer position in vm_event
>
>   docs/man/xl.cfg.5.pod.in                    |   9 +
>   tools/golang/xenlight/helpers.gen.go        |   4 +
>   tools/golang/xenlight/types.gen.go          |   2 +
>   tools/include/libxl.h                       |  14 ++
>   tools/include/xenctrl.h                     |  73 ++++++++
>   tools/libs/ctrl/Makefile                    |   1 +
>   tools/libs/ctrl/xc_vmtrace.c                | 128 +++++++++++++
>   tools/libs/light/libxl.c                    |   2 +
>   tools/libs/light/libxl_cpuid.c              |   1 +
>   tools/libs/light/libxl_create.c             |   1 +
>   tools/libs/light/libxl_types.idl            |   5 +
>   tools/misc/.gitignore                       |   1 +
>   tools/misc/Makefile                         |   7 +
>   tools/misc/xen-cpuid.c                      |   2 +-
>   tools/misc/xen-vmtrace.c                    | 154 ++++++++++++++++
>   tools/ocaml/libs/xc/xenctrl.ml              |   1 +
>   tools/ocaml/libs/xc/xenctrl.mli             |   1 +
>   tools/xl/xl_info.c                          |   5 +-
>   tools/xl/xl_parse.c                         |   4 +
>   xen/arch/x86/domain.c                       |  23 +++
>   xen/arch/x86/domctl.c                       |  55 ++++++
>   xen/arch/x86/hvm/vmx/vmcs.c                 |  19 +-
>   xen/arch/x86/hvm/vmx/vmx.c                  | 200 +++++++++++++++++++-
>   xen/arch/x86/mm/mem_sharing.c               |   3 +
>   xen/arch/x86/vm_event.c                     |   3 +
>   xen/common/compat/memory.c                  | 147 +++++++++++----
>   xen/common/domain.c                         |  81 ++++++++
>   xen/common/grant_table.c                    | 112 ++++++++----
>   xen/common/ioreq.c                          |   2 +-
>   xen/common/memory.c                         | 274 +++++++++++++++++++---------
>   xen/common/sysctl.c                         |   2 +
>   xen/include/asm-x86/cpufeature.h            |   1 +
>   xen/include/asm-x86/hvm/hvm.h               |  72 ++++++++
>   xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
>   xen/include/asm-x86/msr.h                   |  32 ++++
>   xen/include/public/arch-x86/cpufeatureset.h |   1 +
>   xen/include/public/domctl.h                 |  38 ++++
>   xen/include/public/memory.h                 |  18 +-
>   xen/include/public/sysctl.h                 |   3 +-
>   xen/include/public/vm_event.h               |   7 +
>   xen/include/xen/domain.h                    |   2 +
>   xen/include/xen/grant_table.h               |  21 ++-
>   xen/include/xen/ioreq.h                     |   2 +-
>   xen/include/xen/sched.h                     |   6 +
>   xen/xsm/flask/hooks.c                       |   1 +
>   45 files changed, 1366 insertions(+), 178 deletions(-)
>   create mode 100644 tools/libs/ctrl/xc_vmtrace.c
>   create mode 100644 tools/misc/xen-vmtrace.c
>
-- 
Regards,

Oleksandr Tyshchenko


