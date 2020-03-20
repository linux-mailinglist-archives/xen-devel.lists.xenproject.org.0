Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF718CB42
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 11:11:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFEa0-0001ef-1U; Fri, 20 Mar 2020 10:08:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AByC=5F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFEZx-0001ea-Sd
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 10:08:37 +0000
X-Inumbo-ID: c36cb8ce-6a92-11ea-bd1b-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c36cb8ce-6a92-11ea-bd1b-12813bfff9fa;
 Fri, 20 Mar 2020 10:08:36 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id n25so5514324eds.10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 03:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L9cy1LELHegFTlEs7bzlbUaqwMTm79MbiED/tpf5tYQ=;
 b=Eg7PEczTFdabzjC4dU8Os3Yx+dCOH650KKtST1N8WP92wTtPT05e0+2dK+CfpUt5zP
 1vh2W2vwEFKf2BbwPNC2nCmspD+k1mO8uU1jEE2Motasdj34KeBlFe1xJtcI8kQ1bnGD
 QgpqkpnXWJeYM0M7NiD4BpYwoz6wSqshrLSZJSWdUKYepGQYVPJSPugOMOD0ANrVET3A
 OV3lQvdhJuPyFZQq2xd1qX6+MNoF1WCyPT7BPqnh4Z+uvdh0n2lW8+lD/5/JPmE5xAff
 YHVS6PAtsneH68pAET1ZBeYtrYHoV0uD6PspSMHSWzvd9aJMden1NFumX9AE6dRcEdmn
 QoMA==
X-Gm-Message-State: ANhLgQ1442H9Xtoqpn9w03XZDUlzCuzHSi8sQYTyQImczs1HkT6BwIwY
 5XTNH6sav417KwUqJX0m6xG5EyX4LZxWMw==
X-Google-Smtp-Source: ADFU+vtfBjyaw4m48XYUxa2/qVv1AXQ7S1lPpAv3fccuB9c/qbUqBbpA8rTplQGbLONFYw6dXpYzhg==
X-Received: by 2002:a50:ef14:: with SMTP id m20mr7091077eds.71.1584698915873; 
 Fri, 20 Mar 2020 03:08:35 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id v13sm314081edr.88.2020.03.20.03.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 03:08:35 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <20200320094214.GT24458@Air-de-Roger.citrite.net>
 <20200320100033.GU24458@Air-de-Roger.citrite.net>
