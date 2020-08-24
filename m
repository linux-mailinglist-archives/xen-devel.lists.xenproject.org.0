Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054AD24FE88
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 15:06:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kACBE-00007P-Bv; Mon, 24 Aug 2020 13:06:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kACBD-00007K-77
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:06:31 +0000
X-Inumbo-ID: 0bf85d43-0150-4d19-b4be-1254483fc686
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bf85d43-0150-4d19-b4be-1254483fc686;
 Mon, 24 Aug 2020 13:06:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67888B01E;
 Mon, 24 Aug 2020 13:06:59 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <7176ab91-d7c8-ccb0-cfa5-724c0687b454@suse.com>
 <cf64e65c-9de9-8626-7890-152b546c0dda@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ab4e2da-ca9c-4121-0369-36faf953fe5e@suse.com>
Date: Mon, 24 Aug 2020 15:06:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cf64e65c-9de9-8626-7890-152b546c0dda@citrix.com>
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

On 24.08.2020 15:00, Andrew Cooper wrote:
> On 24/08/2020 13:34, Jan Beulich wrote:
>> While in most cases code ahead of the invocation of set_gpfn_from_mfn()
>> deals with shared pages, at least in set_typed_p2m_entry() I can't spot
>> such handling (it's entirely possible there's code missing there). Let's
>> try to play safe and add an extra check.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I agree that this is an improvement.
> 
> Therefore, tentatively Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but - what do I do with a tentative ack? Take it as a "normal"
one, or not take it at all?

> However, I don't think it is legitimate for set_gpfn_from_mfn() to be
> overriding anything.
> 
> IMO, we should be asserting something like (pfn == SHARED_M2P_ENTRY) ==
> (d == dom_cow).
> 
> Any code not passing this properly is almost certainly broken anyway,
> and fixing up behind its back like this doesn't feel like a clever idea
> (in debug builds at least).

As said on v1: I agree in principle, but I'd like such a change to be
made by the mem-sharing maintainer(s), so we wouldn't notice fallout
only several months or years later. Tamas - would you be up for this?

Jan

