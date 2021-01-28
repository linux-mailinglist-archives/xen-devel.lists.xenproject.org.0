Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB53076EB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 14:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77033.139303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57C7-0006Hi-Ts; Thu, 28 Jan 2021 13:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77033.139303; Thu, 28 Jan 2021 13:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57C7-0006HJ-QQ; Thu, 28 Jan 2021 13:18:43 +0000
Received: by outflank-mailman (input) for mailman id 77033;
 Thu, 28 Jan 2021 13:18:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l57C6-0006HE-90
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 13:18:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b70bd841-e873-44a7-b358-995716f89a35;
 Thu, 28 Jan 2021 13:18:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F046AEA3;
 Thu, 28 Jan 2021 13:18:40 +0000 (UTC)
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
X-Inumbo-ID: b70bd841-e873-44a7-b358-995716f89a35
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611839920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYkPWHaKhct+1v5Sml7YnuqAcl/k0wQI/BCN2u6qWXU=;
	b=JTR9AzIAcu8tChFF14Gbx1GrP2Jy8wn4byWwyRSOX5Kt4QXnDXteso2FgPg4FPoSF7O2Xh
	9wramTtz1xmPjzlHk/P4ic0VL9JLrZT9S788r20e/C3x/WS8BSYarLADDSHyofdg88KnSS
	Pd2iQJwviYkb0YQ7o4K0wSNhJ8c8xZU=
Subject: Re: [PATCH V5 09/22] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-10-git-send-email-olekstysh@gmail.com>
 <d83c0736-c5cb-23e1-1cb3-fefe6907f091@suse.com>
 <19fa20ec-739b-250a-19f5-c4cbafd632fa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46d8a845-8cbc-365b-1032-f079bf1e7d67@suse.com>
Date: Thu, 28 Jan 2021 14:18:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <19fa20ec-739b-250a-19f5-c4cbafd632fa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 13:06, Oleksandr wrote:
> 
> On 28.01.21 12:52, Jan Beulich wrote:
> 
> Hi Jan
> 
>> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/dm.h
>>> @@ -0,0 +1,41 @@
>>> +/*
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
>>> +#ifndef __XEN_DM_H__
>>> +#define __XEN_DM_H__
>>> +
>>> +#include <xen/sched.h>
>>> +
>>> +struct dmop_args {
>>> +    domid_t domid;
>>> +    unsigned int nr_bufs;
>>> +    /* Reserve enough buf elements for all current hypercalls. */
>>> +    struct xen_dm_op_buf buf[2];
>> So this is then the patch where the public header needs including,
>> to satisfy this use of a struct declared there independent of what
>> xen/sched.h includes. In fact public/xen.h needs including here
>> as well, I think, for domid_t. Otoh I can't see why you include
>> xen/sched.h.
> 
> Yes, xen/sched.h indeed doesn't need to be included here, I mentioned 
> that we could just replace
> 
> it by xen/types.h (this is the minimum what we need here I think). As I 
> understand public/xen.h is already included by public/hvm/dm_op.h...

But that's something you better wouldn't depend on anywhere.
What one public header does or does not include may change over
time.

Jan

