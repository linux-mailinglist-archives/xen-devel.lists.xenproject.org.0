Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B517BF8C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:50:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADJr-000609-Ra; Fri, 06 Mar 2020 13:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ezhn=4X=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jADJq-000602-4y
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:47:14 +0000
X-Inumbo-ID: fb8f2fb2-5fb0-11ea-90c4-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb8f2fb2-5fb0-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 13:47:13 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 143so2258574ljj.7
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H8u6YeWorsC0c2QvuyhCr2l62c2pY17WWSgySVyKuQY=;
 b=Jsp/aShHR7zN1S2V5xTWf25BjMWXwVrEJs98rFr/DUKXjcfrhKHeiNWI0GYZ+MhhO3
 afWAyJdi+L1fzsNl4IR2/EG1mw7v3aIobzfbv5VBhOD5Gz+S7ewLeob0V4tAWTiuiNNe
 aNjviEpTseF9R1o3LnqchQcNawQlvxiZ07tLMKjApQB3twaPwL+aHp/SY0YBQINZZzub
 D1fdyB796+H7HAKTkwk56EwRio62amn49AwSYMeE5jrv13H+MAC1lWD3ROT27Lb1mypc
 LQK5gkc2C0oqJbzX3paENUWrtcFkYO8GpI0lM1hQ4sjdtx0kPwYZXbdXLcvknX8LsvDN
 338g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H8u6YeWorsC0c2QvuyhCr2l62c2pY17WWSgySVyKuQY=;
 b=guWDIcoit9MXpUxcMaJXJ5pTyOL+z0ZQvNToBJ3mQhygyNlnXUoblrGaS1Vs9qQPvi
 5acOfphgRs4PSVxzkvmdkHGMJK/AEAH8z8mo4LNvtC64ACCwFvh+nX1HXWWEktNVODQs
 4zexmiSWt0NmBRswWkjMS15E6q7y3jmTCBivxlZfQT99oiI/i+HVf+ZOsBks8eqDro0V
 WR4s+T0vKAZ5b656eCwSIJQySk4WAq71bNcwB90LBtNUJIoRXOIziQRAyNc5KXC6Fgib
 mMt2B+8IWLJs6r7r+bOU4Eh5ASzaC1guTZWmtg/3uX15Ugw2y8ymOTCjf6xXtSOyZWz9
 ri5w==
X-Gm-Message-State: ANhLgQ1V1k0m6glhR6Sb52nvt6nCEdU4o82o0KWfwdulb9ziN2lrE2D9
 P7DM5JDcjqddqCHXx3TkCPIwLodBqN4ib7uJSnQ=
X-Google-Smtp-Source: ADFU+vsfEGPQ6J2KLxoM2KWb6fToCDlpEa9+5p4bSthSE0t62NKaIfOATrDMXpDVpUXsNuCoFofgQBSqSysAwSr6Yio=
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr1982872ljj.253.1583502432166; 
 Fri, 06 Mar 2020 05:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20200226152013.12200-1-jandryuk@gmail.com>
 <20200226152013.12200-2-jandryuk@gmail.com>
 <24150.37734.588539.567057@mariner.uk.xensource.com>
 <CAKf6xpu=X0a1-AsBJ=JwzBFo0evdk0JtQoAWXShkyatWy1BAOA@mail.gmail.com>
 <24161.20250.380522.853769@mariner.uk.xensource.com>
