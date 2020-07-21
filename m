Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD6228134
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 15:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxsYt-000865-27; Tue, 21 Jul 2020 13:44:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxsYq-00085z-Vl
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 13:44:01 +0000
X-Inumbo-ID: 3b3d28fe-cb58-11ea-851c-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b3d28fe-cb58-11ea-851c-bc764e2007e4;
 Tue, 21 Jul 2020 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9q6mbDPCI6+EaVu7J0shuHZRkcB9oUqM/9IXzbH5U0Y=; b=No7xAmViNMWgrC6qpMrkHeyXWA
 /bigG+K8A910yUlxHQgjGMRPrvytc6i8ysDni8uOsIqcGli1wXPB/YFw00maGQ1OejGqERr2arMQM
 zHXBt+xZYxw8s3DOAL91WnKhy3kZbopEIH/gZZwAsdOHQ/mMPeL5DEKcHbs4pS+yXyvM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxsYo-0007Kv-Ub; Tue, 21 Jul 2020 13:43:58 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxsYo-0002Py-KG; Tue, 21 Jul 2020 13:43:58 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
 <4454c70e-47fa-46e8-90bf-1904b11318b1@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <048c27bf-a9ab-054c-8955-6e75fb6c6ea5@xen.org>
Date: Tue, 21 Jul 2020 14:43:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4454c70e-47fa-46e8-90bf-1904b11318b1@gmail.com>
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
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 alex.bennee@linaro.org, Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Andre)

Hi Oleksandr,

On 21/07/2020 13:26, Oleksandr wrote:
> On 20.07.20 23:38, Stefano Stabellini wrote:
>> For instance, what's your take on notifications with virtio-mmio? How
>> are they modelled today? Are they good enough or do we need MSIs?
> 
> Notifications are sent from device (backend) to the driver (frontend) 
> using interrupts. Additional DM function was introduced for that purpose 
> xendevicemodel_set_irq_level() which results in vgic_inject_irq() call.
> 
> Currently, if device wants to notify a driver it should trigger the 
> interrupt by calling that function twice (high level at first, then low 
> level).

This doesn't look right to me. Assuming the interrupt is trigger when 
the line is high-level, the backend should only issue the hypercall once 
to set the level to high. Once the guest has finish to process all the 
notifications the backend would then call the hypercall to lower the 
interrupt line.

This means the interrupts should keep firing as long as the interrupt 
line is high.

It is quite possible that I took some shortcut when implementing the 
hypercall, so this should be corrected before anyone start to rely on it.

Cheers,

-- 
Julien Grall

