Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAD25D563
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:47:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8JO-0005Pa-MV; Fri, 04 Sep 2020 09:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE8JN-0005PT-IW
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:47:13 +0000
X-Inumbo-ID: bbb09dfc-379d-4064-b467-ee997296dcec
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbb09dfc-379d-4064-b467-ee997296dcec;
 Fri, 04 Sep 2020 09:47:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3C73ACAF;
 Fri,  4 Sep 2020 09:47:12 +0000 (UTC)
Subject: Re: [PATCH] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
To: Sergey Temerkhanov <s.temerkhanov@gmail.com>
References: <20200903232458.16551-1-s.temerkhanov@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98c44a05-00c8-948f-e3a9-e64d468dd36d@suse.com>
Date: Fri, 4 Sep 2020 11:47:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903232458.16551-1-s.temerkhanov@gmail.com>
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

On 04.09.2020 01:24, Sergey Temerkhanov wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1521,7 +1521,9 @@ void __init efi_init_memory(void)

Looking at the line numbers - is this patch against the master
or staging branch? I ask because about as far away from the line
number above as the chunk of cose you mean to change there's a
very similar conditional, which has caused some slight confusion
over here.

>          }
>  
>          if ( !efi_enabled(EFI_RS) ||
> -             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> +             ((!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> +                (desc->Type != EfiRuntimeServicesCode &&
> +                 desc->Type != EfiRuntimeServicesData)) &&
>                (!map_bs ||
>                 (desc->Type != EfiBootServicesCode &&
>                  desc->Type != EfiBootServicesData))) )

I'm in principle okay with a workaround like this, but I don't
think it should go silently. I'd therefore like to suggest you
add a new if() ahead of this one and then set
EFI_MEMORY_RUNTIME in affected descriptors (to keep things
consistent with other consumers of the memory map without
having to update every one of those checking for the flag)
alongside issuing a log message.

There's nevertheless another piece of code you need to adjust,
inside a CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP conditional in
efi_exit_boot(). But you shouldn't adjust the descriptor
there, yet - this should happen only after its logging in
efi_init_memory().

Additionally I'd like it to be at least considered to also
check that EFI_MEMORY_WB (or at the very least one of the
cachability flags) is set, so that we won't run into the
path further down complaining about a lack thereof in this
case.

Jan

