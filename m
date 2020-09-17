Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E126DDB2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:12:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIueA-000356-KO; Thu, 17 Sep 2020 14:12:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIue9-000351-Eo
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:12:25 +0000
X-Inumbo-ID: 3c90e32b-adab-4ae1-809e-8a7b2e9467ae
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c90e32b-adab-4ae1-809e-8a7b2e9467ae;
 Thu, 17 Sep 2020 14:12:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600351943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XamyEtJSSo1DXnlCakdSHZqMfssU+J3YD5WM0YaRapE=;
 b=bPGz76UzM6rtmKs0egJz50dmBMzqzUo98t1kUr5yveW3oV70nhzWVOfQ5oTo5n5jerXsVU
 omUymsBkmTEUYQi0o5IJXXGH9iU/232GVPmm3hXINWwmlBwAeO8aZk1HNjaDimepbVEnkb
 eNUkT3S9aXScGtwbUzQ3XTcCC2v94d3vahxF5pHrkMSiCig7xL348TUCfUGiAu4QJCc59X
 z7Vb+dKMajupRb4/1n3mRVNUeCVoa17Ek90iHyD25D7Hl9F4jAl+oXAa3jMWNG3UAlh5Hd
 HPyQ4CpWoUOE9acDNzMgHkoBFWqlpyOJog55m57HPGsrtW0ku47d/Op3OUAowA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFFA0AFC5;
 Thu, 17 Sep 2020 14:12:56 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7230e70-3aae-61a2-3574-6eeae6e4e57a@suse.com>
Date: Thu, 17 Sep 2020 16:12:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910133514.82155-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10.09.2020 15:35, Roger Pau Monne wrote:
> arch_init_memory will treat all the gaps on the physical memory map
> between RAM regions as MMIO and use share_xen_page_with_guest in order
> to assign them to dom_io. This has the side effect of setting the Xen
> heap flag on such pages, and thus is_special_page would then return
> true which is an issue in epte_get_entry_emt because such pages will
> be forced to use write-back cache attributes.
> 
> Fix this by introducing a new helper to assign the MMIO regions to
> dom_io without setting the Xen heap flag on the pages, so that
> is_special_page will return false and the pages won't be forced to use
> write-back cache attributes.
> 
> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm sorry for noticing this only now, but there is a place where
we actually build on these pages being marked "special": In
xenmem_add_to_physmap_one() we have

    if ( mfn_valid(prev_mfn) )
    {
        if ( is_special_page(mfn_to_page(prev_mfn)) )
            /* Special pages are simply unhooked from this phys slot. */
            rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
        else
            /* Normal domain memory is freed, to avoid leaking memory. */
            rc = guest_remove_page(d, gfn_x(gpfn));
    }

As you'll notice MMIO pages not satisfying mfn_valid() will simply
bypass any updates here, but the subsequent guest_physmap_add_page()
will have the P2M entry updated anyway. MMIO pages which satisfy
mfn_valid(), however, would previously have been passed into
guest_physmap_remove_page() (which generally would succeed) while
now guest_remove_page() will (afaict) fail (get_page() there won't
succeed).

I haven't come to a clear conclusion yet how best to address this.

Jan

