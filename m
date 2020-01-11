Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9378137B52
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 04:57:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq7rh-0002TZ-3H; Sat, 11 Jan 2020 03:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R1fg=3A=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iq7rf-0002TU-EI
 for xen-devel@lists.xen.org; Sat, 11 Jan 2020 03:55:07 +0000
X-Inumbo-ID: 274f6b64-3426-11ea-b89f-bc764e2007e4
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 274f6b64-3426-11ea-b89f-bc764e2007e4;
 Sat, 11 Jan 2020 03:55:06 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id c13so1594869ybq.5
 for <xen-devel@lists.xen.org>; Fri, 10 Jan 2020 19:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SeZ+VZJekfhzr146wty6mqY+OfYIRWyyR5kaYzErpQ4=;
 b=ALhmuUK0ZYWjKg4cY3d8SSC1gONfoHGCUHvzBVYDRt1ZurUUC2SCLLqEXhWZXgrQXj
 8wBS7p5uTna94JdbUlptabxT984wBcO1+fOsDIxSpGfkgESqOby3WQhoPlxsmaOfxwyM
 owOKuSgcpDjjGD+paEpVOsAI9T/0xYZ/VSX2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SeZ+VZJekfhzr146wty6mqY+OfYIRWyyR5kaYzErpQ4=;
 b=q39gDwnFmPW5SOB5leko1fPdlwweW89hMUSQGnVt8WLVcTN5PGbQATCMZY7B6kvDJU
 o+Y9sh+ksOFBna4ICBj1awYSgd/TrF+CkeqRWF+Kg0tKJakXvnj7aK+NFETXg596Ai4F
 qL+7xXQQ/EI3XSBrRUs0JaY6WZm6L1V5t+rOD+yUZKUW/ir3cZCqQuwhgOT3ZzCSwneK
 tb3kKbimyIpKcq22Q9QTbcP2o8C+7tjJhUoYKdkMcGHk+baaMFfEyl2rHEhKP0c5Xx6a
 t74gN/MsKvIFe2BBtzQzjbePwhx/ihhiP+vD7pzQmgVhCZuSg2pcGSp9f52+hH6xFHf/
 uknw==
X-Gm-Message-State: APjAAAWjwWEqNKWF75/uqpoNpxiJtRY4h52IsAv50kB2tFTts3H88LLX
 M6eSguQen+qBz2qWCH9wUVvPKQ==
X-Google-Smtp-Source: APXvYqy9gGmcLGGPU3O0/yFzgTTeupQF6OvTjbj1TJ3NRTjfCbdLiL4Te/vuL6ZYEROKPCUBEoHjtw==
X-Received: by 2002:a25:c7c3:: with SMTP id w186mr1534780ybe.467.1578714905814; 
 Fri, 10 Jan 2020 19:55:05 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:dc3:e77:380e:c132])
 by smtp.gmail.com with ESMTPSA id a74sm1974351ywe.42.2020.01.10.19.55.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 19:55:05 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
 <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <cbe5fc46-4fc9-f905-3492-2abc34a8e12e@cardoe.com>
