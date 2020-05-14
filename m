Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E51D33ED
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:02:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFNL-0004HR-7d; Thu, 14 May 2020 15:02:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZFNK-0004HM-7b
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:02:18 +0000
X-Inumbo-ID: e6cfaf38-95f3-11ea-a4a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6cfaf38-95f3-11ea-a4a3-12813bfff9fa;
 Thu, 14 May 2020 15:02:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AE37EAC7B;
 Thu, 14 May 2020 15:02:18 +0000 (UTC)
Subject: Re: [PATCH v8 09/12] xen: add runtime parameter access support to
 hypfs
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-10-jgross@suse.com>
 <a6c10680-d570-dabb-61ad-627591d08b0e@suse.com>
 <76ed2db5-6091-959a-8224-0a77e9cc4c45@suse.com>
 <76cf4476-f8b8-dc44-9e68-bfa92a3fcd2a@suse.com>
 <33daeea9-a038-b153-44b5-d9a8a11ae21f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95a5644c-e208-57bc-2f47-13581a16b568@suse.com>
Date: Thu, 14 May 2020 17:02:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <33daeea9-a038-b153-44b5-d9a8a11ae21f@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 16:56, Jürgen Groß wrote:
> On 14.05.20 14:10, Jan Beulich wrote:
>> On 14.05.2020 13:48, Jürgen Groß wrote:
>>> On 14.05.20 12:20, Jan Beulich wrote:
>>>> On 08.05.2020 17:34, Juergen Gross wrote:
>>>>> --- a/xen/common/grant_table.c
>>>>> +++ b/xen/common/grant_table.c
>>>>> @@ -85,8 +85,43 @@ struct grant_table {
>>>>>        struct grant_table_arch arch;
>>>>>    };
>>>>>    -static int parse_gnttab_limit(const char *param, const char *arg,
>>>>> -                              unsigned int *valp)
>>>>> +unsigned int __read_mostly opt_max_grant_frames = 64;
>>>>> +static unsigned int __read_mostly opt_max_maptrack_frames = 1024;
>>>>> +
>>>>> +#ifdef CONFIG_HYPFS
>>>>> +#define GRANT_CUSTOM_VAL_SZ  12
>>>>> +static char __read_mostly opt_max_grant_frames_val[GRANT_CUSTOM_VAL_SZ];
>>>>> +static char __read_mostly opt_max_maptrack_frames_val[GRANT_CUSTOM_VAL_SZ];
>>>>> +
>>>>> +static void update_gnttab_par(struct param_hypfs *par, unsigned int val,
>>>>> +                              char *parval)
>>>>> +{
>>>>> +    snprintf(parval, GRANT_CUSTOM_VAL_SZ, "%u", val);
>>>>> +    custom_runtime_set_var_sz(par, parval, GRANT_CUSTOM_VAL_SZ);
>>>>> +}
>>>>> +
>>>>> +static void __init gnttab_max_frames_init(struct param_hypfs *par)
>>>>> +{
>>>>> +    update_gnttab_par(par, opt_max_grant_frames, opt_max_grant_frames_val);
>>>>> +}
>>>>> +
>>>>> +static void __init max_maptrack_frames_init(struct param_hypfs *par)
>>>>> +{
>>>>> +    update_gnttab_par(par, opt_max_maptrack_frames,
>>>>> +                      opt_max_maptrack_frames_val);
>>>>> +}
>>>>> +#else
>>>>> +#define opt_max_grant_frames_val    NULL
>>>>> +#define opt_max_maptrack_frames_val NULL
>>>>
>>>> This looks latently dangerous to me (in case new uses of these
>>>> two identifiers appeared), but I guess my alternative suggestion
>>>> will be at best controversial, too:
>>>>
>>>> #define update_gnttab_par(par, val, unused) update_gnttab_par(par, val)
>>>> #define parse_gnttab_limit(par, arg, valp, unused) parse_gnttab_limit(par, arg, valp)
>>>>
>>>> (placed right here)
>>>
>>> Who else would use those identifiers not related to hypfs?
>>
>> I can't see an obvious possible use, but people get creative, i.e.
>> you never know. Passing NULL into a function without it being
>> blindingly obvious that it won't ever get (de)referenced is an at
>> least theoretical risk imo.
> 
> Hmm, what about using a special type for those content variables?
> Something like:
> 
> #ifdef CONFIG_HYPFS
> #define hypfs_string_var            char *
> #else
> #define hypfs_string_var            char
> #define opt_max_grant_frames_val    0
> #define opt_max_maptrack_frames_val 0
> #endif
> 
> And then use that as type for function parameters? This should make
> dereferencing pretty hard.
> 
> Other than that I have no really good idea how to avoid this problem.

IOW (as suspected) you don't like my suggestion? Personally I think
yours, having more #define-s, is at least not better than mine.

Jan

