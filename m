Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A521A45BF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 13:38:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMrz9-0006Eg-CT; Fri, 10 Apr 2020 11:38:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aV0t=52=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMrz7-0006Eb-Hl
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 11:38:09 +0000
X-Inumbo-ID: c0589822-7b1f-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0589822-7b1f-11ea-b58d-bc764e2007e4;
 Fri, 10 Apr 2020 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73ESszSL0YvhVkT76Opw1FgG4bSXlvJZrXBAFzm3Dvo=; b=wLAtsZ5kRIYdK/FdgY0372PYLL
 +3HE7kalKUr+3Ou6fGl0O3zZAUIH0d6VO6+Q5KRpUr/E1nZBGDTPSfds52qOi8YX83+DkP34uJU7t
 YlOjQAOTnrH6UTwmakFufBz5/NNqcPRJO23aEHSRY6lkk+BjhvW9WVhSsc98SgtpfpJ4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMrz5-0004rE-Ps; Fri, 10 Apr 2020 11:38:07 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMrz5-0004de-JT; Fri, 10 Apr 2020 11:38:07 +0000
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86c6ffb6-22d0-cbce-8682-dac37697bbfd@xen.org>
Date: Fri, 10 Apr 2020 12:38:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
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
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 09/04/2020 08:41, Jan Beulich wrote:
> All,

Hi Jan & Stefano,

> the releases are due in a week or two. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, I notice there haven't been any
> tools side backports at all so far. Julien, Stefano - same for
> Arm.)

Below a list of suggested backport for Arm for 4.12 and 4.13:

b4637ed6cd5375f04ac51d6b900a9ccad6c6c03a  xen/arm: initialize vpl011 
flag register
b31666c8912bf18d9eff963b06d856e7e818ff34  xen/arm: during efi boot, 
improve the check for usable memory
f14f55b7ee295277c8dd09e37e0fa0902ccf7eb4  xen/arm: remove physical timer 
offset
3c601c5f056fba055b7a1438b84b69fc649275c3  xen/arm: Sign extend 
TimerValue when computing the CompareValue

Cheers,

-- 
Julien Grall

