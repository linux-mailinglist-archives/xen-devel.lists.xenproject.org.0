Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7B151AB3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 13:47:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyxYV-00028h-K6; Tue, 04 Feb 2020 12:43:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jKxq=3Y=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iyxYT-00028c-HZ
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 12:43:49 +0000
X-Inumbo-ID: fce4b90e-474b-11ea-a933-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fce4b90e-474b-11ea-a933-bc764e2007e4;
 Tue, 04 Feb 2020 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580820229;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=bkHv4LjOuNTPXCcjRGJMwo4XPk98JoNpgcE40U8rcUs=;
 b=IgrVFDaklH9GMyZTattO5BweVAZKr4ywMbHNtCeCLH/E44pyY4HPgPnG
 fz9fjJkKo9FnUTc17rL3kxe3V8B5j+eABMfQY9b4tvSp9Wf6kniTLQHCZ
 X8flLH2G+Bs5My959ubxZp6xnJAQ+lu95ihn3q1ILqvh9pJzIikKedvlm 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0pp5PMsSV1ZdIPOvfVNCi3GBRr3+o8wwKZ1e0VD9efJjs2CUJivI2WnwMR/W9CHM0iLIhqZ+rq
 HBK6OgeKQWZNEpmb498OyWExlsxbcIc0x+9CaY/v+sbSHAJ9IraE5+Zr8CERHqomW0x4kDFe35
 IGsO2bEvby1FCtj5Hmpqa3N6elgEWjZ26hGLLtUPmoxqrGjzTyQNnZupE/060BYmDGPhvejmi2
 cJg1cV+Lt+MPMlfm3sBHaoJOf919AfP0CyZSrEAeVmH1gEAN4TVQAlWzfKRV9HdDTR04YM/0HZ
 ALA=
X-SBRS: 2.7
X-MesageID: 11907209
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="11907209"
To: xen-devel <xen-devel@lists.xenproject.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwA==
Message-ID: <f05dfbe2-74c9-cd57-1b92-4466b1e24d31@citrix.com>
Date: Tue, 4 Feb 2020 12:43:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Community Call: Call for Agenda Items and call details
 for Feb 6 16:00 - 17:00 UTC
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
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 Natarajan Janakarajan <jnataraj@amd.com>, ",
 \"robin.randhawa@arm.com\"" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Robert Townley <rob.townley@gmail.com>, Rian Quinn <rianquinn@gmail.com>,
 Varad Gautam <varadgautam@gmail.com>, Juergen
 Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Paul
 Durrant <pdurrant@amazon.com>, Julien Grall <julien.grall@arm.com>, Jeff
 Kubascik <Jeff.Kubascik@dornerworks.com>, Ji John <john.ji@intel.com>, ",
 Stewart Hildebrand" <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBjb21tdW5pdHkgbWVtYmVycywKCkluIExhcnMnIGFic2VuY2UsIEkgaGF2ZSB2b2x1bnRl
