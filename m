Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E11AA984
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOimX-0000d8-TX; Wed, 15 Apr 2020 14:12:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOimW-0000cw-AK
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:12:48 +0000
X-Inumbo-ID: 2f0bd2b4-7f23-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f0bd2b4-7f23-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=peyQC07JX4ABFAGVP5KwZL5UpS1XrimcPxQD1V1d9C8=; b=xRuBAIKC7nR4bQhMsZrf6RHDSF
 Pe9BL1pa0AdHMm/bbZgTJ5xqF42xv62fiIZ1TKOEEF6NaG/XQ3/QlZSMGdH8W6kb/wCGwWLtbWF9C
 h/rVbcA2s2DbTU0UCy/T6KoIPGvCBmHTcWZxeK3OYXcpB3Z4740COu6pm10J1QfaiXz0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOimU-0004nU-Gn; Wed, 15 Apr 2020 14:12:46 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOimU-0001zg-Af; Wed, 15 Apr 2020 14:12:46 +0000
Subject: Re: [PATCH 11/12] xen/arm: if xen_force don't try to setup the IOMMU
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-11-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <4b4263ba-bf6f-e578-037d-edb8add52aad@xen.org>
Date: Wed, 15 Apr 2020 15:12:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-11-sstabellini@kernel.org>
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
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 15/04/2020 02:02, Stefano Stabellini wrote:
> If xen_force (which means xen,force-assign-without-iommu was requested)
> don't try to add the device to the IOMMU. Return early instead.


Could you explain why this is an issue to call xen_force after 
iommu_add_dt_device()?

Cheers,
-- 
Julien Grall

