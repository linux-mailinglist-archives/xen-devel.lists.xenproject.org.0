Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB6DA1C6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 00:51:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKs4Z-0002ij-LB; Wed, 16 Oct 2019 22:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E4Dc=YJ=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iKs4X-0002ie-EN
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 22:47:13 +0000
X-Inumbo-ID: e45bf69a-f066-11e9-93be-12813bfff9fa
Received: from sonic304-22.consmr.mail.ne1.yahoo.com (unknown [66.163.191.148])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e45bf69a-f066-11e9-93be-12813bfff9fa;
 Wed, 16 Oct 2019 22:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571266031; bh=7TszjDTxSnDvlyS6r+A7GLvKTc7VMUhQqFTVFqu0oRU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=Ow56DAhatQ2j1XyYYDBjw2yrMJSO0yEsdH0uOqsVhtS/rGTUgfrShitND8LH+GCjk4JjPhhMreV7QDDH2xAjdmK6xYKIwbS4ZOkwu56mYm6mINVIYnVYe0StOt6592iLW0Wo79JV1mBBnYaReek57gHupGN7DQwkTdeWpiULTQngH/2RJo9zXdor1/cbD4/qHzynXtJc884lX0JbcDCYWxsfoWTrFpkf1tuJ4ke1A8PaqC5CGhh8sfacfASrg6j2lWroKJRlNjyZRnmMQaxNFRTe91GynECbEbv2eAbvKIlBSSBd0NLNUNaacuBBFnnyd5vbvbEM719/Q8AbDnV5DQ==
X-YMail-OSG: ld7MHpIVM1nJFkmu8yAPe32Qo8ZWFJa2u6z2XZDcHTGmBN_W7FXNHfMLPgdEh3K
 wpNB32ILe_tnD1FSsbJUp6PNudasAU9YR_JXdi1uDTS8vrV4Z2sipp6wHOLLpuwwsDH8i9ZNFymT
 t3uBDwQWnm9cNw92Hs357e_Lp.6Q0XeLi4oEyMufF8259BR3Se0lehiOkWHKdl1m52VRW9xehvV0
 IpPV6Y3H16GiqJRzP_RVb86QoIzlhAqp_er2AidtiEvpdENYBaKEqtmlR758AIElEawpYYNU3tjl
 sG7uEt45ukWsgeevIRSPjA03..yTSMZZpcUbMa6HcOClLDLOERzzQFmvNURrCCMFmVxkkHv_yyzR
 _KVvs6n.PJ09wDRhFw45z12YfZQWcEewV7mNH7f6PzBoe6GWn4BD79SM4EUK619vRSm.AQ_H2gSE
 ndPNNCPMBf8NVzVgxoghJW5w0nhCKYxbAOmEXn0_yKJE9Z5.BXQCAXYdYrLXXoqJPEhEb17ppG.l
 kgXKkuObIFg4oBXrZkyn72RIjOYKCFlBSs8IDmfVuMOrBbxI0K_5O_EJZPZ5KG59DifTLhlE9zyG
 RZbuDXcpD1uxMSC2jx_uGpmtR7MTBKJgc5mgcv_PC2fEdPj5g8iYJQDFspaPE36fsI1r8NEd37Cd
 RZiyamKxeqcHGTBwrTMDqxedBBE2NWjlQexX8N0.Vg1jCC6UAdo4I8CDOKO8Loow55HaV48JRoNn
 _v32EpNUUl5PuW1vVhyAjM4EP2PbbVZIuOqlsgV7Eu9cSedL0UkNYPpoPP74SnCVGT9NGFo.1i2z
 mLhQ2Tb3IE62Q_eVCDtYabCCIgNhwJ1.tvZfUgOc04lChWAtOBTZv6UNxKV3E6Yp2l2bTyvFaSA8
 vTbPIdfP04Snob62DZErlWnGVuPZkEZhvw0N7qdX..ct_.iI9e.1bfKlujCSDQP8LT9vO1cqTEIg
 l9e_hMVxNs.3viSHFYfIXkHGzLlRhmHwVg2MVUgA0z25vdrNSZxGXGBwU8tpHJrjdzWgDELFw20M
 hJE2c709O6PQmwGqsnXuGVd8QUyr_OFmQt5u9MKFJLmrOxpP6b5LsnoEhe4PAgX0RQPLkwFo0YnH
 XWTPZWJeF5UE9MWb2dADGQtsLx7XTtdQRnZkBLqvd5CjggHxj5aTebKKRHHffBqlOqZtXT2S_NMz
 k4eySQvFXJkZWW3HiDADQ8TADs3GUSCLxGBFRV4XSSX9dtsXpE2PPXDyamGV_P7P3ynDkXm_i.QI
 nggccFKnVhpNLH5G1WzvdVLFZE73hmsFotontU_p7W8DtnnzMiEA2Qi8mU_wXWP6nKMQEG09J1nC
 asTDQqnSeXXg40AZlfz1BifJQpzqGYCbpbU8HaKKl
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Wed, 16 Oct 2019 22:47:11 +0000
Date: Wed, 16 Oct 2019 22:47:09 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Anthony PERARD <anthony.perard@citrix.com>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <508709693.2680109.1571266029778@mail.yahoo.com>
In-Reply-To: <20191009163556.GB18712@perard.uk.xensource.com>
References: <1285554440.4009671.1570271711943.ref@mail.yahoo.com>
 <1285554440.4009671.1570271711943@mail.yahoo.com>
 <20191008083911.GA66437@Air-de-Roger>
 <20191009163556.GB18712@perard.uk.xensource.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.14498 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:69.0) Gecko/20100101 Firefox/69.0
