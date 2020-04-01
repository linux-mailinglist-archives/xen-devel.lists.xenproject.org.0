Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A119AB84
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 14:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJcI7-0002BV-RX; Wed, 01 Apr 2020 12:16:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJcI5-0002Ay-KV
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 12:16:17 +0000
X-Inumbo-ID: 965e9738-7412-11ea-bab3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 965e9738-7412-11ea-bab3-12813bfff9fa;
 Wed, 01 Apr 2020 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3/IAJlig/Dr1hbYxrTC5MUbHX0aYV7mOk1ur9XignHo=; b=Tk3EqzLHbp8zSPW4MYFq7X9r9b
 i0K3Wmhd5g7i1INePOv19DqegpxjIP2Kk7MbqY1hHNJDnJaFm7e8mmsZBtls3xJI8l1w2XdCtDVgY
 vq2+K87yWHlnO2QsxWSt4zNySWdLKg/heXimOHPfVWuYp/0ugUcioIG8nqra+xqQOqMw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJcI3-0001qa-EA; Wed, 01 Apr 2020 12:16:15 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJcI3-00046W-7c; Wed, 01 Apr 2020 12:16:15 +0000
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Jan Beulich <jbeulich@suse.com>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <663f4a01-168a-6ead-8447-45e005e578ce@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <77e5ef68-0d1e-b2b6-6e21-273ab7b9b707@xen.org>
Date: Wed, 1 Apr 2020 13:16:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <663f4a01-168a-6ead-8447-45e005e578ce@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 01/04/2020 13:07, Jan Beulich wrote:
> On 01.04.2020 14:00, Julien Grall wrote:
>> On 27/03/2020 18:50, Paul Durrant wrote:
>>> +    if ( (exact ?
>>> +          (dst_len != c->desc.length) : (dst_len < c->desc.length)) ||
>>
>> Using ternary in if is really confusing. How about:
>>
>> dst_len < c->desc.length || (exact && dst_len != c->desc.length) ||
>>
>> I understand that there would be two check for the exact case but I think it is better than a ternary.
> 
> I'm of the opposite opinion, and hence with Paul. While the alternative
> you suggest is still reasonable because of the special case here, I
> find it confusing / more difficult to read / follow
> 
>      if ( (a && b) || (!a && c) )
> 
> (and I've seen quite a few instances of such over time) instead of
> 
>      if ( a ? b : c )

If the ternary was the only condition and in a single line then it would 
be okay. However, the if is split over 3 lines...

The more stuff you put in an if, then more chance you are going to 
misread/make a mistake (you likely know what I am referring about here ;)).

So if you prefer the ternary, then we should at least write 2 ifs.

Cheers,

-- 
Julien Grall

