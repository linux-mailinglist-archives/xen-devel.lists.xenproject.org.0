Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B7239F88
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 08:19:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Toc-0008WV-2F; Mon, 03 Aug 2020 06:19:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2Toa-0008WJ-Hj
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 06:19:16 +0000
X-Inumbo-ID: 41768c26-d551-11ea-aef8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41768c26-d551-11ea-aef8-12813bfff9fa;
 Mon, 03 Aug 2020 06:19:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A084AF38;
 Mon,  3 Aug 2020 06:19:30 +0000 (UTC)
Subject: Re: [PATCH v3 3/4] Revert "xen/balloon: Fix crash when ballooning on
 x86 32 bit PAE"
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-4-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cb9783d8-ba48-f290-95b5-adbdb3900cfd@suse.com>
Date: Mon, 3 Aug 2020 08:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727091342.52325-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.20 11:13, Roger Pau Monne wrote:
> This reverts commit dfd74a1edfaba5864276a2859190a8d242d18952.
> 
> This has been fixed by commit dca4436d1cf9e0d237c which added the out
> of bounds check to __add_memory, so that trying to add blocks past
> MAX_PHYSMEM_BITS will fail.
> 
> Note the check in the Xen balloon driver was bogus anyway, as it
> checked the start address of the resource, but it should instead test
> the end address to assert the whole resource falls below
> MAX_PHYSMEM_BITS.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Pushed to: xen/tip.git for-linus-5.9


Juergen

