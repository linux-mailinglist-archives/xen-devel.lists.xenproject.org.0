Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0641BAE9C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 22:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT9vi-0007iQ-IC; Mon, 27 Apr 2020 20:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT9vh-0007iL-I3
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 20:00:37 +0000
X-Inumbo-ID: c24f8d02-88c1-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c24f8d02-88c1-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588017637;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cBAIWx1mjz1mmjuR3O7FLxWCZF8TQzeCU7IWocKU03U=;
 b=MV6L6B3rmmW5Si+OkpBkrkkbVhUTp04L26XmZ3RuzK/yVkBsw96pcgKO
 zq7sgFl0x55LMdgB189C//+UnZ+AcjE9I2MxMPijdIzhj+0SF3NTvqBSa
 CjG6ym7i2zDT77zkI+7EGqxnTacc9SjFx0G8NE8+uUL5soBDEYV0ws0Jm s=;
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
IronPort-SDR: yLfmEku0OXbrO79fZT8ijTwuS0/jjHJeb/B4NFj/VdovsuoK5UoPCUV3iRHRjy3wHV3/mmuZa0
 xFXak9pZhs0Y9OXBAwXNgxFpwDauxmaneJIwBu3CQn7Q7o3ABQW/y/PNWE7HuGwW/gQhYaEwDg
 ywzsSg6ltgDe7X4SmYhkaQKl6eAA1h4RbDzNXvtc+HIk4lSFX81ckFIB9WEve6ISFMZtMdLKAa
 wbSvpAg+TPvPk66ioK0gArEfc1T57F+Gp+ODF49xq6MgHU+S49C1ELJiit+3jn7+F5SlVhS3Tm
 daw=
X-SBRS: 2.7
X-MesageID: 16311133
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,325,1583211600"; d="scan'208";a="16311133"
Subject: Re: [PATCH 01/12] libxc/save: Shrink code volume where possible
To: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
 <24093.61657.676890.721999@mariner.uk.xensource.com>
 <a10d1572-d5c5-716a-0651-aee2345348dd@citrix.com>
 <24231.5161.862828.377795@mariner.uk.xensource.com>
 <20200427195542.yiuvw4xgfjfzn6wh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <df22f0c7-0bca-ea42-976b-3de530cc83cf@citrix.com>
Date: Mon, 27 Apr 2020 21:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427195542.yiuvw4xgfjfzn6wh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/04/2020 20:55, Wei Liu wrote:
> On Mon, Apr 27, 2020 at 06:19:37PM +0100, Ian Jackson wrote:
>> Andrew Cooper writes ("Re: [PATCH 01/12] libxc/save: Shrink code volume where possible"):
>>> On 14/01/2020 16:48, Ian Jackson wrote:
>>>> Andrew Cooper writes ("[PATCH 01/12] libxc/save: Shrink code volume where possible"):
>>>>> A property of how the error handling (0 on success, nonzero otherwise)
>>>>> allows these calls to be chained together with the ternary operatior.
>>>> I'm quite surprised to find a suggestion like this coming from you in
>>>> particular.
>>> What probably is relevant is that ?: is a common construct in the
>>> hypervisor, which I suppose does colour my expectation of people knowing
>>> exactly what it means and how it behaves.
>> I expect other C programmers to know what ?: does, too.  But I think
>> using it to implement the error monad is quite unusual.  I asked
>> around a bit and my feeling is still that this isn't an improvement.
>>
>>>> Or just to permit
>>>>    rc = write_one_vcpu_basic(ctx, i);    if (rc) goto error;
>>>> (ie on a single line).
>>> OTOH, it should come as no surprise that I'd rather drop this patch
>>> entirely than go with these alternatives, both of which detract from
>>> code clarity. The former for hiding control flow, and the latter for
>>> being atypical layout which unnecessary cognitive load to follow.
>> I think, then, that it would be best to drop this patch, unless Wei
>> (or someone else) disagrees with me.
> I don't feel strongly either way.

I'm confused... I dropped this 3 and a half months ago, because it was
blindingly obvious it was going nowhere.

This is the v1 series which was totally superseded by the v2 series also
posted in January.

~Andrew

