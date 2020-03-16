Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B092F1869B4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 12:03:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDnTu-0006x5-6I; Mon, 16 Mar 2020 11:00:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDnTs-0006x0-Rt
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 11:00:24 +0000
X-Inumbo-ID: 55b78d9c-6775-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55b78d9c-6775-11ea-a6c1-bc764e2007e4;
 Mon, 16 Mar 2020 11:00:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6C54B1B5;
 Mon, 16 Mar 2020 11:00:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a036b093-0f0d-6998-c6ec-4463d53b337f@suse.com>
Date: Mon, 16 Mar 2020 12:00:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/HVM: fix AMD ECS handling for Fam 10
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGludm9sdmVkIGNvbXBhcmlzb24gd2FzLCB2ZXJ5IGxpa2VseSBpbmFkdmVydGVudGx5LCBj
b252ZXJ0ZWQgZnJvbQo+PSB0byA+IHdoZW4gbWFraW5nIGNoYW5nZXMgdW5yZWxhdGVkIHRvIHRo
ZSBhY3R1YWwgZmFtaWx5IHJhbmdlLgoKRml4ZXM6IDk4NDFlYjcxZWE4NyAoIng4Ni9jcHVpZDog
RHJvcCBhIGd1ZXN0cyBjYWNoZWQgeDg2IGZhbWlseSBhbmQgbW9kZWwgaW5mb3JtYXRpb24iKQpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCkBAIC0x
Mjg0LDcgKzEyODQsNyBAQCBzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqaHZtX3NlbGVjdF9pb3Jl
CiAgICAgICAgIGlmICggQ0Y4X0FERFJfSEkoY2Y4KSAmJgogICAgICAgICAgICAgIGQtPmFyY2gu
Y3B1aWQtPng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgJiYKICAgICAgICAgICAgICAoeDg2
X2ZhbSA9IGdldF9jcHVfZmFtaWx5KAotICAgICAgICAgICAgICAgICBkLT5hcmNoLmNwdWlkLT5i
YXNpYy5yYXdfZm1zLCBOVUxMLCBOVUxMKSkgPiAweDEwICYmCisgICAgICAgICAgICAgICAgIGQt
PmFyY2guY3B1aWQtPmJhc2ljLnJhd19mbXMsIE5VTEwsIE5VTEwpKSA+PSAweDEwICYmCiAgICAg
ICAgICAgICAgeDg2X2ZhbSA8IDB4MTcgKQogICAgICAgICB7CiAgICAgICAgICAgICB1aW50NjRf
dCBtc3JfdmFsOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
