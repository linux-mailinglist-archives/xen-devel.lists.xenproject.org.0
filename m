Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F4A4DE1F0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 20:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292208.496311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVIWV-0004zg-G8; Fri, 18 Mar 2022 19:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292208.496311; Fri, 18 Mar 2022 19:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVIWV-0004xa-Cz; Fri, 18 Mar 2022 19:44:31 +0000
Received: by outflank-mailman (input) for mailman id 292208;
 Fri, 18 Mar 2022 19:44:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVIWT-0004xU-SL
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 19:44:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVIWT-0000vJ-9n; Fri, 18 Mar 2022 19:44:29 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVIWT-0003TY-4C; Fri, 18 Mar 2022 19:44:29 +0000
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
	bh=WGEPkWDckwgCoDnOtCpuyUtQNkb6vX3wTfn0Jwt4+jc=; b=fopjsWLfV7EfdnaVo2n1o14NxE
	5eCC8+2C74YnGZIC3Adpa8zGN/714lohqvaYsAWn3jeYHOozMrTXvRJZaKNR8RQwS+HYiOpaMCGmp
	6z2S94c12c6lNHnlpmuoYWSQD8GGG5cz+1qJvKF7buc2+HnaNGPEGI72+2gyt1+IqN0k=;
Message-ID: <8201257a-74c1-4a47-77d5-0b9b2daec6f9@xen.org>
Date: Fri, 18 Mar 2022 19:44:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
To: Hongda Deng <Hongda.Deng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <Julien.Grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-9-julien@xen.org>
 <DBAPR08MB5670F9858ED3EE701C7F9C8BE6139@DBAPR08MB5670.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DBAPR08MB5670F9858ED3EE701C7F9C8BE6139@DBAPR08MB5670.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/03/2022 07:36, Hongda Deng wrote:
> Hi Julien,

Hi Hongda,

>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Julien
>> Grall
>> Sent: 2022年2月21日 18:22
>> To: xen-devel@lists.xenproject.org
>> Cc: julien@xen.org; Julien Grall <Julien.Grall@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Julien Grall
>> <jgrall@amazon.com>
>> Subject: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
>> map_pages_to_xen()
>>
>> From: Julien Grall <julien.grall@arm.com>
>>
>> Now that map_pages_to_xen() has been extended to support 2MB mappings,
>> we can replace the create_mappings() calls by map_pages_to_xen() calls.
>>
>> The mapping can also be marked read-only has Xen as no business to
> 
> In my opinion I think it may should be:
> 	... read-only as Xen has no business ...
> instead of:
> 	... read-only has Xen as no business ...

You are right, I have updated the commit message.

> 
> For this and other patches before this:
> Reviewed-by: Hongda Deng <Hongda.Heng@arm.com>

There is one bug in patch #5 (I sent an e-mail with the possible fix). 
Can you confirm you are still happy with me to keep your reviewed-by for 
that patch?

For the other patches, I have already committed patch #1-#3. So I will 
add your tag on patches #4, #6, #7, #8.

Thank you for the review!

Cheers,

-- 
Julien Grall

