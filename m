Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD229CFD9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 12:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13579.34269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXk6H-0003KV-3o; Wed, 28 Oct 2020 11:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13579.34269; Wed, 28 Oct 2020 11:58:45 +0000
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
	id 1kXk6H-0003K6-0L; Wed, 28 Oct 2020 11:58:45 +0000
Received: by outflank-mailman (input) for mailman id 13579;
 Wed, 28 Oct 2020 11:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXk6F-0003K1-JP
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:58:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d453875-118b-460e-ab2e-4369c2ed84a3;
 Wed, 28 Oct 2020 11:58:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXk6C-0000IW-O4; Wed, 28 Oct 2020 11:58:40 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXk6C-0006qH-GQ; Wed, 28 Oct 2020 11:58:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXk6F-0003K1-JP
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:58:43 +0000
X-Inumbo-ID: 8d453875-118b-460e-ab2e-4369c2ed84a3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8d453875-118b-460e-ab2e-4369c2ed84a3;
	Wed, 28 Oct 2020 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7xJfBN7KF962Co3er/XSt9PfLt+of1SSQII+FdJ8PD8=; b=2szqhHfRTEF/LfzHVDz+B4o3Df
	zf8Z3KQCwCa7hjKHilAGPXnDh1cf23x8LtMaYlz90U4kOpZAm3nGpb0CLWoJHIrz0xgDQXENjxIWb
	pGuY7lFnzmghzo5GUeXPfWWnV3BKgGffn/m7WPCPDnwhF9rJudSOeXNGBbyUmoNMUOSI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXk6C-0000IW-O4; Wed, 28 Oct 2020 11:58:40 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXk6C-0006qH-GQ; Wed, 28 Oct 2020 11:58:40 +0000
Subject: Re: [PATCH v1 3/4] xen/pci: Move x86 specific code to x86 directory.
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1603731279.git.rahul.singh@arm.com>
 <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
 <301405a2-9ec1-847d-6f61-1067a225a3a9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a85906e2-6930-7f8a-417b-966a87d6c133@xen.org>
Date: Wed, 28 Oct 2020 11:58:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <301405a2-9ec1-847d-6f61-1067a225a3a9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 28/10/2020 11:51, Jan Beulich wrote:
> On 26.10.2020 18:17, Rahul Singh wrote:
>> passthrough/pci.c file is common for all architecture, but there is x86
>> sepcific code in this file.
> 
> The code you move doesn't look to be x86 specific in the sense that
> it makes no sense on other architectures, but just because certain
> pieces are missing on Arm. With this I question whether is it really
> appropriate to move this code. I do realize that in similar earlier
> cases my questioning was mostly ignored ...

There are no plan to get support for PIRQ on Arm. All the interrupts 
will be properly sent to the guest using a virtual interrupt controller.

Regarding the code itself, there are still a few bits that are x86 
specific (see struct dev_intx_gsi_link). So I think the right action 
for now is to move the code to an x86 directory.

This can be adjusted in the future if there is another architecture that 
would require to use PIRQ.

Cheers,

-- 
Julien Grall

