Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8535C239F89
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 08:19:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Tnh-0008RO-FN; Mon, 03 Aug 2020 06:18:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2Tng-0008RJ-Ug
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 06:18:20 +0000
X-Inumbo-ID: 1ffda818-d551-11ea-aef8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ffda818-d551-11ea-aef8-12813bfff9fa;
 Mon, 03 Aug 2020 06:18:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16439AF38;
 Mon,  3 Aug 2020 06:18:34 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] xen/balloon: fix accounting in
 alloc_xenballooned_pages error path
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-2-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <11ba709b-6b9f-ff87-708f-60dd5200dcde@suse.com>
Date: Mon, 3 Aug 2020 08:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727091342.52325-2-roger.pau@citrix.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.20 11:13, Roger Pau Monne wrote:
> target_unpopulated is incremented with nr_pages at the start of the
> function, but the call to free_xenballooned_pages will only subtract
> pgno number of pages, and thus the rest need to be subtracted before
> returning or else accounting will be skewed.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Cc: stable@vger.kernel.org

Pushed to xen/tip.git for-linus-5.9


Juergen

