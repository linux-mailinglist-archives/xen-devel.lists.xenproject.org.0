Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E1BF67B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 18:12:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDWLA-0004yH-SI; Thu, 26 Sep 2019 16:10:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDWL9-0004y8-9p
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 16:09:59 +0000
X-Inumbo-ID: 15d57f56-e078-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 15d57f56-e078-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569514198; x=1601050198;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ImBSsnq1TWjbhYcINO8dd142M8m9WJIJjD6Ae23KSaU=;
 b=dH8gnV6x6Ofz+IwSDlXaYCZHhSciUUvThoROo8eXTzfIFU7O/738Rsy+
 P5cYPcB9A9EpKkY+Ycl+OX+7o2JpeJVz29KiW8ldP9FSZpB89cB22MUoG
 ZJbHvF4yt09XCFgT4q7me2Uuy3ckEUlc13ySi+gwMVmJRsJ5tHmZFSSX2 w=;
X-IronPort-AV: E=Sophos;i="5.64,552,1559520000"; d="scan'208";a="837079168"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 16:06:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id CDE71A1DD1; Thu, 26 Sep 2019 16:06:41 +0000 (UTC)
Received: from EX13D06UEE002.ant.amazon.com (10.43.62.117) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 16:06:41 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D06UEE002.ant.amazon.com (10.43.62.117) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 16:06:40 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 16:06:39 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <913e6e6b-189c-d318-7b73-4258d53c80f1@arm.com>
 <2e462fff-ddd6-cc72-b8a8-b825d707e96b@amazon.com>
 <8392c34a-7224-2630-b236-1bd47843587e@arm.com>
From: <hongyax@amazon.com>
Message-ID: <059b2d6c-e79b-d803-21bb-c237b3ed02c5@amazon.com>
Date: Thu, 26 Sep 2019 17:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8392c34a-7224-2630-b236-1bd47843587e@arm.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 00/84] Remove direct map from Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxMzowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IFNvIEkgdW5kZXJz
dGFuZCB0aGlzIGNvcnJlY3RseSwgV2VpJ3Mgc2VyaWVzIGhhcyBubyBidWcgaW4gaXQgYW5kIGNv
dWxkIGJlIAo+IGNvbW1pdHRlZCBhcyBpcyB3aXRob3V0IGJyZWFraW5nIFhlbi4gQW0gSSBjb3Jy
ZWN0Pwo+IAo+IFRoZSByZWFzb24gSSBhbSBhc2tpbmcgdGhhdCBpZiB5b3UgaGF2ZSBhIGZldyBw
YXRjaGVzIHRoYXQgc2F5IGZpeCBsZWFrL2J1Zy4gSWYgCj4gdGhleSBhcmUgYnVnIGluIFdlaSdz
IHNlcmllcywgdGhlbiB0aGV5IHNob3VsZCBiZSBzcXVhc2hlZCBpbiBwYXRjaGVzIAo+IGludHJv
ZHVjaW5nIHRoZW0uCj4gCgpNeSBhZGRpdGlvbmFsIHBhdGNoZXMgZml4ZWQgc2V2ZXJhbCBidWdz
IGZvdW5kIGluIFdlaSdzIHNlcmllcy4gSWYgdGhvc2UgZml4ZXMgCmFyZSBmb2xkZWQgaW4sIFdl
aSdzIHNlcmllcyBjYW4gYmUgY29tbWl0dGVkIHdpdGhvdXQgYnJlYWtpbmcgWGVuLgoKU28sIGl0
IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gY29tbWl0IFdlaSdzIHNlcmllcyBmaXJzdCB3aXRoIHRoZSBm
aXhlcywgdGhlbiBteSAKZXh0cmEgc2VyaWVzIHRvIGFjdHVhbGx5IHJlbW92ZSB0aGUgZGlyZWN0
IG1hcC4KCkhvbmd5YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
