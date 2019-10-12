Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F3D51E5
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 20:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJMQL-0004pM-IQ; Sat, 12 Oct 2019 18:47:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1MJu=YF=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iJMQJ-0004pH-Lf
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 18:47:28 +0000
X-Inumbo-ID: bacc1cb9-ed20-11e9-9355-12813bfff9fa
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bacc1cb9-ed20-11e9-9355-12813bfff9fa;
 Sat, 12 Oct 2019 18:47:24 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id AED6916005D
 for <xen-devel@lists.xenproject.org>; Sat, 12 Oct 2019 20:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1570906043; bh=X3P65BoNLHfhiRIhGi9ghzaDgNoBANGxqSKnWphSU2k=;
 h=To:From:Subject:Date:From;
 b=cEiqe9cdYvIFH6qONoM2FcJ+GbQaiXos6UHtKINlfiyIhqqkwHa0dPCpuqqyZhy8w
 CJqj8q0GGN9xFTExCg1tGWQkQN9DXTswNTgziTCrZIaR4adTG7AIEBTl4CWym2IqmT
 Q87sxl/CJeTAGZSl1196gEd75OLKu3su6l+y1zNRTA99pMOAJ3TKWlHjT9yoQXEDK7
 eALReW4fcC2B040AInQrmNcrLS2j87ku6h4hJsAGywhEIxmkabgfQRf+pK5oDomyav
 DhA1/IJh7JkCc9AwP0t5c5r6Zveey08gDENBzEzRB7OS2Ju4lwnWbenV710Qa5y2OU
 uLMzTIS6gdVuw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46rDMZ70LTz6tm7;
 Sat, 12 Oct 2019 20:47:22 +0200 (CEST)
To: xen-devel@lists.xenproject.org, Paul Durrant <Paul.Durrant@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
Date: Sat, 12 Oct 2019 20:47:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] wall clock drift on C24x mainboard, best practices
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gYWxsLCBoZWxsbyBQYXVsLAoKT24gYSBjZXJ0YWluIG5ldyBtYWluYm9hcmQgd2l0aCBj
aGlwc2V0IEMyNDIgYW5kIEludGVsIFhlb24gRS0yMTM2IEkgCm5vdGljZSBhIHNldmVyZSBjbG9j
ayBkcmlmdC4gVGhpcyBpcyBmcm9tIGRvbTA6CgojIHVwdGltZQogIDIwOjEzOjUyIHVwIDgxIGRh
eXMsICAxOjQxLCAgMSB1c2VyLCAgbG9hZCBhdmVyYWdlOiAwLjAwLCAwLjAwLCAwLjAwCiMgaHdj
bG9jawoyMDE5LTEwLTEyIDIwOjI3OjM3LjIwNDk2NiswMjowMAojIGRhdGUKU2F0IE9jdCAxMiAy
MDowNzoxOSBDRVNUIDIwMTkKCktlcm5lbCBpcyA0LjEzLjE2IHZhbmlsbGEsIFhlbiA0LjEwLjIK
ClNvIGFmdGVyIDgxIGRheXMgdXB0aW1lIHRoZXJlIGlzIGEgZGlmZmVyZW5jZSBvZiBvdmVyIDIw
IG1pbnV0ZXMgYmV0d2VlbiAKImRhdGUiIGFuZCAiaHdjbG9jayIuIEkgb3BlcmF0ZSBtYW55IFhl
biBzZXJ2ZXJzIGFuZCBoYXZlIG5ldmVyIHNlZW4gCnN1Y2ggYSBncmVhdCBkcmlmdCBleGNlcHQg
b24gdGhpcyB0eXBlIG9mIG1haW5ib2FyZC4gV2hhdCBjb3VsZCBiZSB0aGUgCnJlYXNvbj8KCklu
IGdlbmVyYWwsIHdoYXQgaXMgdGhlIGN1cnJlbnQgYmVzdCBwcmFjdGljZSBmb3IgTlRQIHN5bmM/
IFJ1biBpdCBpbiAKZG9tMD8gSW4gZG9tVT8gQm90aD8gSG93IGRvZXMgdGhlIGRvbVUgdHlwZSAo
TGludXggSFZNL1BWTS9QVkggb3IgCldpbmRvd3MgSFZNIHdpdGggV2luUFYgZHJpdmVycykgbWFr
ZSBhIGRpZmZlcmVuY2U/CgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
