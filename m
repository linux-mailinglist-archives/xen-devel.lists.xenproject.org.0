Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E419D20B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 10:22:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKHai-000782-V4; Fri, 03 Apr 2020 08:22:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKHai-00077v-9u
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 08:22:16 +0000
X-Inumbo-ID: 38effdb3-7584-11ea-bcc7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38effdb3-7584-11ea-bcc7-12813bfff9fa;
 Fri, 03 Apr 2020 08:22:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D98EAEAA;
 Fri,  3 Apr 2020 08:22:13 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/p2m: make p2m_remove_page()'s parameters type-safe
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
 <858f22e3-0f4f-08f0-ef67-b8ce67146537@suse.com>
 <ae425c2f-0297-4944-5bd5-03ccdab8fdce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b282f3a8-dd97-8b5b-81ad-0b3673d3621a@suse.com>
Date: Fri, 3 Apr 2020 10:22:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ae425c2f-0297-4944-5bd5-03ccdab8fdce@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 00:43, Andrew Cooper wrote:
> On 01/04/2020 12:39, Jan Beulich wrote:
>> @@ -790,21 +789,23 @@ p2m_remove_page(struct p2m_domain *p2m,
>>                                            &cur_order, NULL);
>>  
>>          if ( p2m_is_valid(t) &&
>> -             (!mfn_valid(_mfn(mfn)) || mfn + i != mfn_x(mfn_return)) )
>> +             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
>>              return -EILSEQ;
>>  
>> -        i += (1UL << cur_order) - ((gfn_l + i) & ((1UL << cur_order) - 1));
>> +        i += (1UL << cur_order) -
>> +             (gfn_x(gfn_add(gfn, i)) & ((1UL << cur_order) - 1));
> 
> We're gaining an number of expressions starting to look like this, but
> honestly, "gfn_x(gfn) + i" is equally typesafe, shorter, and easier to
> read IMO.

Good point - in recent reviews I've commented to the same effect
on patches from Julien. This patch is way too old for me to have
recalled that I did like this here, too. Will switch (also
elsewhere in case I find more that I introduce).

Jan

