Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4117671BE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571511.895530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQBi-00043y-JH; Fri, 28 Jul 2023 16:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571511.895530; Fri, 28 Jul 2023 16:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQBi-00041j-Gg; Fri, 28 Jul 2023 16:19:34 +0000
Received: by outflank-mailman (input) for mailman id 571511;
 Fri, 28 Jul 2023 16:19:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPQBg-00041d-TU
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:19:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPQBg-0003IK-1y; Fri, 28 Jul 2023 16:19:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPQBf-0000aH-Sp; Fri, 28 Jul 2023 16:19:31 +0000
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
	bh=yI62UMeXyYI4w/gI9iFsSzEHG7jx3Vq3G4MLEprJr/E=; b=szWYs/s41ZrV3JiEFluVeRt8VW
	h3WrDiVGJ2lV69BxsGx+vBj/93ZmU6dtW9j9H1194qH9f427N1traQHzm+mM2fZe9L0YutumDGVZq
	mjTSJEjLfm3zt8lxlLO129DNTruog06wkSoEQGf+CM3AfWgWYGl41ShiJKwfjL/LB4Xk=;
Message-ID: <34818645-459d-d658-1eb4-13444b30c4b8@xen.org>
Date: Fri, 28 Jul 2023 17:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-4-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230728075903.7838-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/07/2023 08:59, Alejandro Vallejo wrote:
> Regions must be occasionally validated for pdx compression validity. That
> is, whether any of the machine addresses spanning the region have a bit set
> in the pdx "hole" (which is expected to always contain zeroes). There are
> a few such tests through the code, and they all check for different things.
> 
> This patch replaces all such occurrences with a call to a centralized
> function that checks a region for validity.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

