Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73913124349
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:31:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVe8-00064L-DW; Wed, 18 Dec 2019 09:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihVe6-00064G-R8
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:29:30 +0000
X-Inumbo-ID: df7f08cc-2178-11ea-a914-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df7f08cc-2178-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 09:29:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d139so4178416wmd.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 01:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=spU9lFD9ScC5OPUtgwzWZQtJ1aFMpUaY6uL02lkLmZo=;
 b=UQXeGi/OrHce+sn0vhEYusRRwEWRC7wIUE+dIWO9jjrbKpshSpFOHxmruv0SFb6waO
 2VGpK4hk3co3LPTSMcYFvtqpxIDV5wZPw6z6FZoeaLs8Ds0BRJE43sGz/8LFdxRDru9o
 0WFmTHrOI2rp3ixW6JFs89MzUJ4okfe6AavLexspgg+dAivdZX+ka9Zx8TKzEEEPmanq
 VHyEC0o/ziGcKqSG+fhyXeQneGCzSVupFBTIYSS+m92ycZ8j+o+107mLnAY05+YRzQG4
 CHS7LGOWakptBuMmqxUN5bkKu91YRUV9aDFDlWKTPRNIGOUeTMky8ln3q7OSxcI4IA/Q
 kbJg==
X-Gm-Message-State: APjAAAVG5fetl/QSFdI/Cu/wbWhvs26WGlYJYwPIXHAvYrd8n98qvHwv
 1MaAQ08Ojj11SpU3R3yk8pQ=
X-Google-Smtp-Source: APXvYqw01Ilv8UxqF/n5QvuYwjNV0LjmXKERh0Hc9I8bNJ+7gRP8ht2IFCC43b1b3bHjf/XDqoTqnA==
X-Received: by 2002:a1c:9d81:: with SMTP id g123mr2039084wme.29.1576661361446; 
 Wed, 18 Dec 2019 01:29:21 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id x11sm1967366wre.68.2019.12.18.01.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 01:29:20 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <75f6efc3-cf4c-e2f2-0c4a-5c5b1681cb25@xen.org>
Date: Wed, 18 Dec 2019 09:29:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218074859.21665-9-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 8/9] xen/sched: eliminate
 sched_tick_suspend() and sched_tick_resume()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8xMi8yMDE5IDA3OjQ4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IHNjaGVkX3RpY2tf
c3VzcGVuZCgpIGFuZCBzY2hlZF90aWNrX3Jlc3VtZSgpIG9ubHkgY2FsbCByY3UgcmVsYXRlZAo+
IGZ1bmN0aW9ucywgc28gZWxpbWluYXRlIHRoZW0gYW5kIGRvIHRoZSByY3VfaWRsZV90aW1lcioo
KSBjYWxsaW5nIGluCj4gcmN1X2lkbGVfW2VudGVyfGV4aXRdKCkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKRm9yIEFybSArIGNvbW1vbjoKCkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
