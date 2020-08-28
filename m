Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB925569C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 10:41:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBZwX-0002Wi-6Y; Fri, 28 Aug 2020 08:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBZwW-0002Wd-CG
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 08:41:04 +0000
X-Inumbo-ID: 5ab8419d-b8c4-4c03-a842-450a42f50990
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ab8419d-b8c4-4c03-a842-450a42f50990;
 Fri, 28 Aug 2020 08:41:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7774CACC5;
 Fri, 28 Aug 2020 08:41:35 +0000 (UTC)
Subject: Re: [PATCH] x86/intel: Expose MSR_ARCH_CAPS to dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <amc96@cam.ac.uk>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200827193713.4962-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e24c49ce-82f4-955d-3a7b-03ffd5aa4144@suse.com>
Date: Fri, 28 Aug 2020 10:41:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827193713.4962-1-andrew.cooper3@citrix.com>
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

On 27.08.2020 21:37, Andrew Cooper wrote:
> The overhead of (the lack of) MDS_NO alone has been measured at 30% on some
> workloads.  While we're not in a position yet to offer MSR_ARCH_CAPS generally
> to guests, dom0 doesn't migrate, so we can pass a subset of hardware values
> straight through.
> 
> This will cause PVH dom0's not to use KPTI by default, and all dom0's not to
> use VERW flushing by default,

To avoid VERW, shouldn't you also expose SKIP_L1DFL?

Jan

