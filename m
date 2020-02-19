Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34D164408
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:17:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4OFg-0007fq-T0; Wed, 19 Feb 2020 12:14:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4OFe-0007fl-Vw
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:14:51 +0000
X-Inumbo-ID: 6d29d125-5311-11ea-8340-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d29d125-5311-11ea-8340-12813bfff9fa;
 Wed, 19 Feb 2020 12:14:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so232683wrw.8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 04:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TOhzcuELWasHhn3H9Tnsnpvm/N/2mdItNVQts5eKx50=;
 b=rIdER6PF1T3ncAOv/YpY4iDan2L/eXUdZqB0MiiFOgDY+GWM0UdD00dIn/uKvLngYY
 o/LgRkORTfIODOQTdz/kjT8f4uT/f3+oCiFXQkBVJDquBBI7CuhqvY22+7/rYuFLb9fW
 AoKhkfuxKY/n9RuS5jwS7Sd/ut9AAbfgOn90/JVjXCPaTz5fFArFAGuW60FF+y60mUAU
 gfHN7DPmGsf1GoxL8RF6//wV8oY+qQHsSmh9iZgenCborX1a/sDVBnWgx6ahmXm1AM/K
 tTMDH0kr2Kn4aF7/GkJbbMBQzYo2Kvrd5/v726I/74Zim2Ekv/qsJw1HB2ysB/1SGjmK
 26CQ==
X-Gm-Message-State: APjAAAUn9Dk3djzqSvPxobCUy2hyTF3Jl/S2AUmDjfaFELa+yhFsNYBD
 ob7+/CTyhAk19Wrf8l6ekdc=
X-Google-Smtp-Source: APXvYqx4Z+qry23CABcugUvBuc54Qg9ulNeD3Iy7vETCP7KVMxdADoGzno8q7nvEfKcF1YqJxJ2Qqw==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr33411436wrv.291.1582114489570; 
 Wed, 19 Feb 2020 04:14:49 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id b17sm2792207wrp.49.2020.02.19.04.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 04:14:48 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <1f5db5a6-e5c3-4d63-fdb4-e027d38bea18@citrix.com>
 <479abfd7-8fc2-526d-ed72-033aadc96f7c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9a81ab44-7ecb-5190-bab3-cbca9e39bfb8@xen.org>
