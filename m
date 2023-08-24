Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FAD786D09
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 12:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589935.922011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7pN-0002oN-1n; Thu, 24 Aug 2023 10:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589935.922011; Thu, 24 Aug 2023 10:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7pM-0002mQ-VW; Thu, 24 Aug 2023 10:44:36 +0000
Received: by outflank-mailman (input) for mailman id 589935;
 Thu, 24 Aug 2023 10:44:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ7pL-0002mJ-8r
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 10:44:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ7pK-000268-Cd; Thu, 24 Aug 2023 10:44:34 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ7pK-000348-5q; Thu, 24 Aug 2023 10:44:34 +0000
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
	bh=dOX/ykuX9+BQJZOSK9DgoW4d5Qe00NFBRSN+hslp8ug=; b=4L3naar7NVnw+KYcqXl71LXdTX
	HoMyKymHaogWqI3ygc6yt0/9egImwGWwvU0fvd0e1rZciDmhM/IrmVqLub74MSfgJp9aJLjiGQvaY
	o8a9JC3yLwXTJsr4Tpr9HDQeT7ovdeQQftMx3WDRABic5OPm9JlLOFqCEV+Dl++Yj9+A=;
Message-ID: <f21cb61c-b933-454c-9bd7-7c7696d3e7dc@xen.org>
Date: Thu, 24 Aug 2023 11:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/libs: light: Remove the variable 'domainid'
 do_pci_remove()
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-2-julien@xen.org>
 <603d2542-ba94-4c1a-9480-a3319f75bdb0@perard>
From: Julien Grall <julien@xen.org>
In-Reply-To: <603d2542-ba94-4c1a-9480-a3319f75bdb0@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 18/08/2023 18:05, Anthony PERARD wrote:
> On Wed, Aug 09, 2023 at 11:33:04AM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The function do_pci_remove() has two local variables 'domid' and
>> 'domainid' containing the same value.
>>
>> Looking at the history, until 2cf3b50dcd8b ("libxl_pci: Use
>> libxl__ao_device with pci_remove") the two variables may have
>> different value when using a stubdomain.
>>
>> As this is not the case now, remove 'domainid'. This will reduce
>> the confusion between the two variables.
>>
>> Note that there are other places in libxl_pci.c which are using
>> the two confusing names within the same function. They are left
>> unchanged for now.
>>
>> No functional changes intented.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks! I have committed this patch. I need to respin patch 2.

Cheers,

-- 
Julien Grall

