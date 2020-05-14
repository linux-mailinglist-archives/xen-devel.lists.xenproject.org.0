Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD71D33C5
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:58:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFJi-0003Md-Fn; Thu, 14 May 2020 14:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZFJh-0003MX-0m
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:58:33 +0000
X-Inumbo-ID: 604e5f0e-95f3-11ea-a49f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 604e5f0e-95f3-11ea-a49f-12813bfff9fa;
 Thu, 14 May 2020 14:58:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0B11ACA1;
 Thu, 14 May 2020 14:58:32 +0000 (UTC)
Subject: Re: [PATCH v8 12/12] xen: remove XEN_SYSCTL_set_parameter support
To: Jan Beulich <jbeulich@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-13-jgross@suse.com>
 <2c962dd4-5af6-e09e-d712-18f8a92b4a92@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <92b11704-7e60-e38a-4232-f4ab6e0258e0@suse.com>
Date: Thu, 14 May 2020 16:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2c962dd4-5af6-e09e-d712-18f8a92b4a92@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.20 15:03, Jan Beulich wrote:
> On 08.05.2020 17:34, Juergen Gross wrote:
> 
> Besides the changes made, wouldn't it be worthwhile to change
> HYPFS Kconfig help wording from "result in some features not
> being available" to something mentioning runtime parameter
> setting in particular, and perhaps also from "might" to "will"?

Yes, good idea.

> 
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -71,27 +71,6 @@ static bool __read_mostly opt_ept_pml = true;
>>   static s8 __read_mostly opt_ept_ad = -1;
>>   int8_t __read_mostly opt_ept_exec_sp = -1;
>>   
>> -#ifdef CONFIG_HYPFS
>> -static char opt_ept_setting[10];
>> -
>> -static void update_ept_param(void)
>> -{
>> -    if ( opt_ept_exec_sp >= 0 )
>> -        snprintf(opt_ept_setting, sizeof(opt_ept_setting), "exec-sp=%d",
>> -                 opt_ept_exec_sp);
>> -}
>> -
>> -static void __init init_ept_param(struct param_hypfs *par)
>> -{
>> -    update_ept_param();
>> -    custom_runtime_set_var(par, opt_ept_setting);
>> -}
>> -#else
>> -static void update_ept_param(void)
>> -{
>> -}
>> -#endif
>> -
>>   static int __init parse_ept_param(const char *s)
>>   {
>>       const char *ss;
>> @@ -118,6 +97,22 @@ static int __init parse_ept_param(const char *s)
>>   }
>>   custom_param("ept", parse_ept_param);
>>   
>> +#ifdef CONFIG_HYPFS
>> +static char opt_ept_setting[10];
>> +
>> +static void update_ept_param(void)
>> +{
>> +    if ( opt_ept_exec_sp >= 0 )
>> +        snprintf(opt_ept_setting, sizeof(opt_ept_setting), "exec-sp=%d",
>> +                 opt_ept_exec_sp);
>> +}
>> +
>> +static void __init init_ept_param(struct param_hypfs *par)
>> +{
>> +    update_ept_param();
>> +    custom_runtime_set_var(par, opt_ept_setting);
>> +}
> 
> If I'm not mistaken this is pure code movement, and solely to be
> able to have ...
> 
>> +
>>   static int parse_ept_param_runtime(const char *s);
>>   custom_runtime_only_param("ept", parse_ept_param_runtime, init_ept_param);
>>   
>> @@ -172,6 +167,7 @@ static int parse_ept_param_runtime(const char *s)
>>   
>>       return 0;
>>   }
>> +#endif
> 
> ... a single #ifdef region now including a few more lines. No
> strict need to change it, but couldn't the earlier patch have
> inserted the code in its final place right away?

I can do that.

> 
>> @@ -1106,7 +1090,7 @@ struct xen_sysctl {
>>   #define XEN_SYSCTL_get_cpu_levelling_caps        25
>>   #define XEN_SYSCTL_get_cpu_featureset            26
>>   #define XEN_SYSCTL_livepatch_op                  27
>> -#define XEN_SYSCTL_set_parameter                 28
>> +/* #define XEN_SYSCTL_set_parameter                 28 */
> 
> Nit: There are now 3 too many padding spaces. Granted that's
> how it was done for XEN_SYSCTL_tmem_op ...

You said: like it was done with tmem. ;-)

> 
> In any event, as before,
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,


Juergen


