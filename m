Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF226631E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:11:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGldZ-0002pc-Cc; Fri, 11 Sep 2020 16:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGldY-0002pS-Az
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:10:56 +0000
X-Inumbo-ID: 5f96b67f-fd6f-4bba-a6fc-6d3b7070a8f8
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f96b67f-fd6f-4bba-a6fc-6d3b7070a8f8;
 Fri, 11 Sep 2020 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599840654;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CdRY++02o6f9sir37o6sdzW9hAKrMPy/uPMwtsJeNXs=;
 b=dtlZDfkaltBfBl7GL3WvEoXrz+er9o5bYjd2fK1u5EaA71JFNy5YZb1M
 H5wU/A+hko5ntbbbmr2l+Me/TqC+0F50pce5FEFNz+zCPwtiBwG4yaGmO
 9XbQMA+8pzGEx/Meru/GJ5MV4ipNkzgpSMIuI4g/DAyCcHK3qbZLZwSoC k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DmML0On69jcGHsnS52P3khALx7bif557HRT2rcfqmbB9ddvKyIvG7vobb/FkK23ToR4agOOPPK
 1wi3WZywy2DQqrGVSeui1fKiYaIY/cqsksASAO9n9NL0mz7UKIZbRIXqmJsoVrgf9rtdUawAzT
 8UhdRvqOEsgDVS1Fuf6/WIJccd8+lGYqoq/owdzgpuTn+HoyXXNZbimCrdbSifQLgjwaPz8S4r
 WcCQ0GMbP1RglePjT2WtQ9uIk4LfrRf/2yiCiBQhBr3w40n2rrXz2J+HqANCIi7fehfgCeForr
 SJY=
X-SBRS: 2.7
X-MesageID: 26808911
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,416,1592884800"; d="scan'208";a="26808911"
Subject: Re: [PATCH 5/5] x86/pv: Simplify emulation for the 64bit base MSRs
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-6-andrew.cooper3@citrix.com>
 <50039b2e-bd62-5948-10b4-4cbaeac7b555@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e395bd45-5ab7-c2c3-4ea9-516a782eb3d9@citrix.com>
Date: Fri, 11 Sep 2020 17:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <50039b2e-bd62-5948-10b4-4cbaeac7b555@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/09/2020 11:01, Jan Beulich wrote:
> On 09.09.2020 11:59, Andrew Cooper wrote:
>> is_pv_32bit_domain() is an expensive predicate, but isn't used for speculative
>> safety in this case.  Swap to checking the Long Mode bit in the CPUID policy,
>> which is the architecturally correct behaviour.
>>
>> is_canonical_address() isn't a trivial predicate, but it will become more
>> complicated when 5-level support is added.  Rearrange write_msr() to collapse
>> the common checks.
> Did you mean "is" instead of "isn't" or "and" instead of "but"? The
> way it is it doesn't look very logical to me.

I guess the meaning got lost somewhere.

is_canonical_address() is currently not completely trivial, but also not
massively complicated either.

It will become much more complicated with LA57.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one more remark:
>
>> @@ -991,22 +993,22 @@ static int write_msr(unsigned int reg, uint64_t val,
>>          uint64_t temp;
>>  
>>      case MSR_FS_BASE:
>> -        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
>> -            break;
>> -        write_fs_base(val);
>> -        return X86EMUL_OKAY;
>> -
>>      case MSR_GS_BASE:
>> -        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
>> -            break;
>> -        write_gs_base(val);
>> -        return X86EMUL_OKAY;
>> -
>>      case MSR_SHADOW_GS_BASE:
>> -        if ( is_pv_32bit_domain(currd) || !is_canonical_address(val) )
>> +        if ( !cp->extd.lm || !is_canonical_address(val) )
>>              break;
>> -        write_gs_shadow(val);
>> -        curr->arch.pv.gs_base_user = val;
>> +
>> +        if ( reg == MSR_FS_BASE )
>> +            write_fs_base(val);
>> +        else if ( reg == MSR_GS_BASE )
>> +            write_gs_base(val);
>> +        else if ( reg == MSR_SHADOW_GS_BASE )
> With the three case labels just above, I think this "else if" and ...
>
>> +        {
>> +            write_gs_shadow(val);
>> +            curr->arch.pv.gs_base_user = val;
>> +        }
>> +        else
>> +            ASSERT_UNREACHABLE();
> ... this assertion are at least close to being superfluous. Their
> dropping would then also make me less inclined to ask for an
> inner switch().

I'm not overly fussed, as this example is fairly trivial, but I was
attempting to go for something which ends up safe even in the case of a
bad edit to the outer switch statement.

I'd expect the compiler to be drop the both aspects you talk about.

~Andrew

