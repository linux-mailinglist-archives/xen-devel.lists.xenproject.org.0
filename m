Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF026793A
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2019 10:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmDAI-00028y-Mi; Sat, 13 Jul 2019 08:13:54 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.171])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <pbrobinson@gmail.com>) id 1hlfvA-0008IC-Tv
 for xen-devel@lists.xensource.com; Thu, 11 Jul 2019 20:44:05 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-c.eu-west-1.aws.symcld.net id 78/61-11076-39F972D5;
 Thu, 11 Jul 2019 20:44:03 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-2.tower-304.messagelabs.com: domain of gmail.com designates 
 209.85.166.68 as permitted sender) smtp.mailfrom=gmail.com; dkim=pass 
 (good signature) header.i=@gmail.com header.s=20161025; dmarc=pass 
 (p=none sp=quarantine adkim=r aspf=r) header.from=gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsVyMXSZi+7E+eq
 xBvv7TC3uTXnP7sDosb1vF3sAYxRrZl5SfkUCa8a7Sa+YCu6yVXy48pS9gXEbaxcjF4eQwHRG
 iYUnprJ0MXJysAg0sEo8+BcCkpAQmMMq0Xp2ARNIQkKgTOL+jL9ARRxAdpHEqpNsEOFSiaPn+
 sB6eQUEJU7OfMICMbSHWeJE0y+wIk4Bb4l7J2awg/SyCWhL7G61hNilKvHwC8gRIL0BEgcaIW
 xhAUeJG9s/MoLYIgLhEg9fPAc7lFlgL7NEf8ccsGXMApoSrdt/s09gFJiFZPcsJKkFjEyrGM2
 TijLTM0pyEzNzdA0NDHQNDY10jQyMdU0N9BKrdJP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJL
 NjECwzSl4LTRDsa+WW/0DjFKcjApifJO5lOPFeJLyk+pzEgszogvKs1JLT7EKMPBoSTB+2QeU
 E6wKDU9tSItMwcYMzBpCQ4eJRHeMyBp3uKCxNzizHSI1ClGS44lG+ctYubo+LUISC7YumQRsx
 BLXn5eqpQ4rxFIgwBIQ0ZpHtw4WFxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+xpkCk9
 mXgnc1ldABzEBHaTqpwZyUEkiQkqqgWlGh4h4aNbn5Y++CTbWpf8xFLAPzLd5cvnqO2ajNwlP
 45pm7ONylbq0ao1k8zGFD+olYprdDiWGdx9vYqjYuWWJk5CXQ4vQ7HUNVk/O71+3z9O+w/2Sh
 X7HkmA79c6z+esNqhbNEOkwl2isayldv2KTrXNCU76CiL/IxNZgFcPjC19EzV5WX7SXU7XrY8
 r8+Zxb1gT/ydW6y9jZXpv59M/pZZ5rWue9VGeyPS3OXpQxgS1+wpFVt/QfHeWOzPrs3ju9ZH/
 FG/2bC97OZ7ewjLdkFv18I+x3vWbT6u0yD/OtsgwyPihs/Vz8bVmNOu+Rwk6DM9f/557UuXqj
 Refpog0fbvhdn+J1fXv8uvdropRYijMSDbWYi4oTAeUxYolmAwAA
X-Env-Sender: pbrobinson@gmail.com
X-Msg-Ref: server-2.tower-304.messagelabs.com!1562877841!1606169!1
X-Originating-IP: [209.85.166.68]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30590 invoked from network); 11 Jul 2019 20:44:01 -0000
Received: from mail-io1-f68.google.com (HELO mail-io1-f68.google.com)
 (209.85.166.68)
 by server-2.tower-304.messagelabs.com with AES128-GCM-SHA256 encrypted SMTP;
 11 Jul 2019 20:44:01 -0000
