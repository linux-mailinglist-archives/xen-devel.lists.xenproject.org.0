Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55145A429
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229625.397083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWFU-0001g8-28; Tue, 23 Nov 2021 13:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229625.397083; Tue, 23 Nov 2021 13:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWFT-0001eJ-Uz; Tue, 23 Nov 2021 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 229625;
 Tue, 23 Nov 2021 13:54:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpWFS-0001eD-5M
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:54:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpWFR-0004LT-E7; Tue, 23 Nov 2021 13:54:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpWFR-00052l-6A; Tue, 23 Nov 2021 13:54:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZmSw9u3OOsJ+I97X7lbdAt3rQqnXNo2l41mXDilUtkc=; b=sl2SMweF5ExptBx3k9Y2t2ME+k
	8/WNl64jtJdbOx3+HByydYGeOA9jm9rlDfgE4IsvWtTMp9xKmAWiRf50IY/sCAEoZr7H86ye2NwOB
	8PhXQKgiT3LsLvQ0QVBTqfyyjI+8/K+MQvB5FUcNwnClapmTw9HASw0TYShTvElbC7yo=;
Message-ID: <d1139023-6788-2c58-5873-327e0917f868@xen.org>
Date: Tue, 23 Nov 2021 13:54:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
 <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
 <17cd2c69-56cb-15b9-d381-f854aea55d27@xen.org>
 <alpine.DEB.2.22.394.2111191052050.1412361@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111191052050.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/11/2021 18:55, Stefano Stabellini wrote:
> On Fri, 19 Nov 2021, Julien Grall wrote:
>> I like better Juergen's version. But before agreeing on the command line , I
>> would like to understand how Linux is dealing with big.LITTLE today (see my
>> question above).
> 
> I also like Juergen's version better :-)
> 
> The device tree binding that covers big.LITTLE is the same that covers
> cpus: Documentation/devicetree/bindings/arm/cpus.yaml

Are you sure? I found 
Documentation/devicetree/bindings/arm/cpu-capacity.txt.

> 
> So basically, you can tell it is a big.LITTLE system because the
> compatible strings differ between certain cpus, e.g.:
> 
>        cpu@0 {
>          device_type = "cpu";
>          compatible = "arm,cortex-a15";
>          reg = <0x0>;
>        };
> 
>        cpu@1 {
>          device_type = "cpu";
>          compatible = "arm,cortex-a15";
>          reg = <0x1>;
>        };
> 
>        cpu@100 {
>          device_type = "cpu";
>          compatible = "arm,cortex-a7";
>          reg = <0x100>;
>        };
> 
>        cpu@101 {
>          device_type = "cpu";
>          compatible = "arm,cortex-a7";
>          reg = <0x101>;
>        };

I have not found any code in Linux using the compatible. Instead, they 
all seem to use the cpu-map (see drivers/base/arch_topology.c).

Anyway, to me it would be better to parse the Device-Tree over using the 
MIDR. The advantage is we can cover a wide range of cases (you may have 
processor with the same MIDR but different frequency). For now, we could 
create a cpupool per cluster.

Cheers,

-- 
Julien Grall

