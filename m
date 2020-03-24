Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541281910FB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 14:37:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGjhH-0003s4-Di; Tue, 24 Mar 2020 13:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aUdW=5J=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jGjhF-0003rz-E5
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 13:34:21 +0000
X-Inumbo-ID: 29ffadaa-6dd4-11ea-83fc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29ffadaa-6dd4-11ea-83fc-12813bfff9fa;
 Tue, 24 Mar 2020 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585056859;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=QQt6Op0m/oPcNptUxnjP06pk6N31FQ2vdZvTg7xbqG8=;
 b=MoPcvQi4Jem/LiLevr2o4TRwkkWl2EYTIVslWrihT1P+PCLeaDQA0hPV
 J8BrErxfmrvrfbjEIu4k0j09HTQ3LcdqG8b5X5cJpXv5VZYkLYD6YJGYC
 xTNznUp+3p6eooHmH0EAiwIKvDhCuLVUsevC6nuwhTmWhEyyvrK2MJ7yk 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /0iq+qBKxK0Vyc6GayxAKZhuG3JWQkeqtcWSxPLW4xi7wJHEuYTNNR65dFApnsChNgWj7AckWP
 YygaiTE3DyL5GWxm+5/Awg+eVs5tzAlbkzX1wPsE3IJ4G+tfQ4peEoHPakOFU7ZSfsMc+oWHiB
 jAGzOmMG8iLyvoY34gscBClRM0FUOUCvyNygXlO8pCyXAuf2fOrffkf9boaiN6X69//LwVGN8l
 10ohycyb29iricXJk7WCFFITNKD2OIzJhnFHXUXhQ9kS5jD2gGtTQXJXPQr8jcixFoMpD5lvtc
 5ts=
X-SBRS: 2.7
X-MesageID: 14871615
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14871615"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: Juergen Gross <jgross@suse.com>
Thread-Topic: xl vcpu-pin peculiarities in core scheduling mode
Thread-Index: AQHWAeCK3r7vam37nES8NI2pgDlwlA==
Date: Tue, 24 Mar 2020 13:34:15 +0000
Message-ID: <1585056853121.58010@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1473.004)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <983438DE8824114F8DCE3B8C34BA60A3@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: [Xen-devel] xl vcpu-pin peculiarities in core scheduling mode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,=0A=
=0A=
I've notived there is no documentation about how vcpu-pin is supposed to wo=
rk=0A=
with core scheduling enabled. I did some experiments and noticed the follow=
ing=0A=
inconsistencies:=0A=
=0A=
  1. xl vcpu-pin 5 0 0=0A=
     Windows 10 (64-bit) (1)              5     0    0   -b-    1644.0  0 /=
 all=0A=
     Windows 10 (64-bit) (1)              5     1    1   -b-    1650.1  0 /=
 all=0A=
                                                     ^                  ^=
=0A=
     CPU 1 doesn't match reported hard-affinity of 0. Should this command s=
et=0A=
     hard-affinity of vCPU 1 to 1? Or should it be 0-1 for both vCPUs inste=
ad?=0A=
=0A=
=0A=
  2. xl vcpu-pin 5 0 1=0A=
     libxl: error: libxl_sched.c:62:libxl__set_vcpuaffinity: Domain 5:Setti=
ng vcpu affinity: Invalid argument=0A=
     This is expected but perhaps needs documenting somewhere?=0A=
=0A=
=0A=
  3. xl vcpu-pin 5 0 1-2=0A=
     Windows 10 (64-bit) (1)              5     0    2   -b-    1646.7  1-2=
 / all=0A=
     Windows 10 (64-bit) (1)              5     1    3   -b-    1651.6  1-2=
 / all=0A=
                                                     ^                  ^^^=
=0A=
     Here is a CPU / affinity mismatch again, but the more interesting fact=
=0A=
     is that setting 1-2 is allowed at all, I'd expect CPU would never be s=
et=0A=
     to 1 with such settings.=0A=
=0A=
Please let me know what you think about the above cases.=0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=

