Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE975293D5F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 15:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9625.25262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUrlA-0005RM-Ct; Tue, 20 Oct 2020 13:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9625.25262; Tue, 20 Oct 2020 13:33:04 +0000
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
	id 1kUrlA-0005Qx-9N; Tue, 20 Oct 2020 13:33:04 +0000
Received: by outflank-mailman (input) for mailman id 9625;
 Tue, 20 Oct 2020 13:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUrl9-0005Qs-Co
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:33:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28a590f3-f2cb-4477-b40b-95232c6847d0;
 Tue, 20 Oct 2020 13:33:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C2C8AF00;
 Tue, 20 Oct 2020 13:33:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUrl9-0005Qs-Co
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:33:03 +0000
X-Inumbo-ID: 28a590f3-f2cb-4477-b40b-95232c6847d0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28a590f3-f2cb-4477-b40b-95232c6847d0;
	Tue, 20 Oct 2020 13:33:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603200781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uz1lBFJttZWkkaoKJhEkaOliHTFYzlyYAbrw8KFy1QA=;
	b=YOeVH4TRSGpbYxzQb71CsT4Zfj6cSsoI+6R878yP12YikcyjfVbvetHeaQzYUb8b5RfCEG
	npcUNu99LTjINpPMOb6jK6niOAmGDPs/UpK+IJPqdHlSyAZTxVWFiROAsp7YWcVX+W7pkW
	4QtF1pulFjt865YEgTygQ58zz47ZtLM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7C2C8AF00;
	Tue, 20 Oct 2020 13:33:01 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/x86: add nmi continuation framework
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201016085350.10233-1-jgross@suse.com>
 <20201016085350.10233-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12640bbf-475c-3d74-9bb0-57befcadd626@suse.com>
Date: Tue, 20 Oct 2020 15:33:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201016085350.10233-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 10:53, Juergen Gross wrote:
> Actions in NMI context are rather limited as e.g. locking is rather
> fragile.
> 
> Add a generic framework to continue processing in normal interrupt
> context after leaving NMI processing.
> 
> This is done by a high priority interrupt vector triggered via a
> self IPI from NMI context, which will then call the continuation
> function specified during NMI handling.

I'm concerned by there being just a single handler allowed, when
the series already introduces two uses. A single NMI instance
may signal multiple things in one go. At the very least we then
need a priority, such that SERR could override oprofile.

> @@ -1799,6 +1800,57 @@ void unset_nmi_callback(void)
>      nmi_callback = dummy_nmi_callback;
>  }
>  
> +static DEFINE_PER_CPU(nmi_contfunc_t *, nmi_cont_func);
> +static DEFINE_PER_CPU(void *, nmi_cont_arg);
> +static DEFINE_PER_CPU(bool, nmi_cont_busy);
> +
> +bool nmi_check_continuation(void)
> +{
> +    unsigned int cpu = smp_processor_id();
> +    nmi_contfunc_t *func = per_cpu(nmi_cont_func, cpu);
> +    void *arg = per_cpu(nmi_cont_arg, cpu);
> +
> +    if ( per_cpu(nmi_cont_busy, cpu) )
> +    {
> +        per_cpu(nmi_cont_busy, cpu) = false;
> +        printk("Trying to set NMI continuation while still one active!\n");

I guess the bool would better be a const void *, written
with __builtin_return_address(0) and logged accordingly here
(also including the CPU number).

Also (nit) maybe "... while one still active"?

> +    }
> +
> +    /* Reads must be done before following write (local cpu ordering only). */
> +    barrier();
> +
> +    per_cpu(nmi_cont_func, cpu) = NULL;

I think this still is too lax, and you really need to use
xchg() to make sure you won't lose any case of "busy" (which
may become set between the if() above and the write here).

Jan

