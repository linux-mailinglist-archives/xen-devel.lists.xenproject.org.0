Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80472F5309
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 20:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66720.118615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlSY-0005Bs-Ua; Wed, 13 Jan 2021 19:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66720.118615; Wed, 13 Jan 2021 19:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlSY-0005BT-RK; Wed, 13 Jan 2021 19:05:34 +0000
Received: by outflank-mailman (input) for mailman id 66720;
 Wed, 13 Jan 2021 19:05:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzlSW-0005BO-Md
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 19:05:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlST-0002bU-DC; Wed, 13 Jan 2021 19:05:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlST-0007t6-5H; Wed, 13 Jan 2021 19:05:29 +0000
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
	bh=UlvrBiRosLrD+Yoq2QSheo/VESLE/1+8evyVtc+F2sg=; b=3loMaQVFUD00a8EZU/I0CAdeOM
	iDl1IVfH/3czc6QJxzDSfnmxFfWBH0nwd5QbqGk97+oMbPR3+a/Ft4Rx9eOL+fDMDFj0kVNhX8yGK
	UlfLNpOfZAU+R+zE1GbaqI1uPYSwM2G7FnCFL3tupfcyA1hti1uLtMaMt/mk7BQE/7nQ=;
Subject: [PING] Re: [PATCH v2] xen/irq: Propagate the error from
 init_one_desc_irq() in init_*_irq_data()
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201128113642.8265-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <b4d95397-3d01-7fd6-968c-2b82e3b2e95c@xen.org>
Date: Wed, 13 Jan 2021 19:05:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201128113642.8265-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi all,

On 28/11/2020 11:36, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> init_one_desc_irq() can return an error if it is unable to allocate
> memory. While this is unlikely to happen during boot (called from
> init_{,local_}irq_data()), it is better to harden the code by
> propagting the return value.
> 
> Spotted by coverity.
> 
> CID: 106529
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Roger Paul Monné <roger.pau@citrix.com>

 From my understanding of MAINTAINERS rule, I still need an ack from x86 
maintainers.

Cheers,

-- 
Julien Grall

