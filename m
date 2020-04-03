Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47519DA0A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:25:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOCO-0002Q9-6s; Fri, 03 Apr 2020 15:25:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKOCM-0002Pv-Dr
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:25:34 +0000
X-Inumbo-ID: 5c09fc22-75bf-11ea-83d8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c09fc22-75bf-11ea-83d8-bc764e2007e4;
 Fri, 03 Apr 2020 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585927534;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Tmzw6lZPtJ5N2tMJ0hZu+uKxLACy+mG/3poNcxuMfi8=;
 b=ToXDNFV59eyLpNX5oc313Ix2Donh1WIrPPbIJRZT6CdfYOYuucU56Q1R
 PIt8/YIfSVkTrC+TPuJd+aqIckaj5A8+/KuDYyMkl6bJxlg7kR7rb3bkC
 sLZpMm5Ea00UE90RcB5PHUE88et06JZtoNOnSziudbf5oIwiciRCZA7id c=;
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
IronPort-SDR: drlfNwjzqM4UosFe3DR6obdD58VHXaWTzaPTo/DWwuan0RJ3JazWEUuCMS3Xg/0e5eVWmeyttc
 cpnfr2QOgdaoUY3EjFCnaGMXlxsL2kgpxNbWADLsNNfcHeBCsCRwA5i6Yh2kXCSiGWriLEPXGA
 QhjCrPl/EZibG/JlQVnm+DiRgQnpSUzVMWav0iMFFEyLHTmGN84ChEkM1ItfayJX+gZOS8QMtf
 srns1oDmDTz8xLWi/gC8zxNtKpFPkOBAi7Q++bgEdYGYxCbhPiYChTg5nN+OQGBm9WJErkoSA5
 UBg=
X-SBRS: 2.7
X-MesageID: 15123676
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15123676"
Subject: Re: [PATCH v5 10/10] x86emul: support MCOMMIT
To: Jan Beulich <jbeulich@suse.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <e41a2f72-ede5-adec-dc82-65b76368b7f7@suse.com>
 <574bab09-a29e-d77e-96e0-06e57ff524ee@citrix.com>
 <71d182e8-983c-9fa6-3403-ee3212c70c50@suse.com>
 <04564584-c60e-6a4a-cc58-5ec0cf1fa1f5@citrix.com>
 <7184c1e2-f92e-3f19-4040-5b0c655ebc0f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a2440848-cfcb-4628-f78b-a61cf6e4e97f@citrix.com>
Date: Fri, 3 Apr 2020 16:25:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7184c1e2-f92e-3f19-4040-5b0c655ebc0f@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 16:09, Jan Beulich wrote:
> On 03.04.2020 17:00, Andrew Cooper wrote:
>> On 03/04/2020 09:00, Jan Beulich wrote:
>>> On 03.04.2020 01:47, Andrew Cooper wrote:
>>>> On 24/03/2020 12:37, Jan Beulich wrote:
>>>>> The dependency on a new EFER bit implies that we need to set that bit
>>>>> ourselves in order to be able to successfully invoke the insn.
>>>>>
>>>>> Also once again introduce the SVM related constants at this occasion.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> RFC: The exact meaning of the PM stating "any errors encountered by
>>>>>      those stores have been signaled to associated error logging
>>>>>      resources" is unclear. Depending on what this entails, blindly
>>>>>      enabling EFER.MCOMMIT may not be a good idea. Hence the RFC.
>>>> Not just that.  Its not safe for Xen to ever execute MCOMMIT for
>>>> emulation purposes.
>>> I.e. you're suggesting we mustn't even try to emulate it?
>> Sorry - that's not quite what I intended to mean.
>>
>>>> From what I can glean from the documentation, it is intended for
>>>> non-volatile RAM, but I can't find anything discussing the error handling.
>>>>
>>>> The fact the instruction can be intercepted in the first place hopefully
>>>> means that there must be something Xen can look at to get the real error
>>>> indicator.  However, the suggestion is that this will all be platform
>>>> specific.
>>>>
>>>>
>>>> The emulation problem comes from the fact that if Xen has any pending
>>>> writes to to NVRAM as part of the emulation path (or an interrupt for
>>>> that matter), an error intended for Xen would leak into guest context.
>>> I'm afraid all of this is guesswork until it becomes clear how
>>> exactly this error reporting is intended to work.
>> What I meant was that "emulating MCOMMIT can't involve executing an
>> MCOMMIT instruction".
> I still don't see why - the error recording is (presumably) not
> dependent upon the context in which the insn was issued.

And that is the problem.  This instruction has a 1-bit "everything ok"
vs "something went wrong" feedback.

We can't be telling a guest that something went wrong when in fact it
was Xen doing something unrelated which suffered the error.

>> In some future where we have combined intercept and emulation paths,
>> whatever ends up existing will still have to reach out to the error
>> banks directly to figure out what is going on.
> I.e. you're assuming there's going to be an architectural way to
> access those, rather than perhaps many platform specific ones?

I think we're going to have to wait and see what materialises.

~Andrew

