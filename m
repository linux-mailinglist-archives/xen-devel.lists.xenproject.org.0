Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B7268D31
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 16:17:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHpIG-0002iW-WA; Mon, 14 Sep 2020 14:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHpIE-0002iR-Vl
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:17:19 +0000
X-Inumbo-ID: b84e0026-90f8-4856-b39c-29f4dc3737e3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b84e0026-90f8-4856-b39c-29f4dc3737e3;
 Mon, 14 Sep 2020 14:17:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DCE4AE17;
 Mon, 14 Sep 2020 14:17:32 +0000 (UTC)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
Date: Mon, 14 Sep 2020 16:17:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
> ---
>  MAINTAINERS                     |    8 +-
>  xen/arch/x86/Kconfig            |    1 +
>  xen/arch/x86/hvm/dm.c           |    2 +-
>  xen/arch/x86/hvm/emulate.c      |    2 +-
>  xen/arch/x86/hvm/hvm.c          |    2 +-
>  xen/arch/x86/hvm/io.c           |    2 +-
>  xen/arch/x86/hvm/ioreq.c        | 1425 +--------------------------------------
>  xen/arch/x86/hvm/stdvga.c       |    2 +-
>  xen/arch/x86/hvm/vmx/vvmx.c     |    3 +-
>  xen/arch/x86/mm.c               |    2 +-
>  xen/arch/x86/mm/shadow/common.c |    2 +-
>  xen/common/Kconfig              |    3 +
>  xen/common/Makefile             |    1 +
>  xen/common/ioreq.c              | 1410 ++++++++++++++++++++++++++++++++++++++

This suggests it was almost the entire file which got moved. It would
be really nice if you could convince git to show the diff here, rather
than removal and addition of 1400 lines.

Additionally I wonder whether what's left in the original file wouldn't
better become inline functions now. If this was done in the previous
patch, the change would be truly a rename then, I think.

> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -19,41 +19,12 @@
>  #ifndef __ASM_X86_HVM_IOREQ_H__
>  #define __ASM_X86_HVM_IOREQ_H__
>  
> -bool hvm_io_pending(struct vcpu *v);
> -bool handle_hvm_io_completion(struct vcpu *v);
> -bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
> +#include <asm/hvm/emulate.h>
> +#include <asm/hvm/hvm.h>
> +#include <asm/hvm/vmx/vmx.h>

Are all three really needed here? Especially the last one strikes me as
odd.

> --- /dev/null
> +++ b/xen/include/xen/ioreq.h
> @@ -0,0 +1,82 @@
> +/*
> + * ioreq.h: Hardware virtual machine assist interface definitions.
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
> +#ifndef __IOREQ_H__
> +#define __IOREQ_H__

__XEN_IOREQ_H__ please.

> +#include <xen/sched.h>
> +
> +#include <asm/hvm/ioreq.h>

Is this include really needed here (i.e. by the code further down in
the file, and hence by everyone including this header), or rather
just in a few specific .c files?

> +#define GET_IOREQ_SERVER(d, id) \
> +    (d)->arch.hvm.ioreq_server.server[id]

arch.hvm.* feels like a layering violation when used in this header.

Jan

