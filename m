Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4381A4995
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 19:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMxrJ-0004jf-TK; Fri, 10 Apr 2020 17:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aV0t=52=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMxrI-0004jX-4r
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 17:54:28 +0000
X-Inumbo-ID: 520643ee-7b54-11ea-848c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 520643ee-7b54-11ea-848c-12813bfff9fa;
 Fri, 10 Apr 2020 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/sNfJL63uebK9Fb+NoDdGH3FuUqqSE6D3BXp4IAxY5o=; b=TqN471cWYq/q20V+5P4PPE6oCM
 BcyrZKwHNggj1Y/qHoBXQnoFufaBRmtyDoPZwPujZjZIiPtC0RHA+QkDJ2ac+0Dh9IX+ESy3HG6Fb
 Lyt6zpGNo2wlu6QFzaWY0mhwmQbsj1pfHi50C0prm07ClUCfiuAU1sTerydWz0OKVuVY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMxrG-0004AP-FR; Fri, 10 Apr 2020 17:54:26 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMxrG-0002rr-9M; Fri, 10 Apr 2020 17:54:26 +0000
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
 <86c6ffb6-22d0-cbce-8682-dac37697bbfd@xen.org>
 <alpine.DEB.2.21.2004100926350.19608@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <cb32ed05-072f-87a9-a6ed-83a9062df5a5@xen.org>
Date: Fri, 10 Apr 2020 18:54:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004100926350.19608@sstabellini-ThinkPad-T480s>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 10/04/2020 17:37, Stefano Stabellini wrote:
> On Fri, 10 Apr 2020, Julien Grall wrote:
>> On 09/04/2020 08:41, Jan Beulich wrote:
>>> All,
>>
>> Hi Jan & Stefano,
>>
>>> the releases are due in a week or two. Please point out backports
>>> you find missing from the respective staging branches, but which
>>> you consider relevant. (Ian, I notice there haven't been any
>>> tools side backports at all so far. Julien, Stefano - same for
>>> Arm.)
>>
>> Below a list of suggested backport for Arm for 4.12 and 4.13:
>>
>> b4637ed6cd5375f04ac51d6b900a9ccad6c6c03a  xen/arm: initialize vpl011 flag
>> register
>> b31666c8912bf18d9eff963b06d856e7e818ff34  xen/arm: during efi boot, improve
>> the check for usable memory
>> f14f55b7ee295277c8dd09e37e0fa0902ccf7eb4  xen/arm: remove physical timer
>> offset
>> 3c601c5f056fba055b7a1438b84b69fc649275c3  xen/arm: Sign extend TimerValue when
>> computing the CompareValue
> 
> 
> Thanks! I did these four and also the following:
> 
> 69da7d5440c609c57c5bba9a73b91c62ba2852e6 xen/arm: Handle unimplemented VGICv3 registers as RAZ/WI

I saw it and forgot to add it in the list :$.

> 
> 
> 
> Jan,
> 
> I think the following could be a good candidate. It also touches x86 so
> I thought I should ask you.
> 
> 6827bea2b3b99153821b8b7446bdced27f720188 dom0-build: fix build with clang5

If we are backporting build fixes for newer compilers, shouldn't we 
backport all of them?

Cheers,

-- 
Julien Grall

