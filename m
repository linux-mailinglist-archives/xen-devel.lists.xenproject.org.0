Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26817B912
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:16:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA92k-0002bO-Ii; Fri, 06 Mar 2020 09:13:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dJSx=4X=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jA92i-0002bJ-RC
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:13:16 +0000
X-Inumbo-ID: b401b37a-5f8a-11ea-a77a-12813bfff9fa
Received: from mail-pl1-f193.google.com (unknown [209.85.214.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b401b37a-5f8a-11ea-a77a-12813bfff9fa;
 Fri, 06 Mar 2020 09:13:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j7so626414plt.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 01:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvWmgp0NFp/mKgDyS1K2Nd14v5giX0K4pPVrUcKgo+Q=;
 b=mgg5OLXiRYR4ty/GQjfX5CsHZDHGei6nGH7DDCLN+F7JcvT0E9OEGjNFuwwljhwRVT
 /XTJ0uuLyGeGWSfdDzar+v/Wam8tT6Qd2tHWQLXZpGFJo7g3D+wdCDNw6TzVITctpAem
 k+JYtpohSSQTG/QJu4XPsVaOob0/wyx4iIwLr7sYR4HUL2XKvQAkChRvgzy31XaueQ9n
 J4XP8vl7ne5vsROgyShTe/4a9aduh8gokaynF3CzLDLvmq5c5dLYYpWiLNVwmYX5osqb
 /lpzvTK/gAth78a48BLZqBpf5iB6ml6VVSoRtL9wlIGahSSpTd8WPtnhHC63mJETDsfe
 8aYw==
X-Gm-Message-State: ANhLgQ3Pluxmj7bYn5MWFSMkY5zN+Haegn5irzISZyxfCb9SaceYTihr
 IFVjUnVlWZEKDJcrL5fTFUckRLuqQnpEFNcT
X-Google-Smtp-Source: ADFU+vtsCitJe4H0bi5qMUg3UNXTXJGbhlTsfsuLPk1gF6TIt5glnfN7HD9wQfcnS0uJDI6SeVi2Xg==
X-Received: by 2002:a17:902:8542:: with SMTP id
 d2mr2181070plo.200.1583485991120; 
 Fri, 06 Mar 2020 01:13:11 -0800 (PST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178])
 by smtp.gmail.com with ESMTPSA id h22sm34641357pgn.57.2020.03.06.01.13.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 01:13:10 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id w12so605312pll.13
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 01:13:10 -0800 (PST)
X-Received: by 2002:a17:90a:ec0f:: with SMTP id
 l15mr2568366pjy.133.1583485990255; 
 Fri, 06 Mar 2020 01:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-11-vsementsov@virtuozzo.com>
In-Reply-To: <20200306051536.27803-11-vsementsov@virtuozzo.com>
From: Paul Durrant <paul@xen.org>
Date: Fri, 6 Mar 2020 09:12:59 +0000
X-Gmail-Original-Message-ID: <CACCGGhAdx_OX-V59omuSQZccUWBNft063BO4-TPAw=JHNbuGoQ@mail.gmail.com>
Message-ID: <CACCGGhAdx_OX-V59omuSQZccUWBNft063BO4-TPAw=JHNbuGoQ@mail.gmail.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [Xen-devel] [PATCH v8 10/10] xen: introduce ERRP_AUTO_PROPAGATE
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA2IE1hciAyMDIwIGF0IDA1OjE2LCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5
Cjx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyb3RlOgo+Cj4gSWYgd2Ugd2FudCB0byBhZGQg
c29tZSBpbmZvIHRvIGVycnAgKGJ5IGVycm9yX3ByZXBlbmQoKSBvcgo+IGVycm9yX2FwcGVuZF9o
aW50KCkpLCB3ZSBtdXN0IHVzZSB0aGUgRVJSUF9BVVRPX1BST1BBR0FURSBtYWNyby4KPiBPdGhl
cndpc2UsIHRoaXMgaW5mbyB3aWxsIG5vdCBiZSBhZGRlZCB3aGVuIGVycnAgPT0gJmVycm9yX2Zh
dGFsCj4gKHRoZSBwcm9ncmFtIHdpbGwgZXhpdCBwcmlvciB0byB0aGUgZXJyb3JfYXBwZW5kX2hp
bnQoKSBvcgo+IGVycm9yX3ByZXBlbmQoKSBjYWxsKS4gIEZpeCBzdWNoIGNhc2VzLgo+Cj4gSWYg
d2Ugd2FudCB0byBjaGVjayBlcnJvciBhZnRlciBlcnJwLWZ1bmN0aW9uIGNhbGwsIHdlIG5lZWQg
dG8KPiBpbnRyb2R1Y2UgbG9jYWxfZXJyIGFuZCB0aGVuIHByb3BhZ2F0ZSBpdCB0byBlcnJwLiBJ
bnN0ZWFkLCB1c2UKPiBFUlJQX0FVVE9fUFJPUEFHQVRFIG1hY3JvLCBiZW5lZml0cyBhcmU6Cj4g
MS4gTm8gbmVlZCBvZiBleHBsaWNpdCBlcnJvcl9wcm9wYWdhdGUgY2FsbAo+IDIuIE5vIG5lZWQg
b2YgZXhwbGljaXQgbG9jYWxfZXJyIHZhcmlhYmxlOiB1c2UgZXJycCBkaXJlY3RseQo+IDMuIEVS
UlBfQVVUT19QUk9QQUdBVEUgbGVhdmVzIGVycnAgYXMgaXMgaWYgaXQncyBub3QgTlVMTCBvcgo+
ICAgICZlcnJvcl9mYXRhbCwgdGhpcyBtZWFucyB0aGF0IHdlIGRvbid0IGJyZWFrIGVycm9yX2Fi
b3J0Cj4gICAgKHdlJ2xsIGFib3J0IG9uIGVycm9yX3NldCwgbm90IG9uIGVycm9yX3Byb3BhZ2F0
ZSkKPgo+IFRoaXMgY29tbWl0IGlzIGdlbmVyYXRlZCBieSBjb21tYW5kCj4KPiAgICAgc2VkIC1u
ICcvXlg4NiBYZW4gQ1BVcyQvLC9eJC97cy9eRjogLy9wfScgTUFJTlRBSU5FUlMgfCBcCj4gICAg
IHhhcmdzIGdpdCBscy1maWxlcyB8IGdyZXAgJ1wuW2hjXSQnIHwgXAo+ICAgICB4YXJncyBzcGF0
Y2ggXAo+ICAgICAgICAgLS1zcC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0
ZWQtZXJycC5jb2NjaSBcCj4gICAgICAgICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNy
by1maWxlLmggXAo+ICAgICAgICAgLS1pbi1wbGFjZSAtLW5vLXNob3ctZGlmZiAtLW1heC13aWR0
aCA4MAo+Cj4gUmVwb3J0ZWQtYnk6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4gUmVw
b3J0ZWQtYnk6IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVmxh
ZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgoKUmV2
aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
