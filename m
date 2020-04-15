Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781B1AA953
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOie5-0007cJ-9V; Wed, 15 Apr 2020 14:04:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOie4-0007cD-0D
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:04:04 +0000
X-Inumbo-ID: f57bf7f2-7f21-11ea-8a52-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f57bf7f2-7f21-11ea-8a52-12813bfff9fa;
 Wed, 15 Apr 2020 14:04:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6211FAA7C;
 Wed, 15 Apr 2020 14:04:00 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] x86/shim: map and unmap page tables in
 replace_va_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586951696.git.hongyxia@amazon.com>
 <37ad7487bc6e6f76e2082c0b42b4cf819007f513.1586951696.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5ef9470-cd30-5373-8367-b19d757c48e9@suse.com>
Date: Wed, 15 Apr 2020 16:03:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <37ad7487bc6e6f76e2082c0b42b4cf819007f513.1586951696.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 13:59, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Also, introduce lYe_from_lXe() macros which do not rely on the direct
> map when walking page tables. Unfortunately, they cannot be inline
> functions due to the header dependency on domain_page.h, so keep them as
> macros just like map_lYt_from_lXe().
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> ---
> Changed in v3:
> - use unmap_domain_page() instead of the macro in several places.
> - also introduce l1e_from_l2e().
> - add _ prefix in macros to avoid aliasing.

Why prefixes, violating name space rules? In my reply to v2
requesting the adjustment I specifically said "suffixes".

Jan

