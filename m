Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C712B4C8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:14:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikpOg-0000U2-Jr; Fri, 27 Dec 2019 13:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=blbd=2R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ikpOf-0000Tx-Uu
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:11:17 +0000
X-Inumbo-ID: 5d5ca708-28aa-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d5ca708-28aa-11ea-a1e1-bc764e2007e4;
 Fri, 27 Dec 2019 13:11:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t2so26065340wrr.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2019 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DM25hTyjezIh0vBxW/o5NNqzQoivRpl9K2mAMGr3hAA=;
 b=XPqR3njPqGlN0kwEOfTQafnTVLwZJ0O2/WeHYYR7uxmwHLjVQhpsQ2T3R82ORW0DnV
 tHwows4C00+ZBDASB0OOaZ5B51m6kQINUmEPSQXmfcwKmjOESeXA22ONQvHClUidlr8s
 6WR2EaVCfXcwcdIoAjv5BZPduns4s3V3bcwZLhWmi8YrJ4iP1gqA577nifnuf24tG3Vu
 EyZrWRyTIvsQDVQ0gnfnqVGCi13lNrAOeVkoRyMk7uKki3AxMZdC03NXVs5Pkl57COj/
 YwMOV12mcGgo24UAKNXS0hPEFiNtf8WYpkQz97B3J3SXobTIuiiY/R6HKfJGKLQ+uhwV
 nWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DM25hTyjezIh0vBxW/o5NNqzQoivRpl9K2mAMGr3hAA=;
 b=Rs9nsmaN5TdkGenxaErjhVbnNwtu2G2G35xUMKJqolTqAbifGUXIJ78uTiSXA+7/L2
 39NRAywbhA8EbdV/9Gi6FcQX4WAnudcv2refPLWR6+J/qjou1xUJgZU0/kVTHG/kacdg
 fPmJUAIg+ogonETU0e5z4NTXSE2Ip6uvdUpyUQry+ppOPoCJfOpdlZXuCWJkbsijqrKj
 s+81DpfjTST1nfygYBzy+LL8x9Ib9zQkJdpu1s+ANul+yqPZ2XcJiYJ5ik0ZW5mihWYg
 nl+NaF793KsxN/OnfTS6ZYXkro/2DUnPzN721d4wcQOSNdnmu2NonK4SERdoWptMSW1G
 Fnmw==
X-Gm-Message-State: APjAAAXPHbSJPiq2TbEgfeCTEwaHIApmHgxL4X9o91Dju+K1FyaOBw43
 9QgojGb5NNMmMO1S7kwriQMGzZLk2KnHkhq5NI8=
X-Google-Smtp-Source: APXvYqybdEDav9TjWEOWL7t52k5VQvtJPQugsDaIKE2vhm6fr0ieoK9xMu7K/yNV+HxaonBrWICZf4J4hO0oiND0IEA=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr49603943wru.353.1577452275985; 
 Fri, 27 Dec 2019 05:11:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
 <CABfawhmeMQtpwjubk_YLO26Lo+6JvZtVtqKWexgjE3VR8SNZZQ@mail.gmail.com>
 <279e2e11-3928-b7ef-4dda-632ce58c650d@suse.com>
