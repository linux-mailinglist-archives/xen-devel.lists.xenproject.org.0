Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F7D67A3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3SV-0005iM-Bm; Mon, 14 Oct 2019 16:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fCd=YH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iK3SU-0005iE-1t
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:44:34 +0000
X-Inumbo-ID: e5b77b84-eea1-11e9-9382-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5b77b84-eea1-11e9-9382-12813bfff9fa;
 Mon, 14 Oct 2019 16:44:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r17so413838wme.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 09:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kbUFQkg40dniCujdO09oY754oXa1YWJSfuMuL0Nigpk=;
 b=N2rfctptTcqooUYXOcwxRb5Vlsia+GNKEWjL5vgNMsksML2/GXhKBonKNhmyF4dYFo
 UD8rXZ9IFvOu+BC26iAE07PudsdWfpp6jSxFcyqkdu6R64fDA9+xNxr7mF0LEFTGFoMb
 /inEgE0VQ+lV6Yem3H4nodIP/L4RUJmmeNhow+hwkwOBEYVSmo/Gx55Kf5QpHhvC/hFN
 bE/I63tC1LkhynjKh67aLjez9mwH7nZjXb4wGYT+Vv1rwXFE0eztmXvXmzsA70uRXGm1
 +0Y06idMcCVE2qmyyr5cOMppEYdERYTNvMXnp5ZTxDTw7sjxjokQLA4mWBtvJk45UgDL
 wfSA==
X-Gm-Message-State: APjAAAVE7zAvfFkI9xU0p/j7uVQYyVDjonBn2oQmc3aSrBh9k4IFkS23
 WHvOZ0j4AK2x7++wMklgKIY=
X-Google-Smtp-Source: APXvYqzKuZ440zqkONBlYwq1/G1OCD5cByumbo8o7cuENCSCA4FJu8DJB0/R1wBVC6uq4u9a4zjJtg==
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr15992757wmk.126.1571071471821; 
 Mon, 14 Oct 2019 09:44:31 -0700 (PDT)
Received: from debian (162.148.159.143.dyn.plus.net. [143.159.148.162])
 by smtp.gmail.com with ESMTPSA id e3sm18389011wme.39.2019.10.14.09.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 09:44:31 -0700 (PDT)
Date: Mon, 14 Oct 2019 17:44:29 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191014164429.ltk64qeoo2ckzwet@debian>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
 <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
 <23972.40372.377662.700932@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23972.40372.377662.700932@mariner.uk.xensource.com>
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
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6MDk6MjRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbWEVOIFBBVENIIGZv
ci00LjEzIHYyIDkvOV0gbGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9n
aWMiKToKPiA+IE9uIEZyaSwgMTEgT2N0IDIwMTkgYXQgMTc6MzQsIElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSsO8cmdlbiBHcm/DnyB3cml0
ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA5LzldIGxpYnhsL3hs
OiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6Cj4gPiA+ID4gT24gMTEuMTAu
MTkgMTU6MzEsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiA+ID4gSSBkbyBub3QgaGF2ZSBhIHN0
cm9uZyBvcGluaW9uIGFib3V0IHRoaXMuICBJIHdvdWxkIGJlIGhhcHB5IHdpdGgKPiA+ID4gPiA+
ICJhdXRvIiAob3IgImRlZmF1bHQiIG1heWJlKS4KPiA+ID4gPgo+ID4gPiA+ICJ1bnNwZWNpZmll
ZCI/Cj4gPiA+Cj4gPiA+IFRoYXQgaXMgSU1PIHRoZSBiZXN0IHN1Z2dlc3Rpb24gc28gZmFyIHNv
IEkgd2lsbCBnbyB3aXRoIHRoYXQgaW4gbXkKPiA+ID4gdjMuCj4gPiAKPiA+IFNlZW1zIG9kZCB0
byBzcGVjaWZ5IGEgcGFyYW1ldGVyIHdpdGggYSB2YWx1ZSBvZiAndW5zcGVjaWZpZWQnIDstKQo+
IAo+IEkgaGF2ZSB0cmllZCB0byBpbmZlciArMS8tMS8wIG51bWJlcnMgZnJvbSB0aGUgbWFpbCB0
aHJlYWQuICBJIGhhdmUKPiBhbHNvIGxvb2tlZCBhdCBsaWJ4bF90eXBlcy5pZGwgdG8gc2VlIGhv
dyBtYW55IHRpbWVzIHdlIGFyZSB1c2luZwo+IHdoYXQgbmFtZSB0byByZXByZXNlbnQgcm91Z2hs
eSB0aGlzIGNvbmNlcHQ6Cj4gCj4gIEJpa2VzaGVkIGNvbG91ciAgUGF1bCBKdWVyZ2VuIEdlb3Jn
ZSBJYW4gQW50aG9ueSBXZWkgI2FscmVhZHkKPiAKPiAgdW5rbm93biAgICAgICAgICAgPyAgICAg
ID8gICAgIC0xICAgICsyICAgID8gICAgID8gICAgMTcKPiAgZGVmYXVsdCAgICAgICAgICAgPyAg
ICAgID8gICAgID8gICAgICAwICAgID8gICAgID8gICAgIDIKPiAgYXV0byAgICAgICAgICAgICAg
LTEgICAgID8gICAgICsxICAgICAwICAgID8gICAgID8gICAgIDEKPiAgdW5zcGVjaWZpZWQgICAg
ICAgLTEgICAgICsxICAgID8gICAgICAwICAgID8gICAgID8gICAgIDAKPiAKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl4KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsIG1haW50YWluZXJzCgorMSB0byAidW5r
bm93biIuIEkgcHJlZmVyIGNvbnNpc3RlbmN5LgoKMCB0byBhbGwgb3RoZXJzLgoKCj4gCj4gT24g
dGhpcyBiYXNpcyBJTU8gY2xlYXJseSB0aGlzIHNob3VsZCBnbyBiYWNrIHRvICJ1bmtub3duIi4K
PiBJIHdpbGwgZG8gdGhhdCBpbiBhIHJlc3BpbiAob3IgbWF5YmUgb24gY29tbWl0KSBidXQgcmln
aHQgbm93IEkgdGhpbmsKPiBJIGFtIHN0aWxsIGF3YWl0aW5nIGEgcmV2aWV3IGZvciB0aGlzIHBh
dGNoLgo+IAoKSSB0aGluayBhIHJlc3BpbiBpcyByZXF1aXJlZCAtLSBpbiBvbmUgb2YgdGhlIG1h
aWxzIHlvdXIgc2FpZCB5b3Ugd291bGQKbmVlZCB0byBwdXQgc29tZSBsb2dpYyBpbnRvIGFyY2gt
c3BlY2lmaWMgZnVuY3Rpb24uCgpXZWkuCgo+IFRoYW5rcywKPiBJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