Date: Fri, 10 Jan 2020 21:55:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzEwLzIwIDk6MjggQU0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMS8xMC8yMCAx
MTowMiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTAvMDEvMjAyMCAxMDozNywgU2Vy
Z2V5IER5YXNsaSB3cm90ZToKPj4+IEhpZGUgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbiB0aGF0
IGNhbiBoZWxwIGlkZW50aWZ5IHRoZSBydW5uaW5nIFhlbgo+Pj4gYmluYXJ5IHZlcnNpb246IFhF
TlZFUl9leHRyYXZlcnNpb24sIFhFTlZFUl9jb21waWxlX2luZm8sIFhFTlZFUl9jaGFuZ2VzZXQu
Cj4+PiBBZGQgZXhwbGljaXQgY2FzZXMgZm9yIFhFTlZFUl9jb21tYW5kbGluZSBhbmQgWEVOVkVS
X2J1aWxkX2lkIGFzIHdlbGwuCj4+Pgo+Pj4gSW50cm9kdWNlIHhzbV9maWx0ZXJfZGVuaWVkKCkg
dG8gaHZtbG9hZGVyIHRvIHJlbW92ZSAiPGRlbmllZD4iIHN0cmluZwo+Pj4gZnJvbSBndWVzdCdz
IERNSSB0YWJsZXMgdGhhdCBvdGhlcndpc2Ugd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlrZQo+
Pj4gZG1pZGVjb2RlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdl
eS5keWFzbGlAY2l0cml4LmNvbT4KPj4+IC0tLQo+Pj4gdjEgLS0+IHYyOgo+Pj4gLSBBZGRlZCB4
c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciBpbnN0ZWFkIG9mIG1vZGlmeWluZyB4ZW5f
ZGVueSgpCj4+PiAtIE1hZGUgYmVoYXZpb3VyIHRoZSBzYW1lIGZvciBib3RoIFJlbGVhc2UgYW5k
IERlYnVnIGJ1aWxkcwo+Pj4gLSBYRU5WRVJfY2FwYWJpbGl0aWVzIGlzIG5vIGxvbmdlciBoaWRl
ZAo+Pj4KPj4+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
Pj4gQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPj4+IEND
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPj4+IENDOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KPj4+IENDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+Cj4+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+PiBDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2Rl
Z3JhQHR5Y2hvLm5zYS5nb3Y+Cj4+Cj4+IEkgcmVhbGlzZSB0aGVyZSBhcmUgYXJndW1lbnRzIG92
ZXIgaG93IHRvIGZpeCB0aGlzLCBidXQgd2UgKHRoZSBYZW4KPj4gY29tbXVuaXR5KSBoYXZlIGFs
cmVhZHkgZipja2VkIHVwIG9uY2UgaGVyZSwgYW5kIHRoaXMgaXMgZG9pbmcgc28gYQo+PiBzZWNv
bmQgdGltZS4KPj4KPj4gTmFjay4KPj4KPj4gRml4aW5nIGl0IGFueXdoZXJlIG90aGVyIHRoYW4g
WGVuIGlzIHNpbXBseSBub3QgYXBwcm9wcmlhdGUuCj4+Cj4+IFRoZSByZWFzb24gZm9yIHRoaXMg
KHdoaWNoIG91Z2h0IHRvIGJlIG9idmlvdXMsIGJ1dCBJIGd1ZXNzIG9ubHkgdG8KPj4gdGhvc2Ug
d2hvIGFjdHVhbGx5IGRvIGN1c3RvbWVyIHN1cHBvcnQpIGlzIGJhc2ljIGh1bWFuIHBoeXNpb2xv
Z3kuCj4+ICJkZW5pZWQiIG1lYW5zIHNvbWV0aGluZyBoYXMgZ29uZSB3cm9uZy7CoCBJdCBzY2Fy
ZXMgcGVvcGxlLCBhbmQgY2F1c2VzCj4+IHRoZW0gdG8gc2VlayBoZWxwIHRvIGNoYW5nZSBmaXgg
d2hhdGV2ZXIgaXMgYnJva2VuLgo+IAo+IFRoaXMgc2VlbXMgbGlrZSBhIHJlYXNvbmFibGUgYXJn
dW1lbnQgdGhhdCAiPGRlbmllZD4iIGNhdXNlcyBpc3N1ZXMuCj4gQnV0IHRoYXQgZG9lc24ndCBj
aGFuZ2UgdGhlIGZhY3QgdGhhdCAiIiBhbHNvIGNhdXNlcyBpc3N1ZXMuCj4gCgpJJ2QgYmUgY3Vy
aW91cyB0byBoZWFyIHRoZSBjYXNlIHdoZXJlIHRoZSBlbXB0eSBzdHJpbmcgY2F1c2VzIGlzc3Vl
cy4KCi0tCkRvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