In-Reply-To: <279e2e11-3928-b7ef-4dda-632ce58c650d@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 27 Dec 2019 06:10:39 -0700
Message-ID: <CABfawhmzVwedYq-iYTSAYEjXkPR_4PBz+MR=eTJwKfHbux-9gQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMTowNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gKHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBt
YWlsIGhhdmluZyBhcHBlYXJlZCBvbiB0aGUgbGlzdCkKPgo+IE9uIDIzLjEyLjIwMTkgMTU6NTUs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIE1vbiwgRGVjIDIzLCAyMDE5IGF0IDI6Mzcg
QU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIw
LjEyLjIwMTkgMTg6MzIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4+IE9uIDIwLzEyLzIwMTkg
MTc6MjcsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4+IE9uIEZyaSwgRGVjIDIwLCAyMDE5
IGF0IDk6NDcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pj4+
PiBPbiAxOC4xMi4yMDE5IDIwOjQwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+Pj4+IEN1
cnJlbnRseSB0aGUgaHZtIHBhcmFtZXRlcnMgYXJlIG9ubHkgYWNjZXNzaWJsZSB2aWEgdGhlIEhW
TU9QIGh5cGVyY2FsbHMuIEJ5Cj4gPj4+Pj4+IGV4cG9zaW5nIGh2bV97Z2V0L3NldH1fcGFyYW0g
aXQgd2lsbCBiZSBwb3NzaWJsZSBmb3IgVk0gZm9ya2luZyB0byBjb3B5IHRoZQo+ID4+Pj4+PiBw
YXJhbWV0ZXJzIGRpcmVjdGx5IGludG8gdGhlIGNsb25lIGRvbWFpbi4KPiA+Pj4+PiBIYXZpbmcg
cGVla2VkIGFoZWFkIGF0IHBhdGNoIDE3LCB3aGVyZSB0aGlzIGdldHMgdXNlZCwgSSB3b25kZXIg
d2h5Cj4gPj4+Pj4geW91IHdhbnQgYSBwYWlyIG9mIG9uZS1ieS1vbmUgZnVuY3Rpb25zLCByYXRo
ZXIgdGhhbiBhIGNvcHktYWxsIG9uZS4KPiA+Pj4+PiBUaGlzIHRoZW4gd291bGRuJ3QgcmVxdWly
ZSBleHBvc3VyZSBvZiB0aGUgZnVuY3Rpb25zIHlvdSB0b3VjaCBoZXJlLgo+ID4+Pj4gV2VsbCwg
cHJvdmlkZWQgdGhlcmUgaXMgbm8gc3VjaCBmdW5jdGlvbiBpbiBleGlzdGVuY2UgdG9kYXkgaXQg
d2FzCj4gPj4+PiBqdXN0IGVhc2llciB0byB1c2Ugd2hhdCdzIGFscmVhZHkgYXZhaWxhYmxlLiBJ
IHN0aWxsIHdvdWxkbid0IHdhbnQgdG8KPiA+Pj4+IGltcGxlbWVudCBhIG9uZS1zaG90IGZ1bmN0
aW9uIGxpa2UgdGhhdCBiZWNhdXNlIHRoaXMgc2FtZSBjb2RlLXBhdGggaXMKPiA+Pj4+IHNoYXJl
ZCBieSB0aGUgc2F2ZS1yZXN0b3JlIG9wZXJhdGlvbnMgb24gdGhlIHRvb2xzdGFjayBzaWRlLCBz
byBhdAo+ID4+Pj4gbGVhc3QgSSBoYXZlIGEgcmVhc29uYWJsZSBhc3N1bXB0aW9uIHRoYXQgaXQg
d29uJ3QgYnJlYWsgb24gbWUgaW4gdGhlCj4gPj4+PiBmdXR1cmUuCj4gPj4+Cj4gPj4+IEluIHBh
cnRpY3VsYXIsIGEgbnVtYmVyIG9mIHRoZSBzZXQgb3BlcmF0aW9ucyBhcmUgZGlzdGluY3RseQo+
ID4+PiBub24tdHJpdmlhbC4KPiA+Pgo+ID4+IEhvdyBpcyB0cml2aWFsIG9yIG5vdCByZWxhdGVk
IHRvIHRoZXJlIGJlaW5nIG9uZSBmdW5jdGlvbiBkb2luZwo+ID4+IHRoZSBsb29waW5nIHdhbnRl
ZCBoZXJlIHZzIHRoZSBsb29waW5nIGJlaW5nIGRvbmUgYnkgdGhlIGNhbGxlcgo+ID4+IGFyb3Vu
ZCB0aGUgdHdvIHBlci1lbnRpdHkgY2FsbHM/Cj4gPgo+ID4gSSBkb24ndCByZWFsbHkgZ2V0IHdo
eSB3b3VsZCBpdCBtYXR0ZXIgd2hlcmUgdGhlIGxvb3BpbmcgaXMgYmVpbmcKPiA+IGRvbmU/IEV2
ZW4gaWYgSSB3ZXJlIHRvIGFkZCBhIHNpbmdsZSBmdW5jdGlvbiB0byBkbyB0aGlzLCBpdCB3b3Vs
ZCBkbwo+ID4gdGhlIHNhbWUgbG9vcGluZyBhbmQganVzdCBjYWxsIHRoZSBub3cgaW50ZXJuYWxs
eSBrZXB0IGdldC9zZXQgcGFyYW1zCj4gPiBmdW5jdGlvbnMuCj4KPiBUaGUgZGlmZmVyZW5jZSAo
dG8gbWUpIGlzIHdoYXQgbGV2ZWwgb2YgY29udHJvbCBnZXRzIGV4cG9zZWQgb3V0c2lkZQo+IG9m
IHRoZSBmaWxlLiBGb3IgZXhhbXBsZSBJIGFsc28gZGlzbGlrZSBleHRlcm5hbCBjb2RlIGRvaW5n
IHRoaXMKPiBzb21ld2hhdCBvZGQgKGJ1dCBuZWNlc3NhcnkgYXMgcGVyIHlvdXIgY29tbXVuaWNh
dGlvbiB3aXRoIEFuZHJldykKPiBjaGVja2luZyBhZ2FpbnN0IHplcm8gdmFsdWVzLiBTdWNoIGFy
ZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIHdoaWNoCj4gd291bGQgYmV0dGVyIG5vdCBiZSBzY2F0
dGVyIGFyb3VuZC4KCkJ1dCB5b3UgZG8gcmVhbGl6ZSB0aGF0IGJvdGggb2YgdGhlc2UgZnVuY3Rp
b25zIGFyZSBhbHJlYWR5IGV4cG9zZWQKdmlhIGh5cGVyY2FsbHM/IFNvIGl0J3MgT0sgdG8gY2Fs
bCB0aGVtIGZyb20gdGhlIHRvb2xzdGFjayBidXQgbm90CmZyb20gb3RoZXIgcGFydHMgb2YgWGVu
IGl0c2VsZj8gSSBkb24ndCBzZWUgbXVjaCByZWFzb24gdGhlcmUuIEJ1dCB0bwptZSBpdCBtYWtl
cyAwIGRpZmZlcmVuY2Ugd2hlcmUgdGhlIGxvb3AgdGhhdCBjb3BpZXMgdGhlIHBhcmFtcyBpcwpk
b25lLCBhcyBsb25nIGFzIGl0J3Mgd2l0aGluIFhlbi4gU28gaWYgeW91IHJlYWxseSB3YW50IGl0
IHRvIGJlIGluCmh2bS5jIEkgY2FuIGRvIHRoYXQsIEkganVzdCBmaW5kIGl0IHNpbGx5LgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
