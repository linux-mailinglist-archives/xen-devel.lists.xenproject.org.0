Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC4D1F0740
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 17:20:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhabo-0005ey-1i; Sat, 06 Jun 2020 15:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5qQO=7T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jhabm-0005et-CM
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 15:19:42 +0000
X-Inumbo-ID: 2507c372-a809-11ea-ba62-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2507c372-a809-11ea-ba62-bc764e2007e4;
 Sat, 06 Jun 2020 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBa0dSX3WEWfT4c7XliybFj/QkpuAYvi5id0k/Pzhj8=; b=PRnmrFcJDJ84Q9pZjoFQV78XNw
 U4iSv7AVZHOp/bHpRJMC/t/vmbatTFVuTNwYsZYO2quT1HYd4FBM+d9S/dsDoC80nsqJbqnaljarb
 NM0HDRfB2BPajVc9Cuq660TvVoZScvpuk9NNDSjFmvlkhiSI7lglK5LByZpdrxs5LBS8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhabl-0008G9-ER; Sat, 06 Jun 2020 15:19:41 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhabl-00044c-7e; Sat, 06 Jun 2020 15:19:41 +0000
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "paul@xen.org" <paul@xen.org>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
Date: Sat, 6 Jun 2020 16:19:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+Paul)

Hi,

On 18/05/2020 02:53, Volodymyr Babchuk wrote:
> Trusted Applications use popular approach to determine required size
> of buffer: client provides a memory reference with the NULL pointer to
> a buffer. This is so called "Null memory reference".  TA updates the

NIT: You use double space after '.' here but all the others use a single 
space.

> reference with the required size and returns it back to client. Then
> client allocates buffer of needed size and repeats the operation.
> 
> This behavior is described in TEE Client API Specification, paragraph
> 3.2.5. Memory References.

 From the spec, it is not a clear cut that NULL will always used as 
fetching the required size of an output buffer. In particular, they 
suggest to refer to the protocol.

In your commit message you indirectly point to an example where 0/NULL 
would have a different meaning depending on the flags. This is not 
explained in the TEE Client API Specification. Do you have some pointer 
I could use to check the behavior?

> 
> OP-TEE represents this null memory reference as a TMEM parameter with
> buf_ptr == NULL. This is the only case when we should allow TMEM
> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.

IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer at 
address 0" but with the flag cleared, it would mean "return the size". 
Am I correct?

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
The code looks to match your commit message, but I wasn't able to match 
it with the spec. Do you have other pointer I could use to check the 
behavior?

I assume this wants to be part of Xen 4.14. The change is only for 
OP-TEE which is a tech preview feature. So the risk is very limited.

Cheers,

-- 
Julien Grall

