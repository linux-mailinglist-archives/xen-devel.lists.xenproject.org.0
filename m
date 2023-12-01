Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5095800A14
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645491.1007688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r922D-0005UI-IU; Fri, 01 Dec 2023 11:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645491.1007688; Fri, 01 Dec 2023 11:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r922D-0005Ro-Fu; Fri, 01 Dec 2023 11:50:17 +0000
Received: by outflank-mailman (input) for mailman id 645491;
 Fri, 01 Dec 2023 11:50:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r922B-0005Ri-PS
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 11:50:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9229-0006Xt-Kr; Fri, 01 Dec 2023 11:50:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9229-0008CD-8r; Fri, 01 Dec 2023 11:50:13 +0000
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
	bh=S5KOqp0Tn34vvssixuQVJQ2XKec76KgCT1oywvZyju4=; b=rSF6nXTev7HoCkzXVDByMWPpu1
	gjFY4w9mlP/KLE863elNDTNeGPnE6OQzrhul1C7ECkWfL1++gGuPT1z8MTNwx9eYgBqWM5ld/l8IY
	a91LOUeaIEXYIzNXvG0Nx76PTKWEu/bFRpk1catrhwp07H12KsFNZPL7stCB8ZkGTNsc=;
Message-ID: <081984d2-1f54-4864-95bb-4ae5ae569bc6@xen.org>
Date: Fri, 1 Dec 2023 11:50:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/public: fix flexible array definitions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231201112041.5260-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231201112041.5260-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/12/2023 11:20, Juergen Gross wrote:
> Flexible arrays in public headers can be problematic with some
> compilers.
> 
> With XEN_FLEX_ARRAY_DIM there is a mechanism available to deal with
> this issue, but care must be taken to not change the affected structs
> in an incompatible way.
> 
> So bump __XEN_LATEST_INTERFACE_VERSION__ and introduce a new macro
> XENPV_FLEX_ARRAY_DIM which will be XENPV_FLEX_ARRAY_DIM with the
> interface version being new enough and "1" (the value used today in
> the affected headers) when the interface version is an old one.
> 
> Replace the arr[1] instances (this includes the ones seen to be
> problematic in recent Linux kernels [1]) with arr[XENPV_FLEX_ARRAY_DIM]
> in order to avoid compilation errors.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

