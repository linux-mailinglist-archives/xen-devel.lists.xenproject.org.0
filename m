Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2275AC17
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 12:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566529.885465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQyy-0003bp-1r; Thu, 20 Jul 2023 10:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566529.885465; Thu, 20 Jul 2023 10:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQyx-0003YT-Tq; Thu, 20 Jul 2023 10:34:03 +0000
Received: by outflank-mailman (input) for mailman id 566529;
 Thu, 20 Jul 2023 10:34:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMQyw-0003YN-16
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 10:34:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMQyv-0000xH-Hr; Thu, 20 Jul 2023 10:34:01 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMQyv-0006Cv-AG; Thu, 20 Jul 2023 10:34:01 +0000
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
	bh=T/Fe3Eh2Rsktx395xpMTwguu8JjKlhWxiyLQahpWNnc=; b=n6T8amDkRfLgU8ev6aUxE6Vr+G
	Jlnb5aEdZmUIpRe54XSYdKEjPH6Dezmw9PPJFcTnFzsojkY1PIUKtoCJLqzg/qYrX7DTeoDkrHP6u
	Av73rQAW4Z1js+jvzYyWhUKRGIwBqEZZGFAlLE2CoRkKTj3gf62/6E1zQEL7jsA+A46s=;
Message-ID: <048266d6-a32f-5f4e-984a-8b74de01a1fc@xen.org>
Date: Thu, 20 Jul 2023 11:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [ARM][xencons] PV Console hangs due to illegal ring buffer
 accesses
Content-Language: en-US
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.mocanu@nxp.com,
 Juergen Gross <jgross@suse.com>
References: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Juergen)

On 19/07/2023 17:13, Andrei Cherechesu (OSS) wrote:
> Hello,

Hi Andrei,

> As we're running Xen 4.17 (with platform-related support added) on NXP S32G SoCs (ARMv8), with a custom Linux distribution built through Yocto, and we've set some Xen-based demos up, we encountered some issues which we think might not be related to our hardware. For additional context, the Linux kernel version we're running is 5.15.96-rt (with platform-related support added as well).
> 
> The setup to reproduce the problem is fairly simple: after booting a Dom0 (can provide configuration details if needed), we're booting a normal PV DomU with PV Networking. Additionally, the VMs have k3s (Lightweight Kubernetes - version v1.25.8+k3s1: https://github.com/k3s-io/k3s/releases/tag/v1.25.8%2Bk3s1) installed in their rootfs'es.
> 
> The problem is that the DomU console hangs (no new output is shown, no input can be sent) some time (non-deterministic, sometimes 5 seconds, other times like 15-20 seconds) after we run the `k3s server` command. We have this command running as part of a sysvinit service, and the same behavior can be observed in that case as well. The k3s version we use is the one mentioned in the paragraph above, but this can be reproduced with other versions as well (i.e., v1.21.11, v1.22.6). If the `k3s server` command is ran in the Dom0 VM, everything works fine. Using DomU as an agent node is also working fine, only when it is run as a server the console problem occurs.
> 
> Immediately after the serial console hangs, we can still log in on DomU using SSH, and we can observe the following messages its dmesg:
> [   57.905806] xencons: Illegal ring page indices

Looking at Linux code, this message is printed in a couple of place in 
the xenconsole driver.

I would assume that this is printed when reading from the buffer 
(otherwise you would not see any message). Can you confirm it?

Also, can you provide the indices that Linux considers buggy?

Lastly, it seems like the barrier used are incorrect. It should be the 
virt_*() version rather than a plain mb()/wmb(). I don't think it matter 
for arm64 though (I am assuming you are not running 32-bit).

> [   59.399620] xenbus: error -5 while reading message

So this message is coming from the xenbus driver (used to read the 
xenstore ring). This is -EIO, and AFAICT returned when the indices are 
also incorrect.

For this driver, I think there is also a TOCTOU because a compiler is 
free to reload intf->rsp_cons after the check. Moving virt_mb() is 
probably not sufficient. You would also want to use ACCESS_ONCE().

What I find odd is you have two distinct rings (xenconsole and xenbus) 
with similar issues. Above, you said you are using Linux RT. I wonder if 
this has a play into the issue because if I am not mistaken, the two 
functions would now be fully preemptible.

This could expose some races. For instance, there are some missing 
ACCESS_ONCE() (as mentioned above).

In particular, Xenstored (I haven't checked xenconsoled) is using += to 
update intf->rsp_cons. There is no guarantee that the update will be atomic.

Overall, I am not 100% sure what I wrote is related. But that's probably 
a good start of things that can be exacerbated with Linux RT.

> [   59.399649] xenbus: error -5 while writing message

This is in xenbus as well. But this time in the write part. The analysis 
I wrote above for the read part can be applied here.

Cheers,

-- 
Julien Grall

