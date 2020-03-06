Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0017B729
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 08:05:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA70Q-0007Tr-45; Fri, 06 Mar 2020 07:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rXHt=4X=ts.fujitsu.com=alan.robinson@srs-us1.protection.inumbo.net>)
 id 1jA70O-0007Th-2d
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 07:02:44 +0000
X-Inumbo-ID: 7863c6a8-5f78-11ea-b52f-bc764e2007e4
Received: from mail1.bemta26.messagelabs.com (unknown [85.158.142.112])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7863c6a8-5f78-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1583478160; i=@ts.fujitsu.com;
 bh=Il/fnJc8JMctUBnhAPTK864v5Coq4W3ulmjjR+orYsY=;
 h=Date:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
 Content-Type:In-Reply-To:From;
 b=TjdrahVfeSe8uLeNTN18FP6vh1UtOJjGKHUZbu3/jPl3nek+5cBY29/2khFPniyJo
 L0W8bHC/SBfMhT9OH5tOouwsTRYeYgWGtGudZjNeWCm4KDcguK/ok9lYvkYcACGqDg
 bRCcIseU9/+yJ2P7SIvciZAJ3ohtoABqH4arIrHbYdHzTkgNrc1YsS3+tqGMYNECqL
 xDiig54ECiKxabp51leHQQZO2V3mBrflr+8qwB7aNhbE8mwtepGPbZG8Y3WFTvZrX4
 vOxXKjdFaSenC4HAv4VkJLuQOlwXO9VhDN+Mubt5DjAFf3WG8Gl0gMfhnivkhRZpT0
 eo0NjBx5x1N4w==
Received: from [100.113.6.112] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 5A/72-62111-F85F16E5;
 Fri, 06 Mar 2020 07:02:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRWlGSWpSXmKPExsViZ8MRotv/NTH
 OYMJmUYvFj3exW8zvOMRkcfHaKyaLn3sesll8nj2ZzWLZ4qeMFkuW/GC0ODrpAbPFjPOLWS1W
 r4u3WP56BovF1+ZVjBYf14hbfN8ymcmBz2PFhS5Wj/4ls5g8Xk+ewOix/YmIx6ZVnWwehz9cY
 fH4+PQWi8f6LVdZPJrmbGDxOH1rFlsAVxRrZl5SfkUCa8a7B9OZCi6xVOy9Mpe5gfEVcxcjF4
 eQwGxGidM3+4AcTiCnVGJ322VWEJtFQEXiau90oDgHh4iAtsTR50Yg9cwC91gk3q57wghSIyz
 gJXF8/mU2EJtXwFjixZJ2Fog5ahILdy9gBWngFfjOIrHs7A1GiESCxOT/y6EaBCVOznwC1sAs
 oCVx499LJpBlzALSEsv/cYCEOQXMJNYt6QNrlRCQkfi98jtYq6iAssS6xSfB4mwCRhJL//xkn
 8AoOAvJ1FlIps5CmLqAkXkVo2VSUWZ6RkluYmaOrqGBga6hobGuma6hqYFeYpVukl5qqW5yal
 5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMFpTCtmm7WC8sva93iFGSQ4mJVHeHfGJcUJ8SfkplRm
 JxRnxRaU5qcWHGGU4OJQkeDk+A+UEi1LTUyvSMnOAiQMmLcHBoyTCKwVMHkK8xQWJucWZ6RCp
 U4y6HJevz1vELMSSl5+XKiXO+wdkhgBIUUZpHtwIWBK7xCgrJczLyMDAIMRTkFqUm1mCKv+KU
 ZyDUUmY1xZkFU9mXgncpldARzABHXH/TjzIESWJCCmpBqarh33z/vw+s+jEj2k5T6Zd4rx2KH
 Xir4j9njHOryK8gl/7hHif8P9+Mpp77fZk8w3fCs4q3t4VUr20b7GAg3Oy94TXQX3LSk899mS
 2urIkYKYbg8Ktf/XijnXPG661h3Jl7D37ZNnV2NfMchO72jP2zDNTSJtmy7mWMSjXMex64LSr
 wtu2/Ll2amnVqenJ/puWHhKp28qomva3IjDuw6ZPHmVp2mGarW2bl4Wf2lj3JcXdwrp9HccZn
 wnfmI6HsPGln1l2d5PL+6cn33MKvL7KoeFqe0Kv79pff74d+b8evpu25uDlIl+/y1+mSkzcM/
 PBaYErr5gj1N3Sfwqmd3j/nHj9VsQCt4+Bv1YEqq4yVWIpzkg01GIuKk4EAJmIlAndAwAA
