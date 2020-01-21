Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC01442AB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:00:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwpA-0007hk-NK; Tue, 21 Jan 2020 16:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pNJr=3K=steadfast.net=kevin@srs-us1.protection.inumbo.net>)
 id 1itwp8-0007hf-KU
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:56:18 +0000
X-Inumbo-ID: f13273cc-3c6e-11ea-b833-bc764e2007e4
Received: from staffmx.steadfast.net (unknown [2607:f128::6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f13273cc-3c6e-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 16:56:17 +0000 (UTC)
Received: from staffmx.steadfast.net (localhost [IPv6:::1])
 by staffmx.steadfast.net (Postfix) with ESMTPS id C79F014807BC
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 10:56:15 -0600 (CST)
Received: from localhost (localhost [IPv6:::1])
 by staffmx.steadfast.net (Postfix) with ESMTP id AEEA414807BD
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 10:56:15 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 staffmx.steadfast.net AEEA414807BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steadfast.net;
 s=EEBF4A38-4631-11E7-97AD-3B7F97C5FFE7; t=1579625775;
 bh=hSKeJvQxKeACMIZouktN3gMx68b6uL9X3aSQTdLNmTg=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=IAfwhTGywy5g0sW7V8oDWzZLUj0vLhBiyABCITMglV1xTG5ZieyEAgoNv3NiMPctA
 OPa+v9UPSDxAb5gkRJyZtBlOO/o4UXsAOP61deN3gDbf1QqF92d7HCHQxNaPxlCNo0
 cAnxwWf7rDmL7j4Mzh5Mb6tAVY6gSVhUu9194u0xV/Mvp3euvPGmpQNkm25q8WsD8a
 nWnRUOCVbSl7hoLnpxmzLjufSGGsBcYRb9JWCTVzDTJJMrLA+qcaUcB4G+GcP6Wq3i
 Dcx9uTNejDzXXJyXSvHyXWbDa8wpxBcrzuZL1Uhv8Xl1OGkVXdTGofJAAAQEmN/Mq+
 MBlwxNzXdWNtA==
X-Virus-Scanned: amavisd-new at steadfast.net
Received: from staffmx.steadfast.net ([IPv6:::1])
 by localhost (staffmx.steadfast.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id AujOHakqRGXR for <xen-devel@lists.xenproject.org>;
 Tue, 21 Jan 2020 10:56:15 -0600 (CST)
Received: from ziyal.office.steadfast.net (unknown [IPv6:2607:f128:0:2::100e])
 by staffmx.steadfast.net (Postfix) with ESMTPSA id 79B8E14807BC
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 10:56:15 -0600 (CST)
To: xen-devel <xen-devel@lists.xenproject.org>
From: Kevin Stange <kevin@steadfast.net>
Autocrypt: addr=kevin@steadfast.net; prefer-encrypt=mutual; keydata=
 mQGiBEHoVBYRBACgNUrSLbbGAzxmsG5nd5KNoJXVwD8/FgxiYweLHrCHGrGEruEuknqoRFGs
 0SBLBLQuZjeO+KUtgTV6T+xLIoJgrDPHmhU0qYZZj8WUM3Dg+tt15eD58BRt/OltMdWPUXwy
 lzGTZhCrHFFeo1H1YseweI6b7QEuroklHrDWWPt3IwCgn5mlOVyUhjwqanaCYgbzdrWNZGcD
 /iXOCfRfAJpUhP7GxA4JB8vpSkxZETQxhpa+mNtqbnq1oJyNgONj56x7jbGOAmnjfazG68cJ
 kRxQ7t4J1A1QkjogeHrKgAPE7p6MCQs/h0cGHaj52VxOcw3fTKZxxW7JiuOjKmdqn/jSnVlN
 OGEm4PM02pEhc/otWf80TxHHbiCxBACSZZz5p43Kq3kTbTbW+gnNcL6Je7mNvKW7qUthBvmv
 HzU5wERvaGgEii76hA8CNXuMmOp00H98iJh5mgfzI3+1gO9HJjFuA9sg04eAKTcRNruW7lYF
 X6pGffEdeogM+bxm7mcbegyBVvWdGP7K3WKC50Vmjkn7mxSJxnA4vIcdQ7Q3S2V2aW4gU3Rh
 bmdlIChTdGVhZGZhc3QgTmV0d29ya3MpIDxrZXZpbkBzdGVhZGZhc3QubmV0PohfBBMRAgAf
 AhsDAh4BAheABQJIwdxjBgsJCAcDAgQVAggDAxYCAQAKCRCR38Gh4qODSNfdAJ9bOiF7IrIm
 R0q8Wb4o0SJqw45m5gCfWukZU6ScRP9xU1CuQnQ8rCqtVvW5Ag0EQehUGxAIALNp0GIzBv1n
 nILS1pBoQntIl+Q7Ey/K7UUvbOOPfDoa67YZRCq7Qlf8MwNRUZFmZkm3aEHjZn77JqBA4FKa
 MRGoEjXDgaNL4aAAo14OrexgomogU6TQk1yPNmcY0ImFDdVn8Pm7G21hcwgiDnO7cy4yNcyf
 6pnL82j0cOWifeJlPU9Tu0jf2iXrd6sYLxRlFL0JrvzNhjcC200TK9RHObsNnsVSQGTjRrb+
 pyAIG4LT98cWNj6jsRAotMxN1Rlm9GfK/I3okBC3Wu4qiWgNwdadrrM4rh28de/p22QyaXjk
 XKfRDhwFw7DbBHBY+o58QQTyy24VsDGbOt57fyvCmz8AAwUH/AhoYm0tGUm3td2Gk+wx3FUK
 7TDL8Jt65TAYBMFwk70PCEgKBJdJ0MKdnCmW5qhzuPkT2iexIYhj5RUHayqPz9NWegSHCDjy
 Du1ozxns3rTAzAGIqGmPnuhndv7GyqJksmHFqTouOmqNVQzqGtC6eI1zpf+R+LWqHYzknS3x
 7cw67eMgXO8x15lKSnK4oCmGoG6/69lthouwFJAwztUW/Iy6wPHShhEDAYyIdZcG5c4cFG4M
 Blb1rt3neJiUQfjrciRw/lEWKSoxGDZzxS0qA849IW4rfJkKyOPPSaH0ZrRsTq3M4AdcA42v
 1Fm2/B9k1Je97ZP0PVW3hiVUv0q5VFqISQQYEQIACQUCQehUGwIbDAAKCRCR38Gh4qODSKp1
 AKCY44btwb7f/4c4Ne0G3OEGTpdXEACeJ3XO66Ly3snOfSDddcnYDvzTykE=
Organization: Steadfast
Message-ID: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
Date: Tue, 21 Jan 2020 10:56:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] libvirt support for scheduler credit2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGxvb2tlZCBhcm91bmQgYSBiaXQgYW5kIHdhc24ndCBhYmxlIHRvIGZpbmQgYSBnb29k
IGFuc3dlciB0byB0aGlzLCBzbwpHZW9yZ2Ugc3VnZ2VzdGVkIEkgYXNrIGhlcmUuCgpTaW5jZSBY
ZW4gNC4xMiwgY3JlZGl0MiBpcyB0aGUgZGVmYXVsdCBzY2hlZHVsZXIsIGJ1dCBhdCBsZWFzdCBh
cyBvZgpsaWJ2aXJ0IDUuMS4wIHZpcnNoIGRvZXNuJ3QgYXBwZWFyIHRvIHVuZGVyc3RhbmQgY3Jl
ZGl0MiBhbmQgcHJvZHVjZXMKdGhpcyBzb3J0IG9mIG91dHB1dDoKCiMgeGwgc2NoZWQtY3JlZGl0
MiAtZCB5dzZoazdtbzZ6eTNrOApOYW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
RCBXZWlnaHQgIENhcAp5dzZoazdtbzZ6eTNrOCAgICAgICAgICAgICAgICAgICAgICAgNCAgICAg
MTAgICAgMAojIHZpcnNoIHNjaGVkaW5mbyB5dzZoazdtbzZ6eTNrOApTY2hlZHVsZXIgICAgICA6
IGNyZWRpdDIKCkNvbXBhcmVkIHRvIGEgaG9zdCBydW5uaW5nIGNyZWRpdDoKCiMgeGwgc2NoZWQt
Y3JlZGl0IC1kIGd2ejJiMTZzcTM4ZHY5Ck5hbWUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIElEIFdlaWdodCAgQ2FwCmd2ejJiMTZzcTM4ZHY5ICAgICAgICAgICAgICAgICAgICAgIDE0
ICAgIDgwMCAgICAwCiMgdmlyc2ggc2NoZWRpbmZvIGd2ejJiMTZzcTM4ZHY5ClNjaGVkdWxlciAg
ICAgIDogY3JlZGl0CndlaWdodCAgICAgICAgIDogODAwCmNhcCAgICAgICAgICAgIDogMAoKVHJ5
aW5nIHRvIGNoYW5nZSB0aGUgd2VpZ2h0IGRvZXMgbm90aGluZywgbm90IGV2ZW4gcHJvZHVjaW5n
IGFuIGVycm9yCm1lc3NhZ2U6CgojIHZpcnNoIHNjaGVkaW5mbyBzeXV4cGxzbWRpaGN3YyAtLXdl
aWdodCAzMDAKU2NoZWR1bGVyICAgICAgOiBjcmVkaXQyCgojIHhsIHNjaGVkLWNyZWRpdDIgLWQg
c3l1eHBsc21kaWhjd2MKTmFtZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSUQgV2Vp
Z2h0ICBDYXAKc3l1eHBsc21kaWhjd2MgICAgICAgICAgICAgICAgICAgICAgMjMgICAgNDAwICAg
IDAKCklzIHRoZXJlIGEgdmVyc2lvbiBvZiBsaWJ2aXJ0IHdoZXJlIEkgY2FuIGV4cGVjdCB0aGlz
IHRvIHdvcmssIG9yIGlzIGl0Cm5vdCBzdXBwb3J0ZWQgeWV0PyAgQXMgYSB3b3JrYXJvdW5kIGZv
ciBub3cgSSd2ZSBhZGRlZCBzY2hlZD1jcmVkaXQgdG8KbXkgY29tbWFuZCBsaW5lLCBidXQgaXQg
d291bGQgYmUgbmljZSB0byBnYWluIHRoZSBiZW5lZml0cyBvZiBpbXByb3ZlZApzY2hlZHVsaW5n
IGF0IHNvbWUgcG9pbnQuCgotLSAKS2V2aW4gU3RhbmdlCkNoaWVmIFRlY2hub2xvZ3kgT2ZmaWNl
cgpTdGVhZGZhc3QgfCBNYW5hZ2VkIEluZnJhc3RydWN0dXJlLCBEYXRhY2VudGVyIGFuZCBDbG91
ZCBTZXJ2aWNlcwo4MDAgUyBXZWxscywgU3VpdGUgMTkwIHwgQ2hpY2FnbywgSUwgNjA2MDcKMzEy
LjYwMi4yNjg5IFgyMDMgfCBGYXg6IDMxMi42MDIuMjY4OAprZXZpbkBzdGVhZGZhc3QubmV0IHwg
d3d3LnN0ZWFkZmFzdC5uZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
