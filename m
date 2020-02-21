Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5630167DFC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:07:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j57zk-0007Xj-Ih; Fri, 21 Feb 2020 13:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j57zj-0007Xd-AF
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:05:27 +0000
X-Inumbo-ID: d3bd32f6-54aa-11ea-8654-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3bd32f6-54aa-11ea-8654-12813bfff9fa;
 Fri, 21 Feb 2020 13:05:26 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so2223465edb.10
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 05:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zs4WECb/a881NZpTohfbkenC/TRqfZTLWToxWGX9opA=;
 b=SNKnBFOX8uoMgLgtwgp8p757AnoDXm7vxCiYiQHYKJPEExusLokAiK4nrjBTXxV9Hm
 7Nt6ziwdhE/He1r3gzzqGR7Dtb6Knqy8ZnyD5sWyPbjcBR/JRfGW2/aXPw9k0wLKFp8f
 jV2ApRM6zrk1uge0dI+jVk1n1dTwUzHo3QUlWGewXUVZBmYlgQHPJXXlvPJt5gWdnMdl
 hYj/DMrlzNrRohu0nlVFSOgyCHA7Raco3l9ZMBDPMSt1GLOmHLo4liPdpHOVMB41UQdQ
 yadr+DQZ3xKW0KuxX1IqH61zoN3nHEXpiIoe1tsDH2Nl5HdGfSmSyedOaP1wg70MvDxw
 zGTg==
X-Gm-Message-State: APjAAAW8QeUmR3DR/QNuqQdZC7Xvm0Hs/0yGKPceT3o+t1BbKQL3yAKI
 jywpkqTwkJgV68BkymjLxcw=
X-Google-Smtp-Source: APXvYqwA+/iyjg3LGAdx6Vktjzmted+nuSgq3ru1vgyxJxfRGpJJ3NmCXyeYU05Mneh5XIf8mgVrmw==
X-Received: by 2002:a17:906:1f94:: with SMTP id
 t20mr34773275ejr.5.1582290325837; 
 Fri, 21 Feb 2020 05:05:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id b9sm299386edm.60.2020.02.21.05.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 05:05:25 -0800 (PST)
To: Hongyan Xia <hongyxia@amazon.com>, xen-devel@lists.xenproject.org
References: <27c7736ec643dd0dd3cf469e6dc57f9d36379dcb.1582281718.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ac8f2226-3a3e-53f6-1b30-b3f4953f394c@xen.org>
Date: Fri, 21 Feb 2020 13:05:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <27c7736ec643dd0dd3cf469e6dc57f9d36379dcb.1582281718.git.hongyxia@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] x86/mm: switch to new APIs in
 arch_init_memory
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

