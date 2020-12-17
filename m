Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009952DD123
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 13:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55902.97513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpsB4-0008P7-Qv; Thu, 17 Dec 2020 12:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55902.97513; Thu, 17 Dec 2020 12:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpsB4-0008Oi-NW; Thu, 17 Dec 2020 12:14:38 +0000
Received: by outflank-mailman (input) for mailman id 55902;
 Thu, 17 Dec 2020 12:14:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpsB3-0008Oc-DQ
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 12:14:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e92a102d-a6a6-48f1-9f82-3f6470365b82;
 Thu, 17 Dec 2020 12:14:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98737AC7F;
 Thu, 17 Dec 2020 12:14:34 +0000 (UTC)
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
X-Inumbo-ID: e92a102d-a6a6-48f1-9f82-3f6470365b82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608207274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrphdW29sKqk78WD/Xl6dHk4g7FXa40Q7mkMEDngeVc=;
	b=V9FIZWuOIwamNxZyRj7jIcvuH5dYpVaea+97qytNyjFEkEEL2Nxu0MdRRuyCkmlSFIV3sL
	6xUlUIeYt7emk/4a/MiZWn2OtcaVeI9voyqZHj9PssnT7qucoBgiJdHkX5KVNqKTyr0ANw
	C2kodxqMpN9p3QvF6lf6+pj0kcfJ/Hs=
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
 <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
 <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e0ac85e-ecba-86ad-b350-ff30e3a40a68@suse.com>
Date: Thu, 17 Dec 2020 13:14:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 12:32, Jürgen Groß wrote:
> On 17.12.20 12:28, Jan Beulich wrote:
>> On 09.12.2020 17:09, Juergen Gross wrote:
>>> +static const struct hypfs_entry *hypfs_dyndir_enter(
>>> +    const struct hypfs_entry *entry)
>>> +{
>>> +    const struct hypfs_dyndir_id *data;
>>> +
>>> +    data = hypfs_get_dyndata();
>>> +
>>> +    /* Use template with original enter function. */
>>> +    return data->template->e.funcs->enter(&data->template->e);
>>> +}
>>
>> At the example of this (applies to other uses as well): I realize
>> hypfs_get_dyndata() asserts that the pointer is non-NULL, but
>> according to the bottom of ./CODING_STYLE this may not be enough
>> when considering the implications of a NULL deref in the context
>> of a PV guest. Even this living behind a sysctl doesn't really
>> help, both because via XSM not fully privileged domains can be
>> granted access, and because speculation may still occur all the
>> way into here. (I'll send a patch to address the latter aspect in
>> a few minutes.) While likely we have numerous existing examples
>> with similar problems, I guess in new code we'd better be as
>> defensive as possible.
> 
> What do you suggest? BUG_ON()?

Well, BUG_ON() would be a step in the right direction, converting
privilege escalation to DoS. The question is if we can't do better
here, gracefully failing in such a case (the usual pair of
ASSERT_UNREACHABLE() plus return/break/goto approach doesn't fit
here, at least not directly).

> You are aware that this is nothing a user can influence, so it would
> be a clear coding error in the hypervisor?

A user (or guest) can't arrange for there to be a NULL pointer,
but if there is one that can be run into here, this would still
require an XSA afaict.

Jan

