Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89717DBA2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 09:51:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBE5U-00054v-5h; Mon, 09 Mar 2020 08:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RYxH=42=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBE5T-00054q-99
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 08:48:35 +0000
X-Inumbo-ID: c2600458-61e2-11ea-8eb5-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2600458-61e2-11ea-8eb5-bc764e2007e4;
 Mon, 09 Mar 2020 08:48:34 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b23so3022742edx.4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=2ViJWeysPET11nMfXwgslSwegYyY8LKXUBl92OAQ+5A=;
 b=Mb+/FcHmgyAFdoK2A8MvGPnsNMVHphhvbAlqtoSlHVassONc+Sb78uoVZlzP/Ox0NH
 t977dHZ01Oe9/DDijR395CK0m5wfzXmpxf2sbt9EiRbXRNVD2yLlgR9q20kxfezv9L5B
 GU5Qun9JFmRrl5RfFbkLsnDGzUKZsGC4+ZYY4VF6BgxL18igGLCRvjANCr1bvmhIDMlg
 bTwMCsq0Sd1g7BM9Nvt+zwFA+2tfMVrP5eGS1UegvcVtt5dCFr/eFNdPCUbD2ISpxonE
 HxwBHSGj5PXB6JBdagf2bV2rxVYYSPreg7Gb/Cby6U+L4s1pTfUWC0vEM+jxiknX8H8u
 7YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=2ViJWeysPET11nMfXwgslSwegYyY8LKXUBl92OAQ+5A=;
 b=REgvGPKO1FZjin1JcXpwOdyR2CNuZIFCUXogbWQ0LQ4b0PYj7WKpkj1UQEI19txChz
 AY1VZqS3PicZhfGvMDXz97yJNO49LXlY9IE0gTI4mMWQuIWYxrdPkOKLp4FpxwlAZ8Ph
 A+yQdDQTq/on9IlHgxtebSPh1DcS+Ql365RnRSwekVxtBQBxWxhigPnylnDVgSG7EtFT
 nDmUMVjeQT0h1kqDLjpF0yUk0RO+1Fp6XEZfYhQsO+ZzwyHEUXfxvUnbVjgWyNuWrF4a
 hncA7syMKKgl8uiygNstf80YQSryibJH00xi3VrW310TgGlXxkWguBCmgUwBGOtGbRaa
 D+xg==
X-Gm-Message-State: ANhLgQ3zte0s523QkMUAE9hxA/eNIVcEMpdZsVmT6J1MM9NHFnbvGhjk
 a7zKAgVmptPZJFh7AZwjSTk=
X-Google-Smtp-Source: ADFU+vsy1raRJs1joOS+diBLygRx+l/fNk09J6zYXjiQ8kn7a7I+MDafgJGrl1MewRVDu5r0H2TORg==
X-Received: by 2002:a05:6402:1811:: with SMTP id
 g17mr16140020edy.356.1583743713643; 
 Mon, 09 Mar 2020 01:48:33 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id x32sm814596edc.19.2020.03.09.01.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 01:48:32 -0700 (PDT)
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
 <001d01d5f3d4$196e6820$4c4b3860$@xen.org>
 <f6c7afd3-b6e0-fa4b-f588-fea00e68f0d1@suse.com>
