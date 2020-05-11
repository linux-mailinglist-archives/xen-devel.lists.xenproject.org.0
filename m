Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E31CDF55
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:46:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYAdA-0000Lo-CX; Mon, 11 May 2020 15:46:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYAd9-0000Lj-6D
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:46:11 +0000
X-Inumbo-ID: 887e9202-939e-11ea-a225-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 887e9202-939e-11ea-a225-12813bfff9fa;
 Mon, 11 May 2020 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589211970;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ay3lVMQuKXg3xeonyfw3lTv7xk1dkOWJ+SpboOyyZys=;
 b=RSv+e1WHjetkAh/tHcuW7KXM58WHLk14OIbXu91RCReZ5h8AboTDJDNm
 l/+1jJjo/Gw+bIEMzeRuP/Tk31/bDRBaRS3X0hJGQQcJd3ajOqok96xDW
 qBXAp2nynElzufZQS4v0R204h8WtGpEKJnDFFNwfNuQ6G8bVi9KSbFnQZ 8=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: BIEdjZobJADB4Mioh+CCRcH4RWWhTKmZGTIxFlb5rqto/car2qxTTdep9LV3VYbDIDuEnm3DgO
 NTjmx4RJnW8asjg+N6Mf9xfMXUgByQ49E84QhHebI2CshQ3zK/abqfDq3yZk1600ggXnJBHtrm
 D8MGSAv9HmCWnXu/39UKpe7CWggqqRuGBUvVfwoxWscdQqd/bA9dEv126324zNcs4o4g0glsKW
 auEnKIRO1eWMJkWu7keEVmRmknD1Q1Fr3njQIf3nZdNyHDtGeA3pVYSPreUlzlD8EC98xKfpzw
 Ll0=
X-SBRS: 2.7
X-MesageID: 17495273
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17495273"
Subject: Re: [PATCH 05/16] x86/shstk: Introduce Supervisor Shadow Stack support
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-6-andrew.cooper3@citrix.com>
 <d0347fec-3ccb-daa7-5c4d-f0e74b5fb247@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00302d53-499a-7f6e-76a5-a5eec4e11252@citrix.com>
Date: Mon, 11 May 2020 16:46:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d0347fec-3ccb-daa7-5c4d-f0e74b5fb247@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/05/2020 14:52, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -34,6 +34,9 @@ config ARCH_DEFCONFIG
>>  config INDIRECT_THUNK
>>  	def_bool $(cc-option,-mindirect-branch-register)
>>  
>> +config HAS_AS_CET
>> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
> I see you add as-instr here as a side effect. Until the other
> similar checks get converted, I think for the time being we should
> use the old model, to have all such checks in one place. I realize
> this means you can't have a Kconfig dependency then.

No.  That's like asking me to keep on using bool_t, and you are the
first person to point out and object to that in newly submitted patches.

> Also why do you check multiple insns, when just one (like we do
> elsewhere) would suffice?

Because CET-SS and CET-IBT are orthogonal ABIs, but you wanted a single
CET symbol, rather than a CET_SS symbol.

I picked a sample of various instructions to get broad coverage of CET
without including every instruction.

> The crucial insns to check are those which got changed pretty
> close before the release of 2.29 (in the cover letter you
> mention 2.32): One of incssp{d,q}, setssbsy, or saveprevssp.
> There weren't official binutils releases with the original
> insns, but distros may still have picked up intermediate
> snapshots.

I've got zero interest in catering to distros which are still using
obsolete pre-release toolchains.  Bleeding edge toolchains are one
thing, but this is like asking us to support the middle changeset of the
series introducing CET, which is absolutely a non-starter.

If the instructions were missing from real binutils releases, then
obviously we should exclude those releases, but that doesn't appear to
be the case.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -95,6 +95,36 @@ unsigned long __initdata highmem_start;
>>  size_param("highmem-start", highmem_start);
>>  #endif
>>  
>> +static bool __initdata opt_xen_shstk = true;
>> +
>> +static int parse_xen(const char *s)
>> +{
>> +    const char *ss;
>> +    int val, rc = 0;
>> +
>> +    do {
>> +        ss = strchr(s, ',');
>> +        if ( !ss )
>> +            ss = strchr(s, '\0');
>> +
>> +        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
>> +        {
>> +#ifdef CONFIG_XEN_SHSTK
>> +            opt_xen_shstk = val;
>> +#else
>> +            no_config_param("XEN_SHSTK", "xen", s, ss);
>> +#endif
>> +        }
>> +        else
>> +            rc = -EINVAL;
>> +
>> +        s = ss + 1;
>> +    } while ( *ss );
>> +
>> +    return rc;
>> +}
>> +custom_param("xen", parse_xen);
> What's the idea here going forward, i.e. why the new top level
> "xen" option? Almost all options are for Xen itself, after all.
> Did you perhaps mean this to be "cet"?

I forgot an RFC for this, as I couldn't think of anything better.  "cet"
as a top level option isn't going to gain more than {no-}shstk and
{no-}ibt as suboptions.

>> --- a/xen/scripts/Kconfig.include
>> +++ b/xen/scripts/Kconfig.include
>> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>>  # Return y if the linker supports <flag>, n otherwise
>>  ld-option = $(success,$(LD) -v $(1))
>>  
>> +# $(as-instr,<instr>)
>> +# Return y if the assembler supports <instr>, n otherwise
>> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> CLANG_FLAGS caught my eye here, then noticing that cc-option
> also uses it. Anthony - what's the deal with this? It doesn't
> look to get defined anywhere, and I also don't see what clang-
> specific about these constructs.

This is as it inherits from Linux.  There is obviously a reason.

However, I'm not interested in diving into that rabbit hole in an
unrelated series.

~Andrew

