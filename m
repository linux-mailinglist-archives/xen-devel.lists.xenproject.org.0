Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0B2B5E31
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 12:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28939.58101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kez50-0007cT-Py; Tue, 17 Nov 2020 11:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28939.58101; Tue, 17 Nov 2020 11:23:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kez50-0007c4-MY; Tue, 17 Nov 2020 11:23:22 +0000
Received: by outflank-mailman (input) for mailman id 28939;
 Tue, 17 Nov 2020 11:23:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kez4y-0007bz-MV
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:23:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0098b7e7-d9c4-4e1e-8d34-7310e2352add;
 Tue, 17 Nov 2020 11:23:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27931AC23;
 Tue, 17 Nov 2020 11:23:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kez4y-0007bz-MV
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:23:20 +0000
X-Inumbo-ID: 0098b7e7-d9c4-4e1e-8d34-7310e2352add
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0098b7e7-d9c4-4e1e-8d34-7310e2352add;
	Tue, 17 Nov 2020 11:23:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605612199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQx3oPFm+QKaarZ4yUa1HfhPc7sP/lWshgtkUT3t9EI=;
	b=Cu9GEAvf7N9J8kxYxZgAR6g+0s9r6ZoEwVFTQFfseI3JW439/8mY/OprOQb7jTBEt4kAaq
	kTe8WcubK/qNSGqdKQhWL3lTUxn7+KAoIF64bT0JgZKgNiNFknLxXOOBcm5+DUNpH2j0Co
	Jjwq7UKyJDVo7XO7gLQwCpVpd7Zys4I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 27931AC23;
	Tue, 17 Nov 2020 11:23:19 +0000 (UTC)
Subject: Re: [PATCH 07/12] xen/hypfs: pass real failure reason up from
 hypfs_get_entry()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eda2dc8-6dfd-84df-6e50-51974d81f28e@suse.com>
Date: Tue, 17 Nov 2020 12:23:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-8-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> Instead of handling all errors from hypfs_get_entry() as ENOENT pass
> up the real error value via ERR_PTR().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

