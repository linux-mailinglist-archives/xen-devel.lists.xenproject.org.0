Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E936735D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 21:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114931.219091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIPw-0002zO-51; Wed, 21 Apr 2021 19:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114931.219091; Wed, 21 Apr 2021 19:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIPw-0002yz-1X; Wed, 21 Apr 2021 19:21:44 +0000
Received: by outflank-mailman (input) for mailman id 114931;
 Wed, 21 Apr 2021 19:21:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZIPu-0002yr-9l
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 19:21:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZIPs-0006mH-LV; Wed, 21 Apr 2021 19:21:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZIPs-0007Bg-Cs; Wed, 21 Apr 2021 19:21:40 +0000
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
	bh=nZHotNLQ/2S1tWisMc0b/4oDLOsC4TRLJX7E21ZfQxY=; b=Y38X0O5ZBqWxrshXhbVz9JKoQ+
	ZfUG2oDDabz3rd4PIwxF2XtVa1xQ/9PoBO/bK4Ivm7k8YcDzy/sJJDcmE+IR3pADqCFwO2TNZAs6m
	2VIqjynreo4HgqHLBxAzNYugG3CUVsWp3AA2Ao2FBkVfSX8q6Q7t7kVM2FWijz0gaTnA=;
Subject: Re: [PATCH v2 00/20] further population of xen/lib/
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <15513275-e7d2-e59b-739d-f4075ad797df@xen.org>
Date: Wed, 21 Apr 2021 20:21:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/04/2021 15:15, Jan Beulich wrote:
> This is to dissolve / move xen/common/string.c. One benefit of moving
> these functions into an archive is that we can drop some of the related
> __HAVE_ARCH_* #define-s: By living in an archive, the per-arch functions
> will preempt any loading of the respective functions (objects) from the
> archive. (Down the road we may want to move the per-arch functions into
> archives as well, at which point the per-arch archive(s) would need to
> be specified ahead of the common one(s) to the linker.)
> 
> The only change in v2 is adjustment to all of the commit messages.
> 
> 01: lib: move memset()
> 02: lib: move memcpy()
> 03: lib: move memmove()
> 04: lib: move memcmp()
> 05: lib: move memchr()
> 06: lib: move memchr_inv()
> 07: lib: move strlen()
> 08: lib: move strnlen()
> 09: lib: move strcmp()
> 10: lib: move strncmp()
> 11: lib: move strlcpy()
> 12: lib: move strlcat()
> 13: lib: move strchr()
> 14: lib: move strrchr()
> 15: lib: move strstr()
> 16: lib: move strcasecmp()
> 17: lib: move/rename strnicmp() to strncasecmp()
> 18: lib: move strspn()
> 19: lib: move strpbrk()
> 20: lib: move strsep()

 From the series:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

