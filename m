Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B719B773
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 23:12:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJkdb-0006Ih-9y; Wed, 01 Apr 2020 21:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJkdZ-0006Ib-TM
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 21:11:01 +0000
X-Inumbo-ID: 4a36b5ca-745d-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a36b5ca-745d-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 21:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DjYNdY2SZPgysMgui8UdB2jjHY5hTObqkW3Cyl+KLOw=; b=LO7Yt17JvA766+Qo6NIrNgnTat
 nBZ1boFA9Kxl3cSgVaDnT41Ddo7RltChePdh3ER/KAatQMtvNxemGMKYIYWQ1ZMdx8cG+WbRke9uY
 YZ1AjO2x97uQ+97RDnAVl9rvgUnqha3PJOSs/PHTQKeR9I+abwbFpL310PlxMVO1QZqw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJkdW-0004P9-OK; Wed, 01 Apr 2020 21:10:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJkdW-0005QZ-Hu; Wed, 01 Apr 2020 21:10:58 +0000
Subject: Re: [PATCH 1/8] xen/guest_access: Harden copy_to_guest_offset to
 prevent const dest operand
To: Jan Beulich <jbeulich@suse.com>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-2-julien@xen.org>
 <33a36f0e-5adb-b8af-445c-bab765c84589@suse.com>
 <b5f7037a-5253-b5f2-d5b7-1b90d19021c2@xen.org>
 <11871e55-481f-b318-bf5d-d9518e180fa9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <16c3a710-c261-1e97-35b5-9d0ef5470e8c@xen.org>
Date: Wed, 1 Apr 2020 22:10:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <11871e55-481f-b318-bf5d-d9518e180fa9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 dfaggioli@suse.com, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 01/04/2020 10:25, Jan Beulich wrote:
> On 31.03.2020 21:13, Julien Grall wrote:
>> I am not aware of any way before C11 to check if a variable is
>> const or not. If we wanted to keep allow void type the handle
>> then a possible approach would be:
>>
>> #define copy_to_guest_offset(hnd, off, ptr, nr) ({              \
>>      const typeof(*(ptr)) *_s = (ptr);                           \
>>      typeof(*((hnd).p)) *_d = (hnd).p;                           \
>>      size_t mul = (sizeof(*(hnd).p) > 1) ? 1 : sizeof (*_s);     \
>>      ((void)((hnd).p == (ptr)));                                 \
>>      raw_copy_to_guest(_d + (off) * mul, _s, sizeof(*_s)*(nr));  \
>> })
>>
>> I don't particularly like it but I could not come up with better so far.
> 
> Having looked at how in particular copy_field_to_guest() (which
> doesn't have this issue afaict) works, here's an imo much better
> alternative:
> 
> @@ -87,6 +87,7 @@
>   #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
>       const typeof(*(ptr)) *_s = (ptr);                   \
>       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
> +    void *__maybe_unused _t = (hnd).p;                  \
>       ((void)((hnd).p == (ptr)));                         \
>       raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
>   })
> @@ -143,6 +144,7 @@ static inline void put_guest_handle(void
>   #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
>       const typeof(*(ptr)) *_s = (ptr);                   \
>       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
> +    void *__maybe_unused _t = (hnd).p;                  \
>       ((void)((hnd).p == (ptr)));                         \
>       __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
>   })

I actually thought about this one but discarded it because it was using 
unused variable. But I am happy with it, I will have a look to respin 
the patch.

Cheers,

-- 
Julien Grall

