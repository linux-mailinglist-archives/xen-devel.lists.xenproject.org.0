Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B814B54
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 15:54:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNe1f-00067x-Aw; Mon, 06 May 2019 13:51:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9nwL=TG=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hNe1d-00067s-Es
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 13:51:25 +0000
X-Inumbo-ID: 096a86c8-7006-11e9-843c-bc764e045a96
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 096a86c8-7006-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 13:51:24 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id b17so2355499oie.8
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=CbF3/zuHU1pC51BYhpL5V2k7uY6tJU/FvDpZsTWLgI0=;
 b=iUak3JxdcDRZjzGgqUSWjQuEHQvOzn7Y2CYbNVzjdKHlR8JnNefp6ENTTZnxy1nlZc
 HZyaX97jUqMu8WnbNPUeInM0L5aOhGs6WtMNiI4nTJBUGBxK14xqt9dwf7UmqFljoI0P
 I6KlTqkTzy1s7MOAD0Kk0oz0W0aw8N9hqSDeqzpBZbpxSMbHU8zXuBFLBx25xT8LRkYa
 84eBI1tl3UPm1p+n4NjV4gIanJpuj0G9vbVnu9WkUeDn0k+STDfYdXMWg2uH1k2of6x/
 ZXbU1BtvUybHvbV6dgq53KfwjNDDnk08JG+s0mvZTHN0WASCch29Gs9RUTM9LLfhTwNt
 w8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=CbF3/zuHU1pC51BYhpL5V2k7uY6tJU/FvDpZsTWLgI0=;
 b=UccyNtSPBG7/aeB8OiNfDC1g5hpp4pl/xc80rwipF63Qlkm660h/dLJ0FAV30eML9+
 W+wSM5I7hoxthfuu6bbzM0sA0c/fns+mvYFgyNXjFhhzcwqBAm0fz6LqiqMPuixuiDOV
 Q3Qv24yRekYcT64u854ICxx/XScbRl2nIkYQysNWN3w1YZXrxaN5u5c2S0tcvA3dXJQg
 DzrKu8Dv3R9jO4ymXJouze3nWNyLHcfD8elMzB93iYAEkWvj9s+VWaJsc5oSkJhlkZl4
 wzlSldgTC+VYhmSSOaN9qQNOZYOEBdWh08rbgOApqEKdAQh0KauF7+S8Jd/5ktngzgz2
 z+6w==
X-Gm-Message-State: APjAAAUty/Bpz2pVMiJAfgkCiYs/qRr86OWb6sr84N2dI3NmeDHyEHIk
 9NCvVrcS/6bHMX74p3NjWNSqf09j
X-Google-Smtp-Source: APXvYqxwgz7DdCexuz8a38nnJSVbxNN/xkEZkUXn/Lfc7SjBBF5+faSjX/PMGmoz9DoRMqnNbbXxRA==
X-Received: by 2002:aca:bf07:: with SMTP id p7mr1123649oif.140.1557150682901; 
 Mon, 06 May 2019 06:51:22 -0700 (PDT)
Received: from [10.0.1.38] ([152.231.170.171])
 by smtp.gmail.com with ESMTPSA id g21sm1038073otj.25.2019.05.06.06.51.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 06:51:22 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <3BB17B7E-8CC6-4CEE-9A6C-1AA68EB503F3@xenproject.org>
Date: Mon, 6 May 2019 07:51:17 -0600
To: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: [Xen-devel] [ANNOUNCE] Xen Project Community Call May 9th @15:00
 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, "Natarajan, Janakarajan" <jnataraj@amd.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKUGxlYXNlIHByb3Bvc2UgdG9waWNzIGJ5IGVpdGhlciBlZGl0aW5nIHRoZSBydW5u
