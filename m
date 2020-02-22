Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F7168EE6
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 13:36:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Tx1-0001ue-2Z; Sat, 22 Feb 2020 12:32:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xy+0=4K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j5Twz-0001uU-8s
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 12:32:05 +0000
X-Inumbo-ID: 5406c341-556f-11ea-8820-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5406c341-556f-11ea-8820-12813bfff9fa;
 Sat, 22 Feb 2020 12:32:03 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r18so5914632edl.1
 for <xen-devel@lists.xenproject.org>; Sat, 22 Feb 2020 04:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rCanrszJfVLapm5kBHLh+jeY0fl5I5ZPi1rsUCgO0FA=;
 b=UHlW7Xl8Xw6i1BADfgEMDkBEUjyT8IaRuB+k8O1kjQkEEQPyW+mNMsoD+v66Kw8l0E
 8Nj3zqPURUzvu2q0YvbcOoCwd19u1MVDJDeW7lX+DscAl/WdTQWWRauGIT9nurxT8i8D
 7DVXFm0fpzzpeTgtdpPfC783vC/DYq/qTBA53zQStaMtHR9AEpitIiBQ2CWJRYdP5z8l
 uW+YDkBcAzHQcf96HwDgl/0necpf313jE1OeEr1cNbyxTRtnfHk9Ph1z6OXtffb9esCR
 hMbRflOxFybavvE6UihIrTydQ+o++CxfxSt8pdhEKHxT4I4x4lvktZF918at38Hdb+FU
 P03g==
X-Gm-Message-State: APjAAAXazJ+b/SfgKq5pmEL2r6cO39PbZlmRHkAR83QneTjZclree2xj
 ffzuRsA0bXD/j0b6P9S1F5E=
X-Google-Smtp-Source: APXvYqxJODb70dr13DChWQC285GrlV/Rt0TrS09JxYOpsippw1jrGFyeqwO3TbVx0/Vrw6EO9oBibQ==
X-Received: by 2002:aa7:cf06:: with SMTP id a6mr39998058edy.161.1582374722869; 
 Sat, 22 Feb 2020 04:32:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id b1sm616579edw.72.2020.02.22.04.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2020 04:32:02 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200218122114.17596-1-jgross@suse.com>
 <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
 <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <01202d13-95a5-4491-63a3-ed3195d92974@xen.org>
Date: Sat, 22 Feb 2020 12:32:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMi8wMi8yMDIwIDA2OjA1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDIyLjAy
LjIwIDAzOjI5LCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gMTgvMDIvMjAyMCAxMjoyMSwg
SnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IFRvZGF5IHRoZSBSQ1UgaGFuZGxpbmcgaW4gWGVuIGlz
IGFmZmVjdGluZyBzY2hlZHVsaW5nIGluIHNldmVyYWwgd2F5cy4KPj4+IEl0IGlzIHJhaXNpbmcg
c2NoZWQgc29mdGlycXMgd2l0aG91dCBhbnkgcmVhbCBuZWVkIGFuZCBpdCByZXF1aXJlcwo+Pj4g
dGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNoIGludGVyYWN0cyBiYWRseSB3aXRoIGNv
cmUgc2NoZWR1bGluZy4KPj4+Cj4+PiBUaGlzIHNtYWxsIHNlcmllcyByZXBhaXJzIHRob3NlIGlz
c3Vlcy4KPj4+Cj4+PiBBZGRpdGlvbmFsbHkgc29tZSBBU1NFUlQoKXMgYXJlIGFkZGVkIGZvciB2
ZXJpZmljYXRpb24gb2Ygc2FuZSByY3UKPj4+IGhhbmRsaW5nLiBJbiBvcmRlciB0byBhdm9pZCB0
aG9zZSB0cmlnZ2VyaW5nIHJpZ2h0IGF3YXkgdGhlIG9idmlvdXMKPj4+IHZpb2xhdGlvbnMgYXJl
IGZpeGVkLgo+Pgo+PiBJJ3ZlIGRvbmUgbW9yZSB0ZXN0aW5nIG9mIHRoaXMgd2l0aCBbMV0gYW5k
LCB1bmZvcnR1bmF0ZWx5LCBpdCBxdWl0ZSAKPj4gZWFzaWx5Cj4+IGRlYWRsb2NrcyB3aGlsZSB3
aXRob3V0IHRoaXMgc2VyaWVzIGl0IGRvZXNuJ3QuCj4+Cj4+IFN0ZXBzIHRvIHJlcHJvOgo+PiAt
IGFwcGx5IFsxXQo+PiAtIHRha2UgYSBob3N0IHdpdGggY29uc2lkZXJhYmxlIENQVSBjb3VudCAo
fjY0KQo+PiAtIHJ1biBhIGxvb3A6IHhlbi1ocHRvb2wgc210LWRpc2FibGU7IHhlbi1ocHRvb2wg
c210LWVuYWJsZQo+Pgo+PiBbMV0gCj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMi9tc2cwMTM4My5odG1sIAo+Pgo+IAo+IFllYWgs
IHRoZSByZWFzb24gZm9yIHRoYXQgaXMgdGhhdCByY3VfYmFycmllcigpIGlzIGEgbm9wIGluIHRo
aXMKPiBzaXR1YXRpb24gd2l0aG91dCBteSBwYXRjaCwgYXMgdGhlIHRoZW4gY2FsbGVkIHN0b3Bf
bWFjaGluZV9ydW4oKSBpbgo+IHJjdV9iYXJyaWVyKCkgd2lsbCBqdXN0IHJldHVybiAtRUJVU1ku
CgpJIHRoaW5rIHJjdV9iYXJyaWVyKCkgYmVlbiBhIE5PUCBpcyBhbHNvIHByb2JsZW0gYXMgaXQg
bWVhbnMgeW91IHdvdWxkIApiZSBhYmxlIHRvIGNvbnRpbnVlIGJlZm9yZSB0aGUgaW4tZmxpZ2h0
IGNhbGxiYWNrIGhhcyBiZWVuIGNvbXBsZXRlZC4KCkJ1dCBJIGFtIG5vdCBlbnRpcmVseSBzdXJl
IHdoeSBhIGRlYWRsb2NrIHdvdWxkIGhhcHBlbiB3aXRoIHlvdXIgCnN1Z2dlc3Rpb24/IENvdWxk
IHlvdSBkZXRhaWxzIGEgYml0IG1vcmU/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
