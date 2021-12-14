Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61AA4748D7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246946.425908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBFQ-0005KM-Ru; Tue, 14 Dec 2021 17:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246946.425908; Tue, 14 Dec 2021 17:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBFQ-0005Hn-P1; Tue, 14 Dec 2021 17:05:52 +0000
Received: by outflank-mailman (input) for mailman id 246946;
 Tue, 14 Dec 2021 17:05:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBFO-0005HZ-Ko
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:05:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBFN-0004bo-Cd; Tue, 14 Dec 2021 17:05:49 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBFN-0004ZE-5z; Tue, 14 Dec 2021 17:05:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=+lIwA4ZRTVSYc1f5arQHlKa8htLLoqiCznblSSNKg6Y=; b=ndlW8Xqi0trp/BGMJWe+aNZOPh
	JhJs7FWe6jKCBuiPkmVMiCKCdiEO5x2fjK3OovqeTN7OiteNCtnqYF6JeOb/j0XVwFbgGBiz7tWO7
	GZBCrq/zk1lNuichKUt7d23yB8e3QppAAZupcPXhqoObH2pOkT5sALHDgwMsLFX7jTlg=;
Message-ID: <bcca6950-666f-63ea-9ea2-49f70d8a252a@xen.org>
Date: Tue, 14 Dec 2021 17:05:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 14/47] build: rename __LINKER__ to LINKER_SCRIPT
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-15-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-15-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/11/2021 13:39, Anthony PERARD wrote:
> For two reasons: this macro is used to generate a "linker script" and
> is not by the linker, and name starting with an underscore '_' are
> supposed to be reserved, so better avoid them when not needed.

If that's the case, then shouldn't we also rename __ASSEMBLY__?

> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/Rules.mk                      | 2 +-
>   xen/arch/arm/include/asm/config.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 4624739ca7e2..d32fec0ae037 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -256,7 +256,7 @@ $(obj)/%.s: $(src)/%.S FORCE
>   
>   # Linker scripts, .lds.S -> .lds
>   quiet_cmd_cpp_lds_S = LDS     $@
> -cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
> +cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<
>   
>   targets := $(filter-out $(PHONY), $(targets))
>   
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index c7b77912013e..2aced0bc3b8b 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -191,7 +191,7 @@ extern unsigned long frametable_virt_end;
>   #define watchdog_disable() ((void)0)
>   #define watchdog_enable()  ((void)0)
>   
> -#if defined(__ASSEMBLY__) && !defined(__LINKER__)
> +#if defined(__ASSEMBLY__) && !defined(LINKER_SCRIPT)
>   #include <asm/asm_defns.h>
>   #include <asm/macros.h>
>   #endif

-- 
Julien Grall

