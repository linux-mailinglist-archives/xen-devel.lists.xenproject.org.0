Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036943A688A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141550.261437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn2S-0006ph-It; Mon, 14 Jun 2021 13:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141550.261437; Mon, 14 Jun 2021 13:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn2S-0006ng-FL; Mon, 14 Jun 2021 13:54:04 +0000
Received: by outflank-mailman (input) for mailman id 141550;
 Mon, 14 Jun 2021 13:54:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsn2Q-0006me-EA
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:54:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsn2Q-0005Wl-CJ; Mon, 14 Jun 2021 13:54:02 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsn2Q-0006Wh-5d; Mon, 14 Jun 2021 13:54:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=BE6+p6K/3wf7CiK2RQ+Z6ZYQ04bSmw2gSzRvIDaF94Q=; b=GXXG+vxyP540n1vLcjRxxJSGsF
	iGvfdpn8RRZes2hx88REHnCVWZ7/IUQL4c0KJ1m9mRkP63BBawcUcq9Py6gwHPh1lgY5JDtDcUIgh
	NYTxjhAZanXZuzkYFHGFH5wmiLPI0PPRvwyUGUk6uPYO865G11KFAAkZBL0B3nCy1TUY=;
Subject: Re: [PATCH v2] Arm: avoid .init.data to be marked as executable
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <5c173e92-f615-c95a-21a2-5c894727414d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <74fbf731-59f2-0b2e-8707-142091a5876d@xen.org>
Date: Mon, 14 Jun 2021 15:54:00 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5c173e92-f615-c95a-21a2-5c894727414d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/06/2021 15:52, Jan Beulich wrote:
> This confuses disassemblers, at the very least. Move
> .altinstr_replacement to .init.text. The previously redundant ALIGN()
> now gets converted to page alignment, such that the hypervisor mapping
> won't have this as executable (it'll instead get mapped r/w, which I'm
> told is intended to be adjusted at some point).
> 
> Note that for the actual patching logic's purposes this part of
> .init.text _has_ to live after _einittext (or before _sinittext), or
> else branch_insn_requires_update() would produce wrong results.
> 
> Also, to have .altinstr_replacement have consistent attributes in the
> object files, add "x" to the one instance where it was missing.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v2: Put past _einittext.
> 
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -148,6 +148,8 @@ SECTIONS
>          _sinittext = .;
>          *(.init.text)
>          _einittext = .;
> +       . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
> +       *(.altinstr_replacement)
>     } :text
>     . = ALIGN(PAGE_SIZE);
>     .init.data : {
> @@ -169,8 +171,6 @@ SECTIONS
>          __alt_instructions = .;
>          *(.altinstructions)
>          __alt_instructions_end = .;
> -       . = ALIGN(4);
> -       *(.altinstr_replacement)
>   
>   #ifdef CONFIG_DEBUG_LOCK_PROFILE
>          . = ALIGN(POINTER_ALIGN);
> --- a/xen/include/asm-arm/alternative.h
> +++ b/xen/include/asm-arm/alternative.h
> @@ -67,7 +67,7 @@ int apply_alternatives(const struct alt_
>   	ALTINSTR_ENTRY(feature,cb)					\
>   	".popsection\n"							\
>   	" .if " __stringify(cb) " == 0\n"				\
> -	".pushsection .altinstr_replacement, \"a\"\n"			\
> +	".pushsection .altinstr_replacement, \"ax\"\n"			\
>   	"663:\n\t"							\
>   	newinstr "\n"							\
>   	"664:\n\t"							\
> 

-- 
Julien Grall

