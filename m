Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2820B385
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 16:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopJ8-0008KJ-4R; Fri, 26 Jun 2020 14:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jopJ7-0008K8-Av
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 14:26:21 +0000
X-Inumbo-ID: 01298408-b7b9-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01298408-b7b9-11ea-bca7-bc764e2007e4;
 Fri, 26 Jun 2020 14:26:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0554AC50;
 Fri, 26 Jun 2020 14:26:19 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible
 with CET Shadow Stacks
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20200626122408.19151-1-andrew.cooper3@citrix.com>
 <4bd8ab3e-37d0-fde9-10a3-b6b2f9ca4da6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29ae3614-a73e-de01-f10f-8f3a32c3372a@suse.com>
Date: Fri, 26 Jun 2020 16:26:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4bd8ab3e-37d0-fde9-10a3-b6b2f9ca4da6@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 15:59, Ross Lagerwall wrote:
> On 2020-06-26 13:24, Andrew Cooper wrote:
>> @@ -56,18 +57,48 @@ int arch_livepatch_safety_check(void)
>>      return -EBUSY;
>>  }
>>  
>> -int arch_livepatch_quiesce(void)
>> +int noinline arch_livepatch_quiesce(void)
>>  {
>> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
>> +    if ( cpu_has_xen_shstk )
> 
> Should this be:
>     if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
> 
> to match arch_livepatch_revive?

While it may look a little asymmetric, I think it's preferable
to is IS_ENABLED() only where really needed, i.e. here it
guarding code that otherwise may not build.

Jan

