Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91456207525
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 16:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo5yF-0000Qv-S1; Wed, 24 Jun 2020 14:01:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo5yE-0000Qq-D6
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 14:01:46 +0000
X-Inumbo-ID: 3d0b08d0-b623-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d0b08d0-b623-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 14:01:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83F8DACA7;
 Wed, 24 Jun 2020 14:01:44 +0000 (UTC)
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Julien Grall <julien@xen.org>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
 <20200623172652.GU735@Air-de-Roger>
 <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
 <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
Date: Wed, 24 Jun 2020 16:01:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.06.2020 15:41, Julien Grall wrote:
> On 24/06/2020 11:12, Jan Beulich wrote:
>> On 23.06.2020 19:26, Roger Pau Monné wrote:
>>> I'm confused. Couldn't we switch from uint64_aligned_t to plain
>>> uint64_t (like it's currently on the Linux headers), and then use the
>>> compat layer in Xen to handle the size difference when called from
>>> 32bit environments?
>>
>> And which size would we use there? The old or the new one (breaking
>> future or existing callers respectively)? Meanwhile I think that if
>> this indeed needs to not be tools-only (which I still question),
> 
> I think we now agreed on a subthread that the kernel needs to know the 
> layout of the hypercall.
> 
>> then our only possible route is to add explicit padding for the
>> 32-bit case alongside the change you're already making.
> 
> AFAICT Linux 32-bit doesn't have this padding. So wouldn't it make 
> incompatible the two incompatible?

In principle yes. But they're putting the structure instance on the
stack, so there's not risk from Xen reading 4 bytes too many. I'd
prefer keeping the interface as is (i.e. with the previously
implicit padding made explicit) to avoid risking to break other
possible callers. But that's just my view on it, anyway ...

Jan