From: Julien Grall <julien@xen.org>
Message-ID: <98a586a1-24e4-2839-270c-49dde5ed0cbf@xen.org>
Date: Fri, 20 Mar 2020 10:08:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320100033.GU24458@Air-de-Roger.citrite.net>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wMy8yMDIwIDEwOjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZy
aSwgTWFyIDIwLCAyMDIwIGF0IDEwOjQyOjE0QU0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4+IE9uIEZyaSwgTWFyIDIwLCAyMDIwIGF0IDA5OjEyOjE2QU0gKzAwMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+IEhpIFJvZ2VyLAo+Pj4KPj4+IE9uIDIwLzAzLzIwMjAgMDk6MDEsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDg6MjE6
MTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5LjAzLjIwMjAgMjA6MDcs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+IEhpLAo+Pj4+Pj4KPj4+Pj4+IE9uIDE5LzAzLzIw
MjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTks
IDIwMjAgYXQgMDY6MDc6NDRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+Pgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAxOS8wMy8yMDIwIDE3OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6MjE6MjNQTSArMDAwMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+Pj4gICDCoCA+PiBXaHkgY2FuJ3QgeW91IGtlZXAg
Zmx1c2hfdGxiX21hc2soKSBoZXJlPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEJlY2F1c2UgZmlsdGVy
ZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlzbWFwLCBhbmQKPj4+Pj4+
Pj4+IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJlIGFuIEFTSUQgZmx1c2ggb24gQU1EIGhh
cmR3YXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGFtIGFmcmFpZCB0aGlzIGRvZXMgbm90IHlldCBl
eHBsYWluIG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxkIG5vdCBiZQo+Pj4+Pj4+PiB1cGRh
dGVkIHNvIGl0IGZsdXNoIHRoZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4KPj4+Pj4+Pgo+Pj4+Pj4+
IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUg
QVNJRHMgb24KPj4+Pj4+PiBldmVyeSBUTEIgZmx1c2guCj4+Pj4+Pj4KPj4+Pj4+PiBmbHVzaF90
bGJfbWFzayBpcyB0b28gd2lkZWx5IHVzZWQgb24geDg2IGluIHBsYWNlcyB3aGVyZSB0aGVyZSdz
IG5vCj4+Pj4+Pj4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNpbmcg
YXNzaXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4+Pj4+Pj4gd2hlbiBydW5uaW5nIG5lc3RlZCwgc2lu
Y2UgdGhvc2UgYXNzaXN0ZWQgZmx1c2hlcyBwZXJmb3JtZWQgYnkgTDAKPj4+Pj4+PiBkb24ndCBm
bHVzaCB0aGUgTDIgZ3Vlc3RzIFRMQnMuCj4+Pj4+Pj4KPj4+Pj4+PiBJIGNvdWxkIGtlZXAgY3Vy
cmVudCBiZWhhdmlvciBhbmQgbGVhdmUgZmx1c2hfdGxiX21hc2sgYWxzbyBmbHVzaGluZyB0aGUK
Pj4+Pj4+PiBBU0lEcywgYnV0IHRoYXQgc2VlbXMgd3JvbmcgYXMgdGhlIGZ1bmN0aW9uIGRvZXNu
J3QgaGF2ZSBhbnl0aGluZyBpbgo+Pj4+Pj4+IGl0J3MgbmFtZSB0aGF0IHN1Z2dlc3RzIGl0IGFs
c28gZmx1c2hlcyB0aGUgaW4tZ3Vlc3QgVExCcyBmb3IgSFZNLgo+Pj4+Pj4KPj4+Pj4+IEkgYWdy
ZWUgdGhlIG5hbWUgaXMgY29uZnVzaW5nLCBJIGhhZCB0byBsb29rIGF0IHRoZSBpbXBsZW1lbnRh
dGlvbiB0byB1bmRlcnN0YW5kIHdoYXQgaXQgZG9lcy4KPj4+Pj4+Cj4+Pj4+PiBIb3cgYWJvdXQg
cmVuYW1pbmcgKG9yIGludHJvZHVjaW5nKSB0aGUgZnVuY3Rpb24gdG8gZmx1c2hfdGxiX2FsbF9n
dWVzdHNfbWFzaygpIG9yIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX2NwdW1hc2soKSkgPwo+Pj4+Pgo+
Pj4+PiBBbmQgdGhpcyB3b3VsZCB0aGVuIGZsdXNoIF9vbmx5XyBndWVzdCBUTEJzPwo+Pj4+Cj4+
Pj4gTm8sIEkgdGhpbmsgZnJvbSBKdWxpZW4ncyBwcm9wb3NhbCAoaWYgSSB1bmRlcnN0b29kIGl0
IGNvcnJlY3RseSkKPj4+PiBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrIHdvdWxkIGRvIHdoYXQg
Zmx1c2hfdGxiX21hc2sgY3VycmVudGx5IGRvZXMKPj4+PiBwcmV2aW91cyB0byB0aGlzIHBhdGNo
IChmbHVzaCBYZW4ncyBUTEJzICsgSFZNIEFTSURzKS4KPj4+Cj4+PiBJdCBsb29rcyBsaWtlIHRo
ZXJlIG1pZ2h0IGJlIGNvbmZ1c2lvbiBvbiB3aGF0ICJndWVzdCBUTEJzIiBtZWFucy4gSW4gbXkK
Pj4+IHZpZXcgdGhpcyBtZWFucyBhbnkgVExCcyBhc3NvY2lhdGVkIGRpcmVjdGx5IG9yIGluZGly
ZWN0bHkgd2l0aCB0aGUgZ3Vlc3QuCj4+PiBPbiBBcm0sIHRoaXMgd291bGQgYmUgbnVrZToKPj4+
ICAgICAtIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyAtPiBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIFRM
QiBlbnRyeQo+Pj4gICAgIC0gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyAtPiBob3N0IHBoeXNpY2Fs
IGFkZHJlc3MgVExCIGVudHJ5Cj4+PiAgICAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgLT4gaG9z
dCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQo+Pgo+PiBBRkFJQ1QgQVNJRCBmbHVzaCBvbiBB
TUQgaGFyZHdhcmUgd2lsbCBmbHVzaCBhbnkgb2YgdGhlIGFib3ZlLCB3aGlsZQo+PiBWUElEIGZs
dXNoIG9uIEludGVsIHdpbGwgb25seSBmbHVzaCB0aGUgZmlyc3QgaXRlbSAoZ3Vlc3QgbGluZWFy
IHRvCj4gCj4gU29ycnksIGRvaW5nIHRvbyBtYW55IHRoaW5ncyBhdCB0aGUgc2FtZSB0aW1lLiBP
biBJbnRlbCBWUElEIGZsdXNoZXMKPiB3aWxsIGdldCByaWQgb2YgZ3Vlc3QgdmlydHVhbCB0byBn
dWVzdCBwaHlzaWNhbCBvciBob3N0IHBoeXNpY2FsLCBidXQKPiBub3Qgb2YgZ3Vlc3QgcGh5c2lj
YWwgdG8gaG9zdCBwaHlzaWNhbCwgeW91IG5lZWQgYW4gRVBUIGZsdXNoIHRvCj4gYWNjb21wbGlz
aCB0aGF0LgpBcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCBvbiB4ODYsIGZsdXNoX3RsYl9tYXNrKCkg
d291bGQgbm90IG51a2UgdGhlIApndWVzdCBwaHlzaWNhbCB0byBob3N0IHBoeXNpY2FsIGVudHJp
ZXM/IElmIHNvLCBob3cgaXMgaXQgbWVhbnQgdG8gYmUgc2FmZT8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
