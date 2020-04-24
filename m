Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD641B786A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzTZ-0006w9-Gr; Fri, 24 Apr 2020 14:38:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRzTX-0006w4-NE
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:38:43 +0000
X-Inumbo-ID: 4bdea9bc-8639-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bdea9bc-8639-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L7BaNyghnXEhZJtb5wSQzjCowtGl+kDnD1Br/4ByDUQ=; b=mbrFUdK55rHhqz5kkkFEvsRZSK
 QB0/pNNl8ccfOlK8fTrlLwV7mp+GQ2PqvfpngYyAdRcB+bXUhSvzfgbCsBIO1CmV445bGroZWQY9R
 9E3zY4Dz2V5z0nlwfPnx9VSXCWW4r6UFDwzsFS3/BKl5Kl6WTDHl7LUZOYUhe5fnif7k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRzTW-0002NQ-Ag; Fri, 24 Apr 2020 14:38:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRzTW-0003rb-4E; Fri, 24 Apr 2020 14:38:42 +0000
Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200424133736.737-1-paul@xen.org>
 <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
Date: Fri, 24 Apr 2020 15:38:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
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

Hi,

On 24/04/2020 15:26, Jürgen Groß wrote:
>> +```
>> +    0       1       2       3       4       5       6       7    octet
>> ++-------+-------+-------+-------+-------+-------+-------+-------+
>> +| type                          | len                           |
>> ++-------------------------------+-------------------------------+
>> +| body
>> +...
>> +|       | padding (0 to 7 octets)                               |
>> ++-------+-------------------------------------------------------+
>> +```
>> +
>> +NOTE: padding octets here and in all subsequent format specifications 
>> must be
>> +      zero, unless stated otherwise.
> 
> What about: "... are written as zero and should be ignored on read."

I would rather not say "ignored" because it doesn't allow us to extend 
the record if needed in a safe way. The read side should abort if it 
sees an other value than 0 in the padding.

Cheers,

-- 
Julien Grall

