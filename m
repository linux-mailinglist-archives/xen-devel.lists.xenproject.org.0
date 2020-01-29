Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFBF14C888
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:10:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkGu-0002lk-6S; Wed, 29 Jan 2020 10:08:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCRk=3S=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iwkGt-0002le-5w
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:08:31 +0000
X-Inumbo-ID: 4bde0384-427f-11ea-8867-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bde0384-427f-11ea-8867-12813bfff9fa;
 Wed, 29 Jan 2020 10:08:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so5750162wmf.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 02:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VBV40EMMBAyobe/gH7Z+Bo4kRshSADQDr5r96kpLedY=;
 b=cz1vxmL2ywuuiklnIUBy5wUGjjFWE6aDNiPw3HgtW6L7FVD/B2fg8iVXsAvGTXtXNv
 pz95EhYVNqPUPj5KCHXOvF+IVAPEU33cWso8HazOAzqHNiM5Amj+jnlJPrBRTldUxO9j
 WBd8xtFUDMdccnK6MXm/3FlVRUpuFX9A3gxAVP43/AgRxpVjbzWYrF4B3X4Es+WaG0eP
 1LpoGq3r9PLb9e1lcetnJ1nQgGVVGAvJmeqQilTqcXDNP/jBgcc5kLM6Yk/K0Y5DNj57
 xqvU48z/KZG2jrgo+tE4ya10JrRDMoaDMWAOVPHjRm9wI8L9TVxFysHZ6RgWHldhoogZ
 5pdA==
X-Gm-Message-State: APjAAAXZj1eRP5O7tAok1bB6ti/EKq7vlmeM49SjV4ox6T5W7zc3FF2q
 DTIpwpDVJKkq4LT92f2bvx4=
X-Google-Smtp-Source: APXvYqzsOi5Of1CTcVGUpmRbzVRpheaDCXkP2NPr5BhCr+AljmC+ItPCoe2dN8B2SaLATfZBu7OBPQ==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr10301603wma.94.1580292508381; 
 Wed, 29 Jan 2020 02:08:28 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id z10sm1634229wmk.31.2020.01.29.02.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 02:08:27 -0800 (PST)
