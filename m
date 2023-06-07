Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D7725FB4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 14:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544740.850707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sRI-0005Hk-4W; Wed, 07 Jun 2023 12:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544740.850707; Wed, 07 Jun 2023 12:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sRI-0005FS-1Z; Wed, 07 Jun 2023 12:39:00 +0000
Received: by outflank-mailman (input) for mailman id 544740;
 Wed, 07 Jun 2023 12:38:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6sRG-0005FL-IO
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 12:38:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6sRG-0003Oq-5H; Wed, 07 Jun 2023 12:38:58 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.13.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6sRF-0001Fv-Tk; Wed, 07 Jun 2023 12:38:58 +0000
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
	bh=mLsi62p53O/nCX8P8vKVsx8Ha0wiUvhXcpkEa2fDg1w=; b=dm5Ce/SIAMy2hTZBwunTbGrOeG
	9jaGlxlMWckLFoIRQNlKckyEOWxJpbfSITb+RSQrnalUHODvW4MVVe/wvSGc0+h8jpButYmgxzv6O
	U7yRleRWoyrgC+tur08/9S+mpV2l848AGkurJJs5Qn9/x47Q9XmgQhCqCJEzbWNHy/lk=;
Message-ID: <eeca7f0c-09e1-f5f6-806a-c19272caeee0@xen.org>
Date: Wed, 7 Jun 2023 13:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 00/14] tools/xenstore: rework internal accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230530082424.32126-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530082424.32126-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:24, Juergen Gross wrote:
> This series reworks the Xenstore internal accounting to use a uniform
> generic framework. It is adding some additional useful diagnostic
> information, like accounting trace and max. per-domain and global quota
> values seen.
> 
> Changes in V2:
> - added patch 1 (leftover from previous series)
> - rebase
> 
> Changes in V3:
> - addressed comments
> 
> Changes in V4:
> - fixed patch 3
> 
> Changes in V5:
> - addressed comments
> 
> Changes in V6:
> - addressed comments
> 
> Juergen Gross (14):
>    tools/xenstore: take transaction internal nodes into account for quota
>    tools/xenstore: manage per-transaction domain accounting data in an
>      array
>    tools/xenstore: introduce accounting data array for per-domain values
>    tools/xenstore: add framework to commit accounting data on success
>      only
>    tools/xenstore: use accounting buffering for node accounting
>    tools/xenstore: add current connection to domain_memory_add()
>      parameters
>    tools/xenstore: use accounting data array for per-domain values
>    tools/xenstore: add accounting trace support
>    tools/xenstore: add TDB access trace support
>    tools/xenstore: switch transaction accounting to generic accounting
>    tools/xenstore: remember global and per domain max accounting values
>    tools/xenstore: use generic accounting for remaining quotas
>    tools/xenstore: switch get_optval_int() to get_optval_uint()
>    tools/xenstore: switch quota management to be table based

I have committed the series.

Cheers,

-- 
Julien Grall

