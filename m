Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B75D826CF6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663427.1033348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnwd-0002ih-Nf; Mon, 08 Jan 2024 11:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663427.1033348; Mon, 08 Jan 2024 11:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnwd-0002h2-Ky; Mon, 08 Jan 2024 11:37:27 +0000
Received: by outflank-mailman (input) for mailman id 663427;
 Mon, 08 Jan 2024 11:37:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMnwc-0002go-An
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:37:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMnwb-000390-PP; Mon, 08 Jan 2024 11:37:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMnwb-0007Ns-JU; Mon, 08 Jan 2024 11:37:25 +0000
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
	bh=EdMtX0OCqaeaJbtToZJGQn0S+iyIH0v5KKKiP6Z4aes=; b=p+R6tC5pSlB8QrsgYp4IO13M2r
	H+CvHJ+tUKuEVYlNHPjBLIsUcpSFPPRLiO0PrBuQ4gWumKbK/MOcspSp2X4/Db6jh/zCoAfbfjpIG
	Y+NKliEBydHR06gXPBEFkDY5aXlY+22i6zahnHyYGyJKuK5+Aq/OgA6tHTSoWaEKOf9Q=;
Message-ID: <a99d9d1a-2395-4771-95f3-5dab64e10ce7@xen.org>
Date: Mon, 8 Jan 2024 11:37:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: limit first_valid_mfn exposure
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/01/2024 11:31, Jan Beulich wrote:
> Address the TODO regarding first_valid_mfn by making the variable static
> when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
> x86).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Julien suggests something like
> 
> STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn;
> 
> but I view this as non-scalable (or at least I can't see how to
> implement such in a scalabale way) and hence undesirable to introduce.

I don't really see the scalability problem. Can you explain a bit more?

Cheers,

-- 
Julien Grall

