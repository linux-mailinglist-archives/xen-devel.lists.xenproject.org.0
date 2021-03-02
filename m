Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F73296AF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 08:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92163.173900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGzlu-0001Hr-Jo; Tue, 02 Mar 2021 07:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92163.173900; Tue, 02 Mar 2021 07:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGzlu-0001HS-Gs; Tue, 02 Mar 2021 07:48:46 +0000
Received: by outflank-mailman (input) for mailman id 92163;
 Tue, 02 Mar 2021 07:48:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4R3f=IA=amazon.de=prvs=688cdcf6b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lGzls-0001HN-O2
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 07:48:44 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83103da2-0679-4a27-afef-ef31bdb0fea2;
 Tue, 02 Mar 2021 07:48:43 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 02 Mar 2021 07:48:37 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id AF490A15CA; Tue,  2 Mar 2021 07:48:35 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.161.146) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 2 Mar 2021 07:48:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 83103da2-0679-4a27-afef-ef31bdb0fea2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614671324; x=1646207324;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=BWwsoGlcNWU1zQsTfXX3ZgSgdwgW2SF2KC6gbDfIXfY=;
  b=GyaiTnSzdKd+R5q7y3LXeTmDIgJECr8hEzU3Nk98qjxWBRWRL2QrQ5MF
   z6DI73B4A9kanXEnkSAoy3hY/wL6ucGXiXo4oEckhPFbExbGFxRVTt5Zu
   qiCjU/cawijGBopyM0wFx6DPUaLQwdofQBBUNSnJAv80+HtHtQhd3bx0H
   0=;
X-IronPort-AV: E=Sophos;i="5.81,216,1610409600"; 
   d="scan'208";a="94286766"
Subject: Re: [PATCH XENSTORE v1 06/10] xenstored: handle port reads correctly
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.co.uk>, Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-7-nmanthey@amazon.de>
 <a840c4fa-148e-7617-20e5-9b286ace2c40@citrix.com>
 <fc383f00-7bf9-6f2f-54ab-b1e66eed419d@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <8e7c8953-f75a-36d2-e853-de4f88fbe01c@amazon.de>
Date: Tue, 2 Mar 2021 08:48:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fc383f00-7bf9-6f2f-54ab-b1e66eed419d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.161.146]
X-ClientProxiedBy: EX13D19UWA003.ant.amazon.com (10.43.160.170) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

