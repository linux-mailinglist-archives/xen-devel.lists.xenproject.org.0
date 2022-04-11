Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3384FB93E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302862.516683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr6b-0003kH-Ir; Mon, 11 Apr 2022 10:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302862.516683; Mon, 11 Apr 2022 10:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr6b-0003hM-FY; Mon, 11 Apr 2022 10:17:09 +0000
Received: by outflank-mailman (input) for mailman id 302862;
 Mon, 11 Apr 2022 10:17:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndr6Z-0003hG-Tf
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:17:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndr6Z-0003Ph-IR; Mon, 11 Apr 2022 10:17:07 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndr6Z-0001ku-C0; Mon, 11 Apr 2022 10:17:07 +0000
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
	bh=qVWqunGoZj/aDI/LIxAsvTFRgLk5BX3gdptBgLHmoGg=; b=sm6DV5spcRUmUqyHlW7hVx2NpV
	x9/DTUa67msgtpMv/12lsgq9tN1atIvT3L+Cof7Te/W9PaKtIlg2ibmFvrHEpS+nReOwyd2xSI9M+
	ZmOi6lCPnG6Okt3hFlZt7Of6lFAjX3kxrZ0IjClJwjvrYMGV0HPIhUHOb3oo5r+fqdt0=;
Message-ID: <72c25f35-0e1f-bc5a-c486-0d5ad676032f@xen.org>
Date: Mon, 11 Apr 2022 11:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] xen: Introduce a header to store common linker
 scripts content
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220411070300.77380-1-michal.orzel@arm.com>
 <20220411070300.77380-2-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220411070300.77380-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/04/2022 08:02, Michal Orzel wrote:
> Both x86 and arm linker scripts share quite a lot of common content.
> It is difficult to keep syncing them up, thus introduce a new header
> in include/xen called xen.lds.h to store the internals mutual to all
> the linker scripts.
> 
> Include this header in linker scripts for x86 and arm.
> This patch serves as an intermediate step before populating xen.lds.h
> and making use of its content in the linker scripts later on.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

