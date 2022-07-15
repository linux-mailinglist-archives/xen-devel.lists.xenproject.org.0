Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CF5766FC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368502.599819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQV0-0003mC-F6; Fri, 15 Jul 2022 18:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368502.599819; Fri, 15 Jul 2022 18:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQV0-0003jm-C9; Fri, 15 Jul 2022 18:57:14 +0000
Received: by outflank-mailman (input) for mailman id 368502;
 Fri, 15 Jul 2022 18:57:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQUz-0003jb-BT
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:57:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQUy-0003Jl-Px; Fri, 15 Jul 2022 18:57:12 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQUy-0005D1-Jv; Fri, 15 Jul 2022 18:57:12 +0000
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
	bh=PrKpW/zh8/qaVH1P26x2fNdvrrnB46UyjB8jGX2ohCE=; b=JoiN/uh2h1XIpsP/zHGsBKA/VL
	xXD14OlLxxfwE4+Vts2hiQfrpjXVVSzQfHPYVOTA3gauslB5tguUtg9G6KFH9b+8V1vN1y9iecEP8
	ihOUeVydsL+MRiCIutHcvpAW5YbOUxVHgJ3/0EohY0Hq0mjYKLARlFA+qi//mKvQ0jw4=;
Message-ID: <ce01dc8f-466f-c6eb-dec6-58004be4bb35@xen.org>
Date: Fri, 15 Jul 2022 19:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v8 8/9] xen: introduce prepare_staticmem_pages
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-9-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220707092244.485936-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/07/2022 10:22, Penny Zheng wrote:
> Later, we want to use acquire_domstatic_pages() for populating memory
> for static domain on runtime, however, there are a lot of pointless work
> (checking mfn_valid(), scrubbing the free part, cleaning the cache...)
> considering we know the page is valid and belong to the guest.
> 
> This commit splits acquire_staticmem_pages() in two parts, and
> introduces prepare_staticmem_pages to bypass all "pointless work".
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

