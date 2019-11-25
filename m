Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0D108B7D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:17:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZBOf-0002wi-Bt; Mon, 25 Nov 2019 10:15:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZBOd-0002wd-Np
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 10:15:07 +0000
X-Inumbo-ID: 73ba0809-0f6c-11ea-a38c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73ba0809-0f6c-11ea-a38c-12813bfff9fa;
 Mon, 25 Nov 2019 10:15:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 654C1B339;
 Mon, 25 Nov 2019 10:15:05 +0000 (UTC)
To: Andreas Kinzler <hfp@posteo.de>
References: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
 <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
 <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
 <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
 <e628dd1c-dd2b-76e0-6735-5785361756a1@posteo.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84babdfb-3d85-38b9-5a39-a2d0d8cb4439@suse.com>
Date: Mon, 25 Nov 2019 11:15:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e628dd1c-dd2b-76e0-6735-5785361756a1@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel
 platforms
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTEuMjAxOSAwMDoxMCwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IEJUVzogWGVvbiBF
LTIxMzYgQCBDMjQyIGhhcyA4MDg2OjNlY2EgYXMgSUQuIE9uZSBuZWVkcyB0byBjaGVjayB3aXRo
IAo+IEludGVsIHdoaWNoIGNvbWJpbmF0aW9ucyBhcmUgcmVhbGx5IGFmZmVjdGVkLgoKQXJlIHlv
dSBzYXlpbmcgeW91IG9ic2VydmVkIHRoZSBzYW1lIGlzc3VlIG9uIHN1Y2ggYSAoc2VydmVyIHBy
b2Nlc3NvcikKc3lzdGVtIGFzIHdlbGw/IE5laXRoZXIgaXRzIGRhdGFzaGVldCBub3IgaXRzIHNw
ZWNpZmljYXRpb24gdXBkYXRlCih3aGljaCBJIHNwZWNpZmljYWxseSBkb3dubG9hZGVkIGFuZCBs
b29rZWQgdGhyb3VnaCBqdXN0IGJlY2F1c2Ugb2YgeW91cgpyZW1hcmspIGhhdmUgYW55IG1lbnRp
b24gb2YgYSBzaW1pbGFyIGlzc3VlLiBJIGFsc28gdGFrZSBpdCB0aGF0IHRoZQpjb2RlIGNvbW1l
bnQgaW5oZXJpdGVkIGZyb20gTGludXggc2F5cyAiU29DcyIgZm9yIGEgcmVhc29uLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
