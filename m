Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171121DD547
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 19:51:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbpKc-0001qt-JC; Thu, 21 May 2020 17:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbpKb-0001qo-1G
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 17:50:09 +0000
X-Inumbo-ID: 827e4dee-9b8b-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 827e4dee-9b8b-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oGAzJmBZGs/I95NNBDCcc68aRW8PyOqJUPeoeVkGNIQ=; b=mRisFQyrALZIJ+csPVe+p1nIi9
 8YB3j9vywe6MR58g11LA4J6kz9Kiui6cXM9H/LtGZQWFKHelEzwan1no3PKSnt60jOrEaT4WtcnDh
 jDxGiIB+YrLis0JhASSMa//txte/fU5Eh05p3wh/Zo0SEKtc0IDLru20EjRkqWJ4mzlQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbpKU-0000IS-So; Thu, 21 May 2020 17:50:02 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbpKU-0004Aj-KL; Thu, 21 May 2020 17:50:02 +0000
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200518113008.15422-1-julien@xen.org>
 <alpine.DEB.2.21.2005201512380.27502@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <687bea7e-ade9-8fd3-9a61-e3f5cd6d17be@xen.org>
Date: Thu, 21 May 2020 18:50:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005201512380.27502@sstabellini-ThinkPad-T480s>
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
Cc: minyard@acm.org, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 George Dunlap <george.dunlap@citrix.com>, jeff.kubascik@dornerworks.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 20/05/2020 23:13, Stefano Stabellini wrote:
> On Mon, 18 May 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
>> only use the first GB of memory.
>>
>> This is because several devices cannot DMA above 1GB but Xen doesn't
>> necessarily allocate memory for Dom0 below 1GB.
>>
>> This small series is trying to address the problem by allowing a
>> platform to restrict where Dom0 banks are allocated.
>>
>> This is also a candidate for Xen 4.14. Without it, a user will not be
>> able to use all the RAM on the Raspberry Pi 4.
> 
> The series looks good to me aside from the couple of minor issues being
> discussed

Thanks, I have sent the v2 yesterday but forgot to call 
add_maintainers.pl ([1]). Do you want me to resend it with you CCed?

Cheers,

[1] <20200519172028.31169-1-julien@xen.org>

-- 
Julien Grall

