Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11E56796A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361607.591200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qFu-0004Qf-D2; Tue, 05 Jul 2022 21:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361607.591200; Tue, 05 Jul 2022 21:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qFu-0004O4-9w; Tue, 05 Jul 2022 21:38:50 +0000
Received: by outflank-mailman (input) for mailman id 361607;
 Tue, 05 Jul 2022 21:38:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8qFs-0004Ny-Mw
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:38:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qFs-0006BA-3l; Tue, 05 Jul 2022 21:38:48 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qFr-00072S-UC; Tue, 05 Jul 2022 21:38:48 +0000
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
	bh=Ho4kPetw5Wo51UAeG59Zo1LSsQ2wLJNgpP0wjzFmErA=; b=xHIuiFLNIFWeUSfZUGSqN/QGsA
	jN5AQmjiLfI3bVxWuSXSpKfDQlP56aPkkwCpJFxMkuKxAOiq/oXoYH4nPPFOCED9GXzJ1vucGPqqG
	Y22aOwd1vOIVfEpVFp3HJqbfqKsVY8wfdqynUCUf2mWkdz8zidZuf+Af6YMz6FXY1L5Q=;
Message-ID: <47ed7737-5422-e4be-c99d-0e448616f5b5@xen.org>
Date: Tue, 5 Jul 2022 22:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] xen/char: pv_console: Fix MISRA C 2012 Rule 8.4
 violation
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-5-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220705210218.483854-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 05/07/2022 22:02, Xenia Ragiadakou wrote:
> The function pv_console_evtchn() is defined in the header <xen/pv_console.h>.
> If the header happens to be included by multiple files, this can result in
> linker errors due to multiple definitions,
> So, it is more appropriate to resolve this MISRA C 2012 Rule 8.4 violation
> warning by making pv_console_evtchn() inline with internal linkage.

There are multiple version of pv_console_evtchn(). The version below is 
only used when !CONFIG_XEN_GUEST.

The header is also included multiple time within Xen. So I am a bit 
puzzled why we haven't seen this error before. Maybe this is unused when 
!CONFIG_XEN_GUEST?

If yes, I would remove the call. If no, then I think the commit message 
should be clarified.

Cheers,

-- 
Julien Grall

