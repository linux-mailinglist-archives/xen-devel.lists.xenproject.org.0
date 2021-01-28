Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F8307B79
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 17:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77269.139846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ab7-0007k2-6F; Thu, 28 Jan 2021 16:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77269.139846; Thu, 28 Jan 2021 16:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ab7-0007jd-2j; Thu, 28 Jan 2021 16:56:45 +0000
Received: by outflank-mailman (input) for mailman id 77269;
 Thu, 28 Jan 2021 16:56:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Ab5-0007jY-TL
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:56:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e46d4b9-faf8-4476-ac61-67f052da7a26;
 Thu, 28 Jan 2021 16:56:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AC67AD62;
 Thu, 28 Jan 2021 16:56:42 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1e46d4b9-faf8-4476-ac61-67f052da7a26
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611853002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7yikDNVSBAftQaS8amHsmZhu5qRTbQy3uQQUcoKwhQ=;
	b=BaFHnNg8luJeOOuETYkpHNMoce63IHS6ZuUzwVKlq9nBupzfrfmHDqSKdapgg2fYSU30Xo
	l4RXaTlY2yIgh682zKLazuZYvykzcKRadhU4G5SbSAOummRoztjopRJNplLfEr3tUaq1LX
	6tYUAHWA9S5Wuj2yFgeB2fouWwlxKDA=
Subject: Re: [PATCH] x86/HVM: re-order error path of hvm_domain_initialise()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57a95580-bae0-ac76-fb4c-e1db85da4d5f@suse.com>
 <55b43ce7-1fdc-9238-6eba-3c7c0377bea0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eda7f13-b624-ef18-539a-c7f98f997184@suse.com>
Date: Thu, 28 Jan 2021 17:56:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <55b43ce7-1fdc-9238-6eba-3c7c0377bea0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 17:51, Andrew Cooper wrote:
> On 28/01/2021 14:40, Jan Beulich wrote:
>> hvm_destroy_all_ioreq_servers(), called from
>> hvm_domain_relinquish_resources(), invokes relocate_portio_handler(),
>> which uses d->arch.hvm.io_handler. Defer freeing of this array
>> accordingly on the error path of hvm_domain_initialise().
>>
>> Similarly rtc_deinit() requires d->arch.hvm.pl_time to still be around,
>> or else an armed timer structure would get freed, and that timer never
>> get killed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> We may want to consider moving the other two XFREE()s later as well,
>> if only to be on the safe side.
> 
> Wherever possible, I want to move stuff like this into the idempotent
> domain_teardown()/_domain_destroy() logic, although I suspect you want
> this suitable for backport as well?

This and I didn't want it more involved than necessary at this point.

Jan

