Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4118CFE0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:20:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFITI-0007Gp-Vq; Fri, 20 Mar 2020 14:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AByC=5F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFITH-0007Gk-Kz
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:17:59 +0000
X-Inumbo-ID: 9971e828-6ab5-11ea-bd7f-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9971e828-6ab5-11ea-bd7f-12813bfff9fa;
 Fri, 20 Mar 2020 14:17:58 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z3so7239987edq.11
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 07:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JPvP68ovokqBpS1TbA4zoI7V5O1UVjRTPO2AwjZRnLg=;
 b=M/Q9WuYStK+aQB00hRRy8PN67E/r+UQ/Dm5pH3LiAZqVtmlbHsj94LLrAwBm6LBcDU
 ZnGpXkzyz06lS/ywLinFlqTgQoAqi9QsBAU5t1vkvNxr8uGdFy6fi88dXRCKw3ELw0Rt
 DRpYE6rlWWH0zWIcjoWWhwMSUByfk6ssJtLTznEPGgekFcVCISpJLJPLSRrRw4nD36yI
 EvAQoXRUvI0CShhDS5A2H98JJdAO6awgPLajlHhyvpFT5zqmRYx6oE+HTA0Y5/GN/Jmi
 qut1h/0+WCtTD8rYPM1qF7uuMvJDrPYU3+2imUGn5K3gBMG7R7eCh8BP8unBwe5YlBvW
 weGA==
X-Gm-Message-State: ANhLgQ0DjBA1vD/Cuzh1t+WU2SxLroMB+XtXAH42uKHRv4nusgNP6LZ3
 P0OzSaEM0aZ460XhD5Qw1ho=
X-Google-Smtp-Source: ADFU+vsH7znoK5nEsSru8DXDW3P5SqRfVjrHK1CnzG5y5aceRfItP4WwjvNfY3rri2jf/fYlCSAtgg==
X-Received: by 2002:a50:c945:: with SMTP id p5mr2559253edh.122.1584713878005; 
 Fri, 20 Mar 2020 07:17:58 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id b5sm370925edk.72.2020.03.20.07.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 07:17:57 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <54040784-84b2-e888-68f1-af0fa41835f7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ec3253db-3345-c384-b766-63962e563ed8@xen.org>
