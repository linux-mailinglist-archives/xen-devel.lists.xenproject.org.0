Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723263F9852
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 12:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173601.316723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZZj-0004Wq-K5; Fri, 27 Aug 2021 10:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173601.316723; Fri, 27 Aug 2021 10:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZZj-0004U1-HA; Fri, 27 Aug 2021 10:59:07 +0000
Received: by outflank-mailman (input) for mailman id 173601;
 Fri, 27 Aug 2021 10:59:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJZZi-0004Tv-4D
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 10:59:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJZZh-0003Ve-SI; Fri, 27 Aug 2021 10:59:05 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJZZh-0004e5-Mm; Fri, 27 Aug 2021 10:59:05 +0000
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
	bh=Ll/rWdzg5ABp7NtlTyw52ZmZH3MXCM/pWVUes3OrIl8=; b=VClcG7yK/eLohYoeiMkJw83Rqo
	hdAGtZKCcBtWRbCtR7e8yUGsOpldV0fJRCp3FN1mLv/DazY3Hesr7TeqvS72hyIK1a1EAtK7VIiqh
	pv2mA1u/f6KuO8+jrNGk21hYiD8jJhApvmMuvsQ3FnVIo/9qA0wY3d+2rFB9aPsqxknM=;
Subject: Re: HVM guest only bring up a single vCPU
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
 <dc1e3e1f-f7b1-6f73-3a16-804496952df5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <309b2457-2881-3240-e3a5-3a5a9ea558bf@xen.org>
Date: Fri, 27 Aug 2021 11:59:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dc1e3e1f-f7b1-6f73-3a16-804496952df5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/08/2021 10:26, Jan Beulich wrote:
> On 26.08.2021 23:00, Julien Grall wrote:
>> Digging down, Linux will set smp_num_siblings to 0 (via
>> detect_ht_early()) and as a result will skip all the CPUs. The value is
>> retrieve from a CPUID leaf. So it sounds like we don't set the leaft
>> correctly.
> 
> Xen leaves leaf 1 EBX[23:16] untouched from what the tool stack
> passes. The tool stack doubles the value coming from hardware
> (or qemu in your case), unless the result would overflow. Hence
> it would look to me as if the value coming from qemu has got to
> be zero. Which is perfectly fine if HTT is off, just that
> libxenguest isn't prepared for this. 
> Could you see whether the
> patch below helps (making our hack even hackier)?

It helps. The Linux HVM domain is now able to bring up all the CPUs.

> 
> Jan
> 
> libxenguest/x86: ensure CPUID[1].EBX[32:16] is non-zero for HVM
> 
> We unconditionally set HTT, so merely doubling the value read from
> hardware isn't going to be correct if that value is zero.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Feel free to add my tested-by for the patch.

Cheers,

[1] https://pastebin.com/WvaXiXuL

-- 
Julien Grall

