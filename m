Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED86151B59
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:34:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyyIX-0006Sw-8s; Tue, 04 Feb 2020 13:31:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyyIV-0006Sr-Ck
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:31:23 +0000
X-Inumbo-ID: a1b5ee3e-4752-11ea-8f42-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1b5ee3e-4752-11ea-8f42-12813bfff9fa;
 Tue, 04 Feb 2020 13:31:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t23so3339699wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 05:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/KPqLxKVUWweruWVgluINFvdVWG22x5Wi9xjPmIJoVM=;
 b=fKFgVZOKVm1v+Me7tWOvMI9OwUhSZpU5Dyl1YbnE1Hp49c1pYzrUsJThu7+2dZz4b8
 /mzBboC327GMt7ft0EKWxyYrJA2lGuuE1WqnWIj5qxRCI4WkxFZfKbKFXGliVP5QIiYW
 +l6B2qv3nM1fX9zhS0BNRIsH3VMWUxbIy3IAll7BPzesAqfxZ08rTEuZz070BlMEqUkP
 6xHJd18VYNxCi0M6sejZEbbDoptC6HLXfuQeDTKWq8H/yJnzI0cYEKZpK0oC0rlcUHLp
 PIUhnCzTyqLLGl+IgJGXWY9aOuu5OO5xxMm06aaUL2hLhBlIMVGiShVW/yBP2Y/vdizX
 0e/Q==
X-Gm-Message-State: APjAAAXiPPd6EhQ/WTjJDivUvyC8cw2NSh5xn7ZxNWNi+8xqGQNUGNv+
 2uw5l66u+v/Rzu2ylZTRP/Y=
X-Google-Smtp-Source: APXvYqy5KtIsDxK/23wivFVN8lhyHH7J9r5OO+HRityeqZtFdm5U7TjNc4oRVwPDeu/+goINWr2kKw==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr5814246wmj.105.1580823081100; 
 Tue, 04 Feb 2020 05:31:21 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id p3sm11634233wrx.29.2020.02.04.05.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 05:31:20 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
 <b7312aba7d5c420bbb660298a4c73578@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f7b8d962-2b8d-7d56-03a8-5f1ca00857a1@xen.org>
Date: Tue, 4 Feb 2020 13:31:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b7312aba7d5c420bbb660298a4c73578@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Grall, Julien" <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNC8wMi8yMDIwIDEzOjE2LCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPj4gSnVsaWVuIEdyYWxsCj4+IFNlbnQ6
IDA0IEZlYnJ1YXJ5IDIwMjAgMTM6MDYKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+PiBDYzoganVsaWVuQHhlbi5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9yZ2Ug
RHVubGFwCj4+IDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsKPj4gR3JhbGwsIEp1bGllbiA8amdyYWxsQGFtYXpv
bi5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlcgo+PiBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENI
IHYyIDIvMl0geGVuL3g4NjogaGFwOiBDbGVhbi11cCBhbmQgaGFyZGVuCj4+IGhhcF9lbmFibGUo
KQo+Pgo+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pgo+PiBVbmxp
a2Ugc2hhZG93X2VuYWJsZSgpLCBoYXBfZW5hYmxlKCkgY2FuIG9ubHkgYmUgY2FsbGVkIG9uY2Ug
ZHVyaW5nCj4+IGRvbWFpbiBjcmVhdGlvbiBhbmQgd2l0aCB0aGUgbW9kZSBlcXVhbCB0byBtb2Rl
IGVxdWFsIHRvCj4+IFBHX2V4dGVybmFsIHwgUEdfdHJhbnNsYXRlIHwgUEdfcmVmY291bnRzLgo+
Pgo+PiBJZiBpdCB3ZXJlIGNhbGxlZCB0d2ljZSwgdGhlbiB3ZSBtaWdodCBoYXZlIHNvbWV0aGlu
ZyBpbnRlcmVzdGluZwo+PiBwcm9ibGVtIGFzIHRoZSBwMm0gdGFibGVzIHdvdWxkIGJlIHJlLWFs
bG9jYXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwgdGhlCj4+IG1hcHBpbmdzIHdvdWxkIGJlIGxvc3Qp
Lgo+IAo+IFRoZXJlIGFyZSB0d28gdGVzdHMgaW4gcDJtX2FsbG9jX3RhYmwyOiB3aGV0aGVyIHRo
ZSBkb21haW4gaGFzIG1lbW9yeSBhbGxvY2F0ZWQsIGFuZCB3aGV0aGVyIHRoZSBkb21haW4gYWxy
ZWFkeSBoYXMgYSBwMm0uIENhbiB0aGVzZSBub3cgYmUgZHJvcHBlZD8KCkkgZG9uJ3QgdGhpbmsg
c28uIFRoZXkgYXJlIHN0aWxsIG5lY2Vzc2FyeSBmb3IgdGhlIHNoYWRvdyBwYWdlLXRhYmxlcy4g
CkFGQUlDVCwgdGhleSBhcmUgZW5hYmxlZCB2aWEgYSBET01DVEwuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
