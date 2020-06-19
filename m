Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E02200469
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:53:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCm2-0008Fi-Gf; Fri, 19 Jun 2020 08:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m4t/=AA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jmCm1-0008Fb-38
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:53:21 +0000
X-Inumbo-ID: 5310d924-b20a-11ea-bb4d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5310d924-b20a-11ea-bb4d-12813bfff9fa;
 Fri, 19 Jun 2020 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZO0uOh6nVnPqft8aQEp9HP5uX28S4DIE8weJ4CUQUA=; b=2i0U8szgZhoRxu0WIRBiCbz44/
 Ul0RLetBv9hwMTbbi838WutfAay1ZVL99NTK9f4dlj0v9ph3z452c7S03MPeEegH3G0OnsLUGR89+
 ggnVV5MXx3pLF/MoZ+ot3mVnyOoFQ3NEm+A5wgbqeYDQpzMrqVv6ogAlLus67GCe73Pk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmClz-0002VI-Na; Fri, 19 Jun 2020 08:53:19 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmClz-0005lZ-Fo; Fri, 19 Jun 2020 08:53:19 +0000
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
 <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
 <alpine.DEB.2.21.2005111534160.26167@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2006181518470.14005@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <57e24ddd-5ba1-eea9-2961-d7dc9ce22688@xen.org>
Date: Fri, 19 Jun 2020 09:53:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006181518470.14005@sstabellini-ThinkPad-T480s>
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/06/2020 23:20, Stefano Stabellini wrote:
> Hi Paul, Julien,
> 
> Volodymyr hasn't come back with an update to this patch, but I think it
> is good enough as-is as a bug fix and I would rather have it in its
> current form in 4.14 than not having it at all leaving the bug unfixed.
> 
> I think Julien agrees.

The approach is okayish but this is not ideal at least without any 
explanation why ignoring a potential bug is fine. I could settle with an 
expanded commit message for now.

Therefore, I don't feel I should provide my Ack on this approach. That 
said, I am not the maintainers of this code. You are free to Ack and 
commit it.

Cheers,

-- 
Julien Grall

