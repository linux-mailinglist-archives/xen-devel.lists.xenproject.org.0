Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90961941B1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:39:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTbp-0001Qe-Vs; Thu, 26 Mar 2020 14:35:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHTbo-0001QX-5a
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:35:48 +0000
X-Inumbo-ID: 143ce1da-6f6f-11ea-87f9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 143ce1da-6f6f-11ea-87f9-12813bfff9fa;
 Thu, 26 Mar 2020 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585233347;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sBBdisgIf0a6omR/MmBmz4+AlHTRiG07QaalHJpmbrk=;
 b=BOl3+evciuG84h42HmySDjEQnrmBc2zt+Nfwd6R/8RAOKGqK9FzCd64v
 TFS+KOVMkpuSSdoGaPjm3aofJ/82fIQKi9fHpUjitTYCO9/9QCQdOXV+4
 RRUxa8OWRcjINlgqt+eEO+E/cd+AMHpQBvE94cfsJVyuHSTFr/G0i4AJk 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 0OpYcHj3620nIdpCTKl9dPWrSYwIoHF2E9K6xp8DGJLvDE9P3PoqvzJ7DkpPnVHrpwNbWALttR
 YFL1Aqc0PV+pSUH/EsNkQsOaTeseJIsj8WaJk4jWBxprIDJSud4g5FHyPuoZqGpoQw6ftCSy/m
 1F0klTvHJrKy/201Uo/MNgqajLnAV1jWr634XBOMgS/L/9bUYWmAO+pzxGC2YSxwIlDm+IjRzk
 CA+EO7S4aVa+dpUS7wRxxuyp4/8dBgR7CEZKdyG9xrZKdi8L5p+2q8fAwDtf1RlGGxl1IyRkuD
 kmU=
X-SBRS: 2.7
X-MesageID: 14697634
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14697634"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-5-andrew.cooper3@citrix.com>
 <52481e12-eb98-eead-be74-d48815e5a41f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <eabacc07-ef92-0839-798b-ffee123f4f89@citrix.com>
Date: Thu, 26 Mar 2020 14:35:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <52481e12-eb98-eead-be74-d48815e5a41f@suse.com>
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

On 25/03/2020 13:41, Jan Beulich wrote:
> On 23.03.2020 11:17, Andrew Cooper wrote:
>> Every caller actually passes a struct microcode_header_intel.  Implement the
>> helpers with proper types, and leave a comment explaining the Pentium Pro/II
>> behaviour with empty {data,total}size fields.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with...
>
>> --- a/xen/arch/x86/cpu/microcode/intel.c
>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>> @@ -46,9 +46,16 @@ struct microcode_header_intel {
>>      unsigned int sig;
>>      unsigned int cksum;
>>      unsigned int ldrver;
>> +
>> +    /*
>> +     * Microcode for the Pentium Pro and II had all further fields in the
>> +     * header reserved, had a fixed datasize of 2000 and totalsize of 2048,
>> +     * and didn't use platform flags despite the availability of the MSR.
>> +     */
>> +
>>      unsigned int pf;
>> -    unsigned int datasize;
>> -    unsigned int totalsize;
>> +    unsigned int _datasize;
>> +    unsigned int _totalsize;
> ... the underscores here dropped again. Or else - why did you add
> them? This (to me at least) doesn't e.g. make any more clear that
> the fields may be zero on old hardware.

No, but it is our normal hint that you shouldn't be using the field
directly, and should be using the accessors instead.

> Furthermore - do we really need this PPro/PentiumII logic seeing
> that these aren't 64-bit capable CPUs?

I did actually drop support in one version of my series, but put it back in.

These old microcode blobs are still around, including in some versions
of microcode.dat.  By dropping the ability to recognise them as
legitimate, we'd break the logic to search through a container of
multiple blobs to find the one which matches.

~Andrew

