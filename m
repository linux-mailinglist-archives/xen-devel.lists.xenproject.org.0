Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA22365647
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 12:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113514.216360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnjZ-0003tL-LM; Tue, 20 Apr 2021 10:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113514.216360; Tue, 20 Apr 2021 10:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnjZ-0003sw-Hx; Tue, 20 Apr 2021 10:35:57 +0000
Received: by outflank-mailman (input) for mailman id 113514;
 Tue, 20 Apr 2021 10:35:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYnjX-0003sr-T5
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 10:35:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a186eec-d33f-410f-bb32-6aa6e881e8fb;
 Tue, 20 Apr 2021 10:35:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25E16AF52;
 Tue, 20 Apr 2021 10:35:54 +0000 (UTC)
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
X-Inumbo-ID: 7a186eec-d33f-410f-bb32-6aa6e881e8fb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618914954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXahhzb8eZ5xffxGx1A0hTYeL2KgyADLIWmmAtxKyv4=;
	b=ac2NQ2+Rvzk7165DK4A6KNHbavxowQGrDjIIhKDzKsxWKKlUe/ls5M5ftNKJ34uYv5XX0m
	oiTML/UDFgCW69MRzmlbrBRrd4odm7tWSt+koMouQh+aJmj3YGV+dzVgalR5JuKLvRpI6z
	LCfzO/KmodxYf9Ve2uO4z+OeQvguJ/M=
Subject: Re: [PATCH v2 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210415144731.3356-1-roger.pau@citrix.com>
 <20210415144731.3356-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bcda034-b08d-ec06-05fa-2d0f5cb26339@suse.com>
Date: Tue, 20 Apr 2021 12:35:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210415144731.3356-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 16:47, Roger Pau Monne wrote:
> AMD Milan (Zen3) CPUs have an LFENCE Always Serializing CPUID bit in
> leaf 80000021.eax. Previous AMD versions used to have a user settable
> bit in DE_CFG MSR to select whether LFENCE was dispatch serializing,
> which Xen always attempts to set. The forcefully always on setting is
> due to the addition of SEV-SNP so that a VMM cannot break the
> confidentiality of a guest.
> 
> In order to support this new CPUID bit move the LFENCE_DISPATCH
> synthetic CPUID bit to map the hardware bit (leaving a hole in the
> synthetic range) and either rely on the bit already being set by the
> native CPUID output, or attempt to fake it in Xen by modifying the
> DE_CFG MSR. This requires adding one more entry to the featureset to
> support leaf 80000021.eax.
> 
> The bit is exposed to guests by default if the underlying hardware
> supports leaf 80000021, as a way to signal that LFENCE is always
> serializing. Hardware that doesn't have the leaf might also get the
> bit set because Xen has performed the necessary arrangements, but
> that's not yet exposed to guests. Note that Xen doesn't allow guests
> to change the DE_CFG value, so once set by Xen LFENCE will always be
> serializing.
> 
> Note that the access to DE_CFG by guests is left as-is: reads will
> unconditionally return LFENCE_SERIALISE bit set, while writes are
> silently dropped.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Note this doesn't yet expose the bit on hardware that doesn't support
> leaf 80000021. It's still TBD whether we want to hardcode this support
> manually, or instead rely on a more general approach like the one
> suggested by the shrink max CPUID leaf patch from Jan.

I'd like to give Andrew a day or two more to respond there in case he
continues to see an issue, before I commit that with your R-b and this
one here. I'll assume you'll subsequently take care of that missing
piece then - if not, i.e. if e.g. I should, please let me know.

Jan

