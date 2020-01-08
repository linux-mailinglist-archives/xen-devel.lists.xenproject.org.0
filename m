Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22561349A8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:45:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFMU-0005hf-KL; Wed, 08 Jan 2020 17:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipFMS-0005ha-Vf
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:43:17 +0000
X-Inumbo-ID: 58bb8cfa-323e-11ea-b862-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58bb8cfa-323e-11ea-b862-12813bfff9fa;
 Wed, 08 Jan 2020 17:43:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q6so4296680wro.9
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 09:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VfBKkDy0A5agE2ZGslaoZi1amiW5fn+JBc5TnEWcLek=;
 b=P3FiqjlpGI/H8QISghnfnnKQMWxVDDsnyQEQd0Zi/cCon0Nf1T405bWQ4oUuEUNKiP
 AHZQhWP2xYxLc20SGjejlD3bIH9Z/pTwKLUqqApI5jb3Al/auLAKweMnQKjv+qZLr+qC
 O1YsiLYtGz3QmzUNPo7LKNjll9eOjb0OFuxgmGJHvGhnpFj0Ywffz+oNTw5vsqXXT/DB
 ptb8WIwtbo+zkzaQxW2QzouolOl3pJ8i/5ZRNWu5olnMdOWkI4qNwoZqNGStuiXnkG6O
 iiWnTSGeOuXQDu3TawXP9Pa2hSH1LVSsEI6UugJ6QhjhNeA1aackoQJKU6GaAPE63Bd2
 TKBg==
X-Gm-Message-State: APjAAAXfjLGE4cABf4sVrMKFXzaGH1EjddhdUeSmn4RjW9kfeRA6Mgyi
 bXZ5EkgZzPYN8xORr8koZ6M=
X-Google-Smtp-Source: APXvYqz+zqjYaFQmgN0dP48R0nO6eR/1iIg4ek367ZkKqYc/VTo2VWfkQ6AZYx+yi3HMymhKqrhkZg==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr5991528wrs.365.1578505395025; 
 Wed, 08 Jan 2020 09:43:15 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id u14sm4936436wrm.51.2020.01.08.09.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 09:43:14 -0800 (PST)
Date: Wed, 8 Jan 2020 17:43:12 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200108174312.iujqqxmv7xnohndd@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
 <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
 <20200105214541.5z5ibv2nlyebbypj@debian>
 <c289d1bb-246a-6295-b8ff-e318789987e3@citrix.com>
 <20200107154214.oz2qyunmeyzfsgfv@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107154214.oz2qyunmeyzfsgfv@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDM6NDI6MTRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBTdW4sIEphbiAwNSwgMjAyMCBhdCAwOTo1Nzo1NlBNICswMDAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+IFsuLi5dCj4gPiA+Cj4gPiA+PiBUaGUgbG9ja2VkIGJpdCBpcyBwcm9iYWJseSBh
