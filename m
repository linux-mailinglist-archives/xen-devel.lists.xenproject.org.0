Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502F61FEA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 15:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkU5d-0000SF-Ld; Mon, 08 Jul 2019 13:53:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JLYo=VF=amazon.de=prvs=08506611a=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hkU5b-0000SA-PM
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 13:53:55 +0000
X-Inumbo-ID: d2c06b27-a187-11e9-8980-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d2c06b27-a187-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562594033; x=1594130033;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LlzsfnccxeQCj5t42ljQnrSkRbtJIJLCibpgr/b34f4=;
 b=uvnnIv1d5GOQ6DrmBwH2syfCt29DJ9XeJ08d658tqvGemdP/iZI5JaJ1
 T9uCIqjs6z/Td2lj55BI0jSx8zzmpRN/ygwOcpD28MUSAjdwGdW2FXrWj
 YhZzipVidB7MVZpcRuQ0whTBZ9iLz8+HoPBlAdGAtxqoGgyxTNsz9nIQP c=;
X-IronPort-AV: E=Sophos;i="5.62,466,1554768000"; d="scan'208";a="409760420"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 08 Jul 2019 13:53:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8657EA1FB5; Mon,  8 Jul 2019 13:53:49 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 8 Jul 2019 13:53:48 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.161.139) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 8 Jul 2019 13:53:42 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-4-git-send-email-nmanthey@amazon.de>
 <5CE6B5E50200007800231C66@prv1-mh.provo.novell.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <f44e9114-96e8-bf8a-e66e-f6d8951080d5@amazon.de>
Date: Mon, 8 Jul 2019 15:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5CE6B5E50200007800231C66@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.139]
X-ClientProxiedBy: EX13D25UWC002.ant.amazon.com (10.43.162.210) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 3/3] common/grant_table:
 harden version dependent accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yMy8xOSAxNzowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDUuMTkgYXQg
