Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E11CFA46
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 18:14:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXXV-0003XR-LR; Tue, 12 May 2020 16:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYXXT-0003XJ-U6
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 16:13:51 +0000
X-Inumbo-ID: 90c9e146-946b-11ea-a2d0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90c9e146-946b-11ea-a2d0-12813bfff9fa;
 Tue, 12 May 2020 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589300031;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nkn7Wt1Uo3TggDhSxw2xw1E5I1XEGPr21R5zH/K1+Kg=;
 b=IhZZyOOgCBHzcIY0KIPa5b6M66myZ+rFSJnwobAymcHHxA1aUHni8esH
 4i5eaqZtWrRVteTOHkuUyQ1h0w6A/fluAG6+ZdzAJ7fR42NOjiz4fD8zg
 Y1y61sOwgHv5JC8Xzve8C+CDWYOkicqStY4llXe94hG4Fwns4TMgzM7Ls I=;
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
IronPort-SDR: UHA0EXrdwzH8OPjNA0UPGF57MjE1LJclRoFHiuLAFG/WhduyFYNAJ7mdtY1earuCA4ohjRyj2q
 r81nDz+3foZLu56w+1xGi5qNyPOTM8p4cwAzhNJjxHkMmkfnmSKuVIjhKfz4OrCpzFumNVcCFx
 6//HygwizG7FWLAQ6IzTIxR1MyQRkkjQJDX5Pt/Y/FKf5p39+1485FiYu6fN0ko02RJCHP/0kM
 MuXF8KeEcRulGDKKrpczNAi1Q8BtalV6QOoDR7dNIBsX0pk2I0r1QU77Ih6iHinoalGgiE5YCe
 KAQ=
X-SBRS: 2.7
X-MesageID: 17358402
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17358402"
Subject: Re: [PATCH 2/2] x86/boot: Drop .note.gnu.properties in build32.lds
To: Jan Beulich <jbeulich@suse.com>
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <20200512033948.3507-3-jandryuk@gmail.com>
 <69dd92f0-5b23-7a3d-3568-feab20874f97@suse.com>
 <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
 <5e976f0f-3a9b-6159-f4bf-b9f8b6c578d2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <511378d3-038f-fa6d-905c-6697ed9ecf1b@citrix.com>
Date: Tue, 12 May 2020 17:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5e976f0f-3a9b-6159-f4bf-b9f8b6c578d2@suse.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Wei
 Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 17:11, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 12.05.2020 17:58, Andrew Cooper wrote:
>> On 12/05/2020 16:32, Jan Beulich wrote:
>>> On 12.05.2020 05:39, Jason Andryuk wrote:
>>>> Discard the .note.gnu.property section when linking to avoid the extra
>>>> bytes.
>>> If we go this route (and if, as per above, I'm misremembering,
>>> meaning we didn't reject such a change earlier on), why would we
>>> not strip .note and .note.* in one go?
>>>
>>>> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
>>>> or else the hypervisor will not boot.
>>>> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260
>>> How's this related to the change here?
>> I think there is a bit of confusion as to exactly what is going on.
>>
>> Ubuntu defaults -fcf-protection to enabled, which has a side effect of
>> turning on CET, which inserts ENDBR{32,64} instructions and generates
>> .note.gnu.properties indicating that the binary is CET-IBT compatible.
> I.e. in principle this 2nd patch wouldn't be necessary at all if
> we forced -fcf-protection=none unilaterally, and provided build32.mk
> properly inherits CFLAGS. Discarding note sections may still be
> a desirable thing to do though ...

Even if we disable unilaterally for now, we'll still want to re-enable
at some point, so this will come and bite us again.

I'm currently testing Ubuntu's default behaviour in combination with
livepatch, because I bet there are further breakages to be found.

~Andrew

