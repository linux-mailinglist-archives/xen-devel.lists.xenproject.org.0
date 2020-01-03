Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BE12FB18
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 18:06:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQLs-0003Ti-1n; Fri, 03 Jan 2020 17:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inQLq-0003Tc-1J
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 17:03:06 +0000
X-Inumbo-ID: e3b2e592-2e4a-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3b2e592-2e4a-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 17:02:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so9190886wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 09:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YrTCMhltTg451licRGZ6wQFhOfaX1422W/SFnP9AfYE=;
 b=ji5cU3ea4LiP08BAAMXnURp+uEUNH1IrtB/v4Y0eV3PPnucmmdr53V3We6k5aS7UuR
 Mg4ljFAZqSqFqjjcMLchsTow5Ui6f6aivmxrSmIXOWyvRbkYkLbkSKtV1ZGvuuzXWSli
 WDGM8rDC6sdKyWs1gpX3Y/txFEpOqok3IBncGZDYEYZWPfSKElHsDSCAI6f1/mWb0yem
 u7TV916L9UeX4uiLJ1YDDM/zWl/osoFXDaTA1KDV9a4hJSw5Al/fsRm8ZC9tazG7/yGt
 eIlrz39NBDsLrnbyA1/7tQ5WTDfQStgKJLg1Wqr3xbvoJNIMrXFRfXioF1msHfE/ANu6
 4zNg==
X-Gm-Message-State: APjAAAVwuSdIyZetTLTpg2tJM5tg0u74c4DcjmrzD9tIKHyKN7VYJN+B
 eWpX/ZuNhh00NaOnBVD5fhg=
X-Google-Smtp-Source: APXvYqwXxKfzpiojA9ndkmRbNYf81RlO2ScSSDAefXzlJEVNKKFSLS7KbWg97bweLW4UmVFQVbADcA==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr20182976wmg.147.1578070976776; 
 Fri, 03 Jan 2020 09:02:56 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p15sm12616793wma.40.2020.01.03.09.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 09:02:56 -0800 (PST)
Date: Fri, 3 Jan 2020 17:02:54 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200103170254.uotrms34vwlb2idz@debian>
References: <20200103160825.19377-1-liuwe@microsoft.com>
 <20200103160825.19377-7-liuwe@microsoft.com>
 <ec797a21-8b06-6eb1-84a8-7e059c430e7a@citrix.com>
 <20200103165513.wlgihc4kfqducwtm@debian>
 <d3c99f17-06f0-bd17-4b9a-c6f7eaa2f024@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3c99f17-06f0-bd17-4b9a-c6f7eaa2f024@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 6/8] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDQ6NTc6MTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMy8wMS8yMDIwIDE2OjU1LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gRnJpLCBK
YW4gMDMsIDIwMjAgYXQgMDQ6MzA6NDlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
PiBPbiAwMy8wMS8yMDIwIDE2OjA4LCBXZWkgTGl1IHdyb3RlOgo+ID4+PiBAQCAtODMsMTQgKzg0
LDM5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+ID4+
PiAgICAgIHdybXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50
NjQpOwo+ID4+PiAgfQo+ID4+PiAgCj4gPj4+ICtzdGF0aWMgdm9pZCBzZXR1cF9oeXBlcmNhbGxf
cGNwdV9hcmcodm9pZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsK
PiA+Pj4gKyAgICB2b2lkICptYXBwaW5nOwo+ID4+PiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBz
bXBfcHJvY2Vzc29yX2lkKCk7Cj4gPj4+ICsKPiA+Pj4gKyAgICBwZyA9IGFsbG9jX2RvbWhlYXBf
cGFnZShOVUxMLCAwKTsKPiA+Pj4gKyAgICBpZiAoICFwZyApCj4gPj4+ICsgICAgICAgIHBhbmlj
KCJGYWlsZWQgdG8gc2V0dXAgaHlwZXJjYWxsIGlucHV0IHBhZ2UgZm9yICV1XG4iLCBjcHUpOwo+
ID4+PiArCj4gPj4+ICsgICAgbWFwcGluZyA9IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChwZyk7
Cj4gPj4+ICsgICAgaWYgKCAhbWFwcGluZyApCj4gPj4+ICsgICAgICAgIHBhbmljKCJGYWlsZWQg
dG8gbWFwIGh5cGVyY2FsbCBpbnB1dCBwYWdlIGZvciAldVxuIiwgY3B1KTsKPiA+PiBTb3JyeSBJ
IGRpZG4ndCBzcG90IHRoaXMgYmVmb3JlLCBidXQgYW4gYWx3YXlzLW1hcHBlZCBkb21oZWFwIHBh
Z2UgaXMKPiA+PiBqdXN0IGFsbG9jX3hlbmhlYXBfcGFnZSgpIChnaXZlIG9yIHRha2UgTlVNQSBw
b3NpdGlvbmluZyBhYm92ZSB0aGUgNVQKPiA+PiBib3VuZGFyeSwgd2hpY2ggaXNuJ3QgdXNlZCBo
ZXJlKS4KPiA+IEkgaGFkIHRoZSAod3JvbmcpIGltcHJlc3Npb24gdGhhdCB1c2luZyBkb21oZWFw
IHdhcyBwcmVmZXJyZWQuCj4gPgo+ID4gSSdtIGZpbmUgd2l0aCBzd2l0Y2hpbmcgdG8geGVuaGVh
cCwgb2YgY291cnNlLgo+IAo+IFRoaXMgaXMgYSBmcmFtZSB3aGljaCBYZW4gbmVlZHMgdG8gaGF2
ZSBhIG1hcHBpbmcgdG8gaW4gcGVycGV0dWl0eSwgdG8KPiBtYWtlIGh5cGVyY2FsbHMuCj4gCj4g
TW9zdCBleGFtcGxlcyBpbiBjb2RlIGFyZSBhIHJlZ3VsYXIgZG9taGVhcCBmcmFtZSB3aGljaCwg
YWZ0ZXIgc29tZQo+IGd1ZXN0IGFjdGlvbiwgcmVxdWlyZXMgbWFwcGluZyBpbiBYZW4gZm9yIGEg
cGVyaW9kIG9mIHRpbWUsIG9yIGZyYW1lcwo+IHdoaWNoIHdlIHdhbnQgdG8gaGF2ZSBzcGVjaWZp
YyBOVU1BIHByb3BlcnRpZXMsIGFuZCBtYXkgYmUgYmV5b25kIHRoZQo+IGVuZCBvZiB0aGUgZGly
ZWN0bWFwLgoKQWxyaWdodC4KCklmIHdlIHVzZSB4ZW5oZWFwIGhlcmUgSSBjYW4gZHJvcCB0aGUg
dHJhY2tpbmcgc3RydWN0dXJlLgoKSSB3aWxsIGNoYW5nZSB0aGF0IGluIHYzLgoKV2VpLgoKPiAK
PiB+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