MDk6NDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBHdWVzdHMgY2FuIGlzc3VlIGdy
YW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxlZAo+PiBkYXRh
IHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkgbG9hZHMgYWZ0
ZXIgYm91bmQKPj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBEZXBlbmRpbmcgb24gdGhlIGdyYW50
IHRhYmxlIHZlcnNpb24sIHRoZQo+PiBzaXplIG9mIGVsZW1lbnRzIGluIGNvbnRhaW5lcnMgZGlm
ZmVyLiBBcyB0aGUgYmFzZSBkYXRhIHN0cnVjdHVyZSBpcwo+PiBhIHBhZ2UsIHRoZSBudW1iZXIg
b2YgZWxlbWVudHMgcGVyIHBhZ2UgYWxzbyBkaWZmZXJzLiBDb25zZXF1ZW50bHksCj4+IGJvdW5k
IGNoZWNrcyBhcmUgdmVyc2lvbiBkZXBlbmRlbnQsIHNvIHRoYXQgc3BlY3VsYXRpdmUgZXhlY3V0
aW9uIGNhbgo+PiBoYXBwZW4gaW4gc2V2ZXJhbCBzdGFnZXMsIHRoZSBib3VuZCBjaGVjayBhcyB3
ZWxsIGFzIHRoZSB2ZXJzaW9uIGNoZWNrLgo+Pgo+PiBUaGlzIGNvbW1pdCBtaXRpZ2F0ZXMgY2Fz
ZXMgd2hlcmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGNvdWxkIGhhcHBlbgo+PiBkdWUgdG8gdGhl
IHZlcnNpb24gY29tcGFyaXNvbi4gSW4gY2FzZXMsIHdoZXJlIG5vIGRpZmZlcmVudCBtZW1vcnkK
Pj4gbG9jYXRpb25zIGFyZSBhY2Nlc3NlZCBvbiB0aGUgY29kZSBwYXRoIHRoYXQgZm9sbG93IGFu
IGlmIHN0YXRlbWVudCwKPj4gbm8gcHJvdGVjdGlvbiBpcyByZXF1aXJlZC4gTm8gZGlmZmVyZW50
IG1lbW9yeSBsb2NhdGlvbnMgYXJlIGFjY2Vzc2VkCj4+IGluIHRoZSBmb2xsb3dpbmcgZnVuY3Rp
b25zIGFmdGVyIGEgdmVyc2lvbiBjaGVjazoKPj4KPj4gICogZ250dGFiX3NldHVwX3RhYmxlOiBv
bmx5IGNhbGN1bGF0ZWQgbnVtYmVyc2kgYXJlIHVzZWQsIGFuZCB0aGVuCj4+ICAgICAgICAgZnVu
Y3Rpb24gZ250dGFiX2dyb3dfdGFibGUgaXMgY2FsbGVkLCB3aGljaCBpcyB2ZXJzaW9uIHByb3Rl
Y3RlZAo+Pgo+PiAgKiBnbnR0YWJfdHJhbnNmZXI6IHRoZSBjYXNlIHRoYXQgZGVwZW5kcyBvbiB0
aGUgdmVyc2lvbiBjaGVjayBqdXN0IGdldHMKPj4gICAgICAgICBpbnRvIGNvcHlpbmcgYSBwYWdl
IG9yIG5vdAo+IFdlbGwsIHRoaXMgaXMgYSBsaXR0bGUgbGF4LCBidXQgSSdtIHdpbGxpbmcgdG8g
YWNjZXB0IGl0LiBUaGVyZSBjb3VsZCwgYWZ0ZXIKPiBhbGwsIHN0aWxsIGJlIHNwZWN1bGF0aW9u
IGludG8gYWxsb2NfZG9taGVhcF9wYWdlKCkuCj4KPj4gICogYWNxdWlyZV9ncmFudF9mb3JfY29w
eTogdGhlIG5vdCBmaXhlZCBjb21wYXJpc29uIGlzIG9uIHRoZSBhYm9ydCBwYXRoCj4+ICAgICAg
ICAgYW5kIGRvZXMgbm90IGFjY2VzcyBvdGhlciBzdHJ1Y3R1cmVzLCBhbmQgb24gdGhlIGVsc2Ug
YnJhbmNoIG9ubHkKPj4gICAgICAgICBhY2Nlc3NlcyBzdHJ1Y3R1cmVzIHRoYXQgYXJlIHByb3Bl
cmx5IGFsbG9jYXRlZAo+IEFzIHNhaWQgaW4gbXkgcmVjZW50IHJlcGx5IHRvIHYxMCBvZiB0aGUg
b3JpZ2luYWwgc2VyaWVzLCBpbiBwYXJ0aWN1bGFyCj4gZm9yIGZpeHVwX3N0YXR1c19mb3JfY29w
eV9waW4oKSB0aGlzIGlzbid0IGltbWVkaWF0ZWx5IG9idmlvdXMuIEluCj4gbm8gY2FzZSBpcyAi
ZG9lcyBub3QgYWNjZXNzIG90aGVyIHN0cnVjdHVyZXMiIHRydWUsIHRob3VnaC4gSG93Cj4gYWJv
dXQgc2F5aW5nICJhY2Nlc3NlcyBvbmx5IHN0cnVjdHVyZXMgdGhhdCBoYXZlIGJlZW4gdmFsaWRh
dGVkCj4gYmVmb3JlIiBvciBzb21lIHN1Y2ggaW5zdGVhZCAoSSBkb24ndCBwYXJ0aWN1bGFybHkg
bGlrZSAidmFsaWRhdGVkIgo+IGhlcmUsIGJ1dCBJIGNhbid0IGN1cnJlbnRseSB0aGluayBvZiBh
bnl0aGluZyBiZXR0ZXIpPwpJIHdpbGwgcmVwaHJhc2UgYWNjb3JkaW5nbHkuCj4KPj4gICogZ250
dGFiX3NldF92ZXJzaW9uOiBhbGwgYWNjZXNzaWJsZSBkYXRhIGlzIGFsbG9jYXRlZCBmb3IgYm90
aCB2ZXJzaW9ucwo+IFRoaXMgaXMgbm90IGVub3VnaCBmb3IgbXkgdGFzdGU6IFRoZSB2ZXJ5IGZp
cnN0IGxvb3AgaXMgc2FmZSBvbmx5Cj4gYmVjYXVzZSBucl9ncmFudF9lbnRyaWVzKCkgaXMuIEFu
ZCBzcGVjdWxhdGluZyBpbnRvCj4gZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1lcygpIGRv
ZXNuJ3QgbG9vayBzYWZlIGF0IGFsbCwgYXMKPiBndC0+c3RhdHVzW2ldIG1heSBiZSBOVUxMLgpT
bywgeW91IGJhc2ljYWxseSB3YW50IHRvIHNlZSBhIGJsb2NrX3NwZWN1bGF0aW9uKCkgYXQgdGhl
IGJlZ2lubmluZyBvZgp0aGUgZnVuY3Rpb24gZ250dGFiX3BvcHVsYXRlX3N0YXR1c19mcmFtZXMg
YW5kCmdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXM/IEkgZG8gbm90IGNsYWltIHRvIHBy
b3RlY3QgYWdhaW5zdApzcGVjdWxhdGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgdGhhdCBhcmUg
Y2F1c2VkIGJ5IHRoZSBmb3IgbG9vcCBpbgpnbnR0YWJfc2V0X3ZlcnNpb24uCj4KPj4gICogZ250
dGFiX3JlbGVhc2VfbWFwcGluZ3M6IHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIG9ubHkgZHVyaW5n
IGRvbWFpbgo+PiAgICAgICAgZGVzdHJ1Y3Rpb24gYW5kIGNvbnRyb2wgaXMgbm90IHJldHVybmVk
IHRvIHRoZSBndWVzdAo+Pgo+PiAgKiBtZW1fc2hhcmluZ19ncmVmX3RvX2dmbjogc3BlY3VsYXRp
b24gd2lsbCBiZSBzdG9wZWQgYnkgdGhlIHNlY29uZCBpZgo+PiAgICAgICAgc3RhdGVtZW50LCBh
cyB0aGF0IHBsYWNlcyBhIGJhcnJpZXIgb24gYW55IHBhdGggdG8gYmUgZXhlY3V0ZWQuCj4+Cj4+
ICAqIGdudHRhYl9nZXRfc3RhdHVzX2ZyYW1lX21mbjogbm8gdmVyc2lvbiBkZXBlbmRlbnQgY2hl
Y2ssIGJlY2F1c2UgYWxsCj4+ICAgICAgICBhY2Nlc3NlcywgZXhjZXB0IHRoZSBndC0+c3RhdHVz
W2lkeF0sIGRvIG5vdCBwZXJmb3JtIGFjdHVhbAo+PiAgICAgICAgb3V0LW9mLWJvdW5kIGFjY2Vz
c2VzLCBpbmNsdWRpbmcgdGhlIGdudHRhYl9ncm93X3RhYmxlIGZ1bmN0aW9uCj4+ICAgICAgICBj
YWxsLgo+IE5pdDogSSB2ZXJ5IG11Y2ggaG9wZSBubyBjb2RlIGFueXdoZXJlIHBlcmZvcm1zIF9h
Y3R1YWxfIG91dCBvZgo+IGJvdW5kIGFjY2Vzc2VzLiBJJ20gc3VyZSB5b3UgbWVhbiBzcGVjdWxh
dGl2ZSBvbmVzIGhlcmUuClllcywgSSBkbyBub3QgbWVhbiBhY3R1YWwgb3V0LW9mLWJvdW5kIGFj
Y2Vzc2VzLiBXaGF0IEkgYWN0dWFsbHkgbWVhbnQ6CmFsbCBvdGhlciBhY2Nlc3NlcyBpbiB0aGlz
IGZ1bmN0aW9uIGFyZSB0byB2YXJpYWJsZXMsIGFuZCBub3QgYmFzZWQgb24KYW4gaW5kZXguCj4K
Pj4gICogZ250dGFiX2dldF9zaGFyZWRfZnJhbWU6IGJsb2NrX3NwZWN1bGF0aW9uIGluCj4+ICAg
ICAgICBnbnR0YWJfZ2V0X3N0YXR1c19mcmFtZV9tZm4gYmxvY2tzIGFjY2Vzc2VzCj4gVGhlIGZv
cm1lciBkb2Vzbid0IGNhbGwgdGhlIGxhdHRlciwgYW5kIGFzIHBlciBteSBwYXRjaCAyIGNvbW1l
bnRzCj4gZ250dGFiX2dldF9zaGFyZWRfZnJhbWVfbWZuKCkgbG9va3MgdG8gcmVtYWluIHVucHJv
dGVjdGVkIGFmdGVyCj4gcGF0Y2ggMi4KClRydWUsIEkgd2lsbCBhZGQgYSBibG9ja19zcGVjdWxh
dGlvbigpIGJlbG93IHRoZSBhc3NlcnQgc3RhdGVtZW50LCBzbwp0aGF0IHRoZSBjb25kaXRpb24g
aXMgdHJ1ZSBldmVuIHdoZW4gZXhlY3V0aW5nIHNwZWN1bGF0aXZlbHkuCgpCZXN0LApOb3JiZXJ0
CgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4g
MzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
UmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1
bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
