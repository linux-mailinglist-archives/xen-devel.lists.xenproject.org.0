Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24421BDABB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 13:33:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkx9-0004yp-DU; Wed, 29 Apr 2020 11:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTkx8-0004yk-RO
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 11:32:34 +0000
X-Inumbo-ID: 1dc41f1d-8a0d-11ea-992d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dc41f1d-8a0d-11ea-992d-12813bfff9fa;
 Wed, 29 Apr 2020 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588159953;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rm10g/pmVmevI6nWsXuFqiMQ6fsjExpLtCzN2n+htn0=;
 b=CFHbj7wKwucufm9dChV3WGBglpHe7QXzSqDy9ZwMzTjHVt2ZZBYcIk5S
 EigxKID5V/ArPP6ZmohwDQlJ+kH4ntnf3RBLYeUbHy+WwTxHVmpNzoKVc
 gRPappx7H5BOu0playRP7/dxSnt+z3S29aT/BheYMgwrRlthaGwQ2EbIp Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Umv1e6mIv9aR8mAxOwSrXA9kGgUL7UNKO+HNgDRQBRUgsLtmUeLzg1Q7/er83xjh2oqVeefWJT
 fGdwsPSLU2f4tZV++3/Fxov9Jyh0PbxEtw/pODVrv79ey6dyj/jIpBhMvu8NCgKoaIj1wvjnFx
 xzBqQ52wU9KvCequpVpBImq65M698ZMjmg3iDxK19ElWE4k+c0d7pLRB4HH+OGOyQYDZ9iAcJJ
 RgS6RiFqHaVHZ6PNHKF3/aJKAczw2w6HIk8/6zKC9gqjlRn40Bk/lHoiNiGMRAN2cTWiZJc3wN
 E/k=
X-SBRS: 2.7
X-MesageID: 16744108
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,331,1583211600"; d="scan'208";a="16744108"
Subject: Re: [PATCH] x86/S3: Drop {save,restore}_rest_processor_state()
 completely
To: Jan Beulich <jbeulich@suse.com>
References: <20200429110903.15418-1-andrew.cooper3@citrix.com>
 <42c1a2ec-51a1-7b03-aea5-f8ffe80d6928@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <52bdc00f-7778-bd06-14e1-d5c6086466d3@citrix.com>
Date: Wed, 29 Apr 2020 12:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <42c1a2ec-51a1-7b03-aea5-f8ffe80d6928@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 12:16, Jan Beulich wrote:
> On 29.04.2020 13:09, Andrew Cooper wrote:
>> --- a/xen/arch/x86/boot/trampoline.S
>> +++ b/xen/arch/x86/boot/trampoline.S
>> @@ -91,6 +91,11 @@ trampoline_protmode_entry:
>>          and     %edi,%edx
>>          wrmsr
>>  1:
>> +        /* Set up PAT before enabling paging. */
>> +        mov     $XEN_MSR_PAT & 0xffffffff, %eax
>> +        mov     $XEN_MSR_PAT >> 32, %edx
>> +        mov     $MSR_IA32_CR_PAT, %ecx
>> +        wrmsr
> Doesn't this also eliminate the need for cpu_init() doing this?
> If you agree with that one also dropped
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

That doesn't cover the BSP on either the legacy or EFI paths.

~Andrew

