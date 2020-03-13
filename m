Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B69184448
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:05:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCh9f-00070I-14; Fri, 13 Mar 2020 10:02:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FVV1=46=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCh9d-000705-J0
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:02:57 +0000
X-Inumbo-ID: cff404fc-6511-11ea-b2b8-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cff404fc-6511-11ea-b2b8-12813bfff9fa;
 Fri, 13 Mar 2020 10:02:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g62so9594998wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 03:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I8huPfmoKJxQnYqGTkwOjGrrybm1SLm9iEOWoSEf6z0=;
 b=BJX3gk0GxYBKNaNDibustBx59tZ9YBmSiZSHTmtv2mtz8iNplGHVUyOf8ndlrU7P/5
 Xwouq+QnST6DtxxzHeiP2jRN2zpsTUWAp1aO04pT0ZZ1S7+WCr7K3f0b62VrB3V262dY
 /LOa4KYziHdA8xJvbObVkIU5/9k/kbtQ7ufj1Gdiou2CdvqehSkfx+OTZMt3zzJa4rl7
 tqxseeqhbc1lJwmqdYxHSX6RIiITb7qQfjiZgsWjcXGbwQe9wH8zMfrjwjzDdOT+MVcp
 FkShe5guFjDNFg+45UoDMJ12zrsSEYRaRZitQtseRQkGuVDsRLlUlWfi3mHKu2IqLs83
 6n1w==
X-Gm-Message-State: ANhLgQ0S/rJc+VN+17knOMEZYxiDDqIsImsVomtQE0jOScXZ4YrUyx3+
 kiJrkXS1yPU9nhASjelLvME=
X-Google-Smtp-Source: ADFU+vuLFF+yFEMzr4o52vnTe7CZ+qcB4Ykgq4Jr4Pzc1KLjy4rTC8ZmiFr+j0q/qycyv3/3/xHFDg==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr10261990wml.110.1584093776313; 
 Fri, 13 Mar 2020 03:02:56 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id l8sm16733948wmj.2.2020.03.13.03.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 03:02:55 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <17a9b7ff-f287-6318-3d3b-daf7f4158fc7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2554e004-ee3a-0659-8637-8058a27cbfe1@xen.org>
Date: Fri, 13 Mar 2020 10:02:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <17a9b7ff-f287-6318-3d3b-daf7f4158fc7@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMy8wMy8yMDIwIDA4OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxMy4wMy4yMDIw
IDA5OjA1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBTaW1pbGFyIHRvIHNwaW5sb2NrcyBwcmVl
bXB0aW9uIHNob3VsZCBiZSBkaXNhYmxlZCB3aGlsZSBob2xkaW5nIGEKPj4gcndsb2NrLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gSnVz
dCBvbmUgbm90ZS9xdWVzdGlvbjoKPiAKPj4gQEAgLTMwOCw2ICszMjMsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgX3BlcmNwdV9yZWFkX3VubG9jayhwZXJjcHVfcndsb2NrX3QgKipwZXJfY3B1ZGF0
YSwKPj4gICAgICAgICAgIHJldHVybjsKPj4gICAgICAgfQo+PiAgICAgICB0aGlzX2NwdV9wdHIo
cGVyX2NwdWRhdGEpID0gTlVMTDsKPj4gKyAgICBwcmVlbXB0X2VuYWJsZSgpOwo+PiAgICAgICBz
bXBfd21iKCk7Cj4+ICAgfQo+IAo+IEl0IHdvdWxkIHNlZW0gbW9yZSBsb2dpY2FsIHRvIG1lIHRv
IGluc2VydCB0aGlzIGFmdGVyIHRoZSBzbXBfd21iKCkuCgorMQoKPiBUaG91Z2h0cz8gSSdsbCBi
ZSBoYXBweSB0byBnaXZlIG15IFItYiBvbmNlIHdlJ3ZlIHNldHRsZWQgb24gdGhpcy4KPiAKPiBK
YW4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
