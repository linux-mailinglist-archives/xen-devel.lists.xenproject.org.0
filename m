Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE02641C8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 11:28:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGIru-0000XF-EQ; Thu, 10 Sep 2020 09:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGIrt-0000XA-Ah
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 09:27:49 +0000
X-Inumbo-ID: 6b4fea37-4dfb-425f-869f-c8d9fb44feb9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b4fea37-4dfb-425f-869f-c8d9fb44feb9;
 Thu, 10 Sep 2020 09:27:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3792AEC3;
 Thu, 10 Sep 2020 09:28:02 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding
 cache attributes
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200909145058.72066-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
Date: Thu, 10 Sep 2020 11:27:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909145058.72066-1-roger.pau@citrix.com>
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

On 09.09.2020 16:50, Roger Pau Monne wrote:
> MMIO regions below the maximum address on the memory map can have a
> backing page struct that's shared with dom_io (see x86
> arch_init_memory and it's usage of share_xen_page_with_guest), and
> thus also fulfill the is_special_page check because the page has the
> Xen heap bit set.
> 
> This is incorrect for MMIO regions when is_special_page is used by
> epte_get_entry_emt, as it will force direct MMIO regions mapped into
> the guest p2m to have the cache attributes set to write-back.
> 
> Add an extra check in epte_get_entry_emt in order to detect pages
> shared with dom_io (ie: MMIO regions) and don't force them to
> write-back cache type on that case.

Did you consider the alternative of not marking those pages as Xen
heap ones? In particular when looking at it from this angle I
consider it at least odd for non-RAM (or more precisely non-heap)
pages to get marked this way. And I can't currently see anything
requiring them to be marked as such - them being owned by DomIO is
all that's needed as it seems.

Jan

