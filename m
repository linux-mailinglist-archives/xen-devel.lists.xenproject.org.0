Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B38157473
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:24:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j184Y-0001EV-1l; Mon, 10 Feb 2020 12:21:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbPx=36=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j184V-0001EQ-VE
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 12:21:51 +0000
X-Inumbo-ID: ea537722-4bff-11ea-b4b3-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea537722-4bff-11ea-b4b3-12813bfff9fa;
 Mon, 10 Feb 2020 12:21:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a9so22974wmj.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2020 04:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sYGEnxOLZBvSEzsY+FRzKlt9mwE+U4zkjYAsaybwSp4=;
 b=oXHRSMic1D+IqaYyuw1PR6XL5ccbYj0fzEwAEUDOhY+WkmA6UgAVDdhtZ/XhKhnJvO
 7XHztitkY0E+xbvpRwaDkcoNewhCyxpDmqekrkllwNxhkfsCV/iB/JSc8rL2Y0vABD9s
 /qpVgwKsndyroNIfx7MDU6/BD+HMWaHMayY3HPdp6B0E0bpAr/MfawTjZwE8NoYPzzTk
 C0y40570REOKunepjyubHKKKNWiEhbcs5ZzwWWO5EvBPtAEr49wcN9DHImuXSYycUEKx
 2Jgt4j8b1YxHsGhVkIRFgSUNfPcpZEm9WAITWBO/Lwyofjdbzvl4vgqiFh8GCS0gI5we
 LyjA==
X-Gm-Message-State: APjAAAVSwZq/AMqfgTJX7nORYJn1uw+0u1j+R0S3u7nfqCBlf/d+/Git
 VHj2yn1qxBcdqHv6Lg47I8s=
X-Google-Smtp-Source: APXvYqxc4ybZsvSRrSgZdvaiTUuYXhTuLvu3mb7WEOw9dZol/EsAqOcJkNcpf6mw+lwcO03OdKdWFg==
X-Received: by 2002:a1c:df09:: with SMTP id w9mr14443602wmg.143.1581337309471; 
 Mon, 10 Feb 2020 04:21:49 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id 2sm327346wrq.31.2020.02.10.04.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 04:21:48 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
 <775b8691-068d-2af9-1b59-d66233708595@suse.com>
 <69d410bd-2397-537d-6507-4c710d166396@xen.org>
 <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
 <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
 <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <87208524-5c30-48cf-fe7a-e5d77a26414b@xen.org>
Date: Mon, 10 Feb 2020 12:21:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8wMi8yMDIwIDExOjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxMC4wMi4y
MDIwIDEyOjAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDEwLzAyLzIwMjAgMTA6MjgsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTAuMDIuMjAyMCAxMDo0NSwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+Pj4+IFBsZWFzZSBzdWdnZXN0IGEgbmV3IG5hbWUgZm9yIEJJVF9XT1JEKCkgYW5kIHdl
IGNhbiByZXB1cnBvc2UgaXQuIFNvCj4+Pj4gZmFyLCBJIGhhdmUgbm8gaWRlYSBob3cgdG8gcmVu
YW1lIGl0Lgo+Pj4KPj4+IF9CSVRfV09SRCgpIGlmIHlvdS93ZSB3ZXJlIHRvIGFjY2VwdCB0aGUg
bmFtZSBzcGFjZSB2aW9sYXRpb24sIG9yCj4+PiBCSVRNQVBfV09SRCgpPwo+Pgo+PiBCSVRNQVBf
V09SRCgpIGlzIG1pc2xlYWRpbmcgYXMgYml0bWFwIGFyZSB1c2luZyB1bnNpZ25lZCBsb25nLiBT
byBteQo+PiBwcmVmZXJlbmNlIGlzIF9CSVRfV09SRCgpLgo+Pgo+PiBBbm90aGVyIGFsdGVybmF0
aXZlIHdvdWxkIGJlIEFUT01JQ19XT1JEKCkuCj4gCj4gRXhjZXB0IHRoYXQgdGhlcmUgYXJlIGFs
c28gbm9uLWF0b21pYyBiaXRtYXAgb3BlcmF0aW9ucywgSSBkb24ndCByZWFsbHkKPiBjYXJlIGFi
b3V0IHRoZSBuYW1lIGFzIGxvbmcgYXMgaXQncyBub3QgQklUX1dPUkQoKSAob3IgYW55dGhpbmcg
ZWxzZQo+IHRoYXQncyBsaWtlbHkgdG8gY29sbGlkZSB3aXRoIG90aGVyIHN0dWZmLgoKSSBhbSBh
ZnJhaWQgd2UgYXJlIGRpc2FncmVpbmcgb24gd2hhdCBpcyBjb2xsaWRpbmcgd2l0aCB3aGF0IGhl
cmUuIFRoZSAKbmFtaW5nIG9uIEFybSBoYXMgYmVlbiBsaWtlIHRoYXQgZm9yIHRoZSBwYXN0IGZl
dyB5ZWFycy4gV2hpbGUgdGhpcyBtYXkgCm5vdCBoYXZlIGJlZW4gdGhlIGJlc3QgY2hvaWNlLCB0
aGlzIGlzIHlvdXIgc3VnZ2VzdGlvbiBjb2xsaWRpbmcgd2l0aCAKd2hhdCBpcyBleGlzdGluZy4K
CkkgYW0gbm90IGVudGlyZWx5IGZ1c3NlZCBhYm91dCB0aGUgbmFtZXNwYWNlIHZpb2xhdGlvbiwg
YWx0aG91Z2ggSSB0aGluayAKdGhlIG5hbWUgaXMgcG90ZW50aWFsbHkgbWlzbGVhZGluZy4gWWV0
LCBJIHdvdWxkIGJlIGhhcHB5IHRvIHVzZSAKX0JJVF9XT1JEKCkgYXMgdGhpcyBpcyB0aGUgYmVz
dCBvZiBpdCBzbyBmYXIuCgpXaGlsZSB0aGlzIGlzIGNvZGUgZmFsbHMgdW5kZXIgQXJtIG1haW50
YWluZXJzaGlwLCBJIGFtIHN0aWxsIGhhcHB5IHRvIApjb25zaWRlciBvdGhlciBuYW1pbmcuIEJ1
dCBhdCB0aGlzIHBvaW50LCB5b3Ugc2hvdWxkIGJlIHRoZSBvbmUgc3VnZ2VzdGluZy4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
