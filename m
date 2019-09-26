Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB5BBF642
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:53:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDW2I-0002gV-Od; Thu, 26 Sep 2019 15:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDW2H-0002gO-Io
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:50:29 +0000
X-Inumbo-ID: 5cefed20-e075-11e9-bf31-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by localhost (Halon) with ESMTPS
 id 5cefed20-e075-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 15:50:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y21so3157108wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 08:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PncbGc8gc8VMgfHoh00SbqhlfX1ikeD5kys4qSfhKN8=;
 b=MaCrjv4yeKDAm6hp0MCLPUoTsayUtTjv+eUfaYmU+O9JqGncnFym2+4b05ujywfBp2
 Ug6uaaB70mJGXWq/rA2CPxyGiWzSNQd2vQwPmihjip7Xkm7aB/hBZi9kakcSSGDPTaUb
 ZBDWXVXPkE/i5mS5YEzBfGhzYVmpI4HK5k/3ZeZHReBwxzOBudKWT52+TSe0hU26ty8G
 76fc1RpIdzvh4MWLWuMDLPCMFa8GFxhbO6gKds/IC0MxmWk34bQWbInfBbzNpfKHMRGM
 /HnxOxe/O3QZDbydImNRoXCrIE/vi30XFPdYqwMwRuCq+Zc9/5VFV9BEAQvmugGs0CB8
 axUA==
X-Gm-Message-State: APjAAAU+YVgnJDVdna+OXk+/WiDML2KrZSc5m0sXHtUg8dPgjOXhKRsj
 fosb3ilJrgqgsnP+cmpJhT0=
X-Google-Smtp-Source: APXvYqwTMgJQsweSJE67eZ116wAtjUK3JfyGq72Ztgm/jEwd6xV7UaS+gNjR/LrWH/BIL3KIS1Brpg==
X-Received: by 2002:a05:600c:389:: with SMTP id
 w9mr3467841wmd.139.1569513028428; 
 Thu, 26 Sep 2019 08:50:28 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id i1sm6109071wmb.19.2019.09.26.08.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 08:50:27 -0700 (PDT)
Date: Thu, 26 Sep 2019 16:50:26 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926155026.46l5qfld2jdn4kc4@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <e7211db761d076bd54777d0566d48af917874898.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7211db761d076bd54777d0566d48af917874898.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 83/84] x86/pmap: rewrite logic for
 locking.
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6NDZBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
RHVlIHRvIHRoZSBsaW1pdGVkIFBNQVAgZW50cmllcywgYW5vdGhlciBwQ1BVIGlzIGFsbG93ZWQg
dG8gdXNlIFBNQVAKPiBvbmx5IHdoZW4gdGhlIGN1cnJlbnQgcENQVSBoYXMgdW5tYXBwZWQgYWxs
IG1hcHBpbmdzLgo+IAoKVW5kZXIgd2hhdCBjb25kaXRpb24gd291bGQgdHdvIHBDUFVzIHRyeSB0
byB1c2UgUE1BUCBhdCB0aGUgc2FtZSB0aW1lPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
