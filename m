Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A01BAEA6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 22:03:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT9xm-0007ut-Va; Mon, 27 Apr 2020 20:02:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT9xl-0007uo-Mr
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 20:02:45 +0000
X-Inumbo-ID: 0f036b6e-88c2-11ea-97d6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f036b6e-88c2-11ea-97d6-12813bfff9fa;
 Mon, 27 Apr 2020 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588017765;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=H2x1itjd5jI6EgS/a4zpFdSG4k055RmadBs+oKN7xxQ=;
 b=MtXbsP46PZ3iyDgjgp/ZjDZLYwc5p+oUbSY2QuzgN+yU0cyX/Tvhf+i4
 ELmNbhR184uAXoJDpXC2Ni8zP/FS2DQtG8eKjd1lm1OPPz1DR+KVTT1FH
 KInqXywlp4w1XuOZtMxyK8mBOR9sm2K6Dll4VHr2oK+pTzYrUWehfsk8t U=;
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
IronPort-SDR: W7zyM92+KRmsfq+2fn/u8KfCVJow7RaxopA33TYtohG2wZTo6GXnp8Nv8D5TPrz2MII1BnPdOW
 50hgHHurnu7BABX2bgt1ZRamy/EQLnUPz/O2CaOwRNSDlqPlXXln5gyP+yuAI2dBmBion6Md+r
 uMOsJHXSRra+8SlJpwOFFguH1jeysR4u+mA+Mtt+o+1HDUOtMKilaXcYy6m1Nc6bqq9KnRvBc5
 oG669OxWGTn7cvPA4+SbRakDvyPAlWaDg3ZNzDuq0chDyg7/fdyiaTR/AlkeXf0vUyMlW6I4HE
 4vE=
X-SBRS: 2.7
X-MesageID: 16311260
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,325,1583211600"; d="scan'208";a="16311260"
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
 <5dc9dbd9-fbeb-46ef-4d4e-7916c3219bb3@suse.com>
 <4e732f90-1d5f-7ae5-0f02-6b313a381df7@citrix.com>
 <6b4e5b50-51f7-566f-2a18-4bb5f4f43d59@suse.com>
 <62b51cff-4d6f-690b-371a-e6772ea327ab@citrix.com>
 <68146423-c2cb-0bf4-4bb8-3c89ad17bbcc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5e488903-2916-773d-402e-5aedab4e0af0@citrix.com>
Date: Mon, 27 Apr 2020 21:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <68146423-c2cb-0bf4-4bb8-3c89ad17bbcc@suse.com>
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

On 24/04/2020 06:28, Jürgen Groß wrote:
> On 23.04.20 19:35, Andrew Cooper wrote:
>> On 21/04/2020 07:02, Jan Beulich wrote:
>>> On 20.04.2020 20:05, Andrew Cooper wrote:
>>>> On 20/04/2020 15:05, Jan Beulich wrote:
>>>>> I'm in particular
>>>>> concerned that we may gain a large number of such printk()s over
>>>>> time, if we added them in such cases.
>>>> The printk() was a bit of an afterthought, but deliberately
>>>> avoiding the
>>>> -EINVAL path was specifically not.
>>>>
>>>> In the case that the user tries to use `pv=no-32` without CONFIG_PV32,
>>>> they should see something other than
>>>>
>>>> (XEN) parameter "pv=no-32" unknown!
>>> Why - to this specific build of Xen the parameter is unknown.
>>
>> Because it is unnecessarily problematic and borderline obnoxious to
>> users, as well as occasional Xen developers.
>>
>> "you've not got the correct CONFIG_$X for that to be meaningful" is
>> specifically useful to separate from "I've got no idea".
>>
>>>> I don't think overloading the return value is a clever move, because
>>>> then every parse function has to take care of ensuring that
>>>> -EOPNOTSUPP
>>>> (or ENODEV?) never clobbers -EINVAL.
>>> I didn't suggest overloading the return value. Instead I
>>> specifically want this to go the -EINVAL path.
>>>
>>>> We could have a generic helper which looks like:
>>>>
>>>> static inline void ignored_param(const char *cfg, const char *name,
>>>> const char *s, const char *ss)
>>>> {
>>>>      printk(XENLOG_INFO "%s disabled - ignoring '%s=%*.s' setting\n",
>>>> cfg, name, s, (int)(ss - s));
>>>> }
>>>>
>>>> which at least would keep all the users consistent.
>>> Further bloating the binary with (almost) useless string literals.
>>> I'd specifically like to avoid this.
>>
>> I don't accept that as a valid argument.
>>
>> We're talking about literally tens of bytes (which will merge anyway, so
>> 0 in practice), and a resulting UI which helps people get out of
>> problems rather than penalises them for having gotten into a problem to
>> begin with.
>>
>> I will absolutely prioritise a more helpful UI over a handful of bytes.
>
> What about a kconfig option (defaulting to "yes") enabling this feature?

IMO, that's literally not worth the bytes taken to implement.

> That way an embedded variant can be made smaller while a server one is
> more user friendly.

There is far lower hanging fruit for an embedded usecase, and its not at
all a foregone conclusion that such a usecase would want the less user
friendly version.  (Embedded very definitely doesn't mean that it won't
have users interacting with the command line).

I would certainly recommend against attempting to speculatively fix
something which isn't a problem, based on guesswork about what a
hypothetical group of people might want while totally ignoring the far
larger savings to be gained by e.g. making CONFIG_INTEL/AMD work.

~Andrew

