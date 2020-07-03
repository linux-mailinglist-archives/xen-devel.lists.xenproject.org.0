Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D0213846
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:57:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrIQw-0001Ol-2U; Fri, 03 Jul 2020 09:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jrIQv-0001Og-1e
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:56:37 +0000
X-Inumbo-ID: 7b510e18-bd13-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b510e18-bd13-11ea-bb8b-bc764e2007e4;
 Fri, 03 Jul 2020 09:56:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9023BB1FA;
 Fri,  3 Jul 2020 09:56:35 +0000 (UTC)
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
 <20200702090047.GX735@Air-de-Roger>
 <1505813895.18300396.1593707008144.JavaMail.zimbra@cert.pl>
 <20200703094438.GY735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5335c2e-da13-28de-002b-e93dd68a0a11@suse.com>
Date: Fri, 3 Jul 2020 11:56:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703094438.GY735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.07.2020 11:44, Roger Pau Monné wrote:
> On Thu, Jul 02, 2020 at 06:23:28PM +0200, Michał Leszczyński wrote:
>> ----- 2 lip 2020 o 11:00, Roger Pau Monné roger.pau@citrix.com napisał(a):
>>
>>> On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
>>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>>> index 59bdc28c89..7b8289d436 100644
>>>> --- a/xen/include/public/domctl.h
>>>> +++ b/xen/include/public/domctl.h
>>>> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>>>>      uint32_t max_evtchn_port;
>>>>      int32_t max_grant_frames;
>>>>      int32_t max_maptrack_frames;
>>>> +    uint8_t vmtrace_pt_order;
>>>
>>> I've been thinking about this, and even though this is a domctl (so
>>> not a stable interface) we might want to consider using a size (or a
>>> number of pages) here rather than an order. IPT also supports
>>> TOPA mode (kind of a linked list of buffers) that would allow for
>>> sizes not rounded to order boundaries to be used, since then only each
>>> item in the linked list needs to be rounded to an order boundary, so
>>> you could for example use three 4K pages in TOPA mode AFAICT.
>>>
>>> Roger.
>>
>> In previous versions it was "size" but it was requested to change it
>> to "order" in order to shrink the variable size from uint64_t to
>> uint8_t, because there is limited space for xen_domctl_createdomain
>> structure.
> 
> It's likely I'm missing something here, but I wasn't aware
> xen_domctl_createdomain had any constrains regarding it's size. It's
> currently 48bytes which seems fairly small.

Additionally I would guess a uint32_t could do here, if the value
passed was "number of pages" rather than "number of bytes"?

Jan

