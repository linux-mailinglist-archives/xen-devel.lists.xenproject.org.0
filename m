Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F255B2858DE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 08:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3326.9649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ3Lc-0006HS-RW; Wed, 07 Oct 2020 06:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3326.9649; Wed, 07 Oct 2020 06:54:48 +0000
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
	id 1kQ3Lc-0006H3-OK; Wed, 07 Oct 2020 06:54:48 +0000
Received: by outflank-mailman (input) for mailman id 3326;
 Wed, 07 Oct 2020 06:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ3La-0006Gw-OU
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 06:54:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c3a9921-f63a-4b66-be1f-20780c9aaf42;
 Wed, 07 Oct 2020 06:54:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85C66B281;
 Wed,  7 Oct 2020 06:54:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ3La-0006Gw-OU
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 06:54:46 +0000
X-Inumbo-ID: 7c3a9921-f63a-4b66-be1f-20780c9aaf42
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7c3a9921-f63a-4b66-be1f-20780c9aaf42;
	Wed, 07 Oct 2020 06:54:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602053684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A1ztSWII4k26R643KPnL55c+vrF7Cs76PMlXbicvk1U=;
	b=pQSqJrAg5TPNlAZX+DOzWNF6C9VY0c6kPNXSlxpNLxbiB6mJTTxPsE1fMNhtUv7UbX2Kio
	LoTQtAIFw5OG2tafHBqA5p77xRNihOpsz5pPJFzhKoQfNA3T7L4GmrH+oqsm2Z27VoPvDH
	cPfRpsl25PpjPzp7cPgnLi9MIxDU1K8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 85C66B281;
	Wed,  7 Oct 2020 06:54:44 +0000 (UTC)
Subject: Re: [PATCH 2/3] tools/init-xenstore-domain: support xenstore pvh
 stubdom
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20200923064541.19546-1-jgross@suse.com>
 <20200923064541.19546-3-jgross@suse.com>
 <20200930154611.xqzdumwec7nlnidl@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <baa915a8-bd96-4669-dfa1-1e4e09024493@suse.com>
Date: Wed, 7 Oct 2020 08:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930154611.xqzdumwec7nlnidl@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.20 17:46, Wei Liu wrote:
> On Wed, Sep 23, 2020 at 08:45:40AM +0200, Juergen Gross wrote:
>> Instead of creating the xenstore-stubdom domain first and parsing the
>> kernel later do it the other way round. This enables to probe for the
>> domain type supported by the xenstore-stubdom and to support both, pv
>> and pvh type stubdoms.
>>
>> Try to parse the stubdom image first for PV support, if this fails use
>> HVM. Then create the domain with the appropriate type selected.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> [...]
>> +    dom->container_type = XC_DOM_HVM_CONTAINER;
>> +    rv = xc_dom_parse_image(dom);
>> +    if ( rv )
>> +    {
>> +        dom->container_type = XC_DOM_PV_CONTAINER;
>> +        rv = xc_dom_parse_image(dom);
>> +        if ( rv )
>> +        {
>> +            fprintf(stderr, "xc_dom_parse_image failed\n");
>> +            goto err;
>> +        }
>> +    }
>> +    else
>> +    {
>> +        config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>> +        config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
>> +        dom->target_pages = mem_size >> XC_PAGE_SHIFT;
>> +        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
>> +        dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
>> +                          LAPIC_BASE_ADDRESS : mem_size;
>> +        dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
>> +                           GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
>> +        dom->mmio_start = LAPIC_BASE_ADDRESS;
>> +        dom->max_vcpus = 1;
>> +        e820[0].addr = 0;
>> +        e820[0].size = dom->lowmem_end;
>> +        e820[0].type = E820_RAM;
>> +        e820[1].addr = LAPIC_BASE_ADDRESS;
>> +        e820[1].size = dom->mmio_size;
>> +        e820[1].type = E820_RESERVED;
>> +        e820[2].addr = GB(4);
>> +        e820[2].size = dom->highmem_end - GB(4);
> 
> Do you not want to check if highmem_end is larger than GB(4) before
> putting in this region?

Oh, just realized: further down I'm setting the guest's map with either
2 or 3 entries depending on dom->highmem_end value.

So I think this is fine.


Juergen