In-Reply-To: <24161.20250.380522.853769@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 6 Mar 2020 08:47:01 -0500
Message-ID: <CAKf6xptNYXyqteyM9fu1rk-Arw-_2Kh-8jR4hp1WhCf6xvSatw@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce
 cmp-fd-file-inode utility
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgNSwgMjAyMCBhdCAyOjEyIFBNIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToKPgo+IEphc29uIEFuZHJ5dWsgd3JpdGVzICgiUmU6IFtQQVRDSCAx
LzJdIHRvb2xzL2hlbHBlcnM6IEludHJvZHVjZSBjbXAtZmQtZmlsZS1pbm9kZSB1dGlsaXR5Iik6
Cj4gPiBJJ2QgYmUgaGFwcHkgdG8gdXNlIHN0YXQgaWYgaXQgd29ya3MuICBUaGUgY29tbWVudCBp
biBsb2NraW5nLnNoIGFib3ZlCj4gPiB0aGUgdXNhZ2UgaXM6Cj4gPiAgICAgICAgICMgV2UgY2Fu
J3QganVzdCBzdGF0IC9kZXYvc3RkaW4gb3IgL3Byb2Mvc2VsZi9mZC8kX2xvY2tmZCBvcgo+ID4g
ICAgICAgICAjIHVzZSBiYXNoJ3MgdGVzdCAtZWYgYmVjYXVzZSB0aG9zZSBhbGwgZ28gdGhyb3Vn
aCB3aGF0IGlzCj4gPiAgICAgICAgICMgYWN0dWFsbHkgYSBzeW50aGV0aWMgc3ltbGluayBpbiAv
cHJvYyBhbmQgd2UgYXJlbid0Cj4gPiAgICAgICAgICMgZ3VhcmFudGVlZCB0aGF0IG91ciBzdGF0
KDIpIHdvbid0IGxvc2UgdGhlIHJhY2Ugd2l0aCBhbgo+ID4gICAgICAgICAjIHJtKDEpIGJldHdl
ZW4gcmVhZGluZyB0aGUgc3ludGhldGljIGxpbmsgYW5kIHRyYXZlcnNpbmcgdGhlCj4gPiAgICAg
ICAgICMgZmlsZSBzeXN0ZW0gdG8gZmluZCB0aGUgaW51bS4gIFBlcmwgaXMgdmVyeSBmYXN0IHNv
IHVzZSB0aGF0Lgo+ID4KPiA+IC4uLndoaWNoIEkgdGhvdWdodCBydWxlZCBvdXQgc3RhdC4KPgo+
IFdlbGwgcmVhZC4KPgo+IEkgaGF2ZSBkb25lIHNvbWUgbW9yZSB0ZXN0aW5nIGFuZCBpbiBteSB0
ZXN0cyAob24gRGViaWFuIHN0cmV0Y2gpCj4gICAgIHN0YXQgLUwgLSA8c29tZS1maWxlCj4gZG9l
cyB0aGlzCj4gICAgIGZzdGF0NjQoMCwge3N0X21vZGU9U19JRlJFR3wwNjY0LCBzdF9zaXplPTEx
Nzg0NCwgLi4ufSkgPSAwCj4gKGFjY29yZGluZyB0byBzdHJhY2UpIHdoaWNoIGlzIHByZWNpc2Vs
eSB3aGF0IGlzIG5lZWRlZC4KPgo+IE9kZGx5LCBpdCBhbHNvIGRvZXMgdGhpcwo+ICAgICBmc3Rh
dDY0KDEsIHtzdF9tb2RlPVNfSUZDSFJ8MDYyMCwgc3RfcmRldj1tYWtlZGV2KDEzNiwgMTcxKSwg
Li4ufSkgPSAwCj4gYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBkbyBhbnl0aGluZyB3aXRoIHRoZSBy
ZXN1bHRzLCBzbyBJIHRoaW5rCj4gdGhhdCdzIGhhcm1sZXNzLgoKSSB0aGluayB0aGlzIHN0YXQg
aXMgZnJvbSBnbGliYyBiZWZvcmUgcHJpbnRpbmcuICBgc3RhdCBmaWxlIC1gCnJlLW9yZGVycyB0
aGUgZnN0YXQoMSkgYmVmb3JlIGZzdGF0KDApLgoKPiBJIHdyb3RlIHRoYXQgY29tbWVudCBpbiAy
MDEyLiAgUHJlc3VtYWJseSBgc3RhdCAtTCAtJyBoYXMgYXBwZWFyZWQgaW4KPiB0aGUgbWVhbnRp
bWUuCgpJIHBlYWtlZCBhdCBjb3JldXRpbHMgZ2l0LCBhbmQgLSB3YXMgYWRkZWQgaW4gMjAwOS4g
IEJ1dCBJIGhhZCBubyBpZGVhCm9mIHRoZSBtYWdpYyAnLScuICBUaGFuayB5b3UgZm9yIGZpbmRp
bmcgaXQuCgo+IFRoZSBzeW50aGV0aWMgc3ltbGluayBtYXkgYmUgYSByZWQgaGVycmluZyBhbnl3
YXk7IG5vd2FkYXlzIGF0IGxlYXN0LAo+IEkgYW0gdG9sZCBieSBzb21lb25lIHdobyByZWFkIHRo
ZSBMaW51eCBrZXJuZWwgc291cmNlIHRoYXQKPiAgIHRoZSBuYW1lIGNvbWVzIGZyb20gdGhlIGBy
ZWFkbGluaycgbWV0aG9kIG9uIHRoZSBsaW5rIGlub2RlLCBidXQgYQo+ICAgZGlmZmVyZW50IG1l
dGhvZCBlbnRpcmVseSAtLSBgZ2V0X2xpbmsnIC0tIGlzIHVzZWQgYnkgYG5hbWVpJyB0bwo+ICAg
YWN0dWFsbHkgcmVzb2x2ZSB0aGUgbGluayB0byBhIGRlc3RpbmF0aW9uIGlub2RlLgo+Cj4gQnV0
IHVzaW5nIGAtJyBpcyBjbGVhcmx5IGZpbmUsIGxpa2UgdGhpcyBJIHRoaW5rOgo+Cj4gbWFyaW5l
cjp+PiBzdGF0IC1jJUQuJWkgLUwgLSB0IDx0Cj4gZmUwNC44NDQzMDcKPiBmZTA0Ljg0NDMwNwo+
IG1hcmluZXI6fj4KPgo+IFNvcnJ5IHRvIG11ZGR5IHRoZSB3YXRlcnMuCgpUaGFua3MgYWdhaW4g
Zm9yIGZpbmRpbmcgdGhlIHNvbHV0aW9uLgoKUmVnYXJkcywKSmFzb24KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
