Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E88919D804
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 15:54:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKMlW-0001Yi-4b; Fri, 03 Apr 2020 13:53:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKMlU-0001YB-LE
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 13:53:44 +0000
X-Inumbo-ID: 88050d1a-75b2-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88050d1a-75b2-11ea-83d8-bc764e2007e4;
 Fri, 03 Apr 2020 13:53:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3FC7AC92;
 Fri,  3 Apr 2020 13:53:42 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
Date: Fri, 3 Apr 2020 15:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
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

On 02.04.2020 18:18, Igor Druzhinin wrote:
> The area just below 4G where OVMF image is originally relocated is not
> necessarily a hole - it might contain pages preallocated by device model
> or the toolstack. By unconditionally populating on top of this memory
> the original pages are getting lost while still potentially foreign mapped
> in Dom0.

When there are pre-allocated pages - have they been orphaned? If
so, shouldn't whoever populated them unpopulate rather than
orphaning them? Or if not - how is the re-use you do safe?

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -398,6 +398,20 @@ int get_mem_mapping_layout(struct e820entry entries[], uint32_t *max_entries)
>      return rc;
>  }
>  
> +bool mem_probe_ram(xen_pfn_t mfn)
> +{
> +    uint32_t tmp, magic = 0xdeadbeef;
> +    volatile uint32_t *addr = (volatile uint32_t *)(mfn << PAGE_SHIFT);
> +
> +    tmp = *addr;
> +    *addr = magic;
> +    if ( *addr != magic )
> +        return 0;
> +
> +    *addr = tmp;
> +    return 1;
> +}

This looks to probe r/o behavior. If there was a ROM page pre-populated,
wouldn't it then be equally lost once you populate RAM over it? And what
if this is MMIO, i.e. writable but potentially with side effects?

Whether, as you suggest as an alternative, moving populating of this
space to the tool stack is feasible I don't know. If it was, I would
wonder though why it wasn't done like this in the first place.

Jan

