Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166301998C4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJI0g-0007Ka-09; Tue, 31 Mar 2020 14:36:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJI0e-0007KV-C6
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:36:56 +0000
X-Inumbo-ID: 11a5cbb6-735d-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11a5cbb6-735d-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 14:36:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC37BAF1D;
 Tue, 31 Mar 2020 14:36:54 +0000 (UTC)
Subject: Re: [PATCH 05/11] x86/ucode/amd: Overhaul the equivalent cpu table
 handling completely
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <53fe152f-c503-ba1f-a64b-d6685ea018fd@suse.com>
Date: Tue, 31 Mar 2020 16:36:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331100531.4294-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 31.03.2020 12:05, Andrew Cooper wrote:
> We currently copy the entire equivalency table, and the single correct
> microcode.  This is not safe to heterogeneous scenarios, and as Xen doesn't
> support such situations to being with, can be used to simplify things further.

s/being/begin/ ?

> The CPUID.1.EAX => processor_rev_id mapping is fixed for an individual part.
> We can cache the single appropriate entry on first discovery, and forgo
> duplicating the entire table.
> 
> Alter install_equiv_cpu_table() to be scan_equiv_cpu_table() which is
> responsible for checking the equivalency table and caching appropriate
> details.  It now has a check for finding a different mapping (which indicates
> that one of the tables we've seen is definitely wrong).
> 
> A return value of -ESRCH is now used to signify "everything fine, but nothing
> applicable for the current CPU", which is used to select the
> container_fast_forward() path.
> 
> Drop the printk(), as each applicable error path in scan_equiv_cpu_table()
> already prints diagnostics.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

