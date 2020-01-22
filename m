Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7744B145EB4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 23:40:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuOcS-0001tI-UW; Wed, 22 Jan 2020 22:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac9L=3L=amazon.com=prvs=2839ba572=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuOcR-0001tB-FP
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 22:37:03 +0000
X-Inumbo-ID: b56d9070-3d67-11ea-bd78-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b56d9070-3d67-11ea-bd78-12813bfff9fa;
 Wed, 22 Jan 2020 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579732623; x=1611268623;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aAM3sW4IxLZzmQdlW7FjdcSp7Yr8yU5Z0+eJh1m+Pas=;
 b=v09Ciil5xPBN2q9n2AcdqDHy/pMf9HSfgHHU2aKHj1LnvOiaW2EAc+7e
 eKEiWXqBno8551SqZ0sHjYoN6af3aRVUZU2S4bYbMm3z4wXhMYN2vdtR2
 zyaP9GzELyaaKJNAsm/hZOEkd3KilkWz47jhl8QI1cIFpA9gVoFqs6/ZH w=;
IronPort-SDR: 8b9hP+n9rJi4fqmphC7OXMF6FSoAy+xXh0wfC0y16ecazZKqmRJgsdarbj9mnyHaQYa03P8BcM
 +m4/vxF2uOmg==
X-IronPort-AV: E=Sophos;i="5.70,351,1574121600"; d="scan'208";a="12071931"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Jan 2020 22:36:51 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6B7BA247346; Wed, 22 Jan 2020 22:36:47 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 22:36:46 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.162.224) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:36:41 +0000
From: Eslam Elnikety <elnikety@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
 <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
 <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
 <d93d5931-6b59-649b-c989-9263c3c9a913@amazon.com>
 <f3f0f684-2520-e7de-870a-7d7be40f66b2@suse.com>
 <75c6a71c-f1d2-0c10-663a-153b329cf2c9@amazon.com>