ZXJlZCB0byB0YWtlIG92ZXIgbWFuYWdpbmcgdGhlIENvbW11bml0eQpDYWxsIGZvciBub3cuICBQ
bGVhc2Ugbm90ZSB0aGUgY2hhbmdlIGluIG1lZXRpbmcgSUQuCgpQbGVhc2Ugc2VuZCBtZSBhZ2Vu
ZGEgaXRlbXMgZm9yIHRoaXMgVGh1cnNkYXkncyBjb21tdW5pdHkgY2FsbC4KCkEgZHJhZnQgYWdl
bmRhIGlzIGF0Cmh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9vU2o5ZFNGWTFP
bUh4ZlgwLW9aS21FRkwvCgpQbGVhc2UgYWRkIGFnZW5kYSBpdGVtcyB0byB0aGUgZG9jdW1lbnQg
b3IgcmVwbHkgdG8gdGhpcyBlLW1haWwKCkxhc3QgbW9udGhzJyBtaW51dGVzIGFyZSBhdApodHRw
czovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL3ZpZXcvTHlDSk94MU5aWDNSaDRTMWNFZFFTQy01
a1FXNkFkUWdrOFNsamZMcFRmRS8KCiAtR2VvcmdlIER1bmxhcAoKIyBNZWV0aW5nIERldGFpbHMK
ClBsZWFzZSBqb2luIG15IG1lZXRpbmcgZnJvbSB5b3VyIGNvbXB1dGVyLCB0YWJsZXQgb3Igc21h
cnRwaG9uZS4KCmh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL0dlb3JnZUR1bmxhcAoKWW91IGNhbiBh
bHNvIGRpYWwgaW4gdXNpbmcgeW91ciBwaG9uZS4KKEZvciBzdXBwb3J0ZWQgZGV2aWNlcywgdGFw
IGEgb25lLXRvdWNoIG51bWJlciBiZWxvdyB0byBqb2luIGluc3RhbnRseS4pCgorMSAoNTcxKSAz
MTctMzEyOSAoVW5pdGVkIFN0YXRlcykKLSBPbmUtdG91Y2g6IHRlbDorMTU3MTMxNzMxMjksLDE2
ODY4MjEwOSMKCkFjY2VzcyBDb2RlOiAxNjgtNjgyLTEwOQoKCk1vcmUgcGhvbmUgbnVtYmVyczoK
KEZvciBzdXBwb3J0ZWQgZGV2aWNlcywgdGFwIGEgb25lLXRvdWNoIG51bWJlciBiZWxvdyB0byBq
b2luIGluc3RhbnRseS4pCgorNjEgMiA4MzU1IDEwNTAgKEF1c3RyYWxpYSkKLSBPbmUtdG91Y2g6
IHRlbDorNjEyODM1NTEwNTAsLDE2ODY4MjEwOSMKCis0MyA3IDIwODEgNTQyNyAoQXVzdHJpYSkK
LSBPbmUtdG91Y2g6IHRlbDorNDM3MjA4MTU0MjcsLDE2ODY4MjEwOSMKCiszMiAyOCA5MyA3MDE4
IChCZWxnaXVtKQotIE9uZS10b3VjaDogdGVsOiszMjI4OTM3MDE4LCwxNjg2ODIxMDkjCgorMSAo
NjQ3KSA0OTctOTM5MSAoQ2FuYWRhKQotIE9uZS10b3VjaDogdGVsOisxNjQ3NDk3OTM5MSwsMTY4
NjgyMTA5IwoKKzQ1IDMyIDcyIDAzIDgyIChEZW5tYXJrKQotIE9uZS10b3VjaDogdGVsOis0NTMy
NzIwMzgyLCwxNjg2ODIxMDkjCgorMzU4IDk0MiA3MiAxMDYwIChGaW5sYW5kKQotIE9uZS10b3Vj
aDogdGVsOiszNTg5NDI3MjEwNjAsLDE2ODY4MjEwOSMKCiszMyAxNzAgOTUwIDU5NCAoRnJhbmNl
KQotIE9uZS10b3VjaDogdGVsOiszMzE3MDk1MDU5NCwsMTY4NjgyMTA5IwoKKzQ5IDY5MiA1NzM2
IDczMTcgKEdlcm1hbnkpCi0gT25lLXRvdWNoOiB0ZWw6KzQ5NjkyNTczNjczMTcsLDE2ODY4MjEw
OSMKCiszNTMgMTYgNTcyIDY1MSAoSXJlbGFuZCkKLSBPbmUtdG91Y2g6IHRlbDorMzUzMTY1NzI2
NTEsLDE2ODY4MjEwOSMKCiszOSAwIDIzMCA1NyA4MSA0MiAoSXRhbHkpCi0gT25lLXRvdWNoOiB0
ZWw6KzM5MDIzMDU3ODE0MiwsMTY4NjgyMTA5IwoKKzMxIDIwNyA5NDEgMzc3IChOZXRoZXJsYW5k
cykKLSBPbmUtdG91Y2g6IHRlbDorMzEyMDc5NDEzNzcsLDE2ODY4MjEwOSMKCis2NCA5IDI4MCA2
MzAyIChOZXcgWmVhbGFuZCkKLSBPbmUtdG91Y2g6IHRlbDorNjQ5MjgwNjMwMiwsMTY4NjgyMTA5
IwoKKzQ3IDIxIDkzIDM3IDUxIChOb3J3YXkpCi0gT25lLXRvdWNoOiB0ZWw6KzQ3MjE5MzM3NTEs
LDE2ODY4MjEwOSMKCiszNCA5MzIgNzUgMjAwNCAoU3BhaW4pCi0gT25lLXRvdWNoOiB0ZWw6KzM0
OTMyNzUyMDA0LCwxNjg2ODIxMDkjCgorNDYgODUzIDUyNyA4MzYgKFN3ZWRlbikKLSBPbmUtdG91
Y2g6IHRlbDorNDY4NTM1Mjc4MzYsLDE2ODY4MjEwOSMKCis0MSAyMjUgNDU5OSA3OCAoU3dpdHpl
cmxhbmQpCi0gT25lLXRvdWNoOiB0ZWw6KzQxMjI1NDU5OTc4LCwxNjg2ODIxMDkjCgorNDQgMjAg
MzcxMyA1MDI4IChVbml0ZWQgS2luZ2RvbSkKLSBPbmUtdG91Y2g6IHRlbDorNDQyMDM3MTM1MDI4
LCwxNjg2ODIxMDkjCgpKb2luIGZyb20gYSB2aWRlby1jb25mZXJlbmNpbmcgcm9vbSBvciBzeXN0
ZW0uCkRpYWwgaW4gb3IgdHlwZTogNjcuMjE3Ljk1LjIgb3IgaW5yb29tbGluay5nb3RvLmNvbQpN
ZWV0aW5nIElEOiAxNjggNjgyIDEwOQpPciBkaWFsIGRpcmVjdGx5OiAxNjg2ODIxMDlANjcuMjE3
Ljk1LjIgb3IgNjcuMjE3Ljk1LjIjIzE2ODY4MjEwOQoKCk5ldyB0byBHb1RvTWVldGluZz8gR2V0
IHRoZSBhcHAgbm93IGFuZCBiZSByZWFkeSB3aGVuIHlvdXIgZmlyc3QgbWVldGluZwpzdGFydHM6
IGh0dHBzOi8vZ2xvYmFsLmdvdG9tZWV0aW5nLmNvbS9pbnN0YWxsLzE2ODY4MjEwOQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
