Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A72F86FF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 22:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68637.122892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0WCJ-0005WE-F4; Fri, 15 Jan 2021 20:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68637.122892; Fri, 15 Jan 2021 20:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0WCJ-0005Vp-Bq; Fri, 15 Jan 2021 20:59:55 +0000
Received: by outflank-mailman (input) for mailman id 68637;
 Fri, 15 Jan 2021 20:59:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0WCI-0005Vk-9z
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 20:59:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0WCD-0004QD-VD; Fri, 15 Jan 2021 20:59:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0WCD-0005GL-N3; Fri, 15 Jan 2021 20:59:49 +0000
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
	bh=fsXLNRGVFrrpA+XxQMKqUYNDGgzrbuYivyU6xe8glLI=; b=ik98ipc4psYEjvp87+sAx38/Lo
	aN4s3DJ12uPY6HfkLDgCUz+5YsRHQddR7qn+AgLfNFG+pkdVkFiua0tXWdmHhHUzxLoRUmzQgraXU
	+GAGFFqMRXPBpUiIrxFa6nEFikxKywQTpdwTCj6/EDR9CE0ivpQLIiCC23+HbT/pVpd0=;
Subject: Re: [PATCH V4 16/24] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-17-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7937e7cd-fbf1-0a47-59de-1aa691130d0d@xen.org>
Date: Fri, 15 Jan 2021 20:59:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-17-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch implements reference counting of foreign entries in
> in set_foreign_p2m_entry() on Arm. This is a mandatory action if
> we want to run emulator (IOREQ server) in other than dom0 domain,
> as we can't trust it to do the right thing if it is not running
> in dom0. So we need to grab a reference on the page to avoid it
> disappearing.
> 
> It is valid to always pass "p2m_map_foreign_rw" type to
> guest_physmap_add_entry() since the current and foreign domains
> would be always different. A case when they are equal would be
> rejected by rcu_lock_remote_domain_by_id(). Besides the similar
> comment in the code put a respective ASSERT() to catch incorrect
> usage in future.
> 
> It was tested with IOREQ feature to confirm that all the pages given
> to this function belong to a domain, so we can use the same approach
> as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().
> 
> This involves adding an extra parameter for the foreign domain to
> set_foreign_p2m_entry() and a helper to indicate whether the arch
> supports the reference counting of foreign entries and the restriction
> for the hardware domain in the common code can be skipped for it.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

