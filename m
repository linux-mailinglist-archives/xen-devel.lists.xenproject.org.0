Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299831D49EC
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 11:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZWvE-0000lS-Ju; Fri, 15 May 2020 09:46:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZWvC-0000lN-MB
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 09:46:26 +0000
X-Inumbo-ID: f1343dc0-9690-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1343dc0-9690-11ea-ae69-bc764e2007e4;
 Fri, 15 May 2020 09:46:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26800AD31;
 Fri, 15 May 2020 09:46:27 +0000 (UTC)
Subject: Re: [PATCH v2 4/6] x86/mem-paging: add minimal lock order enforcement
 to p2m_mem_paging_prep()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <4af1f459-fe7a-cd61-43cb-fb3fa4f15c00@suse.com>
 <20200514162545.GI54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b9fd4ce-177f-6f57-8d24-8468fea0c299@suse.com>
Date: Fri, 15 May 2020 11:46:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514162545.GI54375@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 18:25, Roger Pau Monné wrote:
> On Thu, Apr 23, 2020 at 10:38:44AM +0200, Jan Beulich wrote:
>> While full checking is impossible (as the lock is being acquired/
>> released down the call tree), perform at least a lock level check.
> 
> I'm slightly confused, doesn't alloc_domheap_page already have it's
> own lock order checking?

I don't see how it would, as it doesn't (and can't legitimately)
include arch/x86/mm/mm-locks.h. Also maybe this comment in the
header clarifies it:

/* Page alloc lock (per-domain)
 *
 * This is an external lock, not represented by an mm_lock_t. However,
 * pod code uses it in conjunction with the p2m lock, and expecting
 * the ordering which we enforce here.
 * The lock is not recursive. */

Jan

