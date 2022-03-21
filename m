Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC04E31DA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 21:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293208.498025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOhc-0004Yu-KE; Mon, 21 Mar 2022 20:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293208.498025; Mon, 21 Mar 2022 20:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOhc-0004WD-Gr; Mon, 21 Mar 2022 20:32:32 +0000
Received: by outflank-mailman (input) for mailman id 293208;
 Mon, 21 Mar 2022 20:32:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWOha-0004W5-UL
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 20:32:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWOha-00072u-0Q; Mon, 21 Mar 2022 20:32:30 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWOhZ-0000tt-Q3; Mon, 21 Mar 2022 20:32:29 +0000
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
	bh=IqHyl49P5dm9QxJaLPxl6Uu+0SLqnE2YOMoXo25d9WQ=; b=UBvjsYikQ6kbDachlaaSRJL8tK
	1aiMcLTFAeSp8TlZ9HS1xxXORiRT98nYRu98Wccpfdfxh3hKK/0ujgyf6zBedFfqSPdDMKP6QgsTW
	NuiO6zd+edDFBn9gqrVt/rUJvTmnKEnMVPvJMRnXULpJ6bBl/v0G+no+qWheRALOfdUc=;
Message-ID: <aa148f5a-4ff2-bebc-2be9-f8b647b95386@xen.org>
Date: Mon, 21 Mar 2022 20:32:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org,
 andrew.cooper3@citrix.com, anthony.perard@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop>
 <20220319003221.3012314-2-sstabellini@kernel.org>
 <alpine.DEB.2.22.394.2203191842280.2910984@ubuntu-linux-20-04-desktop>
 <684d65b8-5de4-779c-d869-bac28e073091@xen.org>
 <alpine.DEB.2.22.394.2203211229430.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203211229430.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/03/2022 19:47, Stefano Stabellini wrote:
> On Sun, 20 Mar 2022, Julien Grall wrote:
>> On 20/03/2022 01:46, Stefano Stabellini wrote:
>>> On Fri, 18 Mar 2022, Stefano Stabellini wrote:
>>>> Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
>>>> the test-artifacts qemu container. The minimal test simply boots Xen
>>>> (built from previous build stages) and Dom0. The test is fetching the
>>>> Dom0 kernel and initrd from Debian Jessie: they work just fine and this
>>>> way we don't have to maintain a build for them too.
>>>
>>>
>>> Thanks to the Xen fix recently submitted
>>> (https://marc.info/?l=xen-devel&m=164774063802402) I'll be able to
>>> update this script to use Debian Bullseye. I am thinking of merging the
>>> below directly with this patch.
>>>
>>>
>>> ---
>>>
>>> automation: upgrade Debian to Bullseye for testing Xen aarch32
>>>
>>> Also change initrd. As the new netboot initrd from Debian Bullseye is
>>> huge (22MB), use a tiny initrd from Alpine Linux instead (only 2.5MB).
>>
>> This is sounds odd to me. So we are going to use Bullseye but not really
>> because we want to use a different initrd.
>>
>> Why can't you get everything from the same place?
> 
> Because it doesn't work :-(
> 
> 
>>> Also note that the huge Debian Bullseye initrd would cause QEMU to
>>> crash due to the -device loader parameter.
>>
>> Can you provide more details? Was this reported to QEMU?
> 
> QEMU core dumps when provided with the Debian Bullseye initrd binary to
> load. I guessed it was due to the size and tried with a smaller size.
> Everything worked with a smaller initrd. I also think that it is not a
> good idea to use a 22MB initrd anyway so decided against the Debian
> Bullseye initrd. 

Why is it a bad idea? In general, bigger file allows us to test corner 
cases.

> (For reference 22MB is basically the size of a fully
> featured Yocto-build rootfs.) I did not file a bug to qemu-devel yet and
> didn't investigate further on the QEMU side as I ran out of time.
> 
> Alpine Linux provides a very nice 2.5MB initrd. I tried to use both
> kernel and initrd from Alpine Linux but unfortunately the Alpine Linux
> kernel doesn't boot. I don't know why but I think it is because it might
> be missing the console driver. I am not sure. There are a lot of
> combinations that don't work and it is time consuming to investigate
> them all. I have been trying to investigate only the most critical
> things -- they are too many!
> 
> I should add that the Debian initrd is not the ideal initrd because it
> is made to start the Debian installer. Here we just want a tiny busybox
> initrd.
> 
> In general, I think it would be better if we could use the kernel and
> initrd from the same source but I couldn't find one that works. I could
> build one myself but it would be one more thing to maintain in
> gitlab-ci. Also using u-boot might solve the problem of loading the
> binary but again we would have to maintain a u-boot arm32 build in
> gitlab-ci.
> 
> So in order of preference best to worst in my opinion:
> 
> 1) kernel and initrd from the same source
> 2) kernel and initrd from different sources
> 3) build your own kernel/initrd/u-boot
> 
> So I ended up doing 2). I tested it and it is sufficient to get the test
> up and running.

Thanks for the explanation. So I think we should not call that an 
"Upgrade to Bullseye" because you are not using Debian. Instead, you 
borrowed a working kernel that happens to have everything you need built-in.

Also, can you update the commit message and provide a summary of this 
discussion?

Cheers,

-- 
Julien Grall

