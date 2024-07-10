Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010F92CE11
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756628.1165297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTTH-0006tQ-7G; Wed, 10 Jul 2024 09:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756628.1165297; Wed, 10 Jul 2024 09:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTTH-0006rA-4Q; Wed, 10 Jul 2024 09:18:43 +0000
Received: by outflank-mailman (input) for mailman id 756628;
 Wed, 10 Jul 2024 09:18:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sRTTF-0006r4-Bg
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:18:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRTTD-0005ze-Kq; Wed, 10 Jul 2024 09:18:39 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRTTD-0005sc-Bl; Wed, 10 Jul 2024 09:18:39 +0000
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
	bh=+THUU6rO2BICbHzhrMyDnWDJc8MKsPU4aoS6Qp7k5HQ=; b=JuNC52X/eDSHIJOKMZmDbciofm
	P1UPPlo50rprAi3qyzg/8WJmiQw/1APM9h5WY/NPHJl2Gy8i3qww+EPSGOAjALwr+QkwbezxnGjWZ
	4OGrmlYAa/v+ICs9IeVyKU0oUgx7mlGhS/OOp4FTFvhYGhPJwcznzC5t3p1t8dp8IpKY=;
Message-ID: <40e4c830-5773-4245-9165-84af8a6da75b@xen.org>
Date: Wed, 10 Jul 2024 10:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen: Fix XEN_EXTRAVERSION after 4.19-rc1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240702134310.1307657-1-andrew.cooper3@citrix.com>
 <643ada7e-b265-4283-9c52-f6cf6239fe26@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <643ada7e-b265-4283-9c52-f6cf6239fe26@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/07/2024 15:14, Jan Beulich wrote:
> On 02.07.2024 15:43, Andrew Cooper wrote:
>> EXTRAVERSION needs a . separator for numbers.
> 
> Not exactly. It needs the 0 dropped, if we follow what we've done in the
> past. Then ...

 From docs/process/release-technician-checklist.txt:

#    - XEN_EXTRAVERSION should be as follows
#      `.0-rc$(XEN_VENDORVERSION)'       during freeze, first rc onwards 
(including staging, before branching)

So the original version from Andrew was correct...

Cheers,

-- 
Julien Grall

