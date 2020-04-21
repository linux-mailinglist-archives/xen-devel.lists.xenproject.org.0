Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2B1B23EB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 12:34:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQqDs-0007ki-NM; Tue, 21 Apr 2020 10:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BlT=6F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQqDr-0007kd-9s
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 10:33:47 +0000
X-Inumbo-ID: 944b9352-83bb-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 944b9352-83bb-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587465226;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9wLs3cwz/7QnXCIqkz1OOmDUM/zdSH/1b9Yue3Cg6cU=;
 b=AjUaYf+Ld+JC2Bwk0Amxf9fjDpI07/WviHjz3wLKje6ZowHDdKa3a569
 LnXyRmkcVpADkZKLSrPK2szlwE766QaE9ecK0PMuL0aokUgh3Y4zYHR6o
 dcuS58c3kvb/jl9pQ+5LX96pMEH2lc4IqxCh05sY3YyaNmruZrWLm0z01 c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CTj4r/FoTU0XdijLSqw9ics0an6TeNYyw1SIKjvHGynHI4DRm8BOEaObiHQ8VOlkeE969JEl+t
 jVb8vTZ8UlWElfbCUj4r09D7w7YTzFGK7z35HIQY5U/EIEXU5/m8WBOf7Bav05xmoCdnYBOmol
 B2eHDZcjaj/cx8mAP748+p53fykvbPN2RULRt8FTnZ/PEp5PRk0+F+bJeCxH3NlzY40aIm0Ur8
 Pz6gq/rJQAyp1FV2Kpn/HpH41HWMfYhrt0zb/JXrwT/I2WsoZSTfSuNqWZ1jWmmuLptdPix1z0
 QLY=
X-SBRS: 2.7
X-MesageID: 16669326
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16669326"
Subject: Re: [PATCH] x86: Enumeration for Control-flow Enforcement Technology
To: Jan Beulich <jbeulich@suse.com>
References: <20200420190829.17874-1-andrew.cooper3@citrix.com>
 <3c085f0c-134d-ae56-c529-60ea8e61b1be@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <44e6f6e8-3e79-11ac-58a5-59ed27fbe1bf@citrix.com>
Date: Tue, 21 Apr 2020 11:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c085f0c-134d-ae56-c529-60ea8e61b1be@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/04/2020 08:11, Jan Beulich wrote:
> On 20.04.2020 21:08, Andrew Cooper wrote:
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -229,6 +229,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
>>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
>>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
>>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
>> +XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
>>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
>>  XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
>> @@ -255,6 +256,7 @@ XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single
>>  XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
>>  XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
>> +XEN_CPUFEATURE(CET_IBT,       6*32+20) /*   CET - Indirect Branch Tracking */
> s/6/9/, moved up a line, and then

Oops.  I only spotted during final review that CET-SS and CET-IBT are in
different feature leaves, then failed at adjusting the CET-IBT adequately.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

>
> I take it you intentionally don't mean to add #CP related bits yet,
> first and foremost TRAP_control_flow or some such, as well as its
> error code bits? Nor definitions for the bits within the MSRs you
> add, nor XSAVE pieces?

Those pieces aren't necessary to hide the MSRs, whereas this patch wants
backporting in due course.  Every "make the MSRs have correct
architectural properties" will until MSR handling is fixed properly (and
by this, I mean no default cases which leak state/availability, or
discard writes).

~Andrew

