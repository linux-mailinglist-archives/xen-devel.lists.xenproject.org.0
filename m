Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917AE26100B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 12:37:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFazY-0007XS-Dk; Tue, 08 Sep 2020 10:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFazX-0007XN-SJ
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 10:36:47 +0000
X-Inumbo-ID: 0e6c2edd-2b72-4269-84b4-40cbbe3f1f03
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e6c2edd-2b72-4269-84b4-40cbbe3f1f03;
 Tue, 08 Sep 2020 10:36:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 007C3ABA2;
 Tue,  8 Sep 2020 10:36:45 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Drop assertions from svm_load_segs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200908100803.8533-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b103b28-537a-1bad-d844-459a36d142d5@suse.com>
Date: Tue, 8 Sep 2020 12:36:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908100803.8533-1-andrew.cooper3@citrix.com>
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

On 08.09.2020 12:08, Andrew Cooper wrote:
> OSSTest has shown an assertion failure:
> http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log
> 
> These assertions were never appropriate, as they rule out legal (and, as it
> turns out, sensible perf-wise) inputs based on an expectation of how the sole
> caller would behave.

I wouldn't put it this way - not coming here was a requirement in
the old logic, when we expected non-null selectors to remain in
sync with the GDT/LDT. But yes, they needs to be dropped now.

> Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")

With your S-o-b added
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

