Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2333D737
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98364.186570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBUQ-0005tv-2B; Tue, 16 Mar 2021 15:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98364.186570; Tue, 16 Mar 2021 15:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBUP-0005tW-Uh; Tue, 16 Mar 2021 15:20:09 +0000
Received: by outflank-mailman (input) for mailman id 98364;
 Tue, 16 Mar 2021 15:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMBUN-0005tR-Q8
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:20:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1683cf10-62db-4629-860e-ff2d02998545;
 Tue, 16 Mar 2021 15:20:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BF47AE8F;
 Tue, 16 Mar 2021 15:20:06 +0000 (UTC)
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
X-Inumbo-ID: 1683cf10-62db-4629-860e-ff2d02998545
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615908006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M+EFSiJBAgv4LuOsaKjj5FZHTCKXDtFob7XJSKYZB0M=;
	b=hA5EyEXHc4OdJLTNBkUVaoK5S9TSh4DPP4wngGXB01tJUIHh7WFayO/WBSwU+2eAZoi8Ag
	48Z5tSt6tHv+e8WzTC7uP5JmUunwdcMh042FU+UW9mIJ+z153rVPTV2/0B8xYE3R69Y3q+
	cAWbLEaeG91d4mogUEqHxtE3UKEhpVw=
Subject: Re: libxl / xen-pciback interaction
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
 <fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <278e73d6-c3f4-b415-d98c-0e083d9414bd@suse.com>
Date: Tue, 16 Mar 2021 16:20:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.03.2021 16:03, Jürgen Groß wrote:
> On 16.03.21 15:27, Jan Beulich wrote:
>> All,
>>
>> while trying to test a pciback fix for how SR-IOV VFs get placed in the
>> guest PCI topology I noticed that my test VM would only ever see the 1st
>> out of 3 VFs that I passed to it. As it turns out, the driver watches
>> its own (backend) node, and upon first receiving notification it
>> evaluates state found in xenstore to set up the backend device.
>> Subsequently it switches the device to Initialised. After this switching,
>> not further instances of the watch triggering would do anything.
>>
>> In all instances I observed the watch event getting processed when the
>> "num_devs" node still reported 1. Trying to deal with this in libxl, by
>> delaying the writing of the "num_devs" node, led to a fatal error
>> ("num_devs" not being available to read) in the driver, causing the
>> device to move to Closing state. Therefore I decided that the issue has
>> to be addressed in the driver, resulting in a patch (reproduced below)
>> that I'm not overly happy with. I think the present libxl behavior is
>> wrong - it shouldn't trigger driver initialization without having fully
>> populated the information the driver is supposed to consume for its
>> device initialization. The only solution that I can think of, however,
>> doesn't look very appealing either: Instead of putting all pieces of the
>> data for one device in a transaction, make a single transaction cover
>> all devices collectively.
> 
> Any reason why you don't like this solution?

It would be quite a bit of code churn afaict (i.e. not an undertaking I
would like to start for code I'm not really familiar with), and error
cleanup might also become quite ugly.

> Its not as if there would
> be a large problem to be expected with using a single transaction for
> all PCI devices passed through (assuming you didn't mean to pack really
> all devices of the guest into that single transaction).

I meant all PCI devices; I can't even see a remote reason why all
devices regardless of type would want packing in a single transaction.

Jan