X-Env-Sender: Alan.Robinson@ts.fujitsu.com
X-Msg-Ref: server-15.tower-238.messagelabs.com!1583478158!1135512!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8473 invoked from network); 6 Mar 2020 07:02:39 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-15.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Mar 2020 07:02:39 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 02672cfs008263;
 Fri, 6 Mar 2020 07:02:38 GMT
Received: by sanpedro.mch.fsc.net (Postfix, from userid 5004)
 id 012BA9D01064; Fri,  6 Mar 2020 08:02:29 +0100 (CET)
Date: Fri, 6 Mar 2020 08:02:29 +0100
To: "pdurrant@amzn.com" <pdurrant@amzn.com>
Message-ID: <20200306070229.GA24998@ts.fujitsu.com>
Mail-Followup-To: Alan.Robinson@ts.fujitsu.com,
 "pdurrant@amzn.com" <pdurrant@amzn.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305124504.3564-6-pdurrant@amzn.com>
X-sent-by-me: robin@sanpedro
User-Agent: Mutt/1.9.3 (2018-01-21)
From: Alan.Robinson@ts.fujitsu.com (Alan Robinson)
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSB0eXBvLi4uCgpPbiBUaHUsIE1hciAwNSwgMjAyMCBhdCAwMTo0NTowM1BNICswMTAwLCBwZHVy
cmFudEBhbXpuLmNvbSB3cm90ZToKPiAKPiBQR0NfZXh0cmEgcGFnZXMgYXJlIGludGVuZGVkIHRv
IGhvbGQgZGF0YSBzdHJ1Y3R1cmVzIHRoYXQgYXJlIGFzc29jaWF0ZWQKPiB3aXRoIGEgZG9tYWlu
IGFuZCBteSBiZSBtYXBwZWQgYnkgdGhhdCBkb21haW4uIFRoZXkgc2hvdWxkIG5vdCBiZSB0cmVh
dGVkCgpzL215L21heS8KCj4gYXMgJ25vcm1hbCcgZ3Vlc3QgcGFnZXMgKGkuZS4gUkFNIG9yIHBh
Z2UgdGFibGVzKS4gSGVuY2UsIGluIG1hbnkgY2FzZXMKPiB3aGVyZSBjb2RlIGN1cnJlbnRseSB0
ZXN0cyBpc194ZW5faGVhcF9wYWdlKCkgaXQgc2hvdWxkIGFsc28gY2hlY2sgZm9yCj4gdGhlIFBH
Q19leHRyYSBiaXQgaW4gJ2NvdW50X2luZm8nLgo+IAo+IFRoaXMgcGF0Y2ggdGhlcmVmb3JlIGRl
ZmluZXMgaXNfc3BlY2lhbF9wYWdlKCkgdG8gY292ZXIgYm90aCBjYXNlcyBhbmQKPiBjb252ZXJ0
cyB0ZXN0cyBpZiBpc194ZW5faGVhcF9wYWdlKCkgdG8gaXNfc3BlY2lhbF9wYWdlKCkgd2hlcmUK
PiBhcHByb3ByaWF0ZS4KPiAKCkFsYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
