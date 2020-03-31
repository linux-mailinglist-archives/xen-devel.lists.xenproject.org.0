Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BE1988B1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 02:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJ4Ph-0004Fk-72; Tue, 31 Mar 2020 00:05:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sM9E=5Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJ4Pf-0004Ff-N3
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 00:05:51 +0000
X-Inumbo-ID: 60f1d46e-72e3-11ea-b9fe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60f1d46e-72e3-11ea-b9fe-12813bfff9fa;
 Tue, 31 Mar 2020 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GNfxd87wWCLhoBCEJN7psuPGo/ncbt1O4YGR1T07lTc=; b=Zc6njl1uNKIPzKtCI7cSLZY6g6
 Y4vHeYFgNRMvMy89fB/pr+vgdHXVhS2l6MG5an1plp4riaIWgR5/SQ2EjjTu4bDCeK9tphSQjBeCc
 YBAg2MeWc08b2qB4CIAiAXTxdgSCipL+GY+apXYUz+sl+t0l0Jr0ozgdQT8yONfx35rM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJ4PY-0001O7-DZ; Tue, 31 Mar 2020 00:05:44 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJ4PY-0007vH-75; Tue, 31 Mar 2020 00:05:44 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e04bce54-d638-56e4-d4c9-e888c879ab85@xen.org>
Date: Tue, 31 Mar 2020 01:05:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327023451.20271-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER
 reads
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
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 27/03/2020 02:34, Stefano Stabellini wrote:
> It doesn't take into account the latest state of interrupts on
> other vCPUs.

So I think your implementation is going to introduce a deadlock in the 
guest. Let's imagine a guest with 2 vCPUs (A and B) with the following 
setup:
     * The HW SPI 32 is routed to and serviced by vCPU B.
     * vCPU A will routinely wait for any pending SPI 32 to be finished 
before performing a specific task.

In the current form of the vGIC, vCPU B will not exit to Xen when SPI 32 
has been deactivated. Instead, the vCPU will continue to run until an 
unrelated trap happen (I/O emulation, IRQs...). Depending on your setup 
(think NULL scheduler) this may happen in a really long time (or never).

Until the vCPU B exit to Xen, SPI 32 may be considered as active. 
Therefore vCPU A will keep waiting and be block until vCPU B is finally 
trapping in Xen.

My example above is basically a cut down version of 
__synchronize_hardirq() in Linux. In practice, you may be lucky most of 
the times because there will be trap happening time to time. However, it 
also means the task you need to perform on vCPU A will be delayed.

So I would not really bet on the trap here. You have two options:
      1) Force the vCPU to trap when deactivating an interrupt
      2) For the vCPUs to exiting when reading I{S,C}ACTIVER

1) will incur cost on every interrupts which is not great. So I think 
your best option is 2) here.

Cheers,

-- 
Julien Grall

