Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B412D0F95
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46342.82243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEt4-0000fF-Jk; Mon, 07 Dec 2020 11:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46342.82243; Mon, 07 Dec 2020 11:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEt4-0000eq-Ga; Mon, 07 Dec 2020 11:41:02 +0000
Received: by outflank-mailman (input) for mailman id 46342;
 Mon, 07 Dec 2020 11:41:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEt2-0000eg-Eu
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:41:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03f2969b-d11b-4ea5-a8da-12da4c22efa7;
 Mon, 07 Dec 2020 11:40:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AD65AC90;
 Mon,  7 Dec 2020 11:40:58 +0000 (UTC)
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
X-Inumbo-ID: 03f2969b-d11b-4ea5-a8da-12da4c22efa7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607341258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktigrgzOccHxvbusY6yLdeGC0ejiIpTZQxtFb509trE=;
	b=pyWbUnb8Lz9Z0DiRgRroPSX6T0WKb/XJ3LiuaPgure2wECRbH5bePBC/z3fKLEy/WmVvJb
	5DXYyUqRX/LqNom+oWlKGWQKN4260RBPO8T445kPEa+94l8VcztrAFK6XHCdzSebZ1QMgl
	9A5+DNoSRYErcsgfebTsfoM8D9Zi86A=
Subject: Re: [PATCH V3 04/23] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tim Deegan
 <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-5-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1fdebe9-3355-fece-e9dc-e6a7acc180e7@suse.com>
Date: Mon, 7 Dec 2020 12:41:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-5-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -19,8 +19,7 @@
>  #ifndef __ASM_X86_HVM_IOREQ_H__
>  #define __ASM_X86_HVM_IOREQ_H__
>  
> -#define HANDLE_BUFIOREQ(s) \
> -    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
> +#include <xen/ioreq.h>

Is there a strict need to do it this way round? Usually the common
header would include the arch one ...

> @@ -38,42 +37,6 @@ int arch_ioreq_server_get_type_addr(const struct domain *d,
>                                      uint64_t *addr);
>  void arch_ioreq_domain_init(struct domain *d);

As already mentioned in an earlier reply: What about these? They
shouldn't get declared once per arch. If anything, ones that
want to be inline functions can / should remain in the per-arch
header.

Jan