Date: Fri, 20 Mar 2020 14:17:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <54040784-84b2-e888-68f1-af0fa41835f7@suse.com>
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
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wMy8yMDIwIDEzOjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMC4wMy4y
MDIwIDEwOjEyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDIwLzAzLzIwMjAgMDk6MDEsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAwODoyMTox
OUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOS4wMy4yMDIwIDIwOjA3LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IE9uIDE5LzAzLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4+Pj4+PiBPbiBUaHUsIE1hciAxOSwgMjAyMCBhdCAwNjowNzo0NFBNICsw
MDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6
MjE6MjNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+PiAgwqDCoCA+PiBXaHkg
Y2FuJ3QgeW91IGtlZXAgZmx1c2hfdGxiX21hc2soKSBoZXJlPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBC
ZWNhdXNlIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrIGlzIHVzZWQgaW4gcG9wdWxhdGVfcGh5c21h
cCwgYW5kCj4+Pj4+Pj4+IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJlIGFuIEFTSUQgZmx1
c2ggb24gQU1EIGhhcmR3YXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBhbSBhZnJhaWQgdGhpcyBkb2Vz
IG5vdCB5ZXQgZXhwbGFpbiBtZSB3aHkgZmx1c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPj4+
Pj4+PiB1cGRhdGVkIHNvIGl0IGZsdXNoIHRoZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4KPj4+Pj4+
Cj4+Pj4+PiBDdXJyZW50IGJlaGF2aW9yIHByZXZpb3VzIHRvIHRoaXMgcGF0Y2ggaXMgdG8gZmx1
c2ggdGhlIEFTSURzIG9uCj4+Pj4+PiBldmVyeSBUTEIgZmx1c2guCj4+Pj4+Pgo+Pj4+Pj4gZmx1
c2hfdGxiX21hc2sgaXMgdG9vIHdpZGVseSB1c2VkIG9uIHg4NiBpbiBwbGFjZXMgd2hlcmUgdGhl
cmUncyBubwo+Pj4+Pj4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNp
bmcgYXNzaXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4+Pj4+PiB3aGVuIHJ1bm5pbmcgbmVzdGVkLCBz
aW5jZSB0aG9zZSBhc3Npc3RlZCBmbHVzaGVzIHBlcmZvcm1lZCBieSBMMAo+Pj4+Pj4gZG9uJ3Qg
Zmx1c2ggdGhlIEwyIGd1ZXN0cyBUTEJzLgo+Pj4+Pj4KPj4+Pj4+IEkgY291bGQga2VlcCBjdXJy
ZW50IGJlaGF2aW9yIGFuZCBsZWF2ZSBmbHVzaF90bGJfbWFzayBhbHNvIGZsdXNoaW5nIHRoZQo+
Pj4+Pj4gQVNJRHMsIGJ1dCB0aGF0IHNlZW1zIHdyb25nIGFzIHRoZSBmdW5jdGlvbiBkb2Vzbid0
IGhhdmUgYW55dGhpbmcgaW4KPj4+Pj4+IGl0J3MgbmFtZSB0aGF0IHN1Z2dlc3RzIGl0IGFsc28g
Zmx1c2hlcyB0aGUgaW4tZ3Vlc3QgVExCcyBmb3IgSFZNLgo+Pj4+Pgo+Pj4+PiBJIGFncmVlIHRo
ZSBuYW1lIGlzIGNvbmZ1c2luZywgSSBoYWQgdG8gbG9vayBhdCB0aGUgaW1wbGVtZW50YXRpb24g
dG8gdW5kZXJzdGFuZCB3aGF0IGl0IGRvZXMuCj4+Pj4+Cj4+Pj4+IEhvdyBhYm91dCByZW5hbWlu
ZyAob3IgaW50cm9kdWNpbmcpIHRoZSBmdW5jdGlvbiB0byBmbHVzaF90bGJfYWxsX2d1ZXN0c19t
YXNrKCkgb3IgZmx1c2hfdGxiX2FsbF9ndWVzdHNfY3B1bWFzaygpKSA/Cj4+Pj4KPj4+PiBBbmQg
dGhpcyB3b3VsZCB0aGVuIGZsdXNoIF9vbmx5XyBndWVzdCBUTEJzPwo+Pj4KPj4+IE5vLCBJIHRo
aW5rIGZyb20gSnVsaWVuJ3MgcHJvcG9zYWwgKGlmIEkgdW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkp
Cj4+PiBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrIHdvdWxkIGRvIHdoYXQgZmx1c2hfdGxiX21h
c2sgY3VycmVudGx5IGRvZXMKPj4+IHByZXZpb3VzIHRvIHRoaXMgcGF0Y2ggKGZsdXNoIFhlbidz
IFRMQnMgKyBIVk0gQVNJRHMpLgo+Pgo+PiBJdCBsb29rcyBsaWtlIHRoZXJlIG1pZ2h0IGJlIGNv
bmZ1c2lvbiBvbiB3aGF0ICJndWVzdCBUTEJzIiBtZWFucy4gSW4gbXkgdmlldyB0aGlzIG1lYW5z
IGFueSBUTEJzIGFzc29jaWF0ZWQgZGlyZWN0bHkgb3IgaW5kaXJlY3RseSB3aXRoIHRoZSBndWVz
dC4gT24gQXJtLCB0aGlzIHdvdWxkIGJlIG51a2U6Cj4+ICDCoMKgIC0gZ3Vlc3QgdmlydHVhbCBh
ZGRyZXNzIC0+IGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgVExCIGVudHJ5Cj4+ICDCoMKgIC0gZ3Vl
c3QgcGh5c2ljYWwgYWRkcmVzcyAtPiBob3N0IHBoeXNpY2FsIGFkZHJlc3MgVExCIGVudHJ5Cj4+
ICDCoMKgIC0gZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBU
TEIgZW50cnkKPj4KPj4gSSB3b3VsZCBhc3N1bWUgeW91IHdhbnQgc29tZXRoaW5nIHNpbWlsYXIg
b24geDg2LCByaWdodD8KPiAKPiBJIGRvbid0IHRoaW5rIHdlJ2Qgd2FudCB0aGUgbWlkZGxlIG9m
IHRoZSB0aHJlZSBpdGVtcyB5b3UgbGlzdCwKPiBidXQgSSBhbHNvIGRvbid0IHNlZSBob3cgdGhp
cyB3b3VsZCBiZSByZWxldmFudCBoZXJlIC0gZmx1c2hpbmcKPiB0aGF0IGlzIGEgcDJtIG9wZXJh
dGlvbiwgbm90IG9uZSBhZmZlY3RpbmcgaW4tZ3Vlc3QgdHJhbnNsYXRpb25zLgoKQXBvbG9naWVz
IGlmIHRoaXMgc2VlbXMgb2J2aW91cyB0byB5b3UsIGJ1dCB3aHkgd291bGQgeW91IHdhbnQgdG8g
b25seSAKZmx1c2ggaW4tZ3Vlc3QgdHJhbnNsYXRpb25zIGluIGNvbW1vbiBjb2RlPyBXaGF0IGFy
ZSB5b3UgdHJ5aW5nIHRvIApwcm90ZWN0IGFnYWluc3Q/CgpBdCBsZWFzdCBvbiBBcm0sIHlvdSBk
b24ndCBrbm93IHdoZXRoZXIgdGhlIFRMQnMgY29udGFpbnMgc3BsaXQgb3IgCmNvbWJpbmVkIHN0
YWdlLTIgKFAyTSkgLSBzdGFnZS0xIChndWVzdCBQVCkgZW50cmllcy4gU28geW91IGhhdmUgdG8g
bnVrZSAKZXZlcnl0aGluZy4KCkJ1dCB0aGlzIGlzIGFscmVhZHkgZG9uZSBhcyBwYXJ0IG9mIHRo
ZSBQMk0gZmx1c2guIEkgYmVsaWV2ZSB0aGlzIHNob3VsZCAKYmUgdGhlIHNhbWUgb24geDg2LgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
