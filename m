Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F162E1FA4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 18:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58540.103062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7US-0003Xd-2r; Wed, 23 Dec 2020 16:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58540.103062; Wed, 23 Dec 2020 16:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7UR-0003XE-Vs; Wed, 23 Dec 2020 16:59:55 +0000
Received: by outflank-mailman (input) for mailman id 58540;
 Wed, 23 Dec 2020 16:59:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks7UP-0003X9-SQ
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:59:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53adbc5c-1012-4c18-8e38-2a2a2270bee4;
 Wed, 23 Dec 2020 16:59:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37A1EACC6;
 Wed, 23 Dec 2020 16:59:52 +0000 (UTC)
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
X-Inumbo-ID: 53adbc5c-1012-4c18-8e38-2a2a2270bee4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608742792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U96HdMJrByaUuseJkZ3+6NMrEsCWMjTIorLwAJV2XdM=;
	b=tkRGcixugxo7fHtMdZjCsn2GwD4KNPCnjkMRGcTPA+KFCKPQSbIYWS6U8ynt85ely5PZEg
	4RFhodTLn2ewcViyYG2c0XeyJFbfYfVM4IaOmQiKOuydtsQh1mU9mDzuzT+BcT65awnR6o
	6o6KuFtQHs0Ots+F8Q/S1i8Ssr9K70M=
Subject: Re: [PATCH v2] lib: drop (replace) debug_build()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
 <bdb96275-c6a4-a4d2-9195-67fd2f3f1bf3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11bb1b39-7d1d-bcf4-1bff-4472a3c79dea@suse.com>
Date: Wed, 23 Dec 2020 17:59:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bdb96275-c6a4-a4d2-9195-67fd2f3f1bf3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:53, Andrew Cooper wrote:
> On 23/12/2020 16:05, Jan Beulich wrote:
>> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
>> allow enabling assertions independently of CONFIG_DEBUG. Replace the few
>> uses by a new xen_build_info() helper, subsuming gcov_string at the same
>> time (while replacing the stale CONFIG_GCOV used there) and also adding
>> CONFIG_UBSAN indication.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

>> --- a/xen/common/version.c
>> +++ b/xen/common/version.c
>> @@ -70,6 +70,30 @@ const char *xen_deny(void)
>>      return "<denied>";
>>  }
>>  
>> +static const char build_info[] =
>> +    "debug="
>> +#ifdef CONFIG_DEBUG
>> +    "y"
>> +#else
>> +    "n"
>> +#endif
>> +#ifdef CONFIG_COVERAGE
>> +# ifdef __clang__
>> +    " llvmcov=y"
>> +# else
>> +    " gcov=y"
>> +# endif
>> +#endif
>> +#ifdef CONFIG_UBSAN
>> +    " ubsan=y"
>> +#endif
>> +    "";
>> +
>> +const char *xen_build_info(void)
>> +{
>> +    return build_info;
>> +}
> 
> ... do we really need a function here?
> 
> Wouldn't an extern const char build_info[] do?

It probably would, but I wanted things to remain consistent with
the siblings, many of which also return string literals (or
effectively plain numbers).

Jan

