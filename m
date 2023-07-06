Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C67496FB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559726.874988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJw3-00063l-KR; Thu, 06 Jul 2023 08:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559726.874988; Thu, 06 Jul 2023 08:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJw3-00062A-Gg; Thu, 06 Jul 2023 08:01:55 +0000
Received: by outflank-mailman (input) for mailman id 559726;
 Thu, 06 Jul 2023 08:01:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHJw1-00061y-AX
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:01:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHJw0-0002ll-KS; Thu, 06 Jul 2023 08:01:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHJw0-0006u4-E5; Thu, 06 Jul 2023 08:01:52 +0000
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
	bh=kV+uiA0FNsCPRSdI4j90Eom0nMtud28n16Xs5aXrcGo=; b=3/tdHZcxwXoBsVyybGmiTgQ2qX
	crT9I8ih96zPRjGwPADK/NPM/3tSdB62hGRdQTlZlWDxIZTXRwEhr5cBhSA+adsoqFXSR/iz4Z7TU
	PKhhEyGZ4rvLwNpx9MIS9OjcxQLwlsxSpXqIiRM2bniTRsDtbX1a2yaxDSCgUfnhXUuQ=;
Message-ID: <29756ff8-adcd-5184-c8b1-c619a5a8d3f2@xen.org>
Date: Thu, 6 Jul 2023 09:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 05/13] xen/device-tree: fix violations of MISRA
 C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/07/2023 16:26, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>

This suggest the author is Gianluca but...

> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

... the first signed-off-by is yours. So who is the author?

More generally, there tags are order chronogically. So if Gianluca is 
the author then it should be the first Signed-off-by. Then it is yours.

This will be followed-by the Acked-by/Reviewed-by tags.

The same remark goes for the rest of the series.

Cheers,

-- 
Julien Grall

