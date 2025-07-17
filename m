Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D9B081A9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 02:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045985.1416227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucCoU-000604-0u; Thu, 17 Jul 2025 00:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045985.1416227; Thu, 17 Jul 2025 00:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucCoT-0005y9-UQ; Thu, 17 Jul 2025 00:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1045985;
 Thu, 17 Jul 2025 00:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucCoT-0005y3-BQ
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 00:49:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3ae4f7e-62a7-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 02:49:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 063165C5622;
 Thu, 17 Jul 2025 00:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8056EC4CEE7;
 Thu, 17 Jul 2025 00:49:23 +0000 (UTC)
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
X-Inumbo-ID: e3ae4f7e-62a7-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752713365;
	bh=1zat0F1s/18Hl6/2ocHtQ1upOvrSzchh54HCKQD1zsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YQYt3CjoWNF2bDAB44JG5w2JJflDqqQz74m572lHFomyUTVpDmTlrUeL+MWRaX1H8
	 GsaRykzAiCXYLodeAK/Y9DOy4kQg6jRYq0zLZVjsuKv9PFCCaDBnuFL9RaLloL2pT4
	 rqKLHFRH8p8OKLb1L1gbdpnfAWFpD6noelYK0i6/ciViVXEVwFERdj5finzMDpIwJ7
	 BzfM/RuuVYps9E717LmpZZbg4zWklYG7LS7JA5n2PVj9deMQe73gUDZMESo5FURONO
	 bbr97v7aVRzUe9NIgXrZPpALddz4opx7GVFOYQVI40wKvAJ4pyH20sQKair4vMk5/Z
	 g9CigBDtFZzdQ==
Date: Wed, 16 Jul 2025 17:49:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ard Biesheuvel <ardb+git@google.com>
cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
    Feng Tang <feng.tang@linux.alibaba.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Sunil V L <sunilvl@ventanamicro.com>, Bibo Mao <maobibo@loongson.cn>, 
    linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
    xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] efi: Remove support for pointless, unused EFI
 services
In-Reply-To: <20250714060843.4029171-8-ardb+git@google.com>
Message-ID: <alpine.DEB.2.22.394.2507161749090.15546@ubuntu-linux-20-04-desktop>
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-8-ardb+git@google.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Jul 2025, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The get/set wakeup time EFI runtime services are often broken, and
> rarely if ever used in practice. But the GetNextHighMonoCount() EFI
> runtime services really takes the cake for most pointless API in the
> history of computing.
> 
> So let's stop exposing them in Linux, hopefully removing the urge some
> folks seem to feel to test these APIs, and send emails around when they
> don't work.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

