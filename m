Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737011BF5AB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:38:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6aC-0007Rh-Jg; Thu, 30 Apr 2020 10:38:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLHY=6O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jU6aB-0007Ra-Fn
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:38:19 +0000
X-Inumbo-ID: b457ed70-8ace-11ea-9a1f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b457ed70-8ace-11ea-9a1f-12813bfff9fa;
 Thu, 30 Apr 2020 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588243098;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gcI19hGtn1GKElfxwHAkQJ9FSP2EwE2MKIynqnJ9Vo4=;
 b=H5rZxK4lnAR8ek03KGz+hwmaql76imybIL0SyNd5oFOtCZIXvDyiEN4m
 nPGKjV+q1DY1zCwgh00NePB2DLZw/7szeeaaKggUz1AUpulXHMYcyek9Z
 3qn5K3/zrTorJRLBTWEv1v4IFNdpiLYHbq92p6w2cs/MP40duDMUstDR8 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t4QuuI+NpQQlk4DwrMPdz54JCBm5MvPXMvlITmRpVz8V2CxHR9eAQNUxzzDm/8qDVMMj6z4OCS
 ZS5069TqYxgPvh5Ye2eb5+853md5cNQGMa4i/OmBF1bQ3Ddz4b9VZBf4oPTHn5mK0yJPBm1Cv5
 4BB3/cfw+vXjSB+zok5lTGEltb64uQvejYGL32gKyhPyFpnnHDc5u/r3p8BornutHEviVKNsZ9
 0b1tyfRD5z2CEHRGA6FL0xLt704IEdDdniwDeRBVVnQiPTXz4z7UsJcAQ3tbmibvhT2n6xvjAs
 3Wo=
X-SBRS: 2.7
X-MesageID: 16483458
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16483458"
Subject: Re: [PATCH] x86/amd: Initial support for Fam19h processors
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200430095947.31958-1-andrew.cooper3@citrix.com>
 <20200430103528.GC28601@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9ae757ef-1cc4-98ef-8b68-161b0717ac22@citrix.com>
Date: Thu, 30 Apr 2020 11:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430103528.GC28601@Air-de-Roger>
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
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/04/2020 11:35, Roger Pau Monné wrote:
> On Thu, Apr 30, 2020 at 10:59:47AM +0100, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
>> index c3f92ed231..014524486f 100644
>> --- a/xen/arch/x86/nmi.c
>> +++ b/xen/arch/x86/nmi.c
>> @@ -398,7 +398,7 @@ void setup_apic_nmi_watchdog(void)
>>      case X86_VENDOR_AMD:
>>          switch (boot_cpu_data.x86) {
>>          case 6:
>> -        case 0xf ... 0x17:
>> +        case 0xf ... 0x19:
>>              setup_k7_watchdog();
>>              break;
>>          default:
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index 0bcf554e93..33e5d21ece 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1939,7 +1939,7 @@ static unsigned int calc_ler_msr(void)
>>          switch ( boot_cpu_data.x86 )
>>          {
>>          case 6:
>> -        case 0xf ... 0x17:
>> +        case 0xf ... 0x19:
>>              return MSR_IA32_LASTINTFROMIP;
> You seem to also add support for Fam18h here and in the chunk above,
> is this intentional?

Yes.  Honestly, these details have never changed since the K7.  I'm
tempted to drop the family logic entirely.

~Andrew

