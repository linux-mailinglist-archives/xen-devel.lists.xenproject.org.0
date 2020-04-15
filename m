Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB11A97AB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:56:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdq8-0002HB-5l; Wed, 15 Apr 2020 08:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c95o=57=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOdq6-0002H0-CK
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:56:10 +0000
X-Inumbo-ID: f2af570e-7ef6-11ea-8a1b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2af570e-7ef6-11ea-8a1b-12813bfff9fa;
 Wed, 15 Apr 2020 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586940970;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aFv2mFDiaRCaSEHaajHR03BkVtQjCe9QkUEvdRhO92Y=;
 b=M06zByULz3Z9OfYgA6lnkNgm40jvA7/EQ5obyRRyJ5gtOhx3jiuL02SO
 RSb81ppwBAo0rMZUiLrOPHLsOjU0dqVDkh2BqQ36/smCAxMAbifPY4T6t
 HGr3X51l3FxuY+w3UpkpY3XKPelegXEvhmnZu2Dn2LHz5HWlpDbiZafUD c=;
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
IronPort-SDR: +EEVJ73GOUWEfQ10qi/ynHIJ8fT79e/6wc7jLDbXjFM+0dIAmSfijPpVtIOwvk8Zx8icbKoMnJ
 4GFwG2Chz7cyggKvRD2EpFaGgmJDroYvcF9shS8RxWAFMm1eswxigPBfzqBcjotKR5R9vMN5zQ
 7eTXQGm57C/qkxGeXbwNBcc0FixwnAMfR7ZTgQomdrN+kmognsSTLhZ0yE+DNy1xhc3FmayipC
 D2QJkyO2zn1RV1KXbduyGxxXajh4NAvdlqgo1ydkG4DJ49IlQQt8ZpXlHcsjhVhrG728vUaE8u
 97A=
X-SBRS: 2.7
X-MesageID: 15714068
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15714068"
Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
To: <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <002801d61302$dbd21950$93764bf0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <155ff149-bb9c-db71-f54e-2b91eb1474c1@citrix.com>
Date: Wed, 15 Apr 2020 09:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <002801d61302$dbd21950$93764bf0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: 'Julien Grall' <julien@xen.org>, 'Stefano
 Stabellini' <sstabellini@kernel.org>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/04/2020 09:50, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 15 April 2020 09:45
>> To: xen-devel@lists.xenproject.org
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
>> Subject: [PATCH 0/3] xenoprof: XSA-313 follow-up
>>
>> Patch 1 was considered to become part of the XSA, but it was then
>> decided against. The other two are a little bit of cleanup, albeit
>> there's certainly far more room for tidying. Yet then again Paul,
>> in his mail from Mar 13, was asking whether we shouldn't drop
>> xenoprof altogether, at which point cleaning up the code would be
>> wasted effort.
>>
> That's still my opinion. This is a large chunk of (only passively maintained) code which I think is of very limited value (since it relates to an old tool, and it only works for PV domains).

... and yet, noone has bothered getting any other profiler in to a
half-usable state.

You can already Kconfig it out, and yes it is a PITA to use on modern
systems where at the minimum, you need to patch the CPU model whitelist,
and in some cases extend the MSR whitelist in Xen, but at this point
where there are 0 viable alternatives for profiling, removing it would
be a deeply short-sighted move.

~Andrew

