Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942EC75DD89
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 18:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568053.887470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNFsO-0006y8-28; Sat, 22 Jul 2023 16:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568053.887470; Sat, 22 Jul 2023 16:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNFsN-0006va-V8; Sat, 22 Jul 2023 16:54:39 +0000
Received: by outflank-mailman (input) for mailman id 568053;
 Sat, 22 Jul 2023 16:54:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qNFsN-0006vU-0x
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 16:54:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNFsL-00053k-Tk; Sat, 22 Jul 2023 16:54:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNFsL-0004LP-OZ; Sat, 22 Jul 2023 16:54:37 +0000
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
	bh=WIHvDqxK/w00YG+2bUk5WuMFEudgY1zy7MAi+Wsv/cY=; b=UtlkEWeLeOkPOThyudz+F0zbTT
	66uGkZZe5fgVBz/XYy6NkQ8RrLLUV4kBDBa5YxNcG0OMYM7CXlI0wHFP06EkKNld/oTHLz3yBwRWB
	9MXyRW37oFMUOhy2FlsWT2dxq9B1v+vjOayNMm7QinqajVJ+fP9tS1upxpIndPih2RmQ=;
Message-ID: <7604c148-47c5-ce67-d691-4f642b1876a9@xen.org>
Date: Sat, 22 Jul 2023 17:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230722081646.4136-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 0/2] tools/xenstore: fix get_spec_node()
In-Reply-To: <20230722081646.4136-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 22/07/2023 09:16, Juergen Gross wrote:
> Small series to fix a bug in get_spec_node().
> 
> Patch 1 is turning several function parameters into const in order to
> avoid having to cast away the const attribute in get_spec_node().
> 
> Patch 2 is the fix, which is a backport candidate.
> 
> Alternatives to this series would be:
> 
> - merge the patches into one patch and backport that

AFAIU, this would have the same outcome as applying the two patches but 
it would circumvent the "we don't backport clean-up to stable tree" and 
lose the history.

> - swap the sequence of the patches in order to have less code churn
>    when backporting, but re-adding the cast from const to non-cont,
>    while backporting only the fix

I am not sure I understand this. If you swap the patch, wouldn't the 
const-away cast be needed to compile and allow bisection?

> - leave the series as is and backport both patches

I am split. On one hand, it would be good to harden older Xenstored, on 
the other hand this is not strictly necessary to fix it. So possibly not 
a good option compare to the others.

> - leave the series as is and use V1 of patch 2 for the backpor
It would be my preference. But I would also be happy with swapping patch 
#1 and patch #2 if there is a desire to have a clean cherry-pick.

Cheers,

-- 
Julien Grall

