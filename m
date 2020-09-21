Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1692726E0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 16:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKMi6-0007V1-SY; Mon, 21 Sep 2020 14:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKMi5-0007Uw-7Q
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 14:22:29 +0000
X-Inumbo-ID: 3aa210a6-1798-4a7d-a368-7629164ae617
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aa210a6-1798-4a7d-a368-7629164ae617;
 Mon, 21 Sep 2020 14:22:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600698147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YW8ic/c5GqniT+8NGF22mGMNx6z/3bq1S+5yqEavRL8=;
 b=YZHUP7QBaaV0UTYr1gVGZkvhhV2CZAcRmvQAroK2PO7gEcXD2xFl53u7XYclNtVwPnibwq
 otOsmV2U4d8Idxsx5FscQsgovJBNSWbEgdPEg07aSSUHXPRZbX3sbmkLnbEtC9XVLzYnw2
 qy8TaPtvoKU7bK/o0FAdqzvR5x2XOXo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2816B251;
 Mon, 21 Sep 2020 14:23:03 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b61c04e-b2ef-a9c6-c3c4-e1d8624e7115@suse.com>
Date: Mon, 21 Sep 2020 16:22:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910133514.82155-1-roger.pau@citrix.com>
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

Is this really the correct commit? I had this queued for backport,
and ended up discarding it from the queue based on this tag, just
to then noticing that I remembered correctly that I did backport
ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages") to
the stable trees already. Isn't it _this_ commit which the change
here fixes?

Jan

