Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738E278A3A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 16:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLoHP-00031N-HH; Fri, 25 Sep 2020 14:00:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLoHN-00031I-Ub
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 14:00:53 +0000
X-Inumbo-ID: 818d3961-aee8-4e1e-8cb8-4ed3e85cbea1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 818d3961-aee8-4e1e-8cb8-4ed3e85cbea1;
 Fri, 25 Sep 2020 14:00:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601042452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgydADyCw89aBbyJRs5VBaKQ6Mc9dhZddkJCrlc6Emw=;
 b=Eqaqt8aPxRLLuyUjanMNQGx2Gq+j9mNtvrFqaZLAfL/rLUZ0fdQXLNvnwHjPdksXkrqo9k
 7yZytCFPaAJ5GcrGRgoW0ri2SFC2378A2kszoZJ/oV1j1fM8zLTsA5DASeSvLV8GyVi9lG
 P26u06zjylzRjM58GLkcfhybZMIIxmw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CD4FAF49;
 Fri, 25 Sep 2020 14:00:52 +0000 (UTC)
Subject: Re: [PATCH] x86/xen: disable Firmware First mode for correctable
 memory errors
To: boris.ostrovsky@oracle.com, Juergen Gross <jgross@suse.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org
References: <20200925101148.21012-1-jgross@suse.com>
 <171970df-5f6e-5a2b-e784-e62d300a005b@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c017f364-e34c-092c-18ca-0ab9a2d75f59@suse.com>
Date: Fri, 25 Sep 2020 16:00:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <171970df-5f6e-5a2b-e784-e62d300a005b@oracle.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.09.2020 15:45, boris.ostrovsky@oracle.com wrote:
> On 9/25/20 6:11 AM, Juergen Gross wrote:
>> @@ -1296,6 +1296,14 @@ asmlinkage __visible void __init xen_start_kernel(void)
>>  
>>  	xen_smp_init();
>>  
>> +#ifdef CONFIG_ACPI
>> +	/*
>> +	 * Disable selecting "Firmware First mode" for correctable memory
>> +	 * errors, as this is the duty of the hypervisor to decide.
>> +	 */
>> +	acpi_disable_cmcff = 1;
>> +#endif
> 
> 
> Not that it matters greatly but should this go under if (xen_initial_domain())
> clause a bit further down?

Yes - DomU-s are supposed to be in charge of their (virtual) firmware,
no matter that right now APEI for guests is completely out of sight as
far as I'm aware.

Jan

