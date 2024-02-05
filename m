Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD1849D3C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676162.1052105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX09l-0001lV-8G; Mon, 05 Feb 2024 14:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676162.1052105; Mon, 05 Feb 2024 14:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX09l-0001jV-5A; Mon, 05 Feb 2024 14:41:09 +0000
Received: by outflank-mailman (input) for mailman id 676162;
 Mon, 05 Feb 2024 14:41:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX09j-0001i1-JZ
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:41:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX09j-0007eV-20; Mon, 05 Feb 2024 14:41:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX09i-0008Vn-Ta; Mon, 05 Feb 2024 14:41:07 +0000
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
	bh=z5IRWa2bwMWZXQZNpLSVFvglGaXNH6tk5BGioab6tM0=; b=tLrFU3SdoJLNc+520L+HBCr3LK
	nQM7YKgBpD4MRQ5bYaL8Fr6igEuoLYyKKhnJXNHMtpaNhCID1LWxm/rLY8E4awBFclB99fyCC+BKR
	SMSb2gPrajgndcxLm+aKoT6I3GYodTxfK8jE4veAa2G07mLAQL2s9r002EN89oybGtVs=;
Message-ID: <484f6649-4720-4108-ad2d-8b729e7352fd@xen.org>
Date: Mon, 5 Feb 2024 14:41:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] tools/xenstored: move all log-pipe handling into
 posix.c
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240205105001.24171-1-jgross@suse.com>
 <20240205105001.24171-24-jgross@suse.com>
 <c3bde61e-58f1-40fe-afa0-23510b6c5720@xen.org>
 <51b8f1f0-418d-42ba-bc69-29eb6a6960e2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <51b8f1f0-418d-42ba-bc69-29eb6a6960e2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 05/02/2024 14:36, Jürgen Groß wrote:
> On 05.02.24 15:33, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 05/02/2024 10:49, Juergen Gross wrote:
>>> All of the log-pipe handling is needed only when running as daemon.
>>>
>>> Move it into posix.c. This requires to have a service function in the
>>> main event loop for handling the related requests and one for setting
>>> the fds[] array. Use a generic name for those functions, as socket
>>> handling can be added to them later, too.
>>
>> I would mention the rename in the commit message. With that:
> 
> I have modified the commit message to:
> 
> tools/xenstored: move all log-pipe handling into posix.c
> 
> All of the log-pipe handling is needed only when running as daemon.
> 
> Move it into posix.c. This requires to have a service function in the
> main event loop for handling the related requests and one for setting
> the fds[] array, which is renamed to poll_fds to have a more specific
> name. Use a generic name for those functions, as socket handling can
> be added to them later, too.

AFAICT, the rest of the patches have been reviewed by either Jason or I. 
So I will update the commit message while committing.

Cheers,

-- 
Julien Grall

