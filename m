Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07423CB91
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 16:46:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Kfd-0005Jv-C7; Wed, 05 Aug 2020 14:45:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3Kfb-0005Jq-LY
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 14:45:31 +0000
X-Inumbo-ID: 06460938-a0d4-4e11-be43-98d59004d314
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06460938-a0d4-4e11-be43-98d59004d314;
 Wed, 05 Aug 2020 14:45:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38121B717;
 Wed,  5 Aug 2020 14:45:46 +0000 (UTC)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f17bfb9-0c65-3903-42f4-2826baab2649@suse.com>
Date: Wed, 5 Aug 2020 16:45:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.08.2020 16:12, Julien Grall wrote:
> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>> --- /dev/null
>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>> @@ -0,0 +1,103 @@
>> +/*
>> + * hvm.h: Hardware virtual machine assist interface definitions.
>> + *
>> + * Copyright (c) 2016 Citrix Systems Inc.
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __ASM_ARM_HVM_IOREQ_H__
>> +#define __ASM_ARM_HVM_IOREQ_H__
>> +
>> +#include <public/hvm/ioreq.h>
>> +#include <public/hvm/dm_op.h>
>> +
>> +#define has_vpci(d) (false)
> 
> It feels to me this wants to be defined in vcpi.h.

On x86 it wants to live together with a bunch of other has_v*()
macros.

Jan

