Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A37188A5E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 17:35:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEF8Q-0001Ei-IU; Tue, 17 Mar 2020 16:32:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wpLQ=5C=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jEF8O-0001Ed-VM
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 16:32:05 +0000
X-Inumbo-ID: d57c07b8-686c-11ea-bec1-bc764e2007e4
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d57c07b8-686c-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 16:32:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id n20so14396776lfl.10
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SPAlJUxglHIZBja/sYpA5eWxXvWH5N6ASfvBfFhYTi0=;
 b=TRIcq43lL2Nm4vTuoGbvlXqe0aeNzmpkG5/hDYe6p35XU2ooyIk/OSW8FdE/5nO4bz
 qrMmeYY9d3OoFVnQLq4Xjs9GE+hIBYErft0m5VAX2YVS68Kr7ZW0iT6L3gS1nTpvPbsb
 UXSfqIDT+nQaI8I87bU+mDCjv29SY3Vc/9s5SYkImXKvgI2mgkXRaVw0IxmXqsUT1isJ
 G8/t96B7fi82qJ2eSyAB8qiuUiuXa+Ong2r04UpH+bqa5AMWpKJZj0/0R1YXJnObq+84
 XGBRNM/vwbEIMJFKTPCrnr6x8VB5wguBtVrBRBlXqXHVY6PtbIRiKUjuJWp/+EGHKwNL
 mJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPAlJUxglHIZBja/sYpA5eWxXvWH5N6ASfvBfFhYTi0=;
 b=FOEi0cSe/9gVoYfsvZcnt9czKTjbgiEYBRnvnBITMSMqmx72GWVLH7+EUPU0v6Bnn9
 /X8LNTaoPMXnqurtzVWab9J5gBaKclYmhUoAGQgfnbH/g4puto8HL0WhfxUFAs2NcGWw
 nFi2otctRAiuFtpfp4DGcpXDUzGzNEmuduFyJXc9I0uydM+HfK4Cfbo2FyRztC3yK4h2
 bc0LO2bMmFafWBjv0DWqoRHKskUTvbxwbAAwSQmsbZ4/ZJYMPLCMocRRLm9hwib17BNf
 cVndLTppF3EDb0xbFVrWsMo3JKsmCG24z28IMpOJfota/IAbzbwyDcRGWKhifDEaKp8Y
 kE8A==
X-Gm-Message-State: ANhLgQ0MEG3AHnJmto/OPnh3gVXx/7DObTV//vw0JyaKdMQ3BqEUjzLB
 EffXao5nO9DRqtwq5sU8GBltOMblha2wS4a65Lg=
X-Google-Smtp-Source: ADFU+vvpQmWwjTr8A2VU1GA0b/tf1vfN1HO/wkaVAOfZwnXkwZwl6H8+lpcDXZi86/SoX/jOoIZzNOJe+g+AM+evnKk=
X-Received: by 2002:a19:c64f:: with SMTP id w76mr125594lff.44.1584462722694;
 Tue, 17 Mar 2020 09:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <cfbb5553-b9dc-ee86-145f-3cab92289c4d@suse.com>
 <20200317152310.114567-1-jandryuk@gmail.com>
In-Reply-To: <20200317152310.114567-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 17 Mar 2020 12:31:51 -0400
Message-ID: <CAKf6xpv+wBRG-5ML-24O08gbs+hMFgyJKttV7KK7cx8i3smECw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMTE6MjMgQU0gSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIDE3LjAzLjIwMjAgMTU6MDgsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID5PbiAxNy4wMy4yMDIwIDE1OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiBPbiAx
Ny4wMy4yMDIwIDE0OjQ4LCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+ID4+PiBJIGdvdCBpdCB0byBi
b290IHBhc3QgIklPLUFQSUMgKyB0aW1lciBkb2Vzbid0IHdvcmsiLiAgSSBwcm9ncmFtbWVkCj4g
Pj4+IHRoZSBIUEVUIHRvIHByb3ZpZGUgYSBwZXJpb2RpYyB0aW1lciBpbiBocGV0X3Jlc3VtZSgp
IG9uIFQwLiAgV2hlbiBJCj4gPj4+IGFjdHVhbGx5IGdvdCBpdCBwcm9ncmFtbWVkIHByb3Blcmx5
LCBpdCB3b3JrZWQgdG8gaW5jcmVtZW50Cj4gPj4+IHBpdDBfdGlja3MuICBJIGFsc28gbWFkZSB0
aW1lcl9pbnRlcnJ1cHQoKSB1bmNvbmRpdGlvbmFsbHkKPiA+Pj4gcGl0MF90aWNrcysrIHRob3Vn
aCB0aGF0IG1heSBub3QgbWF0dGVyLgo+ID4+Cj4gPj4gSG1tLCBhdCB0aGUgZmlyc3QgZ2xhbmNl
IEkgd291bGQgaW1wbHkgdGhlIHN5c3RlbSBnZXRzIGhhbmRlZCB0byBYZW4KPiA+PiB3aXRoIGEg
SFBFVCBzdGF0ZSB0aGF0IHdlIGRvbid0IChhbmQgcHJvYmFibHkgYWxzbyBzaG91bGRuJ3QpIGV4
cGVjdC4KPiA+PiBDb3VsZCB5b3UgcHJvdmlkZSBIUEVUX0NGRyBhcyB3ZWxsIGFzIGFsbCBIUEVU
X1RuX0NGRyBhbmQKPiA+PiBIUEVUX1RuX1JPVVRFIHZhbHVlcyBhcyBocGV0X3Jlc3VtZSgpIGZp
bmRzIHRoZW0gYmVmb3JlIGRvaW5nIGFueQo+ID4+IGFkanVzdG1lbnRzIHRvIHRoZW0/IFdoYXQg
YXJlIHRoZSBjb21wb25lbnRzIC8gcGFydGllcyBpbnZvbHZlZCBpbgo+ID4+IGdldHRpbmcgWGVu
IGxvYWRlZCBhbmQgc3RhcnRlZD8KCkkgZm9yZ290IHRvIG1lbnRpb24gdGhlIGJvb3Qgc2VxdWVu
Y2U6CkVGSSAtPiBncnViMi1lZmkgLT4geGVuLmd6CmdydWIyIGlzIHVzaW5nIG11bHRpYm9vdDIg
JiBtb2R1bGUyIGNvbW1hbmRzLgoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLgoKUmVnYXJkcywK
SmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
