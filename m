Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D311ABCFE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP0yf-0004hk-Fh; Thu, 16 Apr 2020 09:38:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wvvh=6A=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jP0ye-0004he-6t
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 09:38:32 +0000
X-Inumbo-ID: 0852acee-7fc6-11ea-8b6d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0852acee-7fc6-11ea-8b6d-12813bfff9fa;
 Thu, 16 Apr 2020 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587029911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=um4CYpM/aGGIm54gur/4JoCcsorEfvmkqorHGGSv+J8=;
 b=H90mztX7rD570/yiOhFNhjfSPoz/LGEUsmHIRo1xXagOfySlYCMQUXvc
 t28pUNr5lJf/PWU/Naq3WKMllJ5quIvs+xUVtfK+aa3pLT406b3GJhWXN
 jumwtrB9xNb0a2zO6kqlrNvC6HHisONTc62XkqOCUCtYK8fmDEXbMKTQV I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7rhV4FwIG4X8WnGhEXBXNLrLSg8V4FMaFfaw5MmSB0UBMd+cg0mjluospN15akAqQz+vz3kZQ7
 FrL2yEhdtfP6zmBBLQch73DrFzryy/QVfn00TMlPnqOxz7ksyLXDqLlWB0SRTP12FCACrL3rgR
 fsdBkT1eeuqvNIfmA5nzvQAC4hzJ5eF3htKZ3RPfaU4BIDx3ttigVyeHM02glWBEnAkgR0QNPn
 LiUzGxrAvXanN8Sklp+WizGT/O38nxZl5s09YpjN81NKLfe+uaGzpHCdVOn9y8bHZbrBxjz/hY
 pqM=
X-SBRS: 2.7
X-MesageID: 16168094
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="16168094"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] sched: print information about scheduler granularity
Thread-Topic: [PATCH] sched: print information about scheduler granularity
Thread-Index: AQHWE8nCYlq/J4KoL0iU4gkSoIElX6h7UR4AgAAWygD///EBAIAAEwaA
Date: Thu, 16 Apr 2020 09:38:27 +0000
Message-ID: <1587029894464.80479@citrix.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <996ed66e-3782-5187-a804-9291741a2241@suse.com>
 <1587028832608.72974@citrix.com>
 <bd38c4da-b982-0d13-bdbd-ab363dae68e0@suse.com>
In-Reply-To: <bd38c4da-b982-0d13-bdbd-ab363dae68e0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <38FD14541B61304BAFABA8E3DBB18EC4@citrix.com>
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

On 16/04/2020 10:25, J=FCrgen Gro=DF wrote:=0A=
> On 16.04.20 11:20, Sergey Dyasli wrote:=0A=
>> On 16/04/2020 09:57, J=FCrgen Gro=DF wrote:=0A=
>>> On 16.04.20 10:33, Sergey Dyasli wrote:=0A=
>>>> Currently it might be not obvious which scheduling mode is being used=
=0A=
>>>> by the scheduler. Alleviate this by printing additional information=0A=
>>>> about the selected granularity. Messages now look like these:=0A=
>>>>=0A=
>>>> 1. boot=0A=
>>>> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler (credit=
) in core-scheduling mode=0A=
>>>>=0A=
>>>> 2. xl debug-keys r=0A=
>>>> (XEN) [=A0=A0 45.914314] Scheduler: SMP Credit Scheduler (credit) in 2=
-way core-scheduling mode=0A=
>>>>=0A=
>>>> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>=0A=
>>>=0A=
>>> Hmm, do we need that?=0A=
>>>=0A=
>>> The xen commandline ins part of the boot messages and is contained=0A=
>>> in the "xl info" output.=0A=
>>=0A=
>> It's true that you can see "sched-gran=3Dcore" in "xl info" output. But =
that's=0A=
>> just the switch - not the end result. A user might want to verify that h=
e did=0A=
>> everything correctly and core-scheduling mode has indeed been enabled.=
=0A=
> =0A=
> I'm planning to add this information in the pending hypfs (per cpupool).=
=0A=
=0A=
hypfs is certainly nice, but I doubt it'll be available for Xen 4.13.=0A=
=0A=
> I'm not opposed to your patch, but as soon as we have per-cpupool=0A=
> granularity it should be reverted again.=0A=
=0A=
"xl debug-keys r" already prints the granularity information per cpupool.=
=0A=
It's just opt_sched_granularity is currently a single global variable. Once=
=0A=
per-cpupool granularity is implemented, sched_gran_str() should simply gain=
=0A=
granularity as a parameter.=0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=
=0A=

