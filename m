Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE672CF351
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 18:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44991.80463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klF8q-0005ma-6W; Fri, 04 Dec 2020 17:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44991.80463; Fri, 04 Dec 2020 17:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klF8q-0005mD-37; Fri, 04 Dec 2020 17:45:12 +0000
Received: by outflank-mailman (input) for mailman id 44991;
 Fri, 04 Dec 2020 17:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR05=FI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1klF8o-0005m8-N7
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 17:45:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b76e0de4-8c5f-4e5a-9747-ace8915f83b0;
 Fri, 04 Dec 2020 17:45:09 +0000 (UTC)
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
X-Inumbo-ID: b76e0de4-8c5f-4e5a-9747-ace8915f83b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607103909;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OBBGy0WLqKjT3nvC12cDtX+iMRfhvEvkV/BunmaHmXs=;
  b=N/ZyKn400D5qbgflR4ecqWQZxuNBTFBl/3dzOWjg0rVW31q4zK0UlJGP
   jaAXuJUrxMS+irXMFTarPifwv8WkxRhSURSqx4ks+bLIBO6B31NUeBCtM
   DErVmuVY2ECGmdNxJEEKIrQ6g404sAAmLMIXxrhX8uO30zHiHPX9hb+kI
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rsTt0SrV/L0VbMoEC1QBaTjtHWTfhbFKTXSapBcp3SzNNvCyGkaFW/sV3UGGIn8iTfN3i98Vlz
 dM23wto49vc59CSEVCJOIkVPNXHeNdjyBpqBTeS6SDjDOA8Rj9/2WHhYK+r+96qf1RNmPT+E+/
 phR3QKxHNoXbsWuweVn26unYuQZ39a43vnX4sZQYYLIsg8oGihWWKD5wYVzd1CmsuQwl3cbAvN
 wgwWWmJ1irJu0pM/H+s/UyLGdsTBxym437AgW0O4a6TTmyo/WurNIJiIgHn+ni2VlJvWOnVLaG
 mHs=
X-SBRS: 5.1
X-MesageID: 32902315
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,393,1599537600"; 
   d="scan'208";a="32902315"
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	<paul@xen.org>, 'Paul Durrant' <pdurrant@amazon.com>, 'Eslam Elnikety'
	<elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu'
	<wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>, 'George Dunlap'
	<george.dunlap@citrix.com>, 'Christian Lindig' <christian.lindig@citrix.com>,
	'David Scott' <dave@recoil.org>, 'Volodymyr Babchuk'
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
 <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
 <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
 <5de9f051-4071-4e09-528c-c1fb8345dc25@citrix.com>
 <alpine.DEB.2.21.2012040940160.32240@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7184a2de-f711-9683-3db6-7b880def022d@citrix.com>
Date: Fri, 4 Dec 2020 17:45:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012040940160.32240@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 04/12/2020 17:41, Stefano Stabellini wrote:
>>> FAOD, I am sure there might be other features that need to be
>>> disabled. But we have to start somewhere :).
>> Absolutely top of the list, importance wise, is so we can test different
>> configurations, without needing to rebuild the hypervisor (and to a
>> lesser extent, without having to reboot).
>>
>> It is a mistake that events/grants/etc were ever available unilaterally
>> in HVM guests.  This is definitely a step in the right direction (but I
>> thought it would be too rude to ask Paul to make all of those CDF flags
>> at once).
> +1
>
> For FuSa we'll need to be able to disable them at some point soon.

FWIW, I have a proper plan for this stuff, which start alongside the
fixed toolstack ABI, and will cover all aspects of optional
functionality in a domain.

~Andrew

