Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497A224AF9
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 13:32:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwl4e-0001dg-7l; Sat, 18 Jul 2020 11:32:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BrZA=A5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwl4c-0001db-JS
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 11:32:10 +0000
X-Inumbo-ID: 5149b3bc-c8ea-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5149b3bc-c8ea-11ea-bca7-bc764e2007e4;
 Sat, 18 Jul 2020 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ssvoD9JZruOrEm0SPhSB2xinvmxMn18+8nq81L5UHRQ=; b=xN8WCjH7Ok5UIpSd8U/8uCQUuI
 VSmi3uF5qNksGIdLSZt3GwEGvyShV9aYzOB24EUjoMgL8Opw/haqTWd2OE4dU5YrQmAeVwblgI4ye
 VEtCo0hq9E8/uD5zRM4sKUOiNBDasbrgEOkt0ShFrq04/Yr9ckEOzA5Dm9nJczw/Zi5g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwl4a-000443-S9; Sat, 18 Jul 2020 11:32:08 +0000
Received: from cpc91186-cmbg18-2-0-cust22.5-4.cable.virginm.net ([80.1.50.23]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwl4a-0006Su-Gp; Sat, 18 Jul 2020 11:32:08 +0000
Subject: Re: PCI devices passthrough on Arm design proposal
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
 <20200717160550.GZ7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <36d5f1a0-bfd6-45af-662e-2820e2bea08b@xen.org>
Date: Sat, 18 Jul 2020 12:32:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717160550.GZ7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 17/07/2020 17:05, Roger Pau Monné wrote:
> IIRC Julien even said that Arm was likely to require much less traps
> than x86 for accesses to MSI and MSI-X since you could allow untrusted
> guests to write directly to the registers as there's another piece of
> hardware that would already translate the interrupts?

This is correct in the case of the ITS. This is because the hardware 
will tag the message with the deviceÌD. So there is no way to spoof it.

However, this may not be the case of other MSI controllers. For 
instance, in the case of the GICv2m, I think we will need to trap and 
sanitize the MSI message (see [1]).

[1] https://www.linaro.org/blog/kvm-pciemsi-passthrough-armarm64/

-- 
Julien Grall

