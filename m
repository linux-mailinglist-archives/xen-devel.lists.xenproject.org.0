Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634982AF56
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 14:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666275.1036786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNuvP-0001cN-Eb; Thu, 11 Jan 2024 13:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666275.1036786; Thu, 11 Jan 2024 13:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNuvP-0001a0-B5; Thu, 11 Jan 2024 13:16:47 +0000
Received: by outflank-mailman (input) for mailman id 666275;
 Thu, 11 Jan 2024 13:16:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNuvN-0001Zt-Si
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 13:16:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNuvN-0005kG-2D; Thu, 11 Jan 2024 13:16:45 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNuvM-00068n-Qi; Thu, 11 Jan 2024 13:16:44 +0000
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
	bh=fhnSpQm3XVH+09dXnDomBXbg5zFd9A+DGPHmZTbXVX8=; b=iQP6e+KJwREnT2OVSFRLj4EOVX
	GqnQAZ7d2j3SyA+3wWN9kzoNet/qrTLq+b8+m7OLDXsM2bv2VLxooE28LC9Y6gZuAjkCHOQag2lKz
	vEgJjGwOplc52EBMpeAkZAGy8XCl7KsMT4FXXNtMOq5bjIh0WHJU5eRk67hni/0wNhnw=;
Message-ID: <87afaa57-5963-4204-9425-cdb76a90bc0d@xen.org>
Date: Thu, 11 Jan 2024 13:16:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] NUMA: limit first_valid_mfn exposure
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4db3f6fd-ba51-43d2-89f7-adbdaf720874@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4db3f6fd-ba51-43d2-89f7-adbdaf720874@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/01/2024 14:31, Jan Beulich wrote:
> Address the TODO regarding first_valid_mfn by making the variable static
> when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
> x86). To carry this out, introduce two new IS_ENABLED()-like macros
> conditionally inserting "static". One less macro expansion layer is
> sufficient though (I might guess that some early form of IS_ENABLED()
> pasted CONFIG_ onto the incoming argument, at which point the extra
> layer would have been necessary), and part of the existing helper macros
> can be re-used.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

