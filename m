Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12256B3A2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363245.593692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iWK-0001bY-O0; Fri, 08 Jul 2022 07:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363245.593692; Fri, 08 Jul 2022 07:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iWK-0001Y5-Kj; Fri, 08 Jul 2022 07:35:24 +0000
Received: by outflank-mailman (input) for mailman id 363245;
 Fri, 08 Jul 2022 07:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9iWI-0001Xz-S4
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:35:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9iWI-0005YE-70; Fri, 08 Jul 2022 07:35:22 +0000
Received: from [54.239.6.190] (helo=[192.168.18.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9iWH-0005jy-VX; Fri, 08 Jul 2022 07:35:22 +0000
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
	bh=Mms2qwh+RVURms0tYhWd7gB3pp/cJzH0ZMiiPHLELzA=; b=HqYGY2+GYILrwBlF/xXmu/YaEd
	4bdEGxR+a/RcKLz37bPayoDNNLu/U01ZD860ow7mJ7nQ+xBQSxVdJ8EsFfTWeN3XvZgwK8gx9JxFo
	DLPvVaP9bUvueNOzoYAJN2v49yc2Uiibb+6PfEXjVvH690pe6R2K+PxkOcOWtu+g8SPA=;
Message-ID: <2176a93e-5949-022e-d107-e42c859626ef@xen.org>
Date: Fri, 8 Jul 2022 08:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org,
 Doug Goldstein <cardoe@cardoe.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/07/2022 00:05, Stefano Stabellini wrote:
> On Thu, 7 Jul 2022, Julien Grall wrote:
>>> +# Run the test
>>> +rm -f qemu-staticmem.serial
>>> +set +e
>>> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
>>> +timeout -k 1 60 ./binaries/qemu-system-aarch64 -nographic \
>>> +    -M virtualization=true \
>>> +    -M virt \
>>> +    -M virt,gic-version=2 \
>>> +    -cpu cortex-a57 \
>>> +    -smp 2 \
>>> +    -m 8G \
>>> +    -no-reboot \
>>> +    -device virtio-net-pci,netdev=vnet0 -netdev user,id=vnet0,tftp=binaries
>>> \
>>> +    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin \
>>> +    -dtb ./binaries/virt-gicv2.dtb \
>>> +    |& tee qemu-staticmem.serial
>>> +
>>> +set -e
>>
>> A lot of the code above is duplicated from qemu-smoke-arm64.sh. I think it
>> would be better to consolidate in a single script. Looking briefly throught
>> the existing scripts, it looks like it is possible to pass arguments (see
>> qemu-smoke-x86-64.sh).
>   
> One idea would be to make the script common and "source" a second
> script or config file with just the ImageBuilder configuration because
> it looks like it is the only thing different.

This would mean creating a new bash script for every new test. This 
sounds a bit pointless if the only difference is the ImageBuilder 
configuration. Instead, it would be better to pass an argument to the 
script (like qemu-smoke-x86-64.sh) indicating which test we are going to 
perform.

Cheers,

-- 
Julien Grall

