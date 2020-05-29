Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79001E7DA7
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:53:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeeVK-0005GD-Lm; Fri, 29 May 2020 12:52:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeeVK-0005G6-4Q
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:52:54 +0000
X-Inumbo-ID: 4f1c586c-a1ab-11ea-a8ab-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f1c586c-a1ab-11ea-a8ab-12813bfff9fa;
 Fri, 29 May 2020 12:52:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F9AFAE0F;
 Fri, 29 May 2020 12:52:52 +0000 (UTC)
Subject: Re: [PATCH v2 13/14] x86/S3: Save and restore Shadow Stack
 configuration
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-14-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1f1cb73-65f7-f2f7-161c-b505edc5959e@suse.com>
Date: Fri, 29 May 2020 14:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 27.05.2020 21:18, Andrew Cooper wrote:
> See code for details
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Semi-RFC - I can't actually test this path.  Currently attempting to arrange
> for someone else to.

Nevertheless
Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one question, just for my understanding:

> @@ -48,6 +58,51 @@ ENTRY(s3_resume)
>          pushq   %rax
>          lretq
>  1:
> +#ifdef CONFIG_XEN_SHSTK
> +        /*
> +         * Restoring SSP is a little complicated, because we are intercepting
> +         * an in-use shadow stack.  Write a temporary token under the stack,
> +         * so SETSSBSY will successfully load a value useful for us, then
> +         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
> +         */
> +        mov     saved_rsp(%rip), %rdi
> +        cmpq    $1, %rdi
> +        je      .L_shstk_done
> +
> +        /* Set up MSR_S_CET. */
> +        mov     $MSR_S_CET, %ecx
> +        xor     %edx, %edx
> +        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
> +        wrmsr
> +
> +        /* Construct the temporary supervisor token under SSP. */
> +        sub     $8, %rdi
> +
> +        /* Load it into MSR_PL0_SSP. */
> +        mov     $MSR_PL0_SSP, %ecx
> +        mov     %rdi, %rdx
> +        shr     $32, %rdx
> +        mov     %edi, %eax
> +        wrmsr
> +
> +        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
> +        mov     %rbx, %cr4

Does this imply NMI or #MC are fatal between here and there?

Jan

