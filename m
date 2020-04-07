Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF21A1220
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:52:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLrT2-0005jl-JV; Tue, 07 Apr 2020 16:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLrT1-0005jg-Mt
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:52:51 +0000
X-Inumbo-ID: 37cf6d04-78f0-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37cf6d04-78f0-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ynhspTrE83H9C4Y4unnFhl+Pa/HKUi6A/isy3rJPAJA=; b=UkWdIFD7bufSYi4ky5q9zIXwpC
 LHRHzFzEkWpoEh+QLKkMMyxzIWnDUK1hRdKD2bk7vOqFzabmUDQK99rspfgjj5wXfhIGdXcqoGDvd
 Fv/CqQJCh9bM4x0qC5KTcwXmijEcrmBfj4g0zyTTnOU+wfNYE7SRpHLT8fnppiN3tjWg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLrSw-0007rL-Cb; Tue, 07 Apr 2020 16:52:46 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLrSw-0004bT-5Q; Tue, 07 Apr 2020 16:52:46 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <C92DBD17-A2FF-48CC-AE75-228BF51F41C2@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <33b8ee9f-fa24-3b79-7d7b-2b82b3f21a5e@xen.org>
Date: Tue, 7 Apr 2020 17:52:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <C92DBD17-A2FF-48CC-AE75-228BF51F41C2@arm.com>
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 nd <nd@arm.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 07/04/2020 17:25, Bertrand Marquis wrote:
> This is possible to do on a per interrupt basis or when all interrupts 
> in LR registers have all been handled (maintenance interrupt when there 
> is nothing left to handle in LR registers, used to fire other interrupts 
> if we have more pending interrupts then number of LR registers).
> 
> Maybe a solution making sure we get a maintenance interrupts once all 
> interrupts in LR registers have been handled could be a good mitigation ?

The chance of having multiple interrupts inflight is fairly limited. So 
effectively, you will trap for every interrupts.

Cheers,

-- 
Julien Grall

