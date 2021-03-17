Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADE33F428
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 16:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98750.187515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMYLS-0002pP-OW; Wed, 17 Mar 2021 15:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98750.187515; Wed, 17 Mar 2021 15:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMYLS-0002p0-L7; Wed, 17 Mar 2021 15:44:26 +0000
Received: by outflank-mailman (input) for mailman id 98750;
 Wed, 17 Mar 2021 15:44:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nS5B=IP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMYLQ-0002ov-I2
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:44:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25b9a652-8330-4a56-8551-2eec20f2b215;
 Wed, 17 Mar 2021 15:44:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E91BEAE53;
 Wed, 17 Mar 2021 15:44:21 +0000 (UTC)
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
X-Inumbo-ID: 25b9a652-8330-4a56-8551-2eec20f2b215
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615995862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1hZjxPf3tQDtsQ35IKl5jQ5nhr0vTUqzjPVrG3qjetE=;
	b=XaC7+4xhCYFvlOUWNzHDcUZHCBB9MmBy+u/bMnPohAzUTyuwojA49JVABnlEYkftRgkZuw
	3kvO8Bp7I1ko8SnhaVM2CtuhJrijdGzbzD7t0IUhW+jfuFy8tBEvD2ywikTHD0oWeyaBvf
	ExtGswRQEwjtRGQ136cB7BvGYab6Bc4=
Subject: Re: libxl / xen-pciback interaction [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
 <fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
 <24658.7286.533794.293151@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11bf64f2-401d-03cb-59d7-a84b5c56552e@suse.com>
Date: Wed, 17 Mar 2021 16:44:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24658.7286.533794.293151@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.03.2021 16:12, Ian Jackson wrote:
> Jan Beulich writes ("libxl / xen-pciback interaction"):
>> while trying to test a pciback fix for how SR-IOV VFs get placed in the
>> guest PCI topology I noticed that my test VM would only ever see the 1st
>> out of 3 VFs that I passed to it. As it turns out, the driver watches
>> its own (backend) node, and upon first receiving notification it
>> evaluates state found in xenstore to set up the backend device.
>> Subsequently it switches the device to Initialised. After this switching,
>> not further instances of the watch triggering would do anything.
> 
> This makes it sound like this driver does not support hotplug.
> 
>> While doing this it also occurred to me as odd how "num_devs" is
>> actually used: It's not really a "number of devices" indicator, but
>> instead a "next device has this number" one: libxl reads the present
>> value and increments it by one for every new device. Destroying
>> (hot-unplugging) of devices doesn't have any effect on the value.
> 
> But this makes it sound like the driver *does* support hotplug.
> 
> How does what libxl is doing differ from a setup, immediately followed
> by a hot-add ?

In the hot-add case libxl drives things through Reconfiguring state.
I'm not sure this would be an appropriate (and backwards compatible)
thing to do when initially populating xenstore.

Jan