Message-ID: <adfe1974-bf3a-d4d4-c7b4-2e10a552d9d5@amazon.com>
Date: Wed, 22 Jan 2020 23:36:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <75c6a71c-f1d2-0c10-663a-153b329cf2c9@amazon.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.224]
X-ClientProxiedBy: EX13D27UWA002.ant.amazon.com (10.43.160.30) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAgMjE6NTEsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+IE9uIDIxLjAxLjIwIDEw
OjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMDEuMjAyMCAwMDo1MCwgRXNsYW0gRWxu
aWtldHkgd3JvdGU6Cj4+PiBPbiAyMC4wMS4yMCAwOTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTcuMDEuMjAyMCAyMDowNiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+Pj4+IE9uIDIw
LjEyLjE5IDEwOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE5LjEyLjIwMTkgMjI6
MDgsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+Pj4+Pj4+IE9uIDE4LjEyLjE5IDEyOjQ5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMTguMTIuMjAxOSAwMjozMiwgRXNsYW0gRWxuaWtl
dHkgd3JvdGU6Cj4+Pj4+Pj4+PiBEZWNvdXBsZSB0aGUgbWljcm9jb2RlIHJlZmVyZW5jaW5nIG1l
Y2hhbmlzbSB3aGVuIHVzaW5nIEdSVUIgdG8gCj4+Pj4+Pj4+PiB0aGF0Cj4+Pj4+Pj4+PiB3aGVu
IHVzaW5nIEVGSS4gVGhpcyBhbGxvd3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmllZCAKPj4+
Pj4+Pj4+IGVmZmVjdCIgb2YKPj4+Pj4+Pj4+IHVzaW5nIGA8aW50ZWdlcj4gfCBzY2FuYCBhbG9u
ZyB4ZW4uZWZpLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGd1ZXNzICJ1bnNwZWNpZmllZCBlZmZlY3Qi
IGluIHRoZSBkb2Mgd2FzIHByZXR0eSBwb2ludGxlc3MgLSBzdWNoCj4+Pj4+Pj4+IG9wdGlvbnMg
aGF2ZSBiZWVuIGlnbm9yZWQgYmVmb3JlOyBpbiBmYWN0IC4uLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
V2l0aCB0aGF0LCBYZW4gY2FuIGV4cGxpY2l0bHkKPj4+Pj4+Pj4+IGlnbm9yZSB0aG9zZSBuYW1l
ZCBvcHRpb25zIHdoZW4gdXNpbmcgRUZJLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAuLi4gSSBkb24ndCBz
ZWUgdGhpbmdzIGJlY29taW5nIGFueSBtb3JlIGV4cGxpY2l0IChub3QgZXZlbiBwYXJzaW5nCj4+
Pj4+Pj4+IHRoZSBvcHRpb25zIHdhcyBxdWl0ZSBleHBsaWNpdCB0byBtZSkuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4KPj4+Pj4+PiBJIGFncmVlIHRoYXQgdGhvc2Ugb3B0aW9ucyBoYXZlIGJlZW4gaWdub3Jl
ZCBzbyBmYXIgaW4gdGhlIGNhc2UgCj4+Pj4+Pj4gb2YgRUZJLgo+Pj4+Pj4+IFRoZSBkb2N1bWVu
dGF0aW9uIGNvbnRyYWRpY3RzIHRoYXQgaG93ZXZlci4gVGhlIGRvY3VtZW50YXRpb246Cj4+Pj4+
Pj4gKiBzYXlzIDxpbnRlZ2VyPiBoYXMgdW5zcGVjaWZpZWQgZWZmZWN0Lgo+Pj4+Pj4+ICogZG9l
cyBub3QgbWVudGlvbiBhbnl0aGluZyBhYm91dCBzY2FuIGJlaW5nIGlnbm9yZWQuCj4+Pj4+Pj4K
Pj4+Pj4+PiBXaXRoIHRoaXMgcGF0Y2gsIGl0IGlzIGV4cGxpY2l0IGluIGNvZGUgYW5kIGluIGRv
Y3VtZW50YXRpb24gdGhhdCAKPj4+Pj4+PiBib3RoCj4+Pj4+Pj4gb3B0aW9ucyBhcmUgaWdub3Jl
ZCBpbiBjYXNlIG9mIEVGSS4KPj4+Pj4+Cj4+Pj4+PiBCdXQgaXNuJ3QgaXQgcmF0aGVyIHRoYXQg
dWNvZGU9c2NhbiBjb3VsZCAoYW5kIGhlbmNlIHBlcmhhcHMgc2hvdWxkKQo+Pj4+Pj4gYWxzbyBo
YXZlIGl0cyB2YWx1ZSBvbiBFRkk/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJIGRvIG5vdCBzZWUgInVj
b2RlPXNjYW4iIGFwcGxpY2FibGUgaW4gYW55d2F5IGluIHRoZSBjYXNlIG9mIEVGSS4gSW4KPj4+
Pj4gRUZJLCB0aGVyZSBhcmUgbm90ICJtb2R1bGVzIiB0byBzY2FuIHRocm91Z2gsIGJ1dCByYXRo
ZXIgdGhlIGVmaSAKPj4+Pj4gY29uZmlnCj4+Pj4+IHBvaW50cyBleGFjdGx5IHRvIHRoZSBtaWNy
b2NvZGUgYmxvYi4KPj4+Pgo+Pj4+IFdoYXQgd291bGQgYmUgd3Jvbmcgd2l0aCB0aGUgRUZJIGNv
ZGUgdG8gYWxzbyBpbnNwZWN0IHdoYXRldmVyIGhhcyBiZWVuCj4+Pj4gc3BlY2lmaWVkIHdpdGgg
cmFtZGlzaz0gaWYgdGhlcmUgd2FzIG5vIHVjb2RlPSA/Cj4+Pgo+Pj4gSSBzZWUsIGludGVyZXN0
aW5nLiBUaGlzIHNvdW5kcyBsaWtlIGEgbGVnaXRpbWF0ZSB1c2UgY2FzZSBpbmRlZWQuIEkKPj4+
IHdvbmRlciwgd291bGQgSSBiZSBicmVha2luZyBhbnl0aGluZyBpZiBJIHNpbXBseSBhbGxvdyB0
aGUgZXhpc3RpbmcgY29kZQo+Pj4gdGhhdCBpdGVyYXRlcyBvdmVyIG1vZHVsZXMgdG8ga2ljayBp
biB3aGVuIHVjb2RlPXNjYW4gaXJyZXNwZWN0aXZlIG9mCj4+PiBFRkkgb3IgbGVnYWN5IGJvb3Q/
Cj4+Cj4+IEkgZG9uJ3QgdGhpbmsgc28sIG5vLCBidXQgaXQgd291bGQgbmVlZCBkb3VibGUgY2hl
Y2tpbmcgKGFuZAo+PiBtZW50aW9uaW5nIGluIHRoZSBkZXNjcmlwdGlvbiBhbmQvb3IgZG9jdW1l
bnRhdGlvbikuCj4+Cj4+PiBBbHNvLCBpdCBzZWVtcyB0byBtZSB0aGF0IHRoZSB1Y29kZT0gc3Bl
Y2lmaWVkIGJ5Cj4+PiBlZmkuY2ZnIHdvdWxkIHRha2UgcHJlY2VkZW5jZSBvdmVyIHRoZSB1Y29k
ZT1zY2FuLiBEbyBub3QgeW91IHRoaW5rPwo+Pgo+PiBJIGd1ZXNzIHdlIG5lZWQgdG8gc2V0dGxl
IG9uIHdoYXQgd2Ugd2FudCB0byB0YWtlIHByZWNlZGVuY2UgYW5kCj4+IHRoZW4gbWFrZSBzdXJl
IGNvZGUgYWxzbyBiZWhhdmVzIHRoaXMgd2F5LiBCdXQgeWVzLCBJIHRoaW5rIHVjb2RlPQo+PiBm
cm9tIHRoZSAuY2ZnIHNob3VsZCBzdXBlcnNlZGUgdWNvZGU9c2NhbiBvbiB0aGUgY29tbWFuZCBs
aW5lLiBBCj4+IHBvc3NpYmx5IHVzZWZ1bCBhZGp1c3RtZW50IHRvIHRoaXMgbWlnaHQgYmUgdG8g
ZGlzdGluZ3Vpc2ggd2hldGhlcgo+PiB0aGUgdWNvZGU9c2NhbiB3YXMgaW4gYSBzcGVjaWZpYyAu
Y2ZnIHNlY3Rpb24gd2hpbGUgdGhlIHVjb2RlPSB3YXMKPj4gaW4gW2dsb2JhbF0gKGkuZS4gc29y
dCBvZiBhIGRlZmF1bHQpLCBpbiB3aGljaCBjYXNlIG1heWJlIHRoZQo+PiB1Y29kZT1zY2FuIHNo
b3VsZCB3aW4uIFRob3VnaHRzPwo+Pgo+PiBKYW4KPj4KPiAKPiBJIHRoaW5rIGFueSB1Y29kZT0g
aW4gdGhlIEVGSSAuY2ZnIG91Z2h0IHRvIHN1cGVyc2VkZSB0aGUgdWNvZGU9c2Nhbi4gCj4gVGhl
IHNlbWFudGljcyBhcmUgc2ltcGxlciBpbiB0aGlzIGNhc2UsIHJhdGhlciB0aGFuIGhhdmluZyB0
byB3b3JyeSAKPiBhYm91dCB3aGVyZSBleGFjdGx5IHRoZSB1Y29kZT0gd2FzIHNwZWNpZmllZCBp
biB0aGUgRUZJIC5jZmcuIFdpdGggdGhhdCwgCj4gYW4gYWRtaW5pc3RyYXRvciB3b3VsZCBkZWZh
dWx0IHRvIHVzaW5nIHVjb2RlPXNjYW4gb24gdGhlIGNvbW1hbmRsaW5lIHRvIAo+IGxvYWQgdGhl
IHJhbWRpc2sgbWljcm9jb2RlLCBhbmQgYSB1Y29kZT0gaW4gLmNmZyB3b3VsZCBiZSBhbiBleHBs
aWNpdCAKPiBzaWduYWwgdG8gdXNlIGRpZmZlcmVudCBtaWNyb2NvZGUuCj4gCj4gRXNsYW0KPiAK
ClNvIHRoYXQgaGFwcGVucyB0byBiZSB0aGUgZXhpc3RpbmcgYmVoYXZpb3VyIGFscmVhZHkgOikK
Ckkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgdWNvZGU9c2NhbiB3YXMgc2ltcGx5IGln
bm9yZWQgdW5kZXIgRUZJLiAKVGhhdCdzIG5vdCB0aGUgY2FzZS4gSXQgaXMgb25seSBpZ25vcmVk
IGlmIHVjb2RlPTxmaWxlbmFtZT4gaXMgc3BlY2lmaWVkIAppbiB0aGUgRUZJIGNvbmZpZy4gSW4g
b3RoZXIgd29yZHMsIHdoYXQgd2UgaGFkIGp1c3QgZGlzY3Vzc2VkIGFib3ZlIGlzIAphbHJlYWR5
IHRoZSBjYXNlLiBUaGlzIGNsZWFybHkgbmVlZHMgc3BlbGxpbmcgb3V0IGluIHRoZSBkb2N1bWVu
dGF0aW9uLCAKd2hpY2ggaXMgdGhlIGZpcnN0IHBhdGNoIGluIHRoZSAieDg2L21pY3JvY29kZTog
SW1wcm92ZSBkb2N1bWVudGF0aW9uIAphbmQgY29kZSIgc2VyaWVzIEkgaGF2ZSBzZW50IGp1c3Qg
bm93LgoKQ2hlZXJzLApFc2xhbQoKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