aW5nIGFnZW5kYSBkb2N1bWVudCBhdCBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9k
LzFrdE4tNXU4dVNjRXZoZjlOOFVtNW82cG9GMTJsVkVubnlTSEp3XzdKazhrL2VkaXQjIG9yIGJ5
IHJlcGx5aW5nIHRvIHRoZSBtYWlsLiBJZGVhbGx5IGJ5IFdlZG5lc2RheSEKCkJlc3QgUmVnYXJk
cwpMYXJzCgo9PSBEaWFsLWluIEluZm9ybWF0aW9uID09CgogIyMgTWVldGluZyB0aW1lCiAxNTow
MCAtIDE2OjAwIFVUQwogRnVydGhlciBJbnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IApodHRw
czovL3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3ll
YXI9MjAxOSZtb250aD01JmRheT05JmhvdXI9MTUmbWluPTAmc2VjPTAmcDE9MjI1JnAyPTIyNCZw
Mz0yNCZwND0xNzkmcDU9MTM2JnA2PTM3JnA3PTMzCgogIyMgRGlhbCBpbiBkZXRhaWxzCiBXZWI6
IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL2xhcnNrdXJ0aAoKIFlvdSBjYW4gYWxzbyBkaWFsIGlu
IHVzaW5nIHlvdXIgcGhvbmUuCiBBY2Nlc3MgQ29kZTogOTA2LTg4Ni05NjUKCiBDaGluYSAoVG9s
bCBGcmVlKTogNDAwOCA4MTEwODQKIEdlcm1hbnk6ICs0OSA2OTIgNTczNiA3MzE3CiBQb2xhbmQg
KFRvbGwgRnJlZSk6IDAwIDgwMCAxMTI0NzU5CiBVbml0ZWQgS2luZ2RvbTogKzQ0IDMzMCAyMjEg
MDA4OAogVW5pdGVkIFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkKCiBNb3JlIHBob25lIG51bWJl
cnMKIEF1c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0CiBBdXN0cmlhOiArNDMgNyAyMDgxIDU0MjcK
IEFyZ2VudGluYSAoVG9sbCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUKIEJhaHJhaW4gKFRvbGwgRnJl
ZSk6IDgwMCA4MSAxMTEKIEJlbGFydXMgKFRvbGwgRnJlZSk6IDggODIwIDAwMTEgMDQwMAogQmVs
Z2l1bTogKzMyIDI4IDkzIDcwMTgKIEJyYXppbCAoVG9sbCBGcmVlKTogMCA4MDAgMDQ3IDQ5MDYK
IEJ1bGdhcmlhIChUb2xsIEZyZWUpOiAwMDgwMCAxMjAgNDQxNwogQ2FuYWRhOiArMSAoNjQ3KSA0
OTctOTM5MQogQ2hpbGUgKFRvbGwgRnJlZSk6IDgwMCAzOTUgMTUwCiBDb2xvbWJpYSAoVG9sbCBG
cmVlKTogMDEgODAwIDUxOCA0NDgzCiAgQ3plY2ggUmVwdWJsaWMgKFRvbGwgRnJlZSk6IDgwMCA1
MDA0NDgKIERlbm1hcms6ICs0NSAzMiA3MiAwMyA4MgogRmlubGFuZDogKzM1OCA5MjMgMTcgMDU2
OAogRnJhbmNlOiArMzMgMTcwIDk1MCA1OTQKIEdyZWVjZSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0
MTQgMzgzOAogSG9uZyBLb25nIChUb2xsIEZyZWUpOiAzMDcxMzE2OQogSHVuZ2FyeSAoVG9sbCBG
cmVlKTogKDA2KSA4MCA5ODYgMjU1CiBJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNAogSW5k
aWEgKFRvbGwgRnJlZSk6IDE4MDAyNjY5MjcyCiBJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAwNyA4
MDMgMDIwIDUzNzUKIElyZWxhbmQ6ICszNTMgMTUgMzYwIDcyOAogSXNyYWVsIChUb2xsIEZyZWUp
OiAxIDgwOSA0NTQgODMwCiBJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxCiBKYXBhbiAoVG9sbCBG
cmVlKTogMCAxMjAgNjYzIDgwMAogS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAwMDc5
OCAxNCAyMDcgNDkxNAogTHV4ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4CiBNYWxheXNp
YSAoVG9sbCBGcmVlKTogMSA4MDAgODEgNjg1NAogTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4MDAg
NTIyIDExMzMKIE5ldGhlcmxhbmRzOiArMzEgMjA3IDk0MSAzNzcKIE5ldyBaZWFsYW5kOiArNjQg
OSAyODAgNjMwMgogTm9yd2F5OiArNDcgMjEgOTMgMzcgNTEKIFBhbmFtYSAoVG9sbCBGcmVlKTog
MDAgODAwIDIyNiA3OTI4CiBQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMwogUGhpbGlwcGlu
ZXMgKFRvbGwgRnJlZSk6IDEgODAwIDExMTAgMTY2MQogUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgw
MCA4MTkgNTc1CiBSb21hbmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5CiBSdXNzaWFuIEZl
ZGVyYXRpb24gKFRvbGwgRnJlZSk6IDggODAwIDEwMCA2MjAzCiBTYXVkaSBBcmFiaWEgKFRvbGwg
RnJlZSk6IDgwMCA4NDQgMzYzMwogU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMwog
U291dGggQWZyaWNhIChUb2xsIEZyZWUpOiAwIDgwMCA1NTUgNDQ3CiBTcGFpbjogKzM0IDkzMiA3
NSAyMDA0CiBTd2VkZW46ICs0NiA4NTMgNTI3IDgyNwogU3dpdHplcmxhbmQ6ICs0MSAyMjUgNDU5
OSA3OAogVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0CiBUaGFpbGFuZCAoVG9sbCBG
cmVlKTogMDAxIDgwMCAwMTEgMDIzCiBUdXJrZXkgKFRvbGwgRnJlZSk6IDAwIDgwMCA0NDg4IDIz
NjgzCiBVa3JhaW5lIChUb2xsIEZyZWUpOiAwIDgwMCA1MCAxNzMzCiBVbml0ZWQgQXJhYiBFbWly
YXRlcyAoVG9sbCBGcmVlKTogODAwIDA0NCA0MDQzOQogVXJ1Z3VheSAoVG9sbCBGcmVlKTogMDAw
NCAwMTkgMTAxOAogVmlldCBOYW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODEKCiBGaXJzdCBHb1Rv
TWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hlY2s6CiBodHRwczovL2xpbmsuZ290
b21lZXRpbmcuY29tL3N5c3RlbS1jaGVjawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
