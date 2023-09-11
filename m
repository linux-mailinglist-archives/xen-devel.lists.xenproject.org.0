Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB879A935
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599536.934997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiLc-0000dj-Lb; Mon, 11 Sep 2023 14:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599536.934997; Mon, 11 Sep 2023 14:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiLc-0000aw-Iw; Mon, 11 Sep 2023 14:57:08 +0000
Received: by outflank-mailman (input) for mailman id 599536;
 Mon, 11 Sep 2023 14:57:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qfiLb-0000aq-Vv
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:57:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfiLa-0001Kf-Ml; Mon, 11 Sep 2023 14:57:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfiLa-0001Uv-HR; Mon, 11 Sep 2023 14:57:06 +0000
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
	bh=ks3Cotsyg/iW2fH1VQDIsrdl3mxR0bp1duvTjvj2Pg0=; b=qietmcgAZSxzs9k50jPYGuUZsG
	RXRHLm1TcOqsyglLu4MZDqJoe2kdNkMciB12GUC+t1u9e8RD1Dchu9TA3IlN86fXWatu7bSNRnIod
	4glmzO+ARyQ5TkIqcaZUCEsfuYn3vxHrS11yqRjtlkxlfSvaimpWZZTNsR2v3UXUsY68=;
Message-ID: <1aac4c29-f1c6-44f0-81e1-efef505ed7e6@xen.org>
Date: Mon, 11 Sep 2023 15:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: make domain_page.h's stubs properly use
 type-unsafe MFN <-> virt helpers
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <9b5d517b-fbc0-d9ce-d6be-d4b8e3c0cc35@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9b5d517b-fbc0-d9ce-d6be-d4b8e3c0cc35@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/09/2023 07:38, Jan Beulich wrote:
> The first of the commits referenced below didn't go far enough, and the
> 2nd of them, while trying to close (some of) the gap, wrongly kept using
> the potentially type-safe variant. This is getting in the way of new
> ports preferably not having any type-unsafe private code (and in
> particular not having a need for any overrides in newly introduced
> files).
> 
> Fixes: 41c48004d1d8 ("xen/mm: Use __virt_to_mfn in map_domain_page instead of virt_to_mfn")
> Fixes: f46b6197344f ("xen: Convert page_to_mfn and mfn_to_page to use typesafe MFN")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

