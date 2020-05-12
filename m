Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0961CFEBC
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 21:54:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYazD-000614-I8; Tue, 12 May 2020 19:54:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh4E=62=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYazB-00060z-EI
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 19:54:41 +0000
X-Inumbo-ID: 69eaf21e-948a-11ea-a2fe-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69eaf21e-948a-11ea-a2fe-12813bfff9fa;
 Tue, 12 May 2020 19:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589313279;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qEIXMZOTP1NgAqtNXm0llZAxH+be2t7QOrP5aZNerqA=;
 b=ZTkZUyAJeWOUVqdrgbIat5HSZ6e/l0zwLPlMcb/KhxzDqIrY7eggScKX
 m+2ZxKFnX8VGYFxrEfXdXkOLo/bLpXj/T8TiB5o9sDgKQGdAx7nURZmgT
 z7V2yw8Mjxxefy3UoafKXwXXSjCfa5+jlnZsXCe6XXNNP8qAVops8yFJP o=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: Pyb4WEtry9WWIvmHCzgxvLtc5ZA+8ZWIKSIR1ovn/b/BeQF+L58DXldauWP8bNMGRvQHKYJvBe
 qxAl2hUPqRuBe1zXc6/CJD9ntdOHXL3Ifh0BOiXZa0ciW4p3f6KD8PjK6ra5wiYII47rOH9UCr
 89zzjRZYAkaV+iv3NrDhSlpiPwZVXVics8y8ueU7uij/Wt/g6Tol/rCHyGJ/fO08tNbEaKfydG
 AFriAses9eWJ3yTc+RSU+YjEuXTNYcyyJYb8ckfo0nUFmCumw5VNysn+3yCY1005im1/da0Mo2
 PZA=
X-SBRS: 2.7
X-MesageID: 17630810
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17630810"
Subject: Re: use of "stat -"
To: Elliott Mitchell <ehem+xen@m5p.com>, Jason Andryuk <jandryuk@gmail.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
Date: Tue, 12 May 2020 20:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512195005.GA96154@mattapan.m5p.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/05/2020 20:50, Elliott Mitchell wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On Tue, May 12, 2020 at 11:52:25AM -0400, Jason Andryuk wrote:
>> I was just looking to remove perl since it's a large dependency for
>> this single use.  I'm not tied to a particular approach.
> Have you tried to remove Perl from a system?  This is possible, but on
> many systems there will be hundreds or thousands of other programs which
> already cause Perl to be installed.
>
> Perl doesn't have the mindshare it once did, but it is far from dead.  A
> new desktop Linux installation might have less than a hundred programs
> depending on Perl.  A new developer Linux installation will likely have
> hundreds of programs depending on Perl.  A decades old system like Jan
> is testing, there will like thousands.
>
> Removing dependancies is good.  Perhaps this is looking a few years into
> the future where Perl is even less common.

Not everyone has a fully fat Linux running as dom0.  There are real
systems using Xen which have already successfully purged perl.

~Andrew

