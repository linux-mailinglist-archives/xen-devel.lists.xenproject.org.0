Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292311CEA2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 14:44:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifOgj-0005Hp-5c; Thu, 12 Dec 2019 13:39:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5AzP=2C=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ifOgh-0005Hk-BH
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 13:39:27 +0000
X-Inumbo-ID: d014bfe6-1ce4-11ea-a1e1-bc764e2007e4
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d014bfe6-1ce4-11ea-a1e1-bc764e2007e4;
 Thu, 12 Dec 2019 13:39:26 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x13so608502plr.9
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
 :content-transfer-encoding;
 bh=QNw0wSWDYS412iIOnCOz7lWytbJcyDm/vPYrMQVOY+A=;
 b=FnyQZB7UWH46xGYqGMV5DUcLuL6Ol1mWnsGPDy25hN5Mri4MN/ra4/9CWOVb8JXBpI
 etGFS/zfKLK68ZdLPGm/tvIjF3d8jwcd37wvdFxvp/lQ26RmjhDPgVEcCa1Wflel9t8l
 5Opyw3U0AwWA+n1+wmYfwei13rzoPugI+Qvuj3ocQC/NIfC3B815a2F56diUdOVfSVfM
 NzP54NetrBeBLCtq9PpJhYfZhKsWuxrrsxvoLfSUe94Y2T19JofEuq3ICq+9eXzUDgt3
 i1SJ6s06COLOR1uZCjq949tGhC2LMq2blK9OpJt5SCux0YvGDc+0KOGSqeg7DNZFmIZw
 7wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=QNw0wSWDYS412iIOnCOz7lWytbJcyDm/vPYrMQVOY+A=;
 b=r0I/Zx/P6waPcI6iYLws5ejEQ0ZD1yQrHlPlOlJV43bRxJOIDE/xGNkGl1NzBBM1dj
 M3BUDQBvk2VhddLK7IxOOLTqBqpFDSrETxRzxHfKraa+bJPfAHr8bdOvqHX40VGy8lnz
 vstsN7QdFLECXprkZ/mHdoN9KrBGXDTwLJeVDuI/OufdN5fBYs19cwnmhdQxgFUENJ7C
 V+RA/bhV3q5cqsrZm889CVHcBPbhHQ3eGdffPfawrnjBh0Wf+YiGvuA23iFhg/+YzkrW
 tPdFyPFUFXbZNw1EHv5xYjZ3LFdxrrUy8uMS1dZKrQIPSvoRqC7JmvXFY0T6gldGqxZY
 LfjQ==
X-Gm-Message-State: APjAAAWawn73pjZLCpPIRIvnrX2kBx4zvzjMaVJI7hMVD4UfC4qL153l
 0DSWW98iwATtJteawR18WTk=
X-Google-Smtp-Source: APXvYqy82OmHGVipwaG188UZTJQex0ku+UVSDGWNX0YY52TMxE6wMI4E5e0QBWEx9qFc9D4D4yU8fg==
X-Received: by 2002:a17:90a:808c:: with SMTP id
 c12mr9689023pjn.105.1576157964900; 
 Thu, 12 Dec 2019 05:39:24 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id m3sm6883598pgp.32.2019.12.12.05.39.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Dec 2019 05:39:24 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Date: Thu, 12 Dec 2019 14:39:05 +0100
