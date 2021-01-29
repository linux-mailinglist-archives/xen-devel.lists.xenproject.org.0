Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A883C308756
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77826.141229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Q2z-000684-Sw; Fri, 29 Jan 2021 09:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77826.141229; Fri, 29 Jan 2021 09:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Q2z-00067f-Pd; Fri, 29 Jan 2021 09:26:33 +0000
Received: by outflank-mailman (input) for mailman id 77826;
 Fri, 29 Jan 2021 09:26:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Q2y-00067a-9T
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:26:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b67cbb46-8a18-4f8e-b2a0-f73464e7011f;
 Fri, 29 Jan 2021 09:26:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADCE9AE66;
 Fri, 29 Jan 2021 09:26:30 +0000 (UTC)
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
X-Inumbo-ID: b67cbb46-8a18-4f8e-b2a0-f73464e7011f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611912390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rJF/DlRX30KzRzU3vVoXZOqq4Nd4/01ZX00rjTKlBc=;
	b=NTZkExBlbMk9mIfVsFWJ4nmOrw1/2uSjRd841p8wdUVrrgH32pJCnTSS2OJP9O3iD+bw4c
	aGUsCGgJzak2iMyiSwGk36ZHNlER4+xl3a2Gtq+hrPnTqK4jCr/Du0EB5q4ghstSPFEwqt
	ggQFzVavcYKyFCDQNgF1dnzBKukR/bI=
Subject: Re: [PATCH] x86/pvh: pass module command line to dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20210129090551.15608-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e41a9832-e5e8-f56d-a0d9-636bf4dfe7ed@suse.com>
Date: Fri, 29 Jan 2021 10:26:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129090551.15608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 10:05, Roger Pau Monne wrote:
> Both the multiboot and the HVM start info structures allow passing a
> string together with a module. Implement the missing support in
> pvh_load_kernel so that module strings found in the multiboot
> structure are forwarded to dom0.
> 
> Fixes: 62ba982424 ('x86: parse Dom0 kernel for PVHv2')

This really is relevant only when it's not an initrd which gets
passed as module, I suppose? I'm not fully convinced I'd call
this a bug then, but perhaps more a missing feature. Which in
turn means I'm not sure about the change's disposition wrt 4.15.
Cc-ing Ian.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
Albeit ...

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -617,7 +617,21 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>  
>          mod.paddr = last_addr;
>          mod.size = initrd->mod_end;
> -        last_addr += ROUNDUP(initrd->mod_end, PAGE_SIZE);
> +        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
> +        if ( initrd->string )
> +        {
> +            char *str = __va(initrd->string);
> +
> +            rc = hvm_copy_to_guest_phys(last_addr, str, strlen(str) + 1, v);
> +            if ( rc )
> +            {
> +                printk("Unable to copy module command line\n");
> +                return rc;
> +            }
> +            mod.cmdline_paddr = last_addr;
> +            last_addr += strlen(str) + 1;

... it would have been nice if this length was calculated just
once, into a local variable. I'd be fine making the adjustment
while committing, so long as you agree.

Jan

