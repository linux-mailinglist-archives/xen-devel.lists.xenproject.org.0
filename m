Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F832AEA25
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 08:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24268.51429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kckXe-000471-CG; Wed, 11 Nov 2020 07:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24268.51429; Wed, 11 Nov 2020 07:27:42 +0000
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
	id 1kckXe-00046R-6L; Wed, 11 Nov 2020 07:27:42 +0000
Received: by outflank-mailman (input) for mailman id 24268;
 Wed, 11 Nov 2020 07:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kckXc-000463-5x
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:27:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a050a9db-cfec-4dd8-9573-a4b834d0c333;
 Wed, 11 Nov 2020 07:27:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AA2EABD6;
 Wed, 11 Nov 2020 07:27:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kckXc-000463-5x
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:27:40 +0000
X-Inumbo-ID: a050a9db-cfec-4dd8-9573-a4b834d0c333
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a050a9db-cfec-4dd8-9573-a4b834d0c333;
	Wed, 11 Nov 2020 07:27:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605079658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmceScSgf0CVIuUojV+Ta0HKWnBwoHHZb6EIyKPlsz4=;
	b=mF7BZdwkZlN3gbq9PervHFqqGvpqdwjnpa1tfQGPIXD48fodWkbrS/8hfNy3aXUil9zcpv
	8YpVmzcYsslgXc82vd2L5xfWR3dzh/TswwCqfb+iSDNa6xIbAI6uOMaSESYWLfw14TmD1g
	8CdwbMI9lTN+eRVNnEpcH9dKU4H1bNI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1AA2EABD6;
	Wed, 11 Nov 2020 07:27:38 +0000 (UTC)
Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien.grall@arm.com>, paul@xen.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
 <004701d6a6c1$6c09f860$441de920$@xen.org>
 <38ba45dd-f1cd-a289-3ea3-75148782e126@suse.com>
 <004a01d6a6cd$1f4684b0$5dd38e10$@xen.org>
 <fab8e4b0-e3b2-fb74-76d4-42753ac88367@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2d1cbef-09ec-86e4-bfc5-20320f78be6b@suse.com>
Date: Wed, 11 Nov 2020 08:27:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <fab8e4b0-e3b2-fb74-76d4-42753ac88367@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 20:44, Oleksandr wrote:
> 
> On 20.10.20 13:38, Paul Durrant wrote:
> 
> Hi Jan, Paul
> 
> Sorry for the late response.
> 
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 20 October 2020 11:05
>>> To: paul@xen.org
>>> Cc: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>; xen-devel@lists.xenproject.org; 'Oleksandr
>>> Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Roger Pau
>>> Monné' <roger.pau@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Julien Grall' <julien@xen.org>; 'Stefano
>>> Stabellini' <sstabellini@kernel.org>; 'Julien Grall' <julien.grall@arm.com>
>>> Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
>>>
>>> On 20.10.2020 11:14, Paul Durrant wrote:
>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
>>>>> Sent: 15 October 2020 17:44
>>>>>
>>>>> --- a/xen/include/asm-x86/hvm/ioreq.h
>>>>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>>>>> @@ -181,6 +181,8 @@ static inline bool arch_hvm_ioreq_destroy(struct domain *d)
>>>>>   #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>>>>>   #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>>>>>
>>>>> +#define ioreq_complete_mmio   handle_mmio
>>>>> +
>>>> A #define? Really? Can we not have a static inline?
>>> I guess this would require further shuffling: handle_mmio() is
>>> an inline function in hvm/emulate.h, and hvm/ioreq.h has no
>>> need to include the former (and imo it also shouldn't have).
>>>
>> I see. I think we need an x86 ioreq.c anyway, to deal with the legacy use of magic pages, so it could be dealt with there instead.
> I am afraid I don't entirely understand the required changes. Could you 
> please clarify where the "inline(?)" ioreq_complete_mmio() should
> live? I included hvm/emulate.h here not for the "handle_mmio()" reason 
> only, but for "struct hvm_emulate_ctxt" also (see arch_io_completion()).

I'm sorry, but in the context of this patch there's no use of any
struct hvm_emulate_ctxt instance. I'm not going to wade through 23
patches to find what you mean.

> But, if we return x86 ioreq.c back I can move arch_io_completion() to it 
> as well as "non-online" ioreq_complete_mmio().
> This will avoid including hvm/emulate.h here. Or I missed something?

I suppose an out-of-line function as kind of a last resort solution
is what Paul had in mind. To be honest I'd prefer to avoid the
extra call layer though, if possible.

Jan

