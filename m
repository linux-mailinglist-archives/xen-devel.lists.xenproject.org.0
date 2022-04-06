Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF904F5825
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299743.510887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1Ux-000205-RE; Wed, 06 Apr 2022 08:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299743.510887; Wed, 06 Apr 2022 08:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1Ux-0001xx-OB; Wed, 06 Apr 2022 08:58:43 +0000
Received: by outflank-mailman (input) for mailman id 299743;
 Wed, 06 Apr 2022 08:58:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nc1Uw-0001xr-4w
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:58:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc1Ut-0008S3-Q6; Wed, 06 Apr 2022 08:58:39 +0000
Received: from [54.239.6.190] (helo=[192.168.16.200])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc1Ut-0001om-Fq; Wed, 06 Apr 2022 08:58:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=zw9sDgP/hpxqMhcvM5+bBVpXCVWiSSyurTkeJv1dseI=; b=v2dzbec3pkrX/SMHf1Juy50re6
	n7c0vJs/y6wdvemgT2ydI5ZLWoEEHpJ/kO5shq66w9u3bChdwKfOO6g65KILWMTiY0xA1rL1ofZlY
	x2wR6TcDi9c4OUAEWFFiplOkN4G054CAj+9lcAyaqxs6sdQTWObwsK85brqsno8f/0Xg=;
Message-ID: <7dc5887a-461d-506d-ce4e-fbcb7e5cb43e@xen.org>
Date: Wed, 6 Apr 2022 09:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
 <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
 <alpine.DEB.2.22.394.2204051758250.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204051758250.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 06/04/2022 03:21, Stefano Stabellini wrote:
> On Fri, 1 Apr 2022, Juergen Gross wrote:
>> On 01.04.22 12:21, Julien Grall wrote:
>>> This would be a problem if Linux is still booting and hasn't yet call
>>> xenbus_probe_initcall().
>>>
>>> I understand we need to have the page setup before raising the event
>>> channel. I don't think we can allow Xenstored to set the HVM_PARAM (it may
>>> run in a domain with less privilege). So I think we may need to create a
>>> separate command to kick the client (not great).
>>>
>>> Juergen, any thoughts?
>>
>> I think it should work like that:
>>
>> - setup the grant via xc_dom_gnttab_seed()
>> - introduce the domain to Xenstore
>> - call xc_hvm_param_set()
>>
>> When the guest is receiving the event, it should wait for the xenstore
>> page to appear.
> 
> 
> I am OK with what you wrote above, and I understand Julien's concerns
> about "waiting". Before discussing that, I would like to make sure I
> understood why setting HVM_PARAM_STORE_PFN first (before
> xs_introduce_domain) is not possible.
> 
> In a previous reply to Julien I wrote that it is not a good idea to
> set HVM_PARAM_STORE_PFN in Xen before creating the domains because it
> would cause Linux to hang at boot. That is true, Linux hangs on
> drivers/xen/xenbus/xenbus_comms.c:xb_init_comms waiting on xb_waitq.
I looked at the implementation of xb_init_comms in 5.17 and I couldn't 
find out how it would block here. Can you clarify?

> It could wait a very long time as domUs are typically a lot faster than
> dom0 to boot.
> 
> However, if we set HVM_PARAM_STORE_PFN before calling
> xs_introduce_domain in init-dom0less, for Linux to see it before
> xs_introduce_domain is done, Linux would need to be racing against
> init-dom0less. In that case, the wait in xb_init_comms would be minimal
> anyway. It shouldn't be a problem. There would be no "hang", just a wait
> a bit longer than usual.

 From my understanding, Linux may send commands as soon as it sees 
HVM_PARAM_STORE_PFN. With your proposal, this may happen before 
xs_introduce_domain() has updated the features supported by Xenstored.

With the recent proposal from Juergen [1], an OS will need to read the 
features field to understand whether Xenstored support the extended 
version of a command.

This means, any commands sent before xs_introduce_domain() would not be 
able to take advantage of the new features. Therefore, we would need to 
wait until Xenstored has advertised the features.

With your approach, the wait would be a busy loop. Although, I am not 
entirely sure what you would be waiting on?

But if we use the 'connection status' field, then you could just delay 
the initialization until you receive an event and the connection status 
is connected.

Cheers,

[1] https://lore.kernel.org/xen-devel/20220316161017.3579-1-jgross@suse.com/

-- 
Julien Grall

