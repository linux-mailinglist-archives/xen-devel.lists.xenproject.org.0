Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0134260E30
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 10:56:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFZPB-0006Dh-9W; Tue, 08 Sep 2020 08:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFZPA-0006Dc-Bu
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 08:55:08 +0000
X-Inumbo-ID: b9451b4c-01d9-4e4a-92c9-8bd21da5f9cd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9451b4c-01d9-4e4a-92c9-8bd21da5f9cd;
 Tue, 08 Sep 2020 08:55:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECEADB604;
 Tue,  8 Sep 2020 08:55:06 +0000 (UTC)
Subject: Re: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()"
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200907170916.61693-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a050491-4e02-63be-c622-6fab25c4c2e6@suse.com>
Date: Tue, 8 Sep 2020 10:55:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907170916.61693-1-roger.pau@citrix.com>
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

On 07.09.2020 19:09, Roger Pau Monne wrote:
> This reverts commit 81fd0d3ca4b2cd309403c6e8da662c325dd35750.
> 
> Original commit only takes into account the APIC access page being a
> 'special' page, but when running a PVH dom0 there are other pages that
> also fulfill the 'special' page check but shouldn't have it's cache
> type set to WB.
> 
> For example the ACPI regions are identity mapped into the guest but
> are also Xen heap pages, and forcing those to WB cache type is wrong.

Why is this wrong? Xen heap pages are RAM ones. Quite the opposite,
_not_ forcing them to WB is going to cause cachability conflicts,
unless their direct mapping entries also got changed to UC (which I
think we want to avoid if at all possible). The cachability we
select here is the one to be used by the hardware, not the one
perceived by a domain (be it Dom0 or a DomU).

> I've discovered this while trying to boot a PVH dom0, which fail to
> boot with this commit applied.

And what exactly is the deeper reason of the failure?

Jan

