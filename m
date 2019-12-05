Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C309114487
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 17:13:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ictic-0003uV-63; Thu, 05 Dec 2019 16:11:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WmuU=Z3=ts.fujitsu.com=alan.robinson@srs-us1.protection.inumbo.net>)
 id 1ictia-0003uK-A4
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 16:11:04 +0000
X-Inumbo-ID: d51afd36-1779-11ea-8231-12813bfff9fa
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.3])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d51afd36-1779-11ea-8231-12813bfff9fa;
 Thu, 05 Dec 2019 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1575562262; i=@ts.fujitsu.com;
 bh=QmxsgfDffuawxriEzOKU24kDQhP8kEcCJHv0nlEU9OY=;
 h=Date:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
 Content-Type:In-Reply-To:From;
 b=CMURLgWYvyt+Q+8d9HF37kUjtUcE0GIbuLA/JV4p6MBSEnRZ0lwrO8RwUo05zl52a
 tSTKxIin/aRd3vmueM3NNcUvLsGjo3CzRJV0X8BThml7JXyHi10jDMI1VKauzaX3pp
 CdnpP3B09tJ7iX0qUkrbGm11rJDTsYrWoanZUdoPc7EeHpccWkARwvvrzY6aUAS9Qd
 vjezTseHvpSj4qbpwVimeEhg1C5oltmuKdNs9P0ToGzgNp0fQOIa0wLHw8xZOU9ehk
 pGNKSjYQXqvhqEs4qpmx9Vz/EyV6ElgUuINRYZWTas7/pTImFIHn/+IcgHU7PskIT4
 oLe0/EWMqC87Q==
Received: from [46.226.52.103] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 9B/5B-12117-51C29ED5;
 Thu, 05 Dec 2019 16:11:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRWlGSWpSXmKPExsViZ8MxRVdU52W
 swZrtnBaLH+9it/i55yGbxYzzi1ktPq4Rt/i+ZTKTA6vH68kTGD0Of7jC4rF+y1UWj9O3ZrEF
 sESxZuYl5VcksGZsOfOVueAxc8XmnyuZGxjbmLsYuTiEBGYzSrw78JKti5ETyCmV6Pp8hx3EZ
 hFQkVh95AAriC0ioCzx+flKsAZmgYuMEpsuH2PsYuTgEBaIkrh8UgzE5BUwlvizyg5ijJrEwt
 0LWCFsa4mNm0+ygNi8AoISJ2c+AbOZBbQkbvx7yQTSyiwgLbH8HwdImFPARuJ96zGwEgkBGYn
 fK7+DXSYKdMG6xScZQWw2ASOJpX9+sk9gFJiFZOosJFNnIUxdwMi8itE8qSgzPaMkNzEzR9fQ
 wEDX0NBI19DSWNfIXC+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMPRTCg5K72Ds/
 /ZW7xCjJAeTkijvYo2XsUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeAXUgXKCRanpqRVpmTnAOI
 RJS3DwKInwCmgDpXmLCxJzizPTIVKnGHU5nna0LWEWYsnLz0uVEucNBCkSACnKKM2DGwFLCZc
 YZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM6aAFN4cnMK4Hb9AroCCagIw5UPgM5oiQRISXV
 wFTQlJNr/9i9dYn6MqVZriKn5jLIxG/ZkHSsbc5h9hRv9btpQQKfNURrpKpOi32bvPPRrORHK
 h+nbJqzKWX6g/N7t328eM9LfMN7uf8hy97Mq31Wc+Nknu4Vpl2XOrQU1R/4VVSYH5t/84WI6+
 aNQXuPK7jdNGk8xryz37rkrLfa2+OZype+5JtK65+PuHLW+O4HWU4b+yKZm7t6lq4zLGCtEHo
 z/4q5ZYtnr/6Ni2JzFAPKO65G/bvB+YehVqt3pbvoRvuYJsnqmfEhXnps1XUzg2K35WSazo2z
 23blcHukAP/cmydvlDM0L30VUx/GFvzpwLkP9kvTc14rFu67MfG3s6hZ7sN+v76rt/7LSymxF
 GckGmoxFxUnAgAS9ptXhAMAAA==
X-Env-Sender: Alan.Robinson@ts.fujitsu.com
X-Msg-Ref: server-32.tower-267.messagelabs.com!1575562260!153199!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28809 invoked from network); 5 Dec 2019 16:11:01 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-32.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Dec 2019 16:11:01 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id xB5GAux7019923;
 Thu, 5 Dec 2019 16:10:56 GMT
Received: by sanpedro.mch.fsc.net (Postfix, from userid 5004)
 id A1E599D00C7F; Thu,  5 Dec 2019 17:10:46 +0100 (CET)
Date: Thu, 5 Dec 2019 17:10:46 +0100
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191205161046.GA24119@ts.fujitsu.com>
References: <34075b30-a9a1-4c02-5c6d-bdd73aeec5d0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34075b30-a9a1-4c02-5c6d-bdd73aeec5d0@suse.com>
X-sent-by-me: robin@sanpedro
User-Agent: Mutt/1.9.3 (2018-01-21)
From: Alan.Robinson@ts.fujitsu.com (Alan Robinson)
Subject: Re: [Xen-devel] [PATCH] x86: don't offer Hyper-V option when "PV
 Shim Exclusive"
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
Reply-To: Alan.Robinson@ts.fujitsu.com
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDQ6NDI6MDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gCj4gVGhpcyBvbmx5IGFkZGVkIGRlYWQgY29kZS4gVXNlICJpZiIgaW5zdGVhZCBvZiAi
ZGVwZW5kcyBvbiIgdG8gbWFrZQo+IChoYWxmd2F5KSBjbGVhciB0aGF0IG90aGVyIGd1ZXN0IG9w
dGlvbnMgc2hvdWxkIGFsc28gZ28gaW4gdGhhZSBzYW1lCgpzL3RoYWUvdGhlLwoKPiBibG9jay4g
TW92ZSB0aGUgb3B0aW9uIGRvd24gc3VjaCB0aGF0IHRoZSBzaGltIHJlbGF0ZWQgb3B0aW9ucyBn
ZXQKPiBwcmVzZW50ZWQgZmlyc3QsIGF2b2lkaW5nIHRvIGFzayB0aGUgcXVlc3Rpb24gd2hlbiB0
aGUgYW5zd2VyIG1heSBlbmQKPiB1cCBiZWluZyBkaXNjYXJkZWQuCj4gCj4gV2hpbGUgaW4gdGhl
IG5laWdoYm9yaG9vZCBhbHNvIGJyaW5nIFBWX1NISU1fRVhDTFVTSVZFIGludG8gbW9yZQo+ICJj
YW5vbmljYWwiIHNoYXBlLgo+IAoKQWxhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
