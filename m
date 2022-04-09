Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C94FA639
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 11:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302127.515694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7BH-0000YB-9f; Sat, 09 Apr 2022 09:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302127.515694; Sat, 09 Apr 2022 09:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7BH-0000VN-6S; Sat, 09 Apr 2022 09:14:55 +0000
Received: by outflank-mailman (input) for mailman id 302127;
 Sat, 09 Apr 2022 09:14:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nd7BF-0000VF-Rt
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 09:14:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd7BE-0001Qa-On; Sat, 09 Apr 2022 09:14:52 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd7BE-0003SN-JV; Sat, 09 Apr 2022 09:14:52 +0000
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
	bh=WFAsVG1BZCYpAHsTF+WCOg3c33JqOuM8/oTwhWByfRo=; b=vjv8moD7j6OR9VagOROUHLAZSa
	RTK5xALnPQSODXPpigdZiMqSB8a9BTxWWRa0WqJ3hgIz6GzGYS8+1EgWca0TG44gfIIRNj0V38sFi
	NIRrjxD9WaR15jlpXMJXjAu79pVKDzNy5cXVD5df4VqElTi40EMK6NmzrQ/bWhT6sXHI=;
Message-ID: <adfb6995-b241-792c-51ef-59364a441976@xen.org>
Date: Sat, 9 Apr 2022 10:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreign
 memory map
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-12-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2203171831410.3497@ubuntu-linux-20-04-desktop>
 <DU2PR08MB732592AD40BAA48F390445AAF71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204081523110.3066615@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204081523110.3066615@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/04/2022 23:46, Stefano Stabellini wrote:
> So I don't think that when the owner dies, we need to actively go and
> unmap the pages at the borrowers. Also because it would likely cause
> them to crash: from their point of view the memory was there, and
> suddenly it is not there anymore.

I agree with that. Also, the code is likely going to be quite complex 
because there are a lot of things that can go wrong (e.g. the domain ID 
has been re-used). I will comment there directly.

Cheers,

-- 
Julien Grall

