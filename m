Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0E74BFCA
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jul 2023 00:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560768.876916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIGJc-00053f-Cn; Sat, 08 Jul 2023 22:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560768.876916; Sat, 08 Jul 2023 22:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIGJc-00051D-9l; Sat, 08 Jul 2023 22:22:08 +0000
Received: by outflank-mailman (input) for mailman id 560768;
 Sat, 08 Jul 2023 22:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIGJa-000517-EA
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 22:22:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd55a512-1ddd-11ee-8611-37d641c3527e;
 Sun, 09 Jul 2023 00:22:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBE5860010;
 Sat,  8 Jul 2023 22:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A55C433C7;
 Sat,  8 Jul 2023 22:22:00 +0000 (UTC)
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
X-Inumbo-ID: dd55a512-1ddd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688854922;
	bh=mpcSDCe7cA9qf5IpRPz5wsMn/rrfPc44mPMZsAQO1ng=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h018IwqD05IFmoYgr7UGrEG6MJSDHhTT8KxTQracoNzewQ/WUdatkmcpwBZvJytEw
	 0mUrKt3rZu8kY/UmKVIk6Q9sxkuPzMEmtBUt48jyN9Pect+Jp0wSf4iygefYEm4IaX
	 StOqsb7enbDnIK9Bj8Q8c3VXn/7oCqmUS3LfW7qDAbbkGRIa+sbNNXdPviQXe1BJHr
	 RbFaGC/5hNS9G336YA5E/sz6v2O6aizQpPp++gwRXWhHin2gbCU3PesauokBcN1wsA
	 VRkMcFhDF969Uchu4rErZdfwbAt/x9d6Z/9ucgoXklV65CTLqSi79kFnTkwKzIROzu
	 7jV5e7B/CPQiw==
Date: Sat, 8 Jul 2023 15:21:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 09/10] arm setup: use common integer-typed bootmod
 definition
In-Reply-To: <20230701071835.41599-10-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081519090.761183@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-10-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jul 2023, Christopher Clark wrote:
> This change enables inclusion of <xen/bootinfo.h> in Arm builds,
> required for subsequent patches in this series.
> 
> It replaces the enum definition of bootmodule_kind with bootmod_type_t
> as enums are not fixed size as needed for packed structs which are
> needed for boot structures in subsequent changes.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> ---
> New for v2 series.
> 
>  xen/arch/arm/include/asm/setup.h | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 19dc637d55..7e0598217a 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -3,6 +3,7 @@
>  
>  #include <public/version.h>
>  #include <asm/p2m.h>
> +#include <xen/bootinfo.h>

I see this as very positive, but then I do think we should use a single
definition of struct bootmodule, struct bootinfo and struct bootcmdline.

I don't think it is a good idea to have struct bootinfo here and struct
boot_info in xen/include/xen/bootinfo.h with a similar definition and
purpose.

I think we should have a single definition of struct bootinfo and struct
bootmodule that works everywhere.


>  #include <xen/device_tree.h>
>  
>  #define MIN_FDT_ALIGN 8
> @@ -12,15 +13,7 @@
>  
>  #define MAX_MODULES 32 /* Current maximum useful modules */
>  
> -typedef enum {
> -    BOOTMOD_XEN,
> -    BOOTMOD_FDT,
> -    BOOTMOD_KERNEL,
> -    BOOTMOD_RAMDISK,
> -    BOOTMOD_XSM,
> -    BOOTMOD_GUEST_DTB,
> -    BOOTMOD_UNKNOWN
> -}  bootmodule_kind;
> +typedef bootmod_type_t bootmodule_kind;

Why can't we use an enum for it?

