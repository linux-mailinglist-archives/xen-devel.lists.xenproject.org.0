Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81A2646B9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:18:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMSC-00058U-NP; Thu, 10 Sep 2020 13:17:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGMSB-00058O-Tr
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 13:17:31 +0000
X-Inumbo-ID: 67878294-f4d1-41e4-baab-afa8dc6d33c7
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67878294-f4d1-41e4-baab-afa8dc6d33c7;
 Thu, 10 Sep 2020 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599743850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F0tGysGYoxwFMS+wUjT1X03jatgz7QuSwOYT7C8qIGM=;
 b=XTOUB6bXOZirM9RkDJzwjRJKoLUH4H1rn4+vVtGuPVTH48uEPHIvODmG
 wjUuKYLlhaDEo+7wAegyNQQa2s14v7crj2BS2RjUGcZN15G60eABIG8uT
 i4iokB7urWgaZh/Hk//AgaYgv6P0X/munqGNDMZgD0GjvlVKmA04rjnmF U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RSv+wuVZZA54tFwI5KPfFObc2CFW+Hau+wSZrSq7v/r5MvECG+OS8ezM5VXO6G0xqChVwh6INB
 PHxi79/gN2Jcbk+nWE7IhgggsfBKvY3zjTXoWagNfTyx+dQGKaZfXDlwVPuCGACVsysMSrSXVF
 WxcHTaBChtqq/MIjUD7yRct9zrxe5VnjzOJ5TsurzgRzA4OlYLeLtS30tfUgvLX5mAFxaibPdi
 +w6X7/qhmMUYECOmo/ekhJScjkLjyY9UEfcpa8jdSj9zou7vxTiiFQb4VLUlKE/d0eA48Aup07
 4ck=
X-SBRS: 2.7
X-MesageID: 26527059
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,413,1592884800"; d="scan'208";a="26527059"
Date: Thu, 10 Sep 2020 15:17:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <paul@xen.org>, <xen-devel@lists.xenproject.org>, 'Andrew Cooper'
 <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones
 regarding cache attributes
Message-ID: <20200910131712.GZ753@Air-de-Roger>
References: <20200909145058.72066-1-roger.pau@citrix.com>
 <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
 <20200910103455.GV753@Air-de-Roger>
 <002901d68760$93a6a330$baf3e990$@xen.org>
 <20200910110400.GX753@Air-de-Roger>
 <e7fec8ef-ac98-7d69-8385-e366ccb35557@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7fec8ef-ac98-7d69-8385-e366ccb35557@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Thu, Sep 10, 2020 at 01:28:44PM +0200, Jan Beulich wrote:
> On 10.09.2020 13:05, Roger Pau Monné wrote:
> > It's still not clear to me what option would be better: modify
> > share_xen_page_with_guest to not mark pages as Xen heap, or implement
> > something different to assign MMIO pages to dom_io without setting
> > the Xen heap flag.
> 
> static void __init share_io_page(struct page_info *page)
> {
>     set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
> 
>     /* The incremented type count pins as writable. */
>     page->u.inuse.type_info = PGT_writable_page | PGT_validated | 1;
> 
>     page_set_owner(page, dom_io);
> 
>     page->count_info |= PGC_allocated | 1;
> }
> 
> is of course much shorter than share_xen_page_with_guest(), but
> I'm nevertheless uncertain whether simply making conditional
> the setting of PGC_xen_heap there isn't the easier route. Of
> course, not pointlessly acquiring and releasing a lock has its
> own appeal.

I've went over the existing is_special_page users and I think it's
fine for MMIO regions to not be marked as special pages.

Will send a new patch.

Roger.

