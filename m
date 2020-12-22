Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0462E0872
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57709.101060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kreTI-0007UG-JN; Tue, 22 Dec 2020 10:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57709.101060; Tue, 22 Dec 2020 10:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kreTI-0007Tr-Fu; Tue, 22 Dec 2020 10:00:48 +0000
Received: by outflank-mailman (input) for mailman id 57709;
 Tue, 22 Dec 2020 10:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kreTH-0007Tl-9X
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:00:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14ef9e35-a23c-4520-9efb-f31dd067d171;
 Tue, 22 Dec 2020 10:00:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94B2CABA1;
 Tue, 22 Dec 2020 10:00:45 +0000 (UTC)
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
X-Inumbo-ID: 14ef9e35-a23c-4520-9efb-f31dd067d171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608631245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Aa1Z0Z/VpucUq1qQ6jB3GXJQseOfoDV75m3ScP+dts=;
	b=npCnIBlQfqD5ZT9HlztLnXfLDdU6Or1C9OuLqT+ainGPMGJ3HOuPx0v6vLjtfiLtN/dI2D
	iMdkyfQWAwFPUudDjhPuEtKWixMg75+nUl0Oske3f0laYskADNxURxe+jt7HNzPDj05JkX
	pOh/vPGCRHZ5QXsa9Mh6zK6mNxrmTY4=
Subject: Re: Hypercall fault injection (Was [PATCH 0/3] xen/domain: More
 structured teardown)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <983a3fef-c80f-ec2a-bf3c-5e054fc6a7a9@suse.com>
Date: Tue, 22 Dec 2020 11:00:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.12.2020 20:36, Andrew Cooper wrote:
> Hello,
> 
> We have some very complicated hypercalls, createdomain, and max_vcpus a
> close second, with immense complexity, and very hard-to-test error handling.
> 
> It is no surprise that the error handling is riddled with bugs.
> 
> Random failures from core functions is one way, but I'm not sure that
> will be especially helpful.  In particular, we'd need a way to exclude
> "dom0 critical" operations so we've got a usable system to run testing on.
> 
> As an alternative, how about adding a fault_ttl field into the hypercall?
> 
> The exact paths taken in {domain,vcpu}_create() are sensitive to the
> hardware, Xen Kconfig, and other parameters passed into the
> hypercall(s).  The testing logic doesn't really want to care about what
> failed; simply that the error was handled correctly.
> 
> So a test for this might look like:
> 
> cfg = { ... };
> while ( xc_create_domain(xch, cfg) < 0 )
>     cfg.fault_ttl++;
> 
> 
> The pro's of this approach is that for a specific build of Xen on a
> piece of hardware, it ought to check every failure path in
> domain_create(), until the ttl finally gets higher than the number of
> fail-able actions required to construct a domain.  Also, the test
> doesn't need changing as the complexity of domain_create() changes.
> 
> The main con will mostly likely be the invasiveness of code in Xen, but
> I suppose any fault injection is going to be invasive to a certain extent.

While I like the idea in principle, the innocent looking

cfg = { ... };

is quite a bit of a concern here as well: Depending on the precise
settings, paths taken in the hypervisor may heavily vary, and hence
such a test will only end up being useful if it covers a wide
variety of settings. Even if the number of tests to execute turned
out to still be manageable today, it may quickly turn out not
sufficiently scalable as we add new settings controllable right at
domain creation (which I understand is the plan).

Jan

