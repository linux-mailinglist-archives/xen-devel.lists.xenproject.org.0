Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6864276BEEC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 23:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574525.899879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQwWF-0007Lm-BK; Tue, 01 Aug 2023 21:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574525.899879; Tue, 01 Aug 2023 21:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQwWF-0007Im-83; Tue, 01 Aug 2023 21:03:03 +0000
Received: by outflank-mailman (input) for mailman id 574525;
 Tue, 01 Aug 2023 21:03:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQwWD-0007Id-GL
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 21:03:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQwWD-0007y7-2t; Tue, 01 Aug 2023 21:03:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQwWC-0000HK-R9; Tue, 01 Aug 2023 21:03:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=5xAoF19G5on0AAgh3e8gncEBAhAwmSFAmOP58Ky81R4=; b=YFSpjnfbYwpQkIKdmDmVb3E3d9
	BkrxyKDoHq6cK4211Ssb5BVD3wBG9WA0R+G8yorjyHD6NC1Nc1+DCY3k8cwrifM4yxIQBmVcviHEV
	4vGkNNXRkQr9OCOOUD4nj91ximxpgeCPfc/T+P+KFZKmTfMsBwIG3E62+sUNagwLN9pQ=;
Message-ID: <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
Date: Tue, 1 Aug 2023 22:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Khem Raj <raj.khem@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
References: <20230801174930.2995947-1-raj.khem@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section
 directive
In-Reply-To: <20230801174930.2995947-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: This patch is not arm32 specific anymore. So I would replace 
'arm32' with 'arm'. This can be done on commit.

On 01/08/2023 18:49, Khem Raj wrote:
> Assembler from binutils 2.41 rejects [1] this syntax
> 
> .section "name"[, flags...]
> 
> where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
> 
> It is almost like a regression compared to 2.40 or older release,

The next word after ',' start with an uppercase. Did you intend to use 
'.' rather than ','?

That said, the documentation has the following:

For SPARC ELF targets, the assembler supports another type of .section 
directive for compatibility with the Solaris assembler:"

This leads me to think this is not a regression and instead an intended 
behavior (even though it breaks older build) even it breaks build.

I would suggest to reword the commit message to:

"
Assembler from binutiles 2.41 will rejects ([1], [2]) the following syntax

.section "name", #alloc

for any other any target other than ELF SPARC. This means we can't use 
it in the Arm code.

So switch to the GNU syntax

.section name [, "flags"[, @type]]

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
[2] https://sourceware.org/binutils/docs-2.41/as.html#Section

If you agree with the commit message, I can update it while committing.

We should also consider to backport.

Cheers,

-- 
Julien Grall

