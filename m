Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB1331B4
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXnYC-0005XY-IE; Mon, 03 Jun 2019 14:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXnYB-0005Wj-G0
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:02:59 +0000
X-Inumbo-ID: 4924e54c-8608-11e9-ba63-7392aa076db5
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4924e54c-8608-11e9-ba63-7392aa076db5;
 Mon, 03 Jun 2019 14:02:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 59E6130747CA; Mon,  3 Jun 2019 17:02:55 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4F296306E477;
 Mon,  3 Jun 2019 17:02:55 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-3-git-send-email-andrew.cooper3@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <b36620b6-1936-0de9-9785-27808bfaf53e@bitdefender.com>
Date: Mon, 3 Jun 2019 17:02:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559564728-17167-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH 2/5] xen/vm-event: Expand vm_event_*
 spinlock macros and rename the lock
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlc2Ugc2VydmUgbm8g
cHVycG9zZSwgYnV0IHRvIGFkZCB0byB0aGUgY29uZ25pdGl2ZSBsb2FkIG9mIGZvbGxvd2luZwo+
IHRoZSBjb2RlLiAgUmVtb3ZlIHRoZSBsZXZlbCBvZiBpbmRpcmVjdGlvbi4KPiAKPiBGdXJ0aGVy
bW9yZSwgdGhlIGxvY2sgcHJvdGVjdHMgYWxsIGRhdGEgaW4gdm1fZXZlbnRfZG9tYWluLCBtYWtp
bmcKPiByaW5nX2xvY2sgYSBwb29yIGNob2ljZSBvZiBuYW1lLgo+IAo+IEZvciB2bV9ldmVudF9n
ZXRfcmVzcG9uc2UoKSBhbmQgdm1fZXZlbnRfZ3JhYl9zbG90KCksIGZvbGQgdGhlIGV4aXQKPiBw
YXRocyB0byBoYXZlIGEgc2luZ2xlIHVubG9jaywgYXMgdGhlIGNvbXBpbGVyIGNhbid0IG1ha2Ug
dGhpcwo+IG9wdGltaXNhdGlvbiBpdHNlbGYuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
