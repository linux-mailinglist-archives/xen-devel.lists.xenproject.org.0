Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09A47EF32
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 14:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251377.432689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0kev-0004Du-NK; Fri, 24 Dec 2021 13:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251377.432689; Fri, 24 Dec 2021 13:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0kev-0004B1-K1; Fri, 24 Dec 2021 13:30:57 +0000
Received: by outflank-mailman (input) for mailman id 251377;
 Fri, 24 Dec 2021 13:30:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n0keu-0004Av-Ks
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 13:30:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0kes-0002ck-MD; Fri, 24 Dec 2021 13:30:54 +0000
Received: from lfbn-ren-1-1977-131.w90-59.abo.wanadoo.fr ([90.59.184.131]
 helo=[192.168.1.19]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0kes-0004Wq-4S; Fri, 24 Dec 2021 13:30:54 +0000
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
	bh=ij/F5CdH3kvc+dTdOHjC9asMiDF7yrl4TB648wkINik=; b=3hAXE+fezGMdJlO96BU2n7majY
	v+etInXX+WqYaBI1en6NtiYilDK11+ZYFMJMcdv+VQkWI22bIaqubbP+AV7ayXxk3sHd2HfZlz5Il
	8lxV4tplZmFN9p0ymNAsPm0zr4tun3QanZylT4KbMTryvueOwDjjrk/S/1pX07oEKj3c=;
Message-ID: <b85f7ea3-dd0c-1281-d1e2-1010fb2f5892@xen.org>
Date: Fri, 24 Dec 2021 14:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Oleksandr <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
 <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
 <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org> <87lf0cx50o.fsf@epam.com>
 <3967a86d-295f-7672-9ce3-71e1c393dcbd@xen.org> <87ee64x1hf.fsf@epam.com>
 <796960e7-62ab-6f05-b3c0-cd02d7e8a8ba@xen.org>
 <alpine.DEB.2.22.394.2112221636530.2060010@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112231056380.2060010@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2112231056380.2060010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/12/2021 20:06, Stefano Stabellini wrote:
> On Wed, 22 Dec 2021, Stefano Stabellini wrote:
>> # Future Ideas
>>
>> A great suggestion by Julien is to start supporting the dom0less partial
>> device tree format in xl/libxl as well so that we can have a single
>> "device_tree" option in dom.cfg instead of 4 (device_tree, iomem, irqs,
>> dtdev).
>>
>> Even with that implemented, the user has still to provide a partial dtb,
>> xen,reg and xen,path. I think this is a great step forward and we should
>> do that, if nothing else to make it easier to switch between dom0less
>> and normal domU configurations. But the number of options and
>> information that the user has to provide is still similar to what we
>> have today.
> 
> I have just realized that if we start to parse the partial DTB in
> xl/libxl the same way that we do for dom0less guests (parse "xen,path",
> "xen,reg", and "interrupts", making dtdev, irqs and iomem optional)
> actually we can achieve the goal below thanks to the combination:
> "xen,path" + "xen,force-assign-without-iommu".
> 
> In other words, with dom0less we already have a way to specify the link
> to the host node even if the device is not a DMA master. We can do that
> by specifying both xen,path and xen,force-assign-without-iommu for a
> device.
> 
> This is just FYI. I am not suggesting we should introduce dom0less-style
> partial DTBs in order to get SCMI support in guests (although it would
> be great to have). I think the best way forward for this series is one
> of the combinations below, like a) + d), or a) + c)

I strongly prefer a) + c) because a warning is easy to miss/ignore. At 
least with the extra property the user made an action to think about it 
and agree that this is the way do it.

It is also easier to spot if we ask the user to provide the 
configuration file.

Cheers,

-- 
Julien Grall

