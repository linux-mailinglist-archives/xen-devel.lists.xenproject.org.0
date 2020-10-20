Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761762938D4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9069.24372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUoW7-0003jt-3Y; Tue, 20 Oct 2020 10:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9069.24372; Tue, 20 Oct 2020 10:05:19 +0000
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
	id 1kUoW7-0003jU-01; Tue, 20 Oct 2020 10:05:19 +0000
Received: by outflank-mailman (input) for mailman id 9069;
 Tue, 20 Oct 2020 10:05:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUoW5-0003jP-Bk
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:05:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a87d765d-7032-401f-a927-c37fd2723422;
 Tue, 20 Oct 2020 10:05:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9317FAFFA;
 Tue, 20 Oct 2020 10:05:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUoW5-0003jP-Bk
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:05:17 +0000
X-Inumbo-ID: a87d765d-7032-401f-a927-c37fd2723422
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a87d765d-7032-401f-a927-c37fd2723422;
	Tue, 20 Oct 2020 10:05:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603188314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADiIGIaN1wqYaEgkx2lrsJJhZVaGpCJeg86fFJjvVLQ=;
	b=frDqcAy65cBpAYBZSGKwYXCaArUG6Y0cCl5WqJU0edktJhEJHV4uR7DCJesaWl6jDrPi6X
	zEVKV22fRo2gwV1MVcxLMvy2pDGK9AM28bXXkY/a8+ghUDJ8UTrijeE+hwx1oiE3Rxhmor
	2+R+obpcpf6PqyTlQf2CTf4rp+hVKIo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9317FAFFA;
	Tue, 20 Oct 2020 10:05:14 +0000 (UTC)
Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
To: paul@xen.org
Cc: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
 <004701d6a6c1$6c09f860$441de920$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38ba45dd-f1cd-a289-3ea3-75148782e126@suse.com>
Date: Tue, 20 Oct 2020 12:05:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <004701d6a6c1$6c09f860$441de920$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 11:14, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
>> Sent: 15 October 2020 17:44
>>
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -181,6 +181,8 @@ static inline bool arch_hvm_ioreq_destroy(struct domain *d)
>>  #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>>  #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>>
>> +#define ioreq_complete_mmio   handle_mmio
>> +
> 
> A #define? Really? Can we not have a static inline?

I guess this would require further shuffling: handle_mmio() is
an inline function in hvm/emulate.h, and hvm/ioreq.h has no
need to include the former (and imo it also shouldn't have).

Jan

