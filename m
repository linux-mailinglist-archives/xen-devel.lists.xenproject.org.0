Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D467D4D8B7A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 19:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290413.492505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTpB3-0001Mw-7D; Mon, 14 Mar 2022 18:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290413.492505; Mon, 14 Mar 2022 18:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTpB3-0001KT-46; Mon, 14 Mar 2022 18:12:17 +0000
Received: by outflank-mailman (input) for mailman id 290413;
 Mon, 14 Mar 2022 18:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OavK=TZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nTpB1-0001KM-MM
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 18:12:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4500d762-a3c2-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 19:12:13 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1647281529709100.52692257812805;
 Mon, 14 Mar 2022 11:12:09 -0700 (PDT)
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
X-Inumbo-ID: 4500d762-a3c2-11ec-853b-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; t=1647281530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L4hJLxPaAYjiLSt3Iyen65FwVa7iYIIefs0/8hjMPC+KYXfsThtg2tBnRs4KoMzF+Klfd3H4mZ7Pwm+AdE2zrc7fvTijJGnRvb2DsEmrk1W9lFXxKXwGvlsOjn0+zO2/4ThKnaYM2BggOKbpgBf7unYs6mIDv8NfiMNiuZi7S2Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1647281530; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SPQMz7Zv6+r0nf9UUfJhgeNkOosKuGtugZznTP1PR0g=; 
	b=jif2lTy9KsZtNHY+njgHgXAru/hm7sW5fvWWjuQtyfRo1weGu6f5mMsf9SLm40fepVKRfo31FiT+nzITYkbL+g2nF0UOuh86PKR9QUyeK0gFFSYZ9kQ1pC+yPz05JHbhCTMpWvw7Un8pApppWm1nqueLWX6T5iRcW+w7R/L+e40=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1647281530;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SPQMz7Zv6+r0nf9UUfJhgeNkOosKuGtugZznTP1PR0g=;
	b=DYpvj8TeE8tiSI8FM+QTMglH6jQW44C/OIJT3i/jA7Kv/9OyV76Va2rgaTjinmgz
	HOPhspQeNX1QF8wO+p4beLh/D6JsoI1VUYfTFPjn/i6kGiQLUsWVTcdS1Q56d9hAKTr
	n9oUU7TIzPA2Xa7X87BIH5O5pYLNKcDDmvkZyPik=
Message-ID: <33fdcbae-e083-ce1d-a5c8-d89e8ecbfddd@apertussolutions.com>
Date: Mon, 14 Mar 2022 13:25:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 11/11] xen/x86: remove cf_check attribute from
 hypercall handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-12-jgross@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220310073420.15622-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/10/22 02:34, Juergen Gross wrote:
> Now that the hypercall handlers are all being called directly instead
> through a function vector, the "cf_check" attribute can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - new patch
> ---
>  xen/arch/x86/compat.c               |  6 +++---
>  xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
>  xen/arch/x86/cpu/vpmu.c             |  2 +-
>  xen/arch/x86/domain.c               |  3 +--
>  xen/arch/x86/hvm/dm.c               |  2 +-
>  xen/arch/x86/hvm/hvm.c              |  2 +-
>  xen/arch/x86/hvm/hypercall.c        |  6 +++---
>  xen/arch/x86/mm.c                   | 12 ++++++------
>  xen/arch/x86/mm/paging.c            |  2 +-
>  xen/arch/x86/physdev.c              |  2 +-
>  xen/arch/x86/platform_hypercall.c   |  2 +-
>  xen/arch/x86/pv/callback.c          | 16 ++++++++--------
>  xen/arch/x86/pv/descriptor-tables.c |  8 ++++----
>  xen/arch/x86/pv/iret.c              |  4 ++--
>  xen/arch/x86/pv/misc-hypercalls.c   | 10 +++++-----
>  xen/arch/x86/pv/shim.c              |  4 ++--
>  xen/arch/x86/x86_64/compat/mm.c     |  2 +-
>  xen/common/argo.c                   |  4 ++--
>  xen/common/compat/grant_table.c     |  2 +-
>  xen/common/compat/kernel.c          |  2 +-
>  xen/common/compat/memory.c          |  3 +--
>  xen/common/dm.c                     |  2 +-
>  xen/common/domain.c                 |  2 +-
>  xen/common/domctl.c                 |  2 +-
>  xen/common/event_channel.c          |  2 +-
>  xen/common/grant_table.c            |  3 +--
>  xen/common/hypfs.c                  |  2 +-
>  xen/common/kernel.c                 |  2 +-
>  xen/common/kexec.c                  |  4 ++--
>  xen/common/memory.c                 |  2 +-
>  xen/common/multicall.c              |  3 +--
>  xen/common/sched/compat.c           |  2 +-
>  xen/common/sched/core.c             |  4 ++--
>  xen/common/sysctl.c                 |  2 +-
>  xen/common/xenoprof.c               |  2 +-
>  xen/drivers/char/console.c          |  2 +-
>  xen/scripts/gen_hypercall.awk       |  2 +-
>  xen/xsm/xsm_core.c                  |  4 ++--
>  38 files changed, 67 insertions(+), 71 deletions(-)
>

<snip/>

> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
> index 2286a502e3..eaa028109b 100644
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -219,13 +219,13 @@ bool __init has_xsm_magic(paddr_t start)
>  
>  #endif
>  
> -long cf_check do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>  {
>      return xsm_do_xsm_op(op);
>  }
>  
>  #ifdef CONFIG_COMPAT
> -int cf_check compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> +int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>  {
>      return xsm_do_compat_op(op);
>  }

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

