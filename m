Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA1028CF04
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6198.16434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKAQ-00026u-LD; Tue, 13 Oct 2020 13:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6198.16434; Tue, 13 Oct 2020 13:16:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKAQ-00026V-Hl; Tue, 13 Oct 2020 13:16:38 +0000
Received: by outflank-mailman (input) for mailman id 6198;
 Tue, 13 Oct 2020 13:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKAO-00026Q-To
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:16:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7ee63c6-e8f7-4641-a2e5-e83b67212d44;
 Tue, 13 Oct 2020 13:16:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B950AD19;
 Tue, 13 Oct 2020 13:16:35 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKAO-00026Q-To
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:16:36 +0000
X-Inumbo-ID: a7ee63c6-e8f7-4641-a2e5-e83b67212d44
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7ee63c6-e8f7-4641-a2e5-e83b67212d44;
	Tue, 13 Oct 2020 13:16:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602594995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UozvqUOvBWy6B7uQ9v6fP5TAufYZa+M1hEtWF8NtCtk=;
	b=sSIbHzSOGXzDdXMT1NuJ5hxh5NslRzBHYN+UNqoSTEsada56pJo2+qKGKEaaEyPDJh0PFE
	ttXRWgYTF/8AXKwlgpPKyaVuTypARPP0LcIgFkiBGOp+Ev7ZyPb1/C1X2tAeMJ+hTaUJLP
	nqQ2S2SYJLbCxNBoo0hGoDx93Y45Xfc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1B950AD19;
	Tue, 13 Oct 2020 13:16:35 +0000 (UTC)
Subject: Re: [PATCH] x86/smpboot: Unconditionally call
 memguard_unguard_stack() in cpu_smpboot_free()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201005122325.17395-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36d3443d-50dd-5163-ddac-973421f390e0@suse.com>
Date: Tue, 13 Oct 2020 15:16:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201005122325.17395-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.10.2020 14:23, Andrew Cooper wrote:
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -971,16 +971,16 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>      if ( IS_ENABLED(CONFIG_PV32) )
>          FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
>  
> +    if ( stack_base[cpu] )
> +        memguard_unguard_stack(stack_base[cpu]);
> +
>      if ( remove )
>      {
>          FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>          FREE_XENHEAP_PAGE(idt_tables[cpu]);
>  
>          if ( stack_base[cpu] )
> -        {
> -            memguard_unguard_stack(stack_base[cpu]);
>              FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
> -        }
>      }
>  }

In my initial reply to Marek's report I did suggest putting the fix
in the alloc path in order to keep the pages "guarded" while the CPU
is parked, as the CPU during that period may still access at least
some of the stacks (e.g. when sending it an NMI IPI to enter a deeper
C state).

Otherwise, if the fix really was to remain here, the if() could now
also be dropped. And in this case I'd also suggest adding the new
piece of code a few lines earlier, so that all the
FREE_XENHEAP_PAGE() stay close together.

Jan

