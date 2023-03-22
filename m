Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A56C4C83
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513467.794501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyvx-0002wZ-Ju; Wed, 22 Mar 2023 13:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513467.794501; Wed, 22 Mar 2023 13:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyvx-0002tk-HK; Wed, 22 Mar 2023 13:55:21 +0000
Received: by outflank-mailman (input) for mailman id 513467;
 Wed, 22 Mar 2023 13:55:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peyvw-0002te-Lr
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:55:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peyvs-0006w1-UN; Wed, 22 Mar 2023 13:55:16 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peyvs-0001OQ-PM; Wed, 22 Mar 2023 13:55:16 +0000
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
	bh=DV40RNJO2G/hYxst0dDq57OAaTheNHlPGw0vMDAvk4I=; b=4tYRgsdzwTyL3tEK6Yr5jzp6xm
	nNk2r0ZCcTAXWHnYQr4Sl/5nmS5aMg24Zb22v5TLtLLCA+iHVPgyBOKJNNPp0yNPHvMc0WGArhWlu
	aUyqz4wfzK8Sg1H9ZzA77fyZGcBlcezXq1vtZM9LbL4QgTtWg4z+KyBfy7NC44I3MLyM=;
Message-ID: <2ba98690-1a1f-592b-6b9d-fa91e775d40a@xen.org>
Date: Wed, 22 Mar 2023 13:55:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
 <c176f85b-7215-8526-fa59-a3c688c543bc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c176f85b-7215-8526-fa59-a3c688c543bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/03/2023 08:19, Jan Beulich wrote:
> On 21.03.2023 18:58, Julien Grall wrote:
>> Also, where do you guarantee that Xen will be loaded at a 2MB aligned
>> address? (For a fact I know that UEFI is only guarantee 4KB alignment).
> 
> I don't think this is true. We rely on UEFI honoring larger alignment on
> x86, and I believe the PE loader code is uniform across architectures.
> Of course you need to specify large enough alignment in the PE header's
> SectionAlignment field (right now in the Arm64 binary it's only 4k).

Hmmm... I have always been told this was ignored. Hence why we need to 
deal with 4KB. In any case, the problem stay the same. We didn't seem to 
have documented the expected alignment.

So in theory anyone can load RISC-V at any address. My suggestion would 
be to create docs/misc/riscv/booting.txt and document how one is meant 
to load Xen.

Cheers,

-- 
Julien Grall

