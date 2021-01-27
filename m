Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9995306165
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76282.137583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4o98-0003qS-49; Wed, 27 Jan 2021 16:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76282.137583; Wed, 27 Jan 2021 16:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4o98-0003q3-0I; Wed, 27 Jan 2021 16:58:22 +0000
Received: by outflank-mailman (input) for mailman id 76282;
 Wed, 27 Jan 2021 16:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4o96-0003ps-Dt
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:58:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db90707b-ddb6-4a01-8c43-f225a5fbf2de;
 Wed, 27 Jan 2021 16:58:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E94DCAD78;
 Wed, 27 Jan 2021 16:58:17 +0000 (UTC)
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
X-Inumbo-ID: db90707b-ddb6-4a01-8c43-f225a5fbf2de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611766698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEXjWz6vfq5GOT+mIcBFWrWCrx2K+MMFpii9D+Tes3Y=;
	b=e+FvEbnGgVvZvYKarKnErEFrOUUP3yYTZyQ6FLyT8hhmlWap7P12xAhfcxdmV1t7KcSRaX
	fScHbAbaK4WTzwuq8Vb7b11+o7w9KB5IWv/eeg5bv16Vo1etIEEn29e/KFURxdTcA0jB6j
	PJNMr83M72lXKtPdk1ieJFtAgX2oQXc=
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01b122dd-37c9-d429-b060-adea9e7cae8b@suse.com>
Date: Wed, 27 Jan 2021 17:58:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves previously prepared IOREQ support to the common code
> (the code movement is verbatim copy).
> 
> The "legacy" mechanism of mapping magic pages for the IOREQ servers
> remains x86 specific and not exposed to the common code.
> 
> The common IOREQ feature is supposed to be built with IOREQ_SERVER
> option enabled, which is selected for x86's config HVM for now.
> 
> In order to avoid having a gigantic patch here, the subsequent
> patches will update remaining bits in the common code step by step:
> - Make IOREQ related structs/materials common
> - Drop the "hvm" prefixes and infixes
> - Remove layering violation by moving corresponding fields
>   out of *arch.hvm* or abstracting away accesses to them
> 
> Introduce asm/ioreq.h wrapper to be included by common ioreq.h
> instead of asm/hvm/ioreq.h to avoid HVM-ism in the code common.
> 
> Also include <xen/domain_page.h> which will be needed on Arm
> to avoid touch the common code again when introducing Arm specific bits.
> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -92,6 +92,7 @@ config PV_LINEAR_PT
>  
>  config HVM
>  	def_bool !PV_SHIM_EXCLUSIVE
> +	select IOREQ_SERVER
>  	prompt "HVM support"
>  	---help---

... the addition moved below the prompt line (could probably
be taken care of while committing, if no other need for a v6
arises).

(Personally I think this should be

config HVM
	bool "HVM support"
	default !PV_SHIM_EXCLUSIVE
	select IOREQ_SERVER
	---help---

anyway, but that's nothing you need to care about.)

> --- /dev/null
> +++ b/xen/include/asm-x86/ioreq.h
> @@ -0,0 +1,37 @@
> +/*
> + * ioreq.h: Hardware virtual machine assist interface definitions.
> + *
> + * This is a wrapper which purpose is to not include arch HVM specific header
> + * from the common code.
> + *
> + * Copyright (c) 2016 Citrix Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ASM_X86_IOREQ_H__
> +#define __ASM_X86_IOREQ_H__
> +
> +#include <asm/hvm/ioreq.h>
> +
> +#endif /* __ASM_X86_IOREQ_H__ */

Not necessarily for taking care of right away, I think in the
longer run this wants wrapping by #ifdef CONFIG_HVM, such that
in !HVM builds the dependency on the "chained" header goes
away (reducing the amount of rebuilding in incremental builds).

Jan

