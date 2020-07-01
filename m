Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57E21106D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 18:18:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqfQk-0001e2-Pb; Wed, 01 Jul 2020 16:17:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqfQk-0001dx-5i
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 16:17:50 +0000
X-Inumbo-ID: 67654db4-bbb6-11ea-8738-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67654db4-bbb6-11ea-8738-12813bfff9fa;
 Wed, 01 Jul 2020 16:17:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD669ACC3;
 Wed,  1 Jul 2020 16:17:47 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] x86: fix compat header generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <a8139d0e-f332-b877-dea8-3ce8a6869285@suse.com>
 <20200701161057.GV735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76441369-a9aa-3d2d-9a65-c4a5fd20f6f1@suse.com>
Date: Wed, 1 Jul 2020 18:17:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701161057.GV735@Air-de-Roger>
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

On 01.07.2020 18:10, Roger Pau Monné wrote:
> On Wed, Jul 01, 2020 at 12:25:15PM +0200, Jan Beulich wrote:
>> As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
>> struct xen_mem_acquire_resource"), we're not currently handling structs
>> correctly that have uint64_aligned_t fields. #pragma pack(4) suppresses
>> the necessary alignment even if the type did properly survive (which
>> it also didn't) in the process of generating the headers. Overall,
>> with the above mentioned change applied, there's only a latent issue
>> here afaict, i.e. no other of our interface structs is currently
>> affected.
>>
>> As a result it is clear that using #pragma pack(4) is not an option.
>> Drop all uses from compat header generation. Make sure
>> {,u}int64_aligned_t actually survives, such that explicitly aligned
>> fields will remain aligned. Arrange for {,u}int64_t to be transformed
>> into a type that's 64 bits wide and 4-byte aligned, by utilizing that
>> in typedef-s the "aligned" attribute can be used to reduce alignment.
>> Additionally, for the cases where native structures get re-used,
>> enforce suitable alignment via typedef-s (which allow alignment to be
>> reduced).
>>
>> This use of typedef-s makes necessary changes to CHECK_*() macro
>> generation: Previously get-fields.sh relied on finding struct/union
>> keywords when other compound types were used. We now need to use the
>> typedef-s (guaranteeing suitable alignment) now, and hence the script
> 
> Extra now before the comma I think.
> 
>> has to recognize those cases, too. (Unfortunately there are a few
>> special cases to be dealt with, but this is really not much different
>> from e.g. the pre-existing compat_domain_handle_t special case.)
>>
>> This need to use typedef-s is certainly somewhat fragile going forward,
>> as in similar future cases it is imperative to also use typedef-s, or
>> else the CHECK_*() macros won't check what they're supposed to check. I
>> don't currently see any means to avoid this fragility, though.
>>
>> There's one change to generated code according to my observations: In
>> arch_compat_vcpu_op() the runstate area "area" variable would previously
>> have been put in a just 4-byte aligned stack slot (despite being 8 bytes
>> in size), whereas now it gets put in an 8-byte aligned location.
>>
>> There also results some curious inconsistency in struct xen_mc from
>> these changes - I intend to clean this up later on. Otherwise unrelated
>> code would also need adjustment right here.
> 
> Oh, so that's the reason fields in xen_mc are not all switched to use
> their typedef equivalent I guess?

Yes - see patches later in the series, which take care of the anomaly.

>> --- a/xen/tools/get-fields.sh
>> +++ b/xen/tools/get-fields.sh
>> @@ -418,6 +418,21 @@ check_field ()
>>  			"}")
>>  				level=$(expr $level - 1) id=
>>  				;;
>> +			compat_*_t)
>> +				if [ $level = 2 ]
>> +				then
>> +					fields=" "
>> +					token="${token%_t}"
>> +					token="${token#compat_}"
>> +				fi
>> +				;;
>> +			evtchn_*_compat_t)
>> +				if [ $level = 2 -a $token != evtchn_port_compat_t ]
>> +				then
>> +					fields=" "
>> +					token="${token%_compat_t}"
>> +				fi
>> +				;;
> 
> Likely related to the above, but I assume we might want to add a check
> here to assert no struct fields are used?

I think we could, but have you found similar assertions
elsewhere? There being any fields would, aiui, indicate a syntax
violation (or else $level can't be 2), and I'd rather leave
catching these to the compiler.

> I assume this is not added here in order to prevent exploding due to
> the xen_mc issues.

I don't think it would, as it continues handling struct/union
just fine. (We may want to drop this support, to enforce no
use of only typedef-s, but I'm not sure _that_ wouldn't
explode.)

Jan