Received: by mail-io1-f68.google.com with SMTP id u19so15528412ior.9
 for <xen-devel@lists.xensource.com>; Thu, 11 Jul 2019 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hf73/cIKW9dvmos7oXptahfvnWQRs+PXzd/Yp2c4q5g=;
 b=KdPoAwJKieRvEgwvw28Ca9HtJM1LrhezVMSV1QZdBYKTj7ej2JnrVkNaQkn0398TmO
 O6MLmNdIdupxOKMTYdatDLhTiDw5Kn3G00Ak285oiqVnby//LpSfTQce9kDjHz596lJn
 lTOyQQtr+kcCa+ThQV6ipKok8UBnNY5XOjSd4ysYMPzjEX6IKiATM/z9Nuom6/RGvAx2
 ow5gJI5V1Wnf+q7taXbqdERjs2Bdn3bSVgMKCG/25N5SUR2t/iJML8iiezCbY79+Xn50
 BR1wjgrsj64LN7BTD5XLFlso/wXq/k4JZFIiEip/U5OQDSgH+UCp1hdZzOAlayAvzpDd
 1m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hf73/cIKW9dvmos7oXptahfvnWQRs+PXzd/Yp2c4q5g=;
 b=Zzt/47wqqoZeBgwWr3xf/gLkBjiQeS6TV17yPHWbNKBbCAvtVeiuQH5VL9scMHkw5F
 E2ig3h8IuFkHP3jwP39ySbrGsUF8fGm1uF5wUyf0FnoeQWSGrs00ljvLq9iO+1fPvWnR
 CE7hV+hFkqsDC97U6rVkRaPnOgQn3/y+HCSb08MtcIk/1MWg1KAkW8lrlc/HN3RFqhHb
 W0+XeX8KAsyMOg8Uq7Q+5yE4VQSmV+C+mWPi4ZYAlLP/UdQpbJFCF7VZwDeVmlRA+tUg
 OzYM++DvtX4N0uEL5fK8qmHmOGGPzZRZOdYMN8ySIGkPq/qpuE1F1XYLrgypc5v9NWgN
 31Tw==
X-Gm-Message-State: APjAAAU/mBDP0RsfkvXMJZkyiZzemnmUuhZC28JNOt8LlFWIiounDSvL
 DaaT4TJLKdBu6yl8kRCOlA3Dmcs6FQsqHwDyWnQ=
X-Google-Smtp-Source: APXvYqymyxDFoehi+4tdsezNYK0CjhovX7J8BdZG5iuYNaQDh5FxXyyTKxspY1eAvo06j+1SnacwPrkTXE+AuTSbeXM=
X-Received: by 2002:a5d:8c97:: with SMTP id g23mr6559921ion.250.1562877840461; 
 Thu, 11 Jul 2019 13:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
In-Reply-To: <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 11 Jul 2019 21:43:48 +0100
Message-ID: <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
X-Mailman-Approved-At: Sat, 13 Jul 2019 08:13:53 +0000
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: Adam Williamson <adamwill@fedoraproject.org>, xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBNb24sIDIwMTktMDctMDggYXQgMDk6MTEgLTA3MDAsIEFkYW0gV2lsbGlhbXNvbiB3cm90
ZToKPiA+IEl0J3Mgd29ydGggbm90aW5nIHRoYXQgYXQgbGVhc3QgcGFydCBvZiB0aGUganVzdGlm
aWNhdGlvbiBmb3IgdGhlCj4gPiBjcml0ZXJpb24gaW4gdGhlIGZpcnN0IHBsYWNlIHdhcyB0aGF0
IEFtYXpvbiB3YXMgdXNpbmcgWGVuIGZvciBFQzIsIGJ1dAo+ID4gdGhhdCBpcyBubyBsb25nZXIg
dGhlIGNhc2UsIG1vc3QgaWYgbm90IGFsbCBFQzIgaW5zdGFuY2UgdHlwZXMgbm8KPiA+IGxvbmdl
ciB1c2UgWGVuLgo+Cj4gSSBkb24ndCBrbm93IHdoZXJlIHlvdSBnb3QgdGhhdCBwYXJ0aWN1bGFy
IHBpZWNlIG9mIGluZm9ybWF0aW9uLiBJdAo+IGlzbid0IGNvcnJlY3QuIE1vc3QgRUMyIGluc3Rh
bmNlIHR5cGVzIHN0aWxsIHVzZSBYZW4uIFRoZSB2YXN0IG1ham9yaXR5Cj4gb2YgRUMyIGluc3Rh
bmNlcywgYnkgdm9sdW1lLCBhcmUgWGVuLgoKQ29ycmVjdCwgaXQncyBvbmx5IHNwZWNpZmljIHR5
cGVzIG9mIG5ldyBoeXBlcnZpc29ycyB0aGF0IHVzZSBrdm0KYmFzZWQsIHBsdXMgbmV3IEhXIGxp
a2UgYWFyY2g2NC4KClRoYXQgYmVpbmcgc2FpZCBJIGRvbid0IGJlbGlldmUgdGVzdGluZyB3ZSBj
YW4gYm9vdCBvbiB4ZW4gaXMgYWN0dWFsbHkKdXNlZnVsIHRoZXNlIGRheXMgZm9yIHRoZSBBV1Mg
dXNlIGNhc2UsIGl0J3MgbGlrZWx5IGRpZmZlcmVudCBlbm91Z2gKdGhhdCB0aGUgdGVzdGluZyBp
c24ndCB1c2VmdWwsIHdlJ2QgYmUgbXVjaCBiZXR0ZXIgdGVzdGluZyB0aGF0IGNsb3VkCmltYWdl
cyBhY3R1YWxseSB3b3JrIG9uIEFXUyB0aGFuIHRlc3RpbmcgaWYgaXQgYm9vdHMgb24geGVuLgoK
UGV0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
