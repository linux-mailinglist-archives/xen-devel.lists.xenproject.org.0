Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39D273B02
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 08:34:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKbrj-0002SE-Sp; Tue, 22 Sep 2020 06:33:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKbri-0002S9-9V
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 06:33:26 +0000
X-Inumbo-ID: a2743693-aa5b-4575-9980-34ed2eafa6e6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2743693-aa5b-4575-9980-34ed2eafa6e6;
 Tue, 22 Sep 2020 06:33:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600756403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i04OJd9+MO17YRU9WVwHTie+V3hk95UtDalVSzi1pCM=;
 b=ZW2VdmCXE9Rb/56O7kspoL+jg4eUPa/TFLQRZVg0uM5RIbIjmAQBWkPLVjbeIlk/lGTD18
 5MqR/em3IlxxUK8YQ11rADZGn1y4tMdahLrPs73fdCaHmXcOJsMwJHvBctITaZX61JY285
 +j2mc7f11brw7E0yZUnvZHVFAEkiAag=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4EAFABBE;
 Tue, 22 Sep 2020 06:33:59 +0000 (UTC)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf128337-699f-5942-b387-aa896000700c@suse.com>
Date: Tue, 22 Sep 2020 08:33:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
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

On 21.09.2020 21:02, Oleksandr wrote:
> On 14.09.20 17:17, Jan Beulich wrote:
>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/ioreq.h
>>> @@ -0,0 +1,82 @@
>>> +/*
>>> + * ioreq.h: Hardware virtual machine assist interface definitions.
>>> + *
>>> + * Copyright (c) 2016 Citrix Systems Inc.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify it
>>> + * under the terms and conditions of the GNU General Public License,
>>> + * version 2, as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>> + * more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License along with
>>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#ifndef __IOREQ_H__
>>> +#define __IOREQ_H__
>> __XEN_IOREQ_H__ please.
> 
> ok
> 
> 
>>
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/hvm/ioreq.h>
>> Is this include really needed here (i.e. by the code further down in
>> the file, and hence by everyone including this header), or rather
>> just in a few specific .c files?
> I think, just in few specific .c files. Which are x86/hvm/ioreq.c and 
> common/ioreq.c now and several other files later on (x86/hvm/dm.c, 
> arm/io.c, etc)
> Shall I include that header in these files instead?

Yes please, and please take this as a common guideline. While
private headers are often used to include things needed by all
of the (typically few) users of the header, non-private ones
shouldn't create unnecessary dependencies on other headers. As
you've said further up - you did run into hard to resolve
header dependencies yourself, and the practice of including
headers without strict need is one of the reasons of such
problems.

>>> +#define GET_IOREQ_SERVER(d, id) \
>>> +    (d)->arch.hvm.ioreq_server.server[id]
>> arch.hvm.* feels like a layering violation when used in this header.
> Got it. The only reason why GET_IOREQ_SERVER is here is inline 
> get_ioreq_server(). I will make it non-inline and move both to 
> common/ioreq.c.

Which won't make the layering violation go away. It's still
common rather than per-arch code then. As suggested elsewhere,
I think the whole ioreq_server struct wants to move into
struct domain itself, perhaps inside a new #ifdef (iirc one of
the patches introduces a suitable Kconfig option). This goes
alongside my suggestion to drop the "hvm" prefixes and infixes
from involved function names.

Jan

