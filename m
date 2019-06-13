Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EACB43441
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 10:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbLGx-0002kQ-EE; Thu, 13 Jun 2019 08:39:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LEkp=UM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbLGv-0002kL-Ta
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 08:39:49 +0000
X-Inumbo-ID: cc5f78ae-8db6-11e9-826c-cf15863a8ac6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc5f78ae-8db6-11e9-826c-cf15863a8ac6;
 Thu, 13 Jun 2019 08:39:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0C1AAC44;
 Thu, 13 Jun 2019 08:39:45 +0000 (UTC)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-14-jgross@suse.com>
 <c2fcade8-8cad-9f02-0f1b-35e0b156ff72@gmail.com>
 <bdc2b540-3218-ffb2-04ce-ea1acdab25c2@suse.com>
 <e38e96d2-1de4-2ae0-e31a-adb96eaa07ce@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <273df2ce-c7e5-6411-a030-2d7e4dcc7198@suse.com>
Date: Thu, 13 Jun 2019 10:39:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e38e96d2-1de4-2ae0-e31a-adb96eaa07ce@gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDYuMTkgMDk6MzQsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gCj4gCj4gT24gMTMuMDYu
MTkgMTA6MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRoYW5rcyBmb3IgdGhlIGhlYWRzIHVw
LCBidXQgSSd2ZSByZWJhc2VkIGFscmVhZHkuIDotKQo+IAo+IE9oLCBncmVhdC4gSSdtIGp1c3Qg
d29uZGVyaW5nIGlmIHlvdSBwdXQgaXQgYWxyZWFkeSBvbiB5b3VyIGdpdGh1Yj8KCmdpdGh1Yi5j
b20vamdyb3NzMS94ZW4gc2NoZWQtdjEtcmViYXNlCgpPbmx5IGNvbXBpbGUgdGVzdGVkIG9uIHg4
NiB1cCB0byBub3csIGJ1dCByZWJhc2Ugd2FzIHJhdGhlciBlYXN5LgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
