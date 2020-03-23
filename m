Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D018F2CE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:28:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGKHc-0000a2-37; Mon, 23 Mar 2020 10:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPxt=5I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGKHa-0000Zx-Uk
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:26:10 +0000
X-Inumbo-ID: b66b1926-6cf0-11ea-82a0-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b66b1926-6cf0-11ea-82a0-12813bfff9fa;
 Mon, 23 Mar 2020 10:26:10 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e5so5598793edq.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 03:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TH3leIfhpqPQahGPn229rKV7ZYEXfszyrCbC5P07SHk=;
 b=i6LZpcSg/T7fGlKj2QKhkm5wZv4Kcg7iB86IyMr+yNRNmxj3YPRohqMJfgJ2pI+bR7
 ecy7PfnofotiYEKXGBd1cLBBef8/jODUP2vf4LBZYlQBeIFtc/QyBUjJN/hWIOPKbc9o
 FOu4dphap+oMapL1ATxRraI3T3MA4AJp6Ph1VS1x7SYjNIANpspkv3SLoCtEbmBbP1+Z
 kpBiU1Xq1NjWgh2ksfAZmUROAZUWtH1YMS3UCnEF2wCJOymR7UQhTPQdWWUz3sZemtGV
 AS2D6Gr1EnwCudzpITFjyQ/JexLRoyCcmve0Pv34dn9razPrWyQ/k29vkQVEWmQxvl6R
 4tXw==
X-Gm-Message-State: ANhLgQ2cIQcyniBeFCXuWkrz0WObROon4AxZyoMegfzSIMoB8jdD1zsb
 VV2b2OJIoil5zDC5enk6buw=
X-Google-Smtp-Source: ADFU+vtx1hHVEd0ayZc4vAY0JLl5Wq5ZRPYIXAax4Bk2ZLOilMMu5K7bnuN4tDbZYyKqwcoXPVNX9w==
X-Received: by 2002:a05:6402:30a3:: with SMTP id
 df3mr20469941edb.286.1584959169210; 
 Mon, 23 Mar 2020 03:26:09 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id ny24sm840580ejb.50.2020.03.23.03.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 03:26:08 -0700 (PDT)
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-18-julien@xen.org>
 <002101d600ee$5120aa40$f361fec0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <aa254dec-e856-2693-8d12-3dc1b2bc0ca7@xen.org>
Date: Mon, 23 Mar 2020 10:26:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <002101d600ee$5120aa40$f361fec0$@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 17/17] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDIzLzAzLzIwMjAgMDg6MzcsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbToganVsaWVuQHhlbi5vcmcgPGp1bGllbkB4
ZW4ub3JnPgo+PiBTZW50OiAyMiBNYXJjaCAyMDIwIDE2OjE0Cj4+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPj4gQ2M6IGp1bGllbkB4ZW4ub3JnOyBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsKPj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29t
PjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZQo+PiBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgUGF1bCBEdXJyYW50Cj4+IDxwYXVsQHhlbi5vcmc+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWth
amltYUBpbnRlbC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IFRpbSBE
ZWVnYW4KPj4gPHRpbUB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBbUEFUQ0ggMTcvMTddIHhlbjogU3dp
dGNoIHBhcmFtZXRlciBpbiBnZXRfcGFnZV9mcm9tX2dmbiB0byB1c2UgdHlwZXNhZmUgZ2ZuCj4+
Cj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Pgo+PiBPbmx5IHJlYXNvbmFibGUgY2xlYW4tdXBz
IGFyZSBkb25lIGluIHRoaXMgcGF0Y2guIFRoZSByZXN0IHdpbGwgdXNlIF9nZm4KPj4gZm9yIHRo
ZSB0aW1lIGJlaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+IAo+IERlZmluaXRlbHkgYW4gaW1wcm92ZW1lbnQgc28uLi4KPiAKPiBS
ZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4gCj4gQnV0IGEgY291cGxl
IG9mIHRoaW5ncyBJIG5vdGljZWQuLi4KPiAKPiBbc25pcF0KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvaHZtL2RvbWFpbi5jCj4+IGluZGV4
IDVkNWE3NDZhMjUuLjNjMjlmZjg2YmUgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
ZG9tYWluLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb21haW4uYwo+PiBAQCAtMjk2LDgg
KzI5NiwxMCBAQCBpbnQgYXJjaF9zZXRfaW5mb19odm1fZ3Vlc3Qoc3RydWN0IHZjcHUgKnYsIGNv
bnN0IHZjcHVfaHZtX2NvbnRleHRfdCAqY3R4KQo+PiAgICAgICBpZiAoIGh2bV9wYWdpbmdfZW5h
YmxlZCh2KSAmJiAhcGFnaW5nX21vZGVfaGFwKHYtPmRvbWFpbikgKQo+PiAgICAgICB7Cj4+ICAg
ICAgICAgICAvKiBTaGFkb3ctbW9kZSBDUjMgY2hhbmdlLiBDaGVjayBQREJSIGFuZCB1cGRhdGUg
cmVmY291bnRzLiAqLwo+PiAtICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlID0gZ2V0X3Bh
Z2VfZnJvbV9nZm4odi0+ZG9tYWluLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM10gPj4gUEFHRV9TSElGVCwKPj4gKyAgICAgICAgc3Ry
dWN0IHBhZ2VfaW5mbyAqcGFnZTsKPj4gKwo+PiArICAgICAgICBwYWdlID0gZ2V0X3BhZ2VfZnJv
bV9nZm4odi0+ZG9tYWluLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Fk
ZHJfdG9fZ2ZuKHYtPmFyY2guaHZtLmd1ZXN0X2NyWzNdKSwKPiAKPiBTaG91bGQgdGhpcyBiZSBj
cjNfdG9fZ2ZuPwoKRGVmaW5pdGVseSB5ZXMuIEkgdGhvdWdodCBJIHNwb3R0ZWQgYWxsIHRoZSB1
c2Ugd2hlbiBpbnRyb2R1Y2luZyB0aGUgbmV3IApoZWxwZXIgYnV0IGl0IGxvb2tzIGxpa2Ugbm90
LiBJIHdpbGwgdXBkYXRlIHRoZSBwYXRjaCBpbiB0aGUgbmV3IHZlcnNpb24gCnRvIHVzZSBjcjNf
dG9fZ2ZuKCkgZXZlcnl3aGVyZSB5b3Ugc3VnZ2VzdGVkLgoKVGhhbmtzLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
