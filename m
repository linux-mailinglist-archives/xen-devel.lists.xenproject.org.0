Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B987B7EDF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 14:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612524.952457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0nl-0008A3-Ix; Wed, 04 Oct 2023 12:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612524.952457; Wed, 04 Oct 2023 12:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0nl-00087W-F8; Wed, 04 Oct 2023 12:16:29 +0000
Received: by outflank-mailman (input) for mailman id 612524;
 Wed, 04 Oct 2023 12:16:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iV/w=FS=tls.msk.ru=mjt@srs-se1.protection.inumbo.net>)
 id 1qo0nk-00087Q-Ku
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 12:16:28 +0000
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6841613-62af-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 14:16:26 +0200 (CEST)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D610127871;
 Wed,  4 Oct 2023 15:16:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C7FD42CDCD;
 Wed,  4 Oct 2023 15:16:23 +0300 (MSK)
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
X-Inumbo-ID: d6841613-62af-11ee-9b0d-b553b5be7939
Message-ID: <47ea2a99-12c8-4a65-06d9-c67cf233ccf7@tls.msk.ru>
Date: Wed, 4 Oct 2023 15:16:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] sysemu/xen: Remove unreachable xen_ram_alloc() code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230905122142.5939-1-philmd@linaro.org>
 <20230905122142.5939-3-philmd@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230905122142.5939-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

05.09.2023 15:21, Philippe Mathieu-Daudé wrote:
> The xen_ram_alloc() call in softmmu/physmem.c is guarded
> by checking for xen_enabled(), which evaluate to 'false'
> when XEN is not built in. The compiler elide the function
> call, and thus the inlined function is not used. Remove it.

I still don't think it is a good way to just eliminate the
function (stub) in a hope compiler will elide the call.  It's
definitely not guaranteed by any standard, and compiler itself
can produce varying results (eg building with -O0 to make gdb
debugging easier).

static inline function costs nothing but keeps whole thing
manageable. IMHO anyway.

/mjt

> Inspired-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/xen.h | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> index 9b2d0b21ff..1f797a9abe 100644
> --- a/include/sysemu/xen.h
> +++ b/include/sysemu/xen.h
> @@ -27,8 +27,6 @@ extern bool xen_allowed;
>   #define xen_enabled()           (xen_allowed)
>   
>   void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> -void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> -                   struct MemoryRegion *mr, Error **errp);
>   
>   #else /* !CONFIG_XEN_IS_POSSIBLE */
>   
> @@ -38,12 +36,10 @@ static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>   {
>       /* nothing */
>   }
> -static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> -                                 MemoryRegion *mr, Error **errp)
> -{
> -    g_assert_not_reached();
> -}
>   
>   #endif /* CONFIG_XEN_IS_POSSIBLE */
>   
> +void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> +                   struct MemoryRegion *mr, Error **errp);
> +
>   #endif


