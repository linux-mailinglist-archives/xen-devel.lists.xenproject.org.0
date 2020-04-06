Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC119FB7C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVX5-0000I6-FM; Mon, 06 Apr 2020 17:27:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLVX4-0000Ht-9V
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:27:34 +0000
X-Inumbo-ID: e636e806-782b-11ea-800d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e636e806-782b-11ea-800d-12813bfff9fa;
 Mon, 06 Apr 2020 17:27:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 04FA6BD06;
 Mon,  6 Apr 2020 17:27:30 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] xen/x86: ioapic: Simplify ioapic_init()
To: Julien Grall <julien@xen.org>
References: <20200404102656.29730-1-julien@xen.org>
 <20200404102656.29730-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7e761a8-118a-3d84-16a2-5428bc0d22c8@suse.com>
Date: Mon, 6 Apr 2020 15:24:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404102656.29730-4-julien@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.04.2020 12:26, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 9facd54a45 "x86/ioapic: Add register level checks to detect
> bogus io-apic entries", Xen is able to cope with IO APICs not mapped in
> the fixmap.
> 
> Therefore the whole logic to allocate a fake page for some IO APICs is
> unnecessary.
> 
> With the logic removed, the code can be simplified a lot as we don't
> need to go through all the IO APIC if SMP has not been detected or a
> bogus zero IO-APIC address has been detected.
> 
> To avoid another level of tabulation, the simplification is now moved in
> its own function.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

