Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3536D218
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 08:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119014.225315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbdUP-0008LV-74; Wed, 28 Apr 2021 06:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119014.225315; Wed, 28 Apr 2021 06:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbdUP-0008L6-3t; Wed, 28 Apr 2021 06:16:01 +0000
Received: by outflank-mailman (input) for mailman id 119014;
 Wed, 28 Apr 2021 06:16:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbdUO-0008L1-0y
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 06:16:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5997129-3df2-44ca-8525-807cd1adedd5;
 Wed, 28 Apr 2021 06:15:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 587E5B038;
 Wed, 28 Apr 2021 06:15:57 +0000 (UTC)
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
X-Inumbo-ID: d5997129-3df2-44ca-8525-807cd1adedd5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619590557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfsbMaVbupruodGRfFDhlP9TcZdO7Ld22RhuGKVfXcY=;
	b=mi9yFLJzNe4vEclRIwp1doaP7IBPXBvbGzbdodbmt//VCjtZ2n+ZzvheaddqvjpxtNIqFd
	fNTZzYwlsNKMUfTIfAsD5ju7r8emDk+Xr6wRuByvcw7lMJABu6DwpoSZd7dKhlxfgambqb
	oGvjJRcGgMTLPMp6Np82p5PI0NYs7Ek=
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
To: Scott Davis <scott.davis@starlab.io>, Scott Davis <scottwd@gmail.com>,
 Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
Date: Wed, 28 Apr 2021 08:15:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 00:00, Scott Davis wrote:
> On 4/27/21, 2:56 AM, Jan Beulich wrote:
>> On 26.04.2021 19:25, Scott Davis wrote:
>>> This patch modifies Xen's behavior when making devices assignable while the
>>> iommu=no-quarantine command line option is in effect. Currently this option
>>> only affects device deassignment, causing devices to get immediately assigned
>>> back to Dom0 instead of to the quarantine dom_io domain. This patch extends
>>> no-quarantine to device assignment as well, preventing devices from being
>>> assigned to dom_io when they are made assignable while no-quarantine is in
>>> effect.
>>
>> Well, the term "quarantine" to me means a safety action taken _after_
>> possible exposure to something "bad". Therefore I see this being specific
>> to device de-assignment as the logical thing. Hence if a mode like what
>> you describe was wanted, I don't think it should be the result of
>> "iommu=no-quarantine".
> 
> Sorry I'm a bit confused by this. Correct me if wrong, but my understanding is  
> that the purpose of assigning a device to dom_io on de-assignment is to protect  
> Dom0 from the effects of in-flight DMA operations initiated by a DomU. I assumed  
> that the purpose of (temporarily) assigning to dom_io on assignment was the same  
> but in reverse: protecting a DomU from Dom0-initiated ops. Is this not the case?

Well, no, not really. Dom0 is considered fully trusted for a variety of
reasons.

> Also, documentation and code already refer to the operation in question as a 
> "quarantine" (see xl command line docs and libxl__device_pci_assignable_add) 
> and to devices that have undergone it as being "quarantined" (see assign_device 
> in xen/drivers/passthrough/pci.c). So if that is not the correct term, there may 
> be some additional changes needed for consistency. Is there another name that 
> would be more appropriate?

I don't see what's wrong with the term for how things are currently. If
you talk about an adjustment to terminology to accompany your proposed
change - not sure.

> I would also point out that, currently, there does not appear to be a way for an 
> xl user to opt out of quarantine functionality in either direction other than by 
> manually making devices assignable. There is no xl command line flag to disable 
> it and iommu=no-quarantine will have no effect because any device that xl itself
> makes assignable will have the struct pci_dev.quarantine flag set, which 
> overrides iommu=no-quarantine. Is that intentional?

Not sure here either: It may also have been that it was assumed to not
be of interest. Paul?

> If I misunderstood and your objection is simply that "quarantine-on-assignment"  
> and "quarantine-on-deassignment" should be controllable by separate iommu  
> options, that's an easy enough change to make.

Yes, effectively it's that what I think things would want to be, if
"quarantine-on-assignment" is really something that we think is needed.
It would default to off imo.

> Although I think that might also 
> negate the need for/effect of struct pci_dev.quarantine as described above. If 
> that's what is desired, any thoughts on what the new option(s) should be called?

Following the extension to the command line option I'm putting in place
in "IOMMU: make DMA containment of quarantined devices optional" (which
I still need to get around to address review feedback for and resubmit),
I'd be inclined to suggest "iommu=quarantine=always" or
"iommu=quarantine=on-assign". Unless of course we'd prefer to have the
caller of the assignment operation have full control over the behavior
here anyway (in which case a command line option control simply is not
necessary).

Jan

