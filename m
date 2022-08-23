Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B259D450
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 10:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391755.629699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPCC-00041X-7D; Tue, 23 Aug 2022 08:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391755.629699; Tue, 23 Aug 2022 08:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPCC-0003z3-4Q; Tue, 23 Aug 2022 08:23:36 +0000
Received: by outflank-mailman (input) for mailman id 391755;
 Tue, 23 Aug 2022 08:23:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQPCB-0003yx-0R
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 08:23:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQPCA-0006lh-IE; Tue, 23 Aug 2022 08:23:34 +0000
Received: from [54.239.6.189] (helo=[192.168.28.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQPCA-0004AW-7A; Tue, 23 Aug 2022 08:23:34 +0000
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
	bh=BEP38Hl7dvqT7SRglAfT65scBM9p/TCTK7bMydTOnSc=; b=iVFt8HzDw6eRH6NE5wTMV9zNUS
	0WqRTiH6LVlDxT56luqpkZQlNwohLO+6plOba06bcXZlVMMYto91myqEOoLoFbS81QJ1AmzE6jO50
	cy6WFaxPlH9WEn+zdLzbXAp8nCrlqdErFlcDWze7s7gmUQuG8AAWTeLso7ICbsodk0XA=;
Message-ID: <35a0b685-4c70-b9c0-0635-67e54e4315c7@xen.org>
Date: Tue, 23 Aug 2022 09:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 4/7] xen/evtchn: modify evtchn_bind_interdomain to
 support static evtchn
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <abe4c5be55125eb3da33dbd187fd9b8ad5ace714.1660902588.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <abe4c5be55125eb3da33dbd187fd9b8ad5ace714.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2022 11:02, Rahul Singh wrote:
> Static event channel support will be added for dom0less domains. Modify
> evtchn_bind_interdomain to support static evtchn.
> 
> It is necessary to have access to the evtchn_bind_interdomain function
> to do that, so make evtchn_bind_interdomain global and also make it
> __must_check.
> 
> evtchn_bind_interdomain() always allocates the next available local
> port. Static event channel support for dom0less domains requires
> allocating a specified port.

NIT: I first read this as you are trying to describe what the patch 
does. I would add "currently", "at the moment" or similar to make clear 
this is the current behavior.


> Modify the evtchn_bind_interdomain to
> accept the port number as an argument and allocate the specified port
> if available. If the port number argument is zero, the next available
> port will be allocated.
> 
> evtchn_bind_interdomain() finds the local domain from "current->domain"
> pointer. evtchn_bind_interdomain() will be called from the XEN to create
> static event channel during domain creation. "current" pointer is not
> valid at that time, therefore modify the evtchn_bind_interdomain() to
> pass domain as an argument.

Ditto.

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

