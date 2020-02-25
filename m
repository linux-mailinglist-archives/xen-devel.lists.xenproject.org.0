Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C661216EA3B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 16:35:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6cCY-0003zz-Fx; Tue, 25 Feb 2020 15:32:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3lsx=4N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6cCW-0003zu-JS
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 15:32:48 +0000
X-Inumbo-ID: 119fbcb1-57e4-11ea-9329-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 119fbcb1-57e4-11ea-9329-12813bfff9fa;
 Tue, 25 Feb 2020 15:32:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dc19so16664555edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 07:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=65wdOvhFqo/LDGt4UZxwlQWUr9QkM8il1gulHxWJo0o=;
 b=tik/dtLmxRftPkFFIkt24RAMpHdVhMEZfqspNdk9T7YO5S7wS/HHVLDDlMlcQd1Ou1
 J4AIlNiRpIJBjtr8PLFlgNNHJijgl7vapmz9RQVz6cMzixkIJ9r86Dl2z4T7HQYx/Jf2
 aGH3bLT0U45vMqmOEpvA50MuX2W/ERHXdQTK26zYv43Sn4a1YWQSQw2eBzNU4VsIaVNb
 KVUArfQjKt0CusUfCt5aj3sFqtMqqGuSjsjYu4az1tj1sNBk73q9BW2ZC36kvmNtVA3I
 VNuHGxbN6XEpcg74x6GL3hDJYFIeyVGBYBxXk3iCStnk/TnG9onSNZjrdcGCPfU/0IbI
 IFuQ==
X-Gm-Message-State: APjAAAUGsNUiUKdmOot5GrJb6FEtlJEpxuGLEOlxJxebxOuEU+ZpENHJ
 RkWf4ZERqA92zLOgQJldR9k=
X-Google-Smtp-Source: APXvYqwrWmIxaWN95AiA2Qut4eTjH+q5m9PhaJJIxDqWmKPnpzu4wtebGfaAv7DzaDDfmAr3tv5SYg==
X-Received: by 2002:a05:6402:b47:: with SMTP id
 bx7mr52435500edb.362.1582644765418; 
 Tue, 25 Feb 2020 07:32:45 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id bo15sm1179742edb.86.2020.02.25.07.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 07:32:44 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-3-roger.pau@citrix.com>
 <8c0dcb31-cbbd-4910-b4a5-8bb11a1158cf@xen.org>
 <20200224101035.GI4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <f7d6d6e8-1916-fe94-565f-8017dcbf5a71@xen.org>
Date: Tue, 25 Feb 2020 15:32:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224101035.GI4679@Air-de-Roger>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC8wMi8yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIE1vbiwg
RmViIDI0LCAyMDIwIGF0IDEwOjA1OjM5QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgUm9nZXIsCj4+Cj4+IE9uIDI0LzAyLzIwMjAgMDg6NDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90
ZToKPj4+IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2Rl
IHRvIGFsc28gbG9jayBpdCBpbgo+Pj4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxs
b3dpbmcgcmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+Pj4gYWxyZWFkeSBvd25lZCBieSB0
aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+PiBhY2Nl
c3NlcyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+Pj4K
Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxMmJpdHMgb2YgdGhlIGxvY2ssIHRoaXMg
YWxsb3dzIHRvIHN1cHBvcnQKPj4+IHVwIHRvIDQwOTYgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdy
aXRlIGxvY2sgbWFzayB0byAyIGJpdHM6IG9uZSB0bwo+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5k
aW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4+PiBzaWdu
YWwgdGhlIGxvY2sgaXMgb3duZWQgaW4gd3JpdGUgbW9kZS4KPj4+Cj4+PiBUaGlzIHJlZHVjZXMg
dGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRv
Cj4+PiAyNjIxNDQsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNl
IHRoZSBsb2NrIGZpZWxkCj4+PiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAzMiB0byA2NGJpdHMgaWYg
YWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBhdG9taWMKPj4+IG9wZXJhdGlvbnMgb24gNjRiaXQg
aW50ZWdlcnMuCj4+Pgo+Pj4gRml4ZXM6IDU4NzJjODNiNDJjNjA4ICgnc21wOiBjb252ZXJ0IHRo
ZSBjcHUgbWFwcyBsb2NrIGludG8gYSBydyBsb2NrJykKPj4+IFJlcG9ydGVkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBSZXBvcnRlZC1ieTogSsO8cmdlbiBHcm/DnyA8
amdyb3NzQHN1c2UuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgc2luY2UgdjI6Cj4+PiAgICAt
IFVzZSBhdG9taWNfYW5kIHRvIGNsZWFyIHRoZSB3cml0ZXJzIHBhcnQgb2YgdGhlIGxvY2sgd2hl
bgo+Pj4gICAgICB3cml0ZS11bmxvY2tpbmcuCj4+PiAgICAtIFJlZHVjZSB3cml0ZXItcmVsYXRl
ZCBhcmVhIHRvIDE0Yml0cy4KPj4+ICAgIC0gSW5jbHVkZSB4ZW4vc21wLmggZm9yIEFybTY0Lgo+
Pgo+PiBPT0ksIGlzIGl0IHRvIHVzZSBzbXBfcHJvY2Vzc29yX2lkKCk/Cj4gCj4gWWVzLCBvciBl
bHNlIEkgd291bGQgZ2V0IGVycm9ycyB3aGVuIGJ1aWxkaW5nIGFzbS1vZmZzZXRzIG9uIEFybTY0
Cj4gSUlSQy4KClRoYW5rIHlvdSBmb3IgdGhlIGNvbmZpcm1hdGlvbi4KClJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKPiAKPiBUaGFua3MsIFJvZ2Vy
Lgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