For drivers/xen/efi.c:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/x86/platform/efi/efi_64.c          | 22 -------
>  drivers/firmware/efi/runtime-wrappers.c | 68 --------------------
>  drivers/xen/efi.c                       | 56 ----------------
>  include/linux/efi.h                     |  6 --
>  4 files changed, 152 deletions(-)
> 
> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
> index e7e8f77f77f8..0207937ab39d 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -540,19 +540,6 @@ static efi_status_t efi_thunk_set_time(efi_time_t *tm)
>  	return EFI_UNSUPPORTED;
>  }
>  
> -static efi_status_t
> -efi_thunk_get_wakeup_time(efi_bool_t *enabled, efi_bool_t *pending,
> -			  efi_time_t *tm)
> -{
> -	return EFI_UNSUPPORTED;
> -}
> -
> -static efi_status_t
> -efi_thunk_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
> -{
> -	return EFI_UNSUPPORTED;
> -}
> -
>  static unsigned long efi_name_size(efi_char16_t *name)
>  {
>  	return ucs2_strsize(name, EFI_VAR_NAME_LEN) + 1;
> @@ -681,12 +668,6 @@ efi_thunk_get_next_variable(unsigned long *name_size,
>  	return status;
>  }
>  
> -static efi_status_t
> -efi_thunk_get_next_high_mono_count(u32 *count)
> -{
> -	return EFI_UNSUPPORTED;
> -}
> -
>  static void
>  efi_thunk_reset_system(int reset_type, efi_status_t status,
>  		       unsigned long data_size, efi_char16_t *data)
> @@ -788,13 +769,10 @@ void __init efi_thunk_runtime_setup(void)
>  
>  	efi.get_time = efi_thunk_get_time;
>  	efi.set_time = efi_thunk_set_time;
> -	efi.get_wakeup_time = efi_thunk_get_wakeup_time;
> -	efi.set_wakeup_time = efi_thunk_set_wakeup_time;
>  	efi.get_variable = efi_thunk_get_variable;
>  	efi.get_next_variable = efi_thunk_get_next_variable;
>  	efi.set_variable = efi_thunk_set_variable;
>  	efi.set_variable_nonblocking = efi_thunk_set_variable_nonblocking;
> -	efi.get_next_high_mono_count = efi_thunk_get_next_high_mono_count;
>  	efi.reset_system = efi_thunk_reset_system;
>  	efi.query_variable_info = efi_thunk_query_variable_info;
>  	efi.query_variable_info_nonblocking = efi_thunk_query_variable_info_nonblocking;
> diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
> index 708b777857d3..2b66efb5ffef 100644
> --- a/drivers/firmware/efi/runtime-wrappers.c
> +++ b/drivers/firmware/efi/runtime-wrappers.c
> @@ -52,17 +52,6 @@ union efi_rts_args {
>  		efi_time_t	*time;
>  	} SET_TIME;
>  
> -	struct {
> -		efi_bool_t	*enabled;
> -		efi_bool_t	*pending;
> -		efi_time_t	*time;
> -	} GET_WAKEUP_TIME;
> -
> -	struct {
> -		efi_bool_t	enable;
> -		efi_time_t	*time;
> -	} SET_WAKEUP_TIME;
> -
>  	struct {
>  		efi_char16_t	*name;
>  		efi_guid_t	*vendor;
> @@ -92,10 +81,6 @@ union efi_rts_args {
>  		u64		*max_variable_size;
>  	} QUERY_VARIABLE_INFO;
>  
> -	struct {
> -		u32		*high_count;
> -	} GET_NEXT_HIGH_MONO_COUNT;
> -
>  	struct {
>  		efi_capsule_header_t **capsules;
>  		unsigned long	count;
> @@ -232,17 +217,6 @@ static void __nocfi efi_call_rts(struct work_struct *work)
>  		status = efi_call_virt(set_time,
>  				       args->SET_TIME.time);
>  		break;
> -	case EFI_GET_WAKEUP_TIME:
> -		status = efi_call_virt(get_wakeup_time,
> -				       args->GET_WAKEUP_TIME.enabled,
> -				       args->GET_WAKEUP_TIME.pending,
> -				       args->GET_WAKEUP_TIME.time);
> -		break;
> -	case EFI_SET_WAKEUP_TIME:
> -		status = efi_call_virt(set_wakeup_time,
> -				       args->SET_WAKEUP_TIME.enable,
> -				       args->SET_WAKEUP_TIME.time);
> -		break;
>  	case EFI_GET_VARIABLE:
>  		status = efi_call_virt(get_variable,
>  				       args->GET_VARIABLE.name,
> @@ -272,10 +246,6 @@ static void __nocfi efi_call_rts(struct work_struct *work)
>  				       args->QUERY_VARIABLE_INFO.remaining_space,
>  				       args->QUERY_VARIABLE_INFO.max_variable_size);
>  		break;
> -	case EFI_GET_NEXT_HIGH_MONO_COUNT:
> -		status = efi_call_virt(get_next_high_mono_count,
> -				       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
> -		break;
>  	case EFI_UPDATE_CAPSULE:
>  		status = efi_call_virt(update_capsule,
>  				       args->UPDATE_CAPSULE.capsules,
> @@ -366,30 +336,6 @@ static efi_status_t virt_efi_set_time(efi_time_t *tm)
>  	return status;
>  }
>  
> -static efi_status_t virt_efi_get_wakeup_time(efi_bool_t *enabled,
> -					     efi_bool_t *pending,
> -					     efi_time_t *tm)
> -{
> -	efi_status_t status;
> -
> -	if (down_interruptible(&efi_runtime_lock))
> -		return EFI_ABORTED;
> -	status = efi_queue_work(GET_WAKEUP_TIME, enabled, pending, tm);
> -	up(&efi_runtime_lock);
> -	return status;
> -}
> -
> -static efi_status_t virt_efi_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
> -{
> -	efi_status_t status;
> -
> -	if (down_interruptible(&efi_runtime_lock))
> -		return EFI_ABORTED;
> -	status = efi_queue_work(SET_WAKEUP_TIME, enabled, tm);
> -	up(&efi_runtime_lock);
> -	return status;
> -}
> -
>  static efi_status_t virt_efi_get_variable(efi_char16_t *name,
>  					  efi_guid_t *vendor,
>  					  u32 *attr,
> @@ -488,17 +434,6 @@ virt_efi_query_variable_info_nb(u32 attr, u64 *storage_space,
>  	return status;
>  }
>  
> -static efi_status_t virt_efi_get_next_high_mono_count(u32 *count)
> -{
> -	efi_status_t status;
> -
> -	if (down_interruptible(&efi_runtime_lock))
> -		return EFI_ABORTED;
> -	status = efi_queue_work(GET_NEXT_HIGH_MONO_COUNT, count);
> -	up(&efi_runtime_lock);
> -	return status;
> -}
> -
>  static void __nocfi
>  virt_efi_reset_system(int reset_type, efi_status_t status,
>  		      unsigned long data_size, efi_char16_t *data)
> @@ -556,13 +491,10 @@ void __init efi_native_runtime_setup(void)
>  {
>  	efi.get_time			    = virt_efi_get_time;
>  	efi.set_time			    = virt_efi_set_time;
> -	efi.get_wakeup_time		    = virt_efi_get_wakeup_time;
> -	efi.set_wakeup_time		    = virt_efi_set_wakeup_time;
>  	efi.get_variable		    = virt_efi_get_variable;
>  	efi.get_next_variable		    = virt_efi_get_next_variable;
>  	efi.set_variable		    = virt_efi_set_variable;
>  	efi.set_variable_nonblocking	    = virt_efi_set_variable_nb;
> -	efi.get_next_high_mono_count	    = virt_efi_get_next_high_mono_count;
>  	efi.reset_system 		    = virt_efi_reset_system;
>  	efi.query_variable_info		    = virt_efi_query_variable_info;
>  	efi.query_variable_info_nonblocking = virt_efi_query_variable_info_nb;
> diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> index fb321cd6415a..baccf2d90af0 100644
> --- a/drivers/xen/efi.c
> +++ b/drivers/xen/efi.c
> @@ -76,47 +76,6 @@ static efi_status_t xen_efi_set_time(efi_time_t *tm)
>  	return efi_data(op).status;
>  }
>  
> -static efi_status_t xen_efi_get_wakeup_time(efi_bool_t *enabled,
> -					    efi_bool_t *pending,
> -					    efi_time_t *tm)
> -{
> -	struct xen_platform_op op = INIT_EFI_OP(get_wakeup_time);
> -
> -	if (HYPERVISOR_platform_op(&op) < 0)
> -		return EFI_UNSUPPORTED;
> -
> -	if (tm) {
> -		BUILD_BUG_ON(sizeof(*tm) != sizeof(efi_data(op).u.get_wakeup_time));
> -		memcpy(tm, &efi_data(op).u.get_wakeup_time, sizeof(*tm));
> -	}
> -
> -	if (enabled)
> -		*enabled = !!(efi_data(op).misc & XEN_EFI_GET_WAKEUP_TIME_ENABLED);
> -
> -	if (pending)
> -		*pending = !!(efi_data(op).misc & XEN_EFI_GET_WAKEUP_TIME_PENDING);
> -
> -	return efi_data(op).status;
> -}
> -
> -static efi_status_t xen_efi_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
> -{
> -	struct xen_platform_op op = INIT_EFI_OP(set_wakeup_time);
> -
> -	BUILD_BUG_ON(sizeof(*tm) != sizeof(efi_data(op).u.set_wakeup_time));
> -	if (enabled)
> -		efi_data(op).misc = XEN_EFI_SET_WAKEUP_TIME_ENABLE;
> -	if (tm)
> -		memcpy(&efi_data(op).u.set_wakeup_time, tm, sizeof(*tm));
> -	else
> -		efi_data(op).misc |= XEN_EFI_SET_WAKEUP_TIME_ENABLE_ONLY;
> -
> -	if (HYPERVISOR_platform_op(&op) < 0)
> -		return EFI_UNSUPPORTED;
> -
> -	return efi_data(op).status;
> -}
> -
>  static efi_status_t xen_efi_get_variable(efi_char16_t *name, efi_guid_t *vendor,
>  					 u32 *attr, unsigned long *data_size,
>  					 void *data)
> @@ -204,18 +163,6 @@ static efi_status_t xen_efi_query_variable_info(u32 attr, u64 *storage_space,
>  	return efi_data(op).status;
>  }
>  
> -static efi_status_t xen_efi_get_next_high_mono_count(u32 *count)
> -{
> -	struct xen_platform_op op = INIT_EFI_OP(get_next_high_monotonic_count);
> -
> -	if (HYPERVISOR_platform_op(&op) < 0)
> -		return EFI_UNSUPPORTED;
> -
> -	*count = efi_data(op).misc;
> -
> -	return efi_data(op).status;
> -}
> -
>  static efi_status_t xen_efi_update_capsule(efi_capsule_header_t **capsules,
>  				unsigned long count, unsigned long sg_list)
>  {
> @@ -280,8 +227,6 @@ void __init xen_efi_runtime_setup(void)
>  {
>  	efi.get_time			= xen_efi_get_time;
>  	efi.set_time			= xen_efi_set_time;
> -	efi.get_wakeup_time		= xen_efi_get_wakeup_time;
> -	efi.set_wakeup_time		= xen_efi_set_wakeup_time;
>  	efi.get_variable		= xen_efi_get_variable;
>  	efi.get_next_variable		= xen_efi_get_next_variable;
>  	efi.set_variable		= xen_efi_set_variable;
> @@ -290,7 +235,6 @@ void __init xen_efi_runtime_setup(void)
>  	efi.query_variable_info_nonblocking = xen_efi_query_variable_info;
>  	efi.update_capsule		= xen_efi_update_capsule;
>  	efi.query_capsule_caps		= xen_efi_query_capsule_caps;
> -	efi.get_next_high_mono_count	= xen_efi_get_next_high_mono_count;
>  	efi.reset_system		= xen_efi_reset_system;
>  }
>  
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index 50db7df0efab..516afdc8a49d 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -650,8 +650,6 @@ extern struct efi {
>  
>  	efi_get_time_t			*get_time;
>  	efi_set_time_t			*set_time;
> -	efi_get_wakeup_time_t		*get_wakeup_time;
> -	efi_set_wakeup_time_t		*set_wakeup_time;
>  	efi_get_variable_t		*get_variable;
>  	efi_get_next_variable_t		*get_next_variable;
>  	efi_set_variable_t		*set_variable;
> @@ -660,7 +658,6 @@ extern struct efi {
>  	efi_query_variable_info_t	*query_variable_info_nonblocking;
>  	efi_update_capsule_t		*update_capsule;
>  	efi_query_capsule_caps_t	*query_capsule_caps;
> -	efi_get_next_high_mono_count_t	*get_next_high_mono_count;
>  	efi_reset_system_t		*reset_system;
>  
>  	struct efi_memory_map		memmap;
> @@ -1235,13 +1232,10 @@ enum efi_rts_ids {
>  	EFI_NONE,
>  	EFI_GET_TIME,
>  	EFI_SET_TIME,
> -	EFI_GET_WAKEUP_TIME,
> -	EFI_SET_WAKEUP_TIME,
>  	EFI_GET_VARIABLE,
>  	EFI_GET_NEXT_VARIABLE,
>  	EFI_SET_VARIABLE,
>  	EFI_QUERY_VARIABLE_INFO,
> -	EFI_GET_NEXT_HIGH_MONO_COUNT,
>  	EFI_RESET_SYSTEM,
>  	EFI_UPDATE_CAPSULE,
>  	EFI_QUERY_CAPSULE_CAPS,
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

