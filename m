Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF491CAEA6
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 15:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2qT-00068l-Pd; Fri, 08 May 2020 13:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX2qS-00068g-7E
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:15:16 +0000
X-Inumbo-ID: f451b2b6-912d-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f451b2b6-912d-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588943715;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=x57zNJaVGCkHcBWyzF+hCSFPTDobTi6hMb959CM+xfo=;
 b=fyrRLJEbIcXfWg1839GtnsH/N+b+/8kLJpNy3BqxKXJrgNzdWaPMSwHz
 POx6/sfjV2Cj17gLMyC1xAdGf076axR3gyTJXqtqNcGIpTLvtC7+8hzJa
 2aDiMYdD2Kf2xIPDTiSDMnGvPsUa89Nfr3KObFgRG319sl/IMrPQb/nXe 0=;
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
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: bt12wJy/PwrWpBHByaCRzFdxppSg2IcmjwHEuExgJl3gFYILCnPSgjyWbwsOimc+j1VI+83XIq
 ML5XdNY2qwIiv0SJAfeaf5C6zsjh1lTTEWVY0Ir6YwEsTSIzEHFMK3/3icFLFXf5qGf/x7d4jN
 ChRRLxi5AA5xzMKruzjpBOP6SMfA+F785Og44txyoHY/s22Jjy7iL2DtFWQOnRcKrcST+2elOe
 gPMQ4JgzRxWjr2Gt98cMN8umj2WZzMB8fVMS130E6X9noMotvpVXfrqdmjfe9v1rwmfLFzTcgl
 e6A=
X-SBRS: 2.7
X-MesageID: 17758085
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,367,1583211600"; d="scan'208";a="17758085"
Subject: Re: [PATCH v8 05/12] x86emul: support X{SUS,RES}LDTRK
To: Jan Beulich <jbeulich@suse.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <6e7500d2-262c-29c7-b9be-3fc9be26d198@suse.com>
 <feb3a6ed-b6b9-959c-8eb1-fb6ecfff034c@citrix.com>
 <b5f9438b-471d-bf32-3f4c-11287060938c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9fa8ceb3-fd4b-e754-2c82-92f134603e34@citrix.com>
Date: Fri, 8 May 2020 14:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b5f9438b-471d-bf32-3f4c-11287060938c@suse.com>
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

On 08/05/2020 08:38, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 07.05.2020 22:13, Andrew Cooper wrote:
>> On 05/05/2020 09:14, Jan Beulich wrote:
>>> --- a/xen/tools/gen-cpuid.py
>>> +++ b/xen/tools/gen-cpuid.py
>>> @@ -284,6 +284,9 @@ def crunch_numbers(state):
>>>          # as dependent features simplifies Xen's logic, and prevents the guest
>>>          # from seeing implausible configurations.
>>>          IBRSB: [STIBP, SSBD],
>>> +
>>> +        # In principle the TSXLDTRK insns could also be considered independent.
>>> +        RTM: [TSXLDTRK],
>> Why the link?  There is no relevant interaction AFAICT.
> Do the insns make any sense without TSX? Anyway - hence the
> comment, and if you're convinced the connection does not
> need making, I'd be okay dropping it. I would assume though
> that we'd better hide TSXLDTRK whenever we hide RTM, which
> is most easily achieved by having a connection here.

Actually - that is a very good point.  I expect there will (or should)
be an interaction with MSR_TSX_CTRL, as it has CPUID-hiding functionality.

For now, could I ask you to not expose this to guests in this patch?

For the emulator side of things alone I think this is ok (although
looking over it a second time, we could really do with a comment in the
code explaining that we're never in an RTM region, hence the nop behaviour).

I'll follow up with Intel, and we can figure out the CPUID derivation
details at a later point.

If you're happy with this plan, then A-by to save a round trip.

~Andrew

