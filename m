Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D99333851
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 10:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95921.181126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJuq7-0001pz-Al; Wed, 10 Mar 2021 09:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95921.181126; Wed, 10 Mar 2021 09:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJuq7-0001pZ-78; Wed, 10 Mar 2021 09:09:11 +0000
Received: by outflank-mailman (input) for mailman id 95921;
 Wed, 10 Mar 2021 09:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3c2=II=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1lJuq4-0001pU-RV
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 09:09:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a4fab66-27ae-4504-9f4f-fb36d0266568;
 Wed, 10 Mar 2021 09:09:08 +0000 (UTC)
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
X-Inumbo-ID: 5a4fab66-27ae-4504-9f4f-fb36d0266568
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615367347;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4VmRMA+z46nfmAF79aPtxD7G3DEltQtHlbCtG5CBYG4=;
  b=DSNSKvuHi4szfT/QUYdsiFs1Nsx6SBK2uN4tmgDCRiYNb4oIl3FH+JCE
   4WdwxUsthHP4JuKnp9CZXu3+xmkcb0ZxowUPWT3eBOc6O/myBl6B4myBb
   d8whet+j3qX4o+D7dkktlmmUasyZZI3lY0xl9jDQgBnXX4dWTiFSdaoxD
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +BTeAh8Uamfyx7JXECtHe4MHBr+LasAM5IXnbCFVbC7EHr7AXjhpZ2DwltkQWS/F20JUriuzsK
 yA5Ums4mSHCc8c4kJo1ffSBruToMR/0xTG6++UDBIcucvS/OvayHRSpbeMhDloJihYTntaNyfa
 jqEn4uvZWBAZ+riECrRqYQ3GbIVyT8sXD7xh9a04GX7/ut8T9qZklS1VhoeCKg5MZXjDg8V1Yx
 2w+5DjAbQJ9y7wGBDeYwVdahccCzVTRTFQyNi3lPb7BZqcVSOErEkrrdzjhPrJtpRcNvfkEfvQ
 zxE=
X-SBRS: 4.0
X-MesageID: 38931597
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="38931597"
Subject: Re: [PATCH v4 2/3] xen/events: don't unmask an event channel when an
 eoi is pending
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, <stable@vger.kernel.org>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20210306161833.4552-1-jgross@suse.com>
 <20210306161833.4552-3-jgross@suse.com>
 <ff9fb99f-12ca-c04e-e4bc-1b1c67381cc2@oracle.com>
 <d6a1ab2e-4b77-7b14-e397-74aa71efb70d@suse.com>
 <b6d41422-47cf-956c-9c4a-98998c64b103@citrix.com>
Message-ID: <3880be9d-1176-8beb-b192-20078cd39038@citrix.com>
Date: Wed, 10 Mar 2021 09:08:34 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b6d41422-47cf-956c-9c4a-98998c64b103@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2021-03-09 08:57, Ross Lagerwall wrote:
> On 2021-03-09 05:14, Jürgen Groß wrote:
>> On 08.03.21 21:33, Boris Ostrovsky wrote:
>>>
>>> On 3/6/21 11:18 AM, Juergen Gross wrote:
>>>> An event channel should be kept masked when an eoi is pending for it.
>>>> When being migrated to another cpu it might be unmasked, though.
>>>>
>>>> In order to avoid this keep three different flags for each event channel
>>>> to be able to distinguish "normal" masking/unmasking from eoi related
>>>> masking/unmasking and temporary masking. The event channel should only
>>>> be able to generate an interrupt if all flags are cleared.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
>>>> Reported-by: Julien Grall <julien@xen.org>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>> ---
>>>> V2:
>>>> - introduce a lock around masking/unmasking
>>>> - merge patch 3 into this one (Jan Beulich)
>>>> V4:
>>>> - don't set eoi masking flag in lateeoi_mask_ack_dynirq()
>>>
>>>
>>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>>
>>>
>>> Ross, are you planning to test this?
>>
>> Just as another data point: With the previous version of the patches
>> a reboot loop of a guest needed max 33 reboots to loose network in
>> my tests (those were IIRC 6 test runs). With this patch version I
>> stopped the test after about 1300 reboots without having seen any
>> problems.
>>
> 
> Thanks, I'll test it today and get back to you.
> 

Tested-by: Ross Lagerwall <ross.lagerwall@citrix.com>

The updated patch seems fine in testing.

Thanks
Ross

