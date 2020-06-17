Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6441FCE0D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:04:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXkD-0002vG-NL; Wed, 17 Jun 2020 13:04:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlXkC-0002v8-8o
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:04:44 +0000
X-Inumbo-ID: 1c030a76-b09b-11ea-b9e4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c030a76-b09b-11ea-b9e4-12813bfff9fa;
 Wed, 17 Jun 2020 13:04:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2F4FAAC7;
 Wed, 17 Jun 2020 13:04:45 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
 <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
Date: Wed, 17 Jun 2020 15:04:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.06.2020 15:00, Tamas K Lengyel wrote:
> On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>> If there are code paths of both kinds, which approach to use in
>> vmx_load_pdptrs() may need to be chosen based on what
>> paging_locked_by_me() returns. Or perhaps an unlocked query is
>> fine in either case?
> 
> Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
> fine. But at that point what is the reason for having the lock
> ordering at all? Why not just have a single recursive lock and avoid
> issues like this altogether?

With just a single lock, contention problems we already know we
have would be even worse. When the current locking model was
introduced, there was actually a plan to make gfn_lock() more
fine-grained (i.e. not simply "de-generate" to p2m_lock()), for
example.

Jan

