Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A4135A8F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:51:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYAV-0003ED-O0; Thu, 09 Jan 2020 13:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wgv1=26=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipYAU-0003E8-9v
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 13:48:10 +0000
X-Inumbo-ID: ab2f7168-32e6-11ea-b9d3-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab2f7168-32e6-11ea-b9d3-12813bfff9fa;
 Thu, 09 Jan 2020 13:48:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so7448239wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 05:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EmDbNdO6x0maEHTWFkG/FsDZ1ymbcZv5p38lWPp0UnM=;
 b=ih4pzrakhs1mrSdt/GaHm/AxfX0l3Z+GgIBk1pZl3IQkI+CoK5RY10/pbBnkLckPtE
 wV9yPHUSDzxEy+nDD9Tc6tHJGpl6zhZsTn+P6eolz2CxHw1EYzTX/I+/2PhlUilerbr7
 kS0RWdOH7X3cV55OIR2SqxXa+2TO6pEfVFx75ofNLFcIZdEGjLZ8pfGWnLGaNp460Ric
 aShDKRMJ2vdwd0rW0tcfIhkAol6QTmcmeDc05NfLOnhSKiwMmf1UkxKemtlNxC8MSXe0
 OBJJCWfsi7vrHCLxnMGEzgKC6vsx7zKwz2dNJpuwO32zFsW/8Yg5LwWr6Nfn0ksbAiCR
 oz8g==
X-Gm-Message-State: APjAAAVOFN9uxCx/LxiMBYrH2Qa3abFt6KviQ0oTvQteOpuM8lgCtHUC
 8VUhCo//309bhmi1L1QizDM=
X-Google-Smtp-Source: APXvYqwhLU/Uuq7N7kK5UnK4cDB5qM8wpbU70I6JlJDkVLYeNX/RqZsoMK7DTFpddCoIjx6QeXEo/w==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr11346295wrw.193.1578577687429; 
 Thu, 09 Jan 2020 05:48:07 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id c195sm3058709wmd.45.2020.01.09.05.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 05:48:06 -0800 (PST)
