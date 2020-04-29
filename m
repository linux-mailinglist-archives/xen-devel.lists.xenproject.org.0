Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE11BDA76
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 13:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkhx-00037t-Qr; Wed, 29 Apr 2020 11:16:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTkhw-00037o-3r
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 11:16:52 +0000
X-Inumbo-ID: ec974524-8a0a-11ea-992b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec974524-8a0a-11ea-992b-12813bfff9fa;
 Wed, 29 Apr 2020 11:16:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C703AAB8F;
 Wed, 29 Apr 2020 11:16:49 +0000 (UTC)
Subject: Re: [PATCH] x86/S3: Drop {save,restore}_rest_processor_state()
 completely
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200429110903.15418-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42c1a2ec-51a1-7b03-aea5-f8ffe80d6928@suse.com>
Date: Wed, 29 Apr 2020 13:16:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429110903.15418-1-andrew.cooper3@citrix.com>
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
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 13:09, Andrew Cooper wrote:
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -91,6 +91,11 @@ trampoline_protmode_entry:
>          and     %edi,%edx
>          wrmsr
>  1:
> +        /* Set up PAT before enabling paging. */
> +        mov     $XEN_MSR_PAT & 0xffffffff, %eax
> +        mov     $XEN_MSR_PAT >> 32, %edx
> +        mov     $MSR_IA32_CR_PAT, %ecx
> +        wrmsr

Doesn't this also eliminate the need for cpu_init() doing this?
If you agree with that one also dropped
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

