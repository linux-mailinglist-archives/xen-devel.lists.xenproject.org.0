Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A375E19D918
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNHj-0004TF-4O; Fri, 03 Apr 2020 14:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUFr=5T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jKNHh-0004TA-Qx
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:27:01 +0000
X-Inumbo-ID: 2e012966-75b7-11ea-83d8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e012966-75b7-11ea-83d8-bc764e2007e4;
 Fri, 03 Apr 2020 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585924020;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+JDTvp8Ze6MUvEypihfG/WO0Xnj9Z8kpr9YO5/Wn3A8=;
 b=UEOiomKQSQB7iHZlBJeloWAddNeaLvDrzBhFn6v+rXeiOphtpcG86T0e
 D9lyEx0CCpmmlnTdbb907RZuLcyRcIW73EB3xzBJdKmR7vXFGLsxHFLCi
 aJ/l4xBtrcre2E7oIBHeXqtORK4wzpbluclRn6h8AOFbLq7lDUy2soB9d k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l2E2TzRhEu10W9YQR353fk4jcfvYm6ByTkoGDZJ2EyQHJRZ+KOYDOD0WbRaYNaqB3GucbNPMjn
 NPhszXjwnrumCC7HIggRtZEyR0Miqtz3K2u6Q/M1nd/g66gAJ0xYpYrNvkIqRoTgnUwQFcpFRd
 ufG/PRNus7Qw4LEnknnMsG+VJd2dQQtM01Ah+JPHI39d0wliAN1iUkLybleIhXqOIxufQdOJZ/
 Ze2HZxiTWZw8NdT8yiwidzfS6NBwRZXKkZxdffXyXlMHPss215n6kepRadxVZhTfyg1JaooAxf
 8Os=
X-SBRS: 2.7
X-MesageID: 15799997
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15799997"
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Jan Beulich <jbeulich@suse.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <bf83ee24-8516-f18c-fabb-0ff2718bf8f5@citrix.com>
Date: Fri, 3 Apr 2020 15:26:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 ian.jackson@eu.citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 14:53, Jan Beulich wrote:
> On 02.04.2020 18:18, Igor Druzhinin wrote:
>> The area just below 4G where OVMF image is originally relocated is not
>> necessarily a hole - it might contain pages preallocated by device model
>> or the toolstack. By unconditionally populating on top of this memory
>> the original pages are getting lost while still potentially foreign mapped
>> in Dom0.
> 
> When there are pre-allocated pages - have they been orphaned? If
> so, shouldn't whoever populated them unpopulate rather than
> orphaning them? Or if not - how is the re-use you do safe?

There is no signal to the device model when that happens - it has no idea when the
memory it populated and hold a mapping to becomes suddenly unmapped in the guest.
Re-use is safe as the memory prepopulated before OVMF starts has not been put
in use yet until after it's finished initializing.

>> --- a/tools/firmware/hvmloader/util.c
>> +++ b/tools/firmware/hvmloader/util.c
>> @@ -398,6 +398,20 @@ int get_mem_mapping_layout(struct e820entry entries[], uint32_t *max_entries)
>>      return rc;
>>  }
>>  
>> +bool mem_probe_ram(xen_pfn_t mfn)
>> +{
>> +    uint32_t tmp, magic = 0xdeadbeef;
>> +    volatile uint32_t *addr = (volatile uint32_t *)(mfn << PAGE_SHIFT);
>> +
>> +    tmp = *addr;
>> +    *addr = magic;
>> +    if ( *addr != magic )
>> +        return 0;
>> +
>> +    *addr = tmp;
>> +    return 1;
>> +}
> 
> This looks to probe r/o behavior. If there was a ROM page pre-populated,
> wouldn't it then be equally lost once you populate RAM over it? And what
> if this is MMIO, i.e. writable but potentially with side effects?

I assume if the pages behind it are not r/w there is no other way to avoid
crashing immediately except go and repopulate on top. MMIO is a problematic
corner case I expect device model would try to avoid.

> Whether, as you suggest as an alternative, moving populating of this
> space to the tool stack is feasible I don't know. If it was, I would
> wonder though why it wasn't done like this in the first place.

I expect one complication is to know the type of firmware at the moment
domain is constructed to make sure area is populated for OVMF only. 

Igor


