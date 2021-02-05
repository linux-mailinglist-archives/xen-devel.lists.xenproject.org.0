Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB8310653
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 09:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81540.150789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7wDT-00019G-3I; Fri, 05 Feb 2021 08:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81540.150789; Fri, 05 Feb 2021 08:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7wDS-00018r-Vs; Fri, 05 Feb 2021 08:11:46 +0000
Received: by outflank-mailman (input) for mailman id 81540;
 Fri, 05 Feb 2021 08:11:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7wDR-00018m-KP
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 08:11:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a097a26-456f-4d01-91e1-bad4b6a0dc08;
 Fri, 05 Feb 2021 08:11:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00D8EB19D;
 Fri,  5 Feb 2021 08:11:42 +0000 (UTC)
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
X-Inumbo-ID: 5a097a26-456f-4d01-91e1-bad4b6a0dc08
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612512703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHGoqUvcfHbzOyfzU/GOWcvUFDcZafbrxHVRWqXJxJs=;
	b=gFa1Nk1QP7Lp0wQu696KWTc1+38/RJxULG7d89sB89dF+5/poeC+5TmdheiU2qcq4wyb3D
	fzFI0I5uSGFgpn8n4N/V7ufeRbDAnUfUkPiCrgFxSJVWN4S1/T3jBRa/tRMbItE0VauTEH
	nWgupxk/BxOqrjU4tx1KhjuwMGu9RTc=
Subject: Re: [PATCH] x86/EFI: work around GNU ld 2.36 issue
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <e6d59277-35b2-e7df-0e68-a794c8855ac0@suse.com>
Message-ID: <8450b84d-93f2-7568-362e-af27954e5157@suse.com>
Date: Fri, 5 Feb 2021 09:11:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e6d59277-35b2-e7df-0e68-a794c8855ac0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 14:38, Jan Beulich wrote:
> Our linker capability check fails with the recent binutils release's ld:
> 
> .../check.o:(.debug_aranges+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_info'
> .../check.o:(.debug_info+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_abbrev'
> .../check.o:(.debug_info+0xc): relocation truncated to fit: R_X86_64_32 against `.debug_str'+76
> .../check.o:(.debug_info+0x11): relocation truncated to fit: R_X86_64_32 against `.debug_str'+d
> .../check.o:(.debug_info+0x15): relocation truncated to fit: R_X86_64_32 against `.debug_str'+2b
> .../check.o:(.debug_info+0x29): relocation truncated to fit: R_X86_64_32 against `.debug_line'
> .../check.o:(.debug_info+0x30): relocation truncated to fit: R_X86_64_32 against `.debug_str'+19
> .../check.o:(.debug_info+0x37): relocation truncated to fit: R_X86_64_32 against `.debug_str'+71
> .../check.o:(.debug_info+0x3e): relocation truncated to fit: R_X86_64_32 against `.debug_str'
> .../check.o:(.debug_info+0x45): relocation truncated to fit: R_X86_64_32 against `.debug_str'+5e
> .../check.o:(.debug_info+0x4c): additional relocation overflows omitted from the output
> 
> Tell the linker to strip debug info as a workaround. Oddly enough debug
> info has been getting stripped when linking the actual xen.efi, without
> me being able to tell why this would be.

I've changed this to

"Tell the linker to strip debug info as a workaround. Debug info has been
 getting stripped already anyway when linking the actual xen.efi."

as I noticed I did look for -S only yesterday, while we have

EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 --strip-debug

Jan

