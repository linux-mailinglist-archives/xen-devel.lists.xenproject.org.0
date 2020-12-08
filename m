Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82C82D2DEB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 16:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47540.84137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeeb-00085g-7O; Tue, 08 Dec 2020 15:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47540.84137; Tue, 08 Dec 2020 15:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeeb-00085H-4Q; Tue, 08 Dec 2020 15:11:49 +0000
Received: by outflank-mailman (input) for mailman id 47540;
 Tue, 08 Dec 2020 15:11:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmeea-00085C-E9
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 15:11:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f453aeb9-1538-42b6-acb3-370d319de40f;
 Tue, 08 Dec 2020 15:11:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E49BCAF6D;
 Tue,  8 Dec 2020 15:11:43 +0000 (UTC)
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
X-Inumbo-ID: f453aeb9-1538-42b6-acb3-370d319de40f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607440304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXgSZQhnC8jyaOrMTBVGpRFySSze5DeQ9hRTfDYd1X0=;
	b=j43BfM5SrYg0oB0sUaPvlN+ENjEXIb0dj+VgZqpPaMQie0arZdco047cTzSng/E+qxCRCC
	v0kkIShz1DQ61RKj+01e8K9Tg3dpSsLr58B3aNCw/wQEGS7Bla05SrjwwolWF+mmykCyJm
	WnFwOTRF0m5I6+EhGJtS3C3Xj1BWSEc=
Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com>
Date: Tue, 8 Dec 2020 16:11:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -55,6 +55,20 @@ struct ioreq_server {
>      uint8_t                bufioreq_handling;
>  };
>  
> +/*
> + * This should only be used when d == current->domain and it's not paused,

Is the "not paused" part really relevant here? Besides it being rare
that the current domain would be paused (if so, it's in the process
of having all its vCPU-s scheduled out), does this matter at all?

Apart from this the patch looks okay to me, but I'm not sure it
addresses Paul's concerns. Iirc he had suggested to switch back to
a list if doing a swipe over the entire array is too expensive in
this specific case.

Jan

