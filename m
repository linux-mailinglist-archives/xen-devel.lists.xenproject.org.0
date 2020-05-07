Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE81C84EE
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 10:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWc0f-0003YI-1b; Thu, 07 May 2020 08:36:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K0Sz=6V=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWc0c-0003YD-QJ
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 08:35:58 +0000
X-Inumbo-ID: c6351422-903d-11ea-9eed-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6351422-903d-11ea-9eed-12813bfff9fa;
 Thu, 07 May 2020 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M+Bj3RU/k3t9vnxO+jWI4dODdoXu2tklo8vSxTm72SU=; b=oFIzYgxaEQj7WnVRCZvv7E9flC
 lsqn6h3Y3Mj2JyLs0bQNgh/arZNVzyR2cCKB+StEur6UWePo7xXss/OnEMitBt/eWgHhZmADgIxFs
 cstEW27l9uuYQdEW8BjTaCCMROm9knaIzRT/rEtMw7hWe90Ih5vcBfdtWYr3ed8rKL1A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWc0Y-0001Vw-L1; Thu, 07 May 2020 08:35:54 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWc0Y-0005GW-DH; Thu, 07 May 2020 08:35:54 +0000
Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Jan Beulich <jbeulich@suse.com>, paul@xen.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
 <009601d623c5$9547abc0$bfd70340$@xen.org>
 <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2a911fec-82dd-9d97-791a-02dd4b328eb6@xen.org>
Date: Thu, 7 May 2020 09:35:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 07/05/2020 08:21, Jan Beulich wrote:
> On 06.05.2020 18:44, Paul Durrant wrote:
>>>> +#define DOMAIN_SAVE_BEGIN(_x, _c, _v, _len) \
>>>> +        domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len))
>>>
>>> In new code I'd like to ask for no leading underscores on macro
>>> parameters as well as no unnecessary parenthesization of macro
>>> parameters (e.g. when they simply get passed on to another macro
>>> or function without being part of a larger expression).
>>
>> Personally I think it is generally good practice to parenthesize
>> but I can drop if you prefer.
> 
> To be honest - it's more than just "prefer": Excess parentheses
> hamper readability. There shouldn't be too few, and since macros
> already require quite a lot of them, imo we should strive to
> have exactly as many as are needed.

While I understand that too many parentheses may make the code worse, in 
the case of the macros, adding them for each argument is a good 
practice. This pretty simple to follow and avoid the mistake to forget 
to protect an argument correctly.

So I would let the contributor decides whether he wants to protect all 
the macro arguments or just as a need basis.

Cheers,

-- 
Julien Grall

