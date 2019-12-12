Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355011CD62
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:41:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNid-00085L-BM; Thu, 12 Dec 2019 12:37:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Md0W=2C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifNib-00084F-Ej
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:37:21 +0000
X-Inumbo-ID: 22faa076-1cdc-11ea-8d41-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22faa076-1cdc-11ea-8d41-12813bfff9fa;
 Thu, 12 Dec 2019 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576154241;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=naVum6QFBOgwoBECM8t2Pzu6DKWdtWE5GD9DmfaihzQ=;
 b=BZiMaD9tvWo5kjdKSlLjrsIOYS26/MFDy4aPKyYkJfxoqBEvnDXol4hN
 GWErLZQFrq82e0hOjmzstwmVbP43uNP+M9FzL64XoIjs3DYJhPMnofFoj
 s+jJvaWYFJ/mfi68j9or6gdIPu6Fmp0d8sd75gN7LMyXBKbWBH6I1Wbe0 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PQe0oz5kAygfytoeqmdCauai1vJmtlKrqczyv5RyX8y817zPzfJvE786UB+ouplsjP7k2uxU67
 p8HWF+Z15NbxCcyuTTGzQgiundvbynwJ1RZx5r7pIg/uOTFTi8RZj8Qbj32IHfG4/k7+8rjEqo
 zCUKBTxOXZxev1gKuBbIH2obLOj1gS/mey/tUMzADMOkT/gZfU9vbGIAlc1dl5KPgec2k3PE8H
 0mwnPJFDBXjKXig+HgzsrsmcuI5dQyKRWq0Va3hqthgdx4ZmaC90KmarRWAePp7Lsnfrbuv/+v
 G/U=
X-SBRS: 2.7
X-MesageID: 9712039
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,305,1571716800"; 
   d="scan'208";a="9712039"
To: Jan Beulich <jbeulich@suse.com>
References: <20191209180638.47305-1-roger.pau@citrix.com>
 <db19e41f-9ecf-b999-23ce-075daf6dff22@citrix.com>
 <2214d2ca-271b-da04-14a1-7014c8faf6ed@suse.com>
 <25310dca-1f21-942d-1f88-0d712658de6f@citrix.com>
 <7fd931f2-7945-bfcc-3280-5ea563b54059@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f6b8c2b0-762f-d661-2df1-5cd4af6178d3@citrix.com>
