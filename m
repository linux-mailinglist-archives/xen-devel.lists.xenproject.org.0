Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5437B2D01
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610197.949516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7re-0007VK-6S; Fri, 29 Sep 2023 07:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610197.949516; Fri, 29 Sep 2023 07:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7re-0007So-3N; Fri, 29 Sep 2023 07:24:42 +0000
Received: by outflank-mailman (input) for mailman id 610197;
 Fri, 29 Sep 2023 07:24:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm7rc-0007Si-GD
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:24:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm7rb-0007oJ-H2; Fri, 29 Sep 2023 07:24:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm7rb-00015W-Al; Fri, 29 Sep 2023 07:24:39 +0000
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
	bh=m2hJRUIrXlpuzkFSfB1yK8abhTgaLU72R1H8Bl0/D+A=; b=EzsP1E6pIzS3sfDa2f+KjbpOdK
	OjowWHXk0pIo8eoMJL3RKK6OtlkTOlq9lpADsfpub8MhU5f4nzhYdJXjNncHiFV0E/+hnP4E1FXS0
	JUjHpHAzZBiP6/2zGIxAfAIbEyXMbtWtOb+jKLIj0B0rVcSH/jx5wxonFWY0AyNpO27k=;
Message-ID: <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
Date: Fri, 29 Sep 2023 08:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitmap: fix n__ signess
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, george.dunlap@citrix.com, wl@xen.org
References: <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 29/09/2023 00:19, Stefano Stabellini wrote:
> All callers of the bitmap_switch macro (which are all within bitmap.h)
> pass an int as first parameter. Do not assign it to an unsigned int
> potentially introducing errors.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> 
> We could also have gone the other way and change all the callers and the
> callers' callers to use an unsigned int instead, but I went for the path
> of least resistance.

I understand this will solve the issue right now because the callers are 
all passing 'int'. However, all the callers will need to switch to 
'unsigned int' in order to solve violations in their callers.

That unless we decide to use 'int' everywhere, but I think this is a bad 
idea because 'n__' is not supposed to be negative.

Overall, this may be an easy win right now, but this will need to be 
reverted. So, I am not happy to ack it and would in fact be leaning 
towards Nacking it.

Cheers,

-- 
Julien Grall

