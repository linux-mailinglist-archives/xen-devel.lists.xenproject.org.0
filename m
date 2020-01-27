Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19914AB40
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 21:45:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwBEG-00051c-OB; Mon, 27 Jan 2020 20:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ON1B=3Q=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iwBEF-00051X-Fk
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 20:43:27 +0000
X-Inumbo-ID: aac5ccfa-4145-11ea-85bf-12813bfff9fa
Received: from sonic308-9.consmr.mail.ne1.yahoo.com (unknown [66.163.187.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aac5ccfa-4145-11ea-85bf-12813bfff9fa;
 Mon, 27 Jan 2020 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1580157806; bh=HZZWVCp2x/3W/WptEcy3uCZMkQ2ZlKb8p+BhZvWnQlI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=lDamyIN09q96iJQL6v2xtBLVyy+EhFEcSgJO2n3Xi7gwb6Z6QDrVJ4TPp9MgPuXXNlJY1o9FVNpjSAZ0/F06OwTpVRi6JPkK1HJoy94PhmN+28x4hNORQxRxyyovytWT+47SSsR8yBIPbPch3mYsx5zlvR0Q4mYI+rhqGgaKyG4eRoIXZaUZNsy+ROaFQZTIWOUQTDv8JvMyiVm/5mntIfpwISIyqCaO1XAKjCFJJGeq4mTxu2gK4i0m2tLnG1ZRM1o/TSm9zUJX8pacwDP2nnZQS9EIVBjXg/8qcCYA06bMO4rV3VE+llyLsx3+OeURpWQV1MvLoVpZPUJXj2QfRQ==
X-YMail-OSG: t4qw1KkVM1mF3uOtfahtTJgcxGOX.0O2QBfjEO.ba.fuAcXHMJgy2.yW2hmLIsW
 6pooVjXVq.1zPoZazATModooQDZDpeqYMz.NVxpfFTsOF64x3WS.b.CXkQDyzk9hTDgya7Je2_yv
 kgc2a4aDYMZlqp520MM2y_78UgWkK0_Ab3jLJ3.dEf1Vxyzqp34cImBiHN.v8x0lCFFtnBfXeB8v
 z.VlfIqMCSdwNFN4j_vmZCFVaaP6UaOPHfaYpkh9r7pkp2XZPSk0hvDdmaMD.vxQMCpazsfcb3sq
 U3R13L.qpRC2W2ueVxfQFgmJrn5IF2rfN6HaRCtGYyvpwjnKQm3rxV.Ol4AFfOIMMkCLd7vKTv3f
 F3hE9qj3tOyPbCUBfUDbqrmH0SajaUfo7Lh9eymOs5081rOC_AGjEP1_5_JNNzB_uDygcwJ8xi77
 6W6ydmuwutzJ84cbZnHtqiko0Fpz2MnxkDt1pz6CM0CdS85oSyxRZKzp8YMYuXOyvHa2nGobnByt
 _0.KNy7LTY2Rd9ZP0U4KPdmVVA14MuGvr8J3Kip8bERSitX3JLyoMsBZamtb_Kn0diJsMsRzH0A4
 7O37fcTYJOSp.KF08mSczW7l4QKOjvafQKps3dHzCBFd9kO8aT.RotdI..AEDq1mIBOmKXCD5vFh
 JldCl.LuJ_ig4H8_RWSQHX_2WhDdopXzolUxQgw.mStzS1HCS.etp7hmYsP2d9.PGNWcIDJwrbKF
 PxF0uNqPKJbVWuKX8I.LuCuRJKWWBbsOEkxLJT7OE2X.AgCAibk_5EieZbA113tlDscyAX3V8Ge6
 j882W5rFOctZccItFHjeG5zsJwL3KHF5rVgS6tYbYTo433GvSh_RGxce.LY3G.dDkieGIbpFDDtx
 9JvUI9WfQbkFhPVPBMzXcXCrOZrffnztErIk6fVlm7Ls1sw21pCNNpzFp4fB4wRSR9oewd6PQIe9
 UuaQMAg4MGQ74Qk1h0lbeDwANXX_X4q4LVhGp9v350AXQVQRApWAQcnUtT0c.xrZhVaJfoYGLop7
 Nt._BK1PaAom2LRq6S2vkibezgYXZfTBlm_mn3eAiBfeFfOuPotHDZJg2x0.zHKhGpSCjIEa15Sz
 GMtGqB.UgUVliyYKFJGpCqq7XT6KWllQQmuj_KmYH1PDR4lqhsYM44_oSfZPFl6GKc4.EE37wEQ1
 xGNNyf5olAGmbosG7W121NMtZNyIMV3I565TH5Ryfpzmp9NIVL4qcSYkZpRSNo2a6ZLpngsh_fkW
 5Pnyxw8cFgwpxAZm1pNpFZL13jTGEMiFutO34v_5nFx1_60yyimjhL0VkeLiA4FxlYZzfg_wfIOD
 87J2PjEquPh4FW9DEaWFmK.dO2fsgwRLz
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Mon, 27 Jan 2020 20:43:26 +0000
Date: Mon, 27 Jan 2020 20:43:21 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <299023995.1231830.1580157801838@mail.yahoo.com>
In-Reply-To: <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
 <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
MIME-Version: 1.0
X-Mailer: WebService/1.1.15116 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9qZXIsCgo+IFlvdSBjYW4gYWxzbyBzdGFydCB4bCBkZXZkIG1hbnVhbGx5LCBhcyB0aGF0IHdp
bGwgZ2l2ZSB5b3UgdmVyYm9zZQo+IG91dHB1dCBvZiB3aGF0cyBnb2luZyBvbi4gSW4gdGhlIGRy
aXZlciBkb21haW46Cgo+ICMga2lsbGFsbCB4bAo+ICPCoHhsIC12dnYgZGV2ZCAtRgoKPiBUaGF0
IHNob3VsZCBnaXZlIHlvdSBkZXRhaWxlZCBvdXRwdXQgb2Ygd2hhdCdzIGdvaW5nIG9uIGluIHRo
ZSBkcml2ZXIKPiBkb21haW4sIGNhbiB5b3UgcGFzdGUgdGhlIG91dHB1dCB5b3UgZ2V0IGZyb20g
dGhlIGRyaXZlciBkb21haW4gd2hlbgo+IHlvdSB0cnkgdG8gc3RhcnQgdGhlIGZhaWxlZCBndWVz
dD8KCkkgcmFuIGJvdGggY29tbWFuZHMgaW4gdGhlIGRyaXZlciBkb21haW4uIEJlZm9yZSBzdGFy
dGluZyB0aGUgZG9tVSwgSSBnZXQgdGhlIGZvbGxvd2luZyB2ZXJib3NlLgoKIyBzdWRvIHhsIC12
dnYgZGV2ZCAtRgpsaWJ4bDogZGVidWc6IGxpYnhsX2RldmljZS5jOjE3MzM6bGlieGxfZGV2aWNl
X2V2ZW50c19oYW5kbGVyOiBEb21haW4gMDphbyAweDU1NmUzZTk0MGVmMDogY3JlYXRlOiBob3c9
KG5pbCkgY2FsbGJhY2s9KG5pbCkgcG9sbGVyPTB4NTU2ZTNlOTQwYzEwCmxpYnhsOiBkZWJ1Zzog
bGlieGxfZXZlbnQuYzo2MzY6bGlieGxfX2V2X3hzd2F0Y2hfcmVnaXN0ZXI6IHdhdGNoIHc9MHg3
ZmZjYTMzNTQ5ZDggd3BhdGg9L2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQgdG9rZW49My8wOiByZWdp
c3RlciBzbG90bnVtPTMKbGlieGw6IGRlYnVnOiBsaWJ4bF9kZXZpY2UuYzoxNzkwOmxpYnhsX2Rl
dmljZV9ldmVudHNfaGFuZGxlcjogRG9tYWluIDA6YW8gMHg1NTZlM2U5NDBlZjA6IGlucHJvZ3Jl
c3M6IHBvbGxlcj0weDU1NmUzZTk0MGMxMCwgZmxhZ3M9aQpsaWJ4bDogZGVidWc6IGxpYnhsX2V2
ZW50LmM6NTczOndhdGNoZmRfY2FsbGJhY2s6IHdhdGNoIHc9MHg3ZmZjYTMzNTQ5ZDggd3BhdGg9
L2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQgdG9rZW49My8wOiBldmVudCBlcGF0aD0vbG9jYWwvZG9t
YWluLzAvYmFja2VuZApsaWJ4bDogZGVidWc6IGxpYnhsX2V2ZW50LmM6MjIyNzpsaWJ4bF9fbmVz
dGVkX2FvX2NyZWF0ZTogYW8gMHg1NTZlM2U5NDA2MDA6IG5lc3RlZCBhbywgcGFyZW50IDB4NTU2
ZTNlOTQwZWYwCmxpYnhsOiBkZWJ1ZzogbGlieGxfZXZlbnQuYzoxODM4OmxpYnhsX19hb19fZGVz
dHJveTogYW8gMHg1NTZlM2U5NDA2MDA6IGRlc3Ryb3kKCkkga25vdyB0aGlzIGlzIG5vdCBleGFj
dGx5IHdoYXQgeW91IGFza2VkIGZvci4gVW5mb3J0dW5hdGVseSwgSSBkb24ndCBzZWUgYW55IG90
aGVyIHZlcmJvc2Ugd2hlbiB0cnkgdG8gc3RhcnQgRG9tVS4gVGhlIGVycm9yIG1lc3NhZ2VzIEkg
Z2V0IGZyb20gdGhlIGZhaWxlZCBEb21VIGxhdW5jaCBpcyBhcyB0aGUgZm9sbG93aW5nLCB3aGVy
ZSBkcml2ZXIgZG9tYWluIGlkIGlzIDcuCgpsaWJ4bDogZXJyb3I6IGxpYnhsX2RldmljZS5jOjEw
NzU6ZGV2aWNlX2JhY2tlbmRfY2FsbGJhY2s6IERvbWFpbiA4OnVuYWJsZSB0byBhZGQgZGV2aWNl
IHdpdGggcGF0aCAvbG9jYWwvZG9tYWluLzcvYmFja2VuZC92aWYvOC8wCmxpYnhsOiBlcnJvcjog
bGlieGxfY3JlYXRlLmM6MTQ1ODpkb21jcmVhdGVfYXR0YWNoX2RldmljZXM6IERvbWFpbiA4OnVu
YWJsZSB0byBhZGQgbmljIGRldmljZXMKbGlieGw6IGVycm9yOiBsaWJ4bF9kZXZpY2UuYzoxMDc1
OmRldmljZV9iYWNrZW5kX2NhbGxiYWNrOiBEb21haW4gODp1bmFibGUgdG8gcmVtb3ZlIGRldmlj
ZSB3aXRoIHBhdGggL2xvY2FsL2RvbWFpbi83L2JhY2tlbmQvdmlmLzgvMApsaWJ4bDogZXJyb3I6
IGxpYnhsX2RvbWFpbi5jOjEwNzU6ZGV2aWNlc19kZXN0cm95X2NiOiBEb21haW4gODpsaWJ4bF9f
ZGV2aWNlc19kZXN0cm95IGZhaWxlZApsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEwMDM6
bGlieGxfX2Rlc3Ryb3lfZG9taWQ6IERvbWFpbiA4Ok5vbi1leGlzdGFudCBkb21haW4KbGlieGw6
IGVycm9yOiBsaWJ4bF9kb21haW4uYzo5NjI6ZG9tYWluX2Rlc3Ryb3lfY2FsbGJhY2s6IERvbWFp
biA4OlVuYWJsZSB0byBkZXN0cm95IGd1ZXN0CmxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6
ODg5OmRvbWFpbl9kZXN0cm95X2NiOiBEb21haW4gODpEZXN0cnVjdGlvbiBvZiBkb21haW4gZmFp
bGVkCgoKT24gdGhlIG90aGVyIGhhbmQsIGlmIEkgcnVuIGRldmQgaW4gRG9tMCwgSSBnZXQgYSBs
b3Qgb2YgdmVyYm9zZSB3aGVuIEkgdHJ5IHRvIGxhdW5jaCBEb21VLCBkZXBlbmRlbnQgb24gRHJp
dmVyIERvbWFpbiBmb3IgbmV0d29ya2luZy4gSSBhbSBub3Qgc3VyZSBpZiBJIHNob3VsZCBwYXN0
ZSBpdCBoZXJlLiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuCgpUaGFua3MsCk1l
aHJhYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
