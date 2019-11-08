Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D99F54A4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 20:48:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTACY-0004yU-95; Fri, 08 Nov 2019 19:45:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=akm4=ZA=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iTACW-0004yP-BX
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 19:45:44 +0000
X-Inumbo-ID: 56b24e0a-0260-11ea-a1d9-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56b24e0a-0260-11ea-a1d9-12813bfff9fa;
 Fri, 08 Nov 2019 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3kHs4WJAzs/C31HgIXv5xdjTMziavCEb2FdqiEPATM4=; b=UsJ6ruw0n5HAdl2jOCRMf9Z31s
 7J9yg7yO4MywvE3i+1fnQydBMypbohW/G/cqig2WRdUDmTP47LM20eMa85dCOWiXQ58cIrrIGzTEG
 TGpguNMDyClHSmyPJXGeOYLp3ECfk/TDukeh5FNrGkszCEYco1wZuQrmiSgPXTiv16Q8=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:48760
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iTADG-0000hL-NU; Fri, 08 Nov 2019 20:46:30 +0100
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
Date: Fri, 8 Nov 2019 20:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host
 history
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTEvMjAxOSAxOTo0OSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gRWFybGllciB0aGlzIHdl
ZWsgd2UgZGlzY292ZXJlZCB0aGF0IHNnLXJlcG9ydC1ob3N0LWhpc3Rvcnkgd2FzIHJ1bm5pbmcK
PiBleHRyZW1lbHkgc2xvd2x5LiAgV2UgYXBwbGllZCBhbiBlbWVyZ2VuY3kgZml4IDBmYTcyYjEz
ZjVhZgo+ICAgc2ctcmVwb3J0LWhvc3QtaGlzdG9yeTogUmVkdWNlIGxpbWl0IGZyb20gMjAwMCB0
byAyMDAKPiAKPiBUaGUgbWFpbiBwcm9ibGVtIGlzIHRoYXQgc2ctcmVwb3J0LWhvc3QtaGlzdG9y
eSBydW5zIG9uY2UgZm9yIGVhY2gKPiBmbGlnaHQsIGFuZCBtdXN0IGdlbmVyYXRlIGEgcmVsZXZh
bnQgaGlzdG9yeSB2aWV3IG9mIHRoZSByZWNlbnQKPiBoaXN0b3J5IGZvciBlYWNoIGhvc3QgLSBp
bmNsdWRpbmcgbXVjaCBoaXN0b3J5IHRoYXQgaXMgYWxyZWFkeSBpbiB0aGUKPiBvbGQgdmVyc2lv
biBvZiB0aGUgaHRtbCBmaWxlLgo+IAo+IFRoZSBzbG93IHBhcnQgaXMgYXNraW5nIHRoZSBkYXRh
YmFzZSBhYm91dCBpbmZvcm1hdGlvbiBhYm91dCBlYWNoIGpvYiwKPiBpbmNsdWRpbmcgaXRzIGZp
bmFsIHN0ZXAsIGFsbG9jYXRpb24gc3RlcCwgZXRjLiAgKFRoZSBtYWluIHF1ZXJ5IHdoaWNoCj4g
ZGlncyBvdXQgcmVsZXZhbnQgam9icyBpcyBhbHNvIHJhdGhlciB0aW1lIGNvbnN1bWluZyBpdCBy
dW5zIGFsbCBpbgo+IG9uZSBnbyBhbmQgdGFrZXMgb25seSBhIG1pbnV0ZSBvciB0d28uKQo+IAo+
IEluIHRoaXMgc2VyaWVzIHdlIGludHJvZHVjZSBhIG1lY2hhbmlzbSB3aGljaCBjYWNoZXMgbXVj
aCBvZiB0aGUKPiBoaXN0b3JpY2FsIGFuYWx5c2lzLgo+IAo+IEl0IGlzIG5vdCBzdHJhaWdodGZv
cndhcmQgdG8gcmV1c2Ugb2xkIGh0bWwgZGF0YSBhcy1pcyBiZWNhdXNlIHdlCj4gd291bGQgaGF2
ZSB0byBkbyBhIG1lcmdlIHNvcnQgd2l0aCB0aGUgbmV3IGRhdGEgYW5kIHRoYXQgd291bGQgaW52
b2x2ZQo+IHJld3JpdGluZyB0aGUgYWx0ZXJuYXRpbmcgYmFja2dyb3VuZCBjb2xvdXIgKCEpCj4g
Cj4gU28gaW5zdGVhZCwgd2Ugc3R1ZmYgdGhlIGluZm9ybWF0aW9uIHdlIGdvdCBmcm9tIHRoZSBk
YXRhYmFzZSBpbnRvCj4gY29tbWVudHMgaW4gdGhlIEhUTUwsIHdoaWNoIHdlIGNhbiB0aGVuIHNj
YW4gb24gZnV0dXJlIHJ1bnMuCgpOb3QgbWVuZCB0byBiaWtlIHNoZWQsIHNvIGp1c3QgZm9yIGNv
bnNpZGVyYXRpb246Ci0gSGF2ZSB5b3UgY29uc2lkZXJlZCAoaW5saW5lKSBjc3MgZm9yIHRoZSBi
YWNrZ3JvdW5kIGNvbG91cmluZywgb3IgZG9lcwogIGl0IGhhdmUgdG8gYmUgaHRtbCBvbmx5ICA/
Ci0gQW5kIGZvciBjYWNoaW5nIHBlcmhhcHMgYSBtYXRlcmlhbGl6ZWQgdmlldyB3aXRoIGFnZ3Jl
Z2F0ZWQgZGF0YSBvbmx5CiAgcmVmcmVzaGVkIGF0IGEgbW9yZSBjb252aWVudCB0aW1lIGNvdWxk
IHBlcmhhcHMgaGVscCBhdCB0aGUgZGF0YWJhc2UKICBsZXZlbCA/CgotLQpTYW5kZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
