Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2016A382
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:08:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6AcT-0000mF-Ju; Mon, 24 Feb 2020 10:05:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6AcR-0000m8-6y
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:05:43 +0000
X-Inumbo-ID: 36da2120-56ed-11ea-8ad8-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36da2120-56ed-11ea-8ad8-12813bfff9fa;
 Mon, 24 Feb 2020 10:05:42 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j17so11228086edp.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 02:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uRjWhie1GVywUOn64ya6qIdUxkXwudhdTyeYgz6QpRs=;
 b=QwrVF0VKSKDtz8ojDiaPwp2KwP5BIgpplfJaClbngnmlbxNdR91wNteNilj/fHc/9O
 NvOB5Uzu6l2I1xvOGtqtNumjnp+kC6jR8B+yI1MzSqeBS/0uJvwt+SD83FjcRcrus/Ck
 wvMm1466hX+qukAWE2sbjtPpn7A4Z93VmeOqwrWdgootLOh3W87+dCuIzaZaaJmZ/rar
 Bvy2ARGr8r8ndAhGkTljoNO+WUo9PHVXhKiuFYTHMdIer2AcK4/KNePdwz9ZhqxjFtz5
 aYuAer9TIVhcq84oQdvnxkPteCdUimvGalrsaN3gOIuizfoksNIMnfXy8Um2jpdqRB3P
 eIeQ==
X-Gm-Message-State: APjAAAX9XZ1J58lRW5dXayneJ1HHnMi++cEny14T2LqtKG0j0h7Co05G
 y0RbFpvM9bTnq7J+BHbwlgI=
X-Google-Smtp-Source: APXvYqx0MhFSqG+ZAGTdyAnraSTtDdb9m0AcHMuBs6j9fOmUPE4E8vpxij9jzYacEkTtfzSMDYmneg==
X-Received: by 2002:a50:f787:: with SMTP id h7mr30754786edn.301.1582538741290; 
 Mon, 24 Feb 2020 02:05:41 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id cf2sm963660edb.2.2020.02.24.02.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 02:05:40 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-3-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8c0dcb31-cbbd-4910-b4a5-8bb11a1158cf@xen.org>
Date: Mon, 24 Feb 2020 10:05:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224084400.94482-3-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAyNC8wMi8yMDIwIDA4OjQ0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4g
QWxsb3cgYSBDUFUgYWxyZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxz
byBsb2NrIGl0IGluCj4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVh
ZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxlciAo
aWU6IENQVSkgaW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+IGFjY2Vzc2VzIGlzIHJlcXVp
cmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2UuCj4gCj4gSW4gb3JkZXIgdG8g
ZG8gdGhpcyByZXNlcnZlIDEyYml0cyBvZiB0aGUgbG9jaywgdGhpcyBhbGxvd3MgdG8gc3VwcG9y
dAo+IHVwIHRvIDQwOTYgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFzayB0byAy
IGJpdHM6IG9uZSB0bwo+IHNpZ25hbCB0aGVyZSBhcmUgcGVuZGluZyB3cml0ZXJzIHdhaXRpbmcg
b24gdGhlIGxvY2sgYW5kIHRoZSBvdGhlciB0bwo+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25lZCBp
biB3cml0ZSBtb2RlLgo+IAo+IFRoaXMgcmVkdWNlcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgY29u
Y3VycmVudCByZWFkZXJzIGZyb20gMTY3NzcyMTYgdG8KPiAyNjIxNDQsIEkgdGhpbmsgdGhpcyBz
aG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4gY2FuIGJlIGV4
cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRv
bWljCj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPiAKPiBGaXhlczogNTg3MmM4M2I0
MmM2MDggKCdzbXA6IGNvbnZlcnQgdGhlIGNwdSBtYXBzIGxvY2sgaW50byBhIHJ3IGxvY2snKQo+
IFJlcG9ydGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmVwb3J0ZWQt
Ynk6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNl
IHYyOgo+ICAgLSBVc2UgYXRvbWljX2FuZCB0byBjbGVhciB0aGUgd3JpdGVycyBwYXJ0IG9mIHRo
ZSBsb2NrIHdoZW4KPiAgICAgd3JpdGUtdW5sb2NraW5nLgo+ICAgLSBSZWR1Y2Ugd3JpdGVyLXJl
bGF0ZWQgYXJlYSB0byAxNGJpdHMuCj4gICAtIEluY2x1ZGUgeGVuL3NtcC5oIGZvciBBcm02NC4K
Ck9PSSwgaXMgaXQgdG8gdXNlIHNtcF9wcm9jZXNzb3JfaWQoKT8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