Date: Thu, 9 Jan 2020 13:48:05 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200109134805.pgiqbeb5wrf6y3lu@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
 <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
 <20200105214541.5z5ibv2nlyebbypj@debian>
 <c289d1bb-246a-6295-b8ff-e318789987e3@citrix.com>
 <20200107154214.oz2qyunmeyzfsgfv@debian>
 <20200108174312.iujqqxmv7xnohndd@debian>
 <92ff2425-31f6-f1de-bbe9-38f83f776c4a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92ff2425-31f6-f1de-bbe9-38f83f776c4a@citrix.com>
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

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDU6NTM6MzZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOC8wMS8yMDIwIDE3OjQzLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVHVlLCBK
YW4gMDcsIDIwMjAgYXQgMDM6NDI6MTRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+PiBPbiBT
dW4sIEphbiAwNSwgMjAyMCBhdCAwOTo1Nzo1NlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+ID4+IFsuLi5dCj4gPj4+Pj4gVGhlIGxvY2tlZCBiaXQgaXMgcHJvYmFibHkgYSBnb29kIGlk
ZWEsIGJ1dCBvbmUgYXNwZWN0IG1pc3NpbmcgaGVyZSBpcwo+ID4+Pj4+IHRoZSBjaGVjayB0byBz
ZWUgd2hldGhlciB0aGUgaHlwZXJjYWxsIHBhZ2UgaXMgYWxyZWFkeSBlbmFibGVkLCB3aGljaCBJ
Cj4gPj4+Pj4gZXhwZWN0IGlzIGZvciBhIGtleGVjIGNyYXNoIHNjZW5hcmlvLgo+ID4+Pj4+Cj4g
Pj4+Pj4gSG93ZXZlciwgdGhlIG1vc3QgaW1wb3J0YW50IHBvaW50IGlzIHRoZSBvbmUgd2hpY2gg
ZGVzY3JpYmVzIHRoZSAjR1AKPiA+Pj4+PiBwcm9wZXJ0aWVzIG9mIHRoZSBndWVzdCB0cnlpbmcg
dG8gbW9kaWZ5IHRoZSBwYWdlLsKgIFRoaXMgY2FuIG9ubHkgYmUKPiA+Pj4+PiBhY2hpZXZlZCB3
aXRoIGFuIEVQVC9OUFQgbWFwcGluZyBsYWNraW5nIHRoZSBXIHBlcm1pc3Npb24sIHdoaWNoIHdp
bGwKPiA+Pj4+PiBzaGF0dGVyIGhvc3Qgc3VwZXJwYWdlcy7CoMKgIFRoZXJlZm9yZSwgcHV0dGlu
ZyBpdCBpbiAudGV4dCBpcyBnb2luZyB0byBiZQo+ID4+Pj4+IHJhdGhlciBwb29yLCBwZXJmIHdp
c2UuCj4gPj4+Pj4KPiA+Pj4+PiBJIGFsc28gbm90ZSB0aGF0IFhlbidzIGltcGxlbWVudGF0aW9u
IG9mIHRoZSBWaXJpZGlhbiBoeXBlcmNhbGwgcGFnZQo+ID4+Pj4+IGRvZXNuJ3QgY29uZm9ybSB0
byB0aGVzZSBwcm9wZXJ0aWVzLCBhbmQgd2FudHMgZml4aW5nLsKgIEl0IGlzIGdvaW5nIHRvCj4g
Pj4+Pj4gbmVlZCBhIG5ldyBraW5kIGlkZW50aWZpY2F0aW9uIG9mIHRoZSBwYWdlIChwcm9iYWJs
eSBhIG5ldyBwMm0gdHlwZSkKPiA+Pj4+PiB3aGljaCBpbmplY3RzICNHUCBpZiB3ZSBldmVyIHNl
ZSBhbiBFUFRfVklPTEFUSU9OL05QVF9GQVVMVCBhZ2FpbnN0IGl0Lgo+ID4+Pj4+Cj4gPj4+Pj4g
QXMgZm9yIHN1Z2dlc3Rpb25zIGhlcmUsIEknbSBzdHJ1Z2dsaW5nIHRvIGZpbmQgYW55IG1lbW9y
eSBtYXAgZGV0YWlscwo+ID4+Pj4+IGV4cG9zZWQgaW4gdGhlIFZpcmlkaWFuIGludGVyZmFjZSwg
YW5kIHRoZXJlZm9yZSB3aGljaCBnZm4gaXMgYmVzdCB0bwo+ID4+Pj4+IGNob29zZS7CoCBJIGhh
dmUgYSBzaW5raW5nIGZlZWxpbmcgdGhhdCB0aGUgYW5zd2VyIGlzIEFDUEkuLi4KPiA+Pj4+IFRM
RlMgb25seSBzYXlzICJnbyBmaW5kIG9uZSBzdWl0YWJsZSBwYWdlIHlvdXJzZWxmIiB3aXRob3V0
IGZ1cnRoZXIKPiA+Pj4+IGhpbnRzLgo+ID4+Pj4KPiA+Pj4+IFNpbmNlIHdlJ3JlIHN0aWxsIHF1
aXRlIGZhciBhd2F5IGZyb20gYSBmdW5jdGlvbmluZyBzeXN0ZW0sIGZpbmRpbmcgYQo+ID4+Pj4g
bW9zdCBzdWl0YWJsZSBwYWdlIGlzbid0IG15IHRvcCBwcmlvcml0eSBhdCB0aGlzIHBvaW50LiBJ
ZiB0aGVyZSBpcyBhCj4gPj4+PiBzaW1wbGUgd2F5IHRvIGV4dHJhcG9sYXRlIHN1aXRhYmxlIGlu
Zm9ybWF0aW9uIGZyb20gQUNQSSwgdGhhdCB3b3VsZCBiZQo+ID4+Pj4gZ3JlYXQuIElmIGl0IHJl
cXVpcmVzIHdyaXRpbmcgYSBzZXQgb2YgZnVuY3Rpb25hbGl0aWVzLCB0aGFuIHRoYXQgd2lsbAo+
ID4+Pj4gbmVlZCB0byB3YWl0IHRpbGwgbGF0ZXIuCj4gPj4+IFRvIGNvcGUgd2l0aCB0aGUgIm9u
ZSBpcyBhbHJlYWR5IGVzdGFibGlzaGVkIGFuZCBpdCBpcyBhbHJlYWR5IGxvY2tlZCIKPiA+Pj4g
Y2FzZSwgdGhlIG9ubHkgb3B0aW9uIGlzIHRvIGhhdmUgYSBmaXhtYXAgZW50cnkgd2hpY2ggY2Fu
IGJlIHNldAo+ID4+PiBkeW5hbWljYWxseS7CoCBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBmaXht
YXAgcmVnaW9uIGlzIG1hcmtlZCBOWCBhbmQgNjRHCj4gPj4+IGF3YXkgZnJvbSAudGV4dC4KPiA+
Pj4KPiA+Pj4gUG9zc2libHkgdGhlIGxlYXN0IGJhZCBvcHRpb24gaXMgdG8gaGF2ZSBzb21lIGJ1
aWxkLXRpbWUgc3BhY2UgKHNvIDAgb3IKPiA+Pj4gNGsgZGVwZW5kaW5nIG9uIENPTkZJR19IWVBF
UlYpIGJldHdlZW4gdGhlIHBlci1jcHUgc3R1YnMgYW5kCj4gPj4+IFhFTl9WSVJUX0VORCwgd2hp
Y2ggb3BlcmF0ZXMgbGlrZSB0aGUgZml4bWFwLCBidXQgZW5kcyB1cCBhcyBYL1JPIG1hcHBpbmdz
Lgo+ID4+Pgo+ID4+IE9LLiBUaGlzIGlzIHByb2JhYmx5IG5vdCB0b28gZGlmZmljdWx0LiAKPiA+
Pgo+ID4gSSBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhpcyB0b2RheSBhbmQgd2FudCB0byBtYWtl
IHN1cmUgSSB1bmRlcnN0YW5kCj4gPiB3aGF0IHlvdSBoYWQgaW4gbWluZC4KPiA+Cj4gPiBTdXBw
b3NlIHdlIHNldCBhc2lkZSBzb21lIHNwYWNlIGluIGxpbmtlciBzY3JpcHQuIFVzaW5nIHRoZSBm
b2xsb3dpbmcKPiA+IHdpbGwgZ2l2ZSB5b3UgYSBXQVggc2VjdGlvbi4gSSBzdGlsbCBuZWVkIHRv
IGFkZCBDT05GSUdfR1VFU1QgYXJvdW5kIGl0LAo+ID4gYnV0IHlvdSBnZXQgdGhlIGlkZWEuCj4g
Pgo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gv
eDg2L3hlbi5sZHMuUwo+ID4gaW5kZXggMTExZWRiNTM2MC4uYTdhZjMyMTEzOSAxMDA2NDQKPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMKPiA+IEBAIC0zMDUsNiArMzA1LDE1IEBAIFNFQ1RJT05TCj4gPiAgICAgICAgIC4gPSBB
TElHTihQT0lOVEVSX0FMSUdOKTsKPiA+ICAgICAgICAgX19ic3NfZW5kID0gLjsKPiA+ICAgIH0g
OnRleHQKPiA+ICsKPiA+ICsgIC4gPSBBTElHTihTRUNUSU9OX0FMSUdOKTsKPiA+ICsgIERFQ0xf
U0VDVElPTigudGV4dC5oeXBlcmNhbGxfcGFnZSkgewo+ID4gKyAgICAgICAuID0gQUxJR04oUEFH
RV9TSVpFKTsKPiA+ICsgICAgICAgX19oeXBlcmNhbGxfcGFnZV9zdGFydCA9IC47Cj4gPiArICAg
ICAgIC4gPSAuICsgUEFHRV9TSVpFOwo+ID4gKyAgICAgICBfX2h5cGVyY2FsbF9wYWdlX2VuZCA9
IC47Cj4gPiArICB9IDp0ZXh0PTB4OTA5MAo+ID4gKwo+ID4gICAgX2VuZCA9IC4gOwo+ID4gIAo+
ID4gICAgLiA9IEFMSUdOKFNFQ1RJT05fQUxJR04pOwo+ID4KPiA+Cj4gPiBBbmQgdGhlbj8gVXNl
IG1hcF9wYWdlc190b194ZW4oLi4uLCBQQUdFX0hZUEVSVklTT1JfUlgpIHRvIHBvaW50IHRoYXQK
PiA+IGFkZHJlc3MgdG8gKE1BWFBIWVNBRERSLVBBR0VfU0laRSk/Cj4gCj4gQWggbm8uwqAgVGhp
cyBzdGlsbCBwdXRzIHRoZSBoeXBlcmNhbGwgcGFnZSAob3IgYXQgbGVhc3QsIHNwYWNlIGZvciBp
dCkKPiBpbiB0aGUgWGVuIGltYWdlIGl0c2VsZiwgd2hpY2ggaXMgc29tZXRoaW5nIHdlIGFyZSB0
cnlpbmcgdG8gYXZvaWQuCj4gCj4gV2hhdCBJIG1lYW50IHdhcyB0byBiYXNpY2FsbHkgY29weSgv
ZXh0ZW5kKSB0aGUgZXhpc3RpbmcgZml4bWFwCj4gaW1wbGVtZW50YXRpb24sIGNhbGxpbmcgaXQg
Zml4bWFwX3goKSAob3Igc29tZXRoaW5nIGJldHRlciksIGFuZCBwdXQKPiBGSVhNQVBfWF9TSVpF
IGFzIGFuIGFkZGl0aW9uYWwgZ2FwIGluIHRoZSBjYWxjdWxhdGlvbgo+IGFsbG9jX3N0dWJfcGFn
ZSgpLsKgIEV2ZW4gdGhlIGN1cnJlbnQgZml4bWFwIGNvZGUgaGFzIGFuIGlmZGVmIGV4YW1wbGUK
PiBmb3IgQ09ORklHX1hFTl9HVUVTVC4KCk5vdCBqdXN0IGFsbG9jX3N0dWJfcGFnZSwgYnV0IGFs
c28gbGl2ZXBhdGNoIGluZnJhc3RydWN0dXJlJ3MgYWRkcmVzcwpzcGFjZSBhcnJhbmdlbWVudCAt
LSBzZWUgYXJjaC94ODYvbGl2ZXB0Y2guYzphcmNoX2xpdmVwYXRjaF9pbml0LgoKU3VwcG9zZSBJ
IGNvcHkgdGhlIGV4aXN0aW5nIGZpeG1hcCBtZWNoYW5pc20sIHRvIGdldCB0aGUgdW5pZm9ybQpl
eHBlcmllbmNlIGZvciB0aGVzZSB0d28gdmFyaWFudHMgZm9yIGZpeG1hcCwgSSB3aWxsIGFsc28g
bmVlZCB0bwpzdGF0aWNhbGx5IGFsbG9jYXRlIGl0cyBsMiBhbmQgbDEgcGFnZSB0YWJsZXMuIFRo
aXMgZW5kcyB1cCBwdXR0aW5nIHR3bwptb3JlIHBhZ2VzIGludG8gWGVuJ3MgaW1hZ2UuICBJIHdh
bnQgdG8gbWFrZSBzdXJlIHRoaXMgaXMgd2hhdCB5b3Ugd2FudApiZWNhdXNlIHlvdSBzZWVtZWQg
dG8gYmUgY29uY2VybiBhYm91dCBlbmxhcmdpbmcgaW1hZ2Ugc2l6ZS4KCldlaS4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
