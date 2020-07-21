Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2C227D89
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpoG-0006Fo-OJ; Tue, 21 Jul 2020 10:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxpoE-0006FU-VR
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:47:42 +0000
X-Inumbo-ID: 9a28d8c2-cb3f-11ea-84fe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a28d8c2-cb3f-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:47:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A532AB3D;
 Tue, 21 Jul 2020 10:47:48 +0000 (UTC)
Subject: Re: [PATCH] x86emul: support AVX512_VP2INTERSECT insns
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <08083899-7348-63d2-1f28-0932e2295d64@suse.com>
 <120bdf92-15b6-3616-5cdb-75b9c38155d4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98c74f0a-86d0-41d2-2aa3-f6b2c3e5ed68@suse.com>
Date: Tue, 21 Jul 2020 12:47:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <120bdf92-15b6-3616-5cdb-75b9c38155d4@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.07.2020 12:32, Andrew Cooper wrote:
> On 21/07/2020 11:23, Jan Beulich wrote:
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -160,7 +160,7 @@ static const char *const str_7d0[32] =
>>      [ 2] = "avx512_4vnniw", [ 3] = "avx512_4fmaps",
>>      [ 4] = "fsrm",
>>  
>> -    /*  8 */                [ 9] = "srbds-ctrl",
>> +    [ 8] = "avx512_vp2intersect", [ 9] = "srbds-ctrl",
>>      [10] = "md-clear",
>>      /* 12 */                [13] = "tsx-force-abort",
>>      [14] = "serialize",
> 
> Are we using underscores or dashes?  I realise its is already
> inconsistent, but this is a debugging tool only, and we can change our
> minds.

I've switched this one to use a dash. Want me to also switch others
(in a separate patch)?

Jan

