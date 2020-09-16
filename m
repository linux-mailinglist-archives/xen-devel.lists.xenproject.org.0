Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D0426BF7F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:39:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISy7-0001Ht-E0; Wed, 16 Sep 2020 08:39:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kISy5-0001Hn-TY
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:39:09 +0000
X-Inumbo-ID: 714ce9e2-8ae8-42ec-aa19-f4b4e419681e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 714ce9e2-8ae8-42ec-aa19-f4b4e419681e;
 Wed, 16 Sep 2020 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=BnkhvH6sWDyVA1Sfr+BaWdUapx4x+u5a00QxBAhNGvY=; b=XZYT278WtF5hH/2WAcNQNuYSR1
 bowf2Qqh8/YxWE04gU59+e8AoEnaB3eU9fbzBjjGv7FePnJ2hmKZTzkHxXFXIolQchtCLmIWjHimV
 o6klK+D8VArZIx9xnKONNonRlOkY6qzTrhyM/gOyIk1XPKsH7ovfFsAaTkmgaVcNiUUw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISy1-0000nx-K8; Wed, 16 Sep 2020 08:39:05 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISy1-00012b-9R; Wed, 16 Sep 2020 08:39:05 +0000
Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce
 hvm_domain_has_ioreq_server()
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Julien Grall' <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
 <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
 <002801d68c01$44756ad0$cd604070$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <63e51f84-c3ee-a894-5ea2-40cd3b6e26dc@xen.org>
Date: Wed, 16 Sep 2020 09:39:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <002801d68c01$44756ad0$cd604070$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 16/09/2020 09:13, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 16 September 2020 09:05
>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant <paul@xen.org>
>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger
>> Pau Monné <roger.pau@citrix.com>; Julien Grall <julien.grall@arm.com>
>> Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce hvm_domain_has_ioreq_server()
>>
>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch introduces a helper the main purpose of which is to check
>>> if a domain is using IOREQ server(s).
>>>
>>> On Arm the benefit is to avoid calling handle_hvm_io_completion()
>>> (which implies iterating over all possible IOREQ servers anyway)
>>> on every return in leave_hypervisor_to_guest() if there is no active
>>> servers for the particular domain.
>>>
> 
> Is this really worth it? The limit on the number of ioreq serves is small... just 8. 

When I suggested this, I failed to realize there was only 8 IOREQ 
servers available. However, I would not be surprised if this increase 
long term as we want to use

> I doubt you'd be able measure the difference.
Bear in mind that entry/exit to the hypervisor is pretty "cheap" on Arm 
compare to x86. So we want to avoid doing extra work if it is not necessary.

Cheers,

-- 
Julien Grall

