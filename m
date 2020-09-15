Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE426A061
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 10:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI5z7-0003GF-Ch; Tue, 15 Sep 2020 08:06:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pJ4M=CY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kI5z6-0003G9-6n
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 08:06:40 +0000
X-Inumbo-ID: 4ae445b8-68b3-47b7-8155-e03d6f728739
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ae445b8-68b3-47b7-8155-e03d6f728739;
 Tue, 15 Sep 2020 08:06:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5C84AD2C;
 Tue, 15 Sep 2020 08:06:53 +0000 (UTC)
Subject: Re: libxenguest and xenguest.h
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <7995d80f-336a-90a3-f431-b18748fbcff5@suse.com>
 <1d4fb223-0800-452b-54fc-5db1db74be2f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7bf70edc-22c9-bd04-9e7c-d6cc083c3ac5@suse.com>
Date: Tue, 15 Sep 2020 10:06:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1d4fb223-0800-452b-54fc-5db1db74be2f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.09.20 09:55, Jan Beulich wrote:
> On 15.09.2020 07:18, Jürgen Groß wrote:
>> Andy has reported a libxenguest related build failure of qemu when
>> building qemu outside the Xen build environment. Problem is xenguest.h
>> now including xenctrl_dom.h, which is including xen/libelf/libelf.h.
>>
>> The underlying problem is that libxenguest is basically offering some
>> "official" functions via xenguest.h, while some other functions are
>> only Xen internally usable and are defined in xenctrl_dom.h.
>>
>> This is a rather weird construction and I'm seeing the following
>> solutions:
>>
>> 1. Make xen/include/xen/libelf.h a public header (or split the parts
>>      needed by xenguest.h into a public header)
> 
> Besides being conceptually wrong imo, this could (afaict) cause name
> space issues to consumers. This definitely gets a -1 from me, if not
> a -2.
> 
>> 2. Reflect the two parts of libxenguest by carving out the xenctrl_dom.h
>>      defined parts into a new library not made public
>>
>> 3. Make the xenctrl_dom.h interfaces internal again by not adding it to
>>      the installed headers
> 
> This option would seem to imply that qemu has no real need to include
> this header, as otherwise how would this address the build issue?

In fact qemu doesn't need to include xenguest.h at all, but this was
just how the problem was discovered.

So before my patches xenctrl_dom.h (or xc_dom.h as it was named at that
time) was included only from Xen sources (libxenguest, libxl, pvgrub).
Basically there was a rather large part of libxenguest ot really usable
by anyone outside the Xen build system. External users could use only
the interfaces which are declared in xenguest.h.


Juergen

