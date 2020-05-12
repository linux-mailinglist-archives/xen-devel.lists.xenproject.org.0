Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689421CFDC1
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 20:48:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYZw4-0008DD-Rm; Tue, 12 May 2020 18:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYZw3-0008D8-Pj
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 18:47:23 +0000
X-Inumbo-ID: 03a77bbe-9481-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03a77bbe-9481-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589309242;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=f4J1OFATmnrmFK7ksAxy0B0Slp2BkOK60i2CQ7K1lRQ=;
 b=ChdUIv0RvWywXxEXQj3coC8gu3EuZm/z5f+urGAYEiE8TlkYWQoXRNjV
 wEGzj6bls1765MbiaLkEb0Mu2/r/MiOlerAaQT6+4bF9UATV5Ge85wLHN
 bhB5oOXS6LDhowAzwAH5dHRYo4C+xfaZPA9Q78ZqH3CrAa5Rfbmf8rCkX E=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: hYykLjkCS6FKzopO1KlOSjfAOKeL5xbJhT9IdKYsh1j4GUkDkUoUwRjShlTiz/cdI440wpGoyI
 XGSMW0Fv0MeUk1hMFDg4PaVRnjrdIdTryw0MAMh0EC8EpqzEIYl1K94t2m+96kAikdJL/zmhV7
 G3D8LthhjtXTwZ+pwVaG1aomMO8438sSsj85yeDmg/HZFo67g5FSVHYqmr8+byGObsbws3KJxK
 Ix4uTK0H1HoUczLyyGY/G/p9K7CeRexCHHmJm7GvPJc2GzphgNilQkY1qfdr3I9XtHHVvVuAef
 Opw=
X-SBRS: 2.7
X-MesageID: 17719284
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17719284"
Subject: Re: [PATCH 0/2] Fixups for fcf-protection
To: Stefan Bader <stefan.bader@canonical.com>, Jason Andryuk
 <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <3542ecb3-6f4e-2408-ea9f-9b03ac23688e@canonical.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2fbc4be8-c992-1703-168c-a4124a0fd02e@citrix.com>
Date: Tue, 12 May 2020 19:47:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3542ecb3-6f4e-2408-ea9f-9b03ac23688e@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 08:17, Stefan Bader wrote:
> On 12.05.20 05:39, Jason Andryuk wrote:
>> Two patches to fix building with a cf-protection toolchain.  The first
>> handles the case where the compiler fails to run with "error:
>> ‘-mindirect-branch’ and ‘-fcf-protection’ are not compatible".
>>
>> The second fixes a runtime error that prevented Xen booting in legacy
>> mode.
> That might be better than just disabling fcf-protection as well (which was done
> in Ubuntu lacking a better solution).

It is a GCC bug

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654

Fixed for 10, and 9.4

>
> Not sure it was already hit but that additional .note section breaks the build
> of the emulator as generated headers become gigantic:
>
> https://git.launchpad.net/ubuntu/+source/xen/tree/debian/patches/1001-strip-note-gnu-property.patch?h=ubuntu/focal

4.6G of notes?!?  That is surely a toolchain bug.

~Andrew

