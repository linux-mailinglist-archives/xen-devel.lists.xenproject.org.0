Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36536E7F4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119830.226555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2xP-0004Qi-Ae; Thu, 29 Apr 2021 09:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119830.226555; Thu, 29 Apr 2021 09:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2xP-0004QJ-7U; Thu, 29 Apr 2021 09:27:39 +0000
Received: by outflank-mailman (input) for mailman id 119830;
 Thu, 29 Apr 2021 09:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2xN-0004QD-RP
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:27:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d420ae85-4cdc-4011-aea0-a52817d82253;
 Thu, 29 Apr 2021 09:27:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DB17B00D;
 Thu, 29 Apr 2021 09:27:36 +0000 (UTC)
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
X-Inumbo-ID: d420ae85-4cdc-4011-aea0-a52817d82253
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619688456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mt20MGHTZyuBJYIFruA0EHjGY1qpWv39VDyBCo/fRGI=;
	b=nWTAGdbTIQ3TXexS50Ol/W1vLndoo3hoP0zaM4mCZwZOg4SAlMsXwhgHXSEz5U11z0DfzI
	6AaMYgdgWbZZNmMoNWhCceyeUiWC3Nf4gJAL8vQEVoDx/6TXWrlvGIPs1ntzZtKxDisLFy
	iIzVtLZXv2c5Te4/T5bJ5eHQwdP+Od0=
Subject: Ping: [PATCH v2 00/12] x86/p2m: restrict more code to build just for
 HVM
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <b619a0de-c88c-1882-7e27-8f5cb3ef7103@suse.com>
Date: Thu, 29 Apr 2021 11:27:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 16:03, Jan Beulich wrote:
> Since it was brought up in the discussion of v1: I think the end
> goal is to be for mm/p2m.c to become a HVM-only file. Any "wrappers"
> also trying to take care of !paging_mode_translate() guests ought to
> be moved elsewhere. To see what actually still needs taking care of,
> incrementally extending the #ifdef CONFIG_HVM regions there is the
> way to go imo.
> 
> Compared to v1 there are many new patches here plus build fixes to
> two of the three remaining ones from v1.
> 
> 01: p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
> 02: p2m: {,un}map_mmio_regions() are HVM-only
> 03: mm: the gva_to_gfn() hook is HVM-only
> 04: AMD/IOMMU: guest IOMMU support is for HVM only
> 05: p2m: change_entry_type_* hooks are HVM-only
> 06: p2m: hardware-log-dirty related hooks are HVM-only
> 07: p2m: the recalc hook is HVM-only
> 08: mem-access is HVM-only
> 09: make mem-paging configuarable and default it to off for being unsupported
> 10: p2m: {get,set}_entry hooks and p2m-pt.c are HVM-only
> 11: p2m: write_p2m_entry_{pre,post} hooks are HVM-only
> 12: p2m: re-arrange struct p2m_domain

Besides patch 8, which has gone in, I've got two acks from Tim for
shadow code changes and contradicting feedback on patch 9, but
nothing else.

Thanks for acks or otherwise,
Jan

