Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361D2B8325
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30154.59937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRIt-0000hx-Gh; Wed, 18 Nov 2020 17:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30154.59937; Wed, 18 Nov 2020 17:31:35 +0000
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
	id 1kfRIt-0000hY-DS; Wed, 18 Nov 2020 17:31:35 +0000
Received: by outflank-mailman (input) for mailman id 30154;
 Wed, 18 Nov 2020 17:31:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRIr-0000hT-TR
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:31:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRIp-0006tN-Hy; Wed, 18 Nov 2020 17:31:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRIp-0005Wz-5X; Wed, 18 Nov 2020 17:31:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRIr-0000hT-TR
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=coRpcSN/8SvVHMibKC/EhRm5k8nLDVMXvfuk2U/gWM4=; b=xvNdoV8f7OOcdn8nNf4m5p2g0J
	EEYgt5+5CMt4549Vsu6iUs2zl+qyrxS3k5f8xW8KNZab8lbJgWytGWiadeo0SwlcAcHaq0whe/OZE
	h5tbr93GJW0VEp9ZQzVfxFqwBLM2bCky/zKW7ft8dIBgVHYOrA6+spMsh4GtefDcyGPY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRIp-0006tN-Hy; Wed, 18 Nov 2020 17:31:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRIp-0005Wz-5X; Wed, 18 Nov 2020 17:31:31 +0000
Subject: Re: [PATCH v2 2/8] lib: collect library files in an archive
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <78dccec2-064f-d4b1-1865-eb3f1f14247a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8ff6d14d-fb3f-79d0-888a-3da2b68d1aad@xen.org>
Date: Wed, 18 Nov 2020 17:31:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <78dccec2-064f-d4b1-1865-eb3f1f14247a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:17, Jan Beulich wrote:
> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
> just to avoid bloating binaries when only some arch-es and/or
> configurations need generic library routines, combine objects under lib/
> into an archive, which the linker then can pick the necessary objects
> out of.
> 
> Note that we can't use thin archives just yet, until we've raised the
> minimum required binutils version suitably.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/Rules.mk          | 33 +++++++++++++++++++++++++++------
>   xen/arch/arm/Makefile |  6 +++---
>   xen/arch/x86/Makefile |  8 ++++----
>   xen/lib/Makefile      |  3 ++-
>   4 files changed, 36 insertions(+), 14 deletions(-)

I can't build Xen on Arm after this patch:

   AR      lib.a
aarch64-linux-gnu-ld    -EL  -r -o built_in.o
aarch64-linux-gnu-ld: no input files
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/Rules.mk:154: recipe for 
target 'built_in.o' failed

Cheers,

-- 
Julien Grall

