Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2F1B0C3F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQW8U-000622-TT; Mon, 20 Apr 2020 13:06:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQW8T-00061w-In
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:06:53 +0000
X-Inumbo-ID: cd850afe-8307-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd850afe-8307-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 13:06:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38272ADEE;
 Mon, 20 Apr 2020 13:06:51 +0000 (UTC)
Subject: Re: [PATCH 07/10] x86/shadow: the guess_wrmap() hook is needed for
 HVM only
To: Tim Deegan <tim@xen.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <1e221192-7899-b60d-0280-b77ab5877772@suse.com>
 <20200418090317.GD92478@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43a8e15c-e739-0cb3-4ad9-23def4e24709@suse.com>
Date: Mon, 20 Apr 2020 15:06:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418090317.GD92478@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.04.2020 11:03, Tim Deegan wrote:
> At 16:28 +0200 on 17 Apr (1587140897), Jan Beulich wrote:
>> sh_remove_write_access() bails early for !external guests, and hence its
>> building and thus the need for the hook can be suppressed altogether in
>> !HVM configs.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
>> @@ -366,6 +367,14 @@ int sh_validate_guest_entry(struct vcpu
>>  extern int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
>>                                    unsigned int level,
>>                                    unsigned long fault_addr);
>> +#else
>> +static inline int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
>> +                                         unsigned int level,
>> +                                         unsigned long fault_addr)
>> +{
> 
> Can we have an ASSERT(!shadow_mode_refcounts(d)) here, please,
> matching the check that would have made it a noop before?

I've added one, but I find this quite odd in a !HVM build, where

#define PG_refcounts   0

and

#define paging_mode_refcounts(_d) (!!((_d)->arch.paging.mode & PG_refcounts))

Perhaps you're wanting this mainly for documentation purposes?

Jan

