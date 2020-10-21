Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B325294ABC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 11:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9916.26191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAhw-0000tX-LG; Wed, 21 Oct 2020 09:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9916.26191; Wed, 21 Oct 2020 09:47:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAhw-0000t8-I1; Wed, 21 Oct 2020 09:47:00 +0000
Received: by outflank-mailman (input) for mailman id 9916;
 Wed, 21 Oct 2020 09:46:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e6jT=D4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVAhv-0000ss-Cj
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:46:59 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f722b5ae-1ec8-4871-bf55-4dfc958c245f;
 Wed, 21 Oct 2020 09:46:53 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVAhp-0001Wn-Ik; Wed, 21 Oct 2020 09:46:53 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVAhp-0005sC-B3; Wed, 21 Oct 2020 09:46:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e6jT=D4=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVAhv-0000ss-Cj
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:46:59 +0000
X-Inumbo-ID: f722b5ae-1ec8-4871-bf55-4dfc958c245f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f722b5ae-1ec8-4871-bf55-4dfc958c245f;
	Wed, 21 Oct 2020 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JsbnLHAFf1gZLARWwZWUMurki5jcA5fTYKzle46cHIE=; b=cGnxzuLVOYsGL+RGm8Oo8BPrXE
	r+Vu76esM5wefKOPFrX4F4INnVwL36ecdFna6agX63p2lvoZIU5/vbmoo46UH0xbUls8fIgi1dNn4
	DWW9j5Nw/cYwUTVawqvKlXsrIOLmWkQ9Fiijy4odmm7zZ5Ae4Gcmm78d2tYhO6aQeEZE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVAhp-0001Wn-Ik; Wed, 21 Oct 2020 09:46:53 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVAhp-0005sC-B3; Wed, 21 Oct 2020 09:46:53 +0000
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
 <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
 <f49d478f-4efe-955e-c378-f2fa5fbc6a71@xen.org>
 <alpine.DEB.2.21.2010141350170.10386@sstabellini-ThinkPad-T480s>
 <C07DA84A-6527-4480-99CC-F6B26553E3FE@arm.com>
 <alpine.DEB.2.21.2010151104200.10386@sstabellini-ThinkPad-T480s>
 <a418ff3a-0476-203c-d3d8-add3706eea14@xen.org>
 <DFD23AC6-9F7A-4591-96B3-29F2A04718FF@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1cd355a4-9907-1596-44d3-d524618e4a35@xen.org>
Date: Wed, 21 Oct 2020 10:46:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <DFD23AC6-9F7A-4591-96B3-29F2A04718FF@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 21/10/2020 10:44, Bertrand Marquis wrote:
>> Bertrand reminded me today that I forgot to answer the e-mail (sorry). I am happy with using printk_once().
> 
> Shall i also keep the .enable implementation ?
> At the end having:
>   if ( cpus_have_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) )
> in enable_errata_workarounds is quite clean.

You can pick the one you prefer :).

Cheers,

-- 
Julien Grall

