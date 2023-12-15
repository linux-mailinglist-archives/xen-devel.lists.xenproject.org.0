Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830A78147F6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 13:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655095.1022762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE7EX-0002tM-AO; Fri, 15 Dec 2023 12:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655095.1022762; Fri, 15 Dec 2023 12:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE7EX-0002r7-7T; Fri, 15 Dec 2023 12:24:01 +0000
Received: by outflank-mailman (input) for mailman id 655095;
 Fri, 15 Dec 2023 12:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6RE=H2=redhat.com=fweimer@srs-se1.protection.inumbo.net>)
 id 1rE7EV-0002r1-Nx
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 12:23:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d12f1eb1-9b44-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 13:23:57 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-RJqo6eCiM1OHdZUypp3Z4w-1; Fri,
 15 Dec 2023 07:23:55 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCDFF38135E4;
 Fri, 15 Dec 2023 12:23:54 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DCB492BF0;
 Fri, 15 Dec 2023 12:23:54 +0000 (UTC)
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
X-Inumbo-ID: d12f1eb1-9b44-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702643036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r55WWxcNKxE1IFQ++85Wouj4dgeBip3v5Uv+75Z0XCw=;
	b=T1Rqh4Sw6wAHKamrkM3k/EeP0DoKPSlt6G/e9PBNJomT0SYTb1bMnxSds2MnQHC+KPJvtF
	hNbBNnq3sZu8DsaLhYxDItCpM0I1GLIhscyqylf87XJRpPVvLeoWMq+fjeVC3aJGCRQvj6
	a4DflJoxmkucN7CZe35P3SS+IuYiClI=
X-MC-Unique: RJqo6eCiM1OHdZUypp3Z4w-1
From: Florian Weimer <fweimer@redhat.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Fix C compatibility issue in mini-os
References: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
	<cc41e7e9-13cf-48dd-a0a0-3e0d9d9b4051@suse.com>
Date: Fri, 15 Dec 2023 13:23:52 +0100
In-Reply-To: <cc41e7e9-13cf-48dd-a0a0-3e0d9d9b4051@suse.com> (Jan Beulich's
	message of "Fri, 15 Dec 2023 13:02:26 +0100")
Message-ID: <875y0z8xif.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

* Jan Beulich:

> On 15.12.2023 12:59, Florian Weimer wrote:
>> The cc-option check always fails (that, it picks the second option
>> unconditionally) if the compiler does not support implicit conversion
>> from integers to pointers.  Just drop the initialization because it
>> seems unnecessary in this context.
>
> Did you pay attention to ...
>
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -21,7 +21,7 @@ endef
>>  # of which would indicate an "unrecognized command-line option" warning/error.
>
> ... the comment the tail of which is visible here?

I didn't investigate how the mechanics of the selection are
accomplished.  I was so happy that I finally found the source of the
int-conversion error and got a bit carried away.

Looking at the shell script fragment:

>>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
>> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>> +cc-option = $(shell if test -z "`echo 'void*p;' | \
>>                $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
>>                then echo "$(2)"; else echo "$(3)"; fi ;)

I can see that the exit status of the compiler does not matter, so the
patch will not make a difference.

I'll record this as a false positive.

Thanks,
Florian


