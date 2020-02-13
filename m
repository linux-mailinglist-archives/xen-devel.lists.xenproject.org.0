Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC815BC65
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:11:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BRC-0006ms-6O; Thu, 13 Feb 2020 10:09:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2BRA-0006mm-D9
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:09:36 +0000
X-Inumbo-ID: ef347b42-4e48-11ea-b870-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef347b42-4e48-11ea-b870-12813bfff9fa;
 Thu, 13 Feb 2020 10:09:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so5874732wrs.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 02:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KiSJwmi8sVYpNALUzfzInvyAaU2Of/3dE0sXPif8B0w=;
 b=rx6kL/nBnzfvX7gCrZLD/5ZqQQtQqqiZ56z9I4NcgmAaV2tskvHQ/KeQEkgZYnG5JS
 /m6t3OrdGtHWEztq8ucqiBInxr97DBR7/iR1hddj524vaVrgWpKwqUr/yjT6C6dQJwrF
 oBh24mzUc2+BS7bPka5jhlMMiK+OnUj45Oc/aa1TY5Kj/XEmHYvnZ1eehBLFBAh2tFE8
 eGEgqbc72RnP25stET4ohzCEgthAXEn/EgjEsct+E+fKffweFVisX+iZsIHDmN2c1o12
 rv4DsUoEUAjVXhtNWRk2lzpl+dhRrOt/OcH6I+tJHgukD4aKiK+ExTY5/bAaM8ZDQeBo
 9CGg==
X-Gm-Message-State: APjAAAXUSwCbT2mjMtpgbq8ObAgwvhys30+R1aVmg9VdqMZLGFExiEF9
 Imnksf7T4s8Jy/hzmNVEcmQ=
X-Google-Smtp-Source: APXvYqxmuOIjt1vhnID1fDx3Be5qZNAolvRbaYy2H/9u00A6X/myPZmWPKmnxiJTVUOaqKfT1V5E5A==
X-Received: by 2002:adf:b254:: with SMTP id y20mr20535450wra.362.1581588574238; 
 Thu, 13 Feb 2020 02:09:34 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id z25sm2358321wmf.14.2020.02.13.02.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 02:09:33 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200211093527.6811-1-jgross@suse.com>
 <d11ca0a6-652a-13d8-864a-82893f0969cc@xen.org>
 <fd9c5b57-001c-cecb-d42f-ab02ef6e8f36@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2c59a619-de0e-a5c1-0338-0d09eb941e77@xen.org>
Date: Thu, 13 Feb 2020 11:09:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fd9c5b57-001c-cecb-d42f-ab02ef6e8f36@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMy8wMi8yMDIwIDExOjAxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDEzLjAy
LjIwIDEwOjAxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAxMS8wMi8yMDIw
IDEwOjM1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0
aXZlIGl0IGlzIG1hbmRhdG9yeSBmb3Igc3RvcF9tYWNoaW5lX3J1bigpIHRvCj4+PiBiZSBjYWxs
ZWQgaW4gYSB0YXNrbGV0IG9ubHksIGFzIG90aGVyd2lzZSBhIHNjaGVkdWxpbmcgZGVhZGxvY2sg
d291bGQKPj4+IG9jY3VyOiBzdG9wX21hY2hpbmVfcnVuKCkgZG9lcyBhIGNwdSByZW5kZXp2b3Vz
IGJ5IGFjdGl2YXRpbmcgYSB0YXNrbGV0Cj4+PiBvbiBhbGwgb3RoZXIgY3B1cy4gSW4gY2FzZSBz
dG9wX21hY2hpbmVfcnVuKCkgd2FzIG5vdCBjYWxsZWQgaW4gYW4gaWRsZQo+Pj4gdmNwdSBpdCB3
b3VsZCBibG9jayBzY2hlZHVsaW5nIHRoZSBpZGxlIHZjcHUgb24gaXRzIHNpYmxpbmdzIHdpdGgg
Y29yZQo+Pj4gc2NoZWR1bGluZyBiZWluZyBhY3RpdmUsIHJlc3VsdGluZyBpbiBhIGhhbmcuCj4+
Cj4+IFRoaXMgc3VnZ2VzdHMgaXQgaXMgbm90IHNhZmUgdG8gY2FsbCBzdG9wX21hY2hpbmVfcnVu
KCkgb3V0c2lkZSBhIAo+PiB0YXNrbGV0IGJ1dCBzdGlsbCB1bmRlciAiaWRsZSB2Q1BVIiBjb250
ZXh0LiBIb3dldmVyLCBhbHRlcm5hdGl2ZSAKPj4gcGF0Y2hpbmcgb24gQXJtIGR1cmluZyBib290
IHdpbGwgbm90IGJlIGluIGEgdGFza2xldC4gSXMgaXQgZ29pbmcgdG8gCj4+IGJlIHNhZmU/Cj4g
Cj4gWWVzLgo+IAo+IEkgY2FuIHJlcGhyYXNlIHRoYXQgcGFydCB0byBtYWtlIGl0IGNsZWFyLgoK
VGhhdCB3b3VsZCBuaWNlLiBUaGFuayB5b3UhCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
