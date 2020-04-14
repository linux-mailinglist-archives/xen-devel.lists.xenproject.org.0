Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4E1A8901
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 20:17:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOQ6t-0003gk-JZ; Tue, 14 Apr 2020 18:16:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOQ6r-0003gf-UV
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 18:16:33 +0000
X-Inumbo-ID: 118f1b26-7e7c-11ea-898e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 118f1b26-7e7c-11ea-898e-12813bfff9fa;
 Tue, 14 Apr 2020 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586888193;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KeuI8SBj0d38u+/4Pd02DQh0/Hd0mn0uyFPFWXnUCvg=;
 b=DEyEtVQ4PiQgDZOzOIgEv2jV6y4r4KG7eGJle/1VO5IMFymVCgk/cVOj
 H7Jzi4yFH9ByIt1Er0Ld8xgsew54r0zsOuPyo2x4g3owwzeeHw0hc5lge
 i+nmhyfdnoBeCXoqOBDNHOoNbeoKdZL5i0hTkB8JjzfVOVZTl5W/c/eGt s=;
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
IronPort-SDR: KWX9KNA65WJlTefrLwe8XGHHQ8o/69XvgeFpcOf0qXe3DpboxPTLsgjZcMFqizb5X5nXPI/aOC
 fDPL5teHMf9m5R1RW/qnj3BdzwLL+dJ4u6LGdHGtGv5mpLj5t76A7Tvb+73bO9OSUzR8HUBc4l
 MHP0AejOcK4pdSdO//qXaEiMfCvz+/RpR+5yfORIxeskYQduzAdx0t/nToXuAoN5XMHWBrQz/G
 V8PpslwxWU3p1F0g/DbDnNn5VWi5b9WIPMRJCZoJjUuwAKZAGbiQWoJVsqFoOmlNEfoa8F0Jdp
 T2Y=
X-SBRS: 2.7
X-MesageID: 15907421
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,383,1580792400"; d="scan'208";a="15907421"
Subject: Re: [PATCH v2 03/17] tools/migration: Drop IHDR_VERSION constant from
 libxc and python
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-4-andrew.cooper3@citrix.com>
 <24148.1780.909250.638385@mariner.uk.xensource.com>
 <1f074dca-9798-1ed9-0163-882eb2079d53@citrix.com>
 <24161.12968.77707.404087@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b016711e-034d-cf00-1434-beb75b9c263d@citrix.com>
Date: Tue, 14 Apr 2020 19:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24161.12968.77707.404087@mariner.uk.xensource.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/03/2020 17:11, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH v2 03/17] tools/migration: Drop IHDR_VERSION constant from libxc and python"):
>> On 24/02/2020 17:25, Ian Jackson wrote:
>>> Andrew Cooper writes ("[PATCH v2 03/17] tools/migration: Drop IHDR_VERSION constant from libxc and python"):
>>>> Migration v3 is in the process of being introduced, meaning that the code has
>>>> to cope with both versions.  Use an explicit 2 for now.
>>>>
>>>> For the verify-stream-v2 and convert-legacy-stream scripts, update
>>>> text to say "v2 (or later)".  What matters is the distinction vs
>>>> legacy streams.
>>> Can I request that you use a manifest constant for `2', rather than
>>> sprinkling literal `2's everywhere ?  Something like IHDR_VERSION_2 ?
>>> This may seem pointless, but it will mean that it is possible to grep
>>> the code much more easily for things which are relevant to v2 or v3 or
>>> whatever.
>>>
>>> (I don't it's necessary to go to any great lengths to substitute the
>>> value of IHDR_VERSION_2 into error messages; a literal 2 in the string
>>> is OK I think.)
>> As I reply previously... The value comes out of a pipe, and is checked
>> exactly once.
> I think we are talking at cross purposes.
>
> I am suggesting that you replace every instance of a numeric literal
> `2' in the code with IHDR_VERSION_2 (which would be a #define or enum
> for 2).
>
> I count 4 such literals.

I presume you mean here 2x send IHDR and 2x receive IHDR, one C and one
Python in each case.

I understand what you're suggesting.  I completely disagree with it, as
it obfuscates the logic and introduces a source of bugs for zero gain.

IHDR_VERSION_* isn't grepable.  You've got to find the only instance of
it in code to figure out what to search for.

>> You can already grep for everything, using format_version which is where
>> this number is stashed for the duration of restore.
> None of the things I am talking about have "format_version" nearby.
> They tend to have variants on "version" but that is a poor thing to
> grep for.

"ctx->restore.format_version = ihdr.version;" (the only instance in the
codebase at this point in the series) is immediately after ihdr is
sanity checked, which is sole time where idhr.version has its value
checked (in the restore path.  There is also exactly one place in the
save side, and any more than this would be buggy code).

The only thing IHDR_VERSION_* usefully gets you is the ability to get
the defines accidentally wrong, and introduce bugs that way.

~Andrew

