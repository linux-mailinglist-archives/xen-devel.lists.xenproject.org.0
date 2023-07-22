Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46475DD30
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 17:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568015.887449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNEU0-000588-Hd; Sat, 22 Jul 2023 15:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568015.887449; Sat, 22 Jul 2023 15:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNEU0-00055H-Ee; Sat, 22 Jul 2023 15:25:24 +0000
Received: by outflank-mailman (input) for mailman id 568015;
 Sat, 22 Jul 2023 15:25:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qNETy-00055B-QA
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 15:25:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNETx-0002aU-VT; Sat, 22 Jul 2023 15:25:21 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNETx-000582-QY; Sat, 22 Jul 2023 15:25:21 +0000
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
	bh=NySikiBv0iLxOOqFl08/w5TaDvl4h0pcfb4ea5KPRfc=; b=2e3CcShirAnyO/aNKRpVMWb+24
	YnIC8ZqW0qnBOCcnbScUD4U9oIxkAA1IPdrWgWbwxeBH0iK1WQXypeXkrfOeSnS3cV4v9v8nEKSiQ
	3LUJCuzkHfhBtLSlOKWE1LwHF30VwpoIA0Mrh+9Y7pi4bZlr733fAyTB5K6pYruyBVCs=;
Message-ID: <9744f55f-9c5d-ad9f-8f32-37de802f7928@xen.org>
Date: Sat, 22 Jul 2023 16:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] tools/xenstore: fix get_spec_node()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230722081646.4136-1-jgross@suse.com>
 <20230722081646.4136-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230722081646.4136-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 22/07/2023 09:16, Juergen Gross wrote:
> In case get_spec_node() is being called for a special node starting
> with '@' it won't set *canonical_name. This can result in a crash of
> xenstored due to dereferencing the uninitialized name in
> fire_watches().
> 
> This is no security issue as it requires either a privileged caller or
> ownership of the special node in question by an unprivileged caller
> (which is questionable, as this would make the owner privileged in some
> way).
> 
> Fixes: d6bb63924fc2 ("tools/xenstore: introduce dummy nodes for special watch paths")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

