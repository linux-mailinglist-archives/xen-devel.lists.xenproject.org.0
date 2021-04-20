Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB2365109
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 05:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113269.215814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYhEy-0003od-MP; Tue, 20 Apr 2021 03:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113269.215814; Tue, 20 Apr 2021 03:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYhEy-0003oE-Is; Tue, 20 Apr 2021 03:39:56 +0000
Resent-Date: Tue, 20 Apr 2021 03:39:56 +0000
Resent-Message-Id: <E1lYhEy-0003oE-Is@lists.xenproject.org>
Received: by outflank-mailman (input) for mailman id 113269;
 Tue, 20 Apr 2021 03:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6lN=JR=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1lYhEy-0003o9-2u
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 03:39:56 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4f18e9d-6f80-4657-8471-ea9f6300e638;
 Tue, 20 Apr 2021 03:39:54 +0000 (UTC)
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618889985395467.22472703895255;
 Mon, 19 Apr 2021 20:39:45 -0700 (PDT)
Resent-From: 
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f4f18e9d-6f80-4657-8471-ea9f6300e638
ARC-Seal: i=1; a=rsa-sha256; t=1618889987; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QIvzL7usUtL4dhzHiGEA89NB6uW9/CAjwXCsJ0uPg34vtTBsZNO22e0mo0TpcVihcLwFztF0XTlm1XJhbymki0Kj7knkssuNQgzw0DxiE9EzCSleSNRJcqy6K6vN4tyTT3g2hIvsr+GXYhETrKahWZMiNr3FL1oAMXRg7ytnvVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1618889987; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=k/i9pMyzbbL66W8AobDSTWTw23Y5fGWmoXJcFgFc2gg=; 
	b=AVnZji1QLw9DS+HfY73wOiA+jmIgvAXaqR/OxXNhM7BJDS08ZSfz48a+AGoPqSto9OS3KKsH6QRMiZhfA2tCdh9hGRBQ8o/gWHbcBJaCjcebHuaVNPGs8Wg2cWNPGS5bp0owbhSAjCL4HdU+xzLwL6UfDaqeX66qX3zqMqI2TRM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
In-Reply-To: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using MAP_FIXED
Message-ID: <161888998361.15979.8661085658302494664@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org, mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com, igor.druzhinin@citrix.com
Date: Mon, 19 Apr 2021 20:39:45 -0700 (PDT)
X-ZohoMailClient: External

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE4ODg5NzAyLTEzMTA0LTEt
Z2l0LXNlbmQtZW1haWwtaWdvci5kcnV6aGluaW5AY2l0cml4LmNvbS8KCgoKSGksCgpUaGlzIHNl
cmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0
IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDE2
MTg4ODk3MDItMTMxMDQtMS1naXQtc2VuZC1lbWFpbC1pZ29yLmRydXpoaW5pbkBjaXRyaXguY29t
ClN1YmplY3Q6IFtQQVRDSF0geGVuLW1hcGNhY2hlOiBhdm9pZCBhIHJhY2Ugb24gbWVtb3J5IG1h
cCB3aGlsZSB1c2luZyBNQVBfRklYRUQKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2Ny
aXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZy
b20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAg
ICAgICAgIHBhdGNoZXcvMTYxODg4OTcwMi0xMzEwNC0xLWdpdC1zZW5kLWVtYWlsLWlnb3IuZHJ1
emhpbmluQGNpdHJpeC5jb20gLT4gcGF0Y2hldy8xNjE4ODg5NzAyLTEzMTA0LTEtZ2l0LXNlbmQt
ZW1haWwtaWdvci5kcnV6aGluaW5AY2l0cml4LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2gg
J3Rlc3QnCjMxMDI1MTkgeGVuLW1hcGNhY2hlOiBhdm9pZCBhIHJhY2Ugb24gbWVtb3J5IG1hcCB3
aGlsZSB1c2luZyBNQVBfRklYRUQKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBBdXRob3Ig
ZW1haWwgYWRkcmVzcyBpcyBtYW5nbGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6
IElnb3IgRHJ1emhpbmluIHZpYSA8cWVtdS1kZXZlbEBub25nbnUub3JnPgoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAyMSBsaW5lcyBjaGVja2VkCgpDb21taXQgMzEwMjUxOTlhMWI0ICh4
ZW4tbWFwY2FjaGU6IGF2b2lkIGEgcmFjZSBvbiBtZW1vcnkgbWFwIHdoaWxlIHVzaW5nIE1BUF9G
SVhFRCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0
IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUg
YXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTYxODg4OTcwMi0xMzEwNC0xLWdpdC1zZW5kLWVt
YWlsLWlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1l
c3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRw
czovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1k
ZXZlbEByZWRoYXQuY29t

