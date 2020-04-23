Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87B1B5A04
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 13:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZgO-0005bh-MW; Thu, 23 Apr 2020 11:06:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmmv=6H=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRZgM-0005bc-LB
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 11:06:14 +0000
X-Inumbo-ID: 72477864-8552-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72477864-8552-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nRQiXUKM8d0oIrXF+wtuq5xPPyBC/bA8I1F0UfmaBX8=; b=6WEVvp00oJofP7rx2l9p+GZIy7
 AUtqkGdZfF4fD7whKJikII11/eyHqEQeJuLH4nrZ+2/NLGUK3dNMhJnnjNSePD+0Pvw0lJg+f65v7
 +77kyKZb4FoOfFgYLrutitG+uEHJIrBB9uFuYrEsjGfR+1dqcxZxMJRixRfp2GYjykR8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRZgK-0001GL-UG; Thu, 23 Apr 2020 11:06:12 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRZgK-0000KT-ND; Thu, 23 Apr 2020 11:06:12 +0000
Subject: Re: [XTF 0/4] Add strncmp(), strtol() and strtoul() functions
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org
References: <20200423101918.13566-1-wipawel@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <1637c166-75f5-4034-e3a0-6921aabbdfab@xen.org>
Date: Thu, 23 Apr 2020 12:06:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423101918.13566-1-wipawel@amazon.de>
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
Cc: semelpaul@gmail.com, andrew.cooper3@citrix.com, nmanthey@amazon.de,
 wipawel@xen.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 23/04/2020 11:19, Pawel Wieczorkiewicz wrote:
> Add FreeBSD's implementation of strtol() and strtoul() functions from:
> https://github.com/freebsd/freebsd/blob/master/lib/libc/stdlib/strtoul.c

I would suggest to specify the baseline used in each commit. This will 
allows us to track any changes that was made afterwards (even if it 
seems unlikely) in the FreeBSD code base.


> 
> The FreeBSD code being added as a separate file (common/libc/strtol.c)
> is under the BSD 3-clause license. Modification to COPYING file might
> be needed.
> 
> Also add simple implementation of the strncmp() function.
> 
> Paul Semel (1):
>    string: add freebds libc implementation of strtol()
> 
> Pawel Wieczorkiewicz (3):
>    libc, strtol: Add isspace(), isdigit(), isxdigit(), isascii()
>    libc, strtol: Add FreeBSD libc implementation of strtoul()
>    libc: add strncmp() function
> 
>   build/files.mk          |   1 +
>   common/lib.c            |   8 --
>   common/libc/string.c    |  11 +++
>   common/libc/strtol.c    | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
>   common/libc/vsnprintf.c |   8 --
>   include/xtf/libc.h      |  35 +++++++++
>   6 files changed, 248 insertions(+), 16 deletions(-)
>   create mode 100644 common/libc/strtol.c
> 

-- 
Julien Grall

