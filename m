Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6481A45A5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 13:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMrpL-0005HX-7o; Fri, 10 Apr 2020 11:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aV0t=52=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMrpJ-0005HO-TN
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 11:28:01 +0000
X-Inumbo-ID: 560036e8-7b1e-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560036e8-7b1e-11ea-83d8-bc764e2007e4;
 Fri, 10 Apr 2020 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/0yaXsGcoV++GdV2/dhrZhYXRkX4pkr6cgnL0KdZLo=; b=M0W5pHCEvkOwZsO7rx3UpQw7Xa
 8xucXdSE9MbJUtTTglQHvHgGrwN0lSEiXxxrvO3a2oU4EmSPzikdAqizfMEAPjPy+fYar3hOybcHf
 1M2Xy+mzR3TkW/KnRI/DJLi+n1x8o2i4DCuQDCsIGh/21wW/gxuwRVJGU1qnfWfat9vU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMrpH-0004eW-9J; Fri, 10 Apr 2020 11:27:59 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMrpH-0003u1-2c; Fri, 10 Apr 2020 11:27:59 +0000
Subject: Re: preparations for 4.13.1 and 4.12.3
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
 <7ae5179c-8d48-bb83-8250-43a558a04ba5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eed12c79-d2e9-d4b9-4440-f5a787003834@xen.org>
Date: Fri, 10 Apr 2020 12:27:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7ae5179c-8d48-bb83-8250-43a558a04ba5@suse.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 09/04/2020 08:52, Jürgen Groß wrote:
> On 09.04.20 09:41, Jan Beulich wrote:
>> All,
>>
>> the releases are due in a week or two. Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant. (Ian, I notice there haven't been any
>> tools side backports at all so far. Julien, Stefano - same for
>> Arm.)
>>
>> Jan
>>
> 
> Commit bb2a34fd740e9a26be9e2244f1a5b4cef439e5a8 should be backported
> to both IMO (tools patch).

I was going to suggest this one as well :).

Cheers,

-- 
Julien Grall

