Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7B45DED3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 17:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231702.401106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqI22-0005m9-9b; Thu, 25 Nov 2021 16:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231702.401106; Thu, 25 Nov 2021 16:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqI22-0005kL-6N; Thu, 25 Nov 2021 16:55:34 +0000
Received: by outflank-mailman (input) for mailman id 231702;
 Thu, 25 Nov 2021 16:55:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mqI20-0005kF-Hz
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 16:55:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqI1z-0007g6-Bd; Thu, 25 Nov 2021 16:55:31 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.27.59]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqI1z-0000bs-4L; Thu, 25 Nov 2021 16:55:31 +0000
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
	bh=MR+tk/n1wK3jsgpjen4BhyroxK5fihlJZXVyR8fAlrw=; b=AozZSAVV6oKmIiCgimQ6+Bo0xQ
	oBTSnyDPXrVoXl+Ke6PFyoCqNzIAb+3Ddvnljrv715lzPdhtCiEOwMMJEudA3fu6J00XTtvVjtO8b
	hRoAFVkZ4ZNupyu9nz4X8IqAPSCFVWa5Tl9Uz5nNXsqgS8ovoKx3eXzmka+I4xs3p17M=;
Message-ID: <680821b3-286b-e358-7810-bfed258d0860@xen.org>
Date: Thu, 25 Nov 2021 16:55:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 2/7] xz: fix XZ_DYNALLOC to avoid useless memory
 reallocations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <196008a7-ce37-52bf-13d3-4a08f203957a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <196008a7-ce37-52bf-13d3-4a08f203957a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/11/2021 10:21, Jan Beulich wrote:
> From: Lasse Collin <lasse.collin@tukaani.org>
> 
> s->dict.allocated was initialized to 0 but never set after a successful
> allocation, thus the code always thought that the dictionary buffer has
> to be reallocated.
> 
> Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
> Reported-by: Yu Sun <yusun2@cisco.com>
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> Acked-by: Daniel Walker <danielwa@cisco.com>
> [Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]

This commit contains two more signed-off-by. Any reason to not have 
included them here?

The rest of the patch LGTM.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/xz/dec_lzma2.c
> +++ b/xen/common/xz/dec_lzma2.c
> @@ -1146,6 +1146,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
>   
>   		if (DEC_IS_DYNALLOC(s->dict.mode)) {
>   			if (s->dict.allocated < s->dict.size) {
> +				s->dict.allocated = s->dict.size;
>   				large_free(s->dict.buf);
>   				s->dict.buf = large_malloc(s->dict.size);
>   				if (s->dict.buf == NULL) {
> 

Cheers,

-- 
Julien Grall

