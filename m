Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A217C2F3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 17:29:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAFol-00050O-PH; Fri, 06 Mar 2020 16:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jAFok-00050J-KC
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 16:27:18 +0000
X-Inumbo-ID: 586816de-5fc7-11ea-90c4-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 586816de-5fc7-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 16:27:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m13so3185355edb.6
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 08:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=cjNKJOY+RdIsK1PWYe0nyhNG0/cZu4yyTj57Q6rSMIY=;
 b=JL0SzYbY56tnWRsSs/l+5Xf09nS0sZlT0PcZeqmPeOAEkuYuzSeilrM9jTLcErnrkB
 tBmWJJLbZ/SGz9hNO0PU+/Is1lMOep3Rxh2vxFhLY7Ahskz8GxXmtrT7TD+TvjkMiMyM
 +Rwi2ZvnwBFQ79eyu+yoQ4KCdXDlm4TQV+oU/uhJ99xHl/y6FNRiBD/jyhR7NBq0/cZZ
 FNeklaespIQv/BEaj48/bEZqS+pYeiKuvIpLvF/9tt/zj7z13FHiB2YDCLHbQOxMHyFx
 oJC2Yt1Clgfm93SON9KDqQgypCiKuns8tNvjJamUBbWS91XRsANGF4NVEUXpHBJnqnH2
 190Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=cjNKJOY+RdIsK1PWYe0nyhNG0/cZu4yyTj57Q6rSMIY=;
 b=iq+kvMR/A1vHFrOi4kUPKibpe0kxnO8lKoUBgM8UaNHNVzhqkTxFKYbV2tD5Pa00YQ
 Eu3MkK9LXAKw/U6B/Z3BbGFOY6g1OZSFllrYFZjRB7O4Lmnj7O2TpEPLhS4EbmtyaWnb
 /53EUerIb3v0NX32g4SObubdCmbQW8GdAgOL6E3T0ctACf8FCX4+R5nePR6eef4afPC6
 OQt0t1BwxhCQwDFTv3GD9kZWNr2KQlxwlkJjuOkJcK7oXbHo9Oc8PIXh6Nm+YWSWs7qA
 GuRCGVOB4A75Y2xp4drlyBmKYB+fuz8hyVmDFaFY/yRtwnr8Is8nx2Y5r/eVLupf1cCn
 KNoA==
X-Gm-Message-State: ANhLgQ3BX+YkwM5CqIhS/tb/dleeHPxoZ1FgxNY2WfrZyeT8IcC+FyPK
 JY/0DuQkvDqhDk2g8vN2CMA=
X-Google-Smtp-Source: ADFU+vv8xRfF4m2TGm0LJHiWgNIkJIgXyL2Fj6sdwAaBRaPfsFQrscRke5G+H9fCjNpxB0LQ0Doqvw==
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr4181835eds.138.1583512037051; 
 Fri, 06 Mar 2020 08:27:17 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id c18sm2088046edv.4.2020.03.06.08.27.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 08:27:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <007f01d5f3b9$110d20b0$33276210$@xen.org>
 <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
 <00cc01d5f3ba$e3a89300$aaf9b900$@xen.org>
 <91c6ffa0-a53e-86a5-4544-935616bb3eee@suse.com>
 <001001d5f3bc$e100e0b0$a302a210$@xen.org>
 <3a10c28b-0a2e-d037-db82-2505eac31d02@suse.com>
