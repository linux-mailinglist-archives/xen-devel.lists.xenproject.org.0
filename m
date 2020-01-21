Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D03143D98
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 14:03:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itt99-0003a1-Bc; Tue, 21 Jan 2020 13:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itt97-0003Zu-SZ
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 13:00:41 +0000
X-Inumbo-ID: 020b83bc-3c4e-11ea-b833-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 020b83bc-3c4e-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 13:00:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so2881275wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 05:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28/Lkv26zF4Wo6z/We5zK5UOgDR3HajWm+UHE2R5vGM=;
 b=LkwS0MybB3B9HIv1XRkY4+vKS9Zq9LGMp2GcE9smDHo6CaAIqWLDo7S0EOnMPKpcrE
 hHfNUHXaI1Xw5XoJvvXQJrP/mdc7pUPnLDvcclxWne8+Cy1mMhKPdy2YCwmyuRWRZneg
 CUujIKRQgZ2C3Si902BgKJF4AJAV6LrlfDW2b4vLV82a4BWoe+A4+dhVJ7YgWwXWxDkY
 hlP9bEH0KpzkHF4QcE8j+XodkIoRPAK9o/ekUfdOVDzdvABdX6dUQvdKnEE9m9FwTQPo
 XE9PLVxQvBht3nKtcowBfBIPiXRyz4tZ9CD8gUWVq9p+2xlLuGvDWwJvE5HIYKrGQA3M
 lsdg==
X-Gm-Message-State: APjAAAW2/9fw8PU5buLGLtjrsZUIiByinqBnrmVkVQJxgd7huZGiQ+ie
 xtk0SeYIeCCDTnmuJPfjsCY=
X-Google-Smtp-Source: APXvYqxA25nc5741541eFNL7sFgbWlIjbm/jAKDdIK8a5jjvcMfdNOtMkrVTRPl3PkcUTF9SYJtCrg==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr4323185wmb.181.1579611632481; 
 Tue, 21 Jan 2020 05:00:32 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id 25sm3609655wmi.32.2020.01.21.05.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 05:00:31 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f16e7cc7-4fca-8b24-ce12-041a19ca19ae@xen.org>
Date: Tue, 21 Jan 2020 13:00:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121084330.18309-3-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/9] xen: split parameter related
 definitions in own header file
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDIxLzAxLzIwMjAgMDg6NDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
TW92ZSB0aGUgcGFyYW1ldGVyIHJlbGF0ZWQgZGVmaW5pdGlvbnMgZnJvbSBpbml0LmggaW50byBh
IG5ldyBoZWFkZXIKPiBmaWxlIHBhcmFtLmguIFRoaXMgd2lsbCBhdm9pZCBpbmNsdWRlIGhlbGwg
d2hlbiBuZXcgZGVwZW5kZW5jaWVzIGFyZQo+IGFkZGVkIHRvIHBhcmFtZXRlciBkZWZpbml0aW9u
cy4KCkhvdyBkaWQgeW91IGZpbmQgb3V0IHRoZSBsaXN0IG9mIHBsYWNlcyB3aGVyZSB0aGUgbmV3
IGZpbGVzIG5lZWQgdG8gYmUgCmluY2x1ZGVkPwoKQWxzbywgd2FzIGl0IGJ1aWxkIHRlc3QgaXQg
b24gQXJtPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
