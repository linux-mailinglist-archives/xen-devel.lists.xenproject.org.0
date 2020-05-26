Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31B1C8C88
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:38:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWgjP-0003zw-0L; Thu, 07 May 2020 13:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWgjO-0003zq-48
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:38:30 +0000
X-Inumbo-ID: 09028b66-9068-11ea-9f1a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09028b66-9068-11ea-9f1a-12813bfff9fa;
 Thu, 07 May 2020 13:38:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D582AC44;
 Thu,  7 May 2020 13:38:31 +0000 (UTC)
Subject: Re: [PATCH 11/16] x86/spec-ctrl: Adjust DO_OVERWRITE_RSB to be shadow
 stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-12-andrew.cooper3@citrix.com>
 <3c01d6c3-5a61-018b-13df-6e75256f6d6c@suse.com>
 <bdf2d248-aabb-8913-1d79-355623b47dfb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdaafe00-9b2d-b638-e921-1f910fc64310@suse.com>
Date: Thu, 7 May 2020 15:38:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bdf2d248-aabb-8913-1d79-355623b47dfb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 15:25, Andrew Cooper wrote:
> On 07/05/2020 14:22, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> @@ -114,6 +114,16 @@
>>>      sub $1, %ecx
>>>      jnz .L\@_fill_rsb_loop
>>>      mov %\tmp, %rsp                 /* Restore old %rsp */
>>> +
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +    mov $1, %ecx
>>> +    rdsspd %ecx
>>> +    cmp $1, %ecx
>>> +    je .L\@_shstk_done
>>> +    mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
>>> +    incsspd %ecx                    /* Restore old SSP */
>>> +.L\@_shstk_done:
>>> +#endif
>> The latest here I wonder why you don't use alternatives patching.
>> I thought that's what you've introduced the synthetic feature
>> flag for.
> 
> We're already in the middle of an alternative and they don't nest.  More
> importantly, this path gets used on the BSP, after patching and before
> CET gets enabled.

Oh, I should have noticed this. The first point could be dealt with,
but I agree the second pretty much rules out patching.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

