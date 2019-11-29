Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855210D91F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 18:38:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iakBl-0005gM-2e; Fri, 29 Nov 2019 17:36:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Loh=ZV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iakBj-0005gH-IF
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 17:36:15 +0000
X-Inumbo-ID: bda23f34-12ce-11ea-a3e7-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bda23f34-12ce-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 17:36:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u8so421804wmu.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 09:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sCgBYTUhy3o38Kz7HFf4piMIYuE/aOdg8yvA08mdsPY=;
 b=r5uBiq8e96fx9u+RkrK/dXPqtCUJwKmQYTC0PEY/b0BB6b68tRe3I9vLWD9u3T8aJL
 8XCOqhJ0hQdEDReeVBKwujXKQ2wjsenQXfvH8X0+8mwZ46pdglUWSXOh45Ir7f2wESnW
 s868w51pezKRcJyHGYKtsCOZUg1EUx0iahWvdTeN2f/Nckn653pdx6igERgSdaK+fo3+
 2zyZsEiK6K/Ky4q/KKlhL7eR4WL6E1s/3u0ijn5JRjcge24v6OuO5TSa3FCyIbHdoqS+
 0sg4WrhNQVZtDRynIHz7ps5kHd1Qw88vJ9aF7IedqGIVddKLVgdKT9b2w0Rg6p2jpTy4
 D7KA==
X-Gm-Message-State: APjAAAUDmgirgsnRicGaTBZPaWlBjpk1K/f6HzYWatDxndO9Elaa/Xes
 liEgpt3aznmn1thCQX/ukYM=
X-Google-Smtp-Source: APXvYqxYDqjhVyo6JXQwTKvK0uipkeVIoe61DgnCG6fIVSYcVGwo3i5BhS+J6+5lkJYXIE2RaOE2GQ==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr15970139wmj.152.1575048973888; 
 Fri, 29 Nov 2019 09:36:13 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id d186sm14981364wmf.7.2019.11.29.09.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 09:36:13 -0800 (PST)
