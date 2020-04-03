Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABE19D184
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 09:53:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKH7y-0003nE-Sz; Fri, 03 Apr 2020 07:52:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKH7x-0003n9-Eg
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 07:52:33 +0000
X-Inumbo-ID: 127ced57-7580-11ea-bcc1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 127ced57-7580-11ea-bcc1-12813bfff9fa;
 Fri, 03 Apr 2020 07:52:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C2D0AC2C;
 Fri,  3 Apr 2020 07:52:30 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86emul: disable FPU/MMX/SIMD insn emulation when !HVM
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
 <87154c20-c60e-a215-f7f4-0290fadd90e4@suse.com>
 <dbc03c9d-bfc2-3313-1ffe-8ffe79b2c1e1@citrix.com>
 <a016ba7f-f860-9372-caab-d9400c064fd9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8799ecd8-c27e-2d01-b236-dfa0aedefa14@suse.com>
Date: Fri, 3 Apr 2020 09:52:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a016ba7f-f860-9372-caab-d9400c064fd9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 00:18, Andrew Cooper wrote:
> On 20/12/2019 16:01, Andrew Cooper wrote:
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I'll be happy to take suggestions allowing to avoid -Wno-unused-label.
>> I think I'm going to need a little while to figure out how this works.
> 
> So, after having had an evening playing with this, things get massively
> simpler when NO_MMX is folded with NO_SIMD.
> 
> MMX is a SIMD technology, and I can't see a compelling reason to control
> their inclusion separately.  We're either going to want everything or
> nothing.

I disagree - while MMX is a form of SIMD, what SIMD here means is
anything using the XMM register file and its extensions. Iirc
AMD once considered dropping MMX, and if I'm not mistaken early
Phi's didn't support MMX nor FPU. Hence I view a mode not
allowing MMX but allowing SIMD as a viable one to support.

> The attached incremental works for me without a single out-of-place
> label.  There is some further cleanup which can be done such as not
> making the CASE_ macros conditional.

Well, if we were to follow your alternative model - perhaps.
What I dislike though is something like the last hunk (an #ifdef
around a construct which can already abstract away things, and
which is specifically intended to avoid some #ifdef-ary).

>  (OTOH, the compile error from
> might be helpful to keep in some form).

There looks to be a word missing here, which puts me into trouble
understanding what you mean.

Jan

