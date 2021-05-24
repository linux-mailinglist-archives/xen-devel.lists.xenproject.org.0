Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4138E6F8
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 14:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131752.246086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llA5u-0003S9-Ul; Mon, 24 May 2021 12:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131752.246086; Mon, 24 May 2021 12:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llA5u-0003PV-RF; Mon, 24 May 2021 12:54:06 +0000
Received: by outflank-mailman (input) for mailman id 131752;
 Mon, 24 May 2021 12:54:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llA5t-0003O0-C7
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 12:54:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llA5s-0002oK-3d; Mon, 24 May 2021 12:54:04 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llA5r-00077Q-U5; Mon, 24 May 2021 12:54:04 +0000
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
	bh=AYRuHgm9Ode4vhzNE5GAcYKMADMPqsumL5rEhpavgaQ=; b=t5OOfiAuEdLKLWVZ82ntqRMNQs
	1c0dV+vLfQS3zcgdEiyzCrhfeD0vMYLEfwosCpCu9DeMbFVRzAyuhTaRFgqktGfKjD07TONHqE4JI
	upfJR8YWk9csBvrXQHvWnwEvT+FDbn0CxyCAtoMFtNrTR8pk102NBkiSSY9dihPo6L1U=;
Subject: Re: [XEN PATCH v1] libxl: use getrandom() syscall for random data
 extraction
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20210524085858.1902-1-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <13bde708-1d87-a2c7-077f-f08db597ae15@xen.org>
Date: Mon, 24 May 2021 13:54:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524085858.1902-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 24/05/2021 09:58, Sergiy Kibrik wrote:
> Simplify libxl__random_bytes() routine by using a newer dedicated syscall.
> This allows not only to substantially reduce its footprint, but syscall also
> considered to be safer and generally better solution:
> 
> https://lwn.net/Articles/606141/
> 
> getrandom() available on Linux, FreeBSD and NetBSD.

 From the man:

VERSIONS
        getrandom() was introduced in version 3.17 of the Linux kernel. 
  Support was added to glibc in version 2.25.

If I am not mistaken glibc 2.25 was released in 2017. Also, the call was 
only introduced in FreeBSD 12.

So I think we want to check if getrandom() can be used. We may also want 
to consider to fallback to read /dev/urandom if the call return ENOSYS.

Cheers,

-- 
Julien Grall

