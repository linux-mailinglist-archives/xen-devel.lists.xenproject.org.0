Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE06CC81
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 12:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho3DU-00014u-SS; Thu, 18 Jul 2019 10:00:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RyZM=VP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ho3DT-00014p-7R
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 10:00:47 +0000
X-Inumbo-ID: e8bd4d72-a942-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e8bd4d72-a942-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 10:00:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so26734190ljg.13
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 03:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FFgfnC6kqNasXzV8UpG733mU8hUnuk4aGDjYgveXuxc=;
 b=RiaSk9GAGx/vZ197tf/jXWn6iRN9wOrv35h8IkQRWT2mFAWG0k+hPTlhiy2oolroEC
 hcGaqhNNyeu08mglTpxPndyLAM/+rXPUcoMPgR1Ri79pH8nPbUy0G3+KZ2Y2ipAZRYdV
 GrdgDDLkzdLmvkF4in1t4K1blNLsGksVNCocejs8XPsp7xNtw1OFRnd7sFUldrPU1NXY
 A3VQc+w78HdGXPLI7SptbNe+JUgR/l0UKBhBmIWS3mfaBybO9eX+vdYy95QeYJ3IESbg
 xra65KeaVOIEpJMVfhMwvI9t7GP0Ou/TFWOKiOGRv5Gzoh0tnW2azrh2FOPwVPq0gWXj
 akRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FFgfnC6kqNasXzV8UpG733mU8hUnuk4aGDjYgveXuxc=;
 b=bc22G5ciduK/2tZrGGu5W3RRMjV9X/hsBVEq6I/pVzO4mMB3kWI/wh4Izfd9eXAGkx
 lgR1Gk2IzF/+ZX/FVt7E6r9Izg+ZJbDrXMNFq/E/kUH1Ay/FmajqxuACW2u3n09Bqwh+
 C68qDki+9qu0P+bZMPKzYxa7B+Z/WfeYXe4dd4dRH4GO7cMqzfnxe358FRYfQ13Yy3pO
 p4SuqvFQSFWsltnE9daToK8anPIfWd5gD+W0vu8JDn0DX9qyfK1RbSMheCNS/xJUneMj
 5sfPV4+DkSI5g8jV+y0BfCZFhUSALUf83i4j+Dr9XF16mgK4/0dhYyg8OV+f+K3Q0B9T
 xe9g==
X-Gm-Message-State: APjAAAVHhU11iFGyO8lHM3PcAfad8infJGk7XW/6xmirjq9rTG/k7n1i
 prWlIu4EKU1F4Nyuau5KxDM=
X-Google-Smtp-Source: APXvYqzmGLV3HPu73qDuUNevF/7k1MnioPoKXgWOGKuzxw7RQSVxjt+y5Xoe5F07e28lrFB/XrQAyQ==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr23650657ljj.113.1563444044253; 
 Thu, 18 Jul 2019 03:00:44 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n187sm3896510lfa.30.2019.07.18.03.00.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 03:00:43 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20190718065222.31310-1-jgross@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <620bb347-f776-eb3a-7a8b-e9519a613d70@gmail.com>
Date: Thu, 18 Jul 2019 13:00:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718065222.31310-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/2] xen/gntdev: sanitize user interface
 handling
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xOC8xOSA5OjUyIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IFRoZSBYZW4gZ250ZGV2
IGRyaXZlcidzIGNoZWNraW5nIG9mIHRoZSBudW1iZXIgb2YgYWxsb3dlZCBtYXBwZWQgcGFnZXMK
PiBpcyBpbiBuZWVkIG9mIHNvbWUgc2FuaXRpemluZyB3b3JrLgo+Cj4gSnVlcmdlbiBHcm9zcyAo
Mik6Cj4gICAgeGVuL2dudGRldjogcmVwbGFjZSBnbG9iYWwgbGltaXQgb2YgbWFwcGVkIHBhZ2Vz
IGJ5IGxpbWl0IHBlciBjYWxsCj4gICAgeGVuL2dudGRldjogc3dpdGNoIGZyb20ga2NhbGxvYygp
IHRvIGt2Y2FsbG9jKCkKPgo+ICAgZHJpdmVycy94ZW4vZ250ZGV2LWNvbW1vbi5oIHwgIDIgKy0K
PiAgIGRyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYyB8IDExICsrKy0tLS0tLS0KPiAgIGRyaXZl
cnMveGVuL2dudGRldi5jICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0
MCBkZWxldGlvbnMoLSkKPgpGb3IgdGhlIHNlcmllczoKUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
