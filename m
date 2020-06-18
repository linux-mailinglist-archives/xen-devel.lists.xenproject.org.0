Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2891FEC4D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 09:19:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jloot-0004f5-RH; Thu, 18 Jun 2020 07:18:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jloos-0004f0-4n
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 07:18:42 +0000
X-Inumbo-ID: efa0bfd4-b133-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa0bfd4-b133-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 07:18:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C2A5AD12;
 Thu, 18 Jun 2020 07:18:39 +0000 (UTC)
Subject: Re: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7c873ff-75f4-5917-b277-bd6bb18faac3@suse.com>
Date: Thu, 18 Jun 2020 09:18:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.06.2020 16:15, Andrew Cooper wrote:
> This is some work in light of IvyBridge not gaining microcode to combat SRBDS
> / XSA-320.  It is a mix of some work I'd planned for 4.15, and some patches
> posted already and delayed due to dependence's I'd discovered after-the-fact.
> 
> This provides a more user-friendly way of making IvyBridge safe by default
> without encountering migration incompatibilities.
> 
> In terms of functionality, it finishes the "fresh boot" vs "migrate/restore
> from pre-4.14" split in the libxc CPUID logic, and uses this to let us safely
> hide features by default without breaking the "divine what a guest may have
> seen previously" logic on migrate.
> 
> On top of that, we hide RDRAND by default to mitigate XSA-320.
> 
> Additionally, take the opportunity of finally getting this logic working to
> hide MPX by default (as posted previously), due to upcoming Intel timelines.
> 
> Request for 4.14.  The IvyBridge angle only became apparent after the public
> embargo on Tue 9th.  Otherwise, I would have made a concerted effort to get
> this logic sorted sooner and/or part of XSA-320 itself.
> 
> Strictly speaking, patches 1-4 aren't necessary, but without them the logic is
> very confusing to follow, particularly the reasoning about the safely of later
> changes.  As it is a simple set of transforms, we're better with them than
> without.
> 
> Also, the MPX patch isn't related to the RDRAND issue, but I was planning to
> get it into 4.14 already, until realising that the migration path was broken.
> Now that the path is fixed for the RDRAND issue, include the MPX patch as it
> pertains to future hardware compatibility (and would be backported to 4.14.1
> if it misses 4.14.0).

Just to be sure - it is my understanding that none of this can sensibly
be backported, even if it was nice for us to take care of the IvyBridge
situation on older trees as well.

Jan