IGdvb2QgaWRlYSwgYnV0IG9uZSBhc3BlY3QgbWlzc2luZyBoZXJlIGlzCj4gPiA+PiB0aGUgY2hl
Y2sgdG8gc2VlIHdoZXRoZXIgdGhlIGh5cGVyY2FsbCBwYWdlIGlzIGFscmVhZHkgZW5hYmxlZCwg
d2hpY2ggSQo+ID4gPj4gZXhwZWN0IGlzIGZvciBhIGtleGVjIGNyYXNoIHNjZW5hcmlvLgo+ID4g
Pj4KPiA+ID4+IEhvd2V2ZXIsIHRoZSBtb3N0IGltcG9ydGFudCBwb2ludCBpcyB0aGUgb25lIHdo
aWNoIGRlc2NyaWJlcyB0aGUgI0dQCj4gPiA+PiBwcm9wZXJ0aWVzIG9mIHRoZSBndWVzdCB0cnlp
bmcgdG8gbW9kaWZ5IHRoZSBwYWdlLsKgIFRoaXMgY2FuIG9ubHkgYmUKPiA+ID4+IGFjaGlldmVk
IHdpdGggYW4gRVBUL05QVCBtYXBwaW5nIGxhY2tpbmcgdGhlIFcgcGVybWlzc2lvbiwgd2hpY2gg
d2lsbAo+ID4gPj4gc2hhdHRlciBob3N0IHN1cGVycGFnZXMuwqDCoCBUaGVyZWZvcmUsIHB1dHRp
bmcgaXQgaW4gLnRleHQgaXMgZ29pbmcgdG8gYmUKPiA+ID4+IHJhdGhlciBwb29yLCBwZXJmIHdp
c2UuCj4gPiA+Pgo+ID4gPj4gSSBhbHNvIG5vdGUgdGhhdCBYZW4ncyBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgVmlyaWRpYW4gaHlwZXJjYWxsIHBhZ2UKPiA+ID4+IGRvZXNuJ3QgY29uZm9ybSB0byB0
aGVzZSBwcm9wZXJ0aWVzLCBhbmQgd2FudHMgZml4aW5nLsKgIEl0IGlzIGdvaW5nIHRvCj4gPiA+
PiBuZWVkIGEgbmV3IGtpbmQgaWRlbnRpZmljYXRpb24gb2YgdGhlIHBhZ2UgKHByb2JhYmx5IGEg
bmV3IHAybSB0eXBlKQo+ID4gPj4gd2hpY2ggaW5qZWN0cyAjR1AgaWYgd2UgZXZlciBzZWUgYW4g
RVBUX1ZJT0xBVElPTi9OUFRfRkFVTFQgYWdhaW5zdCBpdC4KPiA+ID4+Cj4gPiA+PiBBcyBmb3Ig
c3VnZ2VzdGlvbnMgaGVyZSwgSSdtIHN0cnVnZ2xpbmcgdG8gZmluZCBhbnkgbWVtb3J5IG1hcCBk
ZXRhaWxzCj4gPiA+PiBleHBvc2VkIGluIHRoZSBWaXJpZGlhbiBpbnRlcmZhY2UsIGFuZCB0aGVy
ZWZvcmUgd2hpY2ggZ2ZuIGlzIGJlc3QgdG8KPiA+ID4+IGNob29zZS7CoCBJIGhhdmUgYSBzaW5r
aW5nIGZlZWxpbmcgdGhhdCB0aGUgYW5zd2VyIGlzIEFDUEkuLi4KPiA+ID4gVExGUyBvbmx5IHNh
eXMgImdvIGZpbmQgb25lIHN1aXRhYmxlIHBhZ2UgeW91cnNlbGYiIHdpdGhvdXQgZnVydGhlcgo+
ID4gPiBoaW50cy4KPiA+ID4KPiA+ID4gU2luY2Ugd2UncmUgc3RpbGwgcXVpdGUgZmFyIGF3YXkg
ZnJvbSBhIGZ1bmN0aW9uaW5nIHN5c3RlbSwgZmluZGluZyBhCj4gPiA+IG1vc3Qgc3VpdGFibGUg
cGFnZSBpc24ndCBteSB0b3AgcHJpb3JpdHkgYXQgdGhpcyBwb2ludC4gSWYgdGhlcmUgaXMgYQo+
ID4gPiBzaW1wbGUgd2F5IHRvIGV4dHJhcG9sYXRlIHN1aXRhYmxlIGluZm9ybWF0aW9uIGZyb20g
QUNQSSwgdGhhdCB3b3VsZCBiZQo+ID4gPiBncmVhdC4gSWYgaXQgcmVxdWlyZXMgd3JpdGluZyBh
IHNldCBvZiBmdW5jdGlvbmFsaXRpZXMsIHRoYW4gdGhhdCB3aWxsCj4gPiA+IG5lZWQgdG8gd2Fp
dCB0aWxsIGxhdGVyLgo+ID4gCj4gPiBUbyBjb3BlIHdpdGggdGhlICJvbmUgaXMgYWxyZWFkeSBl
c3RhYmxpc2hlZCBhbmQgaXQgaXMgYWxyZWFkeSBsb2NrZWQiCj4gPiBjYXNlLCB0aGUgb25seSBv
cHRpb24gaXMgdG8gaGF2ZSBhIGZpeG1hcCBlbnRyeSB3aGljaCBjYW4gYmUgc2V0Cj4gPiBkeW5h
bWljYWxseS7CoCBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBmaXhtYXAgcmVnaW9uIGlzIG1hcmtl
ZCBOWCBhbmQgNjRHCj4gPiBhd2F5IGZyb20gLnRleHQuCj4gPiAKPiA+IFBvc3NpYmx5IHRoZSBs
ZWFzdCBiYWQgb3B0aW9uIGlzIHRvIGhhdmUgc29tZSBidWlsZC10aW1lIHNwYWNlIChzbyAwIG9y
Cj4gPiA0ayBkZXBlbmRpbmcgb24gQ09ORklHX0hZUEVSVikgYmV0d2VlbiB0aGUgcGVyLWNwdSBz
dHVicyBhbmQKPiA+IFhFTl9WSVJUX0VORCwgd2hpY2ggb3BlcmF0ZXMgbGlrZSB0aGUgZml4bWFw
LCBidXQgZW5kcyB1cCBhcyBYL1JPIG1hcHBpbmdzLgo+ID4gCj4gCj4gT0suIFRoaXMgaXMgcHJv
YmFibHkgbm90IHRvbyBkaWZmaWN1bHQuIAo+IAoKSSBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhp
cyB0b2RheSBhbmQgd2FudCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kCndoYXQgeW91IGhhZCBp
biBtaW5kLgoKU3VwcG9zZSB3ZSBzZXQgYXNpZGUgc29tZSBzcGFjZSBpbiBsaW5rZXIgc2NyaXB0
LiBVc2luZyB0aGUgZm9sbG93aW5nCndpbGwgZ2l2ZSB5b3UgYSBXQVggc2VjdGlvbi4gSSBzdGls
bCBuZWVkIHRvIGFkZCBDT05GSUdfR1VFU1QgYXJvdW5kIGl0LApidXQgeW91IGdldCB0aGUgaWRl
YS4KCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMKaW5kZXggMTExZWRiNTM2MC4uYTdhZjMyMTEzOSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0zMDUsNiAr
MzA1LDE1IEBAIFNFQ1RJT05TCiAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwogICAg
ICAgIF9fYnNzX2VuZCA9IC47CiAgIH0gOnRleHQKKworICAuID0gQUxJR04oU0VDVElPTl9BTElH
Tik7CisgIERFQ0xfU0VDVElPTigudGV4dC5oeXBlcmNhbGxfcGFnZSkgeworICAgICAgIC4gPSBB
TElHTihQQUdFX1NJWkUpOworICAgICAgIF9faHlwZXJjYWxsX3BhZ2Vfc3RhcnQgPSAuOworICAg
ICAgIC4gPSAuICsgUEFHRV9TSVpFOworICAgICAgIF9faHlwZXJjYWxsX3BhZ2VfZW5kID0gLjsK
KyAgfSA6dGV4dD0weDkwOTAKKwogICBfZW5kID0gLiA7CiAKICAgLiA9IEFMSUdOKFNFQ1RJT05f
QUxJR04pOwoKCkFuZCB0aGVuPyBVc2UgbWFwX3BhZ2VzX3RvX3hlbiguLi4sIFBBR0VfSFlQRVJW
SVNPUl9SWCkgdG8gcG9pbnQgdGhhdAphZGRyZXNzIHRvIChNQVhQSFlTQUREUi1QQUdFX1NJWkUp
PwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
