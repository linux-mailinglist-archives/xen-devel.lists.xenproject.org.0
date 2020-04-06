Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F419F1D6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 10:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNU4-0005p4-AR; Mon, 06 Apr 2020 08:51:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=glNc=5W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLNU2-0005oy-Hc
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 08:51:54 +0000
X-Inumbo-ID: dd1afc3c-77e3-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd1afc3c-77e3-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rs4q5BylTNraN+j0XjUsuGksYpP/Fnjb0R58wRrNrw0=; b=eFakgQtBq543a5kOsN4iBYKn8e
 A0xOmFHY9dmnJ0lBhDdwZdLuuU0A9cmc6FIT80V/Xc/a20+OM40cgSXCme5Uh0osKhhhv7QtfcWcq
 zLbd/m3ib22rQX/078g4UbDHFzbPX4Fwvbanrh+Bu5Mlh1eTLS0B7l4/KImsp6FPIgEg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLNTs-0004xN-Gs; Mon, 06 Apr 2020 08:51:44 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLNTs-0005Wf-9S; Mon, 06 Apr 2020 08:51:44 +0000
Subject: Re: [PATCH 5/7] xen: include xen/guest_access.h rather than
 asm/guest_access.h
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-6-julien@xen.org>
 <001201d60be6$ab976e20$02c64a60$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7fc71644-3f4d-bbac-f593-fab86bfb2ff9@xen.org>
Date: Mon, 6 Apr 2020 09:51:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <001201d60be6$ab976e20$02c64a60$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <jgrall@amazon.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 06/04/2020 08:40, Paul Durrant wrote:
>> diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
>> index 9ee275d01f..5c3dfc47b6 100644
>> --- a/xen/include/asm-x86/guest_access.h
>> +++ b/xen/include/asm-x86/guest_access.h
>> @@ -54,22 +54,24 @@
>>
>>   /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
>>   #define guest_handle_to_param(hnd, type) ({                  \
>> +    typeof((hnd).p) _x = (hnd).p;                            \
>> +    XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
>>       /* type checking: make sure that the pointers inside     \
>>        * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
>>        * the same type, then return hnd */                     \
>> -    (void)((typeof(&(hnd).p)) 0 ==                           \
>> -        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
>> -    (hnd);                                                   \
>> +    (void)(&_x == &_y.p);                                    \
>> +    _y;                                                      \
>>   })
>>
>>   /* Cast a XEN_GUEST_HANDLE_PARAM to XEN_GUEST_HANDLE */
>> -#define guest_handle_from_param(hnd, type) ({                \
>> -    /* type checking: make sure that the pointers inside     \
>> -     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
>> -     * the same type, then return hnd */                     \
>> -    (void)((typeof(&(hnd).p)) 0 ==                           \
>> -        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
>> -    (hnd);                                                   \
>> +#define guest_handle_from_param(hnd, type) ({               \
>> +    typeof((hnd).p) _x = (hnd).p;                           \
>> +    XEN_GUEST_HANDLE(type) _y = { _x };                     \
>> +    /* type checking: make sure that the pointers inside    \
>> +     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of   \
>> +     * the same type, then return hnd */                    \
>> +    (void)(&_x == &_y.p);                                   \
>> +    _y;                                                     \
>>   })
>>
> 
> The commit comment would have the reader believe that this patch is just some changes in header file inclusion. These last two hunks are something else so I would suggest they get split out into a separate patch.

These two chunks were meant to be squashed in patch #6, but I messed up 
the rebase. I will fix on the next version.

Sorry for that.

Cheers,

> 
>    Paul
> 
>>   #define guest_handle_for_field(hnd, type, fld)          \
>> diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
>> index b793181464..2d53bd3ced 100644
>> --- a/xen/lib/x86/private.h
>> +++ b/xen/lib/x86/private.h
>> @@ -4,12 +4,12 @@
>>   #ifdef __XEN__
>>
>>   #include <xen/bitops.h>
>> +#include <xen/guest_access.h>
>>   #include <xen/kernel.h>
>>   #include <xen/lib.h>
>>   #include <xen/nospec.h>
>>   #include <xen/types.h>
>>
>> -#include <asm/guest_access.h>
>>   #include <asm/msr-index.h>
>>
>>   #define copy_to_buffer_offset copy_to_guest_offset
>> --
>> 2.17.1
> 
> 

-- 
Julien Grall

