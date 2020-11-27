Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C32C637F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 11:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39151.71947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibQT-0000Zi-7e; Fri, 27 Nov 2020 10:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39151.71947; Fri, 27 Nov 2020 10:56:29 +0000
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
	id 1kibQT-0000ZJ-45; Fri, 27 Nov 2020 10:56:29 +0000
Received: by outflank-mailman (input) for mailman id 39151;
 Fri, 27 Nov 2020 10:56:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kibQR-0000ZD-LN
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 10:56:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55f058ed-6de4-4b20-9e8a-0ceddf9b3824;
 Fri, 27 Nov 2020 10:56:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77EEEAD7C;
 Fri, 27 Nov 2020 10:56:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kibQR-0000ZD-LN
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 10:56:27 +0000
X-Inumbo-ID: 55f058ed-6de4-4b20-9e8a-0ceddf9b3824
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 55f058ed-6de4-4b20-9e8a-0ceddf9b3824;
	Fri, 27 Nov 2020 10:56:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606474584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJiGZRoGdo1CBYHWTG9rexMadMVBWHmssa+Ae+8gdGg=;
	b=uPyiaRJY2ts86APmhdGOk+UZ5iAfSeglbwg/zf3hdT2Lz3azuMmFfAN9rlLC/98qDALP8Z
	az2wvSmsEB8NF4pFjQIJsxgkCiItyUhbvyG9LVKUvnr+3RqaxZDXtHorV9EWAzNGd+pEIW
	QuO0fH57fd04E0EXJqNbpSzwWtZO0tk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 77EEEAD7C;
	Fri, 27 Nov 2020 10:56:24 +0000 (UTC)
Subject: Re: [PATCH] x86/msr: don't inject #GP when trying to read
 FEATURE_CONTROL
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201127104614.71933-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1f686e2-dcc3-233a-c241-edf997d2cef7@suse.com>
Date: Fri, 27 Nov 2020 11:56:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127104614.71933-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.11.2020 11:46, Roger Pau Monne wrote:
> Windows 10 will triple fault if #GP is injected when attempting to
> read the FEATURE_CONTROL MSR on Intel or compatible hardware. Fix this
> by injecting a #GP only when the vendor doesn't support the MSR, even
> if there are no features to expose.
> 
> Fixes: 39ab598c50a2 ('x86/pv: allow reading FEATURE_CONTROL MSR')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle
Acked-by: Jan Beulich <jbeulich@suse.com>

However, iirc it was Andrew who had suggested the conditional you
now replace, so I'd like to wait for him to voice a view.

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -176,7 +176,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      switch ( msr )
>      {
>      case MSR_IA32_FEATURE_CONTROL:
> -        if ( !cp->basic.vmx && !vmce_has_lmce(v) )
> +        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )

What about Shanghai? init_shanghai() calling init_intel_cacheinfo()
suggests to me it's at least as Intel-like as Centaur/VIA.

Jan