Date: Fri, 29 Nov 2019 17:36:11 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191129173611.skfu63d4kqcysnoi@debian>
References: <20191129172445.32664-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129172445.32664-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH-for-4.13 v7] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDU6MjQ6NDVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEZyb206IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAK
PiBYZW4gdXNlZCB0byBoYXZlIHNpbmdsZSwgc3lzdGVtLXdpZGUgbGltaXRzIGZvciB0aGUgbnVt
YmVyIG9mIGdyYW50Cj4gZnJhbWVzIGFuZCBtYXB0cmFjayBmcmFtZXMgYSBndWVzdCB3YXMgYWxs
b3dlZCB0byBjcmVhdGUuIEluY3JlYXNpbmcKPiBvciBkZWNyZWFzaW5nIHRoaXMgc2luZ2xlIGxp
bWl0IG9uIHRoZSBYZW4gY29tbWFuZC1saW5lIHdvdWxkIGNoYW5nZQo+IHRoZSBsaW1pdCBmb3Ig
YWxsIGd1ZXN0cyBvbiB0aGUgc3lzdGVtLgo+IAo+IExhdGVyLCBwZXItZG9tYWluIGxpbWl0cyBm
b3IgdGhlc2UgdmFsdWVzIHdhcyBjcmVhdGVkLiBUaGUgc3lzdGVtLXdpZGUKPiBsaW1pdHMgYmVj
YW1lIHN0cmljdCBsaW1pdHM6IGRvbWFpbnMgY291bGQgbm90IGJlIGNyZWF0ZWQgd2l0aCBoaWdo
ZXIKPiBsaW1pdHMsIGJ1dCBjb3VsZCBiZSBjcmVhdGVkIHdpdGggbG93ZXIgbGltaXRzLiBIb3dl
dmVyLCB0aGF0IGNoYW5nZQo+IGFsc28gaW50cm9kdWNlZCBhIHJhbmdlIG9mIGRpZmZlcmVudCAi
ZGVmYXVsdCIgdmFsdWVzIGludG8gdmFyaW91cwo+IHBsYWNlcyBpbiB0aGUgdG9vbHN0YWNrOgo+
IAo+IC0gVGhlIHB5dGhvbiBsaWJ4YyBiaW5kaW5ncyBoYXJkLWNvZGVkIHRoZXNlIHZhbHVlcyB0
byAzMiBhbmQgMTAyNCwKPiAgIHJlc3BlY3RpdmVseQo+IC0gVGhlIGxpYnhsIGRlZmF1bHQgdmFs
dWVzIGFyZSAzMiBhbmQgMTAyNCByZXNwZWN0aXZlbHkuCj4gLSB4bCB3aWxsIHVzZSB0aGUgbGli
eGwgZGVmYXVsdCBmb3IgbWFwdHJhY2ssIGJ1dCBkb2VzIGl0cyBvd24gZGVmYXVsdAo+ICAgY2Fs
Y3VsYXRpb24gZm9yIGdyYW50IGZyYW1lczogZWl0aGVyIDMyIG9yIDY0LCBiYXNlZCBvbiB0aGUg
bWF4Cj4gICBwb3NzaWJsZSBtZm4uCj4gCj4gVGhlc2UgZGVmYXVsdHMgaW50ZXJhY3QgcG9vcmx5
IHdpdGggdGhlIGh5cGVydmlzb3IgY29tbWFuZC1saW5lIGxpbWl0Ogo+IAo+IC0gVGhlIGh5cGVy
dmlzb3IgY29tbWFuZC1saW5lIGxpbWl0IGNhbm5vdCBiZSB1c2VkIHRvIHJhaXNlIHRoZSBsaW1p
dAo+ICAgZm9yIGFsbCBndWVzdHMgYW55bW9yZSwgYXMgdGhlIGRlZmF1bHQgaW4gdGhlIHRvb2xz
dGFjayB3aWxsCj4gICBlZmZlY3RpdmVseSBvdmVycmlkZSB0aGlzLgo+IC0gSWYgeW91IHVzZSB0
aGUgaHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQgdG8gKnJlZHVjZSogdGhlIGxpbWl0LAo+
ICAgdGhlbiB0aGUgImRlZmF1bHQiIHZhbHVlcyBnZW5lcmF0ZWQgYnkgdGhlIHRvb2xzdGFjayBh
cmUgdG9vIGhpZ2gsCj4gICBhbmQgYWxsIGd1ZXN0IGNyZWF0aW9ucyB3aWxsIGZhaWwuCj4gCj4g
SW4gb3RoZXIgd29yZHMsIHRoZSB0b29sc3RhY2sgZGVmYXVsdHMgcmVxdWlyZSBhbnkgY2hhbmdl
IHRvIGJlCj4gZWZmZWN0ZWQgYnkgaGF2aW5nIHRoZSBhZG1pbiBleHBsaWNpdGx5IHNwZWNpZnkg
YSBuZXcgdmFsdWUgaW4gZXZlcnkKPiBndWVzdC4KPiAKPiBJbiBvcmRlciB0byBhZGRyZXNzIHRo
aXMsIGhhdmUgZ3JhbnRfdGFibGVfaW5pdCB0cmVhdCBuZWdhdGl2ZSB2YWx1ZXMKPiBmb3IgbWF4
X2dyYW50X2ZyYW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBhcyBpbnN0cnVjdGlvbnMgdG8g
dXNlIHRoZQo+IHN5c3RlbS13aWRlIGRlZmF1bHQsIGFuZCBoYXZlIGFsbCB0aGUgYWJvdmUgdG9v
bHN0YWNrcyBkZWZhdWx0IHRvIHBhc3NpbmcKPiAtMSB1bmxlc3MgYSBkaWZmZXJlbnQgdmFsdWUg
aXMgZXhwbGljaXRseSBjb25maWd1cmVkLgo+IAo+IFRoaXMgcmVzdG9yZXMgdGhlIG9sZCBiZWhh
dmlvciBpbiB0aGF0IGNoYW5naW5nIHRoZSBoeXBlcnZpc29yIGNvbW1hbmQtbGluZQo+IG9wdGlv
biBjYW4gY2hhbmdlIHRoZSBiZWhhdmlvciBmb3IgYWxsIGd1ZXN0cywgd2hpbGUgcmV0YWluaW5n
IHRoZSBhYmlsaXR5Cj4gdG8gc2V0IHBlci1ndWVzdCB2YWx1ZXMuICBJdCBhbHNvIHJlbW92ZXMg
dGhlIGJ1ZyB0aGF0IHJlZHVjaW5nIHRoZQo+IHN5c3RlbS13aWRlIG1heCB3aWxsIGNhdXNlIGFs
bCBkb21haW5zIHdpdGhvdXQgZXhwbGljaXQgbGltaXRzIHRvIGZhaWwuCj4gCj4gTk9URTogLSBU
aGUgT2NhbWwgYmluZGluZ3MgcmVxdWlyZSB0aGUgY2FsbGVyIHRvIGFsd2F5cyBzcGVjaWZ5IGEg
dmFsdWUsCj4gICAgICAgICBhbmQgdGhlIGNvZGUgdG8gc3RhcnQgYSB4ZW5zdG9yZWQgc3R1YmRv
bWFpbiBoYXJkLWNvZGVzIHRoZXNlIHRvIDQKPiAJYW5kIDEyOCByZXNwZWN0aXZlbHk7IHRoaXMg
YmVoYXZvdXIgd2lsbCBub3QgYmUgbW9kaWZpZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
