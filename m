Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41451A4875E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 19:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898350.1306916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tniJn-00048a-BK; Thu, 27 Feb 2025 18:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898350.1306916; Thu, 27 Feb 2025 18:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tniJn-00046E-8V; Thu, 27 Feb 2025 18:09:07 +0000
Received: by outflank-mailman (input) for mailman id 898350;
 Thu, 27 Feb 2025 18:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0Xv=VS=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tniJl-000468-Do
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 18:09:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec62ac5b-f535-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 19:09:03 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-JpuySVAMMzacOsFam_rvmQ-1; Thu, 27 Feb 2025 13:09:00 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f3bac2944so580254f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 10:09:00 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7d12sm2815690f8f.58.2025.02.27.10.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 10:08:58 -0800 (PST)
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
X-Inumbo-ID: ec62ac5b-f535-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740679741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqdnzIjR0oX24eIpfJlWao42wwxz6KJgRk8C8nAv0p0=;
	b=GBCZlmuqrRvW/BitpTbKGhTPZg920aXj7FoS0I6BY0oV3D5v2n2FBH+WAMdSIFsZ/keofW
	6c77GWv7XIIghuNaBITCHKpcArqdt/lZua4vAZapJ12RS/GkH3yHcC8kStBoyC+AYyVbYQ
	OSuNVTr4CklSv+QB+H6ntIlktSMN20I=
X-MC-Unique: JpuySVAMMzacOsFam_rvmQ-1
X-Mimecast-MFC-AGG-ID: JpuySVAMMzacOsFam_rvmQ_1740679739
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679739; x=1741284539;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqdnzIjR0oX24eIpfJlWao42wwxz6KJgRk8C8nAv0p0=;
        b=TRd+FsXnVzqP++zw0kbJnQeddKtHh0i4DqKjTLLZY36CKnUcL1ko6WSYij03ypyAFP
         l943mv3tchLXUv8dnRCud441cMjzaUVPYpC7uFb8lcka07gapCgVwIY4hv8lNQNC1hnS
         +v6r1Icw2pIQuabycGssltUJkL2wQUtYuu7nRl/QVvnKtxds5iH2uGLlbCfLkkauu4V1
         mZCugdM0bPtO8w63gPjh1M1JxIwNB7Ckjr+tRmc3kBsamF9Idzp4NwDMSdj2R1IPVw+L
         V4nzSDqsuOowPGNEKT8rx7ASPqCKdEM5FTUtl8T/yU3tXfzMD9o2szxX8OMqcWQABBWU
         dlRg==
X-Forwarded-Encrypted: i=1; AJvYcCX97siBIduHZR+HWbNuTfEJBSZECTe0tUT4pk8BgY4P2OphBNaVjpB56ly5pyiVW3hkNNT2rs+UxvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5zJ+1NbAyAWENMi0FDDnhuwASctI3tVzXpLyVnqSZPDpu9Bk0
	wuEoZEb7aW9QuEoOH5TxPotnADT+2hr46MKTYOGEDjohCoV/UymsF5lkApDjjdxk99QlJ9tpU6s
	BYk6soWAXpSzZsvl38N0w9kEpCiHVV5CGRZ/L7p3XI8PY4wygbsWj0t/MeJSThgGS
X-Gm-Gg: ASbGncvJwpDDXmdbmt8rP0CX8P1XV8x5Mvnq8AFnPOlQiNKf6wfk1xbTOiHmljhgqLg
	9NAiIuTROPPa0lgxcj1J2iWF+wqyvlaaDPTv6T8c6Xby5HghNjlVf6SgAY8d3+OZCf2x2F/ZFWr
	OEMiXg05v8eYp/BrsWt1HOUzUhb/3rWXonxvc5aCSxhiWg0tvFhMI5lvkfoROOPq4Gls5JQvg5s
	QinvAlP4RHVXT6GXrPbslxSE1/U3uc5XTpVuCjFDXWlM/lWy103N4wKhwMpz7L23U4xtwj/Ye2z
	DHf6TgENHO1L9fFsqFmmSE8rwW8TCJGJtiCAusD1IXxECiV9eJ77KwUlaW1/ZiUlxLLtJfXMZoD
	L
X-Received: by 2002:a05:6000:2cd:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-390ec7cdc8fmr192655f8f.14.1740679738924;
        Thu, 27 Feb 2025 10:08:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELTtvIroCPM+cKclSTstunMw/NXRJEd4YL271a2yNntKT36ErIWah+cBEzTYK3tA0K8Gj2Wg==
X-Received: by 2002:a05:6000:2cd:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-390ec7cdc8fmr192599f8f.14.1740679738521;
        Thu, 27 Feb 2025 10:08:58 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kees@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 samitolvanen@google.com, masahiroy@kernel.org, rppt@kernel.org,
 xur@google.com, paulmck@kernel.org, arnd@arndb.de, mark.rutland@arm.com,
 puranjay@kernel.org, broonie@kernel.org, mbenes@suse.cz,
 sudeep.holla@arm.com, guohanjun@huawei.com, prarit@redhat.com,
 liuwei09@cestc.cn, Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ptosi@google.com,
 thiago.bauermann@linaro.org, kevin.brodsky@arm.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH -next v6 8/8] arm64: entry: Switch to generic IRQ entry
In-Reply-To: <20250213130007.1418890-9-ruanjinjie@huawei.com>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
 <20250213130007.1418890-9-ruanjinjie@huawei.com>
Date: Thu, 27 Feb 2025 19:08:56 +0100
Message-ID: <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: usp0ZHD7mtvMSxRHLfUZYgwkUGKhB902fD9HfWMVPUg_1740679739
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 13/02/25 21:00, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*.
> The generic entry makes maintainers' work easier and codes
> more elegant.
>
> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> LOC and make Lazy preemption on arm64 available by adding a
> _TIF_NEED_RESCHED_LAZY bit and enabling ARCH_HAS_PREEMPT_LAZY.

Just a drive-by comment as I'm interested in lazy preemption for arm64;
this series doesn't actually enable lazy preemption, is that for a
follow-up with the rest of the generic entry stuff?

From a quick glance, it looks like everything is in place for enabling it.

> The next
> patch serise will switch to generic entry completely later. Switch to
> generic entry in two steps according to Mark's suggestion will make it
> easier to review.
>
> The changes are below:
>  - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>    irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>    and wrap with generic enter_from/exit_to_user_mode() because they
>    are exactly the same so far.
>
>  - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
>    because they're exactly the same, so the temporary arm64 version
>    irqentry_state can also be removed.
>
>  - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>    if arm64 implement arch_irqentry_exit_need_resched().


