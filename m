Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB219D9D4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:12:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNzb-0001AV-He; Fri, 03 Apr 2020 15:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jKNza-0001AP-FW
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:12:22 +0000
X-Inumbo-ID: 84222cae-75bd-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84222cae-75bd-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 15:12:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7934DACC2;
 Fri,  3 Apr 2020 15:12:20 +0000 (UTC)
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
 <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b9ddd1fb-d868-bb69-3b6b-27531beda2fa@suse.com>
Date: Fri, 3 Apr 2020 17:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.20 16:31, Jan Beulich wrote:
> On 02.04.2020 17:46, Juergen Gross wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -353,6 +353,16 @@ config DOM0_MEM
>>   
>>   	  Leave empty if you are not sure what to specify.
>>   
>> +config HYPFS_CONFIG
>> +	bool "Provide hypervisor .config via hypfs entry"
>> +	default y
> 
> My initial reaction was to ask for "depends on HYPFS", but then
> I noticed the earlier patch doesn't introduce such. Am I
> mis-remembering that it was agreed to make the whole thing
> possible to disable at least in EXPERT mode?

No, I don't remember that agreement.

And TBH I'm not sure this is a good idea, as that would at once make the
plan to replace at least some sysctl and/or domctl interfaces impossible
(like e.g. the last 3 patches of the series are doing already), or at
least would tie the related functionality to CONFIG_HYPFS.

> 
>> --- a/xen/common/kernel.c
>> +++ b/xen/common/kernel.c
>> @@ -389,6 +389,16 @@ static HYPFS_STRING_INIT(compile_date, "compile_date");
>>   static HYPFS_STRING_INIT(compile_domain, "compile_domain");
>>   static HYPFS_STRING_INIT(extra, "extra");
>>   
>> +#ifdef CONFIG_HYPFS_CONFIG
>> +static struct hypfs_entry_leaf config = {
>> +    .e.type = XEN_HYPFS_TYPE_STRING,
>> +    .e.encoding = XEN_HYPFS_ENC_GZIP,
>> +    .e.name = "config",
>> +    .e.read = hypfs_read_leaf,
>> +    .content = &xen_config_data
>> +};
>> +#endif
> 
> Would be really good if no open-coded instantiations like this
> one would ever have to appear, i.e. if suitable macros were
> available. What's preventing use of one of the available ones
> here?

Right now it is the only case for a non plain encoding. The alternative
would have been to either specify the encoding explicitly at all other
node definitions, or to have a macro for this single instance.


Juergen

