Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82388332175
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 09:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95263.179770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJYBs-0000j2-JU; Tue, 09 Mar 2021 08:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95263.179770; Tue, 09 Mar 2021 08:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJYBs-0000id-GA; Tue, 09 Mar 2021 08:58:08 +0000
Received: by outflank-mailman (input) for mailman id 95263;
 Tue, 09 Mar 2021 08:58:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0KO=IH=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1lJYBr-0000iY-5E
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 08:58:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8357a63c-dfda-463b-aa67-1c46e22341b8;
 Tue, 09 Mar 2021 08:58:06 +0000 (UTC)
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
X-Inumbo-ID: 8357a63c-dfda-463b-aa67-1c46e22341b8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615280286;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ucEyClNY7Tik8Yk7WI9RZer5oJR2JMMqQHVmFQC9FDE=;
  b=X15DapsJP8tQjm69+OumI2H0mxmoSMMlW1JRPE1zU2KhkjNJQ06qdFd7
   46HilvL9dVxvIpC41RFUN+xVqBg6yF1Gc0UT8oWWnTDJHIjyCtcXh0rL/
   +XFF0Xlyr7d2hoUP/UjzoFJYA0h+3Nuus75IIywZ2PEBIgzjtb3wngDs/
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ifhYFTrHtVgd68c/XUGtBuHNjVRWo6LfOxF3XIc6nQNmeHSBls/AkrbJ89p6twz1cYS0qfTMYE
 8tm4S8oS6YFEHMWGJKuMwDAScH2anoCglpbi60qWwpVBQcBGKwPYm/A0aEeGbZ0OfFdfGCxVHB
 vTkzH4T5pVvmrmdoHlz1NFEYy/WZD59qZSW6ilFF8vw6GqX2T6sJmQVlPCrcKpYXvQI3Netdin
 SS2On1Z3Azsqs9QyW25t8LjPLwIcVK1udb23wbHb6LXikGmvqMqYehSQ5PxdYJL3zywqd/12FN
 xtU=
X-SBRS: 4.0
X-MesageID: 38751923
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38751923"
Subject: Re: [PATCH v4 2/3] xen/events: don't unmask an event channel when an
 eoi is pending
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, <stable@vger.kernel.org>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20210306161833.4552-1-jgross@suse.com>
 <20210306161833.4552-3-jgross@suse.com>
 <ff9fb99f-12ca-c04e-e4bc-1b1c67381cc2@oracle.com>
 <d6a1ab2e-4b77-7b14-e397-74aa71efb70d@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <b6d41422-47cf-956c-9c4a-98998c64b103@citrix.com>
Date: Tue, 9 Mar 2021 08:57:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d6a1ab2e-4b77-7b14-e397-74aa71efb70d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2021-03-09 05:14, Jürgen Groß wrote:
> On 08.03.21 21:33, Boris Ostrovsky wrote:
>>
>> On 3/6/21 11:18 AM, Juergen Gross wrote:
>>> An event channel should be kept masked when an eoi is pending for it.
>>> When being migrated to another cpu it might be unmasked, though.
>>>
>>> In order to avoid this keep three different flags for each event channel
>>> to be able to distinguish "normal" masking/unmasking from eoi related
>>> masking/unmasking and temporary masking. The event channel should only
>>> be able to generate an interrupt if all flags are cleared.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
>>> Reported-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>> V2:
>>> - introduce a lock around masking/unmasking
>>> - merge patch 3 into this one (Jan Beulich)
>>> V4:
>>> - don't set eoi masking flag in lateeoi_mask_ack_dynirq()
>>
>>
>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>
>>
>> Ross, are you planning to test this?
> 
> Just as another data point: With the previous version of the patches
> a reboot loop of a guest needed max 33 reboots to loose network in
> my tests (those were IIRC 6 test runs). With this patch version I
> stopped the test after about 1300 reboots without having seen any
> problems.
> 

Thanks, I'll test it today and get back to you.

Ross

