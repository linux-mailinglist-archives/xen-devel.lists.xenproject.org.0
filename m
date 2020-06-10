Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE71F5B7A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 20:49:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj5ma-0004Ot-5z; Wed, 10 Jun 2020 18:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wuKn=7X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jj5mY-0004Oo-G6
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 18:49:02 +0000
X-Inumbo-ID: 0c779c02-ab4b-11ea-b494-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c779c02-ab4b-11ea-b494-12813bfff9fa;
 Wed, 10 Jun 2020 18:49:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ACF2DAC24;
 Wed, 10 Jun 2020 18:49:03 +0000 (UTC)
Subject: Re: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200609154546.4531-1-jgross@suse.com>
 <4a3c4e5e-1fbd-5017-1e3e-64052ae2410a@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fa5aaa8c-f695-cd87-a837-7d41e4f64a82@suse.com>
Date: Wed, 10 Jun 2020 20:48:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4a3c4e5e-1fbd-5017-1e3e-64052ae2410a@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.06.20 19:55, Julien Grall wrote:
> Hi Juergen,
> 
> On 09/06/2020 16:45, Juergen Gross wrote:
>> Writing the runtime parameters loglvl or guest_loglvl omits setting the
>> new length of the resulting parameter value.
>>
>> Reported-by: George Dunlap <george.dunlap@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Although one unrelated comment below.
> 
>> ---
>>   xen/drivers/char/console.c | 19 +++++++++++++++----
>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>> index 56e24821b2..861ad53a8f 100644
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -241,14 +241,25 @@ static int _parse_loglvl(const char *s, int 
>> *lower, int *upper, char *val)
>>   static int parse_loglvl(const char *s)
>>   {
>> -    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
>> -                         xenlog_val);
>> +    int ret;
>> +
>> +    ret = _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
>> +                        xenlog_val);
>> +    custom_runtime_set_var(param_2_parfs(parse_loglvl), xenlog_val);
> 
> Mixing function and variable name is pretty confusing. It took me 
> sometimes to go through the macro maze to figure out what's happening.
> 
> It might be worth thinking to document more the custom_runtime_* interface.

I have already some streamlining ideas for 4.15.


Juergen


