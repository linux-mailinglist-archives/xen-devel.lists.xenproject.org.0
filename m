Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC21AEC03
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 13:01:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPlE9-0005uU-5r; Sat, 18 Apr 2020 11:01:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8kJB=6C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPlE7-0005uK-KN
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 11:01:35 +0000
X-Inumbo-ID: f7b846c4-8163-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7b846c4-8163-11ea-b4f4-bc764e2007e4;
 Sat, 18 Apr 2020 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0pf81C8tsobYNsvH2Fh3loQ0nS6jxdDTYbmC9/2MJw=; b=FQ5cl9zTgqZxGeNYb1dshsBeVR
 XfZewbmv5UmUlJMb/wMMbOrBCMeO36rw5Cbk5KuZnk1SIVwDiIvIa6qIVYn/LK/PKFW6vjxO92QlM
 F4qUbKm7bxIPQZbRPfjiUgpSbzm9V06s7qmlwFhjmKri+DKaCp5/u+z3P+l1OfAA0z3k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPlE5-0007RU-8S; Sat, 18 Apr 2020 11:01:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPlE5-0006JO-13; Sat, 18 Apr 2020 11:01:33 +0000
Subject: Re: [PATCH 07/17] xen/x86: traps: Convert __page_fault_type() to use
 typesafe MFN
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-8-julien@xen.org>
 <12a955a3-d326-f5f9-f20b-69f3dafac238@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <527ec42b-1fcf-7e35-0ed7-b9da91a8c583@xen.org>
Date: Sat, 18 Apr 2020 12:01:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <12a955a3-d326-f5f9-f20b-69f3dafac238@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 26/03/2020 15:54, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Note that the code is now using cr3_to_mfn() to get the MFN. This is
>> slightly different as the top 12-bits will now be masked.
> 
> And here I agree with the change. Hence it is even more so important
> that the patch introducing the new helper(s) first gets sorted.
> Should there be further patches in this series with this same
> interaction issue, I won't point it out again and may not respond at
> all if I see no other issues.

I will update the commit message explaining the reason of using 
cr3_to_mfn() and look at the other user.

Cheers,

-- 
Julien Grall

