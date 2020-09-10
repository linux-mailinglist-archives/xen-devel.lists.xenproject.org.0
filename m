Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FB264553
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 13:28:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGKkv-0003JA-MQ; Thu, 10 Sep 2020 11:28:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGKkt-0003J3-Qj
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 11:28:43 +0000
X-Inumbo-ID: 7fd2a31b-a9ce-4b51-be05-650515486670
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fd2a31b-a9ce-4b51-be05-650515486670;
 Thu, 10 Sep 2020 11:28:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE6B7AC79;
 Thu, 10 Sep 2020 11:28:57 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding
 cache attributes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
References: <20200909145058.72066-1-roger.pau@citrix.com>
 <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
 <20200910103455.GV753@Air-de-Roger> <002901d68760$93a6a330$baf3e990$@xen.org>
 <20200910110400.GX753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7fec8ef-ac98-7d69-8385-e366ccb35557@suse.com>
Date: Thu, 10 Sep 2020 13:28:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910110400.GX753@Air-de-Roger>
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

On 10.09.2020 13:05, Roger Pau Monné wrote:
> It's still not clear to me what option would be better: modify
> share_xen_page_with_guest to not mark pages as Xen heap, or implement
> something different to assign MMIO pages to dom_io without setting
> the Xen heap flag.

static void __init share_io_page(struct page_info *page)
{
    set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);

    /* The incremented type count pins as writable. */
    page->u.inuse.type_info = PGT_writable_page | PGT_validated | 1;

    page_set_owner(page, dom_io);

    page->count_info |= PGC_allocated | 1;
}

is of course much shorter than share_xen_page_with_guest(), but
I'm nevertheless uncertain whether simply making conditional
the setting of PGC_xen_heap there isn't the easier route. Of
course, not pointlessly acquiring and releasing a lock has its
own appeal.

Jan