To: Varad Gautam <vrd@amazon.de>, xen-devel@lists.xenproject.org
References: <1580290087-20636-1-git-send-email-vrd@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <56daac07-c8f8-24c7-23cd-1444f8167462@xen.org>
Date: Wed, 29 Jan 2020 10:08:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580290087-20636-1-git-send-email-vrd@amazon.de>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOS8wMS8yMDIwIDA5OjI4LCBWYXJhZCBHYXV0YW0gd3JvdGU6Cj4gWEVOX0RPTUNU
TF9kZXN0cm95ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tpbGwgLUVS
RVNUQVJUUy4KPiBJbiB0aGF0IHNjZW5hcmlvLCBpdCBpcyBwb3NzaWJsZSB0byByZWNlaXZlIG11
bHRpcGxlIF9waXJxX2d1ZXN0X3VuYmluZAo+IGNhbGxzIGZvciB0aGUgc2FtZSBwaXJxIGZyb20g
ZG9tYWluX2tpbGwsIGlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4KPiByZW1vdmVkIGZyb20g
dGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgYXM6Cj4gICAgZG9tYWluX2tpbGwoKQo+ICAgICAgLT4g
ZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkKPiAgICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2
aWNlcygpCj4gICAgICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKPiAgICAgICAgICAgIC0+
IHBpcnFfZ3Vlc3RfdW5iaW5kKCkKPiAgICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmlu
ZCgpCj4gCj4gRm9yIGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2Fs
bCB3b3VsZCB6YXAgdGhlIGN1cnJlbnQKPiBkb21haW4gZnJvbSB0aGUgcGlycSdzIGd1ZXN0c1td
IGxpc3QsIGJ1dCB0aGUgYWN0aW9uIGhhbmRsZXIgaXMgbmV2ZXIgZnJlZWQKPiBhcyB0aGVyZSBh
cmUgb3RoZXIgZ3Vlc3RzIHVzaW5nIHRoaXMgcGlycS4gQXMgYSByZXN1bHQsIG9uIHRoZSBzZWNv
bmQgY2FsbCwKPiBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVudCBk
b21haW4gd2hpY2ggaGFzIGJlZW4gcmVtb3ZlZAo+IGZyb20gdGhlIGd1ZXN0c1tdIGxpc3QsIGFu
ZCBoaXRzIGEgQlVHX09OLgo+IAo+IE1ha2UgX19waXJxX2d1ZXN0X3VuYmluZCBzYWZlIHRvIGJl
IGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBieSBsZXR0aW5nIHhlbgo+IGNvbnRpbnVlIGlmIGEgc2hh
cmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhpcyBndWVzdC4gVGhlCj4g
UElSUSB3aWxsIGJlIGNsZWFuZWQgdXAgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90cmVlIGR1cmlu
ZyB0aGUgZGVzdHJ1Y3Rpb24KPiBpbiBjb21wbGV0ZV9kb21haW5fZGVzdHJveSBhbnl3YXlzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFZhcmFkIEdhdXRhbSA8dnJkQGFtYXpvbi5kZT4KPiBSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiBDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gdjI6IFNwbGl0IHRoZSBjaGVjayBv
biBhY3Rpb24tPm5yX2d1ZXN0cyA+IDAgYW5kIG1ha2UgaXQgYW4gQVNTRVJULgo+IHYzOiBTdHls
ZSBmaXh1cHMuCj4gLS0tCj4gICB4ZW4vYXJjaC94ODYvaXJxLmMgfCAxNSArKysrKysrKysrKysr
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+
IGluZGV4IDMxMGFjMDAuLjRiMTcyZWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2lycS5j
Cj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4gQEAgLTE2ODEsNyArMTY4MSwyMCBAQCBzdGF0
aWMgaXJxX2d1ZXN0X2FjdGlvbl90ICpfX3BpcnFfZ3Vlc3RfdW5iaW5kKAo+ICAgCj4gICAgICAg
Zm9yICggaSA9IDA7IChpIDwgYWN0aW9uLT5ucl9ndWVzdHMpICYmIChhY3Rpb24tPmd1ZXN0W2ld
ICE9IGQpOyBpKysgKQo+ICAgICAgICAgICBjb250aW51ZTsKPiAtICAgIEJVR19PTihpID09IGFj
dGlvbi0+bnJfZ3Vlc3RzKTsKPiArICAgIGlmICggaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyApCj4g
KyAgICB7Cj4gKyAgICAgICAgQVNTRVJUKGFjdGlvbi0+bnJfZ3Vlc3RzID4gMCk7Cj4gKyAgICAg
ICAgLyoKPiArICAgICAgICAgKiBJbiBjYXNlIHRoZSBwaXJxIHdhcyBzaGFyZWQsIHVuYm91bmQg
Zm9yIHRoaXMgZG9tYWluIGluIGFuIGVhcmxpZXIKPiArICAgICAgICAgKiBjYWxsLCBidXQgc3Rp
bGwgZXhpc3RlZCBvbiB0aGUgZG9tYWluJ3MgcGlycV90cmVlLCB3ZSBzdGlsbCByZWFjaAo+ICsg
ICAgICAgICAqIGhlcmUgaWYgdGhlcmUgYXJlIGFueSBsYXRlciB1bmJpbmQgY2FsbHMgb24gdGhl
IHNhbWUgcGlycS4gUmV0dXJuCj4gKyAgICAgICAgICogaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVu
cy4KPiArICAgICAgICAgKi8KPiArICAgICAgICBpZiAoIGFjdGlvbi0+c2hhcmVhYmxlICkKPiAr
ICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICAgQlVHKCk7CgpQbGVhc2Ugc2VlIG15
IGNvbW1lbnQgb24gdjIgYWJvdXQgdGhlIEJVRygpLiBJIGFtIHN0aWxsIHVuY29udmluY2VkIHRo
aXMgCmlzIHRoZSByaWdodCBlcnJvciBoYW5kbGluZyBoZXJlLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
