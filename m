Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B21942B9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:12:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHU91-0005pI-Po; Thu, 26 Mar 2020 15:10:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHU90-0005lb-GW
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:10:06 +0000
X-Inumbo-ID: df1c5558-6f73-11ea-8808-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df1c5558-6f73-11ea-8808-12813bfff9fa;
 Thu, 26 Mar 2020 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585235405;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yP1y1aDxac+JOVZZKYgo4d7holGnWZGN1LHcIv31848=;
 b=h39EMO3Nqx+MyOVPxez5ShyAz3f112OVepq2LdDJNWt4iTEUapeRuQXA
 +Phq/wIdgSyez3bB79/NKLGQqDUGBNym/w4mGACL5fxZu9PTcpIG4GsHN
 nQwd9l86rEinhniJm1IJE9wzQ44Ep0y5r4fl/UYOVrO/sdvyHZguqGpUy 0=;
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
IronPort-SDR: i31MZBr5Fvmu1NA6Gaxf16kKyFGlnzbcdEmZ89RfjMsw023uTl131oHvc3K3zcVuubjqI/MXj0
 SNmxx6sgLlv+uJ1nZNvTNAm7KUgFhppiRZT9qsfFOSCN8DO1vn3qgn8P6JhfrePlPiTBGza+2A
 /KtyxjBZfFiZ9K1diJ6E9bdsH5bm4ihk43xIc3Q7jWv51DCvIdFOvBf138et2FZ75xWP4tIBmC
 opmp1laIud3+AtyxobrSaip3vsLT7NyRPkCLtPUmc/WTK39ltoBy7j0VPWRPGv2NpujWRGnFlW
 qGY=
X-SBRS: 2.7
X-MesageID: 14903758
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14903758"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-5-andrew.cooper3@citrix.com>
 <52481e12-eb98-eead-be74-d48815e5a41f@suse.com>
 <eabacc07-ef92-0839-798b-ffee123f4f89@citrix.com>
 <83909134-8bd7-b1b2-40f7-040dd00cc517@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d4b56282-1df4-0c18-9ca7-5277a3829fb3@citrix.com>
Date: Thu, 26 Mar 2020 15:09:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <83909134-8bd7-b1b2-40f7-040dd00cc517@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/7] x86/ucode/intel: Reimplement get_{data,
 total}size() helpers
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

On 26/03/2020 14:56, Jan Beulich wrote:
> On 26.03.2020 15:35, Andrew Cooper wrote:
>> On 25/03/2020 13:41, Jan Beulich wrote:
>>> On 23.03.2020 11:17, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>>> @@ -46,9 +46,16 @@ struct microcode_header_intel {
>>>>      unsigned int sig;
>>>>      unsigned int cksum;
>>>>      unsigned int ldrver;
>>>> +
>>>> +    /*
>>>> +     * Microcode for the Pentium Pro and II had all further fields in the
>>>> +     * header reserved, had a fixed datasize of 2000 and totalsize of 2048,
>>>> +     * and didn't use platform flags despite the availability of the MSR.
>>>> +     */
>>>> +
>>>>      unsigned int pf;
>>>> -    unsigned int datasize;
>>>> -    unsigned int totalsize;
>>>> +    unsigned int _datasize;
>>>> +    unsigned int _totalsize;
>>> ... the underscores here dropped again. Or else - why did you add
>>> them? This (to me at least) doesn't e.g. make any more clear that
>>> the fields may be zero on old hardware.
>> No, but it is our normal hint that you shouldn't be using the field
>> directly, and should be using the accessors instead.
> Yet in patch 5 you do. Perhaps for an understandable reason, but
> that way you at least partly invalidate what you say above.

The net result of of patch 5 is three adjacent helpers, which are the
only code which use the fields themselves.

I can drop if you really insist.  We're only talking about 400 lines or
code, or thereabouts.

>>> Furthermore - do we really need this PPro/PentiumII logic seeing
>>> that these aren't 64-bit capable CPUs?
>> I did actually drop support in one version of my series, but put it back in.
>>
>> These old microcode blobs are still around, including in some versions
>> of microcode.dat.  By dropping the ability to recognise them as
>> legitimate, we'd break the logic to search through a container of
>> multiple blobs to find the one which matches.
> Oh, good point.

Shame I only came to that realisation after having reworked the series
to take it out...

I'm constructing companion document to
https://xenbits.xen.org/docs/sphinx-unstable/admin-guide/microcode-loading.html
which will live in hypervisor-guide section, and cover a whole range of
topics like this.

~Andrew

