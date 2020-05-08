Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47851CAD17
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 15:01:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2cM-00056Z-5L; Fri, 08 May 2020 13:00:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX2cK-00056U-9n
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:00:40 +0000
X-Inumbo-ID: e8a1e1cc-912b-11ea-9feb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8a1e1cc-912b-11ea-9feb-12813bfff9fa;
 Fri, 08 May 2020 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588942836;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Vz/36Lck5MGVk0jqxRBoQQn2SfYZWrKQXZon82oEWZc=;
 b=Lqm4wDSqe356658T/z/FFMQx0LyYdT2nA/1QkSBbGt4v66gr2BnV0Xd4
 MEmN5aLdViINY7fJPBAQqM46e4GS1cXpncpeV+SWOEyc7nviTEmUMqg4w
 BT+lHroi4458bPQQe4jHWD1mqte6rdoaa4D3fOB5QeeMIlmIVA1evSDQ/ w=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: YzNcvFTcTZXuo6n0SV7gNiDmO/7AyPCD5yPoTf+GIGe2A1BkuznUk5gXblMcXyKtSrVGv1rh38
 PSllyHL440PqJXrowpR38stOXQKbecyDCCQG8B2+hlbDnl2gPIBQY6r2xqaZcMQ6E5qQb7/gO3
 +ckIOqevnwrgGbYKIIPQ++3t0B5cuBpXY2BOfJfWHgcJ6QdyVVxHByLc8wvKqFedRSRVat2krD
 taL57druuj8j1KXRtXavXr0C4hOeUfvu7ujC+aKYYOnpUmoEjuOsZbnRG7lL3E/wT4Kz4GnsXc
 myg=
X-SBRS: 2.7
X-MesageID: 17084357
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,367,1583211600"; d="scan'208";a="17084357"
Subject: Re: [PATCH v8 04/12] x86emul: support SERIALIZE
To: Jan Beulich <jbeulich@suse.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <0bbbf95e-48ec-ee73-5234-52cf9c6c06d8@suse.com>
 <64de91ff-41ae-baf1-1119-0ba39df32275@citrix.com>
 <0c5a03c6-6c4f-c6ec-e474-71a2badd1c9c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe12bd3d-37f6-111c-e738-dde0b42d2d3d@citrix.com>
Date: Fri, 8 May 2020 14:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0c5a03c6-6c4f-c6ec-e474-71a2badd1c9c@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/05/2020 08:34, Jan Beulich wrote:
>>> @@ -5660,6 +5661,18 @@ x86_emulate(
>>>                  goto done;
>>>              break;
>>>  
>>> +        case 0xe8:
>>> +            switch ( vex.pfx )
>>> +            {
>>> +            case vex_none: /* serialize */
>>> +                host_and_vcpu_must_have(serialize);
>>> +                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
>> There is very little need for an actual implementation here.  The VMExit
>> to get here is good enough.
>>
>> The only question is whether pre-unrestricted_guest Intel boxes are
>> liable to find this in real mode code.
> Apart from this we also shouldn't assume HVM in the core emulator,
> I think.

It's not assuming HVM.  Its just that there is no way we can end up
emulating this instruction from PV context.

If we could end up here in PV context, the exception causing us to
emulate to begin with would be good enough as well.

~Andrew

