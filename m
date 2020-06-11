Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A51F649B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 11:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjJNM-00043M-IQ; Thu, 11 Jun 2020 09:19:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmH/=7Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjJNL-00043H-6j
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 09:19:55 +0000
X-Inumbo-ID: b58da844-abc4-11ea-b4ee-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b58da844-abc4-11ea-b4ee-12813bfff9fa;
 Thu, 11 Jun 2020 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nJz1VcdGLh2g8j0Q+bDNeZ+f0arqBtAntt7a08ETv5k=; b=khQRHkvVbYXhhov6mkWuvCPHdN
 vxNiU1spb+QfFesVFguQLoB0IXwsS0KAANP86/xXGDAtrMhf7Dtvw7L5ouj3pMlh641j6qOl/RY19
 LJnwmdv6i8y+/NT92gDF04mUH/WzGvvCJUXgaPkaPUI47ysrpUr/ZbKrihVLAwouUQvM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjJNH-0008Rb-8Z; Thu, 11 Jun 2020 09:19:51 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjJNH-0002j4-1P; Thu, 11 Jun 2020 09:19:51 +0000
Subject: Re: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
To: Julien Grall <julien.grall.oss@gmail.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, Paul Durrant <paul@xen.org>
References: <20200609154546.4531-1-jgross@suse.com>
 <4a3c4e5e-1fbd-5017-1e3e-64052ae2410a@xen.org>
 <fa5aaa8c-f695-cd87-a837-7d41e4f64a82@suse.com>
 <CAJ=z9a1QHY_4Ktg8jTfWeBwfrX6nsjoHhz4VT_ap-hiMvftoFg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1da8a9bd-b77a-86c0-5b6a-638ea94b2cbc@xen.org>
Date: Thu, 11 Jun 2020 10:19:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a1QHY_4Ktg8jTfWeBwfrX6nsjoHhz4VT_ap-hiMvftoFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 10/06/2020 22:47, Julien Grall wrote:
> On Wed, 10 Jun 2020 at 19:49, Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 10.06.20 19:55, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 09/06/2020 16:45, Juergen Gross wrote:
>>>> Writing the runtime parameters loglvl or guest_loglvl omits setting the
>>>> new length of the resulting parameter value.
>>>>
>>>> Reported-by: George Dunlap <george.dunlap@citrix.com>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>
>>> Although one unrelated comment below.
>>>
>>>> ---
>>>>    xen/drivers/char/console.c | 19 +++++++++++++++----
>>>>    1 file changed, 15 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>>>> index 56e24821b2..861ad53a8f 100644
>>>> --- a/xen/drivers/char/console.c
>>>> +++ b/xen/drivers/char/console.c
>>>> @@ -241,14 +241,25 @@ static int _parse_loglvl(const char *s, int
>>>> *lower, int *upper, char *val)
>>>>    static int parse_loglvl(const char *s)
>>>>    {
>>>> -    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
>>>> -                         xenlog_val);
>>>> +    int ret;
>>>> +
>>>> +    ret = _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
>>>> +                        xenlog_val);
>>>> +    custom_runtime_set_var(param_2_parfs(parse_loglvl), xenlog_val);
>>>
>>> Mixing function and variable name is pretty confusing. It took me
>>> sometimes to go through the macro maze to figure out what's happening.
>>>
>>> It might be worth thinking to document more the custom_runtime_* interface.
>>
>> I have already some streamlining ideas for 4.15.
> 
> Cool! I will commit it tomorrow morning.

Actually I am missing a Released-acked-by from Paul on this patch.

Cheers,

-- 
Julien Grall

