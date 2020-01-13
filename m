Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08D138E72
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 11:02:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqwVr-00040M-3l; Mon, 13 Jan 2020 09:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tPYo=3C=amazon.com=prvs=274db34ee=sjpark@srs-us1.protection.inumbo.net>)
 id 1iqwVp-00040D-9e
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 09:59:57 +0000
X-Inumbo-ID: 7418ab4c-35eb-11ea-8241-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7418ab4c-35eb-11ea-8241-12813bfff9fa;
 Mon, 13 Jan 2020 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578909597; x=1610445597;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=NLk0Q2nA10kWUDxhQp+mKV/5Lh/SEbObpJbRFWy+cF4=;
 b=gMACNyW5g21a/wSmZ3cQwlWkbqfn5wHAd2O1kWZCcuEDLRF4NdUuR24f
 eky5j1d5DdkJrwBLN9qdx89luO3lvXfwxcnTLGexjeporrspRiwGjfVNJ
 vrRckUyOQAUuUeu3Vn/qfR0Ddb26KVkoR6YUkG9yiUYPnvGy+emZXdwGw M=;
IronPort-SDR: 7UWxbXmeu6JLqhKd8TBlEtlwkYdPo3Dw/eqPtp8mbwamMLLQ+nGXJQbjrWOVHH98mInXf1z9Mv
 v1hiiYT81YKg==
X-IronPort-AV: E=Sophos;i="5.69,428,1571702400"; d="scan'208";a="12078578"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Jan 2020 09:59:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id E0229A20D0; Mon, 13 Jan 2020 09:59:54 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 13 Jan 2020 09:59:54 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.92) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 Jan 2020 09:59:49 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Date: Mon, 13 Jan 2020 10:59:32 +0100
Message-ID: <20200113095932.602-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200113095507.GE11756@Air-de-Roger> (raw)
X-Originating-IP: [10.43.160.92]
X-ClientProxiedBy: EX13D32UWA001.ant.amazon.com (10.43.160.4) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v13 0/5] xenbus/backend: Add memory pressure
 handler callback
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, axboe@kernel.dk, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMyBKYW4gMjAyMCAxMDo1NTowNyArMDEwMCAiUm9nZXIgUGF1IE1vbm7DqSIgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKCj4gT24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTA6
NDk6NTJBTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiA+IEV2ZXJ5IHBhdGNoIG9mIHRo
aXMgcGF0Y2hzZXQgZ290IGF0IGxlYXN0IG9uZSAnUmV2aWV3ZWQtYnknIG9yICdBY2tlZC1ieScg
ZnJvbQo+ID4gYXBwcm9wcmlhdGUgbWFpbnRhaW5lcnMgYnkgbGFzdCBXZWRuZXNkYXksIGFuZCBh
ZnRlciB0aGF0LCBnb3Qgbm8gY29tbWVudCB5ZXQuCj4gPiBNYXkgSSBhc2sgc29tZSBtb3JlIGNv
bW1lbnRzPwo+IAo+IEknbSBub3Qgc3VyZSB3aHkgbW9yZSBjb21tZW50cyBhcmUgbmVlZGVkLCBw
YXRjaGVzIGhhdmUgYWxsIHRoZQo+IHJlbGV2YW50IEFja3MgYW5kIHdpbGwgYmUgcHVzaGVkIGlu
IGR1ZSB0aW1lIHVubGVzcyBzb21lb25lIGhhcwo+IG9iamVjdGlvbnMuCj4gCj4gUGxlYXNlIGJl
IHBhdGllbnQgYW5kIHdhaXQgYXQgbGVhc3QgdW50aWwgdGhlIG5leHQgbWVyZ2Ugd2luZG93LCB0
aGlzCj4gcGF0Y2hlcyBhcmUgbm90IGJ1ZyBmaXhlcyBzbyBwdXNoaW5nIHRoZW0gbm93IHdvdWxk
IGJlIHdyb25nLgoKT2ssIEkgd2lsbC4gIFRoYW5rIHlvdSBmb3IgeW91ciBxdWljayBhbmQgbmlj
ZSByZXBseS4KCgpUaGFua3MsClNlb25nSmFlIFBhcmsKCj4gCj4gUm9nZXIuCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
