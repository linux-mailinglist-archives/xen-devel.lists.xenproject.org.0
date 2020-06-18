Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640601FF263
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 14:51:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlu18-0000Uo-Jd; Thu, 18 Jun 2020 12:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlu16-0000Ui-Up
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:51:40 +0000
X-Inumbo-ID: 73e28290-b162-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73e28290-b162-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 12:51:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21086ACAD;
 Thu, 18 Jun 2020 12:51:38 +0000 (UTC)
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
 <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
 <832789003.9534743.1592478099057.JavaMail.zimbra@cert.pl>
 <20200618115519.GL735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9924a5d9-b851-257a-9a6a-7a5712898a71@suse.com>
Date: Thu, 18 Jun 2020 14:51:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618115519.GL735@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 13:55, Roger Pau Monné wrote:
> On Thu, Jun 18, 2020 at 01:01:39PM +0200, Michał Leszczyński wrote:
>> It was previously stated that:
>>
>>> PVH or HVM domain
>>> won't be able to use this interface since it has no way to request the
>>> mapping of a specific mfn into it's physmap.
>>
>> but however, taking LibVMI as an example:
>>
>> https://github.com/libvmi/libvmi/blob/c461e20ae88bc62c08c27f50fcead23c27a30f9e/libvmi/driver/xen/xen.c#L51
>>
>> An essential abstraction xen_get_memory() relies on xc_map_foreign_range(). Doesn't this mean that it's not usable from PVH or HVM domains, or did I got it all wrong?
> 
> That was my fault, so the buffer mfns are assigned to Xen, and then
> the Xen domain ID is used to map those, which should work on both PV
> and HVM (or PVH).
> 
> I still think using XENMEM_acquire_resource might be better, but I
> would let others comment.

+1

Jan

