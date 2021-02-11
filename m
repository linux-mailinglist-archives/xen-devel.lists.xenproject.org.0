Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8576318CC5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 14:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83910.157166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACUE-00087v-MN; Thu, 11 Feb 2021 13:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83910.157166; Thu, 11 Feb 2021 13:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACUE-00087W-Iw; Thu, 11 Feb 2021 13:58:26 +0000
Received: by outflank-mailman (input) for mailman id 83910;
 Thu, 11 Feb 2021 13:58:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lACUD-00087R-Nx
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 13:58:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lACUB-0004xO-IV; Thu, 11 Feb 2021 13:58:23 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lACUB-0008WC-Be; Thu, 11 Feb 2021 13:58:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=neBAoV5Fv2eWcseKDUVFyfEBzVNRpAVb4oidqOMd4qw=; b=h948uGjfRNvdtkZcxVV2wW2z23
	t20KKBo1vEPQBJJqAgpckUKP2ETe+Q3eyuunHLQ9Dk9jyx9A8kxCHH/+pq/UU6TVw/IhNDa8zi+G8
	PdknCeORSVV0THRnNyw+J8QOH23pXUGAV9VaVZhDPHMiq3HJsUAUEQdU+i2ipFpiKPqM=;
Subject: Re: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr_Babchuk@epam.com, ehem+xen@m5p.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210209195334.21206-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c7fcaa1e-7f0f-577d-3b6a-388954b492f0@xen.org>
Date: Thu, 11 Feb 2021 13:58:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209195334.21206-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/02/2021 19:53, Stefano Stabellini wrote:
> PCI buses differ from default buses in a few important ways, so it is
> important to detect them properly. Normally, PCI buses are expected to
> have the following property:
> 
>      device_type = "pci"
> 
> In reality, it is not always the case. To handle PCI bus nodes that
> don't have the device_type property, also consider the node name: if the
> node name is "pcie" or "pci" then consider the bus as a PCI bus.
> 
> This commit is based on the Linux kernel commit
> d1ac0002dd29 "of: address: Work around missing device_type property in
> pcie nodes".
> 
> This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
> on their device trees:
> 
> &pcie0 {
> 	pci@1,0 {
> 		#address-cells = <3>;
> 		#size-cells = <2>;
> 		ranges;
> 
> 		reg = <0 0 0 0 0>;
> 
> 		usb@1,0 {
> 				reg = <0x10000 0 0 0 0>;
> 				resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> 		};
> 	};
> };
> 
> The pci@1,0 node is a PCI bus. If we parse the node and its children as
> a default bus, the reg property under usb@1,0 would have to be
> interpreted as an address range mappable by the CPU, which is not the
> case and would break.
> 
> Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com/
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

