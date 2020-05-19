Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E11D9216
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:34:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxhd-000555-SO; Tue, 19 May 2020 08:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jaxhc-000550-Q9
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:34:20 +0000
X-Inumbo-ID: 8868d7c4-99ab-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8868d7c4-99ab-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 08:34:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4F1EABE6;
 Tue, 19 May 2020 08:34:21 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
Date: Tue, 19 May 2020 10:34:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518153820.18170-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.2020 17:38, Andrew Cooper wrote:
> @@ -1439,6 +1418,18 @@ void do_page_fault(struct cpu_user_regs *regs)
>      if ( unlikely(fixup_page_fault(addr, regs) != 0) )
>          return;
>  
> +    /*
> +     * Xen have reserved bits in its pagetables, nor do we permit PV guests to
> +     * write any.  Such entries would be vulnerable to the L1TF sidechannel.
> +     *
> +     * The only logic which intentionally sets reserved bits is the shadow
> +     * MMIO fastpath (SH_L1E_MMIO_*), which is careful not to be
> +     * L1TF-vulnerable, and handled via the VMExit #PF intercept path, rather
> +     * than here.

What about SH_L1E_MAGIC and sh_l1e_gnp()? The latter gets used by
_sh_propagate() without visible restriction to HVM.

And of course every time I look at this code I wonder how we can
get away with (quoting a comment) "We store 28 bits of GFN in
bits 4:32 of the entry." Do we have a hidden restriction
somewhere guaranteeing that guests won't have (emulated MMIO)
GFNs above 1Tb when run in shadow mode?

Jan