Date: Thu, 12 Dec 2019 12:37:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7fd931f2-7945-bfcc-3280-5ea563b54059@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAwOTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMTIuMjAxOSAy
MDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTAvMTIvMjAxOSAxMDowNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMC4xMi4yMDE5IDEwOjU5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDA5LzEyLzIwMTkgMTg6MDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4g
Q3VycmVudGx5IGNyNCBpcyBub3QgY2FjaGVkIGJlZm9yZSBzdXNwZW5zaW9uLCBhbmQgbW11X2Ny
NF9mZWF0dXJlcyBpcwo+Pj4+PiB1c2VkIGluIG9yZGVyIHRvIHJlc3RvcmUgdGhlIGV4cGVjdGVk
IGNyNCB2YWx1ZS4gVGhpcyBpcyBjb3JyZWN0IHNvCj4+Pj4+IGZhciBiZWNhdXNlIHRoZSB0YXNr
bGV0IHRoYXQgZXhlY3V0ZXMgdGhlIHN1c3BlbmQvcmVzdW1lIGNvZGUgaXMKPj4+Pj4gcnVubmlu
ZyBpbiB0aGUgaWRsZSB2Q1BVIGNvbnRleHQuCj4+Pj4+Cj4+Pj4+IEluIG9yZGVyIHRvIG1ha2Ug
dGhlIGNvZGUgbGVzcyBmcmFnaWxlLCBleHBsaWNpdGx5IHNhdmUgdGhlIGN1cnJlbnQKPj4+Pj4g
Y3I0IHZhbHVlIGJlZm9yZSBzdXNwZW5zaW9uLCBzbyB0aGF0IGl0IGNhbiBiZSByZXN0b3JlZCBh
ZnRlcndhcmRzLgo+Pj4+PiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUgY3I0IHZhbHVlIGNhY2hlZCBp
biB0aGUgY3B1X2luZm8gZG9lc24ndCBnZXQgb3V0Cj4+Pj4+IG9mIHN5bmMgYWZ0ZXIgcmVzdW1l
IGZyb20gc3VzcGVuc2lvbi4KPj4+Pj4KPj4+Pj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4+IFdoeT/CoCBUaGVyZSBpcyBub3RoaW5nIGZyYWdp
bGUgaGVyZS7CoCBTdXNwZW5kL3Jlc3VtZSBpcyBhbHdheXMgaW4gaWRsZQo+Pj4+IGNvbnRleHQg
YW5kIGxvYWRzIG9mIG90aGVyIGxvZ2ljIGFscmVhZHkgZGVwZW5kcyBvbiB0aGlzLgo+Pj4+Cj4+
Pj4gSSd2ZSBiZWVuIHNsb3dseSBzdHJpcHBpbmcgb3V0IHJlZHVuZGFudCBzYXZlZCBzdGF0ZSBs
aWtlIHRoaXMuCj4+PiBXaGVyZSBpdCdzIGNsZWFybHkgcmVkdW5kYW50LCB0aGlzIGlzIGZpbmUu
IEJ1dCBJIGRvbid0IHRoaW5rIGl0J3MKPj4+IHN1ZmZpY2llbnRseSBjbGVhciBoZXJlCj4+IFRo
ZXJlIGlzIGEgcmVhc29uIEkgbWFkZSBpdCBleHBsaWNpdGx5IGNyeXN0YWwgY2xlYXIgd2l0aCBj
L3MgODdlN2I0ZDViCj4gV2VsbCwgdGhpcyBtYWtlcyBjbGVhciB3ZSdyZSBpbiBpZGxlIGNvbnRl
eHQsIHllcy4gQnV0IHRoZXJlJ3MKPiBzdGlsbCBhIGRpc2Nvbm5lY3QgYmV0d2VlbiB0aGlzIGFu
ZCB0aGUgdXNlIG9mIG1tdV9jcjRfZmVhdHVyZXMKPiAodXAgdG8gYW5kIGluY2x1ZGluZyB0aGUg
c29tZXdoYXQgbWlzbGVhZGluZyBjb21tZW50IHNheWluZwo+ICJtbXVfY3I0X2ZlYXR1cmVzIGNv
bnRhaW5zIGxhdGVzdCBjcjQgc2V0dGluZyIgd2l0aG91dCBpdCByZWFsbHkKPiBiZWluZyBjbGVh
ciB3aGF0ICJsYXRlc3QiIG1lYW5zLCBub3cgdGhhdCB3ZSBydW4gd2l0aCB2YXJ5aW5nCj4gQ1I0
IHZhbHVlcy4gWWVzLCB3cml0ZV9wdGJhc2UoKSBkb2VzIHVzZSB0aGUgdmFyaWFibGUgd2hlbgo+
IHN3aXRjaGluZyB0byBpZGxlLCBidXQgdGhlIHZhcmlhYmxlIG5hbWUgbGFjayBhbnkgY29ubmVj
dGlvbiB0bwo+IHRoaXMgZmFjdC4KClRoZSBuYW1lIG9mIHRoZSB2YXJpYWJsZSBzaG91bGQgcHJv
YmFibHkgYmUgaW1wcm92ZWQgLSBJJ20gbm90IGEgZmFuIG9mCml0cyBjdXJyZW50IG5hbWUuCgpQ
ZXJoYXBzIHRoaXMgc2VlbXMgbW9yZSBvYnZpb3VzIHRvIG1lIHRoYW4gb3RoZXJzIGJlY2F1c2Ug
SSBkaWQgYWxsIHRoZQp3b3JrIGZvciBYU0EtMjkzLCBidXQgdGhlIGNvbW1pdCBtZXNzYWdlIG9m
IGMvcyBiMmRkMDA1NzRhNCBpcyByZWxldmFudDoKCj4gRmlyc3Qgb2YgYWxsLCBtb2RpZnkgd3Jp
dGVfcHRiYXNlKCkgdG8gYWx3YXlzIHVzZSBtbXVfY3I0X2ZlYXR1cmVzIGZvcgo+IElETEUKPiBh
bmQgSFZNIGNvbnRleHRzLsKgIG1tdV9jcjRfZmVhdHVyZXMgKmlzKiB0aGUgY29ycmVjdCB2YWx1
ZSB0byB1c2UsIGFuZAo+IG1ha2VzCj4gdGhlIEFTU0VSVCgpIG9idmlvdXNseSByZWR1bmRhbnQu
CgphbmQgdGhlIHNhbWUgYXBwbGllcyB0byBTMyBwYXRoLgoKPgo+Pj4gLCBhbmQgZ29pbmcgYmFj
ayB0byB3aGF0IHdhcyB0aGVyZSBiZWZvcmUKPj4+IGlzIGltbyBnZW5lcmFsbHkgbGVzcyBlcnJv
ciBwcm9uZSB0aGFuIGdvaW5nIHRvIHNvbWUgZml4ZWQgc3RhdGUuCj4+IEl0IGlzIGRlbW9uc3Ry
YWJseSBtb3JlIGVycm9yIHByb25lLCB3aGljaCBpcyB3aHkgSSdtIHNsb3dseSBraWxsaW5nIGl0
Lgo+Pgo+PiBTdGFzaGluZyBzdGF0ZSB3YXN0ZXMgdW5uZWNlc3Nhcnkgc3BhY2UsIGFuZCBhZGRz
IGFuIGVycm9yIGNhc2Ugd2hlcmUKPj4gc3RhdGUgaXMgZWl0aGVyIHN0YXNoZWQgaW5jb3JyZWN0
bHksIG9yIGdldHMgbW9kaWZpZWQgYmVmb3JlIHJlc3RvcmUsCj4+IGFuZCB3ZSdsbCBibGluZGx5
IHVzZS4KPiBUaGUgd2FzdGUgb2Ygc3BhY2UgaXMgZW50aXJlbHkgc2Vjb25kYXJ5IGhlcmUsIEkg
dGhpbmsuIEEgdmFsdWUKPiBnZXR0aW5nIG1vZGlmaWVkIGJlZm9yZSByZXN0b3JlIGlzIG5vIGRp
ZmZlcmVudCBmcm9tIGEgdmFsdWUKPiBnb2luZyBvdXQgb2Ygc3luYyB3aXRoIHRoZSB2YXJpYWJs
ZSB3ZSByZWxvYWQgZnJvbS4gSXQncyBhIGJsaW5kCj4gdXNlIGluIGVpdGhlciBjYXNlLgo+Cj4+
IFR3byBleGFtcGxlcyBvZiByZWFsIGJ1Z3MgY2F1c2VkIGJ5IHRoaXMgYXJlIGMvcyAwYzMwMTcx
Y2IgYW5kIDRlZTBhZDcyZAo+IEkgc2VlIHlvdXIgcG9pbnQgZm9yIHRoZSBmb3JtZXIsIGJ1dCB0
aGUgbGF0dGVyIHNlZW1zIHRvIGJlIHVucmVsYXRlZC4KCk9oIC0gcXVpdGUgcmlnaHQuwqAgSSB3
YXNuJ3QgcGF5aW5nIHF1aXRlIGVub3VnaCBhdHRlbnRpb24gd2hlbiBkb2luZwphcmNoYWVvbG9n
eS4KCj4KPj4gQWJzb2x1dGVseSBub3RoaW5nIHJlbWFpbmluZyBpbiBzdXNwZW5kLmMgc2hvdWxk
IGJlIHNwaWxsZWQuwqAgSXQgY2FuIGFsbAo+PiBiZSAocmUpY2FsdWNsYXRlZCBmcm9tIHRoZSBz
YW1lIGluZm9ybWF0aW9uIHNvdXJjZSBhcyB0aGUgQVAgYm9vdCBwYXRoLAo+PiBhbmQgdGhlIHJl
c3VsdCB3aWxsIGJlIHN0cmljdGx5IHNtYWxsZXIgaW4gUkFNLCBhbmQgbW9yZSByb2J1c3QuCj4g
Um9idXN0bmVzcyB0byBtZSB3b3VsZCBpbXBseSB1c2luZyB0aGUgc2FtZSBjb2RlIGZvciBkb2lu
ZyB0aGUKPiBjYWxjdWxhdGlvbnMsIG5vdCByZS1jYWxjdWxhdGluZyBmcm9tIHRoZSBzYW1lIGlu
Zm9ybWF0aW9uIHNvdXJjZS4KPiBUaGlzIGNvdWxkIGJlIGFzIHNpbXBsZSBhcyBhbiBpZGxlX2Ny
NCgpIHdyYXBwZXIgYXJvdW5kIHRoZSByZWFkCj4gb2YgbW11X2NyNF9mZWF0dXJlcyBmb3IgdGhl
IGNhc2UgYXQgaGFuZCAoc3VpdGFibHkgdXNlZCB3aGVyZXZlcgo+IGFwcGxpY2FibGUpLgo+Cj4g
QW55d2F5IC0gdG9nZXRoZXIgd2l0aCB5b3VyIHN1YnNlcXVlbnQgbWFpbCBJIGFjY2VwdCB5b3Vy
IG9iamVjdGlvbnMuCj4gT25jZSB0aGUgY29kZSBjaGFuZ2VzIHByb3Bvc2VkIHRoZXJlIGhhdmUg
Z29uZSBpbiwgSSB0aGluayBpdCdsbAo+IGJlY29tZSBtb3JlIGNsZWFyIHRvIHJlYWRlcnMgdGhh
dCBpbmRlZWQgc3RhdGUgc2F2aW5nL3Jlc3RvcmluZyBpcyB0bwo+IGJlIHRoZSBleGNlcHRpb24s
IG5vdCB0aGUgcnVsZSAoY3VycmVudCBjb2RlIGRvZXNuJ3QgZ2l2ZSB0aGlzCj4gaW1wcmVzc2lv
biwgSSB0aGluaykuCgpJdCB3YXMgYWxsIGluaGVyaXRlZCBmcm9tIExpbnV4LCBhbmQgaXMgc2xv
d2x5IGJlaW5nIHN0cmlwcGVkIG91dCB0aGVyZQphcyB3ZWxsLgoKSSdsbCB0cnkgYW5kIGRvIHNv
bWUgbW9yZSBjbGVhbnVwIGluIHNvbWUgZnJlZSB0aW1lLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
