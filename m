Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C31B7A57
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 17:45:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS0Uq-0004Lw-2O; Fri, 24 Apr 2020 15:44:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jS0Uo-0004Lr-Kg
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 15:44:06 +0000
X-Inumbo-ID: 6dd1f69c-8642-11ea-94ce-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dd1f69c-8642-11ea-94ce-12813bfff9fa;
 Fri, 24 Apr 2020 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3wqAYCavyypofe7MTlDKDLJYRm4yp0uzip8LrFvrKM=; b=vS03vCt1k6EmD6b8pEgVjAJrUp
 /YFl87QUp97uEWTAfb0rgoWl8gZuqMhvyA2zB9iQLAryJaIOeuRKK1WhiFP5rOAwS2CVC3RdygqUO
 fBYtcNvSqYVonTpvrWT+Rm3BVTABVxnhIpSS2VwyNZuz+wATwsqhlBmzwsR4fIejfwKo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jS0Um-0003iM-J8; Fri, 24 Apr 2020 15:44:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jS0Um-0000cZ-CZ; Fri, 24 Apr 2020 15:44:04 +0000
Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200424133736.737-1-paul@xen.org>
 <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
 <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
 <8029c772-9c42-460c-e17c-85e18b32f102@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ae1bb1c-0029-c3f0-1565-e5f99effee51@xen.org>
Date: Fri, 24 Apr 2020 16:44:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8029c772-9c42-460c-e17c-85e18b32f102@suse.com>
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/04/2020 15:51, Jürgen Groß wrote:
> On 24.04.20 16:38, Julien Grall wrote:
>> Hi,
>>
>> On 24/04/2020 15:26, Jürgen Groß wrote:
>>>> +```
>>>> +    0       1       2       3       4       5       6       7    octet
>>>> ++-------+-------+-------+-------+-------+-------+-------+-------+
>>>> +| type                          | len                           |
>>>> ++-------------------------------+-------------------------------+
>>>> +| body
>>>> +...
>>>> +|       | padding (0 to 7 octets)                               |
>>>> ++-------+-------------------------------------------------------+
>>>> +```
>>>> +
>>>> +NOTE: padding octets here and in all subsequent format 
>>>> specifications must be
>>>> +      zero, unless stated otherwise.
>>>
>>> What about: "... are written as zero and should be ignored on read."
>>
>> I would rather not say "ignored" because it doesn't allow us to extend 
>> the record if needed in a safe way. The read side should abort if it 
>> sees an other value than 0 in the padding.
> 
> I'd rather ignore unknown fields. This allows to add optional data
> without having to special case it. 

You will need a special case for 0 in any case.

> Writing zeroes is the important part
> here, of course.
> 
> Ignoring those fields would e.g. enable a downgrade more easily, while
> aborting could make that impossible.

You are assuming the fields may contain optional data. Now imagine, we 
realize in a few months we missed some important fields. How would you 
describe the required fields?

I can see two ways:
     1) Re-using the padding fields if possible
     2) Extending the record

If you re-use the padding fields, then when you downgrade you may lose 
information. If you extend the size of the record, then you can't downgrade.

Cheers,

-- 
Julien Grall

