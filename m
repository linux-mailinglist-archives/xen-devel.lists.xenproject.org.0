Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F196223CBA1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:05:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3KyX-0007Ek-8G; Wed, 05 Aug 2020 15:05:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3KyW-0007Ef-5I
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:05:04 +0000
X-Inumbo-ID: 8c8dc02d-2d64-4142-aa53-d8bf646fba30
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c8dc02d-2d64-4142-aa53-d8bf646fba30;
 Wed, 05 Aug 2020 15:05:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41B76AC7F;
 Wed,  5 Aug 2020 15:05:19 +0000 (UTC)
Subject: Re: [PATCH] x86/ioapic: Fix fixmap error path logic in
 ioapic_init_mappings()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200805125109.7348-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eeafd4b6-6a57-8788-3bda-2a8eb999e860@suse.com>
Date: Wed, 5 Aug 2020 17:05:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200805125109.7348-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.08.2020 14:51, Andrew Cooper wrote:
> In the case that bad_ioapic_register() fails, the current position of idx++
> means that clear_fixmap(idx) will be called with the wrong index, and not
> clean up the mapping just created.
> 
> Increment idx as part of the loop, rather than midway through the loop body.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

