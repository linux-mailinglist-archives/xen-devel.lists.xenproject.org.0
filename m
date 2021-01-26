Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB030403A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75124.135190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PJI-0007bv-Nl; Tue, 26 Jan 2021 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75124.135190; Tue, 26 Jan 2021 14:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PJI-0007bW-Kg; Tue, 26 Jan 2021 14:27:12 +0000
Received: by outflank-mailman (input) for mailman id 75124;
 Tue, 26 Jan 2021 14:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4PJG-0007bR-IW
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:27:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43ae0976-76d6-4985-973a-7ce48dcb6ddb;
 Tue, 26 Jan 2021 14:27:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04D69AB9F;
 Tue, 26 Jan 2021 14:27:09 +0000 (UTC)
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
X-Inumbo-ID: 43ae0976-76d6-4985-973a-7ce48dcb6ddb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611671229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP9o7AG7KhKYrjHHwEksfK3xiNirkEzXYfFpkJrVL1k=;
	b=fuFWScGOq2W8pA/n74dDk8npeuyDxzml8J2lore6dvcy/52f7TVUSPJItrNSxIYl1wuNnE
	8f3bX2bt3nxmp911YzgI5dnJR6owJnV/TH7LZhofjoRzxHBlRucoyO/MZpyYgR5d7LIkcH
	Ug7L3Lhp0oxH/ZJIj9taEXYpufyo0C8=
Subject: Re: [PATCH v7 10/10] x86/vm_event: Carry Processor Trace buffer
 offset in vm_event
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c00b60c5-ba4a-7473-cf26-60b46681279a@suse.com>
Date: Tue, 26 Jan 2021 15:27:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 22:27, Andrew Cooper wrote:
> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>  
>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>      req->data.regs.x86.dr6 = ctxt.dr6;
> +
> +    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.pt_offset) != 1 )
> +        req->data.regs.x86.pt_offset = ~0;

Ah. (Regarding my earlier question about this returning -errno or
boolean).

> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -223,6 +223,12 @@ struct vm_event_regs_x86 {
>       */
>      uint64_t npt_base;
>  
> +    /*
> +     * Current offset in the Processor Trace buffer. For Intel Processor Trace
> +     * this is MSR_RTIT_OUTPUT_MASK. Set to ~0 if no Processor Trace is active.
> +     */
> +    uint64_t pt_offset;

According to vmtrace_output_position() the value is only one half
of what the named MSR contains. Perhaps "... this is from MSR_..."?
Not sure whether, despite this, there still is a reason to have
this 64-bit wide.

Jan

