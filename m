Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5E879F15
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 23:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692211.1079100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAsN-00073R-EK; Tue, 12 Mar 2024 22:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692211.1079100; Tue, 12 Mar 2024 22:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAsN-00071g-BG; Tue, 12 Mar 2024 22:45:39 +0000
Received: by outflank-mailman (input) for mailman id 692211;
 Tue, 12 Mar 2024 22:45:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkAsL-00071a-IR
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 22:45:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAsL-0005Y9-AZ; Tue, 12 Mar 2024 22:45:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.154])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAsL-00018u-5O; Tue, 12 Mar 2024 22:45:37 +0000
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
	bh=gYwp3dnViVB/eN1qzGIIYwSY09T0ajrbpV/Yuj2C0j4=; b=7BBzk+JEWpxjLzHbWCcnluqFfL
	U+wUslOX+NpHlDFal5i/0TNojZXAhxDXiYizxMRMJvtbcWyx9lYf779TiifSW3AJ13WHE71Np4Gu1
	oJHENB+Qh70oAnkrfhK0qLDhcWby3sxx3ljMyzRpsP1SjboJpV6GitJA+ZjTxbYUnemM=;
Message-ID: <30b70df5-a53f-4faa-b15a-1673cceec022@xen.org>
Date: Tue, 12 Mar 2024 22:45:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240229095529.17723-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 29/02/2024 09:55, Roger Pau Monne wrote:
> We no longer have a way to build with the minimum required clang/llvm version
> stated in the README on the gitlab CI loop, since we dropped the Debian Jessie
> container that had Clang 3.5.0.
> 
> Bump the minimum required Clang/LLVM to the one used in the oldest production
> FreeBSD version (13.2 currently), as that's the main reason I care to maintain
> Clang/LLVM support, and as far as I know FreeBSD is the only production
> deployment of Xen built with Clang/LLVM.
> 
> Purge the build jobs for non-supported Clang versions from Gitlab CI.  Note the
> .dockerfiles for the respective distros are explicitly not adjusted to drop the
> install of the clang packages, or else those jobs would start to fail on older
> Xen branches.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm willing to consider older versions, but there needs to be a reason (iow:
> use-case) for considering those, as maintaining support for older toolchains is
> a burden.

It makes sense. On another thread I mentioned that QEMU also took the 
approach to only support compilers from currently (security?) supported 
distros.

Acked-by: Julien Grall <jgrall@amazon.com>

This could always be relaxed.

Cheers,

-- 
Julien Grall

