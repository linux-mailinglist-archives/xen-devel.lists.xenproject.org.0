Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E37B9D0F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 14:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612990.953217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNl4-0002zV-3J; Thu, 05 Oct 2023 12:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612990.953217; Thu, 05 Oct 2023 12:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNl3-0002xZ-Vo; Thu, 05 Oct 2023 12:47:13 +0000
Received: by outflank-mailman (input) for mailman id 612990;
 Thu, 05 Oct 2023 12:47:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoNl1-0002xT-VV
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 12:47:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoNl0-0004Gj-Qq; Thu, 05 Oct 2023 12:47:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoNl0-0003Zm-I3; Thu, 05 Oct 2023 12:47:10 +0000
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
	bh=YzfAptQd0Ncc00gxthGiWe0Rz29LBLr+ogL9Ri/MA0w=; b=y4dmiKTGc4bSWHfAyr88oVc2WQ
	vc1Zjc2Zlcc+M5efKvq3jdCpSVLM+NhafRhi7mdpFLYROQfUjARb1Jj6aISY2Gj9Y4+mVlmlou++r
	ZiMquoXTQhBPU6fGgw4kz63068sxzDCEUaWZ7MqykNPixr28I9fGb3KkDSJGh6MRWWnI=;
Message-ID: <76d0d3a1-8da9-4c78-8daf-32cc085e3723@xen.org>
Date: Thu, 5 Oct 2023 13:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate
 vcpu_info page
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-2-roger.pau@citrix.com>
 <f196e4ac-c458-4c4e-8dd7-4a7b53c763c3@xen.org>
 <CA+zSX=YSK6CYd92JrHg=Bkiw2oaLt2x4oUTyTKqjXU58Nc9ZNw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=YSK6CYd92JrHg=Bkiw2oaLt2x4oUTyTKqjXU58Nc9ZNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

On 05/10/2023 13:42, George Dunlap wrote:
> On Thu, Oct 5, 2023 at 1:11 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> While preparing to commit this series, I have noticed that there are no
>> Acked-by/Reviewed-by from Tamas (or at least not present in my inbox).
>>
>> @Tamas, can you provide one?
> 
> I see an "Acked-by" from Tamas two days ago.

Sadly, it is also not on lore.kernel.org or our xenproject mail archives.

In [1], Tamas pointed out he had some e-mail trouble. So anything sent 
by Tamas before last Tuesday is not present in my inbox or any mail 
archives.

Not clear why the Citrix folks received it.

Cheers,

[1] 
https://lore.kernel.org/all/CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com/

-- 
Julien Grall

