Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06B69722
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:09:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2Yc-0008Bj-2j; Mon, 15 Jul 2019 15:06:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2rOe=VM=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hn2Ya-0008Be-It
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:06:24 +0000
X-Inumbo-ID: 1b5f6520-a712-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1b5f6520-a712-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 15:06:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e3so15855745edr.10
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T4p8s256bVHSKXrzwM09/9eIKSFjR8qudVT0tKHiFMk=;
 b=SsEjvxug9lcRHEfsoBx74DEVOB5C8UWJXzof5QdkP5hJQjJDIeZyRCPnBN3zQ5dj3f
 iUnzmGHObrW15gWzc62cpS2tBy9ibo7k8HIdNX3x4P/4Vcu2+OtPlCmO+MXOiSop743I
 Mhs53cc1OxYdW4IBYccKd7G6G0b4at+LxeNzHCYaxzzKvHA0ErC1AAP5izEIZiEtuAHo
 j6aPYmaWK5jgCqPUE7NuBtu67TyNSXOr3zJsL0k7lVFvoiNJcTJ2/aiqAworB4IxT0Wz
 NsctxMUrsnMiAr0Ug9AkbDXu3vovoR3MIZVaTU8yEVJ/IhVd8PxkfnSp/e3Hk86bGmq0
 dsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T4p8s256bVHSKXrzwM09/9eIKSFjR8qudVT0tKHiFMk=;
 b=np6DeUza3IfF38NutZk6cEC+5CWBldNLO3JNddDR9QcOs34UjJtptyNOcWy8i7ECEx
 q3MvXC9rQBb38d8WfLevdKI9xUacxc8+1i+Zz2m7PRNI8h8Jw0kc9R2Q0ReT58Rb7W3C
 RRs3HJyDyGrm4leQuv0d4GwgyengoIyTAc1PiASv3lnnL0j+1VzKaWs6Ut0Xfw7R5cQA
 EKUwcN6MrF/zFCOrKmk2GliRvCpGhv/LgqJLNkwU1ronN1VFr9qFuuBVFBPSz27nmHQa
 IUs+VAAocQ8wb0sjq4sTkWoJTJ8TQN268MAUBE0Cbf0AD2ilbtZG2cjheGGdmVjQhsCw
 y1sA==
X-Gm-Message-State: APjAAAWkl8bHrWSwMi+rgG0KQxcoeUpyumihZIecca4Xfpoj5mrX0iZo
 xYvwGJMEzeBObciDzZCQ/NUfP69V9Neh8NBzEZrmW4Zt
X-Google-Smtp-Source: APXvYqy87RTPkpshiKOttK2y4Q8nW5RKJPvD/rkeL4+5bSKbTv/3G2rSFjvB2UBBCFMlXBZtyz+ZU7tIUNmK4KLN0hs=
X-Received: by 2002:a17:906:d7ab:: with SMTP id
 pk11mr20937753ejb.216.1563203181814; 
 Mon, 15 Jul 2019 08:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20170110161339.9529-1-jgross@suse.com>
 <20170110161339.9529-2-jgross@suse.com>
In-Reply-To: <20170110161339.9529-2-jgross@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 15 Jul 2019 16:06:10 +0100
Message-ID: <CAFLBxZbLQ84UT9gQPbWbHthe6Z61Czt3aVwfzMWSfMwxhZsApw@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: start with empty data
 base
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTAsIDIwMTcgYXQgNDoxNCBQTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gVG9kYXkgeGVuc3RvcmVkIHRyaWVzIHRvIG9wZW4gYSB0ZGIgZGF0
YSBiYXNlIGZpbGUgb24gZGlzayB3aGVuIGl0IGlzCj4gc3RhcnRlZC4gQXMgdGhpcyBpcyBwcm9i
bGVtYXRpYyBpbiBtb3N0IGNhc2VzIHRoZSBzY3JpcHRzIHVzZWQgdG8gc3RhcnQKPiB4ZW5zdG9y
ZWQgZW5zdXJlIHhlbnN0b3JlZCB3b24ndCBmaW5kIHN1Y2ggYSBmaWxlIGluIG9yZGVyIHRvIHN0
YXJ0Cj4gd2l0aCBhbiBlbXB0eSB4ZW5zdG9yZS4KClNvcnJ5IHRvIHJlc3BvbmQgdG8gc3VjaCBh
biBvbGQgdGhyZWFkLCBqdXN0IHRyeWluZyB0byByZWNvcmQgdGhpcyBpbgphIHVzZWZ1bCBwbGFj
ZTogaW4gdGhlIGRpc3Ryb3MgZGVzaWduIHNlc3Npb24gYXQgdGhlIHJlY2VudCBYZW5TdW1taXQs
Cml0IHR1cm5lZCBvdXQgdGhhdDoKMS4gTW9zdCBkaXN0cm9zIGhhZCB0byBtb3VudCBhIHRtcGZz
IGZvciB0aGUgeGVuc3RvcmUgZGF0YWJhc2UgdG8KcHJldmVudCB4ZW5zdG9yZSBmcm9tIGRlc3Ry
b3lpbmcgZGlzayBwZXJmb3JtYW5jZQoyLiB4ZW5zdG9yZWQgYWxyZWFkeSBoYXMgYW4gYC1JYCBv
cHRpb24gd2hpY2ggY3JlYXRlcyBhIG1lbW9yeS1vbmx5IGRhdGFiYXNlCgpBdCB3aGljaCBwb2lu
dCBpdCB3YXMgYXNrZWQ6IFdoeSBpcyB0aGlzIG9wdGlvbiBub3QgdGhlIGRlZmF1bHQ/CgpUaGlz
IHBhdGNoIHNlZW1zIHRvIGltcGx5IHRoYXQgdGhlIG1haW4gcmVhc29uIGF0IHRoZSBtb21lbnQg
Zm9yIGFuCmV4dGVybmFsIGRiIGlzIGRlYnVnZ2luZzsgaW4gd2hpY2ggY2FzZSwgaXQgZG9lcyBz
ZWVtIGxpa2UgdGhlIGRlZmF1bHQKc2hvdWxkIGJlIGluLW1lbW9yeSwgd2l0aCBhbiBleHRlcm5h
bCBkYiBhcyBhIGRlYnVnZ2luZyBvcHRpb24uCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
