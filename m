Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692E780B0A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586101.917328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxYj-0000ZR-3W; Fri, 18 Aug 2023 11:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586101.917328; Fri, 18 Aug 2023 11:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxYj-0000Xb-0n; Fri, 18 Aug 2023 11:22:29 +0000
Received: by outflank-mailman (input) for mailman id 586101;
 Fri, 18 Aug 2023 11:22:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxYh-0000XV-Pu
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:22:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxYh-0007TA-ES; Fri, 18 Aug 2023 11:22:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxYh-00044W-7B; Fri, 18 Aug 2023 11:22:27 +0000
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
	bh=F2SDoFcsq8xbw0dm/1HSzF0ox34MOqpzpURV7JcnvvQ=; b=0WyH1njoyKuPRA4amXgrary871
	mbbs8WhmrBdCE+B+sePxYbG1yzqjBjryHhSYyTBG2PshtP9j9+/4w/JHi2YJi9xGyPqi7upMiBsyU
	bHaclOq+L8YbRGF1/H6fe/MUz9N37ZK4PLfqOedRzPCZsFUZ6rs8N3L7Hsm6c/Uf7m2Q=;
Message-ID: <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>
Date: Fri, 18 Aug 2023 12:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/19] tools/xenstore: move xenstored sources into
 dedicated directory
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-20-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-20-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:47, Juergen Gross wrote:
> In tools/xenstore there are living xenstored and xenstore clients.
> They are no longer sharing anything apart from the "xenstore" in their
> names.
> 
> Move the xenstored sources into a new directory tools/xenstored while
> dropping the "xenstored_" prefix from their names. This will make it
> clearer that xenstore clients and xenstored are independent from each
> other.

In term of naming, I would prefer if we follow what was done for the 
console. I.e:

xenstore/client: All the clients
xenstore/daemon: C Xenstored

This would avoid the one character difference between the two directories.

What do the other thinks?

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> After the large overhaul of xenstored I think such a reorg would make
> sense to go into the same Xen version. Delaying it until the next
> version would make potential backports for 4.18 harder.

+1.

Cheers,

-- 
Julien Grall

