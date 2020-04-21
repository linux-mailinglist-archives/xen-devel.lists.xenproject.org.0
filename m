Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E791B1FF1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 09:36:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQnRC-0007jj-3d; Tue, 21 Apr 2020 07:35:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQnRA-0007je-7W
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 07:35:20 +0000
X-Inumbo-ID: a6429bf0-83a2-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6429bf0-83a2-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 07:35:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47F39AF77;
 Tue, 21 Apr 2020 07:35:17 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/boot: Don't enable EFER.SCE for !CONFIG_PV builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ded0aab-dcab-bc46-92f3-d76ac8606889@suse.com>
Date: Tue, 21 Apr 2020 09:35:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420145911.5708-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 16:59, Andrew Cooper wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -238,7 +238,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
>      /* Set system registers and transfer control. */
>      asm volatile("pushq $0\n\tpopfq");
>      rdmsrl(MSR_EFER, efer);
> -    efer |= EFER_SCE;
> +    if ( IS_ENABLED(CONFIG_PV) )
> +        efer |= EFER_SCE;
>      if ( cpu_has_nx )
>          efer |= EFER_NX;
>      wrmsrl(MSR_EFER, efer);

Switch to simply ORing in trampoline_efer here?

With or without the adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

