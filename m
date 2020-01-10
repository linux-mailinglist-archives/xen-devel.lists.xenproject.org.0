Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD893136BAB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 12:06:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ips4C-0006Wm-FQ; Fri, 10 Jan 2020 11:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CofM=27=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ips4A-0006Wf-Ac
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 11:02:58 +0000
X-Inumbo-ID: c1ea9fa6-3398-11ea-bec4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1ea9fa6-3398-11ea-bec4-12813bfff9fa;
 Fri, 10 Jan 2020 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578654177;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=62wAlC/L0QnpvCXDSqyeZPorvRalzGJOuRWuulSE36c=;
 b=exEZjbjhDQvbLLcsrw74Qd5JY8I5wTO9q4S/zpWF3ww1IKW3r6Ct5LEv
 k/XIDvq9zXXabFesXe6qZOioEwId+sRquazmC8nQvaqX+8LN9PfzSFbwk
 9Gqil9auNI39ICPdz8pluCLmPIuMSM+HLB1dH6xRvjKDB/hS4d5Q4W6jk M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9aDmROsdXrvwTUE57XYHvMlYqOlSiLQLciM+C8/U7H614KKdDl9IXEvRORbHVw7H7eUH9//9kx
 Z+f2TCe3kR3oSkIMkgqupx9ml+gnNNTtxqIzXzmtZKXRGiGDDxryvocMiI48ZoZvR+O4jH5hah
 GcHyg5aeiYJbxiWqH0t6zNiBlLdaM3KU2sxQ0guBMUhHgGX+7vm5IyBlNGVPeKB7bdC1xtBn0m
 xhkmX7CLslZq7WHUihgo4I3ExMNuTdgfqIIvGQnL6ORREkT4d5BCuqbZ3m9Cfhsj3LBwILM4HD
 YYg=
X-SBRS: 2.7
X-MesageID: 11166621
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,416,1571716800"; d="scan'208";a="11166621"
To: Sergey Dyasli <sergey.dyasli@citrix.com>, <xen-devel@lists.xen.org>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
Date: Fri, 10 Jan 2020 11:02:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200110103723.29538-1-sergey.dyasli@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDEvMjAyMCAxMDozNywgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBIaWRlIHRoZSBmb2xs
b3dpbmcgaW5mb3JtYXRpb24gdGhhdCBjYW4gaGVscCBpZGVudGlmeSB0aGUgcnVubmluZyBYZW4K
PiBiaW5hcnkgdmVyc2lvbjogWEVOVkVSX2V4dHJhdmVyc2lvbiwgWEVOVkVSX2NvbXBpbGVfaW5m
bywgWEVOVkVSX2NoYW5nZXNldC4KPiBBZGQgZXhwbGljaXQgY2FzZXMgZm9yIFhFTlZFUl9jb21t
YW5kbGluZSBhbmQgWEVOVkVSX2J1aWxkX2lkIGFzIHdlbGwuCj4KPiBJbnRyb2R1Y2UgeHNtX2Zp
bHRlcl9kZW5pZWQoKSB0byBodm1sb2FkZXIgdG8gcmVtb3ZlICI8ZGVuaWVkPiIgc3RyaW5nCj4g
ZnJvbSBndWVzdCdzIERNSSB0YWJsZXMgdGhhdCBvdGhlcndpc2Ugd291bGQgYmUgc2hvd24gaW4g
dG9vbHMgbGlrZQo+IGRtaWRlY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkg
PHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAtLS0KPiB2MSAtLT4gdjI6Cj4gLSBBZGRlZCB4
c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciBpbnN0ZWFkIG9mIG1vZGlmeWluZyB4ZW5f
ZGVueSgpCj4gLSBNYWRlIGJlaGF2aW91ciB0aGUgc2FtZSBmb3IgYm90aCBSZWxlYXNlIGFuZCBE
ZWJ1ZyBidWlsZHMKPiAtIFhFTlZFUl9jYXBhYmlsaXRpZXMgaXMgbm8gbG9uZ2VyIGhpZGVkCj4K
PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDQzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENDOiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IENDOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KPiBDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CgpJIHJl
YWxpc2UgdGhlcmUgYXJlIGFyZ3VtZW50cyBvdmVyIGhvdyB0byBmaXggdGhpcywgYnV0IHdlICh0
aGUgWGVuCmNvbW11bml0eSkgaGF2ZSBhbHJlYWR5IGYqY2tlZCB1cCBvbmNlIGhlcmUsIGFuZCB0
aGlzIGlzIGRvaW5nIHNvIGEKc2Vjb25kIHRpbWUuCgpOYWNrLgoKRml4aW5nIGl0IGFueXdoZXJl
IG90aGVyIHRoYW4gWGVuIGlzIHNpbXBseSBub3QgYXBwcm9wcmlhdGUuCgpUaGUgcmVhc29uIGZv
ciB0aGlzICh3aGljaCBvdWdodCB0byBiZSBvYnZpb3VzLCBidXQgSSBndWVzcyBvbmx5IHRvCnRo
b3NlIHdobyBhY3R1YWxseSBkbyBjdXN0b21lciBzdXBwb3J0KSBpcyBiYXNpYyBodW1hbiBwaHlz
aW9sb2d5LsKgCiJkZW5pZWQiIG1lYW5zIHNvbWV0aGluZyBoYXMgZ29uZSB3cm9uZy7CoCBJdCBz
Y2FyZXMgcGVvcGxlLCBhbmQgY2F1c2VzCnRoZW0gdG8gc2VlayBoZWxwIHRvIGNoYW5nZSBmaXgg
d2hhdGV2ZXIgaXMgYnJva2VuLgoKSXQgaXMgbm90IGFwcHJvcHJpYXRlIGZvciBpdCB0byBmaW5k
IGl0cyB3YXkgaW50byB0aGUgZ3Vlc3QgaW4gdGhlIGZpcnN0CnBsYWNlLCBhbmQgdGhhdCBpbmNs
dWRlcyB0dXJuaW5nIHVwIGluIGBkbWVzZ2AgYW5kIG90aGVyIGxvZ3MsIGFuZApleHBlY3Rpbmcg
Z3Vlc3QgcnVudGltZSB0byBmaWx0ZXIgZm9yIGl0IGlzIGNvbXBsZXRlIG5vbnNlbnNlLgoKQXMg
c2FpZCBzZXZlcmFsIHRpbWVzIGJlZm9yZSwgdGhlIGVtcHR5IHN0cmluZyBpcyBjb21wbGV0ZWx5
IGZpbmUgQUJJCndpc2UsIGRvZXNuJ3QgY29uZnVzZSBjdXN0b21lcnMsIGFuZCByZWFsbHkgcmVh
bGx5IGRvZXMgd29yayBpbiBwcmFjdGljZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
