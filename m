Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB01C00C7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUBS1-0002t7-CP; Thu, 30 Apr 2020 15:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLHY=6O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUBS0-0002t2-79
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:50:12 +0000
X-Inumbo-ID: 4583bc19-8afa-11ea-9a75-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4583bc19-8afa-11ea-9a75-12813bfff9fa;
 Thu, 30 Apr 2020 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588261811;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cqT2umU96NpQ5kplgxo4+vPyoa6qqM52qyf1Yh2z2qI=;
 b=O77QpaUmPGSyoP7HKHp4VyCrF4HdJr3ZV3/LyKxym6DIpH9JCmKmAjnz
 RVthrpbHLD0PCz519fgGGVZu4bZ44DaMNxK4WuUbf5TQoGXVPNU+skMY6
 gYYS+ukqOHyn2vhCETLiLUJljeHhPmnXYp8KUW3ArtSnCqhwXEoYduY2A 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: PIq3lKpsbk1JDrvfa7kDyCyScDRb2dBAZ3kb+Abkt3y63kS1OFp2Vq0WvcG1g5H6utZfvuVHv8
 Fx7zjUJiY38jTBuRvzYBAvvb7zT6sLyxGuzlb41v9ECFgTMlFpqPXw4pHWXQqG2n0up7hmNtTA
 f6JWJ7UKnSzKS4Q7vuTWvw2BguOoGyOd+cXL6n4O0igaQa8S0kqufghp5shEfA0DlSCo57jCcP
 +MxhaioU1TpT+WI1Tg0TE13/gJyKsH+Hw9rkvwvLTWqSHDHFFgfc7wIesf6yQimnpQq48Ijz9e
 BeE=
X-SBRS: 2.7
X-MesageID: 16776213
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,336,1583211600"; d="scan'208";a="16776213"
Subject: Re: [PATCH] x86/amd: Initial support for Fam19h processors
To: Jan Beulich <jbeulich@suse.com>
References: <20200430095947.31958-1-andrew.cooper3@citrix.com>
 <471aaf7e-497f-edd2-6eb0-06d337a23538@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9dc3a9e6-4a86-f24a-b279-59fec5ef22d8@citrix.com>
Date: Thu, 30 Apr 2020 16:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <471aaf7e-497f-edd2-6eb0-06d337a23538@suse.com>
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

On 30/04/2020 12:09, Jan Beulich wrote:
> On 30.04.2020 11:59, Andrew Cooper wrote:
>> Fam19h is very similar to Fam17h in these regards.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Nevertheless a question:
>
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -125,6 +125,7 @@ static bool_t verify_patch_size(uint32_t patch_size)
>>          max_size = F16H_MPB_MAX_SIZE;
>>          break;
>>      case 0x17:
>> +    case 0x19:
>>          max_size = F17H_MPB_MAX_SIZE;
>>          break;
> Didn't you indicate to me the other day that the upper bound would
> grow?

That was a very non-specific patch to Linux.  I've asked around, and the
answer seems to be 4800.

Are you happy for your review to stand with adding a new
F19H_MPB_MAX_SIZE define to this effect?

~Andrew

