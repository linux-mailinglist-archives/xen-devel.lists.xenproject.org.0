Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02162EF451
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63605.112895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtH2-0001wP-1i; Fri, 08 Jan 2021 15:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63605.112895; Fri, 08 Jan 2021 15:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtH1-0001w3-Uz; Fri, 08 Jan 2021 15:01:55 +0000
Received: by outflank-mailman (input) for mailman id 63605;
 Fri, 08 Jan 2021 15:01:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtH0-0001tc-NN
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:01:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id decb45d3-b7df-4392-9656-d43d7c293edf;
 Fri, 08 Jan 2021 15:01:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BA15AD11;
 Fri,  8 Jan 2021 15:01:52 +0000 (UTC)
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
X-Inumbo-ID: decb45d3-b7df-4392-9656-d43d7c293edf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610118112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L02pzOXAtLlXo3hOe8Ops4vEHJXoSP76bgwQcmgsx8I=;
	b=L4o+O9rrOKdkHBejW3W/CedEHhPpBJMiRaJCE4HUNy0cAPeobrrB/wfAgNnbFfjSLCd7yP
	8bmhy58suxKhu1Zs5IAL5M3f5kZlZBoawr5o/Deha1JojeYhOm/JnmtZ79fxKIFbSRQWIa
	UMegcwgMI6smXxdp61TYEkX/vYbKypM=
Subject: Re: [PATCH] x86/hypercall: fix gnttab hypercall args conditional
 build on pvshim
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210108144123.58546-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26f9456f-6741-1bc0-053c-9cb4733515e5@suse.com>
Date: Fri, 8 Jan 2021 16:01:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108144123.58546-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 15:41, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hypercall.c
> +++ b/xen/arch/x86/hypercall.c
> @@ -47,7 +47,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
>      ARGS(xen_version, 2),
>      ARGS(console_io, 3),
>      ARGS(physdev_op_compat, 1),
> -#ifdef CONFIG_GRANT_TABLE
> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>      ARGS(grant_table_op, 3),
>  #endif
>      ARGS(vm_assist, 2),

This is correct when a shim-enabled build runs as shim, but
not when it runs as normal hypervisor. Just like the hypercall
handler gets patched into the hypercall table (in
pv_shim_setup_dom()), the argument count will also want
updating there, I think.

Jan

