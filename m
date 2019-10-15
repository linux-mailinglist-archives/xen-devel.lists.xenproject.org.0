Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17FD74B8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 13:16:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKKlk-0001MX-7i; Tue, 15 Oct 2019 11:13:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HWPQ=YI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iKKlj-0001MS-Gc
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 11:13:35 +0000
X-Inumbo-ID: d3c54618-ef3c-11e9-9393-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3c54618-ef3c-11e9-9393-12813bfff9fa;
 Tue, 15 Oct 2019 11:13:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o18so23288591wrv.13
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 04:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LCuEXKPBXh8fIK+J4Hhe3xojxl8ZtNVcmlsFBBPY9XM=;
 b=NS6Rvq1hFZ+qRZUoFw2cSPAlza4n61DkHmi/0FxFHs5vIWIJU3G7YreSjyhSAuHNMq
 UVdfP2E6sFxb007f7bPRJgkfJXQdEBhmjSYbVFaJn74VT6Fwxcsf09tTqKw1Z6akcFFZ
 cjY8iEt4dBTrGXgdHzqgCzvhvNTzyLih+i0JQnXtfuo6Jw+XQZwESFRkWSWq0C0dtIiK
 ydb7A7DeUtU13RiGq+i+7WsGR+OOW2bC6KGRxuGbc+1hWd4rSo+T//lK0610/PSNsAv8
 qiZ21T74fYUGh0KOg3wD+C7u3DH4gC1zIEQSqBA7a7sqWa9f+tvRNrfF66lwozSDkt1u
 eZcw==
X-Gm-Message-State: APjAAAUsuqQpRdyruZLdeFGdXo5C12DgjII7u9ZdsbIig/xzdVtjprQX
 07HFk7+DL3e7eZ0PgytbJik=
X-Google-Smtp-Source: APXvYqyvcndhFkfKWLsdXqKy9t2S08dyInmVfN5BYSHfG4T6N6taPbVWZHsh74G6oRndr7FCjtb70A==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr660583wrr.220.1571138013818; 
 Tue, 15 Oct 2019 04:13:33 -0700 (PDT)
Received: from debian (162.148.159.143.dyn.plus.net. [143.159.148.162])
 by smtp.gmail.com with ESMTPSA id r3sm11661745wre.29.2019.10.15.04.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 04:13:33 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:13:31 +0100
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20191015111331.4q4srudlr7v4r4yv@debian>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
 <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
 <23972.40372.377662.700932@mariner.uk.xensource.com>
 <20191014165926.GB1138@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014165926.GB1138@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6NTk6MjZQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6MDk6MjRQTSArMDEwMCwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBQYXVsIER1cnJhbnQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtY
RU4gUEFUQ0ggZm9yLTQuMTMgdjIgOS85XSBsaWJ4bC94bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2gg
c2V0dGluZyBsb2dpYyIpOgo+ID4gPiBPbiBGcmksIDExIE9jdCAyMDE5IGF0IDE3OjM0LCBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBK
w7xyZ2VuIEdyb8OfIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbWEVOIFBBVENIIGZvci00LjEz
IHYyIDkvOV0gbGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9naWMiKToK
PiA+ID4gPiA+IE9uIDExLjEwLjE5IDE1OjMxLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ID4gPiA+
ID4gSSBkbyBub3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGFib3V0IHRoaXMuICBJIHdvdWxkIGJl
IGhhcHB5IHdpdGgKPiA+ID4gPiA+ID4gImF1dG8iIChvciAiZGVmYXVsdCIgbWF5YmUpLgo+ID4g
PiA+ID4KPiA+ID4gPiA+ICJ1bnNwZWNpZmllZCI/Cj4gPiA+ID4KPiA+ID4gPiBUaGF0IGlzIElN
TyB0aGUgYmVzdCBzdWdnZXN0aW9uIHNvIGZhciBzbyBJIHdpbGwgZ28gd2l0aCB0aGF0IGluIG15
Cj4gPiA+ID4gdjMuCj4gPiA+IAo+ID4gPiBTZWVtcyBvZGQgdG8gc3BlY2lmeSBhIHBhcmFtZXRl
ciB3aXRoIGEgdmFsdWUgb2YgJ3Vuc3BlY2lmaWVkJyA7LSkKPiA+IAo+ID4gSSBoYXZlIHRyaWVk
IHRvIGluZmVyICsxLy0xLzAgbnVtYmVycyBmcm9tIHRoZSBtYWlsIHRocmVhZC4gIEkgaGF2ZQo+
ID4gYWxzbyBsb29rZWQgYXQgbGlieGxfdHlwZXMuaWRsIHRvIHNlZSBob3cgbWFueSB0aW1lcyB3
ZSBhcmUgdXNpbmcKPiA+IHdoYXQgbmFtZSB0byByZXByZXNlbnQgcm91Z2hseSB0aGlzIGNvbmNl
cHQ6Cj4gPiAKPiA+ICBCaWtlc2hlZCBjb2xvdXIgIFBhdWwgSnVlcmdlbiBHZW9yZ2UgSWFuIEFu
dGhvbnkgV2VpICNhbHJlYWR5Cj4gPiAKPiA+ICB1bmtub3duICAgICAgICAgICA/ICAgICAgPyAg
ICAgLTEgICAgKzIgICAgPyAgICAgPyAgICAxNwo+ID4gIGRlZmF1bHQgICAgICAgICAgID8gICAg
ICA/ICAgICA/ICAgICAgMCAgICA/ICAgICA/ICAgICAyCj4gPiAgYXV0byAgICAgICAgICAgICAg
LTEgICAgID8gICAgICsxICAgICAwICAgID8gICAgID8gICAgIDEKPiA+ICB1bnNwZWNpZmllZCAg
ICAgICAtMSAgICAgKzEgICAgPyAgICAgIDAgICAgPyAgICAgPyAgICAgMAo+ID4gCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl4KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGwgbWFpbnRhaW5lcnMKPiAK
PiBNYXliZSAidW5rbm93biIgaXMgbW9yZSB1c2VkIGluIHRoZSBBUEksIGJ1dCB3aGVuIEkgbG9v
ayBhdCB0aGUgbWFucGFnZQo+ICJ1bmtub3duIiB2YWx1ZSBhcyBuZXZlciBiZWVuIHVzZWQgYmVm
b3JlLiBPbiB0aGUgb3RoZXIgaGFuZCAiZGVmYXVsdCIKPiBhcyBiZWVuIHVzZWQgdHdpY2UgaW4g
dGhlIG1hbiBwYWdlLiAoYW5kIG9uZSAiZGVmYXVsdHMiIGFuZCB0d28gb3RoZXIKPiAiZGVmYXVs
dCIgdGhhdCBJJ20gbm90IHN1cmUgaWYgdGhleSBjYW4gYmUgaW4gdGhlIGNvbmZpZyBmaWxlLikK
PiAKPiBTbyBJIHdvdWxkIHNheSArMiBmb3IgZGVmYXVsdCBhbmQgKzEgZm9yIHVua25vd24uCgpF
aXRoZXIgaXMgZmluZSBhcyBsb25nIGFzIGl0IGlzIGNsZWFybHkgZG9jdW1lbnRlZC4gSWYgeW91
IGZlZWwgc3Ryb25nbHkKYWJvdXQgImRlZmF1bHQiLCBzbyBiZSBpdC4gOi0pCgpXZWkuCgo+IAo+
IC0tIAo+IEFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
