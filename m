Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4C12EA0C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:48:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in5Ta-0005w1-3n; Thu, 02 Jan 2020 18:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3gH+=2X=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1in5TY-0005vw-4u
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:45:40 +0000
X-Inumbo-ID: 11fd97c8-2d90-11ea-a3bb-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11fd97c8-2d90-11ea-a3bb-12813bfff9fa;
 Thu, 02 Jan 2020 18:45:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so27571035wru.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 10:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WCQqhYs0hCnYUvn6kPvU9UZHAREuI6o22WJSfEKtg6w=;
 b=C8PqHcs3Po9lj8tXcefksOgqNxnfpzinj+LQdSaLZ5qGFUp91GH5PmSP0VfRBWPm0p
 8eD1+hSoZk86Uk07tM8nEQ4e+pW6K9YyHGDGmQD0yqvG/4YOx7LUV/V0gwr5LPRf/wxT
 zNB26mg7EgoYSTk4N8hMW7N8865i++5oMa5joV9yVxNWiZL6l+FMTxowjzrb80XORDJg
 UvJ/o/OX4SQHs5e5bvKfbkYq+3xpQBHydYE87J0xchsqdMhXO6fvFHSjuRDVHQbusFHa
 +/daYymZGcbsnGHMHCnvEKJk/J/6RKKnKRFL8JMpwrg8g48T+a/jI0G75WzEy4GgmpIZ
 yGpg==
X-Gm-Message-State: APjAAAWBJMTjO4TtqcawSTnPgryaPLxOiZ9YlMzqgcmdtS+jU7ArRkbl
 sYBV95EkU1hi3GWxBcfIMeI=
X-Google-Smtp-Source: APXvYqxQHgfQJqYthmucHfNhXQMTO28ZAPaOs6X+e/3Gyvxjm+U/g85EN/GsfHjSzSnj1uQS0iarAA==
X-Received: by 2002:adf:ef03:: with SMTP id e3mr86640468wro.216.1577990738457; 
 Thu, 02 Jan 2020 10:45:38 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id o194sm9573613wme.45.2020.01.02.10.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 10:45:37 -0800 (PST)
Date: Thu, 2 Jan 2020 18:45:36 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200102184536.i25lgkjrps5nq3mh@debian>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <20200102165515.4brbqceseurokvp3@debian>
 <a5883bef-d760-5712-3f76-78e96a018a45@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5883bef-d760-5712-3f76-78e96a018a45@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDU6MjA6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMi8wMS8yMDIwIDE2OjU1LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVGh1LCBK
YW4gMDIsIDIwMjAgYXQgMDI6NTk6NTNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
PiBUaGUgam1wIGFmdGVyIHNldHRpbmcgJWNyMCBpcyByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93
aW5nIGxqbXAuCj4gPj4KPiA+PiBUaGUgQ1BVSUQgdG8gcHJvdGVjdCB0aGUganVtcCB0byBoaWdo
ZXIgbWFwcGluZ3Mgd2FzIGluc2VydGVkIGR1ZSB0byBhbgo+ID4+IGFidW5kYW5jZSBvZiBjYXV0
aW9uL3BhcmFub2lhIGJlZm9yZSBTcGVjdHJlIHdhcyBwdWJsaWMuICBUaGVyZSBpcyBub3QgYQo+
ID4+IG1hdGNoaW5nIHByb3RlY3Rpb24gaW4gdGhlIFMzIHJlc3VtZSBwYXRoLCBhbmQgdGhlcmUg
aXMgbm90aGluZwo+ID4+IGludGVyZXN0aW5nIGluIG1lbW9yeSBhdCB0aGlzIHBvaW50Lgo+ID4g
V2hhdCBkbyB5b3UgbWVhbiBieSAidGhlcmUgaXMgbm90aGluZyBpbnRlcmVzdGluZyBpbiBtZW1v
cnkiIGhlcmU/Cj4gPgo+ID4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgaWRlbCBwYWdlIHRhYmxlIGhh
cyBiZWVuIGxvYWRlZC4gIER1cmluZyBBUAo+ID4gYnJpbmctdXAgaXQgY29udGFpbnMgcnVudGlt
ZSBkYXRhLCBubz8KPiAKPiBXZSBoYXZlbid0IGV2ZW4gZGVjb21wcmVzc2VkIHRoZSBkb20wIGtl
cm5lbCBhdCB0aGlzIHBvaW50LsKgIFdoYXQgZGF0YQo+IGFyZSB5b3UgY29uY2VybmVkIGJ5PwoK
QXMgdGhlIG9yaWdpbmFsIHRleHQgaW1wbGllZCwgQ1BVIGhvdHBsdWcgc2hvdWxkIGFsc28gYmUg
Y29uc2lkZXJlZC4KCklmIHRoYXQncyBub3QgcmVsZXZhbnQgbm93LCBjYW4geW91IHBsZWFzZSBu
b3RlIHRoYXQgaW4gdGhlIGNvbW1pdAptZXNzYWdlPwoKV2VpLgoKPiAKPiBUaGlzIHByb3RlY3Rp
b24gaXMgb25seSBtZWFuaW5nZnVsIGZvciB2aXJ0dWFsaXNlZCBndWVzdHMsIGFuZCBpcwo+IHVs
dGltYXRlbHkgaW5jb21wbGV0ZS7CoCBJZiBhbm90aGVyIFZNIGNhbiB1c2UgU3BlY3RyZSB2MiBh
Z2FpbnN0IHRoaXMKPiBWTSwgaXQgY2FuIGFsc28gdXNlIFNwZWN0cmUgdjEgYW5kIGhhdmUgYSBm
YXIgbW9yZSBpbnRlcmVzdGluZyB0aW1lLgo+IAo+IEluIHRoZSB0aW1lIHNpbmNlIHdyaXRpbmcg
dGhpcyBjb2RlLCBpdCBoYXMgYmVjb21lIHN1YnN0YW50aWFsbHkgbW9yZQo+IGFwcGFyZW50IHRo
YXQgVk1zIG11c3QgdHJ1c3QgdGhlaXIgaHlwZXJ2aXNvciB0byBwcm92aWRlIGFkZXF1YXRlCj4g
aXNvbGF0aW9uLCBiZWNhdXNlIHRoZXJlIGlzIGxpdGVyYWxseSBub3RoaW5nIHRoZSBWTSBjYW4g
ZG8gaXRzZWxmLgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