In-Reply-To: <3a10c28b-0a2e-d037-db82-2505eac31d02@suse.com>
Date: Fri, 6 Mar 2020 16:27:15 -0000
Message-ID: <001d01d5f3d4$196e6820$4c4b3860$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHD9Mrly5QQ+U9AQ89eqYSTTsEMIQIV/wViAwgpctwBNyIEIAHpa+LAAblNjQsBqDUVNwIs7XNKAxxGkKMBX3/WGQGtsIQjAe/9+oEBzNtD1wE4VylLASXTpusCTJ9AqwKWR4o1AtQofwynUXaVUA==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjQ2Cj4gVG86IFBhdWwgRHVycmFu
dCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiBDYzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVs
aWVuQHhlbi5vcmc7IFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tOyB3bEB4ZW4ub3JnOwo+IGtv
bnJhZC53aWxrQG9yYWNsZS5jb207IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb207Cj4gZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQu
b3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9t
aGVhcCBwYWdlIGZvciBzaGFyZWRfaW5mbwo+IAo+IE9uIDA2LjAzLjIwMjAgMTQ6NDEsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiBTZW50OiAwNiBNYXJjaCAyMDIw
IDEzOjM2Cj4gPj4gVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiA+PiBD
Yzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7IFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tOyB3bEB4ZW4ub3JnOwo+ID4+IGtvbnJhZC53aWxrQG9yYWNsZS5jb207IGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb207Cj4gPj4g
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQub3JnPgo+ID4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlIGZvciBzaGFy
ZWRfaW5mbwo+ID4+Cj4gPj4gT24gMDYuMDMuMjAyMCAxNDoyNiwgUGF1bCBEdXJyYW50IHdyb3Rl
Ogo+ID4+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoCj4gPj4+PiBTZW50OiAwNiBNYXJjaCAy
MDIwIDEzOjI0Cj4gPj4+Pgo+ID4+Pj4gT24gMDYuMDMuMjAyMCAxNDoxMywgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4+Pj4+IE15IGFpbSBpcyB0byBtYWtlIHRoZSBzZXBhcmF0aW9uIGFidW5kYW50
bHkgb2J2aW91cyBieSBnZXR0aW5nIHJpZAo+ID4+Pj4+IG9mIHNoYXJlZCB4ZW5oZWFwIHBhZ2Vz
IChmb3Igbm9uLXN5c3RlbSBkb21haW5zIGF0IGxlYXN0KSBidXQgSQo+ID4+Pj4+IGNhbid0IGRv
IHRoYXQgYmVmb3JlIGNvbnZlcnRpbmcgc2hhcmVkX2luZm8gYW5kIGdyYW50IHNoYXJlZC9zdGF0
dXMKPiA+Pj4+PiBmcmFtZXMgdG8gZG9taGVhcC4KPiA+Pj4+Cj4gPj4+PiBGb2xsb3dpbmcgRGF2
aWQncyB2YXJpb3VzIHJlcGxpZXMgLSBpbnN0ZWFkIG9mIGdvaW5nIHRoaXMgcm91dGUgb2YKPiA+
Pj4+IHJlcGxhY2luZyB0aGUgc2hhcmluZyBvZiB4ZW5oZWFwIHBhZ2VzIGJ5IGRpZmZlcmVudCBs
b2dpYywgdGhlCj4gPj4+PiBzYW1lIG91Z2h0IHRvIGJlIGFjaGlldmFibGUgYnkgbWFraW5nIHRo
ZSBiYWNraW5nIGFsbG9jYXRpb25zIGNvbWUKPiA+Pj4+IGZyb20gdGhlIGNvcnJlY3QgcG9vbD8K
PiA+Pj4+Cj4gPj4+Cj4gPj4+IEkgc3RpbGwgcHJlZmVyIHRoZSBzaW1wbGlmaWNhdGlvbiBvZiBu
b3QgaGF2aW5nIHRvIGNsZWFuIHVwIHRoZQo+ID4+PiBzaGFyZWQgeGVuaGVhcCBwYWdlIGxpc3Qg
aW4gZG9tYWluX2tpbGwoKSBzbyBJTU8gaXQgaXMgc3RpbGwgd29ydGgKPiA+Pj4gaXQgZm9yIHRo
YXQgYWxvbmUuCj4gPj4KPiA+PiBJIGRvbid0IHNlZSBhbnl0aGluZyB2ZXJ5IHNwZWNpYWwgd2l0
aCB0aGUgY2xlYW5pbmcgdXAgaW4KPiA+PiBkb21haW5fa2lsbCgpIC8gZG9tYWluX3JlbGlucXVp
c2hfcmVzb3VyY2VzKCkuIFdoYXQgSSdkIHZpZXcgYXMKPiA+PiBtb3JlIGRlc2lyYWJsZSBpbiB0
aGlzIHJlZ2FyZCBpcyB0aGUgZ2VuZXJhbCBmYWN0IG9mIG5lZWRpbmcKPiA+PiB0d28gbGlzdHMu
IEJ1dCB5b3UgcmVhbGl6ZSB0aGVyZSdzIGEgZG93bnNpZGUgdG8gdGhpcyBhcyB3ZWxsPwo+ID4+
IGR1bXBfcGFnZWZyYW1lX2luZm8oKSB3aWxsIHJlbGlhYmx5IHNob3cgX2FsbF8gWGVuIGhlYXAg
cGFnZXMKPiA+PiBhc3NvY2lhdGVkIHdpdGggYSBkb21haW4sIGJ1dCBpdCB3aWxsIG9ubHkgZXZl
ciBzaG93IHVwIHRvIDEwCj4gPj4gcGFnZXMgb24gLT5wYWdlX2xpc3QgZm9yIGEgZG9tYWluIHRo
YXQncyBub3QgYWxyZWFkeSBiZWluZwo+ID4+IGNsZWFuZWQgdXAuCj4gPgo+ID4gVGhhdCdzIG5v
dCBtdWNoIG9mIGEgZG93bnNpZGUgdGhvdWdoIEkgZG9uJ3QgdGhpbmsuIFRoZSB4ZW5oZWFwCj4g
PiAob3IgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZXMpIGFyZSAnc3BlY2lhbCcgYW5kIHNvIGluZm8g
YWJvdXQKPiA+IHRoZW0gb3VnaHQgdG8gYmUgYXZhaWxhYmxlIHZpYSBhbiBhbHRlcm5hdGUgZHVt
cCBmdW5jdGlvbiBhbnl3YXkKPiA+IChhbmQgaWYgbm90IGFscmVhZHksIGl0IGNhbiBiZSBhZGRl
ZCkuCj4gCj4gV2hhdGV2ZXIgeW91J2QgYWRkLCB0aGUgbG9naWMgd291bGQgbmVlZCB0byBlaXRo
ZXIgdHJhdmVyc2UgdGhlCj4gZW50aXJlIC0+cGFnZV9saXN0IChjYW4gdGFrZSB2ZXJ5IGxvbmcp
IG9yIGhhdmUvdXNlIG91dCBvZiBiYW5kCj4gaW5mb3JtYXRpb24gd2hlcmUgc3VjaCBwYWdlcyBt
YXkgaGF2ZSBhIHJlY29yZCAoZnJhZ2lsZSkuCj4gCgpCdXQgdGhlIHNoYXJlZCB4ZW5oZWFwIHBh
Z2VzIGluIHF1ZXN0aW9uIGFyZSBvbmx5IHNoYXJlZCBpbmZvLCBvciBncmFudCB0YWJsZSwgc28g
dGhlaXIgaW5mb3JtYXRpb24gY2FuIGJlIGR1bXBlZCBzZXBhcmF0ZWx5LgpJIGd1ZXNzIGl0IG1h
a2VzIG1vcmUgc2Vuc2UgdG8gYWRkIGFub3RoZXIgcGF0Y2ggaW50byB0aGUgc2VyaWVzIHRvIGRv
IGV4cGxpY2l0IGR1bXAgb2Ygc2hhcmVkX2luZm8gYW5kIHRoZW4gZXhjbHVkZSAnc3BlY2lhbCcg
cGFnZXMgZnJvbSBkdW1wX3BhZ2VmcmFtZV9pbmZvKCkuCgogIFBhdWwKCj4gSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
