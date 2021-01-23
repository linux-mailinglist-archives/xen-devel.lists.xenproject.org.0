Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9403014E2
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 12:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73268.132067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3HLK-0007c2-Rz; Sat, 23 Jan 2021 11:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73268.132067; Sat, 23 Jan 2021 11:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3HLK-0007ba-Nn; Sat, 23 Jan 2021 11:44:38 +0000
Received: by outflank-mailman (input) for mailman id 73268;
 Sat, 23 Jan 2021 11:44:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l3HLJ-0007bO-6C
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 11:44:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3HLF-0005QV-UU; Sat, 23 Jan 2021 11:44:33 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3HLF-00075O-Mj; Sat, 23 Jan 2021 11:44:33 +0000
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
	bh=1wKMe7duyypGiRSLautTnU44G4khD2cjllG0da3VBQg=; b=JMqRQaIC9r8exs/0p2YT7FFt9b
	Xv9+juqX406h3/wQANElHhupGvjzIU4D+1MbMEsPkCZ8Xfe4b+upM2It5rWd5vzNVjFx90fabVvZD
	443GwCFKYNRWnbueU3R6sW7l5H3aUfSVks4cQiSbXzjysOi+GEK0jRpOolRn+awR1rbk=;
Subject: Re: [PATCH RFC 0/6] xen/arm: mm: Add limited support for superpages
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201119190751.22345-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <d24d251a-0c53-3cc3-0e07-97610b123171@xen.org>
Date: Sat, 23 Jan 2021 11:44:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 19/11/2020 19:07, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This is a first attempt to add superpage mapping in
> xen_pt_update_entry(). The end goal if to remove open-coding mappings
> which will help to:
>    1) get better compliance with the Arm memory model
>    2) pave the way for other page size (64KB, 16KB).
> 
> For now, only the open-code mappings for the Device-Tree is reworked.
> The others will be added later.
> 
> Julien Grall (5):
>    xen/arm: mm: Remove ; at the end of mm_printk()
>    xen/arm: setup: Call unregister_init_virtual_region() after the last
>      init function

[...]

> 
> Stefano Stabellini (1):
>    xen/arm: mm: Remove special case for CPU0 in dump_hyp_walk()

I have committed the 3 patches above. The rest needs a respin which will 
only happen after 4.15.

Cheers,

-- 
Julien Grall