SGkgSG9uZ3lhbiwKCk9uIDIxLzAyLzIwMjAgMTA6NDIsIEhvbmd5YW4gWGlhIHdyb3RlOgo+IEZy
b206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gU2luY2Ugd2Ugbm93IG1hcCBh
bmQgdW5tYXAgWGVuIFBURSBwYWdlcywgd2Ugd291bGQgbGlrZSB0byB0cmFjayB0aGUKPiBsaWZl
dGltZSBvZiBtYXBwaW5ncyBzbyB0aGF0IDEpIHdlIGRvIG5vdCBkZXJlZmVyZW5jZSBtZW1vcnkg
dGhyb3VnaCBhCj4gdmFyaWFibGUgYWZ0ZXIgaXQgaXMgdW5tYXBwZWQsIDIpIHdlIGRvIG5vdCB1
bm1hcCBtb3JlIHRoYW4gb25jZS4KPiBUaGVyZWZvcmUsIHdlIGludHJvZHVjZSB0aGUgVU5NQVBf
RE9NQUlOX1BBR0UgbWFjcm8gdG8gbnVsbGlmeSB0aGUKPiB2YXJpYWJsZSBhZnRlciB1bm1hcHBp
bmcsIGFuZCBpZ25vcmUgTlVMTCBpbiB1bm1hcF9kb21haW5fcGFnZS4KCklmIHdlIHdhbnQgdG8g
c3VwcG9ydCBOVUxMIGluIHVubWFwX2RvbWFpbl9wYWdlKCkgdGhlbiB3ZSB3b3VsZCBuZWVkIHRv
IApyZXBsaWNhdGUgdGhlIGNoYW5nZSBmb3IgQXJtIGFzIHdlbGwuCgpDaGVlcnMsCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+Cj4gLS0tCj4gICB4ZW4vYXJjaC94
ODYvZG9tYWluX3BhZ2UuYyAgICB8ICAyICstCj4gICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAg
ICAgICB8IDE0ICsrKysrKysrLS0tLS0tCj4gICB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2Uu
aCB8ICA1ICsrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jIGIv
eGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKPiBpbmRleCBkZDMyNzEyZDJmLi5iMDM3MjhlMThl
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2RvbWFpbl9wYWdlLmMKPiBAQCAtMTgxLDcgKzE4MSw3IEBAIHZvaWQgdW5tYXBfZG9t
YWluX3BhZ2UoY29uc3Qgdm9pZCAqcHRyKQo+ICAgICAgIHVuc2lnbmVkIGxvbmcgdmEgPSAodW5z
aWduZWQgbG9uZylwdHIsIG1mbiwgZmxhZ3M7Cj4gICAgICAgc3RydWN0IHZjcHVfbWFwaGFzaF9l
bnRyeSAqaGFzaGVudDsKPiAgIAo+IC0gICAgaWYgKCB2YSA+PSBESVJFQ1RNQVBfVklSVF9TVEFS
VCApCj4gKyAgICBpZiAoICF2YSB8fCB2YSA+PSBESVJFQ1RNQVBfVklSVF9TVEFSVCApCj4gICAg
ICAgICAgIHJldHVybjsKPiAgIAo+ICAgICAgIEFTU0VSVCh2YSA+PSBNQVBDQUNIRV9WSVJUX1NU
QVJUICYmIHZhIDwgTUFQQ0FDSEVfVklSVF9FTkQpOwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gaW5kZXggNzBiODdjNDgzMC4uOWZjZGNkZTVi
NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCj4gQEAgLTM1NiwxOSArMzU2LDIxIEBAIHZvaWQgX19pbml0IGFyY2hfaW5pdF9tZW1vcnko
dm9pZCkKPiAgICAgICAgICAgICAgIEFTU0VSVChyb290X3BndF9wdl94ZW5fc2xvdHMgPCBST09U
X1BBR0VUQUJMRV9QVl9YRU5fU0xPVFMpOwo+ICAgICAgICAgICAgICAgaWYgKCBsNF90YWJsZV9v
ZmZzZXQoc3BsaXRfdmEpID09IGw0X3RhYmxlX29mZnNldChzcGxpdF92YSAtIDEpICkKPiAgICAg
ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0YWIgPSBhbGxv
Y194ZW5fcGFnZXRhYmxlKCk7Cj4gKyAgICAgICAgICAgICAgICBtZm5fdCBsM21mbiA9IGFsbG9j
X3hlbl9wYWdldGFibGVfbmV3KCk7Cj4gICAKPiAtICAgICAgICAgICAgICAgIGlmICggbDN0YWIg
KQo+ICsgICAgICAgICAgICAgICAgaWYgKCAhbWZuX2VxKGwzbWZuLCBJTlZBTElEX01GTikgKQo+
ICAgICAgICAgICAgICAgICAgIHsKPiAtICAgICAgICAgICAgICAgICAgICBjb25zdCBsM19wZ2Vu
dHJ5X3QgKmwzaWRsZSA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgIGw0ZV90b19sM2UoaWRs
ZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoc3BsaXRfdmEpXSk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgbDNfcGdlbnRyeV90ICpsM2lkbGUgPSBtYXBfbDN0X2Zyb21fbDRlKAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoc3BsaXRf
dmEpXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgbDNfcGdlbnRyeV90ICpsM3RhYiA9IG1hcF9k
b21haW5fcGFnZShsM21mbik7Cj4gICAKPiAgICAgICAgICAgICAgICAgICAgICAgZm9yICggaSA9
IDA7IGkgPCBsM190YWJsZV9vZmZzZXQoc3BsaXRfdmEpOyArK2kgKQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbDN0YWJbaV0gPSBsM2lkbGVbaV07Cj4gICAgICAgICAgICAgICAgICAgICAg
IGZvciAoIDsgaSA8IEwzX1BBR0VUQUJMRV9FTlRSSUVTOyArK2kgKQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbDN0YWJbaV0gPSBsM2VfZW1wdHkoKTsKPiAtICAgICAgICAgICAgICAgICAg
ICBzcGxpdF9sNGUgPSBsNGVfZnJvbV9tZm4odmlydF90b19tZm4obDN0YWIpLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9S
Vyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgc3BsaXRfbDRlID0gbDRlX2Zyb21fbWZuKGwzbWZu
LCBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgVU5NQVBfRE9N
QUlOX1BBR0UobDNpZGxlKTsKPiArICAgICAgICAgICAgICAgICAgICBVTk1BUF9ET01BSU5fUEFH
RShsM3RhYik7Cj4gICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgIGVsc2UK
PiAgICAgICAgICAgICAgICAgICAgICAgKytyb290X3BndF9wdl94ZW5fc2xvdHM7Cj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oIGIveGVuL2luY2x1ZGUveGVuL2Rv
bWFpbl9wYWdlLmgKPiBpbmRleCAzMjY2OWEzMzM5Li5hMTgyZDMzYjY3IDEwMDY0NAo+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2Rv
bWFpbl9wYWdlLmgKPiBAQCAtNzIsNCArNzIsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdW5tYXBf
ZG9tYWluX3BhZ2VfZ2xvYmFsKGNvbnN0IHZvaWQgKnZhKSB7fTsKPiAgIAo+ICAgI2VuZGlmIC8q
ICFDT05GSUdfRE9NQUlOX1BBR0UgKi8KPiAgIAo+ICsjZGVmaW5lIFVOTUFQX0RPTUFJTl9QQUdF
KHApIGRvIHsgICBcCj4gKyAgICB1bm1hcF9kb21haW5fcGFnZShwKTsgICAgICAgICAgIFwKPiAr
ICAgIChwKSA9IE5VTEw7ICAgICAgICAgICAgICAgICAgICAgXAo+ICt9IHdoaWxlICggZmFsc2Ug
KQo+ICsKPiAgICNlbmRpZiAvKiBfX1hFTl9ET01BSU5fUEFHRV9IX18gKi8KPiAKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
