Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97F1B7895
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzg2-00006o-UN; Fri, 24 Apr 2020 14:51:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Nbk=6I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jRzg0-00006b-Q1
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:51:36 +0000
X-Inumbo-ID: 181e5ccf-863b-11ea-94ba-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 181e5ccf-863b-11ea-94ba-12813bfff9fa;
 Fri, 24 Apr 2020 14:51:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18997ACE3;
 Fri, 24 Apr 2020 14:51:34 +0000 (UTC)
Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
To: Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20200424133736.737-1-paul@xen.org>
 <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
 <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8029c772-9c42-460c-e17c-85e18b32f102@suse.com>
Date: Fri, 24 Apr 2020 16:51:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 24.04.20 16:38, Julien Grall wrote:
> Hi,
> 
> On 24/04/2020 15:26, Jürgen Groß wrote:
>>> +```
>>> +    0       1       2       3       4       5       6       7    octet
>>> ++-------+-------+-------+-------+-------+-------+-------+-------+
>>> +| type                          | len                           |
>>> ++-------------------------------+-------------------------------+
>>> +| body
>>> +...
>>> +|       | padding (0 to 7 octets)                               |
>>> ++-------+-------------------------------------------------------+
>>> +```
>>> +
>>> +NOTE: padding octets here and in all subsequent format 
>>> specifications must be
>>> +      zero, unless stated otherwise.
>>
>> What about: "... are written as zero and should be ignored on read."
> 
> I would rather not say "ignored" because it doesn't allow us to extend 
> the record if needed in a safe way. The read side should abort if it 
> sees an other value than 0 in the padding.

I'd rather ignore unknown fields. This allows to add optional data
without having to special case it. Writing zeroes is the important part
here, of course.

Ignoring those fields would e.g. enable a downgrade more easily, while
aborting could make that impossible.

And in case a version would write non-zero bytes (e.g. due to a bug)
this version could never be live-updated.

Juergen

