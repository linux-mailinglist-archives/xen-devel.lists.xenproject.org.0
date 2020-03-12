Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61B1834F9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:29:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPj3-0005OR-9Z; Thu, 12 Mar 2020 15:26:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCPj1-0005OM-2P
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:26:19 +0000
X-Inumbo-ID: d02a51d4-6475-11ea-b1ba-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d02a51d4-6475-11ea-b1ba-12813bfff9fa;
 Thu, 12 Mar 2020 15:26:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C0E1AD5C;
 Thu, 12 Mar 2020 15:26:15 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
Date: Thu, 12 Mar 2020 16:26:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158402065414.753.15785539969715690913.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAyMCAxNDo0NCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gLS0tIGEveGVuL2Nv
bW1vbi9zY2hlZC9jcmVkaXQyLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYwo+
IEBAIC0yMzQsNyArMjM0LDcgQEAKPiAgICogdW5pdHMgZG9lcyBub3QgY29uc3VtZSBjcmVkaXRz
LCBhbmQgaXQgbXVzdCBiZSBsb3dlciB0aGFuIHdoYXRldmVyCj4gICAqIGFtb3VudCBvZiBjcmVk
aXQgJ3JlZ3VsYXInIHVuaXQgd291bGQgZW5kIHVwIHdpdGguCj4gICAqLwo+IC0jZGVmaW5lIENT
Q0hFRDJfSURMRV9DUkVESVQgICAgICAgICAgKC0oMVU8PDMwKSkKPiArI2RlZmluZSBDU0NIRUQy
X0lETEVfQ1JFRElUICAgICAgICAgIElOVF9NSU4KClRoZSB0aXRsZSBzYXlpbmcgImxvd2VyIHRo
YW4iLCBpcyAiZXF1YWwiIGFjdHVhbGx5IGZpbmU/IExvb2tpbmcKYXQgZS5nLiBydW5xX2luc2Vy
dCgpIEknbSBnZXR0aW5nIHRoZSBpbXByZXNzaW9uIGl0J3Mgbm90LgoKTG9va2luZyBhdCB0MmNf
dXBkYXRlKCkgSSdtIGFsc28gZ2V0dGluZyB0aGUgaW1wcmVzc2lvbiB0aGF0CnRoZXJlJ3MgVUIg
d2hlbiB0aGUgc3VidHJhY3Rpb24gdW5kZXJmbG93cy4gQWZ0ZXIgYWxsLCBpZgotMSA8PCAzMCB3
YXNuJ3Qgc21hbGwgZW5vdWdoIGEgdmFsdWUsIEkgZG9uJ3Qgc2VlIHdoeSAtMSA8PCAzMQp3b3Vs
ZCBiZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
