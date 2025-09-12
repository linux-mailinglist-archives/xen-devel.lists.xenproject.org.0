Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4199B557A7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 22:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122498.1466131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxAPg-0004dJ-9F; Fri, 12 Sep 2025 20:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122498.1466131; Fri, 12 Sep 2025 20:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxAPg-0004bq-6I; Fri, 12 Sep 2025 20:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1122498;
 Fri, 12 Sep 2025 20:30:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uxAPe-0004bk-PV
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 20:30:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxAPe-006cjo-09;
 Fri, 12 Sep 2025 20:30:30 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxAPd-00684b-39;
 Fri, 12 Sep 2025 20:30:29 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=ODR2NxxYnmygMLkLe8MISIe0BR4RrYikvOaMfaMVFOE=; b=3w2yZmlQhSe8cnykk3CTqsWfpI
	C7h5eTxkFGoUI2bNSg/soJG/dGemwf9xPHaAmMb710mIpNniwbrtMrIH7iMkmpu9Ldgt8kdWrnbiP
	JJFWs3Hw+TZ/01U9Mqyc/2zJFWFjV24f5O/AYzeY0jFgVF9J7Ag69aemeIL1SMlV2X0A=;
From: dmukhin@xen.org
Date: Fri, 12 Sep 2025 13:30:28 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 6/8] CI: Use pipefail in scripts/build
Message-ID: <aMSC5KaPytLBVt+F@kraken>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912144427.1905141-7-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 03:44:25PM +0100, Andrew Cooper wrote:
> Marek noticed that some builds were failing with:
> 
>   + cd dist/install
>   + find
>   + cpio -R 0:0 -o -H newc
>   ./automation/scripts/build: line 111: cpio: command not found
>   + gzip
> 
> but succeeding overall, and producing a zero length xen-tools.cpio.gz as an
> artefact.
> 
> In fact, it's all of:
> 
>   archlinux:current
>   debian:12-x86_32
>   fedora:41
>   opensuse:tumbleweed
>   ubuntu (all versions)
> 
> Add cpio into all of these containers, including opensuse leap for good
> measure, and use pipefail in the build script.
> 
> Fixes: 4611ae6fb8f9 ("CI: save toolstack artifact as cpio.gz")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

