Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBDF1143F3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:45:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ictHM-0000KB-OY; Thu, 05 Dec 2019 15:42:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ictHL-0000Ju-Hx
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:42:55 +0000
X-Inumbo-ID: e6df9efe-1775-11ea-822e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6df9efe-1775-11ea-822e-12813bfff9fa;
 Thu, 05 Dec 2019 15:42:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE2E4AFAE;
 Thu,  5 Dec 2019 15:42:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e57df0af-6802-9441-f8bd-9e9b40355952@suse.com>
Date: Thu, 5 Dec 2019 16:43:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] x86: support Atom Tremont
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIG1vZGVsIDB4ODYgdG8gcmVsZXZhbnQgc3dpdGNoKCkgc3RhdGVtZW50cywgYXMgcGVyIFNE
TSAwNjkgVm9sIDQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ci0tLQp2MjogRHJvcCBzcGVjX2N0cmwuYyBhZGp1c3RtZW50cy4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9hY3BpL2NwdV9pZGxlLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwpA
QCAtMjM4LDYgKzIzOCw4IEBAIHN0YXRpYyB2b2lkIGRvX2dldF9od19yZXNpZGVuY2llcyh2b2lk
ICoKICAgICBjYXNlIDB4NUY6CiAgICAgLyogR29sZG1vbnQgUGx1cyAqLwogICAgIGNhc2UgMHg3
QToKKyAgICAvKiBUcmVtb250ICovCisgICAgY2FzZSAweDg2OgogICAgICAgICBHRVRfUEMyX1JF
Uyhod19yZXMtPnBjMik7CiAgICAgICAgIEdFVF9QQzNfUkVTKGh3X3Jlcy0+cGMzKTsKICAgICAg
ICAgR0VUX1BDNl9SRVMoaHdfcmVzLT5wYzYpOwotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMjc3OCw2ICsyNzc4LDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBsYnJfaW5mbyAqbGFzdF9icmFuYwogICAgICAgICBjYXNl
IDB4NjY6CiAgICAgICAgIC8qIEdvbGRtb250IFBsdXMgKi8KICAgICAgICAgY2FzZSAweDdhOgor
ICAgICAgICAvKiBUcmVtb250ICovCisgICAgICAgIGNhc2UgMHg4NjoKICAgICAgICAgLyogS2Fi
eSBMYWtlICovCiAgICAgICAgIGNhc2UgMHg4ZTogY2FzZSAweDllOgogICAgICAgICAgICAgcmV0
dXJuIHNrX2xicjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