Message-Id: <20191212133905.462-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
In-Reply-To: <20191212114247.GB11756@Air-de-Roger>
Subject: Re: [Xen-devel] [PATCH v7 2/3] xen/blkback: Squeeze page pools if a
 memory pressure is detected
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMiBEZWMgMjAxOSAxMjo0Mjo0NyArMDEwMCAiUm9nZXIgUGF1IE1vbm7DqSIgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKCj4gCj4gUGxlYXNlIG1ha2Ugc3VyZSB5b3UgQ2Mg
bWUgaW4gYmxrYmFjayByZWxhdGVkIHBhdGNoZXMuCgpTb3JyeSBmb3IgZm9yZ290dGluZyB5b3Uh
ICBJIHdpbGwgbmV2ZXIgZm9yZ2V0IGFnYWluLgoKPiAKPiBPbiBXZWQsIERlYyAxMSwgMjAxOSBh
dCAwNjoxMDoxNVBNICswMDAwLCBTZW9uZ0phZSBQYXJrIHdyb3RlOgo+ID4gRWFjaCBgYmxraWZg
IGhhcyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcuICBUaGUgc2l6ZSBv
Zgo+ID4gdGhlIHBvb2wgc3RhcnRzIGZyb20gemVybyBhbmQgYmUgaW5jcmVhc2VkIG9uIGRlbWFu
ZCB3aGlsZSBwcm9jZXNzaW5nCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGlz
Cj4gPiB0aGUgSS9PIHJlcXVlc3RzLiAgSWYgY3VycmVudCBJL08gcmVxdWVzdHMgaGFuZGxpbmcg
aXMgZmluaXNoZWQgb3IgMTAwCj4gPiBtaWxsaXNlY29uZHMgaGFzIHBhc3NlZCBzaW5jZSBsYXN0
IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZAo+ID4gc2hyaW5rcyB0aGUgcG9v
bCB0byBub3QgZXhjZWVkIHRoZSBzaXplIGxpbWl0LCBgbWF4X2J1ZmZlcl9wYWdlc2AuCj4gPiAK
PiA+IFRoZXJlZm9yZSwgaG9zdCBhZG1pbmlzdHJhdG9ycyBjYW4gY2F1c2UgbWVtb3J5IHByZXNz
dXJlIGluIGJsa2JhY2sgYnkKPiA+IGF0dGFjaGluZyBhIGxhcmdlIG51bWJlciBvZiBibG9jayBk
ZXZpY2VzIGFuZCBpbmR1Y2luZyBJL08uICBTdWNoCj4gPiBwcm9ibGVtYXRpYyBzaXR1YXRpb25z
IGNhbiBiZSBhdm9pZGVkIGJ5IGxpbWl0aW5nIHRoZSBtYXhpbXVtIG51bWJlciBvZgo+ID4gZGV2
aWNlcyB0aGF0IGNhbiBiZSBhdHRhY2hlZCwgYnV0IGZpbmRpbmcgdGhlIG9wdGltYWwgbGltaXQg
aXMgbm90IHNvCj4gPiBlYXN5LiAgSW1wcm9wZXIgc2V0IG9mIHRoZSBsaW1pdCBjYW4gcmVzdWx0
cyBpbiB0aGUgbWVtb3J5IHByZXNzdXJlIG9yIGEKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4gcy90aGUvLwo+ID4gcmVzb3VyY2UgdW5kZXJ1dGls
aXphdGlvbi4gIFRoaXMgY29tbWl0IGF2b2lkcyBzdWNoIHByb2JsZW1hdGljCj4gPiBzaXR1YXRp
b25zIGJ5IHNxdWVlemluZyB0aGUgcG9vbHMgKHJldHVybnMgZXZlcnkgZnJlZSBwYWdlIGluIHRo
ZSBwb29sCj4gPiB0byB0aGUgc3lzdGVtKSBmb3IgYSB3aGlsZSAodXNlcnMgY2FuIHNldCB0aGlz
IGR1cmF0aW9uIHZpYSBhIG1vZHVsZQo+ID4gcGFyYW1ldGVyKSBpZiBhIG1lbW9yeSBwcmVzc3Vy
ZSBpcyBkZXRlY3RlZC4KPiAgICAgICAgICAgICAgICAgXiBzL2EvLwo+ID4gCj4gPiBEaXNjdXNz
aW9ucwo+ID4gPT09PT09PT09PT0KPiA+IAo+ID4gVGhlIGBibGtiYWNrYCdzIG9yaWdpbmFsIHNo
cmlua2luZyBtZWNoYW5pc20gcmV0dXJucyBvbmx5IHBhZ2VzIGluIHRoZQo+ID4gcG9vbCwgd2hp
Y2ggYXJlIG5vdCBjdXJyZW50bHkgYmUgdXNlZCBieSBgYmxrYmFja2AsIHRvIHRoZSBzeXN0ZW0u
ICBJbgo+IAo+IEkgdGhpbmsgeW91IGNhbiByZW1vdmUgYm90aCBjb21hcyBpbiB0aGUgYWJvdmUg
c2VudGVuY2UuCj4gCj4gPiBvdGhlciB3b3JkcywgdGhlIHBhZ2VzIHRoYXQgYXJlIG5vdCBtYXBw
ZWQgd2l0aCBncmFudGVkIHBhZ2VzLiAgQmVjYXVzZQo+ID4gdGhpcyBjb21taXQgaXMgY2hhbmdp
bmcgb25seSB0aGUgc2hyaW5rIGxpbWl0IGJ1dCBzdGlsbCB1c2VzIHRoZSBzYW1lCj4gPiBmcmVl
aW5nIG1lY2hhbmlzbSBpdCBkb2VzIG5vdCB0b3VjaCBwYWdlcyB3aGljaCBhcmUgY3VycmVudGx5
IG1hcHBpbmcKPiA+IGdyYW50cy4KPiA+IAo+ID4gT25jZSBhIG1lbW9yeSBwcmVzc3VyZSBpcyBk
ZXRlY3RlZCwgdGhpcyBjb21taXQga2VlcHMgdGhlIHNxdWVlemluZwo+ICAgICAgICBeIHMvYS8v
CgpUaGFuayB5b3UgZm9yIGNvcnJlY3Rpb25zLCB3aWxsIGFwcGx5IQoKPiA+IGxpbWl0IGZvciBh
IHVzZXItc3BlY2lmaWVkIHRpbWUgZHVyYXRpb24uICBUaGUgZHVyYXRpb24gc2hvdWxkIGJlCj4g
PiBuZWl0aGVyIHRvbyBsb25nIG5vciB0b28gc2hvcnQuICBJZiBpdCBpcyB0b28gbG9uZywgdGhl
IHNxdWVlemluZwo+ID4gaW5jdXJyaW5nIG92ZXJoZWFkIGNhbiByZWR1Y2UgdGhlIEkvTyBwZXJm
b3JtYW5jZS4gIElmIGl0IGlzIHRvbyBzaG9ydCwKPiA+IGBibGtiYWNrYCB3aWxsIG5vdCBmcmVl
IGVub3VnaCBwYWdlcyB0byByZWR1Y2UgdGhlIG1lbW9yeSBwcmVzc3VyZS4KPiA+IFRoaXMgY29t
bWl0IHNldHMgdGhlIHZhbHVlIGFzIGAxMCBtaWxsaXNlY29uZHNgIGJ5IGRlZmF1bHQgYmVjYXVz
ZSBpdCBpcwo+ID4gYSBzaG9ydCB0aW1lIGluIHRlcm1zIG9mIEkvTyB3aGlsZSBpdCBpcyBhIGxv
bmcgdGltZSBpbiB0ZXJtcyBvZiBtZW1vcnkKPiA+IG9wZXJhdGlvbnMuICBBbHNvLCBhcyB0aGUg
b3JpZ2luYWwgc2hyaW5raW5nIG1lY2hhbmlzbSB3b3JrcyBmb3IgYXQKPiA+IGxlYXN0IGV2ZXJ5
IDEwMCBtaWxsaXNlY29uZHMsIHRoaXMgY291bGQgYmUgYSBzb21ld2hhdCByZWFzb25hYmxlCj4g
PiBjaG9pY2UuICBJIGFsc28gdGVzdGVkIG90aGVyIGR1cmF0aW9ucyAocmVmZXIgdG8gdGhlIGJl
bG93IHNlY3Rpb24gZm9yCj4gPiBtb3JlIGRldGFpbHMpIGFuZCBjb25maXJtZWQgdGhhdCAxMCBt
aWxsaXNlY29uZHMgaXMgdGhlIG9uZSB0aGF0IHdvcmtzCj4gPiBiZXN0IHdpdGggdGhlIHRlc3Qu
ICBUaGF0IHNhaWQsIHRoZSBwcm9wZXIgZHVyYXRpb24gZGVwZW5kcyBvbiBhY3R1YWwKPiA+IGNv
bmZpZ3VyYXRpb25zIGFuZCB3b3JrbG9hZHMuICBUaGF0J3Mgd2h5IHRoaXMgY29tbWl0IGFsbG93
cyB1c2VycyB0bwo+ID4gc2V0IHRoZSBkdXJhdGlvbiBhcyBhIG1vZHVsZSBwYXJhbWV0ZXIuCj4g
PiAKPiA+IE1lbW9yeSBQcmVzc3VyZSBUZXN0Cj4gPiA9PT09PT09PT09PT09PT09PT09PQo+ID4g
Cj4gPiBUbyBzaG93IGhvdyB0aGlzIGNvbW1pdCBmaXhlcyB0aGUgbWVtb3J5IHByZXNzdXJlIHNp
dHVhdGlvbiB3ZWxsLCBJCj4gPiBjb25maWd1cmVkIGEgdGVzdCBlbnZpcm9ubWVudCBvbiBhIHhl
bi1ydW5uaW5nIHZpcnR1YWxpemF0aW9uIHN5c3RlbS4KPiA+IE9uIHRoZSBgYmxrZnJvbnRgIHJ1
bm5pbmcgZ3Vlc3QgaW5zdGFuY2VzLCBJIGF0dGFjaCBhIGxhcmdlIG51bWJlciBvZgo+ID4gbmV0
d29yay1iYWNrZWQgdm9sdW1lIGRldmljZXMgYW5kIGluZHVjZSBJL08gdG8gdGhvc2UuICBNZWFu
d2hpbGUsIEkKPiA+IG1lYXN1cmUgdGhlIG51bWJlciBvZiBwYWdlcyB0aGF0IHN3YXBwZWQgaW4g
KHBzd3BpbikgYW5kIG91dCAocHN3cG91dCkKPiA+IG9uIHRoZSBgYmxrYmFja2AgcnVubmluZyBn
dWVzdC4gIFRoZSB0ZXN0IHJhbiB0d2ljZSwgb25jZSBmb3IgdGhlCj4gPiBgYmxrYmFja2AgYmVm
b3JlIHRoaXMgY29tbWl0IGFuZCBvbmNlIGZvciB0aGF0IGFmdGVyIHRoaXMgY29tbWl0LiAgQXMK
PiA+IHNob3duIGJlbG93LCB0aGlzIGNvbW1pdCBoYXMgZHJhbWF0aWNhbGx5IHJlZHVjZWQgdGhl
IG1lbW9yeSBwcmVzc3VyZToKPiA+IAo+ID4gICAgICAgICAgICAgICAgIHBzd3BpbiAgcHN3cG91
dAo+ID4gICAgIGJlZm9yZSAgICAgIDc2LDY3MiAgMTg1LDc5OQo+ID4gICAgIGFmdGVyICAgICAg
ICAgIDIxMiAgICAzLDMyNQo+ID4gCj4gPiBPcHRpbWFsIEFnZ3Jlc3NpdmUgU2hyaW5raW5nIER1
cmF0aW9uCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAKPiA+
IFRvIGZpbmQgYSBiZXN0IHNxdWVlemluZyBkdXJhdGlvbiwgSSByZXBlYXRlZCB0aGUgdGVzdCB3
aXRoIHRocmVlCj4gPiBkaWZmZXJlbnQgZHVyYXRpb25zICgxbXMsIDEwbXMsIGFuZCAxMDBtcyku
ICBUaGUgcmVzdWx0cyBhcmUgYXMgYmVsb3c6Cj4gPiAKPiA+ICAgICBkdXJhdGlvbiAgICBwc3dw
aW4gIHBzd3BvdXQKPiA+ICAgICAxICAgICAgICAgICA4NTIgICAgIDYsNDI0Cj4gPiAgICAgMTAg
ICAgICAgICAgMjEyICAgICAzLDMyNQo+ID4gICAgIDEwMCAgICAgICAgIDIwMyAgICAgMywzNDAK
PiA+IAo+ID4gQXMgZXhwZWN0ZWQsIHRoZSBtZW1vcnkgcHJlc3N1cmUgaGFzIGRlY3JlYXNlZCBh
cyB0aGUgZHVyYXRpb24gaXMKPiA+IGluY3JlYXNlZCwgYnV0IHRoZSByZWR1Y3Rpb24gc3RvcHBl
ZCBmcm9tIHRoZSBgMTBtc2AuICBCYXNlZCBvbiB0aGlzCj4gPiByZXN1bHRzLCBJIGNob3NlIHRo
ZSBkZWZhdWx0IGR1cmF0aW9uIGFzIDEwbXMuCj4gPiAKPiA+IFBlcmZvcm1hbmNlIE92ZXJoZWFk
IFRlc3QKPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+IAo+ID4gVGhpcyBjb21taXQg
Y291bGQgaW5jdXIgSS9PIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIHVuZGVyIHNldmVyZSBtZW1v
cnkKPiA+IHByZXNzdXJlIGJlY2F1c2UgdGhlIHNxdWVlemluZyB3aWxsIHJlcXVpcmUgbW9yZSBw
YWdlIGFsbG9jYXRpb25zIHBlcgo+ID4gSS9PLiAgVG8gc2hvdyB0aGUgb3ZlcmhlYWQsIEkgYXJ0
aWZpY2lhbGx5IG1hZGUgYSB3b3JzdC1jYXNlIHNxdWVlemluZwo+ID4gc2l0dWF0aW9uIGFuZCBt
ZWFzdXJlZCB0aGUgSS9PIHBlcmZvcm1hbmNlIG9mIGEgYGJsa2Zyb250YCBydW5uaW5nCj4gPiBn
dWVzdC4KPiA+IAo+ID4gRm9yIHRoZSBhcnRpZmljaWFsIHNxdWVlemluZywgSSBzZXQgdGhlIGBi
bGtiYWNrLm1heF9idWZmZXJfcGFnZXNgIHVzaW5nCj4gPiB0aGUgYC9zeXMvbW9kdWxlL3hlbl9i
bGtiYWNrL3BhcmFtZXRlcnMvbWF4X2J1ZmZlcl9wYWdlc2AgZmlsZS4gIEluIHRoaXMKPiA+IHRl
c3QsIEkgc2V0IHRoZSB2YWx1ZSB0byBgMTAyNGAgYW5kIGAwYC4gIFRoZSBgMTAyNGAgaXMgdGhl
IGRlZmF1bHQKPiA+IHZhbHVlLiAgU2V0dGluZyB0aGUgdmFsdWUgYXMgYDBgIGlzIHNhbWUgdG8g
YSBzaXR1YXRpb24gZG9pbmcgdGhlCj4gPiBzcXVlZXppbmcgYWx3YXlzICh3b3JzdC1jYXNlKS4K
PiA+IAo+ID4gRm9yIHRoZSBJL08gcGVyZm9ybWFuY2UgbWVhc3VyZW1lbnQsIEkgcnVuIGEgc2lt
cGxlIGBkZGAgY29tbWFuZCA1IHRpbWVzCj4gPiBhcyBiZWxvdyBhbmQgY29sbGVjdCB0aGUgJ01C
L3MnIHJlc3VsdHMuCj4gPiAKPiA+ICAgICAkIGZvciBpIGluIHsxLi41fTsgZG8gZGQgaWY9L2Rl
di96ZXJvIG9mPWZpbGUgXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicz00ayBj
b3VudD0kKCgyNTYqNTEyKSk7IHN5bmM7IGRvbmUKPiAKPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJl
dHRlciBpZiB5b3UgY291bGQgc2tpcCB0aGUgZmlsZXN5c3RlbSBvdmVyaGVhZAo+IGJ5IHdyaXRp
bmcgZGlyZWN0bHkgdG8gYSBibG9jayBkZXZpY2UsIGllOgo+IAo+IEF0dGFjaCBhIG51bGxfYmxr
IGJhc2VkIGJsb2NrIGRldmljZSB0byB0aGUgZ3Vlc3QgKG9uIGRvbTApOgo+ICMgeGwgYmxvY2st
YXR0YWNoIGd1ZXN0IHBoeTovZGV2L251bGxfYmxrMCB4dmRiIHcKPiAKPiBSdW4gYSB3b3JrbG9h
ZCBhZ2FpbnN0IHRoZSBkZXZpY2UgKGluc2lkZSB0aGUgZ3Vlc3QpOgo+ICMgZmlvIC0tZmlsZW5h
bWU9L2Rldi94dmRiIC0tZGlyZWN0PTEgLS1ydz1yYW5kcncgLS1icz00ayAtLWlvZW5naW5lPWxp
YmFpbyBcCj4gICAgICAgLS1pb2RlcHRoPTY0IC0tcnVudGltZT0xMjAgLS1udW1qb2JzPTQgLS10
aW1lX2Jhc2VkIC0tZ3JvdXBfcmVwb3J0aW5nIFwKPiAgICAgICAtLW5hbWU9dGhyb3VnaHB1dC10
ZXN0LWpvYiAtLWV0YS1uZXdsaW5lPTEKPiAKPiBZb3Ugc2hvdWxkIHJ1biB0aGlzIG9uIGEgbXVs
dGktdmNwdSBndWVzdCBzbyB0aGF0IG11bHRpcGxlIHF1ZXVlcyBhcmUKPiB1c2VkLCBhbmQgYWRq
dXN0IHRoZSBudW1qb2JzIHRvIChhdCBsZWFzdCkgbWF0Y2ggdGhlIG51bWJlciBvZiBxdWV1ZXMu
CgpJIGZvcmdvdCB0byB1cGRhdGUgdGhlIGBkZGAgY29tbWFuZC4gIEkgdXNlZCB0aGUgY29tbWFu
ZCBmb3IgdGhlIHNsb3cgYmxvY2sKZGV2aWNlIHRlc3QsIGJ1dCBkaXJlY3RseSBpbmR1Y2VkIHRo
ZSBJL08gdG93YXJkcyB0aGUgYmxvY2sgZGV2aWNlIGZvciB0aGUgZmFzdApibG9jayBkZXZpY2Ug
dGVzdCBhcyBiZWxvdzoKCiAgICAjIHhsIGJsb2NrLWF0dGFjaCBndWVzdCBwaHk6L2Rldi9yYW0w
IHh2ZGIgdwogCiAgICAkIGZvciBpIGluIHsxLi41fTsgZG8gZGQgaWY9L2Rldi96ZXJvIG9mPWZp
bGUgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJzPTRrIGNvdW50PSQoKDI1Nio1MTIp
KTsgc3luYzsgZG9uZQoKTmV2ZXJ0aGVsZXNzLCBJIGFncmVlIHRoYXQgeW91IHN1Z2dlc3RlZCB0
ZXN0IHdpbGwgcHJvdmlkZSBtdWNoIG1vcmUgYWNjdXJhdGUuCkFzIHN0YXRlZCBiZWZvcmUsIG15
IHRlc3QgaXMgb25seSBkZXNpZ25lZCBmb3IgYSBtaW5pbWFsIHByb29mLW9mLWNvbmNlcHQuCgo+
IAo+IAo+ID4gCj4gPiBJZiB0aGUgdW5kZXJseWluZyBibG9jayBkZXZpY2UgaXMgc2xvdyBlbm91
Z2gsIHRoZSBzcXVlZXppbmcgb3ZlcmhlYWQKPiA+IGNvdWxkIGJlIGhpZGRlbi4gIEZvciB0aGUg
cmVhc29uLCBJIGRvIHRoaXMgdGVzdCBmb3IgYm90aCBhIHNsb3cgYmxvY2sKPiA+IGRldmljZSBh
bmQgYSBmYXN0IGJsb2NrIGRldmljZS4gIEkgdXNlIGEgcG9wdWxhciBjbG91ZCBibG9jayBzdG9y
YWdlCj4gPiBzZXJ2aWNlLCBlYnNbMV0gYXMgYSBzbG93IGRldmljZSBhbmQgdGhlIHJhbWRpc2sg
YmxvY2sgZGV2aWNlWzJdIGZvciB0aGUKPiA+IGZhc3QgZGV2aWNlLgo+ID4gCj4gPiBUaGUgcmVz
dWx0cyBhcmUgYXMgYmVsb3cuICAnbWF4X3BncycgcmVwcmVzZW50cyB0aGUgdmFsdWUgb2YgdGhl
Cj4gPiBgYmxrYmFjay5tYXhfYnVmZmVyX3BhZ2VzYCBwYXJhbWV0ZXIuCj4gPiAKPiA+IE9uIHRo
ZSBzbG93IGJsb2NrIGRldmljZQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAKPiA+
ICAgICBtYXhfcGdzICAgTWluICAgICAgIE1heCAgICAgICBNZWRpYW4gICAgIEF2ZyAgICBTdGRk
ZXYKPiA+ICAgICAwICAgICAgICAgMzguNyAgICAgIDQ1LjggICAgICAzOC43ICAgICAgIDQwLjEy
ICAzLjE3NTIxNjUKPiA+ICAgICAxMDI0ICAgICAgMzguNyAgICAgIDQ1LjggICAgICAzOC43ICAg
ICAgIDQwLjEyICAzLjE3NTIxNjUKPiA+ICAgICBObyBkaWZmZXJlbmNlIHByb3ZlbiBhdCA5NS4w
JSBjb25maWRlbmNlCj4gPiAKPiA+IE9uIHRoZSBmYXN0IGJsb2NrIGRldmljZQo+ID4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAKPiA+ICAgICBtYXhfcGdzICAgTWluICAgICAgIE1heCAg
ICAgICBNZWRpYW4gICAgIEF2ZyAgICBTdGRkZXYKPiA+ICAgICAwICAgICAgICAgNDE3ICAgICAg
IDQyMyAgICAgICA0MjAgICAgICAgIDQxOS40ICAyLjUwOTk4MDEKPiA+ICAgICAxMDI0ICAgICAg
NDE0ICAgICAgIDQyNSAgICAgICA0MTYgICAgICAgIDQxNy44ICA0LjQzODQ2ODIKPiA+ICAgICBO
byBkaWZmZXJlbmNlIHByb3ZlbiBhdCA5NS4wJSBjb25maWRlbmNlCj4gCj4gVGhpcyBpcyBpbnRy
aWd1aW5nLCBhcyBpdCBzZWVtcyB0byBwcm92ZSB0aGF0IHRoZSB1c2FnZSBvZiBhIGNhY2hlIG9m
Cj4gZnJlZSBwYWdlcyBpcyBpcnJlbGV2YW50IHBlcmZvcm1hbmNlIHdpc2UuCj4gCj4gVGhlIHBv
b2wgb2YgZnJlZSBwYWdlcyB3YXMgaW50cm9kdWNlZCBsb25nIGFnbywgYW5kIGl0J3MgcG9zc2li
bGUgdGhhdAo+IHJlY2VudCBpbXByb3ZlbWVudHMgdG8gdGhlIGJhbGxvb24gZHJpdmVyIGhhZCBt
YWRlIHN1Y2ggcG9vbCB1c2VsZXNzLAo+IGF0IHdoaWNoIHBvaW50IGl0IGNvdWxkIGJlIHJlbW92
ZWQgaW5zdGVhZCBvZiB3b3JrZWQgYXJvdW5kLgoKSSBndWVzcyB0aGUgZ3JhbnQgcGFnZSBhbGxv
Y2F0aW9uIG92ZXJoZWFkIGluIHRoaXMgdGVzdCBzY2VuYXJpbyBpcyByZWFsbHkKc21hbGwuICBJ
biBhbiBhYnNlbmNlIG9mIG1lbW9yeSBwcmVzc3VyZSwgZnJhZ21lbnRhdGlvbiwgYW5kIE5VTUEg
aW1iYWxhbmNlLAp0aGUgbGF0ZW5jeSBvZiB0aGUgcGFnZSBhbGxvY2F0aW9uICgnZ2V0X3BhZ2Uo
KScpIGlzIHZlcnkgc2hvcnQsIGFzIGl0IHdpbGwKc3VjY2VzcyBpbiB0aGUgZmFzdCBwYXRoLgoK
RmV3IHllYXJzIGFnbywgSSBvbmNlIG1lYXN1cmVkIHRoZSBwYWdlIGFsbG9jYXRpb24gbGF0ZW5j
eSBvbiBteSBtYWNoaW5lLgpSb3VnaGx5IHNwZWFraW5nLCBpdCB3YXMgYWJvdXQgMXVzIGluIGJl
c3QgY2FzZSwgMTAwdXMgaW4gd29yc3QgY2FzZSwgYW5kIDV1cwppbiBhdmVyYWdlLiAgUGxlYXNl
IGtlZXAgaW4gbWluZCB0aGF0IHRoZSBtZWFzdXJlbWVudCB3YXMgbm90IGRlc2lnbmVkIGFuZApw
ZXJmb3JtZWQgaW4gc2VyaW91cyB3YXkuICBUaHVzIHRoZSByZXN1bHRzIGNvdWxkIGhhdmUgcHJv
ZmlsZSBvdmVyaGVhZCBpbiBpdCwKdGhvdWdoLiAgV2hpbGUga2VlcGluZyB0aGF0IGluIG1pbmQs
IGxldCdzIHNpbXBseSBiZWxpZXZlIHRoZSBudW1iZXIgYW5kIGlnbm9yZQp0aGUgbGF0ZW5jeSBv
ZiB0aGUgYmxvY2sgbGF5ZXIsIGJsa2JhY2sgaXRzZWxmIChpbmNsdWRpbmcgdGhlIGdyYW50Cm1h
cHBpbmcpLCBhbmQgYW55dGhpbmcgZWxzZSBpbmNsdWRpbmcgY29udGV4dCBzd2l0Y2gsIGNhY2hl
IG1pc3MsIGJ1dCB0aGUKYWxsb2NhdGlvbi4gIEluIG90aGVyIHdvcmRzLCBzdXBwb3NlIHRoYXQg
dGhlIGdyYW50IHBhZ2UgYWxsb2NhdGlvbiBpcyBvbmx5IG9uZQpzb3VyY2Ugb2YgdGhlIG92ZXJo
ZWFkLiAgSXQgd2lsbCBiZSBhYmxlIHRvIGFjaGlldmUgMSBtaWxsaW9uIElPUFMgKDRLQiAqCjFN
SU9QUyA9IDQgR0IvcykgaW4gdGhlIGJlc3QgY2FzZSwgMjAwIHRob3VzYW5kIElPUFMgKDgwMCBN
Qi9zKSBpbiBhdmVyYWdlLCBhbmQKMTAgdGhvdXNhbmQgSU9QUyAoNDAgTUIvcykgaW4gd29yc3Qg
Y2FzZS4gIEJhc2VkIG9uIHRoaXMgY29hcnNlIGNhbGN1bGF0aW9uLCBJCnRoaW5rIHRoZSB0ZXN0
IHJlc3VsdHMgaXMgcmVhc29uYWJsZS4KClRoaXMgYWxzbyBtZWFucyB0aGF0IHRoZSBlZmZlY3Qg
b2YgdGhlIGJsa2JhY2sncyBmcmVlIHBhZ2VzIHBvb2wgbWlnaHQgYmUKdmlzaWJsZSB1bmRlciBw
YWdlIGFsbG9jYXRpb24gZmFzdCBwYXRoIGZhaWx1cmUgc2l0dWF0aW9uLiAgTmV2ZXJ0aGVsZXNz
LCBpdAp3b3VsZCBiZSBhbHNvIGhhcmQgdG8gbWVhc3VyZSB0aGF0IGluIG1pY3JvIGxldmVsIHVu
bGVzcyB0aGUgbWVhc3VyZW1lbnQgaXMKd2VsbCBkZXNpZ25lZCBhbmQgY29udHJvbGxlZC4KCj4g
Cj4gRG8geW91IHRoaW5rIHlvdSBjb3VsZCBwZXJmb3JtIHNvbWUgbW9yZSB0ZXN0cyAoYXMgcG9p
bnRlZCBvdXQgYWJvdmUKPiBhZ2FpbnN0IHRoZSBibG9jayBkZXZpY2UgdG8gc2tpcCB0aGUgZnMg
b3ZlcmhlYWQpIGFuZCByZXBvcnQgYmFjayB0aGUKPiByZXN1bHRzPwoKVG8gYmUgaG9uZXN0LCBJ
J20gbm90IHN1cmUgd2hldGhlciBhZGRpdGlvbmFsIHRlc3RzIGFyZSByZWFsbHkgbmVjZXNzYXJ5
LApiZWNhdXNlIEkgdGhpbmsgdGhlIGBkZGAgdGVzdCBhbmQgdGhlIHJlc3VsdHMgZXhwbGFuYXRp
b24gYWxyZWFkeSBtYWtlcyBzb21lCnNlbnNlIGFuZCBwcm92aWRlIHRoZSBtaW5pbWFsIHByb29m
IG9mIHRoZSBjb25jZXB0LiAgQWxzbywgdGhpcyBjaGFuZ2UgaXMgYQpmYWxsYmFjayBmb3IgdGhl
IG1lbW9yeSBwcmVzc3VyZSBzaXR1YXRpb24sIHdoaWNoIGlzIGFuIGVycm9yIHBhdGggaW4gc29t
ZQpwb2ludCBvZiB2aWV3LiAgU3VjaCBlcnJvcm5lb3VzIHNpdHVhdGlvbiBtaWdodCBub3QgaGFw
cGVuIGZyZXF1ZW50bHkgYW5kIGlmCnRoZSBzaXR1YXRpb24gaXMgbm90IHNvbHZlZCBpbiBzaG9y
dCB0aW1lLCBzb21ldGhpbmcgbXVjaCB3b3JzZSAoZS5nLiwgT09NIGtpbGwKb2YgdGhlIHVzZXIg
c3BhY2UgeGVuIGNvbnRyb2wgcHJvY2Vzc2VzKSB0aGFuIHRlbXBvcmFsIEkvTyBwZXJmb3JtYW5j
ZQpkZWdyYWRhdGlvbiBjb3VsZCBoYXBwZW4uICBUaHVzLCBJJ20gbm90IHN1cmUgd2hldGhlciBz
dWNoIGRldGFpbGVkIHBlcmZvcm1hbmNlCm1lYXN1cmVtZW50IGlzIG5lY2Vzc2FyeSBmb3IgdGhp
cyByYXJlIGVycm9yIGhhbmRsaW5nIGNoYW5nZS4gIFRoZSBjb21tZW50IG9mCid4ZW5fYmxrYmtf
dW5tYXAoKScgYWxzbyBzYXlzLCAiVGhpcyBjb3VsZCBhY2N1bXVsYXRlIG9wcyB1cCB0byB0aGUg
YmF0Y2ggc2l6ZQp0byByZWR1Y2UgdGhlIG51bWJlciBvZiBoeXBlcmNhbGxzLCBidXQgc2luY2Ug
dGhpcyBpcyBvbmx5IHVzZWQgaW4gZXJyb3IgcGF0aHMKdGhlcmUncyBubyByZWFsIG5lZWQuIi4K
ClRoYXQgc2FpZCwgaWYgeW91IHN0aWxsIHdhbnQgbWUgdG8gZG8gdGhlIHRlc3QsIEkgd2lsbCBn
bGFkbHkgZG8gaXQuICBOb3RlIHRoYXQKc2luY2UgSSdtIG5vdyB0cmF2ZWxpbmcgVVMgd2l0aG91
dCB0aGUgcG93ZXIgY2FibGUgb2YgbXkgbm93IGRpc2NoYXJnZWQgbGFwdG9wCndoaWNoIGlzIHRo
ZSBvbmx5IHdheSB0byBjb25uZWN0IHRvIG15IHRlc3QgZW52aXJvbm1lbnRzIGluIG15IG9mZmlj
ZSwgSSB3b3VsZApub3QgYmUgYWJsZSB0byBkbyB0aGUgYWRkaXRpb25hbCB0ZXN0IHF1aWNrbHku
ICBJIGFzc3VtZSBJIGNvdWxkIGRvIHRoZSB0ZXN0CmFuZCBnaXZlIHlvdSB0aGUgcmVzdWx0IHdp
dGhpbiBhIGNvdXBsZSBvZiB3ZWVrLiAgSWYgeW91IHdhbnQgbWUgdG8gcG9zdCBuZXh0CnZlcnNp
b24gd2l0aCBtaW5vciBjaGFuZ2VzIHN1Y2ggYXMgY29tbWl0IG1lc3NhZ2UgdXBkYXRlIG1lYW53
aGlsZSwgcGxlYXNlIGp1c3QKbGV0IG1lIGtub3cuICBBZ2FpbiwgaWYgeW91IHdhbnQgaXQsIEkg
d2lsbCBnbGFkbHkgZG8gaXQgOikKCj4gCj4gPiAKPiA+IEluIHNob3J0LCBldmVuIHdvcnN0IGNh
c2Ugc3F1ZWV6aW5nIG9uIHJhbWRpc2sgYmFzZWQgZmFzdCBibG9jayBkZXZpY2UKPiA+IG1ha2Vz
IG5vIHZpc2libGUgcGVyZm9ybWFuY2UgZGVncmFkYXRpb24uICBQbGVhc2Ugbm90ZSB0aGF0IHRo
aXMgaXMganVzdAo+ID4gYSB2ZXJ5IHNpbXBsZSBhbmQgbWluaW1hbCB0ZXN0LiAgT24gc3lzdGVt
cyB1c2luZyBzdXBlci1mYXN0IGJsb2NrCj4gPiBkZXZpY2VzIGFuZCBhIHNwZWNpYWwgSS9PIHdv
cmtsb2FkLCB0aGUgcmVzdWx0cyBtaWdodCBiZSBkaWZmZXJlbnQuICBJZgo+ID4geW91IGhhdmUg
YW55IGRvdWJ0LCB0ZXN0IG9uIHlvdXIgbWFjaGluZSBmb3IgeW91ciB3b3JrbG9hZCB0byBmaW5k
IHRoZQo+ID4gb3B0aW1hbCBzcXVlZXppbmcgZHVyYXRpb24gZm9yIHlvdS4KPiA+IAo+ID4gWzFd
IGh0dHBzOi8vYXdzLmFtYXpvbi5jb20vZWJzLwo+ID4gWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1aWRlL2Jsb2NrZGV2L3JhbWRpc2suaHRtbAo+ID4g
Cj4gPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jIHwgMjIgKysrKysrKysrKysrKysr
KysrKystLQo+ID4gIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggIHwgIDEgKwo+
ID4gIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgIHwgIDMgKystCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgYi9kcml2ZXJz
L2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwo+ID4gaW5kZXggZmQxZTE5ZjFhNDlmLi45ODgy
M2QxNTA5MDUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2Jh
Y2suYwo+ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKPiA+IEBA
IC0xNDIsNiArMTQyLDIxIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwZXJzaXN0ZW50X2dudF90aW1l
b3V0KHN0cnVjdCBwZXJzaXN0ZW50X2dudCAqcGVyc2lzdGVudF9nbnQpCj4gPiAgCQlIWiAqIHhl
bl9ibGtpZl9wZ3JhbnRfdGltZW91dCk7Cj4gPiAgfQo+ID4gIAo+ID4gKy8qIE9uY2UgYSBtZW1v
cnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsIHNxdWVlemUgZnJlZSBwYWdlIHBvb2xzIGZvciBhIHdo
aWxlLiAqLwo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgYnVmZmVyX3NxdWVlemVfZHVyYXRpb25f
bXMgPSAxMDsKPiA+ICttb2R1bGVfcGFyYW1fbmFtZWQoYnVmZmVyX3NxdWVlemVfZHVyYXRpb25f
bXMsCj4gPiArCQlidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywgaW50LCAwNjQ0KTsKPiA+ICtN
T0RVTEVfUEFSTV9ERVNDKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+ID4gKyJEdXJhdGlv
biBpbiBtcyB0byBzcXVlZXplIHBhZ2VzIGJ1ZmZlciB3aGVuIGEgbWVtb3J5IHByZXNzdXJlIGlz
IGRldGVjdGVkIik7Cj4gCj4gWW91IHNob3VsZCBhZGQgYSBkZXNjcmlwdGlvbiBhYm91dCB0aGlz
IHBhcmFtZXRlciB0bwo+IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXhl
bi1ibGtiYWNrCgpHb29kIHBvaW50LCBJIHdpbGwuCgoKVGhhbmtzLApTZW9uZ0phZSBQYXJrCgo+
IAo+IFRoYW5rcywgUm9nZXIuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