Subject: Re: [Xen-devel] How PV frontend and backend initializes?
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
Cc: "rnikola@vt.edu" <rnikola@vt.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkFudGhvbnkgYW5kIFJvZ2VyLCB0aGFua3MgZm9yIHlvdXIgaW5mb3JtYXRpdmUgcmVzcG9uc2Vz
LiBJdCBoZWxwZWQgYSBsb3QuCgoKPiBJJ20gaG93ZXZlciB1bnN1cmUgYnkgd2hhdCB5b3UgbWVh
biB3aXRoIGluc3RhbmNlLCBzbyB5b3UgbWlnaHQgaGF2ZQo+IHRvIGNsYXJpZnkgZXhhY3RseSB3
aGF0IHlvdSBtZWFuIGluIG9yZGVyIHRvIGdldCBhIG1vcmUgY29uY2lzZQo+IHJlcGx5LgoKTGV0
J3Mgc2F5IHRoZXJlIGFyZSB0d28gRG9tVSdzLCBhbmQgdGhlaXIgcmVzcGVjdGl2ZSBuZXR3b3Jr
IGludGVyZmFjZXMgYXJlIHhlbmJyMCBhbmQgeGVuYnIxLiBUaGVyZWZvcmUsIHRoZXJlIHN1cHBv
c2VkIHRvIGJlIHR3byBQViBuZXRiYWNrIGRyaXZlcnMgcnVubmluZyBpbiBEb20wIChvciBkcml2
ZXIgZG9tYWluKTogb25lIGZvciB4ZW5icjAgYW5kIGFub3RoZXIgZm9yIHhlbmJyMS4gQnkgdGhl
IHRlcm0gaW5zdGFuY2UsIEkgYW0gcmVmZXJpbmcgdG8gdGhlc2UgZHJpdmVycy4gSWYgbGF0ZXIg
dGhlcmUgY29tZXMgYW5vdGhlciBpbnRlcmZhY2UgeGVuYnIzLCB0aGVyZSB3aWxsIGJlIHRoZSB0
aGlyZCBpbnN0YW5jZSBvZiB0aGUgYmFja2VuZCBkcml2ZXIuIEkgd2FzIHdvbmRlcmluZyBob3cg
dGhlc2UgbXVsdGlwbGUgaW5zdGFuY2VzIGFyZSBjcmVhdGVkIGFuZCB3aGVuLgoKTm93LCBhcyB5
b3UgcG9pbnRlZCB0byB0aGUgeGVuIHRvb2xzdGFjaywgSSBleHBsb3JlZCB4bC9saWJ4bCBhIGxp
dHRsZSBiaXQuIEkgcmVhbGl6ZWQgZm9yIHR3byBzZXBhcmF0ZSBkZXZpY2VzLCBsaWJ4bCBjcmVh
dGVzIHR3byBkaWZmZXJlbnQgcGF0aHMgYm90aCBmb3IgdGhlIGZyb250ZW5kIGFuZCBiYWNrZW5k
LiBUaGUgT1NlcyBrZWVwcyB3YXRjaGluZyB4ZW5zdG9yZSBwYXRocy4gSWYgYW4gT1MgZmluZHMg
YSBkZXZpY2Ugb2YgdGhlIHR5cGUgaXQgaXMgaW50ZXJlc3RlZCBpbiwgaXQgY3JlYXRlcyB0aGUg
aW5zdGFuY2Ugb2YgdGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVyIChmcm9udGVuZCBvciBiYWNrZW5k
KSBpZiB0aGUgZGV2aWNlIGlzIG5vdCBpbml0aWFsaXplZCBhbHJlYWR5LiBUaGUgcGF0aCBpcyB0
aGUgcGFyYW1ldGVyIHdoaWNoIG1ha2Ugb25lIGluc3RhbmNlIGRpZmZlcmVudCBmcm9tIHRoZSBv
dGhlcnMuCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSB1bmRlcnN0b29kIGl0IHdyb25nLiBUaGFu
a3MhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
