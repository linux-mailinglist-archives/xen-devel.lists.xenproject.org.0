Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5475A302
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566243.884801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMH74-0004OS-Qy; Thu, 20 Jul 2023 00:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566243.884801; Thu, 20 Jul 2023 00:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMH74-0004M0-NW; Thu, 20 Jul 2023 00:01:46 +0000
Received: by outflank-mailman (input) for mailman id 566243;
 Thu, 20 Jul 2023 00:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMH72-0004Lu-Gl
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:01:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b0d7b3a-2690-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:01:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F173261884;
 Thu, 20 Jul 2023 00:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE02C43391;
 Thu, 20 Jul 2023 00:01:38 +0000 (UTC)
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
X-Inumbo-ID: 9b0d7b3a-2690-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689811300;
	bh=AjdGcmprCunfVF4lRNk5Ga7lLcKHXtvT8jajIM9AiUQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XyriQBlCBMIqYhuLlvgZ12LRt5Z7lptqkjHeK/jrRWLpCaOvcK715//T/XWRMYxbX
	 0cumyeioL4H1EM4Qgkad/E6EhixS/SgsYF8yHJj328I2YanjPluWMOwxXU7P6t+Cx6
	 O9b73waVqNZEz4c+Vuws4b/hKdEReQCIEiHn5PiFdjl7xSZ8xOK9NZFXZckN9Q1Zeb
	 xnstTw0DOTxT63gzWgM0DAhUwcvl6YW2FuQhFst7eB3tH6jRs4G9RXOEmu+zs8+eL5
	 IkC8E2mEa/OEf1ZNj0qo+gQ0rXGnjQ6wEPvZay9TdYkfT6CH/b9DbOgD+eD8PEMe4q
	 Qi25yy5IFXapQ==
Date: Wed, 19 Jul 2023 17:01:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH] x86: change parameter name of hvm_monitor_msr()
 declaration
In-Reply-To: <99289902f337b83f1ea034fa1eff5db5bdae6c46.1689686715.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307191701300.3118466@ubuntu-linux-20-04-desktop>
References: <99289902f337b83f1ea034fa1eff5db5bdae6c46.1689686715.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Jul 2023, Federico Serafini wrote:
> Change the parameter name of hvm_monitor_msr() declaration from
> 'value' to 'new_value' to match the corresponding defintion.
> This fixes a violation of MISRA C:2012 Rule 8.3 ("All declarations of
> an object or function shall use the same names and type qualifiers").
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/include/asm/hvm/monitor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
> index 5276b0af08..02021be47b 100644
> --- a/xen/arch/x86/include/asm/hvm/monitor.h
> +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> @@ -25,7 +25,7 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value,
>                      unsigned long old);
>  #define hvm_monitor_crX(cr, new, old) \
>                          hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
> -bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
> +bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value);
>  void hvm_monitor_descriptor_access(uint64_t exit_info,
>                                     uint64_t vmx_exit_qualification,
>                                     uint8_t descriptor, bool is_write);
> -- 
> 2.34.1
> 