Date: Wed, 19 Feb 2020 12:14:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <479abfd7-8fc2-526d-ed72-033aadc96f7c@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 0/8] xen: don't let keyhandlers block
 indefinitely on locks
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDIvMjAyMCAwOTozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMu
MDIuMjAyMCAxOTozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTMvMDIvMjAyMCAxMjo1
NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IEtleWhhbmRsZXJzIGR1bXBpbmcgaHlwZXJ2aXNv
ciBpbmZvcm1hdGlvbiB0byB0aGUgY29uc29sZSBvZnRlbiBuZWVkCj4+PiB0byB0YWtlIGxvY2tz
IHdoaWxlIGFjY2Vzc2luZyBkYXRhLiBJbiBvcmRlciB0byBub3QgYmxvY2sgaW4gY2FzZSBvZgo+
Pj4gc3lzdGVtIGluY29uc2lzdGVuY2llcyBpdCBpcyBjb252ZW5pZW50IHRvIHVzZSB0cnlsb2Nr
IHZhcmlhbnRzIHdoZW4KPj4+IG9idGFpbmluZyB0aGUgbG9ja3MuIE9uIHRoZSBvdGhlciBoYW5k
IGEgYnVzeSBzeXN0ZW0gbWlnaHQgZWFzaWx5Cj4+PiBlbmNvdW50ZXIgaGVsZCBsb2Nrcywgc28g
dGhpcyBwYXRjaCBzZXJpZXMgaXMgYWRkaW5nIHNwZWNpYWwgdHJ5bG9jawo+Pj4gdmFyaWFudHMg
d2l0aCBhIHRpbWVvdXQgdXNlZCBieSBrZXloYW5kbGVycy4KPj4KPj4gVGhpcyBpcyBhIGJhY2t3
YXJkcyBzdGVwLgo+Pgo+PiBLZXloYW5kbGVycyBhcmUgZm9yIGRlYnVnZ2luZyBwdXJwb3Nlcy7C
oCBXaGVuIGRlYnVnZ2luZyBpdCBpcyBmYXIgbW9yZQo+PiBpbXBvcnRhbnQgdG8gZ2V0IHRoZSBy
ZXF1ZXN0ZWQgZGF0YSwgdGhhbiBhbG1vc3QgYW55dGhpbmcgZWxzZS4KPj4KPj4gVGhlIHN5c3Rl
bSB3aWxsIGNvcGUgd2l0aCBhIG11bHRpLXNlY29uZCBvdXRhZ2Ugb2NjdXJyaW5nIGFwcHJveGlt
YXRlbHkKPj4gbmV2ZXIuwqAgQSBwZXJzb24gZGVidWdnaW5nIHdobyBjYW4ndCBnZXQgdGhlIGRh
dGEgaGFzIG5vIGNoYW5jZSBvZgo+PiBmaXhpbmcgd2hhdGV2ZXIgcHJvYmxlbSB0aGV5IGFyZSBs
b29raW5nIGZvci4KPj4KPj4gVGhpcyBzZXJpZXMgc2VlbXMgdG8gYmUgYnJlYWtpbmcgdGhlIG9u
ZSBjcml0aWNhbCB1c2VjYXNlIGZvcgo+PiBrZXloYW5kbGVycywgdG8gZml4IHdoYXQgLSBub3Qg
bGV0IGRlYnVnZ2luZyBnZXQgaW4gdGhlIHdheSBvZiB0aGUKPj4gc21vb3RoIHJ1bm5pbmcgb2Yg
dGhlIHN5c3RlbT/CoCBBIHN5c3RlbSBpbiBuZWVkIG9mIGRlYnVnZ2luZyBpbiB0aGUKPj4gZmly
c3QgcGxhY2UgaGFzIGJpZ2dlciBwcm9ibGVtcyB0aGFuIG5lZWRpbmcgdG8gcnVuIHNtb290aGx5
Lgo+IAo+IEkgY2VydGFpbmx5IGFjY2VwdCB3aGF0IHlvdSBzYXkgZnVydGhlciB1cCwgYnV0IEkg
ZG9uJ3QgdGhpbmsgdGhpcwo+IGxhc3Qgc3RhdGVtZW50IGlzIHVuaXZlcnNhbGx5IHRydWUuIFRo
ZXJlIG1heSBiZSBhIHNpbmdsZSBndWVzdCBpbgo+IHRyb3VibGUsIHdoaWNoIC0gdG8gZmluZCBv
dXQgYWJvdXQgaXRzIHN0YXRlIC0gc29tZSBkZWJ1Z2dpbmcga2V5cwo+IG1heSB3YW50IGlzc3Vp
bmcuIERpc3R1cmJpbmcgdGhlIGhvc3QgYW5kIGFsbCBvdGhlciBndWVzdHMgZm9yIHRoaXMKPiBp
cyBub3QgYSBnb29kIGlkZWEgaW1vLgoKVGhpcyBzZWVtcyB0byBzdWdnZXN0IHRoYXQgeW91IG9u
bHkgd2FudCBpbmZvcm1hdGlvbiBmb3IgYSBzaW5nbGUgZ3Vlc3QuIApUaGVyZWZvcmUgdXNpbmcg
ZGVidWdnaW5nIGtleXMgd2FzIGFscmVhZHkgYSBiYWQgaWRlYSBiZWNhdXNlIGl0IHdpbGwgCmRp
c3R1cmIgYWxsIHRoZSBvdGhlciBndWVzdHMuCgpGb3IgeW91ciBzZXR1cCwgaXQgbWlnaHQgYmUg
d29ydGggY29uc2lkZXJpbmcgdG8gZXh0ZW5kIHhlbmN0eCBvciAKaW50cm9kdWNlIGEgd2F5IHRv
IGR1bXAgaW5mb3JtYXRpb24gZm9yIGEgc3BlY2lmaWMgZG9tYWluLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
