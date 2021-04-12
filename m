Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCA35C1BC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 11:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108863.207713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVt7G-0001BG-Jx; Mon, 12 Apr 2021 09:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108863.207713; Mon, 12 Apr 2021 09:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVt7G-0001As-GV; Mon, 12 Apr 2021 09:44:22 +0000
Received: by outflank-mailman (input) for mailman id 108863;
 Mon, 12 Apr 2021 09:44:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVt7F-0001An-IU
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 09:44:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e876708a-4586-437d-aeb7-c86a8dd90d14;
 Mon, 12 Apr 2021 09:44:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 954ACADEF;
 Mon, 12 Apr 2021 09:44:19 +0000 (UTC)
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
X-Inumbo-ID: e876708a-4586-437d-aeb7-c86a8dd90d14
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618220659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5orpTFuknStGtjBYh6Sb9FX/HOMU68UxXEPrtrsZXY=;
	b=WhkM5Ow5jQxXBoPf4QGPleU4MrQY9kwEHubvMxVeH9HT+MUgCyoYetgzq3Y5TRZW8r7xc6
	7vUb9YA+nNiLjpm0gygw7ELfKTNtI+X2537Ol9irBPg5R7aoUDiFEB4VCzsa/TJVlF2GzN
	CAwCzjFq1WLMprUozeY7gZXdz4ir8Yg=
Subject: Re: [PATCH 2/3] xen-pciback: reconfigure also from backend watch
 handler
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <74955b48-80b1-3436-06b4-d8569260aa65@suse.com>
 <a93c66e5-807b-e557-d437-48d7f46f25f7@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <529f18d5-89ae-596e-29a7-d773e5a3c6b2@suse.com>
Date: Mon, 12 Apr 2021 11:44:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a93c66e5-807b-e557-d437-48d7f46f25f7@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.04.2021 23:43, Boris Ostrovsky wrote:
> 
> On 4/7/21 10:37 AM, Jan Beulich wrote:
>> When multiple PCI devices get assigned to a guest right at boot, libxl
>> incrementally populates the backend tree. The writes for the first of
>> the devices trigger the backend watch. In turn xen_pcibk_setup_backend()
>> will set the XenBus state to Initialised, at which point no further
>> reconfigures would happen unless a device got hotplugged. Arrange for
>> reconfigure to also get triggered from the backend watch handler.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Cc: stable@vger.kernel.org
>> ---
>> I will admit that this isn't entirely race-free (with the guest actually
>> attaching in parallel), but from the looks of it such a race ought to be
>> benign (not the least thanks to the mutex). Ideally the tool stack
>> wouldn't write num_devs until all devices had their information
>> populated. I tried doing so in libxl, but xen_pcibk_setup_backend()
>> calling xenbus_dev_fatal() when not being able to read that node
>> prohibits such an approach (or else libxl and driver changes would need
>> to go into use in lock-step).
>>
>> I wonder why what is being watched isn't just the num_devs node. Right
>> now the watch triggers quite frequently without anything relevant
>> actually having changed (I suppose in at least some cases in response
>> to writes by the backend itself).
>>
>> --- a/drivers/xen/xen-pciback/xenbus.c
>> +++ b/drivers/xen/xen-pciback/xenbus.c
>> @@ -359,7 +359,8 @@ out:
>>  	return err;
>>  }
>>  
>> -static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev)
>> +static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev,
>> +				 enum xenbus_state state)
>>  {
>>  	int err = 0;
>>  	int num_devs;
>> @@ -374,8 +375,7 @@ static int xen_pcibk_reconfigure(struct
>>  
>>  	mutex_lock(&pdev->dev_lock);
>>  	/* Make sure we only reconfigure once */
> 
> 
> Is this comment still valid or should it be moved ...
> 
> 
>> -	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
>> -	    XenbusStateReconfiguring)
>> +	if (xenbus_read_driver_state(pdev->xdev->nodename) != state)
>>  		goto out;
>>  
>>  	err = xenbus_scanf(XBT_NIL, pdev->xdev->nodename, "num_devs", "%d",
>> @@ -500,6 +500,9 @@ static int xen_pcibk_reconfigure(struct
>>  		}
>>  	}
>>  
>> +	if (state != XenbusStateReconfiguring)
>> +		goto out;
>> +
> 
> 
> ... here?

Yeah, probably better to move it.

>>  	err = xenbus_switch_state(pdev->xdev, XenbusStateReconfigured);
>>  	if (err) {
>>  		xenbus_dev_fatal(pdev->xdev, err,
>> @@ -525,7 +528,7 @@ static void xen_pcibk_frontend_changed(s
>>  		break;
>>  
>>  	case XenbusStateReconfiguring:
>> -		xen_pcibk_reconfigure(pdev);
>> +		xen_pcibk_reconfigure(pdev, XenbusStateReconfiguring);
>>  		break;
>>  
>>  	case XenbusStateConnected:
>> @@ -664,6 +667,10 @@ static void xen_pcibk_be_watch(struct xe
>>  		xen_pcibk_setup_backend(pdev);
>>  		break;
>>  
>> +	case XenbusStateInitialised:
>> +		xen_pcibk_reconfigure(pdev, XenbusStateInitialised);
> 
> 
> Could you add a comment here that this is needed when multiple devices are added?

Sure.

> It also looks a bit odd that adding a device is now viewed as a reconfiguration. It seems to me that xen_pcibk_setup_backend() and xen_pcibk_reconfigure() really should be merged --- initialization code for both looks pretty much the same.

I thought the same, but didn't want to make more of a change than is
needed to address the problem at hand. Plus of course there's still
the possibility that someone may fix libxl, at which point the change
here (and hence the merging) would become unnecessary.

Jan

