Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B171B0E11
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXCV-00052i-29; Mon, 20 Apr 2020 14:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQXCT-00052Y-KF
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:15:05 +0000
X-Inumbo-ID: 534249c9-8311-11ea-906a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 534249c9-8311-11ea-906a-12813bfff9fa;
 Mon, 20 Apr 2020 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9sVFCkw9Wu8l6WSbqyH/0aVtir6qS95iEHpEFKks80=; b=hbsS/MuthYW8Vh+D9Zbnecg7/S
 wVDcymMSymRQYX+6sx3A395EYR7BhwgYe28W2TdwVrWCOavwvGou6Rc4/Jd4UIyRA312YwX5/hhVj
 HpfgNtfaizGIqPDc3ROrJhcCraKsTGTW62FDIYJzXSBPtuIf42LIZTVfRy7udqSQOPpQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQXCQ-0006GS-46; Mon, 20 Apr 2020 14:15:02 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQXCP-00080c-T8; Mon, 20 Apr 2020 14:15:02 +0000
Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <002801d61302$dbd21950$93764bf0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <410df70e-6e21-2d0a-8148-62ccf2a24366@xen.org>
Date: Mon, 20 Apr 2020 15:14:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <002801d61302$dbd21950$93764bf0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 15/04/2020 09:50, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 15 April 2020 09:45
>> To: xen-devel@lists.xenproject.org
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
>> Subject: [PATCH 0/3] xenoprof: XSA-313 follow-up
>>
>> Patch 1 was considered to become part of the XSA, but it was then
>> decided against. The other two are a little bit of cleanup, albeit
>> there's certainly far more room for tidying. Yet then again Paul,
>> in his mail from Mar 13, was asking whether we shouldn't drop
>> xenoprof altogether, at which point cleaning up the code would be
>> wasted effort.
>>
> 
> That's still my opinion. This is a large chunk of (only passively maintained) code which I think is of very limited value (since it relates to an old tool, and it only works for PV domains).

While there are no active user we are aware of, this is an example on 
how to implement a profiler backend with Xen. So I would agree with 
Andrew here.

IIRC, the reason behind your request is it makes difficult for your 
xenheap work. Am I correct? If so, do you have a thread explaining the 
issues?

Cheers,

-- 
Julien Grall

