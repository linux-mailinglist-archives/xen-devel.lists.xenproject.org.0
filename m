Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A22D0ED4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46258.82084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEXn-0004oq-TX; Mon, 07 Dec 2020 11:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46258.82084; Mon, 07 Dec 2020 11:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEXn-0004oT-QD; Mon, 07 Dec 2020 11:19:03 +0000
Received: by outflank-mailman (input) for mailman id 46258;
 Mon, 07 Dec 2020 11:19:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEXm-0004oN-4N
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:19:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acbb9e91-c40e-4b5e-a515-1d342ff0842a;
 Mon, 07 Dec 2020 11:19:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0D6FAC9A;
 Mon,  7 Dec 2020 11:18:59 +0000 (UTC)
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
X-Inumbo-ID: acbb9e91-c40e-4b5e-a515-1d342ff0842a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607339939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKOtYRaxp5uzQ4H36SeAPcpXGVYMTxCAX57B+h/k7Nc=;
	b=Gqb6qVt4Ga9/aaj85RZ6gaw/YuL2ttuIuKDUlqN8yh+scVmDZb5bIDL5wG52X9BBSLUWYF
	OUH+ZZQO7WQXwhh2KxPme92TeotcZcyyojwL+INsdljivwvxiKLdGa4FpwT+hbz2pFqdqI
	rX9YxiXe+4rj+d64/xJbK2lMZaI3f2Y=
Subject: Re: [PATCH V3 02/23] x86/ioreq: Add IOREQ_STATUS_* #define-s and
 update code for moving
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-3-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78632ed3-e4d4-7b4c-fd0a-504b6b26e78a@suse.com>
Date: Mon, 7 Dec 2020 12:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -74,6 +74,10 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
>  
>  void hvm_ioreq_init(struct domain *d);
>  
> +#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
> +#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
> +#define IOREQ_STATUS_RETRY       X86EMUL_RETRY

This correlation may not be altered. I think a comment is needed
to this effect, to avoid someone trying to subsequently fold the
x86 and (to be introduced) Arm ones. With that
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

