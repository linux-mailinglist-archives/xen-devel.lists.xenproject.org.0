Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D83C182A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 19:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153242.283119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1XrM-0005aZ-62; Thu, 08 Jul 2021 17:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153242.283119; Thu, 08 Jul 2021 17:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1XrM-0005Yk-35; Thu, 08 Jul 2021 17:30:48 +0000
Received: by outflank-mailman (input) for mailman id 153242;
 Thu, 08 Jul 2021 17:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1XrL-0005Ye-6h
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 17:30:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1XrJ-0003Fp-7d; Thu, 08 Jul 2021 17:30:45 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1XrJ-0008UB-1j; Thu, 08 Jul 2021 17:30:45 +0000
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
	bh=wt0uW65InpZeLYKnZnrc3/xmojAKMLMMwXZYFLOfR6w=; b=mHefa9RF4/19QyBHUQevUKTz0q
	4R4I2LY4trGSTb+P/prbNAnvkSHbyh8W6mfYsJng472BTF39IHMl1h9qLv1IRuDNW1pbGYY8fVxb7
	cbLVeSnsqTeJVdsLH3r4tsNhxU6B0cGc7uHmCUHfkDvv2laLkk0xiiX9MvIYABnOF9+0=;
Subject: Re: [PATCH v4 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE
 redefinition error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
 <83beb95e3633b1aca7801fd8592406e2057f9bdc.1623155575.git.costin.lupu@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <5fe5e336-6fbd-de40-6ec1-dda674a4d86d@xen.org>
Date: Thu, 8 Jul 2021 18:30:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <83beb95e3633b1aca7801fd8592406e2057f9bdc.1623155575.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Costin,

On 08/06/2021 13:35, Costin Lupu wrote:
> If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
> header) then gcc will trigger a redefinition error because of -Werror. This
> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
> confusion between control domain page granularity (PAGE_* definitions) and
> guest domain page granularity.
> 
> The exception is in osdep_xenforeignmemory_map() where we need the system page
> size to check whether the PFN array should be allocated with mmap() or with
> dynamic allocation.
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

