Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C5ADC56
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 17:45:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Loh-0000K5-KM; Mon, 09 Sep 2019 15:42:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t56i=XE=shutemov.name=kirill@srs-us1.protection.inumbo.net>)
 id 1i7Lof-0000Js-Mx
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 15:42:57 +0000
X-Inumbo-ID: 7e2390a6-d318-11e9-b299-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e2390a6-d318-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 15:42:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id o9so13438750edq.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2019 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3SY6sV9Kk+QzFkjSL8M3PFN8ScqMIVwbQKKnfeSopA8=;
 b=THRGm6XSaXwL6nkGJIUR36arIzUbwIyDFRDA3U5m/qBxDyOb3Hxa1xgQlnvTWnFdD7
 6hKRYrgaQ41tvn6TVGF+3t0pAOXAxC58CqB1h7e+HifutUHr4IKnnJUV7uDcpMSn97nV
 MMicdUmqzBFGNjMitH9NhuJ7ZsJl9i0MBYutjCuI1A+rpvKILL++D7uffSa24gGDAPyS
 CsIzReY/kMAl3Hos2OL4D7sCUlnjKuPXjI7TlAj+RHgAZWTtlcxjo0Qe2jpSl13orlHl
 8lRZqVc3vd67K7Hq9Zg00XrQlcORq0O3/fxVQv4ibxpOBbzRAw19XqGUqnigtTpgERWr
 jYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3SY6sV9Kk+QzFkjSL8M3PFN8ScqMIVwbQKKnfeSopA8=;
 b=F4iGmvxPi2SQW/q/l20anAqUxMYQR1XddE1fdcV7m6qpXWebqiYPAJ/SyIVXiRXXMO
 4htqVLlUJrPW3H+JZ8Dv7tYY+6zoIRhF8Ri87AFIKThvptN9DoVRKRufqqg/5viFtQPG
 zfEjuIciVrdRdePLS7ounaqOpJkyToFQxcj+0eQh4ZMlU94BAQjOsAerJr5qtANciOzG
 ahbJyJzS+v82qZGd6T1k5Q6vf/H++PLlVbkv0pM6AinpUy894Q+AovKRGQEuBAZUrefH
 wqim1gZ05whssZ8IUmvSsbph5OBQ1coYnh8RSdcWfYlYVEMo6xFxtNVCmMwBKden/W6s
 YlDg==
X-Gm-Message-State: APjAAAUdtZDihrcqPzapk+9McKo1raZ6Kbg9moew0hS6XA/aPgz6GY+S
 BpXoAjdioTAVAzL+x6GFmNStXQ==
X-Google-Smtp-Source: APXvYqyrmYxxvoaUBmgmwXh89G4Un8byjESE4BZ9R71RK07xOPzKxwas5qjTsrE19iMlwaLhtmZwvg==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr4767421edq.23.1568043775730; 
 Mon, 09 Sep 2019 08:42:55 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id a3sm1782816eje.90.2019.09.09.08.42.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 08:42:55 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id D32491003B5; Mon,  9 Sep 2019 18:42:53 +0300 (+03)
Date: Mon, 9 Sep 2019 18:42:53 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Souptick Joarder <jrdr.linux@gmail.com>
Message-ID: <20190909154253.q55olcm4cqwh7izd@box>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/3] Remove __online_page_set_limits()
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
Cc: sashal@kernel.org, jgross@suse.com, linux-hyperv@vger.kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, pasha.tatashin@soleen.com,
 david@redhat.com, haiyangz@microsoft.com, dan.j.williams@intel.com,
 linux-kernel@vger.kernel.org, richard.weiyang@gmail.com, linux-mm@kvack.org,
 mhocko@suse.com, cai@lca.pw, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, kys@microsoft.com, akpm@linux-foundation.org,
 osalvador@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDM6MTc6MDFBTSArMDUzMCwgU291cHRpY2sgSm9hcmRl
ciB3cm90ZToKPiBfX29ubGluZV9wYWdlX3NldF9saW1pdHMoKSBpcyBhIGR1bW15IGZ1bmN0aW9u
IGFuZCBhbiBleHRyYSBjYWxsCj4gdG8gdGhpcyBjYW4gYmUgYXZvaWRlZC4KPiAKPiBBcyBib3Ro
IG9mIHRoZSBjYWxsZXJzIGFyZSBub3cgcmVtb3ZlZCwgX19vbmxpbmVfcGFnZV9zZXRfbGltaXRz
KCkKPiBjYW4gYmUgcmVtb3ZlZCBwZXJtYW5lbnRseS4KPiAKPiBTb3VwdGljayBKb2FyZGVyICgz
KToKPiAgIGh2X2JhbGxvbjogQXZvaWQgY2FsbGluZyBkdW1teSBmdW5jdGlvbiBfX29ubGluZV9w
YWdlX3NldF9saW1pdHMoKQo+ICAgeGVuL2JhbGxvbjogQXZvaWQgY2FsbGluZyBkdW1teSBmdW5j
dGlvbiBfX29ubGluZV9wYWdlX3NldF9saW1pdHMoKQo+ICAgbW0vbWVtb3J5X2hvdHBsdWcuYzog
UmVtb3ZlIF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygpCj4gCj4gIGRyaXZlcnMvaHYvaHZfYmFs
bG9vbi5jICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3hlbi9iYWxsb29uLmMgICAgICAgICAgfCAx
IC0KPiAgaW5jbHVkZS9saW51eC9tZW1vcnlfaG90cGx1Zy5oIHwgMSAtCj4gIG1tL21lbW9yeV9o
b3RwbHVnLmMgICAgICAgICAgICB8IDUgLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA4IGRlbGV0
aW9ucygtKQoKRG8gd2UgcmVhbGx5IG5lZWQgMyBzZXBhcmF0ZSBwYXRjaGVzIHRvIHJlbW92ZSA4
IGxpbmVzIG9mIGNvZGU/CgotLSAKIEtpcmlsbCBBLiBTaHV0ZW1vdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
