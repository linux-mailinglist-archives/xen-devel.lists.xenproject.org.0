Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC548220514
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 08:36:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvb1Z-0002X4-6Z; Wed, 15 Jul 2020 06:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvb1Y-0002Wz-CC
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 06:36:12 +0000
X-Inumbo-ID: 78739084-c665-11ea-9393-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78739084-c665-11ea-9393-12813bfff9fa;
 Wed, 15 Jul 2020 06:36:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03659ADC0;
 Wed, 15 Jul 2020 06:36:13 +0000 (UTC)
Subject: Re: [PATCH v2 5/7] x86: generalize padding field handling
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <83274416-2812-53c9-f8cb-23ebdf73782e@suse.com>
 <20200714142948.GK7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a319e308-9cf3-52dc-1883-fe749e3c5629@suse.com>
Date: Wed, 15 Jul 2020 08:36:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714142948.GK7191@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.07.2020 16:29, Roger Pau Monné wrote:
> On Wed, Jul 01, 2020 at 12:27:37PM +0200, Jan Beulich wrote:
>> The original intention was to ignore padding fields, but the pattern
>> matched only ones whose names started with an underscore. Also match
>> fields whose names are in line with the C spec by not having a leading
>> underscore. (Note that the leading ^ in the sed regexps was pointless
>> and hence get dropped.)
>>
>> This requires adjusting some vNUMA macros, to avoid triggering
>> "enumeration value ... not handled in switch" warnings, which - due to
>> -Werror - would cause the build to fail. (I have to admit that I find
>> these padding fields odd, when translation of the containing structure
>> is needed anyway.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> While for translation macros skipping padding fields pretty surely is a
>> reasonable thing to do, we may want to consider not ignoring them when
>> generating checking macros.

(note this remark, towards your question at the end)

>> --- a/xen/common/compat/memory.c
>> +++ b/xen/common/compat/memory.c
>> @@ -354,10 +354,13 @@ int compat_memory_op(unsigned int cmd, X
>>                  return -EFAULT;
>>  
>>  #define XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_)		\
>> +            case XLAT_vnuma_topology_info_vdistance_pad:                \
>>              guest_from_compat_handle((_d_)->vdistance.h, (_s_)->vdistance.h)
>>  #define XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_)		\
>> +            case XLAT_vnuma_topology_info_vcpu_to_vnode_pad:            \
>>              guest_from_compat_handle((_d_)->vcpu_to_vnode.h, (_s_)->vcpu_to_vnode.h)
>>  #define XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_)		\
>> +            case XLAT_vnuma_topology_info_vmemrange_pad:                \
>>              guest_from_compat_handle((_d_)->vmemrange.h, (_s_)->vmemrange.h)
> 
> I find this quite ugly, would it be better to just handle them with a
> default case in the XLAT_ macros?

Default cases explicitly do not get added to be able to spot missing
case labels, as most compilers will warn about such when the controlling
expression is of enum type.

> AFAICT it will also set (_d_)->vmemrange.h twice?

I'm not seeing it (and if it was, I'd then also wonder why not for the
other two handles above). This is the generated macro:

#define XLAT_vnuma_topology_info(_d_, _s_) do { \
    (_d_)->domid = (_s_)->domid; \
    (_d_)->nr_vnodes = (_s_)->nr_vnodes; \
    (_d_)->nr_vcpus = (_s_)->nr_vcpus; \
    (_d_)->nr_vmemranges = (_s_)->nr_vmemranges; \
    switch (vdistance) { \
    case XLAT_vnuma_topology_info_vdistance_h: \
        XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_); \
        break; \
    } \
    switch (vcpu_to_vnode) { \
    case XLAT_vnuma_topology_info_vcpu_to_vnode_h: \
        XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_); \
        break; \
    } \
    switch (vmemrange) { \
    case XLAT_vnuma_topology_info_vmemrange_h: \
        XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_); \
        break; \
    } \
} while (0)

Am I overlooking any further aspect?

>> --- a/xen/tools/get-fields.sh
>> +++ b/xen/tools/get-fields.sh
>> @@ -218,7 +218,7 @@ for line in sys.stdin.readlines():
>>  				fi
>>  				;;
>>  			[\,\;])
>> -				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
>> +				if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>>  				then
>>  					if [ $kind = union ]
>>  					then
>> @@ -347,7 +347,7 @@ build_body ()
>>  			fi
>>  			;;
>>  		[\,\;])
>> -			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
>> +			if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>>  			then
>>  				if [ -z "$array" -a -z "$array_type" ]
>>  				then
>> @@ -437,7 +437,7 @@ check_field ()
>>  				id=$token
>>  				;;
>>  			[\,\;])
>> -				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
>> +				if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>>  				then
>>  					check_field $1 $2 $3.$id "$fields"
>>  					test "$token" != ";" || fields= id=
>> @@ -491,7 +491,7 @@ build_check ()
>>  			test $level != 2 -o $arrlvl != 1 || id=$token
>>  			;;
>>  		[\,\;])
>> -			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
>> +			if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
>>  			then
>>  				check_field $kind $1 $id "$fields"
>>  				test "$token" != ";" || fields= id=
> 
> I have to admit I'm not overly happy with this level of repetition
> (not that you introduce it here), but I would prefer to have the
> regexp in a single place if possible, it's easy to miss instances
> IMO.

I too thought so while making the changes, but besides viewing this
as an orthogonal adjustment I'm also, as per the remark further up,
unconvinced the expressions actually want to be the same between
the checking macros and the xlat ones.

Jan

