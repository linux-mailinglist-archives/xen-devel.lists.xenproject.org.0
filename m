Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B861D33B4
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFHq-0003Bm-VU; Thu, 14 May 2020 14:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZFHp-0003Bd-SJ
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:56:37 +0000
X-Inumbo-ID: 1bbab860-95f3-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bbab860-95f3-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 14:56:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96733AC6E;
 Thu, 14 May 2020 14:56:37 +0000 (UTC)
Subject: Re: [PATCH v8 09/12] xen: add runtime parameter access support to
 hypfs
To: Jan Beulich <jbeulich@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-10-jgross@suse.com>
 <a6c10680-d570-dabb-61ad-627591d08b0e@suse.com>
 <76ed2db5-6091-959a-8224-0a77e9cc4c45@suse.com>
 <76cf4476-f8b8-dc44-9e68-bfa92a3fcd2a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <33daeea9-a038-b153-44b5-d9a8a11ae21f@suse.com>
Date: Thu, 14 May 2020 16:56:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <76cf4476-f8b8-dc44-9e68-bfa92a3fcd2a@suse.com>
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

On 14.05.20 14:10, Jan Beulich wrote:
> On 14.05.2020 13:48, Jürgen Groß wrote:
>> On 14.05.20 12:20, Jan Beulich wrote:
>>> On 08.05.2020 17:34, Juergen Gross wrote:
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -85,8 +85,43 @@ struct grant_table {
>>>>        struct grant_table_arch arch;
>>>>    };
>>>>    -static int parse_gnttab_limit(const char *param, const char *arg,
>>>> -                              unsigned int *valp)
>>>> +unsigned int __read_mostly opt_max_grant_frames = 64;
>>>> +static unsigned int __read_mostly opt_max_maptrack_frames = 1024;
>>>> +
>>>> +#ifdef CONFIG_HYPFS
>>>> +#define GRANT_CUSTOM_VAL_SZ  12
>>>> +static char __read_mostly opt_max_grant_frames_val[GRANT_CUSTOM_VAL_SZ];
>>>> +static char __read_mostly opt_max_maptrack_frames_val[GRANT_CUSTOM_VAL_SZ];
>>>> +
>>>> +static void update_gnttab_par(struct param_hypfs *par, unsigned int val,
>>>> +                              char *parval)
>>>> +{
>>>> +    snprintf(parval, GRANT_CUSTOM_VAL_SZ, "%u", val);
>>>> +    custom_runtime_set_var_sz(par, parval, GRANT_CUSTOM_VAL_SZ);
>>>> +}
>>>> +
>>>> +static void __init gnttab_max_frames_init(struct param_hypfs *par)
>>>> +{
>>>> +    update_gnttab_par(par, opt_max_grant_frames, opt_max_grant_frames_val);
>>>> +}
>>>> +
>>>> +static void __init max_maptrack_frames_init(struct param_hypfs *par)
>>>> +{
>>>> +    update_gnttab_par(par, opt_max_maptrack_frames,
>>>> +                      opt_max_maptrack_frames_val);
>>>> +}
>>>> +#else
>>>> +#define opt_max_grant_frames_val    NULL
>>>> +#define opt_max_maptrack_frames_val NULL
>>>
>>> This looks latently dangerous to me (in case new uses of these
>>> two identifiers appeared), but I guess my alternative suggestion
>>> will be at best controversial, too:
>>>
>>> #define update_gnttab_par(par, val, unused) update_gnttab_par(par, val)
>>> #define parse_gnttab_limit(par, arg, valp, unused) parse_gnttab_limit(par, arg, valp)
>>>
>>> (placed right here)
>>
>> Who else would use those identifiers not related to hypfs?
> 
> I can't see an obvious possible use, but people get creative, i.e.
> you never know. Passing NULL into a function without it being
> blindingly obvious that it won't ever get (de)referenced is an at
> least theoretical risk imo.

Hmm, what about using a special type for those content variables?
Something like:

#ifdef CONFIG_HYPFS
#define hypfs_string_var            char *
#else
#define hypfs_string_var            char
#define opt_max_grant_frames_val    0
#define opt_max_maptrack_frames_val 0
#endif

And then use that as type for function parameters? This should make
dereferencing pretty hard.

Other than that I have no really good idea how to avoid this problem.

> 
>>>> +#define custom_runtime_set_var_sz(parfs, var, sz) \
>>>> +    { \
>>>> +        (parfs)->hypfs.content = var; \
>>>> +        (parfs)->hypfs.e.max_size = sz; \
>>>
>>> var and sz want parentheses around them.
>>
>> Fine with me, but out of curiosity: what can go wrong without? Are
>> you thinking of multi-statement arguments?
> 
> Well, as just said in the reply on the patch 4 thread, you have
> a point about this being the right side of an assignment.
> Nevertheless such uses would look more consistent if parenthesized.
> The only cases where I see it reasonable to omit parentheses are
> - parameters made the operands of # or ##,
> - parameters handed on to further macros / functions unaltered,
> - parameters representing struct/union field names,
> - perhaps other special cases along the lines of the above that
>    I can't seem to be able to think of right now.

Okay.

> 
>>>> +/* initfunc needs to set size and content, e.g. via custom_runtime_set_var(). */
>>>> +#define custom_runtime_only_param(_name, _var, initfunc) \
>>>
>>> I've started noticing it here, but the issue exists further up
>>> (and down) as well - please can you avoid identifiers with
>>> leading underscores that are in violation of the C standard?
>>> Even more so that here you're not even consistent across
>>> macro parameter names.
>>
>> Basically I only extended the macro to take another parameter and I
>> omitted the underscore exactly for the reason you mentioned.
>>
>> In case you like it better I can prepend a patch to the series dropping
>> all the leading single underscores from the macros in param.h.
> 
> That's code churn I don't view as strictly necessary - adjusting
> these can be done when they get touched anyway. But here we have
> a whole new body of code.

Okay.

> 
>>>> +#define param_2_parfs(par)  NULL
>>>
>>> Along the lines of the earlier comment, this looks latently dangerous.
>>
>> In which way? How can the empty struct be dereferenced in a way not
>> resulting in build time errors, other than using a cast which would
>> be obviously wrong for the standard case when CONFIG_HYPFS is defined?
> 
> Have the result of the macro passed to a function taking void *, e.g.
> memcpy().

Any function like this needs either a guaranteed minimum size or a
specific size as parameter. I can't imagine a valid use case leading
to problems, TBH.


Juergen

