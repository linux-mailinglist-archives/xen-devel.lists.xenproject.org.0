Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E9389E9A
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 09:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130648.244601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljcic-0007dl-4M; Thu, 20 May 2021 07:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130648.244601; Thu, 20 May 2021 07:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljcic-0007ax-0f; Thu, 20 May 2021 07:03:42 +0000
Received: by outflank-mailman (input) for mailman id 130648;
 Thu, 20 May 2021 07:03:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljcia-0007ar-S1
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 07:03:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f150f76a-edc3-493a-adca-638e7dc5a9cf;
 Thu, 20 May 2021 07:03:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DEC0B016;
 Thu, 20 May 2021 07:03:39 +0000 (UTC)
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
X-Inumbo-ID: f150f76a-edc3-493a-adca-638e7dc5a9cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621494219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1L6iwsMcik0d8dtekBjdkf+tGhrTCEmOukCkZ9TBY0w=;
	b=kYIIA1eb1UoFFRGM0Hufu52lnvaU3dHqoJu+YJxjkwiopVTWnvLdx2HRHmAxmWsqukfDHo
	oNEVi3gq50xWhBKFx6w9B/CityWWaUXBUcvxRPplfILgW2T3VIJPiej5tXook/KtZ9959Z
	ZOKVF6CM8FLMQKMOjdhV/iSWYIzvrY0=
Subject: Re: regression in recent pvops kernels, dom0 crashes early
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20210513122457.4182eb7f.olaf@aepfle.de>
 <7abb3c8f-4a9b-700b-5c0c-dc6f42336eab@suse.com>
 <20210519204205.5bf59d51.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb51ff7d-bd02-f039-dace-1c7f31fd2e1e@suse.com>
Date: Thu, 20 May 2021 09:03:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519204205.5bf59d51.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.05.2021 20:42, Olaf Hering wrote:
> Am Mon, 17 May 2021 12:54:02 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> x86/Xen: swap NX determination and GDT setup on BSP
>>
>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
>> For this to work when NX is not available, x86_configure_nx() needs to
>> be called first.
> 
> 
> Thanks. I tried this patch on-top of the SLE15-SP3 kernel branch.
> Without the patch booting fails as reported.
> With the patch the dom0 starts as expected.

Just to be sure - you did not need the other patch that I said I suspect
is needed as a prereq?

Jan

