Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8154D80656E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648794.1012775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiGS-0002GA-NA; Wed, 06 Dec 2023 03:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648794.1012775; Wed, 06 Dec 2023 03:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiGS-0002Dh-Kc; Wed, 06 Dec 2023 03:07:56 +0000
Received: by outflank-mailman (input) for mailman id 648794;
 Wed, 06 Dec 2023 03:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiGR-0002DZ-VB
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:07:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a66079d1-93e4-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 04:07:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4FCD1B81AAA;
 Wed,  6 Dec 2023 03:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B40C433C8;
 Wed,  6 Dec 2023 03:07:52 +0000 (UTC)
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
X-Inumbo-ID: a66079d1-93e4-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832073;
	bh=7rOV011KRsIFY26FUYf83zHV/hj2wPCFeAxuLwswz0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EKkwQtBk90qR37NivEOcczIUDQNRx5hSZ9SuREJtK4Fzfrg6ov35Gtyr+pcaPh3a7
	 Bx3Ca4qnxvQ3mmK58tNnTRbh20baRpRv1CaHzOAaylQ9HyqkgTATdW1GI/iOeIHO5A
	 5pZRDCYoeNwYgGdnh/fcBUEeu0x7x/myvIsd3IMscgWmXxiF+HDkP8VALx1df2xeT6
	 KfCM73novYEB2fr7AfkUo9AQ87AIkaPNigt3ve5gmvibLwMNAgtEHptyU5aRYD1kjP
	 yys7HPCvg4WDdcusU2n/x/ZB8ikk/Dn0nAW5u5PvA18qIB99ua0xGEi2mKEGi9smnv
	 cxrWnQPw/zH3Q==
Date: Tue, 5 Dec 2023 19:07:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/6] xen/acpi: address remaining violations of MISRA
 C:2012 Rule 8.2
In-Reply-To: <6c0fa7c13641c53800c323285275fd58d9989326.1701764980.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312051905050.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701764980.git.federico.serafini@bugseng.com> <6c0fa7c13641c53800c323285275fd58d9989326.1701764980.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Federico Serafini wrote:
> Add missing parameter names to address violations of MISRA C:2012
> Rule 8.2. Furthermore, use C standard types to comply with XEN coding style.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/include/asm/acpi.h           |  2 +-
>  xen/include/acpi/apei.h                   |  5 +++--
>  xen/include/acpi/cpufreq/cpufreq.h        |  2 +-
>  xen/include/acpi/cpufreq/processor_perf.h | 16 ++++++++--------
>  4 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
> index 0df92d3714..d54c105f61 100644
> --- a/xen/arch/x86/include/asm/acpi.h
> +++ b/xen/arch/x86/include/asm/acpi.h
> @@ -81,7 +81,7 @@ extern bool acpi_lapic, acpi_ioapic, acpi_noirq;
>  extern bool acpi_force, acpi_ht, acpi_disabled;
>  extern u32 acpi_smi_cmd;
>  extern u8 acpi_enable_value, acpi_disable_value;
> -void acpi_pic_sci_set_trigger(unsigned int, u16);
> +void acpi_pic_sci_set_trigger(unsigned int irq, uint16_t trigger);

There is something strange about this one, I cannot find the definition
anywhere. Am I missing anything?

Everything else looks good


