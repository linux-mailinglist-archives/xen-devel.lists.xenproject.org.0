Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC22F5139
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66638.118424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzk61-0003PM-BK; Wed, 13 Jan 2021 17:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66638.118424; Wed, 13 Jan 2021 17:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzk61-0003Ox-8B; Wed, 13 Jan 2021 17:38:13 +0000
Received: by outflank-mailman (input) for mailman id 66638;
 Wed, 13 Jan 2021 17:38:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzk5z-0003Os-0R
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 17:38:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzk5x-0000xf-9l; Wed, 13 Jan 2021 17:38:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzk5x-0001Ww-0E; Wed, 13 Jan 2021 17:38:09 +0000
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
	bh=E+k9I5J5l0FcgddLqxV+asZv2WYKITZLwLT/YtVEMJE=; b=GTIvKdiZmb4eF59poepgmAtCbJ
	KH55/n0sWsVEqe4mvprNUzkfMJeGup8pang3R8zXhldNOjwOe8SU8lh5nsGHxwLux5tPT3dWw1Ig6
	vbXovtKMSJe9XqM2LEGBW+ccB/VqNMJcIFypsdmDOMESKpHJgJtZq/dAFD6J80zLHODc=;
Subject: Re: [PATCH v2] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210112234450.31584-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c6e52c6f-e0d9-6f0d-8cbf-d797506febdd@xen.org>
Date: Wed, 13 Jan 2021 17:38:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112234450.31584-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

I think you forgot to update the title to say the state is EL0.

On 12/01/2021 23:44, Stefano Stabellini wrote:
> Don't read aarch32 system registers at boot time when the aarch32 state
> is not available at EL0. They are UNKNOWN, so it is not useful to read
> them.  Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen
> crash.  Instead, only read them when aarch32 is available.
> 
> Leave the corresponding fields in struct cpuinfo_arm so that they
> are read-as-zero from a guest.
> 
> Since we are editing identify_cpu, also fix the indentation: 4 spaces
> instead of 8.
> 
> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> Link: https://lore.kernel.org/xen-devel/f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com/
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

