Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E81356EF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:32:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipV3m-0000hg-TC; Thu, 09 Jan 2020 10:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yRbW=26=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ipV3k-0000hb-SZ
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:29:00 +0000
X-Inumbo-ID: d8c8212c-32ca-11ea-b992-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8c8212c-32ca-11ea-b992-12813bfff9fa;
 Thu, 09 Jan 2020 10:28:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so2215419wmf.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 02:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZaPZWMYwHhKzf8ifRTbxfFbzy4aZAeTJsrH8z2cZrq8=;
 b=QuQApTun/W22L2lTB5S3MvaBZLr2JLjE76WVci3JZhhS5Fzpev0cjjBuhJ6OYB7AxH
 8m6G//aAQa8T03UONdI6xr2jiLAIGt66GJTe7WSIt1Wm1wyyYBzifSfU+Gv29W1XMiDw
 p8BnIJlBQqMvIME8PEakFCtwzqDjyAq9+LIbcoHBarRXKqrBnHGhCbzSmcduFkVbnSgw
 PGySfiNMddnT6SgBFmLiIsQHrjpP8qUxA/iI+PdJ3br/SnlmZnd1Xch1NokOXYgAMOj+
 GdEvZz2zlN/yygYp+QqoIhLIq3l9ZqX0BgddAlRR5lQwsN17fTztPLsb6M4khK/25nqX
 roUw==
X-Gm-Message-State: APjAAAUNvLwrF4rdwKyhiXIF81Nb2O/EjMpi78Was6RTBcwyFsl1V3T0
 Jpu/qaw+xnXShJaBxZHvxzA=
X-Google-Smtp-Source: APXvYqxOk85wFZ9ECqFMnR+eK0We441RyyW+dcHja2Frb/wZ9hMveOYZvBBxo+Bz/kr0SetvwEhkOQ==
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr4133382wmc.135.1578565738634; 
 Thu, 09 Jan 2020 02:28:58 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id x16sm2352385wmk.35.2020.01.09.02.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 02:28:58 -0800 (PST)
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
Date: Thu, 9 Jan 2020 10:28:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAwOC8wMS8yMDIwIDE3OjE0LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
K3N0YXRpYyBpbnQgbWVtX3NoYXJpbmdfZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9t
YWluICpjZCkKPiArewo+ICsgICAgaW50IHJjOwo+ICsKPiArICAgIGlmICggIWQtPmNvbnRyb2xs
ZXJfcGF1c2VfY291bnQgJiYKPiArICAgICAgICAgKHJjID0gZG9tYWluX3BhdXNlX2J5X3N5c3Rl
bWNvbnRyb2xsZXIoZCkpICkKCkFGQUlVLCB0aGUgcGFyZW50IGRvbWFpbiB3aWxsIGJlIHBhdXNl
ZCBpZiBpdCB3YXNuJ3QgcGF1c2VkIGJlZm9yZSBhbmQgCnRoaXMgd2lsbCBub3QgYmUgdW5wYXVz
ZWQgYnkgdGhlIHNhbWUgaHlwZXJjYWxsLiBSaWdodD8KCklmIHNvLCB0aGlzIGJyaW5ncyB0d28g
cXVlc3Rpb25zOgogICAgIC0gV2hhdCB3b3VsZCBoYXBwZW4gaWYgdGhlIHRvb2xzdGFjayBkZWNp
ZGUgdG8gdW5wYXVzZSB0aGUgZG9tYWluPwogICAgIC0gSG93IGRvZXMgdGhlIGNhbGxlciBrbm93
cyB3aGV0aGVyIHRoaXMgd2FzIHBhdXNlZCBieSB0aGUgCmh5cGVyY2FsbCBvciBub3Q/CgpJIHdv
dWxkIGFsc28gc3VnZ2VzdCB0byBkb2N1bWVudCB0aGUgYmVoYXZpb3Igb2YgdGhlIGh5cGVyY2Fs
bCBhcyB0aGlzIAppcyBub3QgZW50aXJlbHkgb2J2aW91cyB0aGF0IHRoZSBkb21haW4gd2lsbCBi
ZSBwYXVzZWQgaGVyZS4KCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgIGNkLT5tYXhf
cGFnZXMgPSBkLT5tYXhfcGFnZXM7Cj4gKyAgICBjZC0+bWF4X3ZjcHVzID0gZC0+bWF4X3ZjcHVz
Owo+ICsKPiArICAgIC8qIHRoaXMgaXMgcHJlZW1wdGlibGUgc28gaXQncyB0aGUgZmlyc3QgdG8g
Z2V0IGRvbmUgKi8KPiArICAgIGlmICggKHJjID0gZm9ya19oYXBfYWxsb2NhdGlvbihkLCBjZCkp
ICkKPiArICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgaWYgKCAocmMgPSBicmluZ191cF92
Y3B1cyhjZCwgZC0+Y3B1cG9vbCkpICkKPiArICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAg
aWYgKCAocmMgPSBodm1fY29weV9jb250ZXh0X2FuZF9wYXJhbXMoZCwgY2QpKSApCj4gKyAgICAg
ICAgcmV0dXJuIHJjOwo+ICsKPiArICAgIGZvcmtfdHNjKGQsIGNkKTsKPiArCj4gKyAgICBjZC0+
cGFyZW50ID0gZDsKCkhvdyBkbyB5b3UgZW5zdXJlIHRoYXQgdGhlIHBhcmVudCBkb21haW4gd2ls
bCBub3QgZ2V0IGRlc3Ryb3llZCBiZWZvcmUgCnRoZSBmb3JrZWQgZG9tYWluPyBEbyB5b3UgaGF2
ZSBhIHJlZmNvdW50IHNvbWV3aGVyZT8KCj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
