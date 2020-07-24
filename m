Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEE22BEFF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 09:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jys2y-0003RW-TG; Fri, 24 Jul 2020 07:23:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jys2x-0003RR-8G
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 07:23:11 +0000
X-Inumbo-ID: 86d9bdea-cd7e-11ea-87e3-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86d9bdea-cd7e-11ea-87e3-bc764e2007e4;
 Fri, 24 Jul 2020 07:23:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3052CB03D;
 Fri, 24 Jul 2020 07:23:18 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Make the PV default WRMSR path match the HVM
 default
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200723182626.7500-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a5f2c67-f494-e682-1712-0f3f431ce5e7@suse.com>
Date: Fri, 24 Jul 2020 09:23:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723182626.7500-1-andrew.cooper3@citrix.com>
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

On 23.07.2020 20:26, Andrew Cooper wrote:
> The current HVM default for writes to unknown MSRs is to inject #GP if the MSR
> is unreadable, and discard writes otherwise. While this behaviour isn't great,
> the PV default is even worse, because it swallows writes even to non-readable
> MSRs.  i.e. A PV guest doesn't even get a #GP fault for a write to a totally
> bogus index.
> 
> Update PV to make it consistent with HVM, which will simplify the task of
> making other improvements to the default MSR behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

