Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA3BD2C4F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142260.1476447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Ge2-0006QO-6D; Mon, 13 Oct 2025 11:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142260.1476447; Mon, 13 Oct 2025 11:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Ge2-0006Nb-3N; Mon, 13 Oct 2025 11:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1142260;
 Mon, 13 Oct 2025 11:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gpU8=4W=linux.dev=thorsten.blum@srs-se1.protection.inumbo.net>)
 id 1v8Gdz-0006NV-Mk
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:23:12 +0000
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe61ed0b-a826-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 13:23:10 +0200 (CEST)
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
X-Inumbo-ID: fe61ed0b-a826-11f0-9d15-b5c5bf9af7f9
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760354586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rg/q8gaLEXsqld9FivxIEfM5ipjG9i1m/rctrdOvWIE=;
	b=iu7JmbDXS09ExiGoWBahy4+AbAU0q26cy0aGZUaC2VqCGiyu4+l+zkCpzaz4vICmLPDqhi
	G9tafSk2uhs4kuSbF1JHpNTRTPpEtrcY4pPU9a2Y0JVor6puVfJq61dL9cWJWumsA1Hbni
	7+dfViMzAyWk/xY4KMCmqKn3RCa2TKY=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drivers/xen/xenbus: Replace deprecated strcpy in
 xenbus_transaction_end
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <2cce7bee-af02-4850-b1a8-b7f2cf3f1efb@suse.com>
Date: Mon, 13 Oct 2025 13:23:00 +0200
Cc: Jan Beulich <jbeulich@suse.com>,
 linux-hardening@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC8DD2E1-61F3-4882-8266-3F828377DA35@linux.dev>
References: <20251012195514.39003-2-thorsten.blum@linux.dev>
 <ebee3406-d515-4e29-9d7c-f54bdb143080@suse.com>
 <65bad926-22fc-41da-b9c4-5857a002b377@suse.com>
 <13cbd826-540e-4352-8e0d-ae0c9fbd2faa@suse.com>
 <2cce7bee-af02-4850-b1a8-b7f2cf3f1efb@suse.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
X-Migadu-Flow: FLOW_OUT

On 13. Oct 2025, at 11:24, J=C3=BCrgen Gro=C3=9F wrote:
> On 13.10.25 10:22, Jan Beulich wrote:
>> On 13.10.2025 09:36, J=C3=BCrgen Gro=C3=9F wrote:
>>> I would even go further and drop abortstr[] completely:
>>>=20
>>> diff --git a/drivers/xen/xenbus/xenbus_xs.c =
b/drivers/xen/xenbus/xenbus_xs.c
>>> index 528682bf0c7f..c891af7165f5 100644
>>> --- a/drivers/xen/xenbus/xenbus_xs.c
>>> +++ b/drivers/xen/xenbus/xenbus_xs.c
>>> @@ -550,14 +550,8 @@ EXPORT_SYMBOL_GPL(xenbus_transaction_start);
>>>    */
>>>   int xenbus_transaction_end(struct xenbus_transaction t, int abort)
>>>   {
>>> -       char abortstr[2];
>>> -
>>> -       if (abort)
>>> -               strcpy(abortstr, "F");
>>> -       else
>>> -               strcpy(abortstr, "T");
>>> -
>>> -       return xs_error(xs_single(t, XS_TRANSACTION_END, abortstr, =
NULL));
>>> +       return xs_error(xs_single(t, XS_TRANSACTION_END, abort ? "F" =
: "T",
>>> +                       NULL));
>>>   }
>>>   EXPORT_SYMBOL_GPL(xenbus_transaction_end);
>> Hmm, which xs_single() indeed takes a const char *, it then casts =
away const-
>> ness before handing to xs_talkv().
>=20
> Yes, the cast is needed as xs_talkv() can handle reads and writes. No =
problem in
> this case, as the string is only read by xs_talkv() (write type =
operation).

I'll submit a v2.

Thanks,
Thorsten


