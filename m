Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A93718F301
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:40:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGKT7-0001bJ-Lq; Mon, 23 Mar 2020 10:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPxt=5I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGKT6-0001bE-Ek
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:38:04 +0000
X-Inumbo-ID: 5fe6d642-6cf2-11ea-bec1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fe6d642-6cf2-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 10:38:04 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id z65so15657025ede.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 03:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5tOBblgPbhOmkNy1bCkSMR4/tm/e0aveih9NzDtEH3o=;
 b=IhOZnIN8hPeGgDW1LlvaJRj49GmAoDHFXICbed4bK9JqhDSmzVbqcupEiLzLLxL/Ub
 UZU4qeAMcy6cNqCMUJ7m4NgAhcboxaq9bd1pS/jOjRQFT2yuvOUhLt+z0T7Z65VzBsr2
 LhSLLjlBOR3cqPR0f1BBFJWtzzlc4eDQi/X4MDL1/Hi9OlBSg3oBikedVX5J26Szj3ZA
 Y1390pgtBd9ATO20RMfXwgIbt6/seIMun2j8thRHkR786pjfVF9YCDYw0kB0P4UWs7SV
 19U8yEJ/tvW7xtqxuo+1ylG2bzfpaD8sl9YFHU0IJODrlgGorLsiTJIaOnSixMnIUo56
 gBwg==
X-Gm-Message-State: ANhLgQ06QePLzpOQjjzOyCkUFWSo6SKs8nBXpIkx0NYb7K2gTzPNNtyR
 SF/4+JACKoHT0E19ncYaSbI=
X-Google-Smtp-Source: ADFU+vuly3W/yQHw6/xe2K3J3fKCBrnh5zlDpNVcXmEtGkzvOzTMcoPDWNC2vtqS3a3vIr1Pf1lRAA==
X-Received: by 2002:a17:906:784c:: with SMTP id
 p12mr19259117ejm.296.1584959883169; 
 Mon, 23 Mar 2020 03:38:03 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id z23sm1009573edq.73.2020.03.23.03.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 03:38:02 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9b78b2fc-0328-686d-1493-3b03cfbceac0@xen.org>
Date: Mon, 23 Mar 2020 10:38:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-10-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiAmIEphbiwKCk9uIDI2LzAyLzIwMjAgMTI6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2MgYi9kb2NzL21p
c2MvaHlwZnMtcGF0aHMucGFuZG9jCj4gaW5kZXggMWZhZWJjY2NiYy4uYjRhNWI2MDg2ZSAxMDA2
NDQKPiAtLS0gYS9kb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jCj4gKysrIGIvZG9jcy9taXNj
L2h5cGZzLXBhdGhzLnBhbmRvYwo+IEBAIC0xNTIsMyArMTUyLDEyIEBAIFRoZSBtYWpvciB2ZXJz
aW9uIG9mIFhlbi4KPiAgICMjIyMgL2J1aWxkaW5mby92ZXJzaW9uL21pbm9yID0gSU5URUdFUgo+
ICAgCj4gICBUaGUgbWlub3IgdmVyc2lvbiBvZiBYZW4uCj4gKwo+ICsjIyMjIC9wYXJhbXMvCj4g
Kwo+ICtBIGRpcmVjdG9yeSBvZiBydW50aW1lIHBhcmFtZXRlcnMuCj4gKwo+ICsjIyMjIC9wYXJh
bXMvKgo+ICsKPiArVGhlIGluZGl2aWR1YWwgcGFyYW1ldGVycy4gVGhlIGRlc2NyaXB0aW9uIG9m
IHRoZSBkaWZmZXJlbnQgcGFyYW1ldGVycyBjYW4gYmUKPiArZm91bmQgaW4gYGRvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLnBhbmRvY2AuCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4u
bGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4gaW5kZXggYTQ5N2Y2YTQ4ZC4uMDA2MWE4
ZGZlYSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3hlbi5sZHMuUwo+IEBAIC04OSw2ICs4OSwxMSBAQCBTRUNUSU9OUwo+ICAgICAgICAg
IF9fc3RhcnRfc2NoZWR1bGVyc19hcnJheSA9IC47Cj4gICAgICAgICAgKiguZGF0YS5zY2hlZHVs
ZXJzKQo+ICAgICAgICAgIF9fZW5kX3NjaGVkdWxlcnNfYXJyYXkgPSAuOwo+ICsKPiArICAgICAg
IC4gPSBBTElHTig4KTsKCkFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgYW5zd2VyLiBJIG5vdGljZWQg
dGhhdCBKYW4gYXNrZWQgdGhlIGZvbGxvd2luZyAKcXVlc3Rpb24gb24gdjU6CgoiRG8geW91IHJl
YWxseSBuZWVkIDgtYnl0ZSBhbGlnbm1lbnQgZXZlbiBvbiAzMi1iaXQgQXJtPyIKCldlIGZvcmJp
ZCB1bmFsaWduZWQgYWNjZXNzIG9uIDMyLWJpdCBBcm0gKGFuZCB1bmFsaWduZWQgYWNjZXNzIHNo
b3VsZCBiZSAKYXZvaWRlZCBvbiA2NC1iaXQpLCBzbyBpZiB0aGUgc3RydWN0dXJlIGNvbnRhaW5z
IGEgNjQtYml0IHR5cGUsIHRoZW4gd2UgCmRlZmluaXRlbHkgbmVlZCB0aGUgZGF0YSB0byBiZSA4
LWJ5dGUgYWxpZ25lZC4KCldoYXQgaXMgdGhlIGV4cGVjdGVkIGFsaWdubWVudCBvZiB0aGUgc3Ry
dWN0dXJlPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
