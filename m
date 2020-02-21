Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033EF167DAA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 13:45:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j57du-0005M3-TG; Fri, 21 Feb 2020 12:42:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j57ds-0005Lu-Rt
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 12:42:52 +0000
X-Inumbo-ID: ab8263c3-54a7-11ea-8647-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab8263c3-54a7-11ea-8647-12813bfff9fa;
 Fri, 21 Feb 2020 12:42:52 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p14so2121784edy.13
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 04:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C48s3cMxo3GnvF5Cm1DC/0XR8Vw9BzwoW6bAApV+oVg=;
 b=EUCw+CaXjQWyU19Z0UXPboiJHX/B58sws7fKKcjs1qpqDqoCQ+TilB4WFvx73cuG8/
 9lGebMqrpzTSU0phfz9OQdk2TDxaPz5X1DPujAMJbaXufg8bPYpPF8r+v9XUIlzNvQ4N
 AyTHl1lRtTGzqJ58e4KuPUDsb9pur4CJaKIJC6KYDzgNpzH8wbtLTbDZS+mbE9yraImn
 /372kuj0hqqYtZVkdpu1AbS6gAMidaXvb9K6k/dIgpVcuAm//eSLPvYYgwIT5l4ec1tr
 fK0DOd16AwASLZe3NIqMYPl6EoP8rog6AugY5vBbbmR038mNHeLWCRF5LlejXEVqyc79
 fCqg==
X-Gm-Message-State: APjAAAVPn+26+uX/5kBNT9ZotwkgoAtubTKYV82ADou1CzEyIMaB5iOb
 RlNhWgpDjexzkh/n7qOS9A4=
X-Google-Smtp-Source: APXvYqwdkqH75gPGn6f29nggDXYrIPgu1MAilAgveVTkdtY+rlblsUhNDw5PNmxk/GLQEbKUsq6toQ==
X-Received: by 2002:a17:906:7f02:: with SMTP id
 d2mr33006169ejr.261.1582288971229; 
 Fri, 21 Feb 2020 04:42:51 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id j21sm305965eds.8.2020.02.21.04.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 04:42:50 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <6b92e30f-a2ea-cb8c-6e7b-25042cbfa222@xen.org>
Date: Fri, 21 Feb 2020 12:42:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221091005.GT4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMS8wMi8yMDIwIDA5OjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGksCj4+Cj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
Pj4+IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIHRv
IGFsc28gbG9jayBpdCBpbgo+Pj4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dp
bmcgcmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUg
Y2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+PiBhY2Nlc3Nl
cyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+Pj4KPj4+
IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxs
b3dzIHRvIHN1cHBvcnQKPj4+IHVwIHRvIDE2Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0
ZSBsb2NrIG1hc2sgdG8gMiBiaXRzOiBvbmUgdG8KPj4+IHNpZ25hbCB0aGVyZSBhcmUgcGVuZGlu
ZyB3cml0ZXJzIHdhaXRpbmcgb24gdGhlIGxvY2sgYW5kIHRoZSBvdGhlciB0bwo+Pj4gc2lnbmFs
IHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQg
ZGF0YQo+Pj4gaXMgdXNpbmcgMTZiaXRzLCB0aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gYmUgYWJs
ZSB0byBjbGVhciBpdCAoYW5kCj4+PiB0aHVzIHJlbGVhc2UgdGhlIGxvY2spIHVzaW5nIGEgMTZi
aXQgYXRvbWljIHdyaXRlLgo+Pj4KPj4+IFRoaXMgcmVkdWNlcyB0aGUgbWF4aW11bSBudW1iZXIg
b2YgY29uY3VycmVudCByZWFkZXJzIGZyb20gMTY3NzcyMTYgdG8KPj4+IDY1NTM2LCBJIHRoaW5r
IHRoaXMgc2hvdWxkIHN0aWxsIGJlIGVub3VnaCwgb3IgZWxzZSB0aGUgbG9jayBmaWVsZAo+Pj4g
Y2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1
cHBvcnQgYXRvbWljCj4+PiBvcGVyYXRpb25zIG9uIDY0Yml0IGludGVnZXJzLgo+Pgo+PiBGV0lX
LCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGlu
dGVnZXJzLgo+Pgo+Pj4gICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2Nr
X3QgKmxvY2spCj4+PiAgICB7Cj4+PiAtICAgIC8qCj4+PiAtICAgICAqIElmIHRoZSB3cml0ZXIg
ZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4KPj4+IC0gICAgICog
T3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rpb24gd2lsbCBiZSB1c2VkIHRvIGNsZWFyIGl0
Lgo+Pj4gLSAgICAgKi8KPj4+IC0gICAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9jay0+Y250
cyk7Cj4+PiArICAgIC8qIFNpbmNlIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4g
YmUgY2xlYXJlZCBkaXJlY3RseS4gKi8KPj4+ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRf
YnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4+PiArICAgIEJVSUxEX0JVR19PTihf
UVJfU0hJRlQgIT0gMTYpOwo+Pj4gKyAgICB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2st
PmNudHMsIDApOwo+Pgo+PiBJIHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8gY2FzdCBhbiBhdG9t
aWNfdCgpIGRpcmVjdGx5IGludG8gYSB1aW50MTZfdC4gWW91Cj4+IHdvdWxkIGF0IGxlYXN0IHdh
bnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPiAKPiBTdXJlLCBJIHdhcyB3b25k
ZXJpbmcgYWJvdXQgdGhpcyBteXNlbGYuCj4gCj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRz
LCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVkIHVwb24KPiBjb21taXQgaWYgdGhl
cmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KCkl0IGlzIHRyaXZpYWwgZW5vdWdoIHRvIGJlIGZpeGVk
IHdoaWxlIGNvbW1pdHRpbmcuIEFzc3VtaW5nIHRoaXMgaXMgCmdvaW5nIHRvIGJlIGZpeGVkOgoK
UmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