In-Reply-To: <f6c7afd3-b6e0-fa4b-f588-fea00e68f0d1@suse.com>
Date: Mon, 9 Mar 2020 08:48:31 -0000
Message-ID: <000001d5f5ef$83780f10$8a682d30$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHD9Mrly5QQ+U9AQ89eqYSTTsEMIQIV/wViAwgpctwBNyIEIAHpa+LAAblNjQsBqDUVNwIs7XNKAxxGkKMBX3/WGQGtsIQjAe/9+oEBzNtD1wE4VylLASXTpusCTJ9AqwKWR4o1AtQofwwByWCCzwJhaUzypzRYoqA=
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
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDE3OjE3Cj4gVG86IFBhdWwgRHVycmFu
dCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiBDYzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVs
aWVuQHhlbi5vcmc7IFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tOyB3bEB4ZW4ub3JnOwo+IGtv
bnJhZC53aWxrQG9yYWNsZS5jb207IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb207Cj4gZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQu
b3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9t
aGVhcCBwYWdlIGZvciBzaGFyZWRfaW5mbwo+IAo+IE9uIDA2LjAzLjIwMjAgMTc6MjcsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiBTZW50OiAwNiBNYXJjaCAyMDIw
IDEzOjQ2Cj4gPj4gVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiA+PiBD
Yzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7IFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tOyB3bEB4ZW4ub3JnOwo+ID4+IGtvbnJhZC53aWxrQG9yYWNsZS5jb207IGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb207Cj4gPj4g
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
ICdEYXZpZCBXb29kaG91c2UnIDxkd213MkBpbmZyYWRlYWQub3JnPgo+ID4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlIGZvciBzaGFy
ZWRfaW5mbwo+ID4+Cj4gPj4gT24gMDYuMDMuMjAyMCAxNDo0MSwgUGF1bCBEdXJyYW50IHdyb3Rl
Ogo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+Pj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Pj4+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6MzYK
PiA+Pj4+IFRvOiBQYXVsIER1cnJhbnQgPHhhZGltZ25pa0BnbWFpbC5jb20+Cj4gPj4+PiBDYzog
c3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7IFZvbG9keW15cl9CYWJjaHVr
QGVwYW0uY29tOyB3bEB4ZW4ub3JnOwo+ID4+Pj4ga29ucmFkLndpbGtAb3JhY2xlLmNvbTsgYW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgaWFuLmphY2tzb25AZXUuY2l0cml4LmNvbTsKPiA+Pj4+
IGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyAnRGF2aWQgV29vZGhvdXNlJyA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPiA+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlIGZvciBz
aGFyZWRfaW5mbwo+ID4+Pj4KPiA+Pj4+IE9uIDA2LjAzLjIwMjAgMTQ6MjYsIFBhdWwgRHVycmFu
dCB3cm90ZToKPiA+Pj4+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoCj4gPj4+Pj4+IFNlbnQ6
IDA2IE1hcmNoIDIwMjAgMTM6MjQKPiA+Pj4+Pj4KPiA+Pj4+Pj4gT24gMDYuMDMuMjAyMCAxNDox
MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4+Pj4+Pj4gTXkgYWltIGlzIHRvIG1ha2UgdGhlIHNl
cGFyYXRpb24gYWJ1bmRhbnRseSBvYnZpb3VzIGJ5IGdldHRpbmcgcmlkCj4gPj4+Pj4+PiBvZiBz
aGFyZWQgeGVuaGVhcCBwYWdlcyAoZm9yIG5vbi1zeXN0ZW0gZG9tYWlucyBhdCBsZWFzdCkgYnV0
IEkKPiA+Pj4+Pj4+IGNhbid0IGRvIHRoYXQgYmVmb3JlIGNvbnZlcnRpbmcgc2hhcmVkX2luZm8g
YW5kIGdyYW50IHNoYXJlZC9zdGF0dXMKPiA+Pj4+Pj4+IGZyYW1lcyB0byBkb21oZWFwLgo+ID4+
Pj4+Pgo+ID4+Pj4+PiBGb2xsb3dpbmcgRGF2aWQncyB2YXJpb3VzIHJlcGxpZXMgLSBpbnN0ZWFk
IG9mIGdvaW5nIHRoaXMgcm91dGUgb2YKPiA+Pj4+Pj4gcmVwbGFjaW5nIHRoZSBzaGFyaW5nIG9m
IHhlbmhlYXAgcGFnZXMgYnkgZGlmZmVyZW50IGxvZ2ljLCB0aGUKPiA+Pj4+Pj4gc2FtZSBvdWdo
dCB0byBiZSBhY2hpZXZhYmxlIGJ5IG1ha2luZyB0aGUgYmFja2luZyBhbGxvY2F0aW9ucyBjb21l
Cj4gPj4+Pj4+IGZyb20gdGhlIGNvcnJlY3QgcG9vbD8KPiA+Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+
IEkgc3RpbGwgcHJlZmVyIHRoZSBzaW1wbGlmaWNhdGlvbiBvZiBub3QgaGF2aW5nIHRvIGNsZWFu
IHVwIHRoZQo+ID4+Pj4+IHNoYXJlZCB4ZW5oZWFwIHBhZ2UgbGlzdCBpbiBkb21haW5fa2lsbCgp
IHNvIElNTyBpdCBpcyBzdGlsbCB3b3J0aAo+ID4+Pj4+IGl0IGZvciB0aGF0IGFsb25lLgo+ID4+
Pj4KPiA+Pj4+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIHZlcnkgc3BlY2lhbCB3aXRoIHRoZSBjbGVh
bmluZyB1cCBpbgo+ID4+Pj4gZG9tYWluX2tpbGwoKSAvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291
cmNlcygpLiBXaGF0IEknZCB2aWV3IGFzCj4gPj4+PiBtb3JlIGRlc2lyYWJsZSBpbiB0aGlzIHJl
Z2FyZCBpcyB0aGUgZ2VuZXJhbCBmYWN0IG9mIG5lZWRpbmcKPiA+Pj4+IHR3byBsaXN0cy4gQnV0
IHlvdSByZWFsaXplIHRoZXJlJ3MgYSBkb3duc2lkZSB0byB0aGlzIGFzIHdlbGw/Cj4gPj4+PiBk
dW1wX3BhZ2VmcmFtZV9pbmZvKCkgd2lsbCByZWxpYWJseSBzaG93IF9hbGxfIFhlbiBoZWFwIHBh
Z2VzCj4gPj4+PiBhc3NvY2lhdGVkIHdpdGggYSBkb21haW4sIGJ1dCBpdCB3aWxsIG9ubHkgZXZl
ciBzaG93IHVwIHRvIDEwCj4gPj4+PiBwYWdlcyBvbiAtPnBhZ2VfbGlzdCBmb3IgYSBkb21haW4g
dGhhdCdzIG5vdCBhbHJlYWR5IGJlaW5nCj4gPj4+PiBjbGVhbmVkIHVwLgo+ID4+Pgo+ID4+PiBU
aGF0J3Mgbm90IG11Y2ggb2YgYSBkb3duc2lkZSB0aG91Z2ggSSBkb24ndCB0aGluay4gVGhlIHhl
bmhlYXAKPiA+Pj4gKG9yIFBHQ19leHRyYSBkb21oZWFwIHBhZ2VzKSBhcmUgJ3NwZWNpYWwnIGFu
ZCBzbyBpbmZvIGFib3V0Cj4gPj4+IHRoZW0gb3VnaHQgdG8gYmUgYXZhaWxhYmxlIHZpYSBhbiBh
bHRlcm5hdGUgZHVtcCBmdW5jdGlvbiBhbnl3YXkKPiA+Pj4gKGFuZCBpZiBub3QgYWxyZWFkeSwg
aXQgY2FuIGJlIGFkZGVkKS4KPiA+Pgo+ID4+IFdoYXRldmVyIHlvdSdkIGFkZCwgdGhlIGxvZ2lj
IHdvdWxkIG5lZWQgdG8gZWl0aGVyIHRyYXZlcnNlIHRoZQo+ID4+IGVudGlyZSAtPnBhZ2VfbGlz
dCAoY2FuIHRha2UgdmVyeSBsb25nKSBvciBoYXZlL3VzZSBvdXQgb2YgYmFuZAo+ID4+IGluZm9y
bWF0aW9uIHdoZXJlIHN1Y2ggcGFnZXMgbWF5IGhhdmUgYSByZWNvcmQgKGZyYWdpbGUpLgo+ID4+
Cj4gPgo+ID4gQnV0IHRoZSBzaGFyZWQgeGVuaGVhcCBwYWdlcyBpbiBxdWVzdGlvbiBhcmUgb25s
eSBzaGFyZWQgaW5mbywgb3IKPiA+IGdyYW50IHRhYmxlLCBzbyB0aGVpciBpbmZvcm1hdGlvbiBj
YW4gYmUgZHVtcGVkIHNlcGFyYXRlbHkuCj4gPiBJIGd1ZXNzIGl0IG1ha2VzIG1vcmUgc2Vuc2Ug
dG8gYWRkIGFub3RoZXIgcGF0Y2ggaW50byB0aGUgc2VyaWVzCj4gPiB0byBkbyBleHBsaWNpdCBk
dW1wIG9mIHNoYXJlZF9pbmZvIGFuZCB0aGVuIGV4Y2x1ZGUgJ3NwZWNpYWwnCj4gPiBwYWdlcyBm
cm9tIGR1bXBfcGFnZWZyYW1lX2luZm8oKS4KPiAKPiBCdSB0aGF0J3Mgd2h5IEkgc2FpZCAiZnJh
Z2lsZSIgLSBuZXcgdXNlcyBvZiBzdWNoIHBhZ2VzIHdvdWxkbid0Cj4gYXV0b21hdGljYWxseSBi
ZSBwaWNrZWQgdXAsIHdoZXJlYXMgdGhlbSBhbGwgbGFuZGluZyBvbiB4ZW5wYWdlX2xpc3QKPiBt
YWRlIHRoZWlyIGR1bXBpbmcgYSByZWxpYWJsZSB0aGluZy4KPiAKCkJ1dCBob3cgdXNlZnVsIGlz
IGR1bXBpbmcgeGVuaGVhcCBwYWdlcyB0aGlzIHdheT8gVGhlcmUncyBub3RoaW5nIHRoYXQgYWN0
dWFsbHkgc2F5cyB3aGF0IHRoZXkgYXJlIGZvciBzbyBJIGNhbid0IHNlZSB3aHkgaXQgaXMgcGFy
dGljdWxhcmx5IHVzZWZ1bC4gSGF2aW5nIHNvbWV0aGluZyB0aGF0IHNheXMgJ1RoaXMgaXMgdGhl
IHNoYXJlZF9pbmZvIHBhZ2UnIGFuZCAnVGhlc2UgYXJlIHRoZSBncmFudCBzaGFyZWQgZnJhbWVz
JyBzZWVtcyBtdWNoIG1vcmUgZGVzaXJhYmxlLi4uIGFuZCBhbnkgbmV3IG9uZXMgYWRkZWQgd291
bGQgYWxtb3N0IGNlcnRhaW5seSBtZXJpdCBzaW1pbGFyIGR1bXAgZnVuY3Rpb25zLgoKICBQYXVs
Cgo+IEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
