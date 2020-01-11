Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE70137B57
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 05:04:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq7yS-0003Tq-Ch; Sat, 11 Jan 2020 04:02:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R1fg=3A=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iq7yQ-0003Ti-Tk
 for xen-devel@lists.xen.org; Sat, 11 Jan 2020 04:02:06 +0000
X-Inumbo-ID: 21b9653c-3427-11ea-b89f-bc764e2007e4
Received: from mail-yb1-xb43.google.com (unknown [2607:f8b0:4864:20::b43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21b9653c-3427-11ea-b89f-bc764e2007e4;
 Sat, 11 Jan 2020 04:02:06 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id l7so1607912ybp.1
 for <xen-devel@lists.xen.org>; Fri, 10 Jan 2020 20:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=twlFdFs8HnfTM6jh/k4v1pZFg5u2w7LcDUZDJM1ft3Y=;
 b=U1djKmz1mgM2cK1wLFs8FDMBu0SSSY0567WcGlsP6MhkJwWj97YLCC4YoyjQkVj1Wg
 Ge1l8NGuuoLN2yJT2REQtd09gx0Idcomvmsmch3diPaVQl/H1ZILcIJAl8qFKhVBYEIg
 ZHqxANACj7Z8omB64c/5cUbH8NB+WAwVKbKvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twlFdFs8HnfTM6jh/k4v1pZFg5u2w7LcDUZDJM1ft3Y=;
 b=aHxX3wFVOyfyZkmfOQwfpdv8wR0OLL6J5FalOlCf8ZqyLRo1oPlNcU4rtjmTUc8ous
 v9z1RNHymIxyk2CjA2KCe/5/sRUVYOxPw+w1HsPakwQHv67fjnyBtN8eBixZLZ2Z4TsN
 Ej6C/DuBwMYAToXtkBomD/Fnv4TqBe/sH3sDSJn6YethEeoZv3fpJlXufIYlzZn78UkF
 JmzlJGnN+XpidzN3s+hrF620+yph9f0qX0NO7mVYC4PYacuwYmYlrGMvAYar6Pu0/4z+
 1pYbiY/ShvAPhIisdJuinkmby6JwNQEhjUotpAVqearMiTJJ/awE03hEhB5HEbb9vNXz
 fVfQ==
X-Gm-Message-State: APjAAAXK0s6eSq9FusU2Tc3Bd66tnGJAfuP6Sg2khvTCQplT5SzXt5Xh
 jEWcVsiWQQ+Ru6P3bXSvdJvytA==
X-Google-Smtp-Source: APXvYqx5BY7NCQl658rxPEpAOmdctnzzeNIRntjkqZDbHkSYdu1JnmA1ssh2S9pHaAVCLGlOQfD/dQ==
X-Received: by 2002:a25:be84:: with SMTP id i4mr5309061ybk.102.1578715325952; 
 Fri, 10 Jan 2020 20:02:05 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:dc3:e77:380e:c132])
 by smtp.gmail.com with ESMTPSA id 189sm2016122ywc.16.2020.01.10.20.02.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 20:02:05 -0800 (PST)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
Date: Fri, 10 Jan 2020 22:02:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200110103723.29538-1-sergey.dyasli@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzEwLzIwIDQ6MzcgQU0sIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGlkZSB0aGUgZm9s
bG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhlIHJ1bm5pbmcgWGVu
Cj4gYmluYXJ5IHZlcnNpb246IFhFTlZFUl9leHRyYXZlcnNpb24sIFhFTlZFUl9jb21waWxlX2lu
Zm8sIFhFTlZFUl9jaGFuZ2VzZXQuCj4gQWRkIGV4cGxpY2l0IGNhc2VzIGZvciBYRU5WRVJfY29t
bWFuZGxpbmUgYW5kIFhFTlZFUl9idWlsZF9pZCBhcyB3ZWxsLgo+IAo+IEludHJvZHVjZSB4c21f
ZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciB0byByZW1vdmUgIjxkZW5pZWQ+IiBzdHJpbmcK
PiBmcm9tIGd1ZXN0J3MgRE1JIHRhYmxlcyB0aGF0IG90aGVyd2lzZSB3b3VsZCBiZSBzaG93biBp
biB0b29scyBsaWtlCj4gZG1pZGVjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFz
bGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAtLS0KPiB2MSAtLT4gdjI6Cj4gLSBBZGRl
ZCB4c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciBpbnN0ZWFkIG9mIG1vZGlmeWluZyB4
ZW5fZGVueSgpCgpTbyAxMDAlIHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggd29uJ3QgZmx5IHdp
dGggdGhlIHZhcmlvdXMgZG93bnN0cmVhbXMgCnRoYXQgcnVuIHRoZSB2MSBvZiB0aGlzIHBhdGNo
LiBUaG9zZSB2YXJpb3VzIGNvbnN1bWVycyB3aWxsIHN0aWNrIHdpdGggdjEuCgpJZiB0aGUgZ29h
bCBvZiB0aGlzIGlzIHRvIHJlZHVjZSB0aGUgYnVyZGVuIG9mIHRoZSBkb3duc3RyZWFtcyBhbmQg
dGhlaXIgCmN1c3RvbWVycyB0byBjYXJyeSBhIHBhdGNoIGFnYWluc3QgWGVuIHRoZW4gSSB3b3Vs
ZG4ndCBldmVuIGJvdGhlciB3aXRoIAp0aGlzIHZlcnNpb24uCgotLQpEb3VnCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
