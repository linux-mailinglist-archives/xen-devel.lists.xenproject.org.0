Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E379B204
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 01:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599819.935392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfqlw-0007hD-96; Mon, 11 Sep 2023 23:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599819.935392; Mon, 11 Sep 2023 23:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfqlw-0007fB-62; Mon, 11 Sep 2023 23:56:52 +0000
Received: by outflank-mailman (input) for mailman id 599819;
 Mon, 11 Sep 2023 23:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipyp=E3=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qfqlv-0007f4-E9
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 23:56:51 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dee3753c-50fe-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 01:56:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E06AA8285544;
 Mon, 11 Sep 2023 18:56:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ERcn-qdieOB7; Mon, 11 Sep 2023 18:56:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3B769828573E;
 Mon, 11 Sep 2023 18:56:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CIc6uPVVeNTf; Mon, 11 Sep 2023 18:56:47 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C81048285544;
 Mon, 11 Sep 2023 18:56:46 -0500 (CDT)
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
X-Inumbo-ID: dee3753c-50fe-11ee-8786-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3B769828573E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694476607; bh=UW40c96QVHsCWqUdK/2i+1XHEV7FgUG9wP7O0ATnoos=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=t8zlfo0I/wGD0PSWy0NzZIDW16tPAbmW5g5hY4oc+NQQ+F5tqruSMK5yNZNTfcdJ4
	 3ecTz1tAMXDjDQ8DLAY/wn4pWvVmLkWHjNLcoNI0kPKkWwY2RZWG1NCrTjgxNWKf9p
	 +qHYRVws9k7fiute1eRLl6TEZxEpq1p5eMeHWo78=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7d3029fc-1188-3c55-0a54-bb9899fb91e8@raptorengineering.com>
Date: Mon, 11 Sep 2023 18:56:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <7ed453323033a759427da33cea7d18ddca247ae7.1694211900.git.sanastasio@raptorengineering.com>
 <93f4a2f3-b98c-332d-64a6-9e34cc9dddf2@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <93f4a2f3-b98c-332d-64a6-9e34cc9dddf2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/23 6:33 AM, Jan Beulich wrote:
> On 09.09.2023 00:50, Shawn Anastasio wrote:
>> Implement atomic.h for PPC, based off of the original Xen 3.2
>> implementation. This implementation depends on some functions that are
>> not yet defined (notably __cmpxchg), so it can't yet be used.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
>

Thanks.

> Just one remaining question:
> 
>> +static always_inline void read_atomic_size(const volatile void *p, void *res,
>> +                                           unsigned int size)
>> +{
>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        *(uint8_t *)res = read_u8_atomic(p);
>> +        break;
>> +    case 2:
>> +        *(uint16_t *)res = read_u16_atomic(p);
>> +        break;
>> +    case 4:
>> +        *(uint32_t *)res = read_u32_atomic(p);
>> +        break;
>> +    case 8:
>> +        *(uint64_t *)res = read_u64_atomic(p);
>> +        break;
>> +    default:
>> +        __bad_atomic_read(p, res);
>> +        break;
>> +    }
>> +}
>> +
>> +static always_inline void write_atomic_size(volatile void *p, const void *val,
>> +                                            unsigned int size)
>> +{
>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        write_u8_atomic(p, *(const uint8_t *)val);
>> +        break;
>> +    case 2:
>> +        write_u16_atomic(p, *(const uint16_t *)val);
>> +        break;
>> +    case 4:
>> +        write_u32_atomic(p, *(const uint32_t *)val);
>> +        break;
>> +    case 8:
>> +        write_u64_atomic(p, *(const uint64_t *)val);
>> +        break;
>> +    default:
>> +        __bad_atomic_size();
>> +        break;
>> +    }
>> +}
> 
> These two functions being as similar as is possible, ...
> 
>> +#define read_atomic(p)                                                         \
>> +    ({                                                                         \
>> +        union {                                                                \
>> +            typeof(*(p)) val;                                                  \
>> +            char c[sizeof(*(p))];                                              \
>> +        } x_;                                                                  \
>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
>> +        x_.val;                                                                \
>> +    })
> 
> ... is there a reason you keep using a union here ...
> 
>> +#define write_atomic(p, x)                                                     \
>> +    do                                                                         \
>> +    {                                                                          \
>> +        typeof(*(p)) x_ = (x);                                                 \
>> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
>> +    } while ( 0 )
> 
> ... while you did away with its use here?
>

Yes. In the case of read_atomic the caller is allowed (expected, even)
to pass in const pointers for `p`, which wouldn't work if a simple
typeof(*(p)) declaration was used since it would inherit the constness
and thus wouldn't be passable to read_atomic_size.

In the case of write_atomic though, there is no need to support const
`p`, so no union is necessary.

> Jan

Thanks,
Shawn