T24gMy8yLzIxIDY6MTUgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMjYuMDIuMjEgMTY6
MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDI2LzAyLzIwMjEgMTQ6NDEsIE5vcmJlcnQg
TWFudGhleSB3cm90ZToKPj4+IFRoZSByZWFkIHZhbHVlIGNvdWxkIGJlIGxhcmdlciB0aGFuIGEg
c2lnbmVkIDMyYml0IGludGVnZXIuIEFzIC0xIGlzCj4+PiB1c2VkIGFzIGVycm9yIHZhbHVlLCB3
ZSBzaG91bGQgbm90IHJlbHkgb24gdXNpbmcgdGhlIGZ1bGwgMzIgYml0cy4KPj4+IEhlbmNlLCB3
aGVuIHJlYWRpbmcgdGhlIHBvcnQgbnVtYmVyLCB3ZSBzaG91bGQgbWFrZSBzdXJlIHdlIG9ubHkg
cmV0dXJuCj4+PiB2YWxpZCB2YWx1ZXMuCj4+Pgo+Pj4gVGhpcyBjaGFuZ2Ugc2FuaXR5IGNoZWNr
cyB0aGUgaW5wdXQuCj4+PiBUaGUgaXNzdWUgaXMgdGhhdCB0aGUgdmFsdWUgZm9yIHRoZSBwb3J0
IGlzCj4+PiDCoCAxLiB0cmFuc21pdHRlZCBhcyBhIHN0cmluZywgd2l0aCBhIGZpeGVkIGFtb3Vu
dCBvZiBkaWdpdHMuCj4+PiDCoCAyLiBOZXh0LCB0aGlzIHN0cmluZyBpcyBwYXJzZWQgYnkgYSBm
dW5jdGlvbiB0aGF0IGNhbiBkZWFsIHdpdGgKPj4+IHN0cmluZ3MKPj4+IMKgwqDCoMKgIHJlcHJl
c2VudGluZyA2NGJpdCBpbnRlZ2Vycwo+Pj4gwqAgMy4gQSA2NGJpdCBpbnRlZ2VyIGlzIHJldHVy
bmVkLCBhbmQgd2lsbCBiZSB0cnVuY2F0ZWQgdG8gaXQncyBsb3dlcgo+Pj4gwqDCoMKgwqAgMzJi
aXRzLCByZXN1bHRpbmcgaW4gYSB3cm9uZyBwb3J0IG51bWJlciAoaW4gY2FzZSB0aGUgc2VuZGVy
IG9mCj4+PiB0aGUKPj4+IMKgwqDCoMKgIHN0cmluZyBkZWNpZGVzIHRvIGNyYWZ0IGEgc3VpdGFi
bGUgNjRiaXQgdmFsdWUpLgo+Pj4KPj4+IFRoZSB2YWx1ZSBpcyB0eXBpY2FsbHkgcHJvdmlkZWQg
YnkgdGhlIGtlcm5lbCwgd2hpY2ggaGFzIHRoaXMgdmFsdWUKPj4+IGhhcmQKPj4+IGNvZGVkIGlu
IHRoZSBwcm9wZXIgcmFuZ2UuIEFzIHdlIHVzZSB0aGUgZnVuY3Rpb24gc3RydG91bCwgbm9uLWRp
Z2l0Cj4+PiBjaGFyYWN0ZXIgYXJlIGNvbnNpZGVyZWQgYXMgZW5kIG9mIHRoZSBpbnB1dCwgYW5k
IGhlbmNlIGRvIG5vdCByZXF1aXJlCj4+PiBjaGVja2luZy4gVGhlcmVmb3JlLCB0aGlzIGNoYW5n
ZSBvbmx5IGNvdmVycyB0aGUgY29ybmVyIGNhc2UgdG8gbWFrZQo+Pj4gc3VyZSB3ZSBzdGF5IGlu
IHRoZSAzMiBiaXQgcmFuZ2UuCj4+Pgo+Pj4gVGhpcyBidWcgd2FzIGRpc2NvdmVyZWQgYW5kIHJl
c29sdmVkIHVzaW5nIENvdmVyaXR5IFN0YXRpYyBBbmFseXNpcwo+Pj4gU2VjdXJpdHkgVGVzdGlu
ZyAoU0FTVCkgYnkgU3lub3BzeXMsIEluYy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0
IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPj4+IFJldmlld2VkLWJ5OiBUaG9tYXMgRnJp
ZWJlbCA8ZnJpZWJlbHRAYW1hem9uLmRlPgo+Pj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8
amdyYWxsQGFtYXpvbi5jby51az4KPj4KPj4gUG9ydCBudW1iZXJzIGFyZSBjdXJyZW50bHkgbGlt
aXRlZCBhdCAyXjE3LCB3aXRoIGVhc3kgZXh0ZW5zaW9uIHRvIDJeMjkKPj4gKGlpcmMpLCBidXQg
dGhlIGVudGlyZSBldmVudCBjaGFubmVsIGluZnJhc3RydWN0dXJlIHdvdWxkIGhhdmUgdG8KPj4g
dW5kZXJnbyBhbm90aGVyIHJlZGVzaWduIHRvIGdldCBiZXlvbmQgdGhhdC4KPj4KPj4gSSB0aGlu
ayB3ZSBjYW4gcmVhc29uYWJseSBtYWtlIGFuIEFCSSBzdGF0ZW1lbnQgc2F5aW5nIHRoYXQgYSBw
b3J0Cj4+IG51bWJlciB3aWxsIG5ldmVyIGV4Y2VlZCAyXjMxLsKgIFRoaXMgaXMgYWxyZWFkeSBw
c2V1ZG8tZW5jb2RlZCBpbiB0aGUKPj4gZXZ0Y2huX3BvcnRfb3JfZXJyb3JfdCBtb3V0aGZ1bC4K
Pgo+IEkgYWdyZWUuIFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoaXMgcGF0Y2guCgpJIHVuZGVyc3Rh
bmQsIGFuZCBhbSBmaW5lIHdpdGggZHJvcHBpbmcgdGhpcyBwYXRjaC4KCk91dCBvZiBjdXJpb3Np
dHksIGlmIHRoZSBhY3R1YWwgbGltaXQgaXMgbG93ZXIgdGhhbiB3aGF0IHRoZSBwYXRjaApjdXJy
ZW50bHkgZW5mb3JjZXMsIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gYWRhcHQgdGhlIGJvdW5kIGNo
ZWNrIHRvIHRoYXQKbnVtYmVyPwoKQmVzdCwKTm9yYmVydAoKPgo+Cj4gSnVlcmdlbgo+CgoKCgpB
bWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDEx
NyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhh
biBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBI
UkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


