Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB1C387BFC
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 17:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129318.242752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1KG-0002Xy-J8; Tue, 18 May 2021 15:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129318.242752; Tue, 18 May 2021 15:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1KG-0002Vd-G1; Tue, 18 May 2021 15:08:04 +0000
Received: by outflank-mailman (input) for mailman id 129318;
 Tue, 18 May 2021 15:08:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lj1KF-0002VX-R0
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 15:08:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74ee493d-68e5-432e-9ea0-c1ad0e14a456;
 Tue, 18 May 2021 15:08:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F043DB179;
 Tue, 18 May 2021 15:08:01 +0000 (UTC)
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
X-Inumbo-ID: 74ee493d-68e5-432e-9ea0-c1ad0e14a456
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621350482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXao6gYeo6sgIBtQXwc8fsCaMUIigIiOiDjCPXMEif0=;
	b=fim7hYNHZMOOLw8Nu6NMIHJwdx/aHdN77itcpDDTLb1ycbLNjpcm9ZKjGHKbNq3oRuvOfD
	Hyt77pusZt5lhXS5SwAHbXDaKOfY7ZU3WxZ4v179AuBx3cQMZG+kyxQmLIw6ZndOpUb4kE
	0XomicQkqkwOU4LoWkqsafEzlUNwXFA=
Subject: Re: [PATCH v2 1/2] xen/char: console: Use const whenever we point to
 literal strings
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210518140134.31541-1-julien@xen.org>
 <20210518140134.31541-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4a4acdf-9c73-d256-ee3b-f65126d08d37@suse.com>
Date: Tue, 18 May 2021 17:08:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518140134.31541-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 16:01, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
> 
> The array should also not be modified at all and is only used by
> xenlog_update_val(). So take the opportunity to add an extra const and
> move the definition in the function.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

