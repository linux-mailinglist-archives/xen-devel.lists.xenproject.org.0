Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600DC341CF8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 13:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99218.188502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEIm-0002AD-Bz; Fri, 19 Mar 2021 12:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99218.188502; Fri, 19 Mar 2021 12:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEIm-00029r-8X; Fri, 19 Mar 2021 12:32:28 +0000
Received: by outflank-mailman (input) for mailman id 99218;
 Fri, 19 Mar 2021 12:32:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AwH3=IR=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lNEIk-00029m-A2
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 12:32:26 +0000
Received: from MTA-05-3.privateemail.com (unknown [68.65.122.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c079862a-8a7f-4524-9710-e4b2d057ce5c;
 Fri, 19 Mar 2021 12:32:25 +0000 (UTC)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id E53A16004E
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 08:32:24 -0400 (EDT)
Received: from mail-wr1-f42.google.com (unknown [10.20.151.231])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id ADDB06004B
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 08:32:24 -0400 (EDT)
Received: by mail-wr1-f42.google.com with SMTP id v11so8929200wro.7
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 05:32:24 -0700 (PDT)
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
X-Inumbo-ID: c079862a-8a7f-4524-9710-e4b2d057ce5c
X-Gm-Message-State: AOAM530Ork8CC0ezEzAiRTQW5pt7YHrKLTBN5qwqc/vjUl3yDyE16Blx
	x64/7zbZf/eseWW2hAggRq5eSMuUsUM9+wfllAs=
X-Google-Smtp-Source: ABdhPJy5XovMdnvGxCcKOrT9r4BM8AiXk0Bgc8m4/fdv7LkLDY0XvbaWZXko+H6ISgWAdYeiB2bGNZZ4FKMRklgBjGs=
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr2044980wru.259.1616157143440;
 Fri, 19 Mar 2021 05:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
In-Reply-To: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Mar 2021 08:31:47 -0400
X-Gmail-Original-Message-ID: <CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
Message-ID: <CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Ian Jackson <iwj@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Mar 18, 2021 at 5:36 PM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>
> When creating a VM fork copy the parent VM's hostp2m max_mapped_pfn value. Some
> toolstack relies on the XENMEM_maximum_gpfn value to establish the maximum
> addressable physical memory in the VM and for forks that have not yet been
> unpaused that value is not going to reflect the correct max gpfn that's
> possible to populate into the p2m. This patch fixes the issue.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 00ada05c10..98b14f7b0a 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct domain *d)
>          return rc;
>
>      copy_tsc(cd, d);
> +    p2m_get_hostp2m(cd)->max_mapped_pfn = p2m_get_hostp2m(d)->max_mapped_pfn;
>
>      return rc;
>  }
> --
> 2.25.1
>

CC-ing Ian as 4.15 release manager. This patch is safe to include in
4.15 as it's a minor fix in a tech preview feature that's not even
compiled by default.

Thanks,
Tamas

