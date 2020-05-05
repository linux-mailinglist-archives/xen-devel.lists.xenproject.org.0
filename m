Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB01C5AED
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 17:21:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVzNB-0001Rs-Fl; Tue, 05 May 2020 15:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVzNA-0001Rn-Jh
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 15:20:40 +0000
X-Inumbo-ID: fa484050-8ee3-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa484050-8ee3-11ea-b07b-bc764e2007e4;
 Tue, 05 May 2020 15:20:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D74FAE67;
 Tue,  5 May 2020 15:20:41 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Fix Clang build with !CONFIG_PV32
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200505142810.14827-1-andrew.cooper3@citrix.com>
 <3434eaa5-d8ce-fa8f-17a8-19e9739121d8@suse.com>
 <a423db54-601b-b445-5f66-507301c78102@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51841820-8dbf-ff41-5348-355a9379d74e@suse.com>
Date: Tue, 5 May 2020 17:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a423db54-601b-b445-5f66-507301c78102@citrix.com>
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

On 05.05.2020 17:05, Andrew Cooper wrote:
> On 05/05/2020 15:52, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 05.05.2020 16:28, Andrew Cooper wrote:
>>> @@ -753,8 +751,9 @@ void load_system_tables(void)
>>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>>>  	if ( IS_ENABLED(CONFIG_PV32) )
>>> -		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>>> -				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>>> +		_set_tssldt_desc(
>>> +			this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
>>> +			(unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
>> Isn't indentation here off by 4 compared to what we
>> normally do with extremely large argument expressions?
> 
> No.  This is Linux style (therefore 8-space tabs), not Xen style (4 spaces).

Oh, right - din't pay attention at all to this being tabs, sorry.

Jan

