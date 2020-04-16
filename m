Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783661ABCB3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP0hZ-0003bZ-FR; Thu, 16 Apr 2020 09:20:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wvvh=6A=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jP0hX-0003b2-4o
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 09:20:51 +0000
X-Inumbo-ID: 8f533523-7fc3-11ea-8b6a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f533523-7fc3-11ea-8b6a-12813bfff9fa;
 Thu, 16 Apr 2020 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587028850;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MZ/72IIf4ZOogYqkPGju9A5rEBvyFOlbgvjO5ryjWfg=;
 b=P6Sx+PvCeSA0JT+uMM4te0Th/mF0tavV8cnSENJmgokIoU94lEYwdeCp
 U11OYmyMU6aXHgZXAnwtyGq64RW9XYDTW4dn7uvEiF4iN0c+Rx5NxxiLn
 ao62Xw98wWchJOweHe1rCqa94YE2qvBrhUYv3ChOaMJxWyHX18jCZJBum Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1b7aK2QxUkoXgCS3e9fw3AfcRnXNB2p6iUum9NTnGdPwnTFtNpoNZyfn/doYkjN5fWpzlta7sI
 J0y+ioLQEDR1NrH0+PTQXwTZOp7hLeRC9SS55d5q61UYnCAo158tyb/ZXpbr4uxUIxM/aV9OQo
 sZZjwC9b4/4EX9+IqX/Q7IPfbxeidcgiXISvbABYp3c4bgXrr4bLkXMbxVd/dYte0mpkUHHFqP
 Bfr8dfRVVcn1CtNVv4iNeWrROQRXi7jZRbNzMVtO24r6qj3DXkhdwkELkLNGP37/OzdIZBiGY6
 2Ys=
X-SBRS: 2.7
X-MesageID: 15780082
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="15780082"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] sched: print information about scheduler granularity
Thread-Topic: [PATCH] sched: print information about scheduler granularity
Thread-Index: AQHWE8nCYlq/J4KoL0iU4gkSoIElX6h7UR4AgAAWygA=
Date: Thu, 16 Apr 2020 09:20:45 +0000
Message-ID: <1587028832608.72974@citrix.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <996ed66e-3782-5187-a804-9291741a2241@suse.com>
In-Reply-To: <996ed66e-3782-5187-a804-9291741a2241@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <87E26F5B6704684C9B6C1280419A4926@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 09:57, J=FCrgen Gro=DF wrote:=0A=
> On 16.04.20 10:33, Sergey Dyasli wrote:=0A=
>> Currently it might be not obvious which scheduling mode is being used=0A=
>> by the scheduler. Alleviate this by printing additional information=0A=
>> about the selected granularity. Messages now look like these:=0A=
>>=0A=
>> 1. boot=0A=
>> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler (credit) =
in core-scheduling mode=0A=
>>=0A=
>> 2. xl debug-keys r=0A=
>> (XEN) [=A0=A0 45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-w=
ay core-scheduling mode=0A=
>>=0A=
>> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>=0A=
> =0A=
> Hmm, do we need that?=0A=
> =0A=
> The xen commandline ins part of the boot messages and is contained=0A=
> in the "xl info" output.=0A=
=0A=
It's true that you can see "sched-gran=3Dcore" in "xl info" output. But tha=
t's=0A=
just the switch - not the end result. A user might want to verify that he d=
id=0A=
everything correctly and core-scheduling mode has indeed been enabled.=0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=
=0A=

