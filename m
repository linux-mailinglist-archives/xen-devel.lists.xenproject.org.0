Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985319DB74
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 18:23:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKP6A-0000bD-Kr; Fri, 03 Apr 2020 16:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fKXS=5T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKP69-0000b8-E7
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 16:23:13 +0000
X-Inumbo-ID: 6a39ff2e-75c7-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a39ff2e-75c7-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJFvVntStJYwaHu5kv4zQHFdWi54Kc2oQK1JrPGGqVU=; b=e2H5M1JtaiUDx78IL0Db9VJgrY
 0c2zByt5hY0+X1XoK+YhFmi8e41mvCW0Th+EXGTqGhHfMkyow0BsnyN5pRSXinlWPCPDK/3ycfW/l
 caemyzq/frte1Yak1f63Apx69fSYycZ2JXGttilb6BFlMFAp5ftAIFktyYTUGAI91/8M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKP62-0003Cb-DJ; Fri, 03 Apr 2020 16:23:06 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKP62-00046i-6i; Fri, 03 Apr 2020 16:23:06 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
 <alpine.DEB.2.21.2004030809300.23034@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <55bcb88b-8816-542e-e113-c7cab6507bf4@xen.org>
Date: Fri, 3 Apr 2020 17:23:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004030809300.23034@sstabellini-ThinkPad-T480s>
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
Cc: Peng Fan <peng.fan@nxp.com>, George.Dunlap@citrix.com,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 03/04/2020 17:18, Stefano Stabellini wrote:
> On Fri, 3 Apr 2020, Marc Zyngier wrote:
  > Doing what my patch here does might be OK until one of these guests
> start to rely on ISACTIVER to be accurate. So far I have not seen any
> examples of it, but I agree it could happen, hence, it is risky.

I am only going to answer to this. This is not about *accuracy* but 
deadlock in your guest. I actually wrote a long e-mail on this thread 
explaining the possible deadlock.

It is not because you can't reproduce the deadlock that the dealock is 
not there. When are you going to stop dimissing real bug in your 
implementation?

Cheers,

-- 
Julien Grall

